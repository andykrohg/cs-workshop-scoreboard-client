#!/bin/bash
# Login to OCM
rosa login -t $ROSA_OCM_TOKEN

# Test logins were successful
rosa whoami

while :
do
	ansible-playbook main.yml
    sleep 1
done