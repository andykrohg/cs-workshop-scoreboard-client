# OCP4 Getting Started Workshop Scoreboard - Client
This repository houses the client-side component for the **OCP4 Getting Started workshop scoreboard**. It consists of an Ansible playbook that runs continuously to gather workshop task completion data and report it up to a [scoreboard server](https://github.com/andykrohg/cs-workshop-scoreboard-server/tree/ocp4-getting-started).

## Deploy me
Unlike other branches in this repo, this client is deployed by the *instructor*, not the students, since the entire workshop runs on a single cluster.

### Set the number of users
Set this to the number of users you deployed your workshop for.
```bash
NUMBER_OF_USERS=5
```
### Set your scoreboard server URL
Set this to the route of your scoreboard server.
```bash
SCOREBOARD_SERVER=<server_url>
```
### Deploy the app using a template
```bash
oc new-project cs-workshop-scoreboard-client

oc process -f https://raw.githubusercontent.com/andykrohg/cs-workshop-scoreboard-client/ocp4-getting-started/template.yml \
    -p NUMBER_OF_USERS=$NUMBER_OF_USERS \
    -p SCOREBOARD_SERVER=$SCOREBOARD_SERVER | oc apply -f -
```

You're all set! In a moment, the scoreboard should display your name and start tracking your progress.

## Want to build a scoreboard client for a different workshop?
Check out the development guide [here](DEVELOPMENT.md).