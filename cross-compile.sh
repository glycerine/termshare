#!/bin/bash -x

DIR=$(pwd)
PKG=$(go list | head -1)

docker run --rm -it -v ${DIR}:/go/src/${PKG}:Z -w /go/src/${PKG} golang:1.8-onbuild sh -c '
go get -v .
for GOOS in darwin linux ; do
  echo "Building $GOOS-amd64"
  CGO_ENABLED=0 GOOS=${GOOS} GOARCH=amd64 go build -ldflags ''-w'' -o bin/'$(basename ${DIR})'-$GOOS-amd64
done
'
