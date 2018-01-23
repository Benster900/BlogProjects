# Docker Machine Botnet
This isn't really a botnet in a malicious way. I want to start testing my tools at scale and Docker will allow me to do just that. With Docker I can make all computers in my computer lab part of a Docker Swarm.

## Ansible deploy
### Setup manager
0. mv hosts.example hosts
0. vim hosts and set "[manager]"
0. mv group_vars/all.example group_vars/all
0. vim group_vars/all and set slack_token and slack_channel
    1. optional
0. ansible-playbook -i hosts deploy_docker_manager.yml
    1. Copy Docker token from output

### Setup agents
0. vim group_vars/all and set docker_token
0. vim hosts and set "[win_agents]"
0. ansible-playbook -i hosts deploy_docker_nodes.yml

## Supported OSes
* Windows 10

# TO do:
