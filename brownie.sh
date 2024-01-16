#!/bin/bash
docker run --rm --platform linux/amd64 -v $PWD:/sismondi ghcr.io/c4dt/brownie:latest "$@"