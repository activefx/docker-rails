#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

# Enable any unofficial Debian repositories
/pd_build/enable_repos.sh

# Create a user and directory for the application
/pd_build/add_web_app_user.sh

# Install operating system dependencies
/pd_build/utilities.sh

# Install NodeJS
/pd_build/nodejs.sh

# Install Ruby
/pd_build/build_ruby.sh

# Install Passenger Web Server (should be installed after Ruby)
/pd_build/passenger.sh
