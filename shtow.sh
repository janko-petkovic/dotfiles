if [[ $1 == "" ]] then
  echo "usage: sh shtow.sh FOLDER_NAME"
  exit 1
fi

new_files=$(find $1 -not -type l,d)

IGNORE_FLAG=""

echo "Updating defaults in $1..."
echo "Changed files that will not be linked:"
for f in $new_files; do
  echo " > $f"
  ignore_str=$(echo $f | sed 's/$1\///g')
  export IGNORE_FLAG=$IGNORE_FLAG"--ignore=$ignore_str "
done


# echo "stow defaults -t $1 --no-fold $IGNORE_FLAG"
stow defaults -t $1 --no-fold $IGNORE_FLAG 2> /dev/null
echo "Defaults updated."
echo ""
echo -n "Restowing $1..."
stow $1 --restow --no-fold --dotfiles 2> /dev/null
echo done.



