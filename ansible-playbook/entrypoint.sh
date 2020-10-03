#!/bin/bash

set -ex

git clone "${PLAYBOOK_REPO}" /ansible/playbooks
ansible-playbook playbook.yml
