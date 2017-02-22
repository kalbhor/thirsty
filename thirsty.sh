# WATER
drink_water() {
  if [[ THIRSTY == "false" ]]; then
    last_time=$[$(date +%s) + 5]
    echo -n "${THIRSTY}"
    THIRSTY="true"

  elif [[ $[last_time] < $(date +%s) || THIRSTY!="false" ]]; then
    THIRSTY="false"
    echo -n "💧 You're thirsty ${THIRSTY}"
  fi

}
