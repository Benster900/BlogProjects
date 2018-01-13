FROM ubuntu:16.04

RUN apt update -y

RUN apt install mongodb python3-pip python3-dev -y
COPY conf/mongo/mongodb.conf /etc/mongodb.conf

RUN mkdir /opt/caldera
RUN git clone https://github.com/mitre/caldera.git /opt/caldera

WORKDIR /opt/caldera/caldera
RUN pip3 install -r requirements.txt

EXPOSE 8888
CMD["/usr/bin/python3","caldera.py"]
