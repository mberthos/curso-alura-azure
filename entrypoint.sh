#!/bin/sh

# prepare environment
tr -d '\015' < /app/configs/kubernetes-microservice-example-configs > /tmp/kubernetes-microservice-example-configs.lf
tr -d '\015' < /app/secrets/kubernetes-microservice-example-secrets > /tmp/kubernetes-microservice-example-secrets.lf

. /tmp/kubernetes-microservice-example-configs.lf
. /tmp/kubernetes-microservice-example-secrets.lf

rm /tmp/kubernetes-microservice-example-configs.lf
rm /tmp/kubernetes-microservice-example-secrets.lf


if [ "$1" = "start" ]; then
  # starting node application
  exec node index.js
else
  # executing command supressed in the command line
  exec "$@"
fi