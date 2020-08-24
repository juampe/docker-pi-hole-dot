# pihole
Pi-hole Docker image from [Pi-hole](https://pi-hole.net) with unboud DNS over TLS for several providers
The unbound daemon runs in 0.0.0.0#5353 and Pi Hole can use ase upstream DNS.

# DoT configuration
You can use all the environment configuration from the original docker [Pi-hole](https://hub.docker.com/r/pihole/pihole/)
The enhancement is the the unbound daemon configured to use DNS over TLS (DoT)
The unbound DoT upstream can be configure by the **DOT_UPSTREAM** environment variable
* cloudflare
* google
* cloud9

The **DOT_UPSTREAM** environment variable can be defined by one or several user defined upstream DNS
* 8.4.4.8
* 1.1.1.1,8.8.8.8
* 8.8.8.8,1.1.1.1,9.9.9.9

# Pi-hole configuration
To use the unbound DoT and the configured upstream server, you need to go to the section "Pi-hole>Settings>DNS>Upstream DNS Server" and set "Custom 1 (IPv4)" to **127.0.0.1#5353**

Thanks to  https://github.com/stafwag/docker-stafwag-unbound
