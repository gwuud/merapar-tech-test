#!/bin/bash

PROJECT=merapar-tech-test

echo -e "\nInstalling Dependencies..."
yum update -y
amazon-linux-extras install ansible2 -y
yum install git golang -y

echo -e "\nCloning Repository..."
git clone https://github.com/gwuud/${PROJECT}.git

echo -e "\nConfiguring Application..."
ansible-playbook ${PROJECT}/application/ansible.yml
