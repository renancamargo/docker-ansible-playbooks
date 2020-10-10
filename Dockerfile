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
ENV container docker
ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive

RUN set -eux && \
    apt-get -y update && \
    apt-get -y install \
            ansible \
            systemd \
            systemd-sysv && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/*
    
RUN cd /lib/systemd/system/sysinit.target.wants/ \
    && ls | grep -v systemd-tmpfiles-setup | xargs rm -f $1

RUN rm -f /lib/systemd/system/multi-user.target.wants/* \
    /etc/systemd/system/*.wants/* \
    /lib/systemd/system/local-fs.target.wants/* \
    /lib/systemd/system/sockets.target.wants/*udev* \
    /lib/systemd/system/sockets.target.wants/*initctl* \
    /lib/systemd/system/basic.target.wants/* \
    /lib/systemd/system/anaconda.target.wants/* \
    /lib/systemd/system/plymouth* \
    /lib/systemd/system/systemd-update-utmp*
    
#VOLUME [ "/sys/fs/cgroup" ]

CMD ["/lib/systemd/systemd"]
