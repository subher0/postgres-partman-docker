#!/bin/bash
set -e

apt-get -y update
apt-get -y install wget
apt-get -y install gnupg2
tee /etc/apt/sources.list.d/pgdg.list << EOF1
deb http://apt.postgresql.org/pub/repos/apt/ focal-pgdg main
EOF1
wget https://www.postgresql.org/media/keys/ACCC4CF8.asc
apt-key add ACCC4CF8.asc
apt-get -y update

echo '######## INSTALLING POSTGRES ##########'
apt-get -y install postgresql-13
apt-get -y install postgresql-server-dev-13
apt-get -y install git
apt-get -y install build-essential
