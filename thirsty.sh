#!/bin/sh

WATER_TIME=${WATER_TIME:-1200} # Set time interval in seconds
DRINK_WATER_CONF="${DRINK_WATER_CONF:-$HOME/.water}"

drink_water() {
  # If the file doesn't exist, create it
  if [ ! -f $DRINK_WATER_CONF ]; then
    date +%s > $DRINK_WATER_CONF
  fi

  # Tail is used to remain compatible with the pervious file format
  next_time=$(($(tail -1 $DRINK_WATER_CONF) + $WATER_TIME))

  if [ $next_time -lt $(date +%s) ]; then
    echo -n "💧 You're thirsty"
  fi
}

not_thirsty() {
  date +%s > $DRINK_WATER_CONF
  echo "Water is essential"
}

next_drink() {
  next_time=$(($(cat $DRINK_WATER_CONF) + $WATER_TIME))
  echo "Next drink at $(date --date="@$next_time")"
}
