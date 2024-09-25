#! /bin/bash

## modify ModemManager.service to add " --debug"
SERVICE_FILE="/lib/systemd/system/ModemManager.service"
STRING_DEBUG=" --debug"
CURRENT_CONFIG=$(cat "$SERVICE_FILE")


if grep -q 'debug' <<< "$CURRENT_CONFIG";then
	echo "debug parameter already exists"
else
	sudo sed -i "s/\(ExecStart.*\).*/\1${STRING_DEBUG}/g" ${SERVICE_FILE}
	restart_mm_service=true
fi



if [ "$restart_mm_service" == "true" ]
then
	sudo systemctl daemon-reload
	sudo systemctl restart ModemManager
fi
