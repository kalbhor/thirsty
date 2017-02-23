<img src="https://raw.githubusercontent.com/lakshaykalbhor/Thirsty/master/out.gif">

# Thirsty
> zsh/bash script to remind you to drink water.

If you're like me and you spend a lot of your time programming with the command line open, chances are that you forget drinking water for a long period of time.
**At the end of the day I would find out that I haven't had enough water.**
Hence I created a bash script that reminds me to drink water on my command line.


## How to use
1. Copy the [thirsty.sh](thirsty.sh) file and paste it in your zshrc or bashrc or theme, etc.  
2. In your zshrc/theme/bashrc locate `PROMPT='$(some_function)'` or `PROMPT_COMMAND='$(some_function)'` for bash and add `drink_water` inside that function. *(This will be the case if you're using a theme)*
3. If you can't locate `PROMPT`, then just add `PROMPT='$(drink_water)` or `PROMPT_COMMAND='$(drink_water)` for bash in the file.
4. Create two files `touch $HOME/.water $HOME/.water_last_time`
5. Set your time interval in the variable `water_time` in seconds, eg : `water_time=72000` sets it to 20 mins.
6. Once notified, you can remove the message by simply typing `not_thirsty` in your command line.
