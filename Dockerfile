FROM ubuntu:latest

RUN apt-get update && apt-get install -y mumble-server

RUN chmod 755 /tmp/start.sh
ADD start.sh /tmp/start.sh

RUN groupadd -r -g 474 mumble && \
    useradd -r -u 474 -g mumble mumble
USER mumble

VOLUME ["/data"]

EXPOSE 64738

ENTRYPOINT ["/tmp/start.sh"]
