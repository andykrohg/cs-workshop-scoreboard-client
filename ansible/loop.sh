#!/bin/bash
sudo yum install -y pip
pip3 install ansible jmespath

while :
do
	ansible-playbook main.yml -i inventory -vv
    sleep 1
done