FROM ubuntu:16.04

RUN responder app
USER responder

RUN apt update -y && apt-get install python python-pip git -y

RUN git clone https://github.com/SpiderLabs/Responder.git
WORKDIR Responder

EXPOSE 445 389 139 137 138

CMD ["python", "-u","./Responder.py", "--interface=eth0", "-A"]
