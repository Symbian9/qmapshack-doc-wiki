[Prev](DocFaqHandling) (Data handling) | [Home](Home) | [Manual](DocMain) | (Troubleshooting QMapShack) [Next](TroubleShooting)
- - -
[TOC]
- - -

# Frequently Asked Questions - Maps and routing

## Why are waypoints shown with a blue dot icon?

**Source:** [Newsgroup discussion](https://sourceforge.net/p/qlandkartegt/mailman/message/35441910/)

_Example:_

![Blue dots](images/DocFaq/BlueDots.jpg)

The blue dots shown on the map are not the icons of waypoints but they are used as indicators that at the given zoom level
of the map and at the given locations there are several waypoints on the map. Thus, cluttering of the map is avoided.

Changing the zoom level results in the display of all waypoints at the given location with the necessary icons (exception:
several waypoints with equal coordinates).

![No Blue dots](images/DocFaq/NoBlueDots.jpg)


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

**Source:** 
 * [www.naviboard.de](http://www.naviboard.de/vb/showthread.php?t=59418)
 * [gmane.comp.gis.qlandkartegt.user](http://permalink.gmane.org/gmane.comp.gis.qlandkartegt.user/2626)

Routing in QMapShack depends on the [Routino](http://routino.org) package and this package does not offer an option to select a preferred road type.

Routing profiles are saved in an XML-file (/usr/share/routino/profiles.xml). Here the preferences/weights of 
different road types can be modified by the user.

On Routino's homepage there is an online version where fine
tuning of all parameters can be tried. Once done there one can take over the values into the local `profiles.xml` file.

## What is the maximum Routino databases file size that can be handled by the QMapShack Windows version?

Due to limitations in the Windows POSIX API Routino can't handle files larger than 4GB.

## Does QMapShack/Routino support cross-border routing?

**Source:** Inspired by [newsgroup thread](https://sourceforge.net/p/qlandkartegt/mailman/qlandkartegt-users/thread/1450466213.2419.8.camel%40knibb.myzen.co.uk/#msg34706080)

Offline routing in QMapShack needs special routing databases. The easiest way to create these databases is with QMS itself
as described in the [Routes](DocGisItemsRte) section of the QMS Wiki. The required `*.pbf` input files can be downloaded per country/region.
If cross-country routing is wanted then the user should select the `*.pbf`files for all countries needed as described in the Wiki page
and then create one routing database for these countries. The resulting database supports cross-country routing. In the example shown
on the mentioned Wiki page cross-border routing all over Belgium and Luxemburg will be possible. 

If a single routing database is created for each country then these databases don't support cross-border routing.

When creating the routing database QMS executes the following Routino commands:

    path_to\planetsplitter.exe --dir=\temp --prefix=MyRegions --tagging=path_to\tagging.xml --parse-only path_to\file1.osm.pbf 
    path_to\planetsplitter.exe --dir=\temp --prefix=MyRegions --tagging=path_to\tagging.xml --parse-only --append path_to\file2.osm.pbf 
    ...
    path_to\planetsplitter.exe --dir=\temp --prefix=MyRegions --tagging=path_to\tagging.xml --process-only    

When using the standard QMS Windows installation then `planetsplitter.exe` is found in the same directory as `qmapshack.exe`,
`tagging.xml`is found in the `routino-xml` subdirectory of the `qmapshack.exe`directory.
    
These commands can be executed directly from a command line.
    
## How to use Russian military and similar raster maps with QMapShack?

**Source:** Newsgroup thread [sourceforge.net/p/qlandkartegt](https://sourceforge.net/p/qlandkartegt/mailman/message/34518807/)

* Calibrated Russian military and other raster maps can be downloaded from various locations.
Some servers are 
  * [loadmap.net](http://loadmap.net)
  * [http://gpska.yapl.ru](http://gpska.yapl.ru)
  * [http://satmaps.info/us/map-detector.php](http://satmaps.info/us/map-detector.php)
  
  When downloading a map tile 2 files are created:
a GIF file (or other image file) with the raster map and an `OZIExplorer` MAP file with calibration data.

* QMapShack supports the use of raster maps via VRT-files. These files can be created with the `GDALBuildVRT`tool
and can also be accessed from within QMapShack.
Doing so leads for the above mentioned maps to an error message indicating that
georeference data can't be found within the MAP files. 

* To make the raster map usable for QMapShack the following procedure (described for a Windows installation) can be used:
    * Ensure that the `GDAL` toolset and the `proj.dll` are in the QMapShack installation directory.
    * Add this directory to the PATH environment variable
    * Ensure that the `data` subdirectory of the QMapShack installation directory is properly installed
    * Add this directory to the GDAL_DATA environment variable
    * Move the image and the map file to a location where QMS is looking for maps or add the directory where 
    these files are located to your QMapShack map paths.
    * Run 
    
    `gdalwarp -of VRT full_path_to_your_raster_map.map full_path_to_your_raster_map.vrt`

    * _Remark:_ It is unclear why `GDALBuildVRT` does not find the georeference information. 
    
* _Hint for Ubuntu users:_ Raster maps may have borders. There is an Ubuntu tool to crop semi-automatically the map or a whole series of maps in such a way that the borders are not visible when loaded into QMapShack. Link to the tool: [github.com/h4tr3d/geocrop](https://github.com/h4tr3d/geocrop). Description of usage: 
    * [http://htrd.su/wiki](http://htrd.su/wiki/start?btng[post][tags]=qmapshack) (Russian). This link leads also to a short Russian description of the basic QMapShack features.
    * [Quick way to prepare raster map for QMapShack](QuickWayToPrepareRasterMapForQMapShack)

## Why is a raster map not displayed?   
  
**Source:** [http://permalink.gmane.org/gmane.comp.gis.qlandkartegt.user/2624](http://permalink.gmane.org/gmane.comp.gis.qlandkartegt.user/2624)

Consider the following hints:
* Use `gdalinfo` to verify if the required vrt file provides proper information. Keep in mind that the vrt file 
  is just an XML wrapper around your
  real raster map file. It stores a path to that file. If the path changes
  the vrt has to be created again.
* If the map is loaded correctly but drawing is suppressed because it
  would take too long, the map boundary is still visible as a black frame. 
* If you have a layer of raster maps reading the files and scaling the content to an upper zoom level is 
  getting more and more resource intensive the more you zoom out. To avoid endless map loading, QMS will 
  skip the map if the effort to display it is getting too large.
  However if QMS detects overview levels attached to the map it will use them. `gdaladdo` is the tool to do so. 
  Things are getting a bit more difficult for insane large map collections. `gdaladdo` will create an overview 
  file over all maps combined in the vrt file. That might get too large. In this case you have to create single
  overview files and combine them in a vrt. 

- - -
[Prev](DocFaqHandling) (Data handling) | [Home](Home) | [Manual](DocMain) | [Top](#) | (Troubleshooting QMapShack) [Next](TroubleShooting)
