IS_ACTIVE=$(pgrep wlsunset)

if [[  -z $IS_ACTIVE ]]; then
	wlsunset -l 50.7 -L 7.1
else
	pkill wlsunset
fi
