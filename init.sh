#!/bin/bash
docker-compose up -d
sleep 10
docker exec pupilfirst_web bash -c 'bundle exec rails db:setup'
