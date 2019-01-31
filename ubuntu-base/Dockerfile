ARG	distribution=xenial

FROM	ubuntu:$distribution

ENV	DEBIAN_FRONTEND "noninteractive"

RUN	/usr/bin/apt-get update && \
	/usr/bin/apt-get install -y --no-install-recommends \
		cron \
		curl \
		nano \
		supervisor \
		wget

CMD	["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
