#!/bin/bash

echo "Updating . . ."
rm -f configmap.sh backup-configmap.sh rollout.sh
sleep 1
curl -O "https://raw.githubusercontent.com/galihanggara68/cloud-utils-scripts/master/configmap.sh"
curl -O "https://raw.githubusercontent.com/galihanggara68/cloud-utils-scripts/master/backup-configmap.sh"
curl -O "https://raw.githubusercontent.com/galihanggara68/cloud-utils-scripts/master/rollout.sh"
echo "Done."