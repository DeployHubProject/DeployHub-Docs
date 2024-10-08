---
title: "Swagger Integration"
linkTitle: "Swagger Integration"
weight: 366
description: >
  Tracking Swagger for Your Component
---

![swagger](/userguide/images/Swagger-logo.png)

## Swagger

DeployHub Pro uses [Swagger](https://swagger.io/) to display your microservice / API documentation, based on your _Component Version_. Developers create, or automate the creation of Swagger documentation. Once created the Swagger documentation can be associated to the _Component Version_.

### Uploading Swagger Documentation

You can use the DeployHub Pro _Component_ Detail view to manually upload your Swagger documentation for your _Component_. Alternatively, the recommended approach is to use the CI/CD Command Line Interface to automatically add your Swagger documentation file. Refer to the [CI/CD CLI details](https://github.com/ortelius/ortelius-cli/blob/main/doc/dh.md) for incorporating Swagger into your pipeline process.

> Note: Swagger or OpenAPI formats can be used.

#### Swagger and OpenAPI File Names Scanned for

- swagger.yaml
- swagger.yml
- swagger.json
- openapi.json
- openapi.yaml
- openapi.yml

### Viewing Component Swagger Data

Swagger data is associated to a particular _Component Version_ and can be seen by going to the Component Detail View.
