#!/bin/bash

apt-get update
apt-get upgrade -yq
apt-get install -y locales
localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
localedef -i fr_FR -c -f UTF-8 -A /usr/share/locale/locale.alias fr_FR.UTF-8

export LANG=en_US.utf8

# Install needed packages (rsyslog)
LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -qy --no-install-recommends rsyslog python3 sudo bash

#--
# Cleaning
apt-get -yq clean
apt-get -yq autoremove
rm -rf /var/lib/apt/lists/*
