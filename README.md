# pihole
Pi-hole Docker image from pi-hole.net with unboud DNS over TLS for several providers

You can use all the environment configuration from the original docker Pi-hole 
The enhancement is the the unbound daemon configured to use DNS over TLS (DoT)
The unbound DoT upstream can be configure by the **DOT_UPSTREAM** environment variable
* cloudflare
* google
* cloud9

The **DOT_UPSTREAM** environment variable can be defined by one or several user defined upstream DNS
* 8.4.4.8
* 1.1.1.1,8.8.8.8
* 8.8.8.8,1.1.1.1,9.9.9.9


Thanks to https://github.com/stafwag and https://github.com/stafwag/docker-stafwag-unbound
