FROM ubuntu:latest

RUN apt-get update && apt-get install -y mumble-server && apt-get install -y libssl1.0-dev

RUN groupadd -r -g 474 mumble && \
    useradd -r -u 474 -g mumble mumble

USER mumble

VOLUME ["/data"]

EXPOSE 64738

ENTRYPOINT ["/usr/sbin/murmurd", "-ini", "/data/mumble-server.ini", "-fg"]
