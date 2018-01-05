#!/bin/sh
### BEGIN INIT INFO
# Provides: vcpu-pin
# Required-Start:
# Required-Stop:
# Default-Start:     S
# Default-Stop:
### END INIT INFO

# Force all VCPUs of Domain-0 to only run on PCPUs from 4 to 7 (A53 cores)
echo "Pinning Domain-0 VCPUs"
xl vcpu-pin Domain-0 all 4-7
