# Caldera
## Ansible setup - prod
0. vim hosts and set [caldera]
0. mv group_vars/all.example group_vars/all
0. vim group_vars/all and set:
    1. base_domain
    1. caldera_pass
    1. cert info
0. ansible-playbook -i hosts deploy_caldera.yml -u <user>

## Docker setup - dev
0. docker build -t caldera .
0. docker run -d -p 8888:8888 caldera

## Deploy Caldera agents to Windows
0. vim hosts and set [win_agents]
0. mv group_vars/windows.example group_vars/windows
0. vim group_vars/windows and set:
    1. ansible_user: <Windows username>
    1. ansible_password: <Windows user password>
0. ansible-playbook -i hosts deploy_windows_agents.yml



## Supported OSes for Ansible
* Ubuntu Server 16.04 64-bit

# To do:
* Dockerize
* Windows agent deploy

# Resources/Sources
* https://caldera.readthedocs.io/en/latest/installation.html
* https://github.com/mitre/caldera
