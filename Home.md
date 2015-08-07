# Welcome to QMapShack

QMapShack is a consumer grade software to work with data aquired by GPS devices. The data can be displayed on a variety of maps and stored in a database. Additionally new data can be created to plan your next trip. 

If you want to download QMapShack visit the [download page](https://bitbucket.org/maproom/qmapshack/downloads)

If you want to see screenshots or start with QMapShack visit the [documentation page](DocMain).

If you have found a bug or want a new feature [read this first](BugFeatures).

If you want to help developing QMapShack visit the [developer's page](Developer).

## Support

Problems understanding the documentation? Your requirement is not addressed by the documentation? You want to add to the project, but you do not know where to start? You got lost in the source code and need some guidance? You just want to brag about the crazy new feature you plan to add? 

For all these questions you can get in touch with development.

* The QLandkarte GT [mailing list](https://lists.sourceforge.net/lists/listinfo/qlandkartegt-users) and it's [archive](http://news.gmane.org/gmane.comp.gis.qlandkartegt.user)
* IRC freenode, channel [#qlandkarte](http://webchat.freenode.net/?channels=#qlandkarte)

## Features

Maps:

* Garmin vector maps and *.jnx raster maps
* Raster maps supported by GDAL
* Online maps (TMS and WTMS (partially))
* Display multiple maps in one view
* Reproject maps on-the-fly to view's projection
* Digital elevation model independent from maps
* Hillshading and slope coloring

GIS Data:

* 100% project oriented data handling
* Summarize project by a diary
* Support for tracks, routes, waypoints and areas
* Simple geocache support
* Store projects in a database
* Support for multiple databases

Planning:

* Undo/redo history for all items
* Track point edit mode to create/change tracks
* Cut/copy/combine/reverse tracks
* Various filter to enhance tracks
* Create routes and calculate them by offline and online services

GPS Devices:

* Support for newer Garmin devices
* Support for TwoNav devices
* Project oriented data organization on devices
* Synchronize your project with several devices attached 

System:

* License GPL3+
* Runs on all *nix systems as well as on Windows
  Probably on OS X, too, but so far no one volunteers to 
  maintain a binary.
* GUI has been translated to Czech, French, German and Spanish
* Wiki dokumentation is English 
* Needs Qt5, GDAL, Proj4 installed
* For device support on Linux DBus and UDisk2 must be installed
