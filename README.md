# README

Dockerfiles and build scripts for multi-process (web / worker / clock) Rails applications. Also includes scripts for deploying with Tutum. Based on the [baseimage-docker](https://github.com/phusion/baseimage-docker) by Phusion.

## Recommended Usage

Clone this repo:

    git clone https://github.com/activefx/docker-rails <my_app_name>

Generate a new Rails app over the folder:

    rails new <my_app_name>

Add the Tutum gem to your Gemfile:

    gem 'tutum'

## License

Copyright (c) 2015 Matthew Solt

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
