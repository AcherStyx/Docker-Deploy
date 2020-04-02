FROM ubuntu:14.04

RUN apt-get update \
    && apt-get install -y python3 python3-pip \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install flask requests netifaces

# add low privilege accout
RUN groupadd -r sfc && useradd -r -g sfc sfc
USER sfc
WORKDIR /home/sfc

ADD --chown=sfc:sfc source ./

ENTRYPOINT [ "python3", "sfc_agent.py", "--rest", "--odl-ip-port", "10.0.0.10:8181", "--auto-sff-name"]