#
# SDN Framework Ryu master
#

# Pull base image
FROM ubuntu:latest

# Author
MAINTAINER  Docker INS <docker@ins.hsr.ch>

# Update the apt information
# Install python
# Install wget
# Download osrg/ryu/archive/master.zip
# Install (unzip) ryu
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      python-setuptools \
      python-pip \
      python-eventlet \
      python-lxml \
      wget \
      unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    echo "Download https://github.com/osrg/ryu/archive/master.zip and install" && \
    wget -O /opt/ryu.zip "http://github.com/osrg/ryu/archive/master.zip" --no-check-certificate && \
    unzip -q /opt/ryu.zip -d /opt && \
    mv /opt/ryu-master /opt/ryu && \
    rm /opt/ryu.zip && \
    cd /opt/ryu && \
    pip install -r tools/pip-requires && \
    python ./setup.py install
RUN pip install -r /opt/ryu/tools/pip-requires --upgrade


# 6633 - OpenFlow
EXPOSE 6633


# Define working directory.
WORKDIR /opt/ryu


# Define default command.
CMD ["./bin/ryu-manager", "ryu/app/simple_switch.py"]
