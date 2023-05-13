#!/bin/sh

bspc desktop -f ^10

$TERMINAL -e ncmpcpp &
bspc node -p south
$TERMINAL -e ncmpcpp -s visualizer &
bspc node -f north
$TERMINAL -e ncmpcpp -s clock &

# bspc node @X:/ -i
# bspc node @X:/ -p east -i
# bspc node @X:/2 -p south -i
#
# bspc rule --add st:ncmpcpp -o node=@X:/1 follow=on
# bspc rule --add st:ncmpcpp-clock -o node=@X:/2/1
# bspc rule --add st:ncmpcpp-visualizer -o node=@X:/2/2
#
# st -t "ncmpcpp" -e "ncmpcpp" &
# st -t "ncmpcpp-clock" -e "ncmpcpp -s clock" &
# st -t "ncmpcpp-visualizer" -e "ncmpcpp -s visualizer" &
