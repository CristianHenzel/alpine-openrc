FROM alpine:3.8

RUN /sbin/apk add --no-cache curl dcron openrc

RUN /bin/sed -i 's/#rc_sys=""/rc_sys="lxc"/g' /etc/rc.conf &&\
    /bin/sed -i 's/^#\(rc_logger="YES"\)$/\1/' /etc/rc.conf &&\
    /bin/sed -i '/tty/d' /etc/inittab &&\
    /bin/sed -i 's/hostname $opts/# hostname $opts/g' /etc/init.d/hostname &&\
    /bin/sed -i 's/mount -t tmpfs/# mount -t tmpfs/g' /lib/rc/sh/init.sh &&\
    /bin/sed -i 's/cgroup_add_service /# cgroup_add_service /g' /lib/rc/sh/openrc-run.sh &&\
    /bin/echo 'rc_provide="loopback net"' >> /etc/rc.conf &&\
    /sbin/rc-update add dcron

CMD ["/sbin/init"]
