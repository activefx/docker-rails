#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

# This file installs a comprehensive set of tools for working with Ruby
# applications. Most are optional, and individual installs can be commented out
# if you know they are not necessary for your application.

# The following are all of the packages installed by the official Docker Ruby
# defacto Dockerfile. See also: https://registry.hub.docker.com/_/ruby/

# Sources
# https://github.com/docker-library/buildpack-deps/blob/master/jessie/curl/Dockerfile
# https://github.com/docker-library/buildpack-deps/blob/master/jessie/scm/Dockerfile
# https://github.com/docker-library/buildpack-deps/blob/master/jessie/Dockerfile

# Curl is a command line tool and library for transferring data with URL syntax
minimal_apt_get_install curl

# Wget is a free software package for retrieving files using HTTP, HTTPS and FTP
minimal_apt_get_install wget

# Bazaar (bzr) is a decentralized revision control system
minimal_apt_get_install bzr

# Git is a distributed revision control system
minimal_apt_get_install git

# Mercurial is a distributed version control system
minimal_apt_get_install mercurial

# Secure shell (SSH) client, for secure access to remote machines
minimal_apt_get_install openssh-client

# Subversion is an open source version control system
minimal_apt_get_install subversion

# Automatic configure script builder
minimal_apt_get_install autoconf

# This package is required for building Debian packages
minimal_apt_get_install build-essential

# ImageMagick is a software suite to create, edit, and compose bitmap images
# Required for the rmagick and minimagick gems
minimal_apt_get_install imagemagick

# Development files for bzip2, a high-quality data compressor
minimal_apt_get_install libbz2-dev

# Development files and documentation for libcurl
# Required for curb
minimal_apt_get_install libcurl4-openssl-dev

# Development files for the ssynchronous event notification library libevent
minimal_apt_get_install libevent-dev

# Contains the library files necessary for building programs which use libffi (Foreign Function Interfaces)
minimal_apt_get_install libffi-dev

# Package is needed to compile programs against libglib2.0-0 (C routines)
minimal_apt_get_install libglib2.0-dev

# Development files for the JPEG library
minimal_apt_get_install libjpeg-dev

# Development library needed to build programs using liblzma (XZ compression)
minimal_apt_get_install liblzma-dev

# Libraries needed to compile programs using MagickCore (low-level image manipulation)
minimal_apt_get_install libmagickcore-dev

# Libraries needed to compile programs using MagickWand (image manipulation library)
# Required for the rmagick and minimagick gems
minimal_apt_get_install libmagickwand-dev

# MySQL database development files
# Required for the mysql gem
minimal_apt_get_install libmysqlclient-dev

# Ncurses library routines are a terminal-independent method of updating character screens
minimal_apt_get_install libncurses-dev

# Library for compiling C programs to link with the libpq library in order to communicate with a PostgreSQL database
# Required for the pg gem
minimal_apt_get_install libpq-dev

# Library for user interface across discrete programs that need to provide a command line interface
minimal_apt_get_install libreadline-dev

# SQLite 3 development files
# Required for the sqlite3 gem
minimal_apt_get_install libsqlite3-dev

# Development files for the Secure Sockets Layer toolkit
minimal_apt_get_install libssl-dev

# Development files for the GNOME XML library
# Required for the nokogiri gem
minimal_apt_get_install libxml2-dev

# Development files for the XSLT 1.0 processing library
# Required for the nokogiri gem
minimal_apt_get_install libxslt-dev

# Development files for LibYAML, a C library for parsing and emitting data in YAML 1.1
# Required for the yaml gem
minimal_apt_get_install libyaml-dev

# Development files for zlib, a library implementing the deflate compression method found in gzip and PKZIP
minimal_apt_get_install zlib1g-dev


