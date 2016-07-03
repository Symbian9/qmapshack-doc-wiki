# How to save your work #

*(This page is a draft based on email discussion with Oliver Eichler. I may have misunderstood some details. Not every step reported here is thoroughly tested)*

We suppose you want to keep your work save:

* frequently save memory resident data to disk to provide against system (power, memory, hardware, software ...) failure
* keep copies of your disk content to provide against media failure
* keep different versions of your files to prevent against user mistakes

You will have some system and strategies in place to do backup. You **want to know what, where, and when data is stored by QMapShack** to include this into your existing backup, and to know what to do in case of recovery.

Basically, you have three distinct realms of storable work:

* your map view
* your project files
* your workspace

# Maps and views #

You don't edit maps in QMapShack. Maps are huge and may eat up lots of backup resources. They may be easily recovered from the internet. Enough reason for some special considerations reagarding map backup.

QMapShack reads its maps from the configured MapPaths.

Recall the map organisation:
https://bitbucket.org/maproom/qmapshack/wiki/DocBasicsMapDem



### Online maps ###

The essential information to backup for online maps are their **definition files**. They are located in your configured MapPaths.

If you installed your initial maps from the "I want maps" buttons, they are named


```
#!

OpenCycleMap.tms  OpenStreetMap.tms  OSM_Topo.tms  WorldSat.wmts  WorldTopo.wmts

```

When browsing through maps, QMapShack maintains a local **tile cache**. This has limited life time and is automagically rebuilt if missing. It may contain some hundreds MB. Consider to exclude the tile cache from backup.

Default location is

```
#!

~/.QMapShack/
```


You can change the path of the tile cache via
 *File -> Setup Map Paths* - 
Directly at the top of the window ("Root path of the tile cache for online maps:").


### Local Maps, DEMs and roting database ###

... are usually are **huge** (easily some GB). They **will not change** due to working with QMapShack. Thus you may consider them for special treatment on backup. 
You may keep online maps and offline maps in different paths to ease this.

### Map Views ###

.. determine how your currently visible maps - including your visible data - are **displayed**. Recall https://bitbucket.org/maproom/qmapshack/wiki/DocControlMapDem

The view is different and independent from your GIS data as organized in projects.

QMapShack does not save a view by default. 
The "File ->  Store Map View" and the "File ->  Load Map View" allow you to select specific locations. 

It depends on your style of work, whether backing up views is worth any special consideration at all.


# Your Projects #

The **project** is the place **where your own personal data** - basically in the form of waypoints, tracks and routes - **lives in**. In terms of storage, procjets may be implemented as:

* qms files, the QMapShack internal format
* gpx files, the most common format for exchanging GIS Data 
* in databases,
* on the storage of your satnav device 


###Backup of single project files###

See here https://bitbucket.org/maproom/qmapshack/wiki/DocHandleGpxFiles for further details on the handling of GIS files.

For both .gpx and .qms files, there is a **1:1 relation between project and file**. This keeps backup procedures simple and straightforward. However, it leaves you the responsibility to keep your data in sync  between different projects=files if you roll back to a different version of your work.

There is one important difference between .qms an .gpx files with regard to backup: The **.qms format** includes object history and **allows a roll back of changes** on a per object basis. This feature is not available in gpx files, because it would break the main purpose of **gpx**, it's **exchangeability**: there is simply no standard in the gpx definitions for rollback histories. 

So, if you want to combine the andvantage of both worlds, save your work in a qms "master copy" (or in a database) and only produce gmx files for the sake of exchange. In the right-click context menu of the project, there is a "**save as...**" dialogue which allows you **to switch** between **.gpx** and **.qms** format for this purpose. 

###Backup of databases###

Databases are, like qms files, a  QMapShack internal format not supposed to be disassembled by the causal end user.
See here https://bitbucket.org/maproom/qmapshack/wiki/DocGisDatabase for more on databases.

