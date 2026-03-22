FROM python:3.12
LABEL maintainer="mail@zveronline.ru"

WORKDIR /app
ADD https://github.com/Flowseal/tg-ws-proxy/archive/refs/tags/v1.2.1.zip /app/proxy.zip
RUN apk add --no-cache -U unzip \
    && unzip proxy.zip && rm proxy.zip && mv tg-ws-proxy-*/* ./
RUN pip install --upgrade pip \
    && pip install -e .

EXPOSE 1080
CMD ["tg-ws-proxy --port 1080 --host 0.0.0.0 -v"]