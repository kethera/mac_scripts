#!/usr/bin/env bash
# Project Thursa: HD Radio Player wrapper using existing scripts from github:
# uses nrsc5 <URL HERE>
#
# example nrsc command: nrsc5 89.7 1
#
# uses mvp <URL HERE>
#
# example nrsc command with mvp: nrsc5 -o - -q -f adts 89.7 1 | mpv - --audio-samplerate=48000 -af lavfi='extrastereo'
#
# Created 28 Sep 2018 by Veronica Goralski
# Massachusetts, USA
#
# Last edited: 28 Sep 2018
#
# future ideas: display metadata, keep a running buffer, add DVR-style transport controls
# for live and recorded audio, save to file, etc., RSSS
#

#Function definitions:
# greet
greet()
{
	clear
	printf '\n\nthursa digital HD-FM radio player\n'
}

# get frequency
get_freq()
{
	printf "\n"
	read -p 'Please enter the HD-FM frequency you would like to listen to (88-108): ' freq
}

# get program number
get_prog()
{
	read -p 'Please enter the program number you would like to listen to (1 for HD-1, 2 for HD-2, etc): ' prog_int
	prog=$((prog_int - 1))
}
#play regular stream
play_plain()
{
	clear
	printf "\n\nthursa is now playing $freq HD-$prog_int...\n\n\n"
	$(nrsc5 $freq $prog &> /dev/null)
}

#play stream with processing added
play_processed()
{
	$(nrsc5 -o - -q -f adts $freq $prog | mpv - --audio-samplerate=48000 -af lavfi='extrastereo')
}

main()
{
	greet  #sweet ascii art to come
	get_freq
	get_prog
	read -n1 -p 'Would you like the (p)lain stream or the processed (s)tream? ' plain_or_dsp
	case $plain_or_dsp in
		[pP] ) play_plain
		;;
		[sS] ) clear;printf "\n\nthursa is now playing $freq HD-$prog_int with DSP...\n\n\n";play_processed &> /dev/null
		;;
		*) printf '\n\ninvalid input\n'
		;;
	esac
}

main