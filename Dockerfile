FROM python:3.13-alpine AS build-stage
LABEL maintainer="mail@zveronline.ru"

WORKDIR /app
ADD https://github.com/Flowseal/tg-ws-proxy/archive/refs/tags/v1.6.5.zip /app/proxy.zip
RUN apk add --no-cache -U unzip gcc musl-dev linux-headers \
    && unzip proxy.zip && rm proxy.zip && mv tg-ws-proxy-*/* ./
RUN pip install --upgrade pip \
    && pip install -e .

FROM python:3.13-alpine AS production-stage
LABEL maintainer="mail@zveronline.ru"

WORKDIR /app
COPY --from=build-stage /app /app
COPY --from=build-stage /usr/local/lib/python3.10/site-packages/ /usr/local/lib/python3.10/site-packages/

EXPOSE 1443
CMD tg-ws-proxy --port 1443 --host 0.0.0.0 --fake-tls-domain www.citilink.ru