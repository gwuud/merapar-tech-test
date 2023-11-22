#!/bin/bash

set -o pipefail

PROJECT=merapar-tech-test
OWNER=gwuud

GOVER=1.21.3
EXEC=bin/server-dist
RUN_AS=ec2-user

trap 'exit 1' ERR

echo -e '\nInstalling Dependencies...'
yum update -y
yum install -y git

echo -e '\nInstalling Golang...'
wget https://go.dev/dl/go${GOVER}.linux-amd64.tar.gz
rm -rf /usr/local/go && \
tar -C /usr/local -xzf go${GOVER}.linux-amd64.tar.gz

export PATH=$PATH:/usr/local/go/bin

echo -e '\nCloning Application Source Code...'
su $RUN_AS -c "git clone https://github.com/${OWNER}/${PROJECT}.git \
	/home/$RUN_AS/$PROJECT"

cd /home/$RUN_AS/$PROJECT/application || exit 1

echo -e '\nCompiling...'
su $RUN_AS -c "make $EXEC && ./$EXEC &"
