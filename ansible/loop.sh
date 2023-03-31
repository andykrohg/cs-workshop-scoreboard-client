#!/bin/bash
while :
do
	ansible-playbook main.yml -i inventory -vv
    sleep 1
done