In a database, multiple projects are stored in one database file. So if you backup versions of this database, all the projects within will be restored in a consistent way, if you switch to an earlier version. This means on the other hand, that you cannot easily roll back selectively. To do so, you have to open both old and new version and manually copy selected content between them as desired.

###Data on mobile device###

Don't consider your mobile satnav device as a sure location for backup, even if it looks like a memory stick when you plug it into your workstation. 

*(The following is derived from tests with singular GARMIN nuvi and zumo units. File system organisation differs not only between manufacturers, but also between device series and models. Your milegae may vary.)*

In the directory tree of a plugged Garmin device, you find the **directory "GPX"** similiar to this:

![wiki-garmin.png](https://bitbucket.org/repo/L5qerE/images/2180082863-wiki-garmin.png)

This contains most information on your device as it rerfers to QMapShack projects. You may frequently copy them to your Workstation and include it into your backup scheme. The gpx files can be opened as QMapShack projects or any other compatible application.

We do **not recommend to write directly onto the device** using file level access, unless you do not know what to do. Enjoy the great work the QMS programmers have deliverd and **use QMapShack device access** functionality instead. There are quite some items in a QMX file that the standard allows but may upset your device. You have been warned.

See here https://bitbucket.org/maproom/qmapshack/wiki/DocGisDevices for further information on device access.

We also do not discuss the other directories, as they are not immediately related to QMS work. There is a plethora of forum entries around, full of tips and good and bad experiences. Good luck trying!

There is one important thing to mention on mass storage devices: The **risk of premature plugoff** . In other applications, data may still reside in **write cache** RAM only, while the app is displaying successful writing. In Linux, you have to unmount a device, in WIN, you call "safe remove" to make sure the write cache is synced to the device.

To avoid this, QMapShack implements its own handling of device mounting.
*If you access a device via the icon in the workspace QMapShack will take care about mounting and unmounting the device. Simply plugin the device and wait until QMapshack recognized it. The device is unmounted **unless** QMapShack is actively reading/writing it (**Cursor is an hourglass**). Once done **you can unplug** the device without any further action.* 

This automounting of QMapShack may interfere with your OS mounting behavoiur and produce some warning. But following above rule, you shold be on the safe side and not loose any data. If not, its time to file a bug.



## Your Workspace ##

Data in your file based projects is only stored in your files if you select "save" in the project file line's context menu.
Data in your database residing projects is only stored in the database when you select "Sync. with database" in the database project line.

** *kiozen: the usual way to save data to the database is using "Save". "Sync. with database" is used when two users access and work on the same project in the database.* **

From the program's point of view, the workspace is the access window to all your data you are working with - as opposed to the map view, which only defines the way you currently look at them.

** *kiozen: opposed? That word does not make sense in that context.* **

If you make any changes to any object (as shown here 
https://bitbucket.org/maproom/qmapshack/wiki/DocGisItemsEditMultiple 
in detail), both your edited object and the project it belongs to is marked by an asterisk * in the Data Window with the project tree:

![wiki-projtree.png](https://bitbucket.org/repo/L5qerE/images/4285409798-wiki-projtree.png)

This asterisk indicate you that your current changes are not yet written to save storage. At least not yet to the final place in the project file they belong to.

The good news: there is an periodic **autosave feature** for all these pending changes in your workspace. You can configure it by the menu path **"Project -> setup Workspace"** which gives you:

![wiki-setupws.png](https://bitbucket.org/repo/L5qerE/images/4061261758-wiki-setupws.png)

Your workspace is also saved upon clear exit of QMapShack, so all your changes you made are still available after a restart. Thus you can still continue editing, roll back to an earlier stage and/or safe your data objects finally to the project file they are supposed to belong to.

But beware - your very last changes are lost after some crash of QMapShack. There is no way to manually trigger the saving of the workspace. So if you think five minutes is too risky on your system, or for your style of work, you may decrease the value. 

It is not intended that users play around with the stored workspace. 
So, if we provide the path here ( ~/.config/QLandkarte/ on linux systems) , this is only for backup purposes.
If you need instantaneous save or consistent roll back, use one of the concepts outlined above.


