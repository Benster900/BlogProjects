from config.config import DockerKafkaConfig, RemoteKafkaConfig
from confluent_kafka import Consumer, Producer
import os

def is_docker():
    path = '/proc/self/cgroup'
    print (
        os.path.exists('/.dockerenv') or
        os.path.isfile(path) and any('docker' in line for line in open(path))
    )
    return (
        os.path.exists('/.dockerenv') or
        os.path.isfile(path) and any('docker' in line for line in open(path))
    )

app_config = None
if is_docker():
    app_config = DockerKafkaConfig
else:
    app_config = RemoteKafkaConfig

# Create Kafka producer connector
kafka_producer = Producer({'bootstrap.servers': '{0}:{1}'.format(app_config.kafka_hostname, app_config.kafka_port) })
                
# Create Kafka consumer connector
print ('Kafka broker: {0}:{1}'.format( app_config.kafka_hostname, app_config.kafka_port ))
kafka_consumer = Consumer({
    'bootstrap.servers': '{0}:{1}'.format( app_config.kafka_hostname, app_config.kafka_port ),
    'group.id': 'mygroup',
    'auto.offset.reset': 'earliest'
})