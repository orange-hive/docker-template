#!/bin/sh

docker compose --project-directory "$(pwd)" --env-file "$(pwd)/.env" -p "$PROJECTNAME" -f docker-compose/docker-compose.yml exec php crontab -u www-data /tmp/crontab

exit
