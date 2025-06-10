FROM node:22-alpine

LABEL author="Marcelo Munhoz <me@marcelomunhoz.com>" \
      date_created="2025-06-10"

WORKDIR /app

COPY ["./frontend/package.json", "./frontend/yarn.lock", "./"]

RUN apk add exa && \
    yarn global add @quasar/cli && \
    yarn autoclean && yarn cache clean && \
    rm -rf /var/cache/apk/* /tmp/* /var/tmp/* /usr/share/man

COPY frontend/ .