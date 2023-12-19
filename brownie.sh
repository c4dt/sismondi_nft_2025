#!/bin/bash

if docker ps &> /dev/null; then
  docker run --rm --platform linux/amd64 -v $PWD:/sismondi ghcr.io/c4dt/brownie:latest "$@"
else
  brownie "$@"
fi
