# docker-certbot
Interactive (bash) certbot docker image.

Updated previous image with latests sources for ACMEv2 support

Docker image: https://hub.docker.com/r/antonymarion/certbot/

Based on: https://hub.docker.com/r/certbot/certbot/

Certbot documentation: https://certbot.eff.org/docs/using.html#certbot-commands

Quickstart
---

```
docker run -i -t stianovrevage/certbot:latest bash
bash-4.3#
bash-4.3# certbot
...certbot output
```

Why?
---

The official certbot/certbot Docker image does not enable you to run a shell inside
the container. This makes it a pain to work with if you are testing commands and especially
on Windows where volume-mounts in Docker are somewhat flaky/difficult.
