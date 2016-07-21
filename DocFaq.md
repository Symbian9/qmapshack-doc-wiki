[Home](Home)

[TOC]

# Frequently Asked Questions

********

## How are QMS data items organised?

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

In the case of a `GPX` or `QMS` file all data in the file belong to one project
which can be loaded into the QMS workspace and saved from here to the file.

QMS allows the use of one or more databases. 

Each database consists of a tree. Each node of the tree is either a **folder** or a **data item**.
Nodes on the highest level must be folders.

There are 3 types of folders:
* **Group** (displayed with a blue icon),
* **Project** (displayed with a green icon),
* **Other** (displayed with an orange icon)

In addition to this there is a special **Lost & Found** folder. Deleted data items are kept in this folder.
Data can be restored from this folder or deleted. No recovery is possible anymore in the last case.

Group folders can not contain data items. Only folders can be child nodes of a group folder. Thus, group folders
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
* to load just a few data items of a project into the workspace. With a `GPX` file everything in
the file is completely loaded into the workspace,
* to search for data items with a given text string using the context menu entry `Search database` of the
database (starting with QMS version 1.6.3.post).

When creating a new reference to a data item QMS offers the choice either to create simply a reference or a 
clone (a copy) of the data item.

## Is there an easy way to "select all" the contents of one project to drag them into another? 
## Is there a way to merge projects together?

**Source:** [gmane.comp.gis.qlandkartegt](http://article.gmane.org/gmane.comp.gis.qlandkartegt.user/2612)

With QMapShack version 1.6.1 or later:

  * Load all stuff you want to have in a single project into the workspace (possibly resulting in several new projects)
  * Right click on the map window and choose "Select Items on Map"
  * Follow the instructions displayed and select what ever data you want to have in one project.
  * When the selection is finished, copy everything into the destination project.
  * Remove all unnecessary projects from the workspace

If you use a database you do not have to load all data of a project.
You can load only the items needed. Additionally, if you store a newly created
project into the database you do not need to clone (duplicate) the data.


## Is there a possibility to display small roads/tracks in a vector map without zooming in too much?

**Source:** [www.naviboard.de](http://www.naviboard.de/vb/showthread.php?t=59676)

This problem appears with a vector map like [Freizeitkarte](http://www.freizeitkarte-osm.de/) where smaller 
roads/tracks are only visible at a zoom level where the overview gets lost.

There is no such possibility in QMapShack. The detail levels for vector map data are defined by the map author and can't be
changed within QMapShack.

Users reported about the following ways to improve the visibility of small roads:

* Choose the menu item `View - Setup Map View - Projections&Datum`
* Append to the given configuration string one of the following strings:
  * `+lat_ts=60` This sets the *latitude of true scale* for a Mercator projection. The closer you get to the polar regions the more the map will be skewed horizontally in comparison to the vertical scale. At the *latitude of true scale* (usually 0 for the equator) the scales are equal.
  * `+k_0=0.3` (**Source:** [gmane.comp.gis.qlandkartegt](http://permalink.gmane.org/gmane.comp.gis.qlandkartegt.user/2688))  This is an additional scale factor on the normal scale. A value of 1.0 will have no effect. Try to increase or decrease the given value to get the wanted result

## Is there a possibility to choose the preferred road class when routing?

**Source:** [www.naviboard.de](http://www.naviboard.de/vb/showthread.php?t=59418)

Routing in QMapShack depends on the [Routino](http://routino.org) package and this package does not offer an option to select a preferred road type.

Routing profiles are saved in an XML-file (/usr/share/routino/profiles.xml). Here the preferences/weights of 
different road types can be modified by the user.

## Can I run several QMS instances at the same time?

As a general rule don't do this. QMS saves workspace information in the file `workspace.db`. There is only one such
file for all QMS instances. If this file is used by several QMS instances at the same time then the 
QMS workspace data behaviour is unpredictable.

## User-relevant QMapShack directories (Windows version)

* Directories relative to location of `qmapshack.exe`:
    * `.\translations`: language files
    * `.\routino-xml`: routino configuration files
* Other directories:
    * `c:\Users\yor_user_name\AppData\Local\Temp\org.qlandkarte.QMapShack.log`: logfile written if command line option
      `-f`is used
    * `c:\Users\your_user_name\.QMapShack`: tile caches for online maps
    * `c:\Users\your_user_name\.config\QLandkarte\workspace.db`: backup of last used workspace - used when QMapShack is restarted
    
    
## What is the maximum Routino databases file size that can be handled by the QMapShack Windows version?

Due to limitations in the Windows POSIX API Routino can't handle files larger than 4GB.

