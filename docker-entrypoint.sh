#!/bin/bash
set -e

if [ "$1" = 'graphite-web' ]; then
    exec /usr/sbin/apache2ctl -D FOREGROUND
fi

exec "$@"
