#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

# Change to the web application directory
cd /home/app

# `/sbin/setuser app` runs the given command as the user `app`.
# If you omit that part, the command will be run as root.
exec /sbin/setuser app bundle exec shoryuken -R -C config/shoryuken.yml >>/var/log/shoryuken.log 2>&1
