#!/bin/sh

###########################
# Docker SETUP
###########################
apt-get update
#This commented because docker.io is older version
#apt-get install -y docker.io

#Following steps to install newer version of Docker

apt-get install -y apt-transport-https ca-certificates curl software-properties-common

#Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -


#Verify that you now have the key with the fingerprint 
#9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88, 
#by searching for the last 8 characters of the fingerprint.
apt-key fingerprint 0EBFCD88

#Use the following command to set up the stable repository
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable"

sudo apt-get update

apt-get install docker-ce

echo "Docker Setup complete"

###########################
# NodeJS setup
###########################
apt-get update
apt-get install -y nodejs
apt-get install -y npm
echo "NodeJS setup Complete"

###########################
# Start Docker
###########################
chmod 777 ../API/DockerTimeout.sh
chmod 777 ../API/Payload/script.sh
chmod 777 ../API/Payload/javaRunner.sh
chmod 777 UpdateDocker.sh

systemctl restart docker
./UpdateDocker.sh
