#!/bin/sh

last_hash=""

mkdir -p ~/.cache/dump/
touch ~/.cache/dump/current_song.json

while true; do
	inotifywait -e modify ~/.cache/spotify-player/
	current_hash=$(md5sum ~/.cache/spotify-player/spotify-player-*)
	if [ "$last_hash" != "$current_hash" ]; then
		spotify_player get key playback > ~/.cache/dump/current_song.json
		pkill -RTMIN+9 waybar
		last_hash="$current_hash"
	fi
	sleep 1
done
