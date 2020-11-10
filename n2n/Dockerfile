FROM centos:8

RUN yum install git make -y

RUN git clone https://github.com/ntop/n2n /n2n
WORKDIR /n2n

RUN yum install autoconf automake libtool -y 

RUN ./autogen.sh && \
    ./configure && \
    make && \
    make install

RUN whereis supernode

ENTRYPOINT [ "/usr/sbin/supernode", "-l=1234" ]