#
# OpenDaylight Karaf Helium 0.2.0 Dockerfile
#

# Pull base image
FROM ubuntu

# Author
MAINTAINER  Docker INS <docker@ins.hsr.ch>

# Update the apt information
# Install python
# Install wget
# Download distribution-karaf-0.2.0-Helium.tar.gz
# Install (unzip) ryu
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      python \
      wget \
      unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    echo "Download https://github.com/osrg/ryu/archive/master.zip and install" && \
    wget -q -O /opt/ryu.zip "https://github.com/osrg/ryu/archive/master.zip" && \
    unzip /opt/ryu.zip -d /opt/ryu && \
    rm /opt/ryu.zip &&
    python /opt/ryu/setup.py install


# 6633 - OpenFlow
EXPOSE 6633


# Define working directory.
WORKDIR /opt/ryu


# Define default command.
CMD ["bash"]
