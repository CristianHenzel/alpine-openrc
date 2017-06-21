FROM alpine:3.6

RUN /sbin/apk add --no-cache curl dcron openrc rsync

COPY ./alpine-base /var/alpine-base

RUN /bin/sed -i 's/#rc_sys=""/rc_sys="lxc"/g' /etc/rc.conf &&\
    /bin/sed -i 's/^#\(rc_logger="YES"\)$/\1/' /etc/rc.conf &&\
    /bin/sed -i '/tty/d' /etc/inittab &&\
    /bin/sed -i 's/hostname $opts/# hostname $opts/g' /etc/init.d/hostname &&\
    /bin/sed -i 's/mount -t tmpfs/# mount -t tmpfs/g' /lib/rc/sh/init.sh &&\
    /bin/sed -i 's/cgroup_add_service /# cgroup_add_service /g' /lib/rc/sh/openrc-run.sh &&\
    /bin/echo 'rc_provide="loopback net"' >> /etc/rc.conf &&\
    /bin/ln -sf /var/alpine-base/rsyncd /etc/init.d/rsyncd &&\
    /bin/chmod +x /var/alpine-base/rsyncd &&\
    /bin/ln -sf /var/alpine-base/rsyncd.conf /etc/rsyncd.conf &&\
    /sbin/rc-update add dcron &&\
    /sbin/rc-update add rsyncd

CMD ["/sbin/init"]
