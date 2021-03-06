#!/bin/bash
#chkconfig:2345 80 90
#description: Trigger kdump as a service to reduce rate of framework can't detect vm after kdump

#
# Off and del itself firstly to void trigger kdump forever
#
chkconfig kdump_trigger_service.sh off
chkconfig --del kdump_trigger_service.sh
if [ $? -ne 0 ]
then
	exit 1
fi

#
# If NO sleep duration, kdump trigger works well, will trigger kdump forever, unknow issue.
# After reboot, kdump_trigger_service needs time to up
#
sleep 60

#
# Trigger kdump
# Needn't check execution result, as will be check in next step
#
echo c > /proc/sysrq-trigger
