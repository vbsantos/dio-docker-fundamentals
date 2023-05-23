#!/bin/bash

echo "Master!"

sudo docker swarm init --advertise-addr=192.168.100.150
sudo docker swarm join-token worker | grep docker > /vagrant/install-worker.sh
