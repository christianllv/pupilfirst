#!/bin/bash
docker-compose down
docker volume prune -f
docker-compose up -d
sleep 10
docker exec pupilfirst_web_1 bash -c 'bundle exec rails db:setup'
