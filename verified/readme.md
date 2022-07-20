## Usage

The used sample proxies use Apigeecli for deployments. Using a Cloud Shell you have all the prerequisites setup to use this deployment tool.

https://github.com/apigee/apigeecli

Please refer to this github repo for the installation.

For deploying the proxyies run the following command

```sh

export APIGEE_TOKEN=$(gcloud auth print-access-token)

export APIGEE_X_ORG=<my-org>
export APIGEE_X_ENV=<my-env>
export APIGEE_X_HOSTNAME=<my-hostname>

export APIGEE_X_ORG=bap-emea-apigee-6
export APIGEE_X_ENV=default-dev
export APIGEE_X_HOSTNAME=dev.api.apigee.cloud10x.net

./deploy.sh
```


You can use this Postman Collection to make the Demo calls
[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/6502188-d2534914-0809-4c0f-8a35-77b46bfc71e8?action=collection%2Ffork&collection-url=entityId%3D6502188-d2534914-0809-4c0f-8a35-77b46bfc71e8%26entityType%3Dcollection%26workspaceId%3D5c5b4618-97ff-4263-8887-e0b90a9df6e3)