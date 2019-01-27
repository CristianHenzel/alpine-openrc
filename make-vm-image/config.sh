#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

_step_counter=0
step() {
	_step_counter=$(( _step_counter + 1 ))
	printf '\n\033[1;36m%d) %s\033[0m\n' $_step_counter "$@" >&2  # bold cyan
}

step "Installing dependencies"
apt-get update && apt-get -y install debootstrap libguestfs-tools linux-image-amd64

step "Installing base OS"
rm -rf /download/*
mkdir /download/root
debootstrap testing /download/root http://deb.debian.org/debian/

step "Done"
sleep infinity
