#!/usr/bin/sh


RET=$(echo -e "shutdown\0icon\x1fsystem-shutdown\nreboot\0icon\x1fsystem-reboot\nlogout\0icon\x1fsystem-log-out\nlock\0icon\x1fsystem-lock-screen" | fuzzel -d -l 4 -a top-left -w 20 --x-margin 5 --y-margin 5)

case $RET in
	shutdown) shutdown -h now ;;
	reboot) reboot ;;
	logout) loginctl kill-session 2;;
    lock) swaylock -f;;
	*) ;;
esac
