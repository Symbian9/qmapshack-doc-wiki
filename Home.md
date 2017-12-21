# Welcome to QMapShack

Use QMapShack to plan your next outdoor trip or to visualize and archive all the GPS recordings of your past exciting adventures. QMapShack is the next generation of the famous QLandkarte GT application. And of course it's even better and easier to use.

If you want to download QMapShack, visit the [**download page**](https://bitbucket.org/maproom/qmapshack/downloads)

If you want to see **screenshots** or start with QMapShack, visit the [**documentation page**](DocMain).

Users can find a short quickstart description here: 

* ![UK flag](images/DocGettingStarted/FlagUk.jpg)  [__Quick start__](DocQuickStartEnglish "English quickstart description")
* ![German flag](images/DocGettingStarted/FlagDe.jpg)  [__Schnellstartanleitung__](DocQuickStartGerman "German quickstart description")
* ![Russian flag](images/DocGettingStarted/FlagRu.jpg)  [__Быстрый старт__](DocQuickStartRussian "Russian quickstart description")

[**Found a bug?** Read this!](ReportBugs)

[**Missing a feature?** Read this!](RequestFeatures)

If you need **troubleshooting**, have a look [**here**](TroubleShooting)

## Support

Problems understanding the documentation? Your requirement is not addressed by the documentation? You want to add to the project, but you do not know where to start? You got lost in the source code and need some guidance? You just want to brag about the crazy new feature you plan to add? 

For all these questions you can get in touch with development.

* The QLandkarte GT [mailing list](https://lists.sourceforge.net/lists/listinfo/qlandkartegt-users) and it's [archive](http://news.gmane.org/gmane.comp.gis.qlandkartegt.user)
* IRC freenode, channel [#qlandkarte](http://webchat.freenode.net/?channels=#qlandkarte)
* Reading the [FAQ](DocMain#markdown-header-getting-help) never hurts.

## Unsupported Systems:
Due to limited resources a few operating system versions are not supported:

* Linux 32bit versions
* Windows 32bit versions
* OS X < 10.8

## Features

Maps:

* Garmin vector maps and *.jnx raster maps
* Raster maps supported by GDAL
* GEMF raster maps
* Online maps (TMS and WTMS (partially))
* Display multiple maps in one view
* Reproject maps on-the-fly to view's projection
* Digital elevation model independent from maps
* Hillshading and slope coloring

GIS Data:

* 100% project oriented data handling
* Summarize project by a diary
* Support for tracks, routes, waypoints and areas
* Support of track point extensions (e.g. heart rate)
* Support GPX, SLF, FIT, TCX, SMl, LOG, QLB and QMapShack's own binary format
* Simple geocache support
* Store projects in a database
* Support for multiple databases

Planning:

* Undo/redo history for all items
* Track point edit mode to create/change tracks, routes or areas
* Cut/copy/combine/reverse tracks
* Various filter to enhance tracks
* Track point extensions like heart rate, cadence,...
* Fine tune track statistics by activities
* Colorize track by extension or activity
* Create routes and calculate them by Routino (offline), MapQuest (online) or BRouter(online/offline)
* Use offline router to draw tracks on-the-fly.

GPS Devices:

* Support for newer Garmin devices
* Support for TwoNav devices
* Project oriented data organization on devices
* Synchronize your project with a group of devices attached 

System:

* License GPL3+
* Runs on all *nix systems as well as on Windows and OS X.
* GUI has been translated to Czech, Dutch, French, German, Russian, Spanish and Catalan
* Wiki documentation is English 
* Quickstart guide in English, German and Russian
* Needs Qt5.4 or later, GDAL, Proj4, Quazip5 and Routino installed
* For device support on Linux DBus and UDisk2 must be installed