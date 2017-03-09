#!/bin/bash

set -e

if [ "$RSYSLOG_REMOTE_SERVER" != "" ]
then
  echo "*.* @$RSYSLOG_REMOTE_SERVER:514" > /etc/rsyslog.d/22-remote.conf
fi

service rsyslog start

service unbound start

/usr/sbin/opensips -M 8 -m 256 -F -f /etc/opensips/opensips.cfg
