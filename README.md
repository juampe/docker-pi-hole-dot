
# Pi-hole DoT

## About

🐳 Pi-hole Docker image from [Pi-hole](https://pi-hole.net) with Unbound DNS over TLS for several providers

The unbound daemon runs in 0.0.0.0#5353 and Pi Hole can use it as upstream DNS.

## Multi-platform image

* Supported platforms:
  * linux/amd64
  * linux/arm/v7
  * linux/arm64/v8

## Workflow scheme

`Local Client > (Local Clear DNS) -> Pi-hole > (Host Internal Clear DNS) -> Unbound > (Internet DoT) -> DoT DNS provider`

<p align="center"><a href="https://pi-hole.net/2018/06/09/ftldns-and-unbound-combined-for-your-own-all-around-dns-solution/#page-content" target="_blank"><img height="128" src="https://pi-hole.net/wp-content/uploads/2018/05/pihole-ftldns-unbound-600x400.png"></a></p>

## Pi-Hole configuration

💡 You can use all the environment configuration from the base docker image [Pi-hole](https://hub.docker.com/r/pihole/pihole/)

The enhancement is the the unbound daemon configured to use DNS over TLS (DoT)

## DoT unbound upstream configuration

The unbound DoT upstream can be configure by the **DOT_UPSTREAM** environment variable

* cloudflare
* google
* cloud9
* cleanbrowsing

Additionally the **DOT_UPSTREAM** environment variable can be defined by one or several user defined upstream DNS IP

* 8.4.4.8
* 1.1.1.1,8.8.8.8
* 8.8.8.8,1.1.1.1,9.9.9.9

## Pi-hole upstream configuration

To use the local unbound daemon DoT DNS upstream server, it can be defined by **DNS1=127.0.01#5353** and **DNS2=no** environment variables

## Docker run test example

In this example is used **DOT_UPSTREAM**, **DNS1** and **DNS2** environment variables

```bash
docker run --init -d --restart=always --network=eraser --dns 127.0.0.1 --ip 192.168.0.2 -e ServerIP="192.168.0.2" --hostname pihole -e VIRTUAL_HOST="pihole" --name="pihole" -e "WEBPASSWORD=admin" -e "TZ=Europe/Madrid" -e "DOT_UPSTREAM=1.1.1.1,1.0.0.1" -e "DNS1=127.0.0.1#5353" -e "DNS2=no"--cap-add=NET_ADMIN --cap-add=SYS_NICE -v /opt/docker/pihole/dnsmasq.d:/etc/dnsmasq.d/ -v /opt/docker/pihole/pihole:/etc/pihole juampe/pihole-dot
```

## HowTo build

```bash
git clone <https://github.com/juampe/docker-pi-hole-dot.git>
docker buildx build --push --platform linux/arm/v7,linux/arm64/v8,linux/amd64 --tag juampe/pihole-dot:latest .
```

## Thanks

Thanks to <https://github.com/pi-hole/docker-pi-hole>

Thanks to <https://github.com/stafwag/docker-stafwag-unbound>
