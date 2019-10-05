# osquery url monitor

## Local dev
1. `virtualenv -p python3 venv`
1. `source venv/bin/activate`

## Generate certs for Nginx
1. `openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout conf/nginx/ssl/nginx.key -out conf/nginx/ssl/nginx.crt`


## Copy configs to make
1. ``
1. ``
1. ``
1. ``
1. ``

## References
* [How to get the current time in Python](https://stackoverflow.com/questions/415511/how-to-get-the-current-time-in-python)
* [Python configparser.ConfigParser() Examples](https://www.programcreek.com/python/example/61082/configparser.ConfigParser)
* [Github - confluentinc/confluent-kafka-python](https://github.com/confluentinc/confluent-kafka-python)
* [Kafka Listeners - Explained](https://rmoff.net/2018/08/02/kafka-listeners-explained/)
* [Github - confluentinc/cp-docker-images: kafka-single-node/docker-compose.yml](https://github.com/confluentinc/cp-docker-images/blob/5.3.1-post/examples/kafka-single-node/docker-compose.yml)
* [Github - Landoop/kafka-cheat-sheet](https://github.com/Landoop/kafka-cheat-sheet)
* [imkafka: read from Apache Kafka](https://www.rsyslog.com/doc/v8-stable/configuration/modules/imkafka.html)