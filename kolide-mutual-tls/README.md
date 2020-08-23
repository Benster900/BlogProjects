# Kolide + Mutual TLS

## Setup env
1. 
1. `docker-compose run --rm kolide fleet prepare db --config /etc/kolide/kolide.yml`
1. `docker-compose up -d`


## Test client certs with curl
```
curl https://kolide.<domain>:8443/api/v1/osquery/enroll \
  --cacert conf/tls/root_ca/*.crt \
  --key conf/tls/client/*.key \
  --cert conf/tls/client/*.crt
```

## References
* [CptOfEvilMinions/BlogProjects - Docker-vault/conf/nginx/mutual-tls.conf](https://github.com/CptOfEvilMinions/BlogProjects/blob/master/Docker-vault/conf/nginx/mutual-tls.conf)
* [CptOfEvilMinions/Kolide-Docker](https://github.com/CptOfEvilMinions/Kolide-Docker)
* [CLIENT-SIDE CERTIFICATE AUTHENTICATION WITH NGINX](https://fardog.io/blog/2017/12/30/client-side-certificate-authentication-with-nginx/)
* [Install and Setup Kolide Fleet on Ubuntu 18.04](https://kifarunix.com/install-and-setup-kolide-fleet-on-ubuntu-18-04/)
* [Using client certificate in Curl command](https://stackoverflow.com/questions/31305376/using-client-certificate-in-curl-command)
* [Github - CptOfEvilMinions/Kolide-Docker](https://github.com/CptOfEvilMinions/Kolide-Docker)
* [Dockerhube - Kolide/fleet](https://hub.docker.com/r/kolide/fleet/tags)
* []()
* []()
* []()
* []()
* []()