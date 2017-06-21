#!/bin/sh

PIDFILE=/var/run/rsync-manager.pid

_pidenv() {
	xargs -n 1 -0 < /proc/${1:-self}/environ | grep "^$2=" | cut -d= -f2
}

RSYNC_SERVER=$(_pidenv 1 RSYNC_SERVER)
RSYNC_FOLDERS=$(_pidenv 1 RSYNC_FOLDERS)
RSYNC_STIME=$(_pidenv 1 RSYNC_STIME)

if [ "$1" = "client" ]; then
	# Running in client mode
	while true; do
		for dir in ${RSYNC_FOLDERS//,/}; do
			RSYNC_OUTPUT=$(rsync -aEim rsync://rsync-manager/rsync/meta/$dir /rsync/meta/)
			if [ $? -eq 0 ]; then
				if [ -n "${RSYNC_OUTPUT}" ]; then
					rsync -aEim rsync://rsync-manager/rsync/data/$dir /rsync/data/
				fi
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
