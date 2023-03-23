#!/bin/bash
while :
do
	ansible-playbook main.yml -vv
    sleep 1
done