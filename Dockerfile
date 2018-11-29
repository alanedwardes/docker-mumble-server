FROM ubuntu:latest

RUN apt-get update && apt-get install -y mumble-server

RUN groupadd -r -g 474 mumble && \
    useradd -r -u 474 -g mumble mumble

RUN chown mumble /usr/sbin/murmurd && stat /usr/sbin/murmurd

USER mumble

VOLUME ["/data"]

EXPOSE 64738

ENTRYPOINT ["/usr/sbin/murmurd", "-ini", "/data/mumble-server.ini", "-fg"]
