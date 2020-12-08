#!/bin/bash
docker-compose up -d
sleep 10
docker exec pupil_web bash -c 'bundle exec rails db:setup'
