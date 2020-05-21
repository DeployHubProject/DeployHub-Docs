---
title: "RESTfull API"
linkTitle: "RESTfull API"
weight: 100
description: >
  Using DeployHub APIs to integrate with external DevOps Tools
---


# Object Accessibility

The objects that are accessible via the API are restricted based on the logged-in user. Only objects that are contained within the user's home domain and any sub-domains are accessible via the API (just as they would be through the graphical web interface).

If a requested object does not have "read" permission then it cannot be accessed via the API. Similarly, attempting to modify objects which do not have the appropriate "change" permission is also prohibited. In such cases, the "success" flag returned is "false" and the error is "Permission Denied".

# Logging in to Establishing a Connection

  When issuing calls to the API, the client application must either first issue a "login" call, specifying the username and password or must specify the username and password in each individual call to the API.

# Qualify the Name of the Object

When specifying an object by name you can always qualify the name by prepending it with the name of the domain in which it is contained. The name of the domain should be separated from the name of the object by a period.

## Example

    GLOBAL.USA.Development.demoenv

This specifies that the "demoenv" environment required can be found in the "Development" sub-domain of domain "USA" which is a subdomain of "GLOBAL".

# Use the object's internal ID

Every object has a unique ID. This is used internally in the database as a primary/foreign key. An object is given an ID when it is first created and that ID never changes or is re-used, even if the object itself is deleted. Therefore, if you know the ID of the object you can specify that in the API and RE will know which to object you're referring to, even if the name is not unique.

The query tools in the API generally return the object's internal ID as well as its name. Once you know the ID you can use it in subsequent calls to the API.

To use the ID, just place it where you would normally place the object's name. DeployHub will assume you're specifying an ID if the name given is fully-numeric.

*Do not create objects with fully numeric names - DeployHub will not be able to determine if this is an object id or the object name.*

# Using cURL to access the API 

  Here is an example of how to use cURL to access the API.

  First, we need to login. This operation will return a session ID. We use cURL's --cookie-jar option to store this session ID in the file C:\temp\session.txt

    curl --data "user=omadmin&pass=ompassword" --cookie-jar c:\temp\session.txt http://mac:8080/dmadminweb/API/login

  If the username/password combination is correct, the user is logged in and the success indication is returned.

  The JSESSIONID is stored in the cookie which is stored in the file C:\temp\session.txt

  Now, we can call any of the other API interfaces by specifying the same file in which we stored the session ID returned from the login call. For example, this will return a JSON array containing all the servers in our home and sub-domains to which we have view access

    curl --data "all=Y" --cookie c:\temp\session.txt http://mac:8080/dmadminweb/API/servers
