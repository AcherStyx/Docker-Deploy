FROM debian:8

# less priviledge user, the id should map the user the downloaded files belongs to
RUN groupadd -r webui && useradd -r -g webui webui -u 1000

# webui + aria2
RUN apt-get update \
	&& apt-get install -y aria2 busybox curl unzip\
  && apt-get install git -y \
	&& rm -rf /var/lib/apt/lists/*

# add webui
RUN mkdir /webui-aria2 \
  && git clone https://github.com/ziahamza/webui-aria2 webui \
  && mv /webui/docs/* /webui-aria2 \
  && rm webui -rf \
  && apt-get autoremove git -y \
  && apt-get clean

# gosu install latest
RUN GITHUB_REPO="https://github.com/tianon/gosu" \
  && LATEST=`curl -s  $GITHUB_REPO"/releases/latest" | grep -Eo "[0-9].[0-9]*"` \
  && curl -L $GITHUB_REPO"/releases/download/"$LATEST"/gosu-amd64" > /usr/local/bin/gosu \
  && chmod +x /usr/local/bin/gosu

# goreman supervisor install latest
RUN GITHUB_REPO="https://github.com/mattn/goreman" \
  && LATEST=`curl -s  $GITHUB_REPO"/releases/latest" | grep -Eo "v[0-9]*.[0-9]*.[0-9]*"` \
  && curl -L $GITHUB_REPO"/releases/download/"$LATEST"/goreman_linux_amd64.zip" > goreman.zip \
  && unzip goreman.zip && mv /goreman /usr/local/bin/goreman && rm -R goreman*

# goreman setup
RUN echo "web: gosu webui /bin/busybox httpd -f -p 8080 -h /webui-aria2\nbackend: gosu webui /usr/bin/aria2c --enable-rpc --rpc-listen-all --dir=/data" > Procfile

# aria2 downloads directory
VOLUME [ "/data", "/config" ]

# save session
RUN touch /config/aria2.session

# load config
COPY aria2.conf /home/docker/.aria2/aria2.conf

# aria2 RPC port, map as-is or reconfigure webui
EXPOSE 6800/tcp
# webui static content web server, map wherever is convenient
EXPOSE 8080/tcp

CMD ["start"]
ENTRYPOINT ["/usr/local/bin/goreman"]