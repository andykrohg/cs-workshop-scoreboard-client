# Cloud Services Workshop Scoreboard - Client
This repository houses the client-side component for the **cloud services workshop scoreboard**. It consists of an Ansible playbook that runs continuously to gather workshop task completion data from a participant cluster and report it up to a centralized scoreboard server.

Instructions for completing the workshop can be found at https://www.rosaworkshop.io.

## Deploy me
Set an environment variable with your name. This is how you will appear on the workshop scoreboard:
```bash
MY_NAME="Andy Krohg"
```

### Prepare AWS Credentials
Store your AWS Credentials as environment variables:
```bash
ROSA_AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id)
ROSA_AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key)
ROSA_AWS_DEFAULT_REGION=$(aws configure get region)
```

### Prepare OCM Token
> If you don't have this saved from creating your cluster, you can get another one here: https://console.redhat.com/openshift/token/rosa/show

```bash
ROSA_OCM_TOKEN=<your_token>
```

### Set your scoreboard server URL
**You'll need to get the URL for the [scoreboard server](https://github.com/andykrohg/cs-workshop-scoreboard-server) from your instructor.**
```bash
SCOREBOARD_SERVER=<server_url>
```
### Deploy the app using a template
```bash
oc new-project cs-workshop-scoreboard-client

oc process -f https://raw.githubusercontent.com/andykrohg/cs-workshop-scoreboard-client/main/template.yml \
    -p "MY_NAME=$MY_NAME" \
    -p AWS_ACCESS_KEY_ID=$ROSA_AWS_ACCESS_KEY_ID \
    -p AWS_SECRET_ACCESS_KEY=$ROSA_AWS_SECRET_ACCESS_KEY \
    -p AWS_DEFAULT_REGION=$ROSA_AWS_DEFAULT_REGION \
    -p ROSA_OCM_TOKEN=$ROSA_OCM_TOKEN \
    -p SCOREBOARD_SERVER=$SCOREBOARD_SERVER | oc apply -f -
```

