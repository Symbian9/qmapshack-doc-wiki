[Home](Home)

[TOC]

# Frequently Asked Questions

********


## Is there an easy way to "select all" the contents of one project to drag them into another? 
## Is there a way to merge projects together?

**Source:** [http://article.gmane.org/gmane.comp.gis.qlandkartegt.user/2612](http://article.gmane.org/gmane.comp.gis.qlandkartegt.user/2612)

With QMapShack version 1.6.1 or later:
* Load all stuff you want to have in a single project into the workspace (possibly resulting in several new projects)
* Right click on the map window and choose "Select Items on Map"
* Follow the instructions displayed and select what ever data you want to have in one project.
* When the selection is finished, copy everything into the destination project.
* Remove all unnecessary projects from the workspace
If you use a database you do not have to load all data of a project.
You can load only the items needed. Additionally, if you store a newly created
project into the database you do not need to clone (duplicate) the data.


## Is there a possibility to display small roads/tracks in a map without zooming in too much?

**Source:** [http://www.naviboard.de/vb/showthread.php?t=59676](http://www.naviboard.de/vb/showthread.php?t=59676)

This problem appears with a map like [Freizeitkarte](http://www.freizeitkarte-osm.de/) where smaller roads/tracks are only visible at 
a zoom level where the overview gets lost.

There is no such possibility in QMapShack. The detail levels for map data are defined by the map author and can't be
changed within QMapShack.


## Is there a possibility to choose the preferred road class when routing?

**Source:** [http://www.naviboard.de/vb/showthread.php?t=59418](http://www.naviboard.de/vb/showthread.php?t=59418)

Routing in QMapShack depends on the [Routino](http://routino.org) package and this package does not offer an option to select a preferred road type.

Routing profiles are saved in an XML-file (/usr/share/routino/profiles.xml). Here the preferences/weights of 
different road types can be modified by the user.


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

