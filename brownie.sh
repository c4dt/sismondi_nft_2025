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
  if docker ps &> /dev/null; then
    docker pull ghcr.io/c4dt/brownie:latest
  fi
  if [[ ! -d ~/.solcx && $( uname -m ) = "x86_64" ]]; then
    mkdir ~/.solcx
    curl https://drive.switch.ch/index.php/s/ymTNyKzJ2gigOPU/download > ~/.solcx/solc-v0.8.23
  fi
  brownie_wrap networks import scripts/sepolia.network
  touch $UPDATED
fi
brownie_wrap "$@"
