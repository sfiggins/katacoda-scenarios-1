#!/bin/bash

cd curiefense/deploy/compose/
docker-compose up -b

# This is Probably better to run as a cron. Think of this as a remote command
# sent to the server. You want the process to finish and exit, not loop endlessly.

generate_traffic () {
  for i in {1..10}; do curl -I https://[[HOST_SUBDOMAIN]]-30081-[[KATACODA_HOST]].environments.katacoda.com; done
}

generate_more_traffic () {
  for i in {1..20}; do curl -I https://[[HOST_SUBDOMAIN]]-30081-[[KATACODA_HOST]].environments.katacoda.com/404; done
}

while :
do
  generate_traffic
  sleep 4
  generate_more_traffic
done
