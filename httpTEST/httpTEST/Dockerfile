#
# http test server with nc
#

# Pull base image
FROM ubuntu:latest

# Author
MAINTAINER  Docker INS <docker@ins.hsr.ch>

RUN echo -n 'HTTP/1.0 200 OK\r\n\r\nServer: ' > response.md && hostname >> response.md

# 80 - HTTP
EXPOSE 80

# Define default command.
CMD ["./bin/sh", "-c", "while true; do nc -l -p 80 < response.md ; done"]
