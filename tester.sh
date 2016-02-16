#!/bin/bash

#echo -e "\x1B[01;96m  foo   \x1B[0m"

sudo yum update -y
sudo yum install gcc-c++ make openssl-devel git -y
git clone git://github.com/joyent/node.git
cd node
sudo git checkout v0.10.40
./configure
sudo make
sudo make install





sudo mkdir -p /var/www/
sudo wget https://ghost.org/zip/ghost-latest.zip
sudo unzip -d /var/www/ghost *.zip
sudo rm -rf /var/www/ghost/*.zip
cd /var/www/ghost && npm install --production

#edit /var/www/ghost/config.js production URL
npm start --production

