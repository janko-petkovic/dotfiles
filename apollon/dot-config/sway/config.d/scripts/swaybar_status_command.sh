#!/bin/bash

# EXPR="date +%Y-%m-%d|%X"
# EXPR="echo The quick brown fox jumps over the lazy dog 1234567890"
EXPR="cat /sys/class/power_supply/BAT0/capacity"

function get_audio_level() {
  level=
}

function get_date_and_time() {
  STRING+=$(date '+%d %B %y')
  STRING+=" | "
  STRING+=$(date '+%H:%M')
  return 0
}

function get_power_state() {
  level=$(cat /sys/class/power_supply/BAT0/capacity)
  state=$(cat /sys/class/power_supply/BAT0/status)
  STRING+="$level% " 

  case $state in
    Discharging)
      STRING+=󰂎;;
    "Not charging")
      STRING+=󰂎;;
    Charging)
      STRING+=;;
  esac

  return 0
}


while true; do 
  STRING=""
  get_date_and_time
  STRING+=" - "
  get_power_state
  echo $STRING
  
  sleep 1
done



