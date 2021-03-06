#!/bin/bash

sed -i "s/REPLACEIP/$FORWARDIP/g" /etc/bind/named.conf.options
sed -i "s/REPLACEIP/$IP/g" /etc/bind/zones/nintendo.net
sed -i "s/REPLACEIP/$IP/g" /etc/bind/zones/nintendowifi.net
sed -i "s/REPLACEIP/$IP/g" /etc/bind/zones/90dns.test
sed -i "s/REPLACEIP/$IP/g" /etc/bind/zones/generic
named -c /etc/bind/named.conf
nginx -g "daemon off;"