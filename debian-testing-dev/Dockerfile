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

CMD	["/sbin/openrc"]
