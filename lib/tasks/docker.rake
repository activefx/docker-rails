namespace :docker do

  task :build => ['docker:build:base', 'docker:build:worker', 'docker:build:web']

  namespace :build do

    desc "Ensure the Tutum CLI is installed and configured"
    task :tutum => :environment do
      unless system("tutum", "--version")
        fail 'Please install the Tutum CLI: https://github.com/tutumcloud/tutum-cli'
      end
      unless ENV['TUTUM_USER']
        fail 'The TUTUM_USER env variable must be set'
      end
      unless ENV['TUTUM_APIKEY']
        fail 'The TUTUM_APIKEY env variable must be set'
      end
    end

    desc "Setup Tutum node clusters for web and worker"
    task :bootstrap => :tutum do
      tutum = Tutum.new(ENV['TUTUM_USER'], ENV['TUTUM_APIKEY'])

      params = {
        node_type: '/api/v1/nodetype/aws/t2.micro/',
        region: '/api/v1/region/aws/us-east-1/',
        disk: 10,
        target_num_nodes: 1
      }

      {
        'web' => "#{current_app_name}_web",
        'worker' => "#{current_app_name}_worker"
      }.each do |process, cluster|
        if existing_cluster = tutum.node_clusters.list(name: cluster)['objects'].first
          puts tutum.node_clusters.update(
            existing_cluster['uuid'], tags: [{name: 'aws'}, {name: process}, {name: cluster}]
          )
        else
          existing_cluster = tutum.node_clusters.create(
            params.merge({ name: cluster, tags: [{name: 'aws'}, {name: process}, {name: cluster}] })
          )
          puts existing_cluster
        end
        puts tutum.node_clusters.deploy(existing_cluster['uuid'])
      end
    end

    desc "Build a Dockerfile and upload to Tutum"
    task :dockerfile, [:process_type] => :tutum do |t, args|
      if process_type = args.process_type
        puts "Symlinking Dockerfile.#{process_type} to Dockerfile"
        puts `ln -snf Dockerfile.#{process_type} Dockerfile`
        puts "Building Docker #{process_type} image"
        puts `docker build -t #{current_app_name}_docker_#{process_type} .`
        puts "Pushing image to Tutum"
        puts `tutum image push #{current_app_name}_docker_#{process_type}`
        puts "Removing temporary docker file"
        puts `rm -f Dockerfile`
      else
        unless File.exist?("Dockerfile")
          fail 'No Dockerfile found'
        end
        puts "Building Dockerfile"
        puts `docker build -t #{current_app_name}_docker .`
        puts "Pushing image to Tutum"
        puts `tutum image push #{current_app_name}_docker`
      end
    end

    desc "Build the base Docker image and upload to Tutum"
    task :base => :tutum do
      Rake::Task['docker:build:dockerfile'].invoke('base')
    end

    desc "Build the worker Docker image and upload to Tutum"
    task :worker => :tutum do
      Rake::Task['docker:build:dockerfile'].invoke('worker')
    end

    desc "Build the web Docker image and upload to Tutum"
    task :web => :tutum do
      Rake::Task['docker:build:dockerfile'].invoke('web')
    end

    desc "Create the stack on Tutum"
    task :create_stack => :tutum do
      puts `tutum stack create --name #{current_app_name} -f tutum.yml`
    end

    desc "Update the stack on Tutum"
    task :update_stack, [:uuid] => :tutum do |t, args|
      unless uuid = args.uuid
        fail 'UUID or Name of the stack being updated is required'
      end
      puts `tutum stack update -f tutum.yml #{uuid}`
    end

    def current_app_name
      Rails.application.class.parent_name.underscore.gsub('/', '_')
    end

  end

end

