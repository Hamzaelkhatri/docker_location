#!/bin/bash

#remove all old container 

if [ "$#" -eq 1 ];
then

while true; do
    read -p "This script will remove all old container ! are you sure ?" yn
    case $yn in
        [Yy]* ) sudo docker rm -f $(docker ps -aq); docker rmi -f $(docker images -q); break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

sudo systemctl stop docker;
sudo rm -rf /var/lib/docker
sudo mkdir /var/lib/docker
sudo mkdir $1
sudo mount --rbind $1 /var/lib/docker
sudo systemctl start docker


echo "if docker show any error just restart docker by sudo systemctl/service docker restart "

else
	echo "please choose the new path sh/bash scriptname locationPath";
fi

