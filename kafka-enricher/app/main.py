from app import app_config, kafka_consumer, kafka_producer
import requests
import os
import json

def get_abuse_blacklist():
    abuse_blacklist = set()

    if os.path.isfile('data/abuse_blacklist.txt') == False:
        print (app_config.abuse_blacklist_url)
        r = requests.get( app_config.abuse_blacklist_url )

        with open('app/data/abuse_blacklist.txt', 'w') as f:  
            f.write(r.text)
    
    with open('app/data/abuse_blacklist.txt', 'r') as  abuse_blacklist_file:
        for line in abuse_blacklist_file:
            if '#' not in line:
                abuse_blacklist.add( line.strip() )
    
    return abuse_blacklist


def is_ipaddr_malicious(message, abuse_blacklist):
    # Check if log contains an IP address
    if 'id.orig_h' in message:
        print (type(message))
        ip_addr = message['id.orig_h']

        # If IP address is in blacklist add a key:value
        if ip_addr in abuse_blacklist:
            message['threat_intel_abuse_ipaddr'] = True
        else: 
            message['threat_intel_abuse_ipaddr'] = False

    print (message)
    return message


def delivery_report(err, msg):
    """ Called once for each message produced to indicate delivery result.
        Triggered by poll() or flush(). """
    if err is not None:
        print('Message delivery failed: {}'.format(err))
    else:
        print('Message delivered to {} [{}]'.format(msg.topic(), msg.partition()))

def push_new_message(message):
    # Trigger any available delivery report callbacks from previous produce() calls
    kafka_producer.poll( app_config.kafka_interval_poll )

    #kafka_producer.produce(app_config.kafka_zeek_enrich_topic, message.encode('utf-8'), callback=delivery_report)
    kafka_producer.produce(app_config.kafka_zeek_enrich_topic, json.dumps(message), callback=delivery_report)



def main():
    # Download abuse blacklist
    abuse_blacklist = get_abuse_blacklist()

    # Subscribe to a topic
    kafka_consumer.subscribe( [app_config.kafka_zeek_topic] )

    while True:
        msg = kafka_consumer.poll( app_config.kafka_interval_pull )

        if msg is None:
            print ('Message is None')
            continue
        if msg.error():
            print("Consumer error: {}".format( msg.error() ))
            continue

        print('Received message: {}'.format( msg.value() ))

        # Extract string and convert to JSON
        message = json.loads( msg.value().decode('utf-8') )
        
        message = is_ipaddr_malicious(message, abuse_blacklist)

        # Push log to topic
        push_new_message(message)

        # Wait for any outstanding messages to be delivered and delivery report
        # callbacks to be triggered.
        kafka_producer.flush()


    # Close connection to Kafka
    kafka_consumer.close()

main()
