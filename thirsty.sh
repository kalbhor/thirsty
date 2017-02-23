water_time=10800 # Set time interval in seconds

drink_water() {
thirsty=`cat $HOME/.water`
last_time=`cat $HOME/.water_last_time`

  if [[ $thirsty == false ]]; then
    echo "$[$(date +%s) + $water_time]" > $HOME/.water_last_time
    echo "true" > $HOME/.water
    echo -n " Water is essential "

  elif [[ $[last_time] -lt $(date +%s) ]]; then
    echo -n "💧 You're thirsty"
  fi
}

not_thirsty() {
echo "false" > $HOME/.water
echo "0" > $HOME/.water_last_time
}
# Username.
# If user is root, then pain it in red. Otherwise, just print in yellow.
spaceship_user() {
  if [[ $USER == 'root' ]]; then
    echo -n "%{$fg_bold[red]%}"
  else
    echo -n "%{$fg_bold[yellow]%}"
  fi
  echo -n "%n"
  echo -n "%{$reset_color%}"
}