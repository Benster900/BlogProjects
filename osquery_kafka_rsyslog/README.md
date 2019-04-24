# Osquery + Kafka + Rsyslog

## Blog post

* [Detecting malicious downloads with Osquery, Rsyslog, Kafka, Python3, and VirusTotal]()

## Spin up logging stack
1. `docker-compose build`
1. `docker-compose up -d`

## References
### Rsyslog-server
* [Rsyslog templates](https://www.rsyslog.com/doc/v8-stable/configuration/templates.html#string)
* [Github - sematext/velocity - Rsyslog.conf](https://github.com/sematext/velocity/blob/master/rsyslog.conf.kafka)
* [Dockerhub - Rsyslog](https://hub.docker.com/r/jumanjiman/rsyslog/dockerfile)
* [Rsyslog - omkafka](https://www.rsyslog.com/doc/master/configuration/modules/omkafka.html)

### Rsyslog-client
