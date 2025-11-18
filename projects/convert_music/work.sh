#!/bin/bash

# You will need flac, flac2mp3, torf, torf-cli, sox, spsox
# Known issues:
# flac2pm3 may need you to install perl. $ sudo dnf install perl
# work.sh needs to be given execute permissions
# flac2mp3.pl needs to be given execute permissions

# Check for WAV files first
if ls *.wav 1> /dev/null 2>&1; then
    echo "Error: WAV files detected in this directory."
    echo "Please convert them to FLAC first before running this script."
    exit 1
fi

# Define the variables for the script
read -p "Enter artist name: " artist
read -p "Enter album name: " album
read -p "Enter release year: " year
release_name="$artist - $album ($year)"

read -p "Is this a CD or WEB release? (CD/WEB) " release_type
read -p "Is this a 16 or 24 bit release? (16/24) " bitrate
read -p "Do you want to generate spectrals? (y/n) " spectrals
read -p "Do you want to create a torrent on completion? (y/n) " torrent

# Create spectrals based on the current directory, then move them to Complete
if [[ $spectrals == "Y" ]] || [[ $spectrals == "y" ]]; then
    spsox
    mv specs ../Complete/specs
else
    echo "No spectrals..."
fi

# Convert from 24bit -> 16bit, then to 320 & V0, then move to Complete.
if [[ $release_type == "WEB" ]] || [[ $release_type == "web" ]]; then
    if [[ $bitrate = "24" ]]; then
        mkdir "$release_name [WEB - 16bit FLAC]"
        for flac in *.flac; do
            sox -S "$flac" -R -G -b 16 "$release_name [WEB - 16bit FLAC]"/"$flac" rate -v -L 44100 dither
        done
        cp cover.* "$release_name [WEB - 16bit FLAC]"
        mv "$release_name [WEB - 16bit FLAC]" ../Complete

        # Convert FLAC to MP3 320 & V0, then move to Complete
        ../flac2mp3.pl --preset=320 --processes="$(nproc)" . ./"$release_name [WEB - MP3 320]"
        ../flac2mp3.pl --preset=V0 --processes=2 . ./"$release_name [WEB - MP3 V0]"
        cp cover.* "$release_name [WEB - MP3 320]"
        cp cover.* "$release_name [WEB - MP3 V0]"
        mv "$release_name [WEB - MP3 320]" ../Complete
        mv "$release_name [WEB - MP3 V0]" ../Complete

    else

         # Convert FLAC to MP3 320 & V0, then move to Complete
        ../flac2mp3.pl --preset=320 --processes="$(nproc)" . ./"$release_name [WEB - MP3 320]"
        ../flac2mp3.pl --preset=V0 --processes=2 . ./"$release_name [WEB - MP3 V0]"
        cp cover.* "$release_name [WEB - MP3 320]"
        cp cover.* "$release_name [WEB - MP3 V0]"
        mv "$release_name [WEB - MP3 320]" ../Complete
        mv "$release_name [WEB - MP3 V0]" ../Complete

    fi

elif [[ $release_type == "CD" ]] || [[ $release_type == "cd" ]]; then
    if [[ $bitrate = "24" ]]; then
        echo "It's impossible for a CD to be 24bit in almost every situation. This script does not support it if you have a rare CD that is."
        exit 1

    else

	# Convert FLAC to MP3 320 & V0, then move to Complete
	../flac2mp3.pl --preset=320 --processes="$(nproc)" . ./"$release_name [CD - MP3 320]"
	../flac2mp3.pl --preset=V0 --processes=2 . ./"$release_name [CD - MP3 V0]"
	cp cover.* "$release_name [CD - MP3 320]"
	cp cover.* "$release_name [CD - MP3 V0]"
	mv "$release_name [CD - MP3 320]" ../Complete
    mv "$release_name [CD - MP3 V0]" ../Complete

    fi

else

    echo "You somehow mistyped CD or WEB. No mixed case, all caps or all lower."
    exit 1

fi

# Pack the source files into a directory, then move them to Complete.
if [[ $release_type == "WEB" ]] || [[ $release_type == "web" ]]; then
    if [[ $bitrate = "24" ]]; then
        mkdir "$release_name [WEB - 24bit FLAC]"
        mv cover.* "$release_name [WEB - 24bit FLAC]"
        mv *.flac "$release_name [WEB - 24bit FLAC]"
        mv "$release_name [WEB - 24bit FLAC]" ../Complete

    else

        mkdir "$release_name [WEB - 16bit FLAC]"
        mv cover.* "$release_name [WEB - 16bit FLAC]"
        mv *.flac "$release_name [WEB - 16bit FLAC]"
        mv "$release_name [WEB - 16bit FLAC]" ../Complete

    fi

elif [[ $release_type == "CD" ]] || [[ $release_type == "cd" ]]; then
    if [[ $bitrate = "24" ]]; then
        echo "It's impossible for a CD to be 24bit in almost every situation. This script does not support it if you have a rare CD that is."
        exit 1

    else

        mkdir "$release_name [CD - 16bit FLAC]"
        mv cover.* "$release_name [CD - 16bit FLAC]"
        mv *.log "$release_name [CD - 16bit FLAC]"
        mv *.cue "$release_name [CD - 16bit FLAC]"
        mv *.m3u "$release_name [CD - 16bit FLAC]"
        mv *.flac "$release_name [CD - 16bit FLAC]"
        mv "$release_name [CD - 16bit FLAC]" ../Complete

    fi

else

    echo "You somehow mistyped CD or WEB. No mixed case, all caps or all lower."
    exit 1

fi

# Creates a torrent for each directory, then moves them to Complete.
if [[ $torrent == "Y" ]] || [[ $torrent == "y" ]]; then
    for file in ../Complete/"$release_name"*
        do torf "$file"
    done
    mv "$release_name [WEB - 24bit FLAC].torrent" ../Complete 2>/dev/null
    mv "$release_name [WEB - 16bit FLAC].torrent" ../Complete 2>/dev/null
    mv "$release_name [WEB - MP3 320].torrent" ../Complete 2>/dev/null
    mv "$release_name [WEB - MP3 V0].torrent" ../Complete 2>/dev/null
    mv "$release_name [CD - 24bit FLAC].torrent" ../Complete 2>/dev/null
    mv "$release_name [CD - 16bit FLAC].torrent" ../Complete 2>/dev/null
    mv "$release_name [CD - MP3 320].torrent" ../Complete 2>/dev/null
    mv "$release_name [CD - MP3 V0].torrent" ../Complete 2>/dev/null
else
    echo "No torrent..."
fi

echo "All files have been moved to /FLAC2MP3/Complete"
