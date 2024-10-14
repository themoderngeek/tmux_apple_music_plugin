# tmux Apple Music Controller

This is a small plugin to view the detail of the currently playing apple music track and control some aspects of the playback. This is intended to create a quick interaction with apple music to allow a small degree of control within the terminal rather than fully control all parts of the application.


It is primarily built to scratch my own itch but if others find it useful then that is an added bonus.


In order to use this application you need to be using a mac as it uses apple script under the hood. You also need to have apple music running and in a playing/paused state.

## Usage

tmux Keybind + m will open the music pop up, this will show the currently playing song, the artist, the album, the progress and the volume. Commands listed below can be entered to interact with apple music.

## Commands

When the window is open it accepts the following commands


q/escape - quit; exits the application and closes the tmux window
p - play/pause; Toggles between playing and pausing the application
n - next; plays the next track
b - back; plays the previous track - note this is not supported on some generated playlists
+/- - volume up/down; increase or decreases the volume
h - displays this help window

## Installation 

The easiest way to install and use this application is via [tmp](https://github.com/tmux-plugins/tpm)

Add the following to your `.tmux.conf` file


`set -g @plugin 'themoderngeek/tmux_apple_music_plugin`

## Inspiration

This project is inspired by a few other projects:


The main player takes a lot of the code from this repository https://github.com/mcthomas/Apple-Music-CLI-Player in particular am.sh


in particular this line `if (( curr < 2 || init == 1 )); then` was particularly helpful in not having the screen continuously refresh :pinched_fingers:


omerxx's tmux setup has also been an inspiration, for this project, the calendar reminder inspired the opening of a popup window https://github.com/omerxx/dotfiles/blob/master/tmux/scripts/cal.sh


## Future

This is a very early version, I hope to continue to update it as I use the application and find new features that would be useful to add.
