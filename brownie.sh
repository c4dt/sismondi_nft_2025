#!/bin/bash

docker run --rm --platform linux/amd64 -v $PWD:/sismondi c4dt/brownie:latest "$@"
