# Osquery + Kafka + Rsyslog

## Blog post

* [Detecting malicious downloads with Osquery, Rsyslog, Kafka, Python3, and VirusTotal](https://holdmybeersecurity.com/2019/04/25/detecting-malici…3-and-virustotal/)

This blog post will explore how to set up a simple logging pipeline to detect maliciously downloaded files. This setup will utilize technologies such as Osquery, Rsyslog, Kafka, Docker, Python3, and VirusTotal for a logging pipeline. If this pipeline detects a malicious file, a Slack alert will be triggered.

First, Osquery will monitor file system events for newly created files. Rsyslog client on a macOS endpoint will ship logs to a Rsyslog server. The Rsyslog server will forward the logs to Kafka, and then Kafka will place the logs into a topic to be consumed by our Dockerized Python application. The Python application will extract the file hash from Osquery file events. These hashes will be submitted to VirusTotal for analysis. If VirusTotal reports that the file is malicious, a Slack alert will be triggered.

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
