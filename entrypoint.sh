#!/bin/bash
# Wait for database running:
sleep 5
while [[ $(nc -z $DB_HOST 5432 &> /dev/null; echo $?) -ne 0 ]]; do echo pod is not running;sleep 3; done

exec /usr/bin/supervisord

