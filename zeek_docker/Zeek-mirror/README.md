# Zeek install from mirror

## Get interface to monitor
1. Run on host: `ip a`
    1. Copy interface name you want to monitor

## Build container
1. `cd BlogProjects/zeek_docker`
1. `docker build -f Zeek-mirror/Dockerfile --build-arg zeek_interface=<interface to monitor on host> -t zeek-mirror-standalone .`

## Spin up container
1. `docker-compose up -d`

## Debug container
1. `docker ps`
1. `docker exec -it <container ID> bash`
1. `/opt/bro/bin/broctl status`
1. `/opt/bro/bin/broctl diag`

## Resources/Sources
