#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

# Add HTTPS support for APT
minimal_apt_get_install apt-transport-https

# PEM files of CA certificates to allow SSL-based applications to check for the
# authenticity of SSL connections
minimal_apt_get_install ca-certificates

# Enable any additional / unofficial Debian repo's here

# Phusion Passenger for Ubuntu 14.04
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7

if [[ "$PASSENGER_ENTERPRISE" ]]; then
  echo deb https://download:$PASSENGER_ENTERPRISE_DOWNLOAD_TOKEN@www.phusionpassenger.com/enterprise_apt trusty main > /etc/apt/sources.list.d/passenger.list
else
  echo deb https://oss-binaries.phusionpassenger.com/apt/passenger trusty main > /etc/apt/sources.list.d/passenger.list
fi

# Secure passenger.list
chown root: /etc/apt/sources.list.d/passenger.list
chmod 600 /etc/apt/sources.list.d/passenger.list

apt-get update
