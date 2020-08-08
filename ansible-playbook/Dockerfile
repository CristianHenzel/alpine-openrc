FROM alpine:latest
ARG VERSION=2.9.11

RUN     apk add --no-cache \
                curl \
                git \
                openssh-client \
                python3 \
                py3-boto \
                py3-dateutil \
                py3-httplib2 \
                py3-jinja2 \
                py3-paramiko \
                py3-pip \
                py3-setuptools \
                py3-yaml \
                tar && \
        rm -rf /var/cache/apk/*

RUN     ln -sf /usr/bin/python3 /usr/bin/python && \
        mkdir /etc/ansible/ /ansible && \
        echo "[local]" >> /etc/ansible/hosts && \
        echo "localhost" >> /etc/ansible/hosts

RUN     curl -fsSL https://releases.ansible.com/ansible/ansible-${VERSION}.tar.gz -o ansible.tar.gz && \
        tar -xzf ansible.tar.gz -C ansible --strip-components 1 && \
        rm -rf ansible.tar.gz /ansible/docs /ansible/examples /ansible/packaging

RUN     mkdir -p /ansible/playbooks
WORKDIR /ansible/playbooks

ADD	./entrypoint.sh /bin/entrypoint
RUN	chmod +x /bin/entrypoint

ENV ANSIBLE_GATHERING smart
ENV ANSIBLE_HOST_KEY_CHECKING false
ENV ANSIBLE_INVENTORY=/ansible/playbooks/hosts
ENV ANSIBLE_RETRY_FILES_ENABLED false
ENV ANSIBLE_ROLES_PATH /ansible/playbooks/roles
ENV ANSIBLE_SSH_PIPELINING True
ENV PATH /ansible/bin:$PATH
ENV PYTHONPATH /ansible/lib

ENTRYPOINT ["entrypoint"]
