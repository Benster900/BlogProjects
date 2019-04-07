# Zeek from source stack setup

## Generate SSH keys
1. `ssh-keygen -f .ssh/id_rsa -t rsa -N ''`

### Run Zeek stack
1. Run on host: `ip a`
    1. Copy interface name you want to monitor
1. `docker build -f Dockerfile-zeek-source-standalone --build-arg zeek_interface=<interface to monitor on host> -t zeek-source-standalone .`
1. `docker run --net=host zeek-source-standalone`


## Resources/Sources