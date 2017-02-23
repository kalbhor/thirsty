#!/bin/sh

WATER_TIME=${WATER_TIME:-10800} # Set time interval in seconds
DRINK_WATER_CONF="$HOME/.water"

drink_water() {
  # If the file doesn't exist, create it
  if [ ! -f $DRINK_WATER_CONF ]; then
    not_thirsty
  fi

  thirsty=$(head -1 $DRINK_WATER_CONF)
  last_time=$(tail -1 $DRINK_WATER_CONF)

  if [ $thirsty = 'false' ]; then
    echo "true" > $DRINK_WATER_CONF
    echo "$(($(date +%s) + $WATER_TIME))" >> $DRINK_WATER_CONF
    echo -n "Water is essential "
  elif [ $last_time -lt $(date +%s) ]; then
    echo -n "💧 You're thirsty"
  fi
}

not_thirsty() {
  echo "false" > $DRINK_WATER_CONF
  echo "0" >> $DRINK_WATER_CONF
}

# Username.
# If user is root, then print it in red. Otherwise, just print in yellow.
spaceship_user() {
  if [ $USER = 'root' ]; then
    echo -n "%{$fg_bold[red]%}"
  else
    echo -n "%{$fg_bold[yellow]%}"
  fi
  echo -n "%n"
  echo -n "%{$reset_color%}"
}
