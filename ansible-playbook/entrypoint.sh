#!/bin/sh

git clone "${PLAYBOOK_REPO}" /ansible/playbooks && \
ansible-playbook playbook.yml
