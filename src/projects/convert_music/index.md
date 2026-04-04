---
layout: default
title: FLAC to MP3 Conversion
description: It looks like your lil sis has whipped up an audio conversion script for you! :D
---
# Convert your audio files to different formats
## Learn how to use a bash script to convert your audio files to the perfect versions of FLAC and both widely accepted MP3 formats

This project was created to convert 24bit FLAC files to 16bit FLAC, MP3 320, and MP3 V0 files.
If you only have 16bit FLAC files, it'll skip the first step and convert them into MP3 320 and MP3 V0 instead.

Unsure how to check the quality of your audio files?
Review them with <a href="https://github.com/alexkay/spek" target="_blank" rel="noopener noreferrer">spek!</a>

### Dependencies

This project was made with Linux in mind, but macOS users may have success.
While SoX and spsox are Linux exclusive, versions are available on <a href="https://brew.sh/" target="_blank" rel="noopener noreferrer">Homebrew</a>.

- <a href="https://www.ffmpeg.org/download.html" target="_blank" rel="noopener noreferrer">ffmpeg</a> - Installed on most Linux distributions.
- <a href="https://lame.sourceforge.io/download.php" target="_blank" rel="noopener noreferrer">LAME</a> - Installed on most Linux distributions.
- <a href="https://xiph.org/flac/download.html" target="_blank" rel="noopener noreferrer">FLAC</a> - Installed on most Linux distributions.
- <a href="https://github.com/chirlu/sox" target="_blank" rel="noopener noreferrer">SoX</a> - Installed on most Linux distributions.
- <a href="https://www.perl.org/get.html" target="_blank" rel="noopener noreferrer">Perl</a> - Installed on most Linux distributions.
- <a href="https://github.com/rndusr/torf-cli?tab=readme-ov-file#pipx" target="_blank" rel="noopener noreferrer">torf-cli</a> - Follow the pipx installation instructions on GitHub.

### Installation

If you'd like to preview the script before downloading the zip file, you can do so <a href="https://github.com/sapphic-wallflower/lil-sis-journal/blob/main/src/projects/convert_music/work.sh" target="_blank" rel="noopener noreferrer">here</a>.

1. Download the <a href="convert_music.zip" download>zip file</a> and extract it.
2. In the <code>convert_music</code> directory, run the below command to make the required files executable.

<code>$ chmod +x FLAC2MP3/flac2mp3.pl && chmod +x spsox/spsox && chmod +x work.sh</code>

This script uses  to convert the audio files, which comes packaged in the zip file.

### Usage
<!-- Convert WAV files to FLAC. Out of scope for the project, but neat if you can find this. -->
<!-- $ mkdir -p wav_files flac_files && for file in *.wav; do ffmpeg -i "$file" "flac_files/${file%.wav}.flac" && mv "$file" wav_files/; done -->
1. Move your .flac files and cover image into the <code>convert_music</code> directory.
2. Open terminal in the <code>convert_music</code> directory and run <code>work.sh</code>.
3. Fill out the details as asked by the prompts.
4. Wait for the script to finish.

<!-- Make a video at the bottom showing how it all works. -->
### Video Installation Guide

Coming soon!

### Credits

Outside the dependencies, this project also uses <a href="https://github.com/EwolBash/spsox" target="_blank" rel="noopener noreferrer">spsox</a> to generate the spectrals, and <a href="https://github.com/robinbowes/flac2mp3" rel="noopener noreferrer">FLAC2MP3</a> to convert the FLAC files to MP3.
Please check out their projects and show them some love.
