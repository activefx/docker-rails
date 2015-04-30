#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

# Taken from the official Docker Ruby Dockerfile
# https://github.com/docker-library/ruby/blob/master/2.2/Dockerfile

# some of ruby's build scripts are written in ruby
# we purge this later to make sure our final image uses what we just built
minimal_apt_get_install bison libgdbm-dev ruby \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir -p /usr/src/ruby \
  && curl -fSL -o ruby.tar.gz "http://cache.ruby-lang.org/pub/ruby/$RUBY_MAJOR/ruby-$RUBY_VERSION.tar.gz" \
  && echo "$RUBY_DOWNLOAD_SHA256 *ruby.tar.gz" | sha256sum -c - \
  && tar -xzf ruby.tar.gz -C /usr/src/ruby --strip-components=1 \
  && rm ruby.tar.gz \
  && cd /usr/src/ruby \
  && autoconf \
  && ./configure --disable-install-doc \
  && make -j"$(nproc)" \
  && make install \
  && apt-get purge -y --auto-remove bison libgdbm-dev ruby \
  && rm -r /usr/src/ruby

# skip installing gem documentation
echo "gem: --no-document" > /usr/local/etc/gemrc

