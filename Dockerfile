FROM pihole/pihole:master-buster
ARG TARGETARCH
ARG DEBIAN_FRONTEND="noninteractive"
ARG FTLVER=v5.11

RUN apt-get -y update && apt-get -y upgrade && apt-get -y install unbound unbound-anchor unbound-host dns-root-data
COPY etc/ /etc/
COPY update-ftl /usr/sbin/
RUN /usr/sbin/update-ftl $TARGETARCH ${FTLVER}
RUN chown -R root:unbound /etc/unbound && chmod 640 /etc/unbound/unbound.conf.d/* /etc/unbound/zones/*
RUN unbound-anchor -v || unbound-anchor -v
