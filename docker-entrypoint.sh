#!/bin/bash
set -e

if [ "$1" = 'couchdb' ]; then
  export PRIVATE_KEY=`python -c 'import os, binascii, sys; sys.stdout.write(binascii.b2a_hex(os.urandom(30)))'`
  sed -e "s/@SECRETREPLACE@/$PRIVATE_KEY/" -e "s/@ADMINHASH@/$ADMINHASH/" /local.ini > /usr/local/etc/couchdb/local.ini
  sed -i "s/@SECRETREPLACE@/$PRIVATE_KEY/" /couchdb_updater.py
  sed -i "s/@SECRETREPLACE@/$PRIVATE_KEY/" /couchdb_alarm_daemon.py
fi

exec /entrypoint.sh "$@"
