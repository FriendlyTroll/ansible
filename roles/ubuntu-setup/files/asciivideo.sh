#!/bin/bash
# Open asciinema player with file selected in browser

# Get file selected
FILES=($NAUTILUS_SCRIPT_SELECTED_FILE_PATHS)
FILES_COUNT=${#FILES[@]}


if [ $FILES_COUNT -gt 0 ]
then
    for file in ${FILES[@]}
    # file looks like /home/user/Documents/terminal_logs/19-tra-22_09-38-56.cast
    do
        (# get timestamp from filename
        newf=$(echo "$file" | cut -f6 -d"/" | cut -f1 -d".")
        # get string to substitute
        asciiname=$(awk -F[\'\'] '/Ascii/ {print $2}' asciinema_player.html | tr -d "/" | cut -f1 -d".") 
        # set correct string in asciinema html file
        sed -i "s/$asciiname/$newf/" /home/antisa/Documents/terminal_logs/asciinema_player.html
        sleep 1
        # run python built in webbrowser and open in firefox
        python3 -m http.server
        sleep 1
        firefox http://0.0.0.0:8000/asciinema_player.html
        ) | zenity --progress --width 350 --pulsate --text "Opening recording..." --title "asciinema recording" --auto-close
    done
fi
