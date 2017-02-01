FROM golang:onbuild

RUN for GOOS in darwin linux; do \
      for GOARCH in 386 amd64; do \
        go build -v -o termshare-$GOOS-$GOARCH; \
      done; \
    done ; \
    ls -la /go/src/app/termshare-*

