# Stow the application configs
stow hypr waybar nvim zathura foot

# Install the scripts
SCRIPTS=$(ls bin/)

for s in $SCRIPTS
do
  cp bin/$s ~/.local/bin
done


