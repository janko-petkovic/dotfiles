function usage()
{
  cat << EOF
Usage: pestow [OPTIONS] ARGS

Arguments:
  profile
				Name of the profile name - the name of the folder located in
				./profiles. Usually I name it after the system's name.

Options:
  -h, --help
        Show this tooltip.

  -n, --no, --simulate
        Passes the homonimous flag to the underlying stow command of the
        local dotfiles.

  -r, --restow
        Restow the files from 'path', after having added new files either to
        'path' or the default folder (includes an '--ignore=.' flag in the
        underlying stow call)

  -s, --switch
				Use this flag when stowing a new profile with a different profile
				already present (for example when trying out new dotfiles).

  -u, --unstow
        If you want to remove all the current symlinks in the system.

Examples:
  I still need to write these
EOF
}

function stow_defaults_no_conflict() {
	orig_files_in_profile=$(find $PROFILE_PATH -not -type l,d)

	ignore_flags=""
  for f in $orig_files_in_profile; do
    echo " > $f"
    ignore_str=$(echo $f | sed 's/$1\///g')
    export ignore_flags=$ignore_flags"--ignore=$ignore_str "
  done
	
  stow $DEFAULT_PROFILE $STOW_FLAGS $ignore_flags
}

function stow_profile() {
	stow $SOURCE $STOW_FLAGS 
}

function stow_profile_override() {
	stow $SOURCE $OVERRIDE_STOW_FLAGS
}

function unstow_all() {
	echo "stow $SOURCE $UNSTOW_FLAGS"
	echo "stow $DEFAULT_PROFILE $UNSTOW_FLAGS"
	stow $PROFILE_PATH $UNSTOW_FLAGS
	stow $DEFAULT_PROFILE $UNSTOW_FLAGS
}

function main() {
	PROFILE_NAME="lazarus"
	PROFILES_FOLDER="profiles"
	DEFAULT_PROFILE="dotfiles.d"
	SOURCE="-d $DEFAULT_PROFILE $PROFILE_NAME"
	#  STOW_FLAGS="--no-fold --dotfiles"
	#  OVERRIDE_STOW_FLAGS="--no-fold --dotfiles --override=."
	#  UNSTOW_FLAGS="-D --no-fold --dotfiles"
	PROFILE_PATH=$PROFILES_FOLDER/$PROFILE_NAME
	unstow_all
}

main "$@"
