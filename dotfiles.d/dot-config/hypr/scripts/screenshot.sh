# set -e 

grim -g "$(slurp)" - | wl-copy;
notify-send --action='Save=SAVE' --action='Dump=DUMP' 'Screenshot copied to clipboard!'
