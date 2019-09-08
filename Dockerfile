FROM ubuntu:latest

ARG mumble_release=1.3.0
ARG mumble_file=murmur-static_x86-${mumble_release}

RUN wget https://github.com/mumble-voip/mumble/releases/download/$mumble_release/${mumble_file}.tar.bz2 && \
    tar xjf ${mumble_file}.tar.bz2

RUN groupadd -r -g 474 mumble && \
    useradd -r -u 474 -g mumble mumble

USER mumble

VOLUME ["/data"]

EXPOSE 64738

ENTRYPOINT ["${mumble_file}/murmur.x86", "-ini", "/data/mumble-server.ini", "-fg"]
