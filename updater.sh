#!/bin/bash

echo "Updating . . ."
rm -r configmap.sh backup-configmap.sh rollout.sh
wget "https://raw.githubusercontent.com/galihanggara68/cloud-utils-scripts/master/configmap.sh"
wget "https://raw.githubusercontent.com/galihanggara68/cloud-utils-scripts/master/backup-configmap.sh"
wget "https://raw.githubusercontent.com/galihanggara68/cloud-utils-scripts/master/rollout.sh"
echo "Done."