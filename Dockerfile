FROM ubuntu:latest

RUN echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf.d/00-docker
RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf.d/00-docker
RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y smokeping dnsutils \
    && rm -rf /var/lib/apt/lists/*

COPY smokeping_slave.sh /root/smokeping_slave.sh

ENTRYPOINT ["/root/smokeping_slave.sh"]

