#!/usr/bin/env bash
IMAGE=registry.access.redhat.com/rhscl/nginx-112-rhel7
if [ -d dist/nginx-cfg ]; then
  rm -rf dist/nginx-cfg dist/nginx-default-cfg
fi
cp -r nginx/. dist
s2i build . $IMAGE ally-nginx-test -c --context-dir dist
docker run --rm -it -e RUNME=/usr/libexec/s2i/run -p 8080:8080 ally-nginx-test /bin/sh
