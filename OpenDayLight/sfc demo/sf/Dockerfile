FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install -y python3 python3-pip \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/*
    
RUN pip3 install --upgrade pip
RUN pip3 install flask requests netifaces paramiko
RUN python3 --version

# add low privilege accout
RUN groupadd -r sfc && useradd -r -m -d /home/sfc -g sfc sfc
USER sfc
WORKDIR /home/sfc

COPY --chown=777 source ./


ENTRYPOINT [ "python3", "sfc_agent.py", "--rest", "--odl-ip-port", "10.0.0.10:8181", "--auto-sff-name"]