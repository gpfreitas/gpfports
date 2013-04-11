#!/usr/bin/env sh

cat ~/.ssh/id_rsa.pub | ssh "$1"@"$2" "mkdir -m 700 -p ~/.ssh && cat >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"

