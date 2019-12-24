FROM ubuntu:latest

ARG MUMBLE_RELEASE=1.3.0
ARG MUMBLE_FILE=murmur-static_x86-${MUMBLE_RELEASE}.tar.bz2

RUN apt-get update && apt-get install -y curl && apt-get install -y libssl1.0-dev

RUN curl https://github.com/mumble-voip/mumble/releases/download/$MUMBLE_RELEASE/$MUMBLE_FILE --output murmur.tar.bz2 && \
    tar xjf murmur.tar.bz2

RUN groupadd -r -g 474 mumble && \
    useradd -r -u 474 -g mumble mumble

USER mumble

VOLUME ["/data"]

EXPOSE 64738

ENTRYPOINT ["murmur/murmur.x86", "-ini", "/data/mumble-server.ini", "-fg"]
