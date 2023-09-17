#!/bin/sh

cp ddns-loop-script.sh /usr/local/bin/ddns-loop-script.sh

chmod +x /usr/local/bin/ddns-loop-script.sh

cat <<EOL > /etc/systemd/system/ddns-loop-script.service
[Unit]
Description=DYNU DDNS Updater

[Service]
ExecStart=/usr/local/bin/ddns-loop-script.sh
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOL

systemctl daemon-reload
systemctl enable ddns-loop-script.service
systemctl start ddns-loop-script.service