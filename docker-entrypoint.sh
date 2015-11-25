#!/bin/bash
set -e

function setConfiguration() {
  KEY=$1
  VALUE=$2
  sed -i "s/^$KEY = .*$/$KEY = $VALUE/g" /etc/graphite/local_settings.py
}

if [ -n "${CLUSTER_SERVERS+1}" ]; then
  setConfiguration "CLUSTER_SERVERS" "$CLUSTER_SERVERS"
fi

if [ -n "${CARBONLINK_HOSTS+1}" ]; then
  setConfiguration "CARBONLINK_HOSTS" "$CARBONLINK_HOSTS"
fi

if [ "$1" = 'graphite-web' ]; then
    exec /usr/sbin/apache2ctl -D FOREGROUND
fi

exec "$@"
