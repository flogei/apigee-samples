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

set +e

echo This script deploys all sample API proxies to your organization on the Apigee API Platform.

echo Deploying all samples to $APIGEE_X_ENV and $APIGEE_X_ORG available under $APIGEE_X_HOSTNAME

apiproxyArray=""
apigeecli prefs set -o $APIGEE_X_ORG

# Deploying Traffic Management Samples
cd traffic-management/

for proxydir in *; do
    if [ -d "${proxydir}" ]; then
        # Deploy with Apigeecli
        echo Deploying Proxy $proxydir
        apigeecli apis create bundle -p $proxydir/apiproxy -o "$APIGEE_X_ORG" -t "$APIGEE_TOKEN" -n samples-traffic-$proxydir 
                
        # Deploy with Sackmesser
        # SCRIPTPATH=$( (cd "$(dirname "$0")" && pwd ))
        # sackmesser deploy --googleapi --async -d "$proxydir" -t "$APIGEE_TOKEN" -o "$APIGEE_X_ORG" -e "$APIGEE_X_ENV"  \
        # --description "See Apigee-samples traffic-management"
    fi
done

cd ../

# Deploying Security Samples
cd security/

for proxydir in *; do
    if [ -d "${proxydir}" ]; then
        # Deploy with Apigeecli
        echo Deploying Proxy $proxydir
        apigeecli apis create bundle -p $proxydir/apiproxy -o "$APIGEE_X_ORG" -t "$APIGEE_TOKEN" -n samples-security-$proxydir 
    fi
done

cd ../

# Deploying Advanced Samples
cd advanced/

for proxydir in *; do
    if [ -d "${proxydir}" ]; then
        # Deploy with Apigeecli
        echo Deploying Proxy $proxydir
        apigeecli apis create bundle -p $proxydir/apiproxy -o "$APIGEE_X_ORG" -t "$APIGEE_TOKEN" -n samples-advanced-$proxydir 
    fi
done

cd ../

# Deploying Concepts Samples
cd concepts/

for proxydir in *; do
    if [ -d "${proxydir}" ]; then
        # Deploy with Apigeecli
        echo Deploying Proxy $proxydir
        apigeecli apis create bundle -p $proxydir/apiproxy -o "$APIGEE_X_ORG" -t "$APIGEE_TOKEN" -n samples-concepts-$proxydir 
    fi
done

cd ../

# Deploying Extensions Samples
cd extensions/

for proxydir in *; do
    if [ -d "${proxydir}" ]; then
        # Deploy with Apigeecli
        echo Deploying Proxy $proxydir
        apigeecli apis create bundle -p $proxydir/apiproxy -o "$APIGEE_X_ORG" -t "$APIGEE_TOKEN" -n samples-extensions-$proxydir 
    fi
done

cd ../

# Deploying Mediation Samples
cd mediation/

for proxydir in *; do
    if [ -d "${proxydir}" ]; then
        # Deploy with Apigeecli
        echo Deploying Proxy $proxydir
        apigeecli apis create bundle -p $proxydir/apiproxy -o "$APIGEE_X_ORG" -t "$APIGEE_TOKEN" -n samples-mediation-$proxydir 
    fi
done

cd ../

echo "Deployment complete."

echo "Setting up an API Product, Developer and App"

apigeecli kvms create -e "$APIGEE_X_ENV" -t $APIGEE_TOKEN -n "UGBackendSecrets"
apigeecli kvms entries create -m "UGBackendSecrets" -k "Backend1" -l "foobar" -e "$APIGEE_X_ENV" -t $APIGEE_TOKEN
apigeecli developers create -n "janedoe@gmail.com" -f "Jane" -s "Doe" -u "janedoe" -t $APIGEE_TOKEN
apigeecli products create -n "Samples API Product" -m "Samples API Product" -e "$APIGEE_X_ENV" -f auto --opgrp apiproduct.json -t $APIGEE_TOKEN
apigeecli apps create -e "janedoe@gmail.com" -n "Sample App" -p "Samples API Product" -t $APIGEE_TOKEN
apigeecli apps keys create -
d "janedoe@gmail.com" -n "Sample App" -t $APIGEE_TOKEN -k "myAPIKey123" -r "myAPISecret123" -p "Samples API Product"

echo "Login to apigee.google.com to view and interact with the sample API proxies"

echo "To invoke the samples, see the postman collection."