#!/bin/bash

# Start postgres
su hinemos -c '/opt/hinemos/postgresql/bin/pg_ctl start -w -t 90 -s -D /opt/hinemos/var/data -l /opt/hinemos/var/log/postgresql.log'
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start postgres: $status"
  exit $status
fi

# Start hinemos_manager
/opt/hinemos/bin/jvm_start.sh -W
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start hinemos_manager: $status"
  exit $status
fi

# Start snmpd
/usr/sbin/snmpd -LS0-6d
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start snmpd: $status"
  exit $status
fi

while sleep 60; do
  ps aux |grep hinemos |grep -q -v grep
  STATUS=$?
  if [ $STATUS -ne 0]; then
    echo "hinemos processes has already exited."
    exit 1
  fi
done
