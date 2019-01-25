#!/bin/sh

_step_counter=0
step() {
	_step_counter=$(( _step_counter + 1 ))
	printf '\n\033[1;36m%d) %s\033[0m\n' $_step_counter "$@" >&2  # bold cyan
}

if [ "$1" = "start" ]; then
	wget https://raw.githubusercontent.com/alpinelinux/alpine-make-vm-image/v0.4.0/alpine-make-vm-image && \
		echo '5fb3270e0d665e51b908e1755b40e9c9156917c0  alpine-make-vm-image' | sha1sum -c || \
		exit 1
	chmod +x alpine-make-vm-image
	./alpine-make-vm-image \
	--image-format qcow2 \
	--image-size 2G \
	alpine-virthardened-$(date +%Y-%m-%d).qcow2 \
	/configure.sh config
	
	sleep 60000
else
	step 'Set up timezone'
	setup-timezone -z Europe/Bucharest
fi
