#!/bin/bash

while getopts ":d:n:" opt; do
  case $opt in
    d) k_deployments="$OPTARG"
    ;;
    n) k_namespace="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    exit 1
    ;;
  esac

  case $OPTARG in
    -*) echo "Option $opt needs a valid argument"
    exit 1
    ;;
  esac
done

array=($(echo "$k_deployments" | tr ',' '\n'))

echo "Backuping using params . . ."
for i in "${array[@]}"
do
	if ! [ -d "$k_namespace/$i-appsettings" ]; then
    echo "Folder not exists, creating"
    mkdir "$k_namespace/$i-appsettings"
  fi
  kubectl get configmap $i-appsettings -o jsonpath={.data.*} -n $k_namespace > $k_namespace/$i-appsettings/appsettings.json.bkp
done