FROM ubuntu:18.04 as zeek-manager

# Build args
ARG zeek_interface=eth0

# Copy Zeek from build
COPY --from=zeek-build /opt/bro /opt/bro

# Copy config
COPY conf/bro/node-standalone.cfg /opt/bro/etc/node-standalone.cfg

# Change default interface
RUN sed -i "s/interface=eth0/interface=$zeek_interface/g" /opt/bro/etc/node.cfg

# Entrypoint
COPY conf/simple-entrypoint.sh /simple-entrypoint.sh
RUN chmod +x /simple-entrypoint.sh 
ENTRYPOINT [ "/simple-entrypoint.sh" ]

CMD ["/opt/bro/bin/broctl","start"]