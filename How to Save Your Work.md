*(This page is a draft based on email discussion with Oliver Eichler. I may have misunderstood some details. Not every step reported here is thoroughly tested)*

Shit happens. This is one of murphy's law. Power may fail, disks may crash, OS may bluescreen (at least some of them), and even the grat routino router plugged into QMapShack was proven to be able to segfault on rare conditions.

The gratest risk for your data is located between chair and keyboard: You, the user. For exmaply, I prefer to save all my work which is more complex than a simlple half page letter with frequently changing filenames like foobar00001, foobar002 .... Alternatively, if work is spread over many files, and depends on consistent content of them, you may produce regular backups with versionized file numbers, like foo001.tgz, foo002.tgz. This versionized backup approach allows you to roll back multiple step and still get multiple files in a consistent manner, even if you realize that you have screwed up something miserably,

There are also more elaborated backup concepts like snapshot file systems (btrfs, just to name one) or version control systems.

So: save your worK! while it is common knowledge, and no matter which strategy you follow, it requires some through understanding where, when and how stuff is stored.

Basically, you have three distinct realms of storable work:

## Your Map view ##

You don't edit maps in QMapShack, so the maps themselves are readonly - no matter whether you use online maps or locally stored maps. However your **map view** is the way yo configure how your currently visible maps are diplayed. Details are covered elsewhere in the manual:
https://bitbucket.org/maproom/qmapshack/wiki/DocControlMapDem

You can can switch between different map views, but those are not directly related to your own data which is stored in projects.


## Your Projects ##

The **project** is the place where your own personal data - basically waypoints, tracks and routes - lives in. In terms of storage, procjets may be implemented as:

* qms files, the QMapShack internal format
* gpx files, the most common format for exchanging GIS Data see here https://bitbucket.org/maproom/qmapshack/wiki/DocHandleGpxFiles for further details on the handling of GIS files
* in databases, which are also a  QMapShack internal format not supposed to be disassembled by the causal end user - see here https://bitbucket.org/maproom/qmapshack/wiki/DocGisDatabase for more on databases
* on the storage of your satnav device -  see here https://bitbucket.org/maproom/qmapshack/wiki/DocGisDevices for further infos on device access

###Backup of single project files###

For gpx and qms files, there is a 1:1 relation between project and file. This keeps backup procedures simply and straightforward, but leaves the responisbility to keep your data in sync if you roll back to a different version i up to you.

There is one important difference between qms an gpx files with regard to backup: qms format include object history and allows roll back of changes. This feature is not available in gmx files, because ist would break the main purpose of gmx, its exchangability: there is simply no standard in the gmx definitions for rollback histories. So if you want to combine the andvantage of both, save your work in a qms "master copy" and only produce gmx for the sake of exchange. In the right-click context menue of the project, there is a "save as..." dialog which allows you to switch between *.gmx and *.qms format for this purpose. ###Todo: not tested yet ###

###Backup of databases###

In a database, multiple projects are stored in one database file. So if you backup versions of this database, all the projects within will be restored in a consistend way, if you switch to an earlier version. This means on the other hand, that you cannot easily switch back selectively. To do so, you have to open both old and new version and manually copy conten between them as desired.

###Data on mobile device###
Backup of satnav device data is a complicated issue. While basically most modern devices are accessed as "USB mass storage", you can simply add them with any file manager and copy everythink on the device to a save location. However, I would never recommend this brute approach the other way round - you may screw up your device and loose all your warranty.

The simple way is to consider your device a an unsecure location of storage. Keep all your data in files as means of primary storage and backup them as outlined. Pull tracks from your device after every tour as soon as possible, if they are of any value to you. Prepare all routes on your workstations, if possible. Your mobile device is by its very nature subject to high risk of loss and damage. And if your device is lost or its data is broken, there is not much in restoring it any way, is it? I don't think that these gadgets are going to be repaired nowadays any more. 

If you nevertheless want to restore some data on your device, there is a plethora of forum entries around for tips and good and bad experiences. Good luck trying!

One important thing to mention on mass storage devices: The risk of premature plugoff.
Modern operation systems usually will keep data in a memory cache upon writing. So most applications, which delegate writing to the operating system, will "think" that writing is finished, while a part of data may still reside in memory cache only. In linux, you are always supposed to properly **unmount** a storage device before unplugging it. Most file managers display an Option "Sicher entfernen" (in German, my be sth. like "save removal" in english) to enforce syncing write cache to the device. They block with an error message, if some application is still busy with the device. Usually, it suffices to open the devices file tree in some file manager to block unmounting. However, it does not seem that QMapShack blocks unmounting, even if I open it as a project and display its contents. This seems weird to me. Keep an open eye...

To be sure, I recommend closing the QMapShack application and umount your device properly. I admit that I don't do it all the time and just wait some time I consider sufficient. But you have been warned.


## Your Workspace ##

Data in your file based procjects is only stored in your files if you select "save" in the project file's line.

Data in your database residing projects is only stored in the database when you select "Sync. with database" in the database project line.

If you make any changes to your object (as shown here https://bitbucket.org/maproom/qmapshack /wiki/DocGisItemsEditMultiple in detail) , both your edited object and the project it belongs to is marked by an asterisk * in the Data Window. 

![wiki-projtree.jpg](https://bitbucket.org/repo/L5qerE/images/1713486213-wiki-projtree.jpg)

This asterisk indicate you that your current changes are not yet written to save storage. At least not yet to the final place in the project they belong to.

The good news: there is an periodic **autosave feature** for all these pending changes in your workspace. You can access it by the menu path **"Project -> setup Workspace"** which gives you:
![wiki-setupws.png](https://bitbucket.org/repo/L5qerE/images/4061261758-wiki-setupws.png)

Your workspace is also saved upon clear exit of QMapShack, so all your changes you made are still available after a restart. But beware - your changes are lost after some crash of QMapShack. There is no way to manually trigger the saving of the workspace, so if you think five minutes is too risky on your system, you may decrease the value. It is not intended that users play around with the stored workspace, so we will not provide the location here. If you need instantaneous save or consistent roll back, use one of the concepts outlined above.
