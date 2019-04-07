FROM ubuntu:18.04 as zeek-manager

# Build args
ARG zeek_interface=eth0

# Install 
RUN apt-get update -y && apt-get install wget net-tools supervisor libpcap-dev -y

# Copy Zeek from build
COPY --from=zeek-build /opt/bro /opt/bro

# Copy config
COPY node-standalone.cfg /opt/bro/etc/node-standalone.cfg

# Change default interface
RUN sed -i "s/interface=eth0/interface=$zeek_interface/g" /opt/bro/etc/node.cfg

# Supervisor
COPY supervisor.conf /etc/supervisor/conf.d/supervisord.conf

# Entrypoint
CMD ["/usr/bin/supervisord","-c","/etc/supervisor/conf.d/supervisord.conf"]