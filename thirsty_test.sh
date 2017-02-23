#!/bin/sh

# Override default water time
WATER_TIME=5

. ./thirsty.sh

echo "Water time: $WATER_TIME"

drink_water
echo
not_thirsty
drink_water
echo
sleep $(($WATER_TIME + 1))
drink_water
echo