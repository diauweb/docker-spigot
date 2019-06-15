FROM openjdk:8u181-alpine
LABEL maintainer="xd@northme.com"

# Install dependencies
RUN apk upgrade --update && \
    apk add --update wget curl ca-certificates openssl bash git screen util-linux && \
    update-ca-certificates

ENV SPIGOT_HOME /opt/mc
ARG MC_REV=latest
ENV JVM_OPTS -Xmx2048M -Xms1024M

RUN mkdir -p ${SPIGOT_HOME} &&\
    mkdir -p ${SPIGOT_HOME}/plugins

COPY cmd.sh /cmd.sh
COPY server_init.sh /opt/mcdaemon.d/server_init.sh
COPY server_run.sh  /opt/mcdaemon.d/server_run.sh

COPY server_build.sh /tmp/server_build.sh

RUN chmod +x /cmd.sh && \
    chmod +x /opt/mcdaemon.d/server_run.sh && \
    chmod +x /opt/mcdaemon.d/server_init.sh && \
    chmod +x /tmp/server_build.sh

RUN sh /tmp/server_build.sh

EXPOSE 25565
EXPOSE 8123
VOLUME ["/opt/mc"]


CMD /opt/mcdaemon.d/server_init.sh
