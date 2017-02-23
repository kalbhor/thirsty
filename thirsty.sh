water_time=20 # Set time interval in seconds

drink_water() {
thirsty=`cat $HOME/.water` 
last_time=`cat $HOME/.water_last_time`

  if [[ $thirsty == false ]]; then
    echo "$[$(date +%s) + $water_time]" > $HOME/.water_last_time
    echo "true" > $HOME/.water

  elif [[ $[last_time] -lt $(date +%s) ]]; then
    echo -n "💧 You're thirsty"
  fi
}

not_thirsty() {
echo "false" > $HOME/.water
echo "0" > $HOME/.water_last_time
}
