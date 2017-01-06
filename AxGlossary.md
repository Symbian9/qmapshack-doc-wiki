[Prev](AxAdvToc) (Complete table of contents) | [Home](Home) | [Manual](DocMain) | (Index) [Next](AxAdvIndex)
- - -
[TOC]
- - -

# Glossary

**Activity**
: Means of motion (pedestrian, bicycle, car, ...) for part (range) of a track.  

**DEM**
: Abbreviation for __D__igital __E__levation __M__odel. DEM data provides elevation data for maps. 
  QMapShack can handle this data from different sources with the help of _VRT_ files that describe the properties of
  the downloaded elevation data.

**Diary**
: See __Roadbook__.

**Douglas-Peuker filter**
: A track filter for smoothing recorded tracks and for removing superfluous trackpoints from a track.

**Filter**
: See __Track filter__.

**GDAL**
: Abbreviation for __G__eospatial __D__ata __A__bstraction __L__ibrary. Library for handling raster and vector geospatial data formats.

**GIS data**
: Abbreviation for __G__eographic __I__nformation __S__ystems data.  This data includes all tracks, routes and
  waypoints used in GMapShack.

**gmapsupp.img**
: Typical file name and at the same time term for describing widely used container format for Garmin-style vector maps.

**Line**
: See __Polyline__.

**Map cache**
: Special storage location where map data is saved temporarily in a format suitable for fast reloading. One of the
advantages of the map cache is that cached online map tiles can be displayed immediately instead of waiting for the online
map server.

**Map view**
: A window where different types of maps and where tracks, routes and waypoints are displayed and handled.

**Maps window/tab**
: Window/tab in QMapShack where the user can define and activate the vector, raster or online maps for a map view.

**Planetsplitter**
: Part of the Routino offline router package. Planetsplitter creates an efficient routing database from OpenStreetMap data.

**Polyline**
: Also denoted as _Line_ or _GIS item with multiple points_. A series of connected straight line intervals linking
given points. Tracks, routes, and area boundaries are polylines.

**Roadbook**
: Also denoted as "_Diary_". A tabular overview of all data in a project.

**Routing method**
: The method used for creating automatically intermediate subpoints of a track or route between 2 consecutive given
  waypoints.

**Routino database**
: Preprocessed form of OpenStreetMap routing data for use with Routino router.

**Routino**
: Offline router application for finding a route between two points using the topographical data from 
[OpenStreetMap](http://www.OpenStreetMap.org). To optimize the routing a custom database format is used. 

**TMS**
: Abbreviation for __T__ile __M__ap __S__ervice. A __TMS__ file provides access to cartographic maps 
  on special map servers. 

**Track details dialog**
: Also denoted as "_Track edit window_". Window that displays various information about a track and that allows editing
of some track data.

**Track edit mode**
: Special state of a track in which trackpoints can be edited. To do this a copy of the track is created. The user carries out the editing
  (add, move, delete of points, assign activity, ...) on this copy and at the end he decides whether to save the changes to the original or 
  to a new track, or if he wants to abort editing.

**Track edit window**
: See __Track details dialog__.

**Track filter**
: Tool to manipulate a track in a predefined way. QMS supports track filters for elevation, timestamps, splitting tracks and
  others.

**Track range**
: A sequence of trackpoints of a track which can be handled separately (copy, assign activity, hide, 
  delete, recalculate,...).

**Track segment**
: Each track consists of an ordered list of one or more track segments. A track segment consists of an ordered 
  list of trackpoints.
  When combining (joining) tracks in QMS, the track segments of all selected tracks are combined.

**Track subpoint**
: When creating a track the user creates with the help of mouse clicks (ordinary) trackpoints. Depending on the selected
  routing method 
  additional trackpoints can be added automatically by the routing algorithm. These additional trackpoints are 
  called _subpoints_.  

**Trackpoint, hidden**
: Trackpoints in a track which are not displayed in a map view and not used in the calculation of global track data
  (length, ascent, ...).  
  
**VRT Builder**
: QMapShack tool for building VRT files from other data such as elevation data or raster maps. This tool calls the 
`gdalbuildvrt` tool of the GDAL package.

**VRT**
: The __VRT__ file format is a format used for describing virtual geospatial data composed from various
  other geospatial data such as elevation data. QMapShack can use elevation data if it is provided as VRT file. 
  _Warning:_ VRT files use relative path names to point to other files. Never move them to another location!
    
**Waypoint, attached to track**
: A waypoint that is at the same time a trackpoint of a track. With the help of waypoints attached to a track the user
  can define track legs for which the roadbook of the track gives additional information.
  
**WMTS**
: Abbreviation for __W__eb __M__ap __T__ile __S__ervice. A __WMTS__ file provides access to cartographic maps 
  on special map servers. 

**Workspace**
: The part of the user interface (GUI) where the user can work with projects and their data (waypoints, tracks, routes).
  The workspace is the upper part of the data view window of the GUI.
  _Remark:_ From time to time the data view window itself is denoted as workspace.

- - -
[Prev](AxAdvToc) (Complete table of contents) | [Home](Home) | [Manual](DocMain) | [Top](#) | (Index) [Next](AxAdvIndex)
