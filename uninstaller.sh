#!/bin/bash

# check if run as superuser
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

systemctl stop raspberrypi_exporter.timer
systemctl disable raspberrypi_exporter.timer
systemctl daemon-reload

rm -f "/usr/local/sbin/raspberrypi_exporter"

rm -f "/etc/systemd/system/raspberrypi_exporter.service"
rm -f "/etc/systemd/system/raspberrypi_exporter.timer"

rm -f "/var/lib/node_exporter/textfile_collector/raspberrypi-metrics.prom"