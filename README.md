https://github.com/Flowseal/tg-ws-proxy

``` docker-compose.yaml
services:
  tg-ws-proxy:
    image: ghcr.io/zveronline/tg-ws-proxy:latest
    restart: always
    ports:
      - '1443:1443/tcp'
    command: tg-ws-proxy --port 1443 --host 0.0.0.0 --fake-tls-domain www.citilink.ru
```
