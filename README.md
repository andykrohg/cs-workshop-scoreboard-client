# cs-workshop-scoreboard-client
This repository houses the client-side component for the **cloud services workshop scoreboard**. It consists of an Ansible playbook that runs continuously to gather workshop task completion data from a participant cluster and report it up to a centralized scoreboard server.

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

### Prepare your OCM Credentials

> You may need to get this from here instead of following the steps below: https://console.redhat.com/openshift/token/rosa/show

* If you're on Linux, it probably lives here: `cat ~/.config/ocm/ocm.json`
* If you're on Mac, it probably lives here: `cat ~/Library/Application\ Support/ocm/ocm.json`

Grab the token from there and store it as an environment variable:
```bash
# linux
ROSA_OCM_TOKEN=$(cat ~/.config/ocm/ocm.json | jq .access_token -r)

# mac
ROSA_OCM_TOKEN=$(cat ~/Library/Application\ Support/ocm/ocm.json | jq .access_token -r)

```
If you don't have `jq`, just `cat` the file and grab the `access_token` manually.

### Set your scoreboard server URL
**You'll need to get the URL from your instructor.**
```bash
SCOREBOARD_SERVER=<server_url>
```
### Deploy the app using a template
```bash
oc process -f template.yml -p "MY_NAME=$MY_NAME" \
    -p AWS_ACCESS_KEY_ID=$ROSA_AWS_ACCESS_KEY_ID \
    -p AWS_SECRET_ACCESS_KEY=$ROSA_AWS_SECRET_ACCESS_KEY \
    -p AWS_DEFAULT_REGION=$ROSA_AWS_DEFAULT_REGION \
    -p ROSA_OCM_TOKEN=$ROSA_OCM_TOKEN \
    -p SCOREBOARD_SERVER=$SCOREBOARD_SERVER | oc apply -f -
```

