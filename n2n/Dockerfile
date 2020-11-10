FROM centos:8

RUN yum install git make -y

RUN git clone https://github.com/ntop/n2n -b 2.8-stable /n2n && \
    cd /n2n

WORKDIR /n2n

RUN yum install autoconf automake libtool -y 

RUN ./autogen.sh && \
    ./configure && \
    make && \
    make install

EXPOSE 5000
EXPOSE 5001

ENTRYPOINT [ "supernode","-v","-l","5000","-t", "5001","-v"]