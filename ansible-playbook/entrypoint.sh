#!/bin/bash

set -ex

git clone "${PLAYBOOK_REPO}" /ansible/playbooks
ansible-playbook -e "ansible_user=${ANSIBLE_USER} ansible_pass=${ANSIBLE_PASS}" playbook.yml
