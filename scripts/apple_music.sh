
np() {
	init=1
    help='false'
while true
do
	duration=$(osascript -e 'tell application "Music" to get {player position} & {duration} of current track')
    vol=$(osascript -e 'tell application "Music" to get sound volume')

    IFS=',' read -ra arr <<< "$duration"
	curr=$(cut -d . -f 1 <<< ${arr[0]})

	currMin=$(echo $(( curr / 60 )))
	currSec=$(echo $(( curr % 60 )))

    if [ ${#currMin} = 1 ]; then
		currMin="0$currMin"
	fi
    if [ ${#currSec} = 1 ]; then
        currSec="0$currSec"
    fi
    if (( curr < 2 || init == 1 )); then
        init=0
        name=$(osascript -e 'tell application "Music" to get name of current track')
        name=${name:0:50}
        artist=$(osascript -e 'tell application "Music" to get artist of current track')
        artist=${artist:0:50}
        record=$(osascript -e 'tell application "Music" to get album of current track')
        record=${record:0:50}
        end=$(cut -d . -f 1 <<< ${arr[1]})
        endMin=$(echo $(( end / 60 )))
        endSec=$(echo $(( end % 60 )))
        if [ ${#endMin} = 1 ]
        then
            endMin="0$endMin"
        fi
        if [ ${#endSec} = 1 ]
        then
            endSec="0$endSec"
        fi
        magenta=$(echo -e '\033[01;35m')
        nocolor=$(echo -e '\033[0m')
    fi
    if [ $vol = 0 ]; then
        volIcon=🔇
    else
        volIcon=🔊
    fi
    vol=$(( vol / 12 ))
	volBars='▁▂▃▄▅▆▇'
	volBG=${volBars:$vol}
	vol=${volBars:0:$vol}
	progressBars='▇▇▇▇▇▇▇▇▇'
	percentRemain=$(( (curr * 100) / end / 10))
	progBG=${progressBars:$percentRemain}
    prog=${progressBars:0:$percentRemain}
	clear
	paste <(printf '%s\n' "$name" "$artist - $record" "$(echo $currMin:$currSec ${magenta}${prog}${nocolor}${progBG} $endMin:$endSec)" "$volIcon $(echo "${magenta}$vol${nocolor}$volBG")") 

    input=$(/bin/bash -c "read -n 1 -t 1 input; echo \$input | xargs")

    case "$input" in
        q | $'\e')
            clear
            break
            ;;
        p)
            osascript -e 'tell app "Music" to playpause'
            ;;
        n)
            osascript -e 'tell app "Music" to play next track'
            ;;
        b)
            osascript -e 'tell app "Music" to back track'
            ;;
        "+")
            osascript -e 'tell application "Music" to set sound volume to sound volume + 5'
            ;;
        "-")
            osascript -e 'tell application "Music" to set sound volume to sound volume - 5'
            ;;
        h)
    
            clear
            echo "Help"
            echo "This message will show for 5 seconds then disapear"
            printf '\n'
            echo "Commands:"
            echo "q/escape - quit; exits the application and closes the tmux window"
            echo "p - play/pause; Toggles between playing and pausing the application"
            echo "n - next; plays the next track"
            echo "b - back; plays the previous track - note this is not supported on some generated playlists"
            echo "+/- - volume up/down; increase or decreases the volume"
            echo "h - displays this help window"
            printf '\n'
            echo "This script is dependent on using apple script to send commands to apple music, as such apple music needs to be open in the background"
            sleep 5
            ;;
    esac
done
}

np
