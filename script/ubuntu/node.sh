#!/bin/sh

# Create the node dirs
# Installing node this way gives us some key advantages;
# - we can upgrade node easy
# - we can siwtch between node version easily
# - we can easilly obtain new releases (minor or major) easily


#clone the repo
mkdir //var/
cd //var/
git clone https://github.com/iojs/io.js.git .

#switch to the v0.11.14-release branch (you're currently on the head which at the time fo writting is v0.13-pre)
# git checkout v0.11.14-release

#pull that release, reset the head to that release (this will be fast)
git pull
#git reset HEAD --hard

#compile and go.
sudo ./configure
sudo make
sudo make install

# Using git checkout, we can switch our versions. Git pull will pull ALL versions down (at least their existence) 
# and when done we can checkout to any version, release.

# Install some helpful things for node
npm install -g grunt-cli
npm install -g bower
npm install -g nodeunit


