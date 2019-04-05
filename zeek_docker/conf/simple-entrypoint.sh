#!/bin/bash

# Install Zeek
/opt/bro/bin/broctl install

# Deploy Zeek with configs
/opt/bro/bin/broctl deploy

# Start Zeek
/opt/bro/bin/broctl start

# Status Zeek
/opt/bro/bin/broctl status