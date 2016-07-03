# How to save your work #

*(This page is a draft based on email discussion with Oliver Eichler. I may have misunderstood some details. Not every step reported here is thoroughly tested)*

We suppose you want to keep your work save:

* frequently save memory resident data to disk to provide against system (power, memory, hardware, software ...) failure
* keep copies of your disk content to provide against media failure
* keep different versions of your files to prevent against user mistakes

You will have some system and strategies in place to do backup. You **want to know what, where, and when data is stored by QMapShack** to include this into your existing backup.

Basically, you have three distinct realms of storable work:

* your map view
* your project files
* your workspace

## Your Map view ##

A View is defined by a
selection of maps and DEM files and is independent from the data in the Workspace.
The data can be displayed on one or several Views. 
You can can switch between different map views, but those are not directly related to your own data which is stored in projects. 

You don't edit maps in QMapShack, so the maps themselves are readonly - no matter whether you use online maps or locally stored maps. However your **map view** is the way you configure how your currently visible maps are displayed. Details are covered elsewhere in the manual:
https://bitbucket.org/maproom/qmapshack/wiki/DocControlMapDem

The "File ->  Store Map View" and the "File ->  Load Map View" allow you to select specific locations. 
There is a file ~/current.view in your home directory, which ????? ####where does it come from? ####

** *kiozen: QMapShack does not save a view by default. Therefore you must have saved the view, or the file is from another software* **

## Your Projects ##

The **project** is the place where your own personal data - basically waypoints, tracks and routes - lives in. In terms of storage, procjets may be implemented as:

* qms files, the QMapShack internal format
* gpx files, the most common format for exchanging GIS Data 
* in databases,
* on the storage of your satnav device 


###Backup of single project files###

See here https://bitbucket.org/maproom/qmapshack/wiki/DocHandleGpxFiles for further details on the handling of GIS files.

For both .gpx and .qms files, there is a 1:1 relation between project and file. This keeps backup procedures simple and straightforward, but leaves the responsibility to keep your data in sync if you roll back to a different version up to you.

There is one important difference between .qms an .gpx files with regard to backup: The **.qms format** includes object history and **allows a roll back of changes** on a per object basis. This feature is not available in gpx files, because it would break the main purpose of gpx, it's exchangeability: there is simply no standard in the gpx definitions for rollback histories. So if you want to combine the andvantage of both worlds, save your work in a qms "master copy" (or in a database) and only produce gmx files for the sake of exchange. In the right-click context menu of the project, there is a "save as..." dialogue which allows you to switch between *.gpx and *.qms format for this purpose. ###Todo: not tested yet ###

** *kiozen: Save as is the correct way to export to another format* **

###Backup of databases###

Databases are, like qms files, a  QMapShack internal format not supposed to be disassembled by the causal end user.
See here https://bitbucket.org/maproom/qmapshack/wiki/DocGisDatabase for more on databases.

In a database, multiple projects are stored in one database file. So if you backup versions of this database, all the projects within will be restored in a consistent way, if you switch to an earlier version. This means on the other hand, that you cannot easily roll back selectively. To do so, you have to open both old and new version and manually copy selected content between them as desired.

###Data on mobile device###

** *kiozen: Devices are not really meant as storage to save your work. In fact not everything written to an exported GPX file is written into the GPX file of a device as it would upset the device. This chapter is way too long. Too much chitchat about mightbes, wouldbes and commonplaces.* **

See here https://bitbucket.org/maproom/qmapshack/wiki/DocGisDevices for further information on device access.

Backup of satnav device data is a complicated issue. While basically most modern devices are accessed as "USB mass storage", you can simply open them with any file manager (like an USB stick) and copy everything on the device to a save location. 

For example, some Garmin nüvi and zumo devices store their tracks in a directory GPX. To learn more about their meaning, you may google for forum entries, just open a copy of the gpx files as GIS file in QMapShack or even peek into them with any text editor - GPX follows xml standard which is supposed to be human readable. *(maybe you need a tool like xmllint to display nice intented format)*

However, I would not recommend this brute approach the other way round - overwriting files on the device with content you *think* is what belongs there - without further research. You may screw up your device and loose all your warranty.

The simple way is to **consider your device as an unsecure location of storage**. Keep all your data in workstation project files as means of primary storage and backup them as outlined. Pull tracks from your device after every tour as soon as possible, if they are of any value to you. QMapShack seems to offer a proven method to acces recognized devices, so use it, instead of the risky direct file access. Prepare all routes on your workstations, if possible. Your mobile device is by its very nature subject to high risk of loss and damage. And if your device is lost or its data is broken, there is not much use in restoring it any way, is it? I don't think that these gadgets are going to be repaired nowadays any more. 

If you nevertheless want to restore some data on your device, there is a plethora of forum entries around for tips and good and bad experiences. Good luck trying!

There is one important thing to mention on mass storage devices: The **risk of premature plugoff** .

Modern operation systems usually will keep data in a **memory cache upon writing** . So most applications, which delegate writing to the operating system, will "think" that writing is finished, while a part of data may still reside in memory cache only. On linux, you are always supposed to properly **unmount** a storage device before unplugging it. Most file managers display an Option "Sicher entfernen" (in German, my be sth. like "save removal" in english) to enforce syncing write cache to the device. They block with an error message, if some application is still busy with the device. Usually, it suffices to open the devices file tree in some file manager to block unmounting. However, it does not seem that QMapShack blocks unmounting, even if I open it as a project and display its contents. Fiddling with this unexpected behaviour, I can put the plugged device into an unreadable state. This seems weird to me - Keep an open eye...

To be sure, I recommend closing the QMapShack application and umount your device properly. I admit that I don't do it all the time and just wait some time I consider sufficient. But you have been warned.

** *kiozen: If you access a device via the icon in the workspace QMapShack will take care about mounting and unmounting the device. Simply plugin the device and wait until QMapshack recognized it. The device is unmounted unless QMapShack is actively reading/writing it (Cursor is an hourglass). Once done you can unplug the device without any further action.* **


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


