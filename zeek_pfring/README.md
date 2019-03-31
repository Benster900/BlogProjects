# Zeek + PF_RING

## Blog post


## Install/Setup Zeek + PF_RING on Ubuntu 18.04
1. `mv group_vars/all.yml.example group_vars/all.yml`
1. `vim group_vars/all.yml` and set:
    1. general
        1. `timezone` - Set timezone for machine
    1. zeek
        1. `zeek_hostname` - Set hostname for machine
        1. `zeek_interface` - Set interface for machine
        1. `zeek_geoip` - Enable/Disable GeoIP tagging
        1. `zeek_file_extraction` - Enable/Disable file extraction
        1, `zeek_custom_scripts` - Include custom scripts
1. `mv conf/zeek/networks.cfg.example conf/zeek/networks.cfg`
1. `vim conf/zeek/networks.cfg`
```
Add network ranges in CIDR notation
10.0.0.0/8
192.168.1.0/24
```
    1. Save and exit
1. `ansible-playbook -i hosts.ini deploy_zeek_pf_ring.yml -u <user> -K`


## Resources/Sources