FROM	hecristi/alpine-base

RUN	/sbin/apk add --no-cache nginx
RUN	wget https://raw.githubusercontent.com/alpinelinux/alpine-make-vm-image/v0.4.0/alpine-make-vm-image &&
	echo '5fb3270e0d665e51b908e1755b40e9c9156917c0  alpine-make-vm-image' | sha1sum -c || \
	exit 1
COPY	config.sh /usr/local/bin/config.sh

RUN	/sbin/rc-update add nginx
