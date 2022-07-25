#!/usr/bin/env sh

set -e

docker build -t mjbogusz/cpp-ci:focal . --build-arg NO_APT_CACHE=$(date +%s)
docker tag mjbogusz/cpp-ci:focal mjbogusz/cpp-ci:latest
docker push mjbogusz/cpp-ci:focal
docker push mjbogusz/cpp-ci:latest
