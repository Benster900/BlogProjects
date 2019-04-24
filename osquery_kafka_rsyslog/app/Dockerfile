FROM alpine:3.8

# Install things
RUN apk update && apk add python3

# Copy app
COPY app /app

# Workdir
WORKDIR /app

# Install pip requirements
RUN pip3 install -r requirements.txt

# Run app
CMD ["/usr/bin/python3","-u","run-server.py"]