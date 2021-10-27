FROM pihole/pihole:master
ARG TARGETARCH
ARG DEBIAN_FRONTEND="noninteractive"


RUN apt-get -y update && apt-get -y upgrade && apt-get -y install unbound unbound-anchor unbound-host dns-root-data
COPY etc/ /etc/
#USE upstream ugrade method
#Define versions en etc/pi-hole-versions 
RUN rm -R /usr/local/bin/whiptail /usr/local/bin/service /etc/.pihole /var/www/html/admin
ENV PIHOLE_INSTALL /etc/.pihole/automated\ install/basic-install.sh
RUN bash -ex install.sh 2>&1 && \
    rm -rf /var/cache/apt/archives /var/lib/apt/lists/*

RUN chown -R root:unbound /etc/unbound && chmod 640 /etc/unbound/unbound.conf.d/* /etc/unbound/zones/*
RUN unbound-anchor -v || unbound-anchor -v
RUN pihole -up
