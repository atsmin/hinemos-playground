#!/bin/bash

# Start hinemos_web
/opt/hinemos_web/bin/tomcat_start.sh -Wq
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start hinemos_web: $status"
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
