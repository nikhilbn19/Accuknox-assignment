# Dockerfile
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    fortune-mod fortunes cowsay netcat-openbsd \
 && ln -s /usr/games/fortune /usr/bin/fortune \
 && ln -s /usr/games/cowsay /usr/bin/cowsay \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*


WORKDIR /app
COPY wisecow.sh /app/wisecow.sh
RUN chmod +x /app/wisecow.sh

EXPOSE 4499
CMD ["./wisecow.sh"]
