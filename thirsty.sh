thirsty=
last_time=

drink_water() {
echo -n "$thirsty"
water_time=10 # Set time interval 

  if [[ $thirsty == false ]]; then
    last_time="$[$(date +%s) + $water_time]"
    thirsty="true"
    echo -n "${last_time} $(date +%s) ${thirsty}"

  elif [[ $[last_time] -lt $(date +%s) ]]; then
    echo -n "💧 You're thirsty"
  fi

}