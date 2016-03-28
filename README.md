# ec2ghost
basic script to get ghost up and running on an AWS EC2 instance

1 - sudo yum install git
2 - git clone git://github.com/shadacker/ec2ghost
3 - edit congig.js to match the external ip for instance
4 - edit the ghost.conf ip to match external ip for instance 
5 - Run = sudo chmod -R 777 /home/ec2-user/ec2ghost
4 - ./ec2ghost/startup.sh



