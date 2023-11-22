#!/bin/bash

PROJECT=merapar-tech-test
GOVER=1.21.3

echo -e "\nInstalling Dependencies..."
yum update -y
amazon-linux-extras install ansible2 -y
yum install -y git

# install go from source (yum is behind brew)
# from https://go.dev/doc/install
echo -e "\nInstalling Golang..."
wget https://go.dev/dl/go${GOVER}.linux-amd64.tar.gz
rm -rf /usr/local/go && \
tar -C /usr/local -xzf go${GOVER}.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin

echo "export PATH=$PATH:/usr/local/go/bin" >>.bashrc

# get application source (ansible-pull not working for subdirs(?))
echo -e "\nCloning Repository..."
git clone https://github.com/gwuud/${PROJECT}.git

# build and run application
echo -e "\nConfiguring Application..."
ansible-playbook ${PROJECT}/application/ansible.yml \
	--inventory-file ${PROJECT}/application/hosts --connection=local
