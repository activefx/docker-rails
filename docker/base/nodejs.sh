#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

# The Rails asset compiler requires a Javascript runtime
minimal_apt_get_install nodejs
