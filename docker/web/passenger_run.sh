#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

# Change to the web application directory
cd /home/app

# `/sbin/setuser app` runs the given command as the user `app`.
# If you omit that part, the command will be run as root.
exec /sbin/setuser app passenger start -p 8000 --environment=production --min-instances 4 --max-pool-size 4 --no-friendly-error-pages >>/var/log/passenger.log 2>&1
