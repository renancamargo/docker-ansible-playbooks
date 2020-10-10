#FROM ubuntu:20.04

#RUN set -eux && \
#    apt-get -y update && \
#    DEBIAN_FRONTEND=noninteractive apt-get -y install \
#            ansible \
#            vim \
#            systemd && \
#    apt-get -y autoremove && \
#    rm -rf /var/lib/apt/lists/*

#CMD ["/bin/bash"]

FROM ubuntu:20.04

RUN set -eux && \
    apt-get -y update && \
    apt-get -y install \
            ansible \
            systemd && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/*

RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i = systemd-tmpfiles-setup.service ] || rm -f $i; done); \
    rm -f /lib/systemd/system/multi-user.target.wants/*;\
    rm -f /etc/systemd/system/*.wants/*;\
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*;\
    rm -f /lib/systemd/system/anaconda.target.wants/*;

CMD ["/sbin/init"]
