#!/bin/bash

if docker ps &> /dev/null; then
  docker run --rm --platform linux/amd64 -v $PWD:/sismondi \
    --entrypoint=/usr/local/bin/python ghcr.io/c4dt/brownie:latest scripts/images.py
else
  python scripts/images.py
fi
