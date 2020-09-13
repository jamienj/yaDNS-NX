# yaDNS-NX
A nginx+bind9 server to allow the Nintendo Switch to connect without having internet.
Also it can be used to DNS block nintendo services.

Upaded to be more in line with 90DNS - https://gitlab.com/a/90dns

Usage
----------
- Get the image with `docker pull luiscassih/yadns-nx`
- Run `docker run --name yadns-nx -d -p 80:80 -p 53:53 -p 53:53/udp -e 8.8.8.8 -e FORWARDIP=8.8.8.8 -e IP=192.168.1.20 luiscassih/yadns-nx` where 192.168.1.27 must be your computer local IP address. You can check yours with a ipconfig, ifconfig, ip address, depending on your OS.

----------

## Parameters
| Parameter | Function |
| :----: | --- |
| `-e FORWARDIP=8.8.8.8` | for Bind9 forward DNS - Forwards all unknown to up stream DNS |
| `-e IP=192.168.1.20` | for DockerIP - must be your computer local IP address |

Notes
----------
- Check your firewall settings if you can't connect to the DNS.
- Check also if you don't have other services on ports 80 and 53.

Customization and future
----------
You can customize with your own nginx/named config files.
e.g. Run `docker run --name "yadns-nx" -v /home/yourname/nginx.conf:/etc/nginx/nginx.conf -d -p 80:80 -p 53:53 -p 53:53/udp yadns-nx 192.168.1.27` in order to customize with your own nginx.conf file.

Note: This server resolves `*.nintendo.net` and `*.nintendowifi.net` addresses with a `200 OK` and `X-Organization Nintendo header`