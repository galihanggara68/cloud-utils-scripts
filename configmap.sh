#!/bin/bash
### Apply configmap on the cloud

while getopts ":d:n:b:" opt; do
  case $opt in
    d) k_deployments="$OPTARG"
    ;;
    n) k_namespace="$OPTARG"
    ;;
    b) k_backup="$OPTARG"
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

if ! [ "$k_backup" = "false" ]; then
  ./backup-configmap.sh -n $k_namespace -d $k_deployments
fi

for i in "${array[@]}"
do
    if [ -d "$k_namespace/$i-appsettings" ]; then
      kubectl create configmap $i-appsettings --from-file $k_namespace/$i-appsettings/appsettings.json -o yaml -n $k_namespace --dry-run=client | kubectl apply -f -
      kubectl rollout restart deployment/$i -n $k_namespace
    else
      echo "Deployment folder not exists, make sure the folder and config are exists"
    fi
done