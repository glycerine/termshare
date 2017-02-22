FROM alpine:3.4

ENTRYPOINT ["/termshare", "-d"]

RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk

USER 10001

ENV PORT=8080

COPY bin/termshare-linux-amd64 /termshare

