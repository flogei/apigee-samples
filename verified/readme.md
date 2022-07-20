# Usage

The used sample proxies use Apigeecli for deployments. Using a Cloud Shell you have all the prerequisites setup to use this deployment tool.

## Prerequisites

### Apigee
You need an up and running Apigee X/hybrid organization (Setup an Eval here: https://cloud.google.com/apigee/docs/api-platform/get-started/provisioning-intro)

### Deployment Tools
The scripts in this repo work with the apigeecli to deploy/undeploy the artifacts into an Organization via the Apigee API

https://github.com/apigee/apigeecli

Please refer to this github repo for the installation and adding it to your PATH variable to use in the scripts.

## Deploying the Demo Proxies

For deploying the proxyies run the following command

```sh

export APIGEE_TOKEN=$(gcloud auth print-access-token)

export APIGEE_X_ORG=<my-org>
export APIGEE_X_ENV=<my-env>
export APIGEE_X_HOSTNAME=<my-hostname>

./deploy.sh
```

example variables would be
```sh
export APIGEE_X_ORG=bap-emea-apigee-6
export APIGEE_X_ENV=default-dev
export APIGEE_X_HOSTNAME=dev.api.apigee.cloud10x.net

./deploy.sh
```
## Run the Demo Proxies

You can use this Postman Collection to make the Demo calls

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/6502188-d2534914-0809-4c0f-8a35-77b46bfc71e8?action=collection%2Ffork&collection-url=entityId%3D6502188-d2534914-0809-4c0f-8a35-77b46bfc71e8%26entityType%3Dcollection%26workspaceId%3D5c5b4618-97ff-4263-8887-e0b90a9df6e3)