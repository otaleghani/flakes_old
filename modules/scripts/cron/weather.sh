#!/bin/sh

while getopts "a:b:c:" opt; do
	case $opt in
		a) location="$OPTARG" ;;
		\?) echo "ERR. Invalid option -$OPTARG. The location has to be in this format: 'florence,it'" >&2 ;;
	esac
done

filename="forecast"
foldername="$HOME/.forecast"

if [ ! -d "$foldername" ]; then
	mkdir -p "$foldername"
fi

echo -n "Current forecast: " > "$foldername/$filename"

$HOME/.config/scripts/cron/ansiweather.sh -l $location -a false -p false -w false -d false -h false -s true | awk -F" - UVI:" '{sub(/.*: /, "", $1); print $1}' >> "$foldername/$filename"
echo -n "Updated on: " >> "$foldername/$filename"
echo $(date +"%H:%M") >> "$foldername/$filename"
echo "\n7 days forecast" >> "$foldername/$filename"
$HOME/.config/scripts/cron/ansiweather.sh -l $location -a false -p false -w false -d false -h false -s true -f 7 | awk '{sub(/^[^:]*: /, ""); gsub(/ - /, "\n"); print}' >> "$foldername/$filename"
