#!/bin/bash
## Rollout restart deployment on the cloud

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

for deps in "${array[@]}"
do
    kubectl rollout restart deployment $deps -n $k_namespace;
done
