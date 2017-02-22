# Water

drink_water() {
thirsty=$(cat /Users/lakshay/.oh-my-zsh/custom/themes/config.txt)
last_time=$(cat /Users/lakshay/.oh-my-zsh/custom/themes/config2.txt)

  if [[ $thirsty == false ]]; then
    echo "$[$(date +%s) + 10]" > /Users/lakshay/.oh-my-zsh/custom/themes/config2.txt
    last_time=$(cat /Users/lakshay/.oh-my-zsh/custom/themes/config2.txt)
    echo "true" > /Users/lakshay/.oh-my-zsh/custom/themes/config.txt
    thirsty=$(cat /Users/lakshay/.oh-my-zsh/custom/themes/config.txt)

  elif [[ $[last_time] -lt $(date +%s) ]]; then
    echo -n "💧 You're thirsty"
  fi

}
