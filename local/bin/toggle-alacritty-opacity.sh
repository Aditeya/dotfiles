#!/bin/sh
ALACRITTY_CONFIG=~/.config/alacritty/alacritty.yml
OPACITY=$(awk '$1 == "opacity:" {print $2; exit}' $ALACRITTY_CONFIG)

case $OPACITY in
	1)
		TOGGLE_OPACITY=0.8
		;;
	*) 
		TOGGLE_OPACITY=1
		;;
esac

sed -- "s/opacity: $OPACITY/opacity: $TOGGLE_OPACITY/" $ALACRITTY_CONFIG > /tmp/alacritty.yml && mv /tmp/alacritty.yml $ALACRITTY_CONFIG
