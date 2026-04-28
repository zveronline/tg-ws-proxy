FROM python:3.13-alpine
LABEL maintainer="mail@zveronline.ru"

WORKDIR /app
ADD https://github.com/Flowseal/tg-ws-proxy/archive/refs/tags/v1.6.5.zip /app/proxy.zip
RUN apk add --no-cache -U unzip gcc musl-dev linux-headers \
    && unzip proxy.zip && rm proxy.zip && mv tg-ws-proxy-*/* ./
RUN pip install --upgrade pip \
    && pip install -e .

EXPOSE 1443
CMD tg-ws-proxy --port 1443 --host 0.0.0.0 --secret a2ec93d4ec4ba414ae9afacaf03b79e6 --fake-tls-domain www.citilink.ru