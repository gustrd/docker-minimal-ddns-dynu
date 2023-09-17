#!/bin/sh

trap 'echo "Error, restarting script..."; sleep 5' ERR

while true; do
  curl "https://api.dynu.com/nic/update?hostname=${DYNU_HOSTNAME}&my-ip=no&password=${DYNU_PASSWORD}"
  sleep 300
done
