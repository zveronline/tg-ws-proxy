https://github.com/Flowseal/tg-ws-proxy

``` docker-compose.yaml
services:
  tg-ws-proxy:
    image: ghcr.io/zveronline/tg-ws-proxy:latest
    restart: always
    ports:
      - "1080:1080"
    networks:
      - dockerbr
```
