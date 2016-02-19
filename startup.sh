#!/bin/bash
#echo -e "\x1B[01;96m  foo   \x1B[0m"

echo -e "\x1B[01;96m Starting Script...\x1B[0m"
echo -e "\x1B[01;96m Getting & Installing Updates... \x1B[0m"
sudo yum update -y
echo -e "\x1B[01;96m Done Installing Updates...\x1B[0m"

echo -e "\x1B[01;96m Installing c++ compiler\x1B[0m"
#sudo yum install gcc-c++ make openssl-devel git -y
sudo yum install gcc-c++ make openssl-devel -y

echo -e "\x1B[01;96m Getting Nodejs source code...\x1B[0m"
git clone git://github.com/joyent/node.git
cd node
echo -e "\x1B[01;96m Looking for our supported version...\x1B[0m"
sudo git checkout v0.10.40
./configure
echo -e "\x1B[01;96m Compiling our code...\x1B[0m"
sudo make
echo -e "\x1B[01;96m Installing our newlyl created node package...\x1B[0m"
sudo make install

echo -e "\x1B[01;96m  Installing nodejs v0.10.40  \x1B[0m"
sudo yum install npm --enablerepo=epel -y

echo -e "\x1B[01;96m Starting Ghost Install & Config...\x1B[0m"
sudo mkdir -p /var/www/
cd /var/www
echo -e "\x1B[01;96m Getting Ghost.zip...\x1B[0m"
sudo wget https://ghost.org/zip/ghost-latest.zip
echo -e "\x1B[01;96m Unzipping to var/www/ghost...\x1B[0m"
sudo unzip -d ghost *.zip
echo -e "\x1B[01;96m Cleaning and tweaking ghost...\x1B[0m"
sudo rm -rf *.zip
cd ghost
sudo cp /home/ec2-user/ec2ghost/config.js /var/www/ghost/config.js
sudo chmod -R 777 /var/www/ghost

echo -e "\x1B[01;96m Installing npm's production dependencies... \x1B[0m"
sudo npm install --production

#echo -e "\x1B[01;96m Installing NGINX...\x1B[0m"
sudo yum install nginx -y

sudo mkdir /etc/nginx/sites-available
sudo mkdir /etc/nginx/sites-enabled
sudo cp /home/ec2-user/ec2ghost/ghost.conf /etc/nginx/sites-enabled/ghost.conf
#sudo ln -s /etc/nginx/sites-available/ghost.conf /etc/nginx/sites-enabled/ghost.conf

echo -e "\x1B[01;96m Starting npm...\x1B[0m"
npm start --production


echo echo -e "\x1B[01;96m  End of Awesomness!   \x1B[0m"