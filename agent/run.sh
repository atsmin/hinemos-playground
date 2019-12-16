#!/bin/bash

# Start hinemos_agent
/etc/rc.d/init.d/hinemos_agent start
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start hinemos_agent: $status"
  exit $status
fi

# Start snmpd
/usr/sbin/snmpd -LS0-6d
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start snmpd: $status"
  exit $status
fi

# Start rsyslog
/usr/sbin/rsyslogd
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start rsyslog: $status"
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
