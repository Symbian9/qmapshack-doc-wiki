[Prev](DocFaqConfig) (Configuring and running QMapShack) | [Home](Home) | [Manual](DocMain) | (Data handling) [Next](DocFaqHandling)
- - -
[TOC]
- - -

# Frequently Asked Questions - Databases and projects



## Why does QMapShack use a separate workspace.db to save data?

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
* QMS maintains only one `workspace.db` file!
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
