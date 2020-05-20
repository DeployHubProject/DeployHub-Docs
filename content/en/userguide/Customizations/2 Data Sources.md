---
title: "Data Source"
linkTitle: "Data Source"
weight: 20
description: >
  Managing Data Sources such as ODBC connections.
---
## Data Source

You may need to acquire data outside of the DeployHub system, for example with an ODBC connection to Oracle. The _Data Source_ object communicates with various databases, HTTP servers, FTP servers, etc., and can be used to take advantage of this kind of information sharing.

The _User_ can edit _Data Source_s by using an Access tab and Properties tab. In addition, the General tab shows a summary of the _Data Source_ configuration. To edit the information within the General tab, click on the pencil icon in the right-hand corner.

## Properties Tab

The Data Source Properties tab allows you to configure a _Data Source_ connection, e.g. specifying a broker name along with the required User Name and Password. Click the plus sign (+) for the _User_ to select from a list of Properties and add an associated value for it. Clicking on the pencil icon allows the _User_ to edit an existing Property. Selecting the Property from the table and clicking on the "X" in the upper right-hand corner deletes the selected Property from the table. There are five different types of Data Sources. They are listed here along with their Properties.

## ODBC Data Source Properties

| Field | Description |
| --- | --- |
| _**Name**_ | <ul style="list-style-type: none;"><li>**Data source name**: Name of the ODBC data source.</li><li>**password** : ODBC password.</li><li>**username** : ODBC user name.</li></ul>  |
| _**Value**_ | <ul style="list-style-type: none;"><li>**Data source name** : The name of the data structure that contains the information about a specific database that an Open Database Connectivity ( ODBC ) driver needs in order to connect to it.</li><li>**password** : The password that will be used to access the object.</li><li>**username** : The username that will be used to access the object.</li></ul> |
| _**Encrypted**_ | Checkbox that indicates that the value is to be encrypted in the DeployHub database. |
| _**Overridable**_ | Checkbox that indicates the _Property_ can be changed at runtime by specifying a replacement value in the _Component Item_. |
| _**Appendable**_ | Checkbox that indicates the _Property_ can be appended to at runtime in the _Component Item._ |

## LDAP Data Source Properties

| Field | Description |
| --- | --- |
| _**Name**_ |  <ul style="list-style-type: none;"><li>**LDAP Server** : A specific LDAP server, such as LDAP://server01.</li><li>**Port Number** : The port on which the LDAP server is listening.</li><li>**Search Base** : A search base (the distinguished name of the search base object) defines the location in the directory from which the LDAP search begins.</li><li>**Search Filter** : Used for determining search criteria.</li></ul> |
| _**Value**_ | <ul style="list-style-type: none;"><li>**LDAP Server** : I.P. address or hostname of the LDAP Server.</li><li>**Port Number** : The port on which the LDAP server is listening.</li><li>**Search Base** : The search base defines the starting point for the search in the LDAP directory tree.</li><li>**Search Filter** : Filters are used for selecting which objects are returned when browsing for the search base, and identifying which objects in your directory are examined, for example email address attributes or user attributes.</li></ul> |
| _**Encrypted**_ | Checkbox that indicates that the value is to be encrypted in the DeployHub database. |
| _**Overridable**_ | Checkbox that indicates the _Property_ can be changed at runtime. |
| _**Appendable**_ | Checkbox that indicates the _Property_ can be appended to at runtime. |
