### Attributes

Attributes are environment variables that need to be assigned to the _Object_.

Attributes can be assigned at multiple levels, from the Global _Domain_ down to an individual _Component_ and have a "scope." Lower level Objects can override a higher level Object.  Below is the order in which Attributes can be overridden:

| Object  | Description |
| --- | --- |
| **Global** | Contains all Environment variables and any "additional attributes" set by the user when running that task. |
| **Environment** | Overrides any Global variables during a deployment. |
| **Application** | Overrides the _Environment_ variables during a deployment. |
| **Endpoint** | Overrides the _Application_ variables during a deployment. |
| **Component** | Overrides the  _Application_ variables during a deployed.

Attributes can be given any Name and a Value. Use +Add to add Attributes to the table. Use Save to confirm.  Use the checkbox to Delete or Edit an Attribute.  
