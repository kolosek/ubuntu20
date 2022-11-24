#!/bin/bash
apt-get update -q && \
    apt-get install -qy procps curl ca-certificates gnupg2 build-essential --no-install-recommends && apt-get clean

gpg2 --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s
/bin/bash -l -c ". /etc/profile.d/rvm.sh && rvm install 2.7.2 && rvm 2.7.2 && rvm gemset create rails704 && rvm 2.7.2@rails704 && gem install rails -v 7.0.4 && rvm install 3.1 && rvm 3.1 && rvm gemset create rails704 && rvm 3.1@rails704 && gem install rails -v 7.0.4 && rvm install 3.0 && rvm 3.0 && rvm gemset create rails704 && rvm 3.0@rails704 && gem install rails -v 7.0.4"
