# Build image:
# docker build --tag certbot:latest -f Dockerfile .
#
# Run interactively, for debugging and development:
# docker run -i -t certbot:latest bash
# 
# Tag and push to Docker hub:
# docker tag certbot:latest antonymarion/certbot:latest
# docker push antonymarion/certbot:latest

FROM python:2-alpine

ENTRYPOINT [ "/bin/sh", "-c" ]
EXPOSE 80 443

# VOLUME /etc/letsencrypt /var/lib/letsencrypt

WORKDIR /opt/certbot

COPY CHANGES.rst README.rst setup.py src/
COPY acme src/acme
COPY certbot src/certbot

RUN apk add --no-cache --virtual .certbot-deps \
        libffi \
        openssl \
        ca-certificates \
        binutils \
        bash
RUN apk add --no-cache --virtual .build-deps \
        gcc \
        linux-headers \
        openssl-dev \
        musl-dev \
        libffi-dev \
    && pip install --no-cache-dir \
        --editable /opt/certbot/src/acme \
        --editable /opt/certbot/src \
    && apk del .build-deps
