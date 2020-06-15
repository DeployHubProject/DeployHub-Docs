---
title: "LDAP and Active Directory"
linkTitle: "LDAP and Active Directory"
weight: 70
description: >
  Using LDAP and Active Directory for managing Logins.
---

## LDAP and Active Directory
Your DeployHub login can be controlled by accessing _Users_ in an LDAP server instead of DeployHub's database. This is accomplished by creating a Data Source of Type 'ldap' with parameters that will allow it to access an LDAP database and use the information stored there to gain access to DeployHub. It also populates the _Users_ General tab with Real Name and Email, which it gets from the LDAP database.

To support LDAP integration, you must create an LDAP  _Credential_ whose Username value is in the form of a user id (uid) followed by the necessary Ldap domain components (dc), all comma delimited (i.e., uid=mycompany,dc=example,dc=com). The _Credential's_ Password field contains the password for the user in the LDAP directory. For more on creating _Credentials_ see [Create Your Credentials](/userguide/first-steps/2-define-your-credentials/).

The Data Source has specific parameters that are used to validate a User:

| Field | Description |
| --- | --- |
|**LDAP Server** | I.P. address or hostname of the LDAP Server. The address of the LDAP server, which can include the port (i.e., ldap://ldap.forumsys.com:389). If the port isn't included, it can be put separately into the Port Number parameter.|
|**LDAP Server Encrypted** | Select the box to indicate the LDAP Server should be hidden in the database.|
|**LDAP Server Override** |Select the box if the LDAP Server can be changed.|
|**Active Directory Domain**| Enter the name of the Active Directory Domian within the LDAP Server. |
|**Active Directory Encrypted** | Select the box to indicate the Active Directory Domain Name should be hidden in the database.|
|**Active Directory Override** |Select the box if the Active Directory Domain Name can be changed.|
|**Port Number** | The port on which the LDAP server is listening.
|**Port Number Encrypted** | Select the box to indicate the Port Number should be hidden in the database.|
|**Port Number Override** |Select the box if the Port Number can be changed.|
|**Search Base** | The search base defines the starting point for the search in the LDAP directory tree.Enter the search base (the distinguished name of the search base object) that defines the location in the directory from which the LDAP search begins (i.e., dc=example,dc=com). |
|**Search Base Encrypted** | Select the box to indicate the Search Base should be hidden in the database.|
|**Search Base Override** |Select the box if the Search Base can be changed.|
|**Search Filter**| Always (uid=$USERNAME) (include parenthesis), as this locates the user within the LDAP database using the Username that was entered into the DeployHub Credential. This is the filters to be used for selecting which objects are returned when browsing for the search base, and identifying which objects in your directory are examined, for example email address attributes or user attributes.|
|**Search Filter Encrypted** | Select the box to indicate the Search Filter should be hidden in the database.|
|**Search Filter Override** |Select the box if the Search Filter can be changed.|
