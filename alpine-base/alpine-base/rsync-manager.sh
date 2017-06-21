#!/bin/sh

PIDFILE=/var/run/rsync-manager.pid

_pid1env() {
	xargs -n 1 -0 < /proc/1/environ | grep "^$2=" | cut -d= -f2
}

RSYNC_SERVER=$(_pid1env RSYNC_SERVER)
RSYNC_FOLDERS=$(_pid1env RSYNC_FOLDERS)
RSYNC_STIME=$(_pid1env RSYNC_STIME)

if [ "$1" = "client" ]; then
	# Running in client mode
	while true; do
		for dir in ${RSYNC_FOLDERS//,/}; do
			if [ -n "${RSYNC_OUTPUT}" ]; then
				rsync -aEim rsync://rsync-manager/rsync/data/$dir /rsync/data/
			fi
			sleep ${RSYNC_STIME}
		done
	done
fi

if [ "$1" = "start" ]; then
	if [ "${RSYNC_SERVER}" != "true" ]; then
		setsid /var/alpine-base/rsync-manager.sh client >/dev/null 2>&1 < /dev/null &
		echo $! > ${PIDFILE}
	fi
fi

exit
