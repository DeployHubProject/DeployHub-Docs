---
title: "AWS Lamda"
linkTitle: "AWS Lamda"
weight: 330
description: >
  Versioning your AWS Lamda Functions.
---

![Lambda](/userguide/images/lambda.png)

## Lambda Functions

For AWS users, Lambda is a critical computing service that executes Lambda Functions, or code, based on an event. Its primary job is to manage the computing resources needed by that function for that event. It determines the computing resources based on configurations associated to the Function. Software developers create Lambda Functions by writing code with Lambda specifications that allow it to execute the code. Once ready, the code is zipped and copied to AWS Lambda. Each Function has a laundry list of configurations that tell Lambda how to interact with the Functions for those event triggers. In essence, your code is only a part of the Lambda Function, the other part are the specifications themselves. Your code and specifications will no doubt change over time.

## Lambda Functions and DeployHub

DeployHub treats your Lambda Function like any other _Component_.  _Components_ have configuration Attributes. Each version of your Lambda Function will have a set of attributes or specifications that are then tracked and versioned. A change to a specification creates a new version of the Lambda Function. And lastly, a _Component_ has Pre and Post _Actions_ that are executed prior to a deployment. In a Pre _Action_, DeployHub performs the activities to retrieve your code from an external repository like GitHub, zips it up, and applies the configurations specifications. A Post-Action moves the Lambda Function to AWS, or if it is a DB function, to the AWS DynamoDB table.

## Steps for Lambda Functions

The following steps are common when using DeployHub to update AWS.

| Step | Description |
| --- | --- |
| Step 1 | Define a Component to DeployHub indicating which source code repository the code should be pulled from and what Domain it should be associated to. You can create a "Lambda" _Domain_ to organize your Lambda Functions making them easy to find and share. |
| Step 2 | You define your Components Attributes. These are the Lambda specifications for your Lambda Function. |
| Step 3 | You define a Lambda Pre-Action that zips your code and pulls the Component’s Attributes as command line parameters.|
| Step 4 | The Post Action then executes an AWS command line that deploys the zip file to Lambda passing the Attributes as command parameters.|

Note: DeployHub Credentials can be used for authentication and associated to AWS.

For more information see:

- [Customizing Actions](/userguide/first-steps/2-define-your-actions/)
- [Procedures and Functions](/userguide/customizations/2-define-your-functions-and-procedures/)
