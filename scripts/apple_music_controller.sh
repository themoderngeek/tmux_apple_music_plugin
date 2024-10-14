#!/usr/bin/env bash


display_popup() {
	CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
	tmux display-popup \
		-S "fg=#eba0ac" \
		-w50% \
		-h50% \
		-d '#{pane_current_path}' \
		-T Music \
		-E bash "$CURRENT_DIR/apple_music.sh"
}

main () {
    display_popup
}

main
