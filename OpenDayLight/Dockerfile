FROM ubuntu:16.04

# install oracle java
ADD source/jdk-8u241-linux-x64.tar.gz /usr/local/java/
ENV JAVA_HOME /usr/local/java/jdk1.8.0_241
ENV JAVA_BIN $JAVA_HOME/bin
ENV JAVA_LIB $JAVA_HOME/lib
ENV CLASSPATH .:$JAVA_LIB/dt.jar:$JAVA_LIB/tools.jar
ENV PATH $JAVA_BIN:$PATH
RUN java -version \
    && javac -version

# install odl
ADD source/karaf-0.8.4.tar.gz /usr/local/karaf
ENV PATH=$PATH:/usr/local/karaf/karaf-0.8.4/bin

# install sfc
RUN start \
    && client -r 20 "feature:install odl-netconf-api odl-netconf-mapping-api \
    odl-netconf-util odl-netconf-netty-util odl-netconf-client odl-sfc-netconf \
    odl-netconf-connector-all odl-netconf-notifications-api odl-mdsal-apidocs \
    odl-mdsal-models odl-mdsal-binding odl-mdsal-binding-runtime odl-mdsal-common \
    odl-mdsal-broker odl-mdsal-clustering-commons odl-mdsal-distributed-datastore \
    odl-mdsal-remoterpc-connector odl-mdsal-broker-local odl-restconf \
    odl-restconf-noauth odl-sfc-model odl-sfc-provider odl-sfc-provider-rest \
    odl-sfc-ovs odl-sfc-ui odl-sfc-sb-rest odl-sfc-openflow-renderer"

# install l2switch
RUN start \
    && client -r 20 "feature:install odl-l2switch-switch-ui \
    odl-dluxapps-yangman odl-dluxapps-nodes"

ENTRYPOINT [ "/usr/local/karaf/karaf-0.8.4/bin/karaf" ]