FROM pihole/pihole:master-buster
ARG TARGETARCH
ARG DEBIAN_FRONTEND="noninteractive"

RUN apt-get -y update && apt-get -y upgrade && apt-get -y install unbound unbound-anchor unbound-host dns-root-data wget curl jq
COPY etc/ /etc/

COPY update-ftl /usr/sbin/
RUN /usr/sbin/update-ftl $TARGETARCH

RUN chown -R root:unbound /etc/unbound && chmod 640 /etc/unbound/unbound.conf.d/* /etc/unbound/zones/*
RUN unbound-anchor -v || unbound-anchor -v

