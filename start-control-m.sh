#!/bin/sh
# Start Control-M Services
#
# 20240207 jah - developed and tested on 9.0.21.200
# 20241017 jah - single control-m user/directory conversion

su - control-m -c "startdb"
su - control-m -c "start_ctm"
su - control-m -c "start_config_agent"
su - control-m -c "start_ca"
su - control-m -c "start-ag -u control-m -p ALL"

echo;echo "Web URL: https://entctrlmprd01.isllc.local:8443/ControlM/"
echo -e "Login to Control-M Configuration Manager to verify all services started.\nIt can take up to 3 minutes for all services to fully initialize."
echo

