FROM ubuntu:latest

ARG MUMBLE_VERSION=1.3.0
ARG MUMBLE_RELEASE=murmur-static_x86-$MUMBLE_VERSION
ARG MUMBLE_BINARY=$MUMBLE_RELEASE.tar.bz2
ARG MUMBLE_URL=https://github.com/mumble-voip/mumble/releases/download/$MUMBLE_VERSION/$MUMBLE_BINARY

RUN apt-get update && apt-get install -y wget && apt-get install -y libssl1.0-dev

RUN wget -O murmur.tar.bz2 $MUMBLE_URL && tar -xvjf murmur.tar.bz2 && mv $MUMBLE_RELEASE murmur

RUN groupadd -r -g 474 mumble && \
    useradd -r -u 474 -g mumble mumble

USER mumble

VOLUME ["/data"]

EXPOSE 64738

ENTRYPOINT ["murmur/murmur.x86", "-ini", "/data/mumble-server.ini", "-fg"]