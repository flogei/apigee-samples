## Usage

The used sample proxies use Apigeecli for deployments. Using a Cloud Shell you have all the prerequisites setup to use this deployment tool.

https://github.com/apigee/apigeecli

Please refer to this github repo for the installation.

For deploying the proxyies run the following command

```sh

export APIGEE_TOKEN=$(gcloud auth print-access-token)

export APIGEE_X_ORG=<my-org>
export APIGEE_X_ENG=<my-env>
export APIGEE_X_HOSTNAME=<my-hostname>

export APIGEE_X_ORG=bap-emea-apigee-6
export APIGEE_X_ENG=default-dev
export APIGEE_X_HOSTNAME=dev.api.apigee.cloud10x.net

./deploy.sh
```
