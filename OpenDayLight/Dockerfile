FROM ubuntu:16.04 as build

COPY karaf-0.8.4.tar.gz /home
WORKDIR /home
RUN tar -zxvf karaf-0.8.4.tar.gz \
    && ls -li

FROM ubuntu:16.04

RUN apt update \
    && apt install net-tools -y \
    && apt install openjdk-8-jdk -y \
    && java -version \
    && apt-get clean

COPY --from=build /home/karaf-0.8.4 /home/karaf-0.8.4

ENV PATH=$PATH:/home/karaf-0.8.4/bin
WORKDIR /home/karaf-0.8.4

EXPOSE 8181 6653 6633
