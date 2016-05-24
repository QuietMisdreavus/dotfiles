#!/usr/bin/bash

back=$(xbacklight -get | cut -d"." -f1)

case "$1" in
	"up")
		[ $back -lt 100 ] && xbacklight +10
	;;
	"down")
		[ $back -gt 10 ] && xbacklight -10
		back=$(xbacklight -get | cut -d"." -f1)
		[ $back -eq 0 ] && xbacklight =10
	;;
esac

echo $(xbacklight -get | cut -d"." -f1)
