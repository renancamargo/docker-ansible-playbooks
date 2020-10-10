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

RUN	apt-get update \
    && apt-get install -y --no-install-recommends \
       apt-utils \
       locales \
       python-setuptools \
       python3-pip \
       ansible \
       software-properties-common \
       rsyslog systemd systemd-cron sudo iproute2 \
		&& rm -Rf /var/lib/apt/lists/* \
		&& rm -Rf /usr/share/doc && rm -Rf /usr/share/man \
		&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
		&& rm -f /lib/systemd/system/multi-user.target.wants/* \
		&& rm -f /etc/systemd/system/*.wants/* \
		&& rm -f /lib/systemd/system/local-fs.target.wants/* \
		&& rm -f /lib/systemd/system/sockets.target.wants/*udev* \
		&& rm -f /lib/systemd/system/sockets.target.wants/*initctl* \
		&& rm -f /lib/systemd/system/basic.target.wants/* \
		&& rm -f /lib/systemd/system/anaconda.target.wants/* \
		&& rm -f /lib/systemd/system/plymouth* \
		&& rm -f /lib/systemd/system/systemd-update-utmp* \
		&& rm -Rf /usr/share/doc && rm -Rf /usr/share/man \
		&& apt-get clean

RUN locale-gen en_US.UTF-8

VOLUME ["/sys/fs/cgroup"]

CMD ["/bin/bash"]
