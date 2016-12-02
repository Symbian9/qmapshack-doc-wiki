[Prev](DocGisDevices) (GPS Devices) | [Home](Home) | [Manual](DocMain) | (Data handling) [Next](AdvDataHandling)
- - -
[TOC]
- - -

# Databases and projects

## Organization of QMapShack data

(inspired by and partially copied from [QMS newsgroup](http://article.gmane.org/gmane.comp.gis.qlandkartegt.user/2744))

In the following **data item** means **waypoint**, **track**, **route**, or **area**.

There are 3 physical storage types used in QMS for saving data items:

* `GPX` files (common data format)
* `QMS` files (proprietary efficient binary data format)
* `SQLite` or `MySQL` databases

If selected in the menu `Projects - Setup Workspace` data is saved automatically at the end of a QMS run and 
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
with the help of a checkbox for display in the QMS workspace.

With this database organisation several projects can be saved in one database.

Data items are saved only once in database. They can be referenced in various projects within a given database.

_Example of data organisation:_

A group folder (blue) with each hike track and its waypoints in a project folder (green). 
Additionally, a green _summary_ folder 
that contains again all tracks from the other green folders. As the tracks are just referenced by the
folders they are not stored several times as would have done with `GPX` or `QMS` files.

Other advantages of the use of databases are the possibility

* to load just a few data items of a project into the workspace. With a `GPX` file everything in the file is completely loaded into the workspace,
* to search for data items with a given text string using the context menu entry `Search database` of the database (starting with QMS version 1.6.3.post).

When creating a new reference to a data item QMS offers the choice either to create simply a reference or a 
clone (a copy) of the data item.

- - -
[Prev](DocGisDevices) (GPS Devices) | [Home](Home) | [Manual](DocMain) | [Top](#) | (Data handling) [Next](AdvDataHandling)
