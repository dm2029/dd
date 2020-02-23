#!/bin/sh

# get system resolvers
echo resolver $(awk 'BEGIN{ORS=" "} $1=="nameserver" {print $2}' /etc/resolv.conf) " ipv6=off;" > /etc/nginx/resolver.conf
# generate configs
# cat /etc/confd/conf.d/global_config/stands.yml /etc/confd/conf.d/global_config/config.yml > /etc/confd/conf.d/result.yml
# confd -onetime -backend file -file /etc/confd/conf.d/result.yml

# start nginx foreground
nginx -g 'daemon off;'