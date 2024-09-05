
## DeployHub Change Requests

The integration of Change Request systems are supported in DeployHub through the use of a _Data Source_. To integrate Change Request you must first define a Change Request _Data Source_ from the _Data Source_ Dashboard. Once created, you will be able to select the _Data Source_ from the General Details "Change Request _Data Source_" field of your _Application_ and/or _Component_. When you have a Change Request _Data Source_ defined, you can add issue tickets using the Change Request section of the _Application_ or _Component_ Dashboards.

### Creating Change Request _Data Sources_

Jira, Bugzilla and GitHub are represented in DeployHub as _Data Source_ Types. Because a _Data Source_ is associated to a specific _Component_ or _Application_ you will need to map a unique _Data Source_ for each system's repository (Organization, Repository, Product, Project Key) where you are tracking the _Component_ or _Application_.  In a traditional release process, a _Component_ and _Application's_ repository may be the same.  Because microservices are often managed in their own repositories, you may need to define a _Data Source_ for each of your microservice _Components_. For more on creating a Change Request _Data Source_ see [Managing Data Sources](/userguide/advanced-features/deployments/2-data-sources/).

Change Request that are tracked at the _Component_ level are rolled up to the _Application_ level.  All change request associated to _Components_ and _Applications_ are rolled up to the _Release_.

Once connected, the Change Request Section for the _Component_ and the _Application_ shows all Change Request manually added. If a _Data Source_ has not been assigned, you will see a message "No Change Request Data Source has been setup."  Once setup, you can use the '+Add' option to associate specific change request to the _Component_ or _Application_. Selecting +Add will create a new row in the table with a drop down list box.  This drop down will contain all change request retrieved by the _Data Source_. Select the Change Request and use the Save option to commit the new row to the table.  Use the Edit option to switch a Change Request, or Delete to remove a Change Request.
