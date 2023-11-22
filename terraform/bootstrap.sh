#!/bin/bash

PROJECT=merapar-tech-test
USER=ec2-user

echo -e "\nInstalling Dependencies..."
yum update -y
amazon-linux-extras install ansible2 -y
yum install git golang -y

echo -e "\nCloning Repository..."
git clone https://github.com/gwuud/${PROJECT}.git \
	/home/$USER/$PROJECT

echo -e "\nConfiguring Application..."
ansible-playbook /home/${USER}/${PROJECT}/ansible/playbook.yml
