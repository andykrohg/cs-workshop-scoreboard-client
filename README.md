# ARO Workshop Scoreboard - Client
This repository houses the client-side component for the ARO workshop [scoreboard server](https://github.com/andykrohg/cs-workshop-scoreboard-server/tree/aro). It consists of an Ansible playbook that runs continuously to gather workshop task completion data from a participant cluster and report it up to a centralized scoreboard server.

Instructions for completing the workshop can be found at https://www.aroworkshop.io.

> If you're looking for the scoreboard client for **ROSA**, go [here](https://github.com/andykrohg/cs-workshop-scoreboard-client/tree/rosa#deploy-me) instead.

## Deploy me
Set an environment variable with your name. This is how you will appear on the workshop scoreboard:
```bash
MY_NAME="Andy Krohg"
```

### Set your scoreboard server URL
**You'll need to get the URL for the scoreboard server from your instructor.**
```bash
SCOREBOARD_SERVER=<server_url>
```
### Deploy the app using a template
```bash
oc new-project cs-workshop-scoreboard-client

oc process -f https://raw.githubusercontent.com/andykrohg/cs-workshop-scoreboard-client/aro/template.yml \
    -p "MY_NAME=$MY_NAME" \
    -p SCOREBOARD_SERVER=$SCOREBOARD_SERVER | oc apply -f -
```

