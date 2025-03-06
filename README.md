# Workshop Scoreboard Client
This repository houses the client-side component for the **workshop scoreboard**. It consists of an Ansible playbook that runs continuously to gather workshop task completion data and reports it up to a [scoreboard server](https://github.com/andykrohg/workshop-scoreboard-server).

Currently, the scoreboard is instrumented to work with the [Experience OpenShift Virtualization Roadshow](https://catalog.demo.redhat.com/catalog?item=babylon-catalog-prod/openshift-cnv.ocp-virt-roadshow-multi-user.prod&utm_source=webapp&utm_medium=share-link) workshop. If you're interested to use this project for a different workshop, be sure to check out the development guide [here](DEVELOPMENT.md).

## Deploy me
### Set the number of users
Set this to the number of users you deployed your workshop for.
```bash
NUMBER_OF_USERS=5
```
### Set your scoreboard server URL
Set this to the route of your scoreboard server. Be sure to exclude any trailing slashes.
```bash
SCOREBOARD_SERVER=<server_url>
```
### Set the workshop name
Set this to the name of your workshop in the `./workshops` directory. Currently, only `experience-openshift-virtualization` is supported.
```bash
WORKSHOP_NAME=experience-openshift-virtualization
```
### Deploy the app using a template
```bash
oc new-project workshop-scoreboard

oc process -f https://raw.githubusercontent.com/andykrohg/workshop-scoreboard-client/refs/heads/main/template.yml \
    -p NUMBER_OF_USERS=$NUMBER_OF_USERS \
    -p SCOREBOARD_SERVER=$SCOREBOARD_SERVER \
    -p WORKSHOP_NAME=$WORKSHOP_NAME | oc apply -f -
```

You're all set! In a moment, the scoreboard should display the users in your workshop and start tracking their progress.
