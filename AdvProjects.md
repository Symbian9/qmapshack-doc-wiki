[Prev](DocGisDevices) (GPS Devices) | [Home](Home) | [Manual](DocMain) | (General Actions) [Next](AdvProjActions)
- - -
[TOC]
- - -

# Databases and projects

## Organization of QMapShack data

_(inspired by and partially copied from [QMS newsgroup](http://article.gmane.org/gmane.comp.gis.qlandkartegt.user/2744))_

In the following **data item** means **waypoint**, **track**, **route**, or **area**.

There are 3 physical storage types used in QMS for saving data items:

* `GPX` files (common data format)
* `QMS` files (proprietary efficient binary data format)
* `SQLite` or `MySQL` databases

QMS can load data from files with these types and also from

* `FIT` files (used by Garmin fitness devices),
* `TCX` files (Garmin Training Center XML), 
* `SLF` files (Sigma Log Format).


If selected in the menu `Project - Setup Workspace` data is saved automatically at the end of a QMS run and
regularly after some user-defined time interval.
A backup of databases is recommended from time to time.

All QMS data items belong to a **project**.

In the case of a `GPX` or `QMS` file all data in the file belong to one project.
This can be loaded into the QMS workspace and saved from here to the file.

QMS allows the use of one or more databases.

Each database consists of a tree. Each node of the tree is either a **folder** or a **data item**.
Nodes on the highest level must be folders.

There are 3 types of folders:

* **Group** (displayed with a blue icon),
* **Project** (displayed with a green icon),
* **Other** (displayed with an orange icon)

In addition to this there is a special **Lost & Found** folder. Deleted data items are kept in this folder.
Data can be restored from this folder or deleted. No recovery is possible anymore in the last case.

Group folders cannot contain data items. Only folders can be child nodes of a group folder. Thus, group folders
can be used to group projects.

_Project_ and _other_ folders can have folders and data items as child nodes.

Folders of type _other_ have the same features like those of type _project_. Their main purpose is
to distinguish visibly between basic data of a project and secondary data in it.

If in the following discussion the term _project_ is used, then this includes also the term _other_.

The described database structure can be seen in the QMS database view. Here projects and data items can be selected
with the help of a checkbox for display in the QMS workspace and in the map window.

With this database organization several projects can be saved in one database.

Data items are saved only once in database. They can be referenced in various projects within a given database.

_Example of data organization:_

A group folder (blue) with each hike track and its waypoints in a project folder (green).
Additionally, a green _summary_ folder
that contains again all tracks from the other green folders. As the tracks are just referenced by the
folders they are not stored several times as would have done with `GPX` or `QMS` files.

Other advantages of the use of databases are the possibility

* to load just a few data items of a project into the workspace. With a `GPX` file everything in the file is completely loaded into the workspace,
* to search for data items with a given text string using the context menu entry `Search database` of the database (starting with QMS version 1.6.3.post).

When creating a new reference to a data item QMS offers the choice either to create simply a reference or a
clone (a copy) of the data item.

## Workspace and database windows

_(inspired by [QMS issue 200 discussion](https://bitbucket.org/maproom/qmapshack/issues/200 "QMS issue 200"))_

QMS data items can be found in the data window (if closed, then open it with the menu entries `Window - Data`). This window is split into 2 parts:

* the upper part is the so-called _workspace (window)_,
* the lower part is the so-called _database window_.

Data loaded from files is shown in the workspace. Each file defines a project of its own.

Due to the more sophisticated tree-like structure of databases data in a database is not immediately shown in the workspace. The user must
select with the help of checkboxes those database projects and those data items he wants to have displayed in the workspace 
(and at the same time in the map window).

A checkbox in front of the project name in the workspace allows switching on or off the visibility of all the project data items 
in the map window.

From the workspace perspective all projects are similar. 

Data items can be changed either in special edit windows (use context menu entry `Edit` of item in workspace) or in the map window (left click with mouse 
on data item and select action from toolbar). Data editing in the database window is not supported.

If you do not want to have a data item in the workspace, 
you simply delete it using the context menu entry `Delete`. This will not affect the source of the data item unless you take further actions.

Each project type (project in/from file or project in/from database) has some specific properties. Special attention must be paid to the delete operation 
in the workspace.

A file-type project belongs to exactly one file. It will be written 
from scratch when you save it. The content will be whatever is in the
workspace. By that, a deleted data item will be deleted implicitly from the project when you save it.

The relation between a project in the workspace belonging to a database (a _database-type project_) and its database is more complicated.

A database-type project displays in general only part of the data items of the original project in the database. Other database projects
may exist that are not displayed in the workspace. 

A data item in one database project can be at the same time also part of a second
database project. 

When deleting a data item from one project it is not obvious how to handle the same data item contained 
also in a second project or how to handle data hidden from the workspace.

To avoid additional queries which would be necessary in such a case a delete operation in the workspace for a data item contained in a
database implies only that the data item is deleted from the workspace and not from the database. In practice this means, that the
data item is removed from the workspace and from the map window but not from the database.

If the user wants to delete a data item from the database, then he must use the context menu of this data item in the database window.



- - -
[Prev](DocGisDevices) (GPS Devices) | [Home](Home) | [Manual](DocMain) | [Top](#) | (General Actions) [Next](AdvProjActions)
