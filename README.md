# Pi-hole DoT
Pi-hole Docker image from [Pi-hole](https://pi-hole.net) with unboud DNS over TLS for several providers

The unbound daemon runs in 0.0.0.0#5353 and Pi Hole can use it as upstream DNS.

# Scheme
`Local Client > (Local Clear DNS) -> Pi-hole > (Host Internal Clear DNS) -> unbound > (Internet DoT) -> DoT DNS provider`

# Pi-Hole configuration
You can use all the environment configuration from the original docker [Pi-hole](https://hub.docker.com/r/pihole/pihole/)

The enhancement is the the unbound daemon configured to use DNS over TLS (DoT)

# DoT unbound upstream configuration
The unbound DoT upstream can be configure by the **DOT_UPSTREAM** environment variable
* cloudflare
* google
* cloud9
* cleanbrowsing

Additionally the **DOT_UPSTREAM** environment variable can be defined by one or several user defined upstream DNS IP
* 8.4.4.8
* 1.1.1.1,8.8.8.8
* 8.8.8.8,1.1.1.1,9.9.9.9

# Pi-hole upstream configuration
To use the local unbound daemon DoT DNS upstream server, it can be defined by **DNS1=127.0.01#5353** and **DNS2=no** environment variables


# Docker run test example
In this example is used **DOT_UPSTREAM**,**DNS1** and **DNS2**

`docker run --init -d --restart=always --network=eraser --dns 127.0.0.1 --ip 192.168.0.140 -e ServerIP="192.168.0.140" --hostname pihole -e VIRTUAL_HOST="pihole" --name="pihole" -e "WEBPASSWORD=admin" -e "TZ=Europe/Madrid" -e "DOT_UPSTREAM=1.1.1.1,1.0.0.1" -e "DNS1=127.0.0.1#5353" -e "DNS2=no"--cap-add=NET_ADMIN --cap-add=SYS_NICE -v /opt/docker/pihole/dnsmasq.d:/etc/dnsmasq.d/ -v /opt/docker/pihole/pihole:/etc/pihole juampe/pihole-dot`


Thanks to https://github.com/pi-hole/docker-pi-hole
Thanks to https://github.com/stafwag/docker-stafwag-unbound
