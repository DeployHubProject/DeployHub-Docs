---
title: "Change Request"
linkTitle: "Change Request"
weight: 82
description: >
  Tracking Change Request.
---
## Change Request

The _Change Request_ tab (DeployHub Pro only) shows enhancement requests and bugs for a selected _Component_ for several popular bug tracking systems, including Bugzilla, GitHub, and Jira.

External bug tracking systems are represented in DeployHub as a Data Source. The _Gener_al tab for the _Component_ allows for the selection and assignment of a _Data Source_ to the _Component_. _Change Request_s can then be assigned to the _Component_ in the _Change Request_s tab by clicking on the plus &#39;+&#39; icon in the upper right. This will display all the _Change Request_s (Enhancements, Bugs, etc.) from the assigned _Data Source_ in the resulting Select Bug Record pop up window, and one or more of these can be assigned to the _Component_ by clicking on the box to the left of each CR ID field.

The _Change Request_ tab contains two sections. The upper section is titled CR Opened/Closed over Time, which contains a burndown chart showing all the _Change Request_s for the _Component_. A Calendar runs across the top to show when _Change Request_s were opened and closed. _Change Request_s are shown in the horizontal area below, with open _Change Request_s shown in light yellow, while closed are shown in dark gray. Each line represents a _Change Request_, which begins with the date that it was added to the _Component_. The area turns dark gray at the point of the Calendar where the _Change Request_ was closed. Using the scrolling device on the User&#39;s mouse or trackpad causes the entire area to expand and contract which, along with the ability to scroll back and forth via clicking and dragging, allows the User to easily view the entire Release Plan from beginning to end, in detail, while using the Calendar along the top as a reference. The numbers along the left side represent the number of _Change Request_s. This will adjust vertically to fit the total number of _Change Request_s for the _Component_. This can be adjusted further with the User&#39;s mouse or trackpad.

The lower section contains a list of _Change Request_s with the fields CR ID, Title, and Status. Clicking on the CR ID takes the User to a new tab in the browser that contains the source of the _Change Request_. For instance, if the _Component_ has a _Change Request__Data Source_ of the type GitHub, clicking on the CR ID field for a _Change Request_ will open a tab with the bug or enhancement request within github.com, allowing the User the ability to update, close, or read about it in detail. The Title field holds the title of the _Change Request_ within the bug tracking system. The various bug tracking systems used by DeployHub have their own statuses. Bugzilla for instance, has statuses such as New, Unconfirmed, Assigned, etc. DeployHub interprets these as either &#39;open&#39; or &#39;closed&#39; and displays them in the Status field with a gold or dark gray background respectively.
