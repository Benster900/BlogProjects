#!/usr/bin/env python
import os,sys

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "lib"))
from splunklib.searchcommands import dispatch, StreamingCommand, Configuration, Option, validators
from datetime import datetime

@Configuration()
class SimpleStreamingCommand(StreamingCommand):    
    def stream(self, records):
        for record in records:
            record['timestamp_added'] = str(datetime.now())
            yield record
        
dispatch(SimpleStreamingCommand, sys.argv, sys.stdin, sys.stdout, __name__)