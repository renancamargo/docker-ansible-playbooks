FROM ubuntu:20.04

RUN set -eux && \
    apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install \
            ansible && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/*
