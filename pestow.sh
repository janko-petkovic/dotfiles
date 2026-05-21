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
	orig_files_in_profile=$(find $PROFILES_DIR/$PROFILE_NAME -not -type l,d)

	ignore_flags=""

  for f in $orig_files_in_profile; do
    ignore_str="--ignore=$(echo $f | sed 's/profiles\/lazarus\///g')"
    ignore_str=$(echo $ignore_str | sed 's/dot-/./g')
    echo " > $ignore_str"
    export ignore_flags="$ignore_flags $ignore_str"
  done
	
  # echo "stow $DEFAULT_PROFILE_NAME $STOW_FLAGS $ignore_flags $TARGET_FLAG"
  stow $DEFAULT_PROFILE_NAME $STOW_FLAGS $ignore_flags $TARGET_FLAG
}

function stow_profile() {
	# echo "stow $DIR_FLAG $PROFILE_NAME $STOW_FLAGS $TARGET_FLAG"
	stow $DIR_FLAG $PROFILE_NAME $STOW_FLAGS $TARGET_FLAG
}

function stow_profile_override() {
	# echo "stow $DIR_FLAG $PROFILE_NAME $OVERRIDE_STOW_FLAGS $TARGET_FLAG"
	stow $DIR_FLAG $PROFILE_NAME $OVERRIDE_STOW_FLAGS $TARGET_FLAG
}

function unstow_all() {
	# echo "stow $DIR_FLAG -D $PROFILE_NAME $STOW_FLAGS $TARGET_FLAG"
	# echo "stow -D $DEFAULT_PROFILE_NAME $STOW_FLAGS $TARGET_FLAG"
	stow $DIR_FLAG -D $PROFILE_NAME $STOW_FLAGS $TARGET_FLAG
	stow -D $DEFAULT_PROFILE_NAME $STOW_FLAGS $TARGET_FLAG
  echo "Cleaning complete!"
}

function main() {
	DEFAULT_PROFILE_NAME="dotfiles.d"
	PROFILES_DIR="profiles"

	PROFILE_NAME=$1
  
  TARGET_FLAG="-t $HOME"
  DIR_FLAG="-d $PROFILES_DIR"
	STOW_FLAGS="--no-fold --dotfiles"
	OVERRIDE_STOW_FLAGS="--no-fold --dotfiles --override=."
	UNSTOW_FLAGS="-D --no-fold --dotfiles"

	# unstow_all
	stow_profile
	stow_defaults_no_conflict
}

main "$@"
