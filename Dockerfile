FROM ubuntu:20.04

RUN set -eux && \
    apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install \
            ansible \
            vi \
            vim \
            systemd && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
