#!/bin/bash
while :
do
	ansible-playbook "workshops/${WORKSHOP_NAME}/main.yml" -vv
    sleep 1
done