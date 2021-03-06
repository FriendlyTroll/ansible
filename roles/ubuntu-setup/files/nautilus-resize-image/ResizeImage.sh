#!/bin/bash
#
#  Resize Image Nautilus Script v1.0
#
#  A Gnome 2 Nautilus script for resizing images from the context menu
#  Written by Meinhard Benn (http://benn.org/)
#  Licensed under the terms of the GNU GPLv3

###
# Configuration
#

# Available image sizes
#  * first value is default value
#  * must correspond to script name and symlinks (see README)
SIZES=(800 1024 1920)

# Image quality in percent
QUALITY=70

#
# End of configuration
###

# Check if ImageMagick commands are found
for command in convert identify
do
    if [ ! $(which $command) ]
    then
        zenity --error --text "Could not find \"$command\" application.\n
Make sure ImageMagick is installed and \"$command\" is executable."
        exit 1
    fi
done

# Prevent splitting of $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS on spaces by
# setthing Bash Internal Field Seperator to newline
IFS="
"

# Get file paths
FILES=($NAUTILUS_SCRIPT_SELECTED_FILE_PATHS)
FILES_COUNT=${#FILES[@]}

# Process files, if there are any
if [ $FILES_COUNT -gt 0 ]
then
    # Use script name to select target size
    for size_option in ${SIZES[@]}
    do
        if [ $(expr match "$(basename "$0")" ".*$size_option.*") -gt 0 ]
        then
            size=$size_option
            break
        else
            # Set to default size
            size=${SIZES[0]}
        fi
    done

    # Use plural/singular for progress message
    if [ $FILES_COUNT -gt 1 ]
    then
        file_string="files"
    else
        file_string="file"
    fi

    # Initialise progress bar file counter
    current_file=1

    # Loop through files
    for image_file in ${FILES[@]}
    do
        # Check if file is an image
        if [ $(identify "$image_file") ]
        then
            # Create image directory if it does not exist yet
            target_dir=$(dirname $image_file)"/"$size"px"
            if [ ! -d $target_dir ]
            then
                mkdir $target_dir
            fi

            # Resize image if it does not exit yet
            target_file=$target_dir"/"$(basename "$image_file")

            if [ ! -e "$target_file" ]
            then
                convert -resize $size"x"$size -quality $QUALITY "$image_file" "$target_file"
            fi

            # Send percentage to Zenity progress bar
            percentage=$(echo "$current_file * 100 / $FILES_COUNT" | bc)
            current_file=$((current_file + 1))
            echo $percentage
        fi
    # Pipe loop output to Zenity progress bar
    done | zenity --progress --title="Resizing images" --text="Processing $FILES_COUNT "$file_string"..." --auto-close
else
    echo "Please run this script via Nautilus (GNOME file manager)"
fi

