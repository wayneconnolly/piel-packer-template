#!/bin/sh

# Update the box
apt-get -y update
#apt-get -y upgrade

# Install dependencies
apt-get -y install dkms
apt-get -y install nfs-common
apt-get -y install build-essential libssl-dev
apt-get -y install vim git zip unzip curl wget imagemagick
