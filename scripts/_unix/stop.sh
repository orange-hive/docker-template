#!/bin/sh

if [ ! -z "$MYSQL_PORT" ]; then
  echo "$(parseFile kubernetes/app/mysql-service.yaml)" | kubectl delete -f -
fi

if [ -f "kubernetes/app/app-ingress.${ENVIRONMENT}.yaml" ]; then
  echo "$(parseFile kubernetes/app/app-ingress.${ENVIRONMENT}.yaml)" | kubectl delete -f -
else
  echo "$(parseFile kubernetes/app/app-ingress.default.yaml)" | kubectl delete -f -
fi

if [ -f "kubernetes/app/db-ingress.${ENVIRONMENT}.yaml" ]; then
  echo "$(parseFile kubernetes/app/db-ingress.${ENVIRONMENT}.yaml)" | kubectl delete -f -
else
  echo "$(parseFile kubernetes/app/db-ingress.default.yaml)" | kubectl delete -f -
fi

if [ -f "kubernetes/app/app-service.${ENVIRONMENT}.yaml" ]; then
  echo "$(parseFile kubernetes/app/app-service.${ENVIRONMENT}.yaml)" | kubectl delete -f -
else
  echo "$(parseFile kubernetes/app/app-service.default.yaml)" | kubectl delete -f -
fi

if [ -f "kubernetes/app/db-service.${ENVIRONMENT}.yaml" ]; then
  echo "$(parseFile kubernetes/app/db-service.${ENVIRONMENT}.yaml)" | kubectl delete -f -
else
  echo "$(parseFile kubernetes/app/db-service.default.yaml)" | kubectl delete -f -
fi

kubectl delete secret "${PROJECTNAME}-ssh"

if [ -f "kubernetes/configmaps/${ENVIRONMENT}.yaml" ]; then
  echo "$(parseFile kubernetes/configmaps/${ENVIRONMENT}.yaml)" | kubectl delete -f -
else
  echo "$(parseFile kubernetes/configmaps/default.yaml)" | kubectl delete -f -
fi

exit
