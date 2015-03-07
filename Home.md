# Welcome to QMapShack

QMapShack is the successor of QLandkarte GT. But it's no QLandkarte GT 3.0, it's somthing complete new, braking with most of the concepts in QLandkarte. Like most Open Source projects, QLandkarte evolved with no real roadmap. It was deveopment by need and request. And it was a playground for many ideas and concepts. Naturally that results into a kind of awkward code with a thick layer of slag and issues. And at a certain point of development the beast won't digest another flip in the concept anymore. That is why QMapShack starts from scratch. 

If you want to download QMapShack visit the [download page](https://bitbucket.org/maproom/qmapshack/downloads)

If you want to start with QMapShack visit the [documentation page](DocMain).

If you want to help developing QMapShack visit the [developer's page](Developer).

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
* Support for tracks, waypoints and areas
* Simple geocache support
* Store projects in a database
* Support for multiple databases

Planning:

* Undo/redo history for all items
* Track point edit mode to create/change tracks
* Cut/copy/combine/reverse tracks
* Various filter to enhance tracks

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
