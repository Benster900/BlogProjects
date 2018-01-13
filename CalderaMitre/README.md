# Caldera
## Ansible setup - prod
0. vim hosts and set [caldera]
0. mv group_vars/all.example group_vars/all
0. vim group_vars/all and set:
    1. base_domain
    1. caldera_pass
    1. cert info
0. ansible-playbook -i hosts deploy_caldera.yml -u <user>

## Docke setup - dev

## Supported OSes for Ansible
* Ubuntu Server 16.04 64-bit

# To do:
* Dockerize
* Windows agent deploy

# Resources/Sources
* https://caldera.readthedocs.io/en/latest/installation.html
* https://github.com/mitre/caldera
