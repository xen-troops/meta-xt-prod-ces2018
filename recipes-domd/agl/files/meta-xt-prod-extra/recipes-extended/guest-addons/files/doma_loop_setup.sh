#!/bin/sh -x

# Android partitions
# system   - xvda1
# vendor   - xvdb1
# misc     - xvdc1
# userdata - xvdd1

losetup /dev/loop0 system.raw
losetup /dev/loop1 vendor.raw
losetup /dev/loop2 misc.raw
losetup /dev/loop3 userdata.raw

