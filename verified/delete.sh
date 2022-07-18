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

set -e

echo This script deletes all sample API proxies to your organization on the Apigee API Platform.

echo Deleting all samples in $APIGEE_X_ENV and $APIGEE_X_ORG available under $APIGEE_X_HOSTNAME

#sackmesser clean --googleapi --quiet -t "$APIGEE_TOKEN" -o "$APIGEE_X_ORG" proxy samples-traffic-responsecache 
#sackmesser clean --googleapi --quiet -t "$APIGEE_TOKEN" -o "$APIGEE_X_ORG" proxy samples-traffic-enforce-quota-simple
#sackmesser clean --googleapi --quiet -t "$APIGEE_TOKEN" -o "$APIGEE_X_ORG" proxy samples-traffic-enforce-quota-key

cd traffic-management/

for proxydir in *; do
    if [ -d "${proxydir}" ]; then
        # Deploy with Apigeecli
        echo Deleting Proxy $proxydir
        # apigeecli apis undeploy -e $APIGEE_X_ENV -n samples-traffic-$proxydir -v -1
        apigeecli apis delete -o "$APIGEE_X_ORG" -t "$APIGEE_TOKEN" -n samples-traffic-$proxydir 
        
        # Deploy with Sackmesser
        # SCRIPTPATH=$( (cd "$(dirname "$0")" && pwd ))
        # sackmesser deploy --googleapi --async -d "$proxydir" -t "$APIGEE_TOKEN" -o "$APIGEE_X_ORG" -e "$APIGEE_X_ENV"  \
        # --description "See Apigee-samples traffic-management"
    fi
done

echo "Deleting API Product, Developer and App"

# sackmesser clean developer "janedoe@example.com" --googleapi -t "$APIGEE_TOKEN" -o "$APIGEE_X_ORG"
# sackmesser clean app "janedoe@example.com" --googleapi -t "$APIGEE_TOKEN" -o "$APIGEE_X_ORG"

apigeecli apps delete -n "Sample App" -t $APIGEE_TOKEN -i $(apigeecli apps get -n "Sample App" | jq -r '.[]|.developerId')
apigeecli products delete -n "Samples API Product"
apigeecli developers delete -n "janedoe@gmail.com"


echo "Deletion complete."