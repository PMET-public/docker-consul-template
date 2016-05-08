#!/usr/bin/env bash

# stop on errors
set -e
# turn on debugging
set -x

exec /consul-template/consul-template -consul ${CONSUL_IP:-127.0.0.1}:8500 -config "${CONFIG_FILE:-/etc/consul-template}"
