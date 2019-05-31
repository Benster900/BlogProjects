
## Local dev
1. `virtualenv -p python3 venv`
1. `source venv/bin/activate`
1. `pip3 install -r requirements.txt`
1. `mv config/config.py.example config/config.py`
1. Configure kafka_hostname, kafka_port, kafka_zeek_topic


## Configuration

## Spin up Docker
1. `docker-compose build`
1. `docker-compose up`


## References
* [Download Files with Python](https://stackabuse.com/download-files-with-python/)
* [How to Check if a File Exists in Python](https://therenegadecoder.com/code/how-to-check-if-a-file-exists-in-python)
* [ransomwaretracker.abuse.ch](https://ransomwaretracker.abuse.ch/downloads/RW_IPBL.txt)
* [Kafka-Python explained in 10 lines of code](https://towardsdatascience.com/kafka-python-explained-in-10-lines-of-code-800e3e07dad1)
* [Downloading files with the Requests library](http://www.compciv.org/guides/python/how-tos/downloading-files-with-requests/)
* [Github - Confluent's Python Client for Apache Kafka](https://github.com/confluentinc/confluent-kafka-python)
* [Kafka ElasticSearch Logstash Example](https://www.devglan.com/apache-kafka/kafka-elasticsearch-logstash-example)
* [Github - osquery_kafka_rsyslog](https://github.com/CptOfEvilMinions/BlogProjects/blob/master/osquery_kafka_rsyslog)
