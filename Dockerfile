FROM alpine:edge
MAINTAINER frank@groenewoud.me

ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US.UTF-8' \
    TERM='xterm'

RUN apk -U upgrade && \
    apk -U add \
        bash

ENTRYPOINT ["bash"]
