#!/bin/bash

echo Using org and environment configured in /setup/setenv.sh, $org and $env

source ../../setup/setenv.sh

curl http://$org-$env.$api_domain/cacheforecast/forecastrss?"w=12797282" -I
