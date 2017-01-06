[Prev](AdvProjActions) (General Actions) | [Home](Home) | [Manual](DocMain) | (Maps: Tips and Tricks) [Next](DocMapsTipsTricks)
- - -
[TOC]
- - -

# Details of map use

For basic information about this topic compare also the 
[Control of Maps and DEM Files](DocControlMapDem "Control of Maps and DEM Files") page!


## Adjustable map properties

_(valid starting with QMS patch version 7440c9d6402c (2017-01-01))_

After activating a map in a map view, some properties that control the display of the map can be adjusted.
The number of properties depends on the type of the map. Their availability is shown in the next table:

Property | vector map | off-line raster map | on-line  map
---------|------------|--------------------|------------
Map opacity               | ✔ | ✔ | ✔
Visibility range          | ✔ | ✔ | ✔
Visibility by object type | ✔ | ✘ | ✘
Details visibility        | ✔ | ✘ | ✘
Cache size                | ✘ | ✘ | ✔
Cache expiration          | ✘ | ✘ | ✔
Layer selection           | ✘ | ✘ | ✔
_Data opacity_            | ✔ | ✔ | ✔

The following image shows the layout of the various selection possibilities in the map tab:

![Map properties selection](images/DocAdv/MapDisplayProperties.jpg "Map properties selection")

_Comments:_

* The map opacity controls the map visibility in a map overlay.
* The visibility range controls the zoom levels for which the map is displayed.
* The visibility by object type allows to suppress the display of some object types in the map.
* The details visibility controls how many map details are shown at a given zoom level.
* The data opacity (slider in the data and not in the map tab!) controls the visibility of the data in the workspace.

## Adjustable elevation properties

After activating elevation data (DEM data), some properties that control the display of this data in a map view 
can be adjusted.

The following image shows the layout of the various selection possibilities:

![DEM properties selection](images/DocAdv/DemProperties.jpg "Elevation data properties selection")

_Comments:_

* The opacity slider controls the visibility of hill shading and slope on a map.
* The visibility range controls the zoom levels for which hill shading and slope are displayed.
* The level of hill shading controls the intensity used for the display of hill shading.
* The slop selection allows to choose one of the predefined slope models. In the case of the "__custom__" model
  the user can define 5 slope levels.
  

## Map scale type

Selecting the menu `View  - Setup Map View` opens a map view setup window.
In this window the user can set the map scales to _Logarithmic_ or _Square_.

A change of this option leads to a different zoom behavior of maps. 

Logarithmic scales support more zoom levels than square ones. As a consequence,
zooming with a square scale changes the scale faster than zooming with a logarithmic scale.

The minimum and maximum zoom levels (scales) are nearly the same for both scales.

For square scales the next zoom step leads to a scale which is approximately changed by a factor 2
compared with the previous one. This scale is recommended for on-line (TMS, WMTS) maps.
  
  
  
  
- - -
[Prev](AdvProjActions) (General Actions) | [Home](Home) | [Manual](DocMain) | [Top](#) | (Maps: Tips and Tricks) [Next](DocMapsTipsTricks)
