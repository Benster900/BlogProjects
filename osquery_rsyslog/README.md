# OSquery + Rsyslog

## Install/Setup Rsyslog server
1. `vim hosts.ini` and set IP address under `rsyslog-server`
1. `mv group_vars/all.yml.example group_vars/all.yml` and set:
    1. 
1. `mv group_vars/logging.yml.example group_vars/logging.yml`
    1.
1. `ansible-playbook -i hosts.ini deploy_rsyslog_server.yml -u <username> -K`

## Resources/Sources