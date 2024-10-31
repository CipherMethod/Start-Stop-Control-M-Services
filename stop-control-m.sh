#!/bin/sh
# Stop Control-M Services
#
# 20240207 jah - developed and tested on 9.0.21.200
# 20241017 jah - single control-m user/directory conversion

su - control-m -c "ctmsca shutdown -f"
su - control-m -c "em ctl -mcs -C Config_Agent -M entctrlmprd01 -cmd shutdown" 2>/dev/null
[ "$?" = "1" ] && echo "EM Services Already Down?"
su - control-m -c "shut_ctm"
su - control-m -c "shut_ca"
su - control-m -c "shut-ag -u control-m -p ALL"
su - control-m -c "shutdb"
echo

