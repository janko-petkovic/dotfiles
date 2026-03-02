# NEW LOGIC:
# 1. Restow from local folder. Use ignore=default --no-fold
# 2. Stow from default folder, using ignore with a list of parsed arguments
#    from the local folder (and --no-fold)
# In this way, you don't have to crossymlink or bother deleting and 
# recreating folders.



function usage()
{
  cat << EOF
Usage: pestow [OPTIONS] ARGS

Arguments:
  path
        Path to the dotfiles source folder - usually named after the machine's 
        name.

Options:
  -f, --force
        Passes the -f flag to the underlying stow command. Use this flag when
        pushing the configuration on a system that has been initialized with a
        different folder (for example when trying out new dotfiles).

  -h, --help
        Show this tooltip.

  -n, --no, --simulate
        Passes the homonimous flag to the underlying stow command of the
        local dotfiles.

  -r, --restow
        Restow the files from 'path', after having added new files either to
        'path' or the default folder (includes an '--ignore=.' flag in the
        underlying stow call)

  -u, --unstow
        Equivalent to 'stow -D args', I just wanted to wrap it. 

Examples:
  I still need to write these
EOF
}


function push_default_dotfiles() {
  new_files=$(find $1 -not -type l,d)

  IGNORE_FLAGS=""

  echo "Updating defaults in $1..."
  echo "Changed files that will not be linked:"
  for f in $new_files; do
    echo " > $f"
    ignore_str=$(echo $f | sed 's/$1\///g')
    export IGNORE_FLAGS=$IGNORE_FLAGS"--ignore=$ignore_str "
  done

  stow defaults -t $1 --no-fold $IGNORE_FLAGS

  echo "Defaults updated."
}


function stow_dotfiles() {
  echo -n "Stowing $1..."
  stow $1 --restow --no-fold --dotfiles
  echo "done."
}

function main() {
  DEFAULT_FOLDER="defaults"
  UPDATE_FLAGS="--no-fold"
  STOW_FLAGS="--no-fold --dotfiles"
}


main "$@"
