### Day 3 - Advance Ansible

Step 1:
```
ansible-galaxy collection install amazon.aws
ansible-galaxy collection install azure.azcollection
ansible-galaxy collection install google.cloud
```
- Note: Collections = modules + plugins + docs bundled together. They expand Ansible for specific ecosystems.

Step 2:
Configure the cloud Credentials
```
AWS
> sudo apt install aws-cli
> aws configure
```