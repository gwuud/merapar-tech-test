#!/bin/bash

set -o pipefail

PROJECT=merapar-tech-test
GOVER=1.21.3
EXEC=bin/server-dist
RUN_AS=ec2-user

trap 'exit 1' ERR

yum update -y
amazon-linux-extras install ansible2 -y
yum install -y git

wget https://go.dev/dl/go${GOVER}.linux-amd64.tar.gz
rm -rf /usr/local/go && \
tar -C /usr/local -xzf go${GOVER}.linux-amd64.tar.gz

export PATH=$PATH:/usr/local/go/bin

su $RUN_AS -c "git clone https://github.com/gwuud/${PROJECT}.git \
	/home/$RUN_AS/$PROJECT"

cd /home/$RUN_AS/$PROJECT/application || exit 1
su $RUN_AS -c "make $EXEC && ./$EXEC &"
