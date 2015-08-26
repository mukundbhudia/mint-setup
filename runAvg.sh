#!/bin/bash
# AVG antivirus setup
/etc/init.d/avgd start
avgupdate
avgscan --ignerrors -aPcijk -r /tmp/avgscan.log /
/etc/init.d/avgd stop
