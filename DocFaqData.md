[Prev](DocFaqConfig) (Configuring and running QMapShack) | [Home](Home) | [Manual](DocMain) | (Data handling) [Next](DocFaqHandling)
- - -
[TOC]
- - -

# Frequently Asked Questions - Databases and projects

## How are QMS data items organized?

(inspired by and partially copied from [QMS newsgroup](http://permalink.gmane.org/gmane.comp.gis.qlandkartegt.user/2744))

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

## Why does QMapsShack use a separate workspace.db to save data?

**Source:** [Newsgroup discussion about QMS INI information](https://sourceforge.net/p/qlandkartegt/mailman/message/35276035)

The philosophy of the QMS workspace concept is to support handling of temporary project data which exists only for a short time 
period and for which there is no need to save it permanently into a user-defined database 
(shown in the lower part of the "Data" dock widget). 
In order to avoid the loss of such temporary project data without
forcing the user to save it as permanent data QMS uses the `workspace.db` database. This file contains all the data of the 
current QMS workspace (upper part of the "Data" dock widget). Thus, this state of the workspace can be restored after a 
restart of QMS.

The database setup is part of the configuration and saved in a configuration file (*.config or *.ini file, Windows registry). The workspace setup 
is considered as temporary and therefore not part of the configuration.

**Warnings:** 
* QMS maintains only one `workspace.db`file!
* The workspace data can be linked to data in a database. When restarting QMS with a different configuration 
(with different databases) workspace data gets lost if a link to the database can't be restored! 


## Is there an easy way to "select all" the contents of one project to drag them into another? 

For answer see next topic!

## Is there a way to merge projects together?

**Source:** [gmane.comp.gis.qlandkartegt](http://article.gmane.org/gmane.comp.gis.qlandkartegt.user/2612)

With QMapShack version 1.6.1 or later:

  * Load all stuff you want to have in a single project into the workspace (possibly resulting in several new projects)
  * Right click on the map window and choose "Select Items on Map"
  * Follow the instructions displayed and select whatever data you want to have in one project.
  * When the selection is finished, copy everything into the destination project.
  * Remove all unnecessary projects from the workspace

If you use a database you do not have to load all data of a project.
You can load only the items needed. Additionally, if you store a newly created
project into the database you do not need to clone (duplicate) the data.

## How to edit quickly the name of a project?

**Compare:** [QMS issues list](https://bitbucket.org/maproom/qmapshack/issues/160/update-of-diary-after-adding-a-waypoint)

Depending on the number of data objects (tracks, routes, waypoints) in a project in the workspace it may take a relatively long time
to open the project edit window (right click on the project name in the workspace and select `Edit` menu item).
The reason for this is that the project diary with all the selected data objects has to be created.

If the only goal is to edit the name of a project then open the project with just a few data objects. The project edit
window is then opened very quickly and the project name can be edited in it.

## How to find the location of a database file used in QMapShack?

Move the mouse pointer on the database name in the main window. A bubble box appears and shows the physical location of the
database file.

- - -
[Prev](DocFaqConfig) (Configuring and running QMapShack) | [Home](Home) | [Manual](DocMain) | [Top](#) | (Data handling) [Next](DocFaqHandling)
