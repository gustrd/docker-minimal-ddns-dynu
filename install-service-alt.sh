#!/bin/sh

DYNU_HOSTNAME=$1
DYNU_PASSWORD=$2

cp ddns-loop-script.sh /usr/local/bin/ddns-loop-script.sh

chmod +x /usr/local/bin/ddns-loop-script.sh

cat <<EOL > /etc/systemd/system/ddns-loop-script.service
[Unit]
Description=DYNU DDNS Updater

[Service]
ExecStart=/usr/local/bin/ddns-loop-script.sh ${DYNU_HOSTNAME} ${DYNU_PASSWORD}
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOL

systemctl daemon-reload
systemctl enable ddns-loop-script.service
systemctl start ddns-loop-script.service