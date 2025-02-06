#!/bin/sh
# Stop Control-M Services
#
# 20240207 jah - developed and tested on 9.0.21.200
# 20241017 jah - single control-m user/directory conversion
# 20250206 jah - change em -M option to -all

su - control-m -c "ctmsca shutdown -f"
su - control-m -c "em ctl -mcs -C Config_Agent -all -cmd shutdown" 2>/dev/null
[ "$?" = "1" ] && echo "EM Services Already Down?"
su - control-m -c "shut_ctm"
su - control-m -c "shut_ca"
su - control-m -c "shut-ag -u control-m -p ALL"
su - control-m -c "shutdb"
echo
echo "NOTE: It may take an additional 30 seconds for services to fully shutdown."
echo

