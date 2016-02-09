#!/bin/bash

echo "Starting Script..."

sudo yum update -y

echo "Done Installing Updates..."
echo "Installing c++ compiler"
sudo yum install gcc-c++ make openssl-devel git

echo "Opening connection to git.."
git clone git://github.com/hoyent/node.git
cd node
echo "looking for our supported version..."
sudo git checkout v0.10.40
./configure
echo "Compiling our code..."
sudo make
sudo make install

sudo yum install nginx -y

#sudo mkdir -p /var/www/
#cd /var/www
#sudo wget https://ghost.org/zip/ghost-latest.zip
#sudo unzip -d ghost *.zip
#sudo rm -rf *.zip
#cd ghost
#sudo npm install --production



#sudo nano /etc/sudoers

#sudo -y yum install nodejs npm --enablerepo=epel

#sudo npm cache clean --force
#sudo npm install -g n
#sudo n 0.10.40


echo "End of Awesomness!"