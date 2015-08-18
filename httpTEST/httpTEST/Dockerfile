#
# http test server with nc
#

# Pull base image
FROM ubuntu:latest

# Author
MAINTAINER  Docker INS <docker@ins.hsr.ch>

# run while true with nohup
# logfile: nohup.out
RUN nohp sh -c "while true; do echo -e 'HTTP/1.0 200 OK\r\n\r\nServer: `hostname`' | sudo nc -l -p 80 ; done" &


# 80 - HTTP
EXPOSE 80

# Define default command.
CMD ["./bin/bash"]
