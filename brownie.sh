#!/bin/bash

brownie_wrap(){
if docker ps &> /dev/null; then
  docker run --rm --platform linux/amd64 -v $PWD:/sismondi ghcr.io/c4dt/brownie:latest "$@"
else
  brownie "$@"
fi
}

UPDATED=.updated
if [[ ! -f $UPDATED ]]; then
  docker pull ghcr.io/c4dt/brownie:latest
  brownie_wrap networks import scripts/sepolia.network
  touch $UPDATED
fi
brownie_wrap "$@"
