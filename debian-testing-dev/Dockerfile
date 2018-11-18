FROM	debian:testing

RUN	apt-get update && \
	apt-get install -y --no-install-recommends \
		docker-compose \
		docker.io \
		gcc-mingw-w64 \
		gcc-multilib \
		git \
		golang \
		nano \
		openssh-server \
		python-pip \
		sudo \
		supervisor \
		upx-ucl \
		win-iconv-mingw-w64-dev && \
	rm -rf /var/lib/apt/lists/*

RUN	pip install git-remote-dropbox && \
	mkdir -p /root/.config/git /run/sshd /out && \
	useradd -m -p '$6$ays6WfRV0q$f2V8on1bcGRa78/0GGl6ObLjQO3AXt.fvSpa1PB9QnmVPaKiPgi4MPPviFaH/tgUmWtA3dASBeq/0Uz40QlfQ.' -s "/bin/bash" -d "/work" admin && \
	echo "admin ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/admin && \
	chmod 777 /out && \
	echo "{\n\t\"default\": \"aaa\"\n}" > /root/.config/git/git-remote-dropbox.json

ADD	./debian-testing-dev/supervisor/* /etc/supervisor/conf.d/
ADD	./debian-testing-dev/bin/* /usr/local/bin/

WORKDIR /work

CMD	["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
