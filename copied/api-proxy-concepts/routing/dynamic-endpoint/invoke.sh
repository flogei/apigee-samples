#!/bin/bash

echo Using org and environment configured in /setup/setenv.sh

source ../../setup/setenv.sh

set -x

curl "http://$org-$env.$api_domain/dynamic-endpoint?routeTo=fb"

curl "http://$org-$env.$api_domain/dynamic-endpoint?routeTo=tw"