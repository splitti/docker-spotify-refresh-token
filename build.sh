#!/bin/bash

## Single platform
#docker build -t splitti/docker-spotify-refresh-token .

## Cross platform with buildx
docker buildx build \
    --platform linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64 \
    -t splitti/docker-spotify-refresh-token\
    --push \
    .
