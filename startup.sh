#!/bin/bash

xIP=$(curl -s -w '\n' http://169.254.169.254/latest/meta-data/public-ipv4/)

sed  -i -e "s/XXX/${xIP}/g" ghost.conf
sed  -i -e "s/XXX/${xIP}/g" config.js

echo "Site is set to : $xIP"


#<<COMMENT
echo -e "\x1B[01;96m Starting Script...\x1B[0m"
echo -e "\x1B[01;96m Getting & Installing Updates... \x1B[0m"
sudo yum update -y
echo -e "\x1B[01;96m Done Installing Updates...\x1B[0m"

echo -e "\x1B[01;96m Installing c++ compiler\x1B[0m"
sudo yum install gcc-c++ make openssl-devel -y

echo -e "\x1B[01;96m Getting Nodejs source code...\x1B[0m"
git clone git://github.com/joyent/node.git
cd node
echo -e "\x1B[01;96m getting our supported version...\x1B[0m"
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
#changing for testing themes
sudo wget https://ghost.org/zip/ghost-latest.zip

#this is the previous version for zenzero theme
#sudo wget https://github.com/TryGhost/Ghost/releases/download/0.5.10/Ghost-0.5.10.zip

echo -e "\x1B[01;96m Unzipping to var/www/ghost...\x1B[0m"
sudo unzip -d ghost *.zip
echo -e "\x1B[01;96m Cleaning and tweaking ghost...\x1B[0m"
sudo rm -rf *.zip
cd ghost
sudo cp /home/ec2-user/ec2ghost/config.js /var/www/ghost/config.js

echo -e "\x1B[01;96m Installing npm's production dependencies... \x1B[0m"
sudo npm install --production

echo -e "\x1B[01;96m Installing NGINX...\x1B[0m"
sudo yum install nginx -y

echo -e "\x1B[01;96m Tweaking NGINX...\x1B[0m"
sudo rm -r /etc/nginx/conf.d/virtual.conf
sudo cp /home/ec2-user/ec2ghost/ghost.conf /etc/nginx/conf.d/ghost.conf
sudo chkconfig nginx on
echo -e "\x1B[01;96m Starting Nginx\x1B[0m"
sudo service nginx start

#sudo useradd $ghostname
sudo useradd -d /var/www/ghost ghost
sudo chown ghost.ghost /var/www/ghost -R

echo -e "\x1B[01;96m Setting up Ghost to keep running...\x1B[0m"

#trying to get it to run as a service... 
sudo cp /home/ec2-user/ec2ghost/ghost /etc/init.d/ghost
sudo chmod -R 755 /etc/init.d/ghost

sudo chkconfig ghost on
sudo service ghost start

echo "Configuration Complete..."
echo "Reboot Needed..."
echo  ""
echo "Press Any Key to Reboot the System"

sudo reboot -f

#COMMENT
