# raspberrypi_exporter
Prometheus exporter for Raspberry Pi metrics

## Prerequisites

- Prometheus node_exporter must be installed
- node_exporter ```--collector.textfile.directory``` must be set to ```/var/lib/node_exporter/textfile_collector```
- ```curl``` must be installed
- ```vcgencmd``` must be installed (default in Raspbian)

## Usage

Installation

    $ curl -fsSL "https://raw.githubusercontent.com/fahlke/raspberrypi_exporter/master/installer.sh" | sudo bash

Check if the service is running

    $ systemctl status raspberrypi_exporter.timer
    ● raspberrypi_exporter.timer - Timer for the Raspberry Pi Prometheus exporter
       Loaded: loaded (/etc/systemd/system/raspberrypi_exporter.timer; enabled; vendor preset: enabled)
       Active: active (waiting) since Mon 2017-12-18 20:54:40 UTC; 5min ago

Check if the metrics are written to disk

    $ grep -E "^rpi" /var/lib/node_exporter/textfile_collector/raspberrypi-metrics.prom
    rpi_temperature_cpu 53.2
    rpi_temperature_bcm2835 53.7
    rpi_frequency_arm 1200000000
    ...

Uninstallation

    $ curl -fsSL "https://raw.githubusercontent.com/fahlke/raspberrypi_exporter/master/uninstaller.sh" | sudo bash

## References

List of vcgencmd commands and options:

- [RPI vcgencmd usage](https://www.elinux.org/RPI_vcgencmd_usage)
- [vcgencmd Commands](https://github.com/nezticle/RaspberryPi-BuildRoot/wiki/VideoCore-Tools#vcgencmd-commands)
