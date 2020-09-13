FROM nginx

ENV FORWARDIP="8.8.8.8"
ENV IP="192.68.1.20"

COPY nginx.conf /etc/nginx/nginx.conf

RUN set -x \
	&& apt-get update \
	&& apt-get install --no-install-recommends --no-install-suggests -y bind9
	
COPY data/named.conf.options /etc/bind/named.conf.options
COPY data/nintendo.zone /etc/bind/zones/nintendo.zone
COPY data/nintendowifi.zone /etc/bind/zones/nintendowifi.zone
COPY data/90dns.test /etc/bind/zones/90dns.test
COPY data/generic /etc/bind/zones/generic
COPY docker-entrypoint.sh /usr/local/bin/

RUN chmod +x /docker-entrypoint.sh
RUN ln -s usr/local/bin/docker-entrypoint.sh /entrypoint.sh # backwards compat

EXPOSE 53
EXPOSE 53/udp
EXPOSE 80/tcp
EXPOSE 80/udp

ENTRYPOINT ["docker-entrypoint.sh"]

CMD [""]