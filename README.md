# BlogProjects

## Graylog v3
* [Install/Setup Graylog 3 on Ubuntu 18.04 - Zeeks logs + threat intel pipeline](https://holdmybeersecurity.com/2019/03/27/install-setup-graylog-3-on-ubuntu-18-04-zeeks-logs-threat-intel-pipeline/)
* [README](Graylogv3/README.md)

This blog post is how to setup up Graylog version 3 on an Ubuntu server 18.04 with your choice of a manual install, Ansible, or Docker. Once Graylog is running, I have instructions on shipping NGINX logs with Rsyslog and Zeek/BRO logs in JSON format with Filebeat. Once the logs are ingested, we will create logging inputs, data extractors,  pipelines for threat intelligence, Slack alerts, and a dashboard to view Zeel logs.

## Logging OSquery with Rsyslog v8 - Love at first sight
* [Logging OSquery with Rsyslog v8 - Love at first sight](https://holdmybeersecurity.com/2019/03/29/logging-osquery-with-rsyslog-v8-love-at-first-sight/)
* [README](osquery_rsyslog/README.md)

This blog post is going to cover how to ingest OSquery logs with Rsyslog v8. Most setups I have come across have Rsyslog ingesting the logs from disk but this setup will ingest logs via the system journal. OSquery supports writing logs to disk and to the system journal. This post also contains a setup via Ansible and a manual walkthrough. Lastly, explanations of Rsyslog and OSquery configs.

## Install/Setup Zeek + pf_ring on Ubuntu 18.04 on Proxmox 5.3 + openVswitch
* [Part 1: Install/Setup Zeek + pf_ring on Ubuntu 18.04 on Proxmox 5.3 + openVswitch](https://holdmybeersecurity.com/2019/04/03/part-1-install-setup-zeek-pf_ring-on-ubuntu-18-04-on-proxmox-5-3-openvswitch/)
* [README](zeek_pfring/README.md)

Monitoring your home network can be challenging without enterprise-grade equipment. Although monitoring your home network can prove to be difficult, Proxmox and Zeek provide the perfect solution to monitor your home network. This blog post will cover how to setup Zeek+PF_Ring to monitor network traffic on Proxmox.

## Osquery + Kafka + Rsyslog pipeline
* [Detecting malicious downloads with Osquery, Rsyslog, Kafka, Python3, and VirusTotal](https://holdmybeersecurity.com/2019/04/25/detecting-malicious-downloads-with-osquery-rsyslog-kafka-python3-and-virustotal/)
* [README](osquery_kafka_rsyslog/README.md)

This blog post will explore how to set up a simple logging pipeline to detect maliciously downloaded files. This setup will utilize technologies such as Osquery, Rsyslog, Kafka, Docker, Python3, and VirusTotal for a logging pipeline. If this pipeline detects a malicious file, a Slack alert will be triggered.

First, Osquery will monitor file system events for newly created files. Rsyslog client on a macOS endpoint will ship logs to a Rsyslog server. The Rsyslog server will forward the logs to Kafka, and then Kafka will place the logs into a topic to be consumed by our Dockerized Python application. The Python application will extract the file hash from Osquery file events. These hashes will be submitted to VirusTotal for analysis. If VirusTotal reports that the file is malicious, a Slack alert will be triggered.

## Back in the saddle: Install/Setup Elastic stack 7.0 on Ubuntu 18.04
* [Back in the saddle: Install/Setup Elastic stack 7.0 on Ubuntu 18.04](https://holdmybeersecurity.com/2019/05/01/back-in-the-saddle-install-setup-elastic-stack-7-0-on-ubuntu-18-04/)
* [README](ElasticStackv7/README.md)


## PoC: Monitoring user browser activity with Osquery
* [PoC: Monitoring user browser activity with Osquery](https://holdmybeersecurity.com/2019/10/06/poc-monitoring-user-browser-activity-with-osquery/)
* [README](osquery-url-monitor/README.md)

## Exfiltrating data on macOS with Folder Actions
This blog post is going to demonstrate a proof of concept (PoC) to exfiltrate data from macOS with a built-in functionality called Folder Actions. The Folder Actions functionality triggers Applescripts to execute code when certain conditions (creating files, deleting files, etc.) occur by interactions with Finder. This functionality provides a method to exfiltrate data without the need for a shell to execute the actions. The Applescript provided below will utilize this functionality to monitor for new files in the user's Download folder and, upon detection of a new file, exfiltrate a copy of the file to a remote server.

* [Exfiltrating data on macOS with Folder Actions](https://holdmybeersecurity.com/exfiltrating-data-on-macos-with-folder-actions)

## Projects
* Google Grr
* MITRE Caldera
