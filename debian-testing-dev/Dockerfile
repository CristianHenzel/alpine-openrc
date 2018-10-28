FROM	debian:testing

RUN	apt-get update && \
	apt-get install -y --no-install-recommends \
		docker-compose \
		docker.io \
		git \
		golang \
		nano \
		openssh-server \
		supervisor && \
	rm -rf /var/lib/apt/lists/*

RUN	mkdir /run/sshd

ADD	./debian-testing-dev/supervisor/* /etc/supervisor/conf.d/

CMD	["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
