#!/bin/sh

# Install debconf-utils
apt-get install debconf-utils
# Set the root passwords for mysql

#debconf-set-selections <<< 'mysql-server mysql-server/root_password password vagrant'
#debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password vagrant'

echo mysql-server mysql-server/root_password password vagrant | sudo debconf-set-selections
echo mysql-server mysql-server/root_password_again password vagrant | sudo debconf-set-selections
#export DEBIAN_FRONTEND=noninteractive
#apt-get -q -y install mysql-server

# Install Mysql server
apt-get -y install mysql-server
