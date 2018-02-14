# Wazuh_EternalBlue_Catcher

## Setup WinRM
0. Open Powershell as Administrator
0. powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://github.com/ansible/ansible/raw/devel/examples/scripts/ConfigureRemotingForAnsible.ps1'))"

## Deploy Wazuh agent
0. vim hosts and windows hostnme/IP addr to "[win_agents]"
0. ansible-playbook -i hosts deploy_wazuh_agent.yml

## Setup Slack
