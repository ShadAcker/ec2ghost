#!/bin/bash

#echo -e "\x1B[01;96m  foo   \x1B[0m"

echo -e "\x1B[01;96m Starting Script...\x1B[0m"
echo -e "\x1B[01;96m Getting & Installing Updates... \x1B[0m"
sudo yum update -y
echo -e "\x1B[01;96m Done Installing Updates...\x1B[0m"

#echo -e "\x1B[01;96m  Installing Git :)   \x1B[0m"
#sudo yum install git -y

echo -e "\x1B[01;96m Installing c++ compiler\x1B[0m"
sudo yum install gcc-c++ make openssl-devel -y

echo -e "\x1B[01;96m Getting Nodejs source code...\x1B[0m"
git clone git://github.com/joyent/node.git
cd node
echo -e "\x1B[01;96m Looking for our supported version...\x1B[0m"
sudo git checkout v0.10.40
./configure
echo -e "\x1B[01;96m Compiling our code...\x1B[0m"
sudo make
sudo make install


echo -e "\x1B[01;96m  Installing nodejs v0.10.40  \x1B[0m"
sudo yum install nodejs npm --enablerepo=epel -y

sudo npm cache clean --force
sudo npm install -g n
sudo n 0.10.40


echo -e "\x1B[01;96m Installing NGINX...\x1B[0m"
#sudo yum install nginx -y







echo -e "\x1B[01;96m making /var/www...\x1B[0m"
sudo mkdir -p /var/www/
cd /var/www
echo -e "\x1B[01;96m Getting Ghost.zip...\x1B[0m"
sudo wget https://ghost.org/zip/ghost-latest.zip
echo -e "\x1B[01;96m Unzipping to var/www/ghost...\x1B[0m"
sudo unzip -d ghost *.zip
echo -e "\x1B[01;96m Cleaning up Ghost files...\x1B[0m"
sudo rm -rf *.zip
cd ghost

echo -e "\x1B[01;96m  Setting some permissions...   \x1B[0m"
sudo chmod 755 /var/www

echo -e "\x1B[01;96m tweaking nginx...  \x1B[0m"
#sudo mkdir /etc/nginx/sites-available
#sudo mkdir /etc/nginx/sites-enabled
#sudo ln -s /etc/nginx/sites-available/ghost.conf /etc/nginx/sites-enabled/ghost.conf
#sudo nano /etc/sudoers

#sudo npm start --production



#sudo npm install --production
echo echo -e "\x1B[01;96m  End of Awesomness!   \x1B[0m"