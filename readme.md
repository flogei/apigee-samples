# Apigee Samples

This repository contains basic API Proxies for Apigee X and hybrid to showcase and test basic concepts of API Proxy development. It is grouped into functionality in the different folders.

* **advanced** - more advanced topics combining multiple policies to achive a basic use case.
* **concepts** - these samples focus on API Proxy configuration aside from the use of policies
* **extensions** - these samples use custom code (Java, JavaScript, Python) or show the callout to other systems
* **mediation** - these samples leverage policies that make changes to header, payload, queryparams etc
* **security** - these samples use the policies for authentication via different means (OAuth, JWT, SAML, API Key) and Threat protection
* **traffic-management** - these samples show the usage of Spike Arrest for Throttling, Caching and Quota

## Usage

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

./deploy.sh
```

example variables would be
```sh
export APIGEE_X_ORG=bap-emea-apigee-6
export APIGEE_X_ENV=default-dev

./deploy.sh
```
## Run the Demo Proxies

You can use this Postman Collection to make the Demo calls

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/6502188-d2534914-0809-4c0f-8a35-77b46bfc71e8?action=collection%2Ffork&collection-url=entityId%3D6502188-d2534914-0809-4c0f-8a35-77b46bfc71e8%26entityType%3Dcollection%26workspaceId%3D5c5b4618-97ff-4263-8887-e0b90a9df6e3)

# License
All solutions within this repository are provided under the Apache 2.0 license. Please see the LICENSE file for more detailed terms and conditions.

# Disclaimer
This repository and its contents are not an official Google product.