#!/bin/sh

docker-compose -p "$PROJECTNAME" -f docker-data/config/docker-compose.yml $ADDITIONAL_CONFIGFILE exec php crontab -u www-data /tmp/crontab

exit
