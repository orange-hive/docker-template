#!/bin/sh

docker-compose  -p "$PROJECTNAME" -f docker-data/config/docker-compose.yml $ADDITIONAL_CONFIGFILE down

exit
