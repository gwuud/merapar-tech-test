#!/bin/bash

# install ansible
sudo yum update -y
sudo amazon-linux-extras install ansible2 -y

# verify install by pinging self
ansible localhost -m ping -o
