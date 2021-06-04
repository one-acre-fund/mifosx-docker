# mifosx-docker

[![Docker Hub](https://badgen.net/docker/pulls/oneacrefund/mifos-x?icon=docker)](https://hub.docker.com/r/oneacrefund/mifos-x)

A Docker image for [MIFOS X](https://github.com/openMF/web-app) UI for [Apache Fineract](https://github.com/apache/fineract)

Published on Docker Hub as [oneacrefund/mifos-x](https://hub.docker.com/r/oneacrefund/mifos-x)

## How to build

```sh
docker run . -t oneacrefund/mifos-x:latest
```

## How to run

```sh
docker run -it -p 8080:8080 oneacrefund/mifos-x
```

## Configuration

This image uses [dockerize](https://github.com/jwilder/dockerize/) to inject configuration from environment variables. Supported variables:

| Name | Comment | Default |
| --- | --- | --- |
| `SERVER_URL` | URL for Fineract API. `/fineract-provider/api/v1` will be appended to it. | `https://demo.fineract.dev` |
| `TENANT_ID`  | Tenant name | `default` |
