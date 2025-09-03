#!/bin/bash
# grep for a highlighted IP with cursor and search
# for it in files under below directory
# adapt to your setup
#
# set -x

cd /home/antisa/Posal/dns-exports
MATCH=$(grep --no-filename $1 * | awk -F, '{print $2"."$1}')
notify-send "SERVER IP matches" "$MATCH" --icon=network-server

