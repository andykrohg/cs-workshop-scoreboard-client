# A Practical Introduction to Container Security Scoreboard - Client
This repository houses the client-side component for the **Practical Container Security Workshop scoreboard**. It consists of an Ansible playbook that runs continuously to gather workshop task completion data from a participant cluster and report it up to a centralized [scoreboard server](https://github.com/andykrohg/cs-workshop-scoreboard-server/tree/practical-container-security).

## Deploy me
### Clone this repository
From your bastion, clone this repository and `cd` into the `ansible` directory:
```bash
git clone https://github.com/andykrohg/cs-workshop-scoreboard-client --branch practical-container-security
cd cs-workshop-scoreboard-client/ansible
```

### Set your scoreboard server URL
**You'll need to get the URL for the scoreboard server from your instructor.**
```bash
export SCOREBOARD_SERVER=<server_url>
```
### Run the client in the background
```bash
./loop.sh > ./client.log 2>&1 &
```

You're all set! In a moment, the scoreboard should display your GUID and start tracking your progress. Head over to the to your labguide dashboard to get started.

## Want to build a scoreboard client for a different workshop?
Check out the development guide [here](DEVELOPMENT.md).