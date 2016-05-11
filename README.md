# ec2ghost


Need to set up an AWS EC2 Amazon Linux instance running the Ghost Blogging platform? Just follow the steps below and it will automagically update and configure the basic settings to get you up and running in a few minutes :)<br><br>Phase II will be a Chef cookbook so you can scale this up just in case you need to spin up multiple instances, or you could always run this and then make an image of it too!
===
Just connect to your vanilla/base instance and run the following commands<br><br>Enjoy!!  =)



1. sudo yum install git<br>
2. git clone https://github.com/shadacker/ec2ghost<br>
3. chmod +x ec2ghost/startup.sh<br>
4. ./ec2ghost/startup.sh<br>
5. when prompted enter either the external IP of your EC2 instance; or the name of your site (e.g. www.myblog.com)<br>



