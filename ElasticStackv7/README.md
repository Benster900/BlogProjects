# Elastic stack version 7

## Build Elastic stack with Docker
1. `openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout Docker/nginx/certs/nginx.key -out Docker/nginx/certs/nginx.crt`
    1. Generate certs for NGINX
1. `openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout Docker/logstash/certs/logstash.key -out Docker/logstash/certs/logstash.crt`
    1. Generate certs for Logstash
1. `docker-compose build`
    1. Build containers
1. `docker-compose up -d`
    1. Spin up stack

## References
### Elasticsearch

### Logstash

### Kibana


### NGINX
* [Redirect HTTP to HTTPS in Nginx](https://bjornjohansen.no/redirect-to-https-with-nginx)
* [Dev-Dipesh/ELK with Nginx.md](https://gist.github.com/Dev-Dipesh/2ac30a8a01afb7f65b2192928a875aa1)
* [How To Create a Self-Signed SSL Certificate for Nginx in Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-in-ubuntu-18-04)
