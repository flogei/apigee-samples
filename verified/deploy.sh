#!/bin/sh

# Copyright 2021 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

####################################
### function: generate_edge_json ###
####################################
generate_edge_json() {
  SCRIPTPATH="$( cd "$(dirname "$0")" || exit >/dev/null 2>&1 ; pwd -P )"

  rm -f "$SCRIPTPATH"/edge.json
  cat <<EOF >> "$SCRIPTPATH/edge.json"
{
    "version": "1.0",
    "envConfig": {
        "$APIGEE_X_ENV": {
            "targetServers": [],
            "virtualHosts": [],
            "caches": [],
            "kvms": []
        }
    },
    "orgConfig": {
        "apiProducts": [
            {
                "name": "Samples-APIProduct",
                "apiResources": [],
                "approvalType": "auto",
                "attributes": [
                    {
                        "name": "access",
                        "value": "public"
                    }
                ],
                "description": "",
                "displayName": "Samples APIProduct",
                "environments": [
                    "$APIGEE_X_ENV"
                ],
                "proxies": [
                    "samples-traffic-enforce-quota-simple"
                ]
            }
        ],
        "developers": [
            {
                "email": "janedoe@example.com",
                "firstName": "Jane",
                "lastName": "Doe",
                "userName": "janedoe",
                "attributes": []
            }
        ],
        "developerApps": {
            "janedoe@example.com": [
                {
                    "name": "sampleApp",
                    "attributes": [
                        {
                            "name": "displayName",
                            "value": "Sample App"
                        }
                    ],
                    "apiProducts": [
                        "Samples-APIProduct"
                    ],
                    "callbackUrl": "https://httpbin.org/get",
                    "scopes": []
                }
            ]
        }
    }
}
EOF
}

set -e

echo This script deploys all sample API proxies to your organization on the Apigee API Platform.

echo Deploying all samples to $APIGEE_X_ENG and $APIGEE_X_ORG available under $APIGEE_X_HOSTNAME

cd traffic-management/

for proxydir in *; do
    if [ -d "${proxydir}" ]; then
        # Deploy with Apigeecli
        echo Deploying Proxy $proxydir
        apigeecli apis create bundle -p $proxydir/apiproxy -o "$APIGEE_X_ORG" -t "$APIGEE_TOKEN" -n $proxydir 
        
        # Deploy with Sackmesser
        # SCRIPTPATH=$( (cd "$(dirname "$0")" && pwd ))
        # sackmesser deploy --googleapi --async -d "$proxydir" -t "$APIGEE_TOKEN" -o "$APIGEE_X_ORG" -e "$APIGEE_X_ENV"  \
        # --description "See Apigee-samples traffic-management"
    fi
done

cd ../

echo "Deployment complete."

echo "Setting up an API Product, Developer and App"

# generate edge.json file
# generate_edge_json
# sackmesser deploy --googleapi -o "$APIGEE_X_ORG" -e "$APIGEE_X_ENV" -t "$APIGEE_TOKEN" -h "$APIGEE_X_HOSTNAME" -d "$SCRIPTPATH"

echo "Login to apigee.google.com to view and interact with the sample API proxies"

echo "To invoke the samples, see the postman collection."