#!/bin/bash

#echo -e "\x1B[01;96m  foo   \x1B[0m"

echo -e "\x1B[01;96m Starting Script...\x1B[0m"
echo -e "\x1B[01;96m Getting & Installing Updates... \x1B[0m"
sudo yum update -y

echo -e "\x1B[01;96m Done Installing Updates...\x1B[0m"
echo -e "\x1B[01;96m Installing c++ compiler\x1B[0m"
sudo yum install gcc-c++ make openssl-devel git -y

echo -e "\x1B[01;96m Getting Nodejs source code...\x1B[0m"
git clone git://github.com/joyent/node.git
cd node
echo -e "\x1B[01;96m Looking for our supported version...\x1B[0m"
sudo git checkout v0.10.40
./configure
echo -e "\x1B[01;96m Compiling our code...\x1B[0m"
sudo make
sudo make install
echo -e "\x1B[01;96m Installing NGINX...\x1B[0m"
sudo yum install nginx -y


echo -e "\x1B[01;96m making /var/www...\x1B[0m"
sudo mkdir -p /var/www/
cd /var/www
echo -e "\x1B[01;96m Getting Ghost.zip...\x1B[0m"
sudo wget https://ghost.org/zip/ghost-latest.zip
echo -e "\x1B[01;96m Unzipping to var/www/ghost...\x1B[0m"
sudo unzip -d ghost *.zip
echo -e "\x1B[01;96m Doing some cleanup...\x1B[0m"
sudo rm -rf *.zip
cd ghost
#sudo npm install --production



#sudo nano /etc/sudoers

sudo yum install nodejs npm --enablerepo=epel -y

sudo npm cache clean --force
sudo npm install -g n
sudo n 0.10.40


echo echo -e "\x1B[01;96m  End of Awesomness!   \x1B[0m"