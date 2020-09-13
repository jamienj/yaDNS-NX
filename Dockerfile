FROM nginx

ENV FORWARDIP="8.8.8.8"
ENV IP="192.68.1.20"

RUN set -x \
	&& apt-get update \
	&& apt-get install --no-install-recommends --no-install-suggests -y bind9
	
COPY data/nginx.conf /etc/nginx/nginx.conf	
COPY data/named.conf.options /etc/bind/named.conf.options
COPY data/zones/90dns.test /etc/bind/zones/90dns.test
COPY data/zones/generic /etc/bind/zones/generic
COPY data/zones/nintendo.net /etc/bind/zones/nintendo.net
COPY data/zones/nintendowifi.net /etc/bind/zones/nintendowifi.net
COPY docker-entrypoint.sh /

RUN chmod +x /docker-entrypoint.sh
RUN ln -s usr/local/bin/docker-entrypoint.sh /entrypoint.sh # backwards compat

EXPOSE 53
EXPOSE 53/udp
EXPOSE 80/tcp
EXPOSE 80/udp

ENTRYPOINT ["docker-entrypoint.sh"]

CMD [""]