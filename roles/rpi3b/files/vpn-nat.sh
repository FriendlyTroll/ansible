#!/bin/bash
#
# Forward port over ProtonVPN
# see https://protonvpn.com/support/port-forwarding-manual-setup/#linux
# Forwarded port from this command needs to be inputted into the the torrent client
# which the sed commands does.
# Also a correct version of natpmpc command needs to be installed; see link above
# Adapted from here https://dataswamp.org/~solene/2024-08-31-protonvpn-port-forwarding.html

PORT=$(natpmpc -a 1 0 udp 60 -g 10.2.0.1 | awk '/Mapped public/ { print $4 }')
FILE=/etc/transmission-daemon/settings.json

grep "$PORT" $FILE || { echo "Stopping transmission-daemon"; systemctl stop transmission-daemon.service; }

sed -i -E "s/(\"peer-port\": )[0-9]+/\1$PORT/p" $FILE 

echo "Starting transmission-daemon" && systemctl start transmission-daemon.service

while true
do
  date
  natpmpc -a 1 0 udp 60 -g 10.2.0.1 && natpmpc -a 1 0 tcp 60 -g 10.2.0.1 || { echo "error Failure natpmpc $(date)"; exit 1 ; }
  sleep 45
done

