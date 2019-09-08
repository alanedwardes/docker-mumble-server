FROM ubuntu:latest

ARG mumble_release=1.3.0
ARG mumble_file=murmur-static_x86-${mumble_release}.tar.bz2

RUN curl https://github.com/mumble-voip/mumble/releases/download/$mumble_release/${mumble_file} --output murmur.tar.bz2 && \
    tar xjf murmur.tar.bz2

RUN groupadd -r -g 474 mumble && \
    useradd -r -u 474 -g mumble mumble

USER mumble

VOLUME ["/data"]

EXPOSE 64738

ENTRYPOINT ["murmur/murmur.x86", "-ini", "/data/mumble-server.ini", "-fg"]
