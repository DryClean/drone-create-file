FROM alpine:3.4

RUN apk update && \
  apk add \
    ca-certificates \
    git \
    bash \
    nodejs && \
  rm -rf \
    /var/cache/apk/*

WORKDIR /node

ADD drone-write-file /node/
ADD run.js /node/

RUN chmod +x /node/drone-write-file

ENTRYPOINT ["/node/drone-write-file"]
