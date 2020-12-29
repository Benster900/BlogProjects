#!/usr/bin/env python
import os,sys

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "lib"))
from splunklib.searchcommands import dispatch, StreamingCommand, Configuration, Option, validators
    
@Configuration()
class HelloWorldCommand(StreamingCommand):
    def stream(self, records):
        for record in records:
            record['hello'] = 'world'
            yield record
        
dispatch(HelloWorldCommand, sys.argv, sys.stdin, sys.stdout, __name__)