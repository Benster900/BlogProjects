# OSquery + Rsyslog

## Install/Setup Rsyslog server
1. `vim hosts.ini` and set IP address under `rsyslog-server`
1. `mv group_vars/all.yml.example group_vars/all.yml` and set:
    1. `slack_token` - OPTIONAL for Slack notifications
    1. `slack_channel` - OPTIONAL for Slack notifications
1. `mv group_vars/logging.yml.example group_vars/logging.yml`
    1. `rsyslog_host` - FQDN/IP address of Rsyslog server
    1. `rsyslog_port` - Port to ingest logs
    1. `rsyslog_input_module` - Module for Rsyslog to ingest logs 
        1. Default set to `imrelp`
    1. `rsyslog_output_module` - Module for Rsyslog to send logs
        1. Default set to `omrelp`
        1. If using RELP for ingesting/sending logs you can enable TLS with `rsyslog_tls`
1. `ansible-playbook -i hosts.ini deploy_rsyslog_server.yml -u <username> -K`

## Install/Setup Rsyslog + OSquery client
1. `vim hosts.ini` and set IP address under `rsyslog-client`
1. `ansible-playbook -i hosts.ini deploy_rsyslog_osquery_client.yml -u <username> -K`

## Resources/Sources