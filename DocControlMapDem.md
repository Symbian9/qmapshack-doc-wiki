[Home](Home) | [Manual](DocMain)

# Control of Maps and DEM Files

The render engine of QMapShack is quite flexible and lets you create map stacks with
maps of different binary geographic datum, projection and binary format. Additionally 
it adds elevation information to the displayed maps if DEM data is loaded. The DEM data 
is completely independent from the loaded map. However the same concepts as for maps 
apply.

By opening additional workspaces you can have several different map stacks. This allows 
you to quickly view your data on different maps.

## Draw Order

* Maps are handled by the topmost item fist, down to the bottom item last. Thus 
the item at the bottom of the list will overlay all other items

* DEM files are handled by the topmost item fist, down to the bottom item last. Doing
an elevation data query the first match will stop the query. Thus the topmost item wins. 
Doing hill shading or similar the item at the bottom will overlay all other items.

* The draw order can be changed by moving the item in the list via drag-n-drop.

![Alt text](images/DocControlMapDem/maproom1.png) ![Alt text](images/DocControlMapDem/maproom2.png)

## Map Properties

### Workspace

Some properties are set globally for all workspaces. You find them below the _View_ menu. 

![Alt text](images/DocControlMapDem/maproom3.png)


* **Show Scale** A scalebar will be drawn in the right bottom corner of the map.
* **Show Grid**  A grid is drawn over the map. To setup the grid for the current visible workspace select **Setup Grid**
* **POI Text**   This applies to vector maps only. If inactive all labels on point of interest are not drawn.
* **Map Tool Tip** This applies to vector maps only. If active a tool tip with information about the element below the mouse cursor is displayed. Of the map does not store any information nothing is displayed.
* **Night / Day ** This applies to vector maps only. Switch between night and day color scheme. This must be defined within the map, else nothing will happen.

Not really map related but workspace related:

* **Flip Mouse Wheel** This will change the zoom in and zoom out direction.
* **Setup Map Font** This will change the font used for any text drawn on the map.
* **Setup Grid** Setup the projection of the grid overlay.
* **Setup Map Workspace** Setup the projection of the current workspace. The default is Mercator/WGS84.
* **Setup Time Zone** Setup the current timezone or automatic time zone selection.

### Map and DEM

If you expand a map or DEM item you can see the  property setup of this item in this workspace.

![Alt text](images/DocControlMapDem/maproom5.png)

1. The slider on the top controls the opacity. 

2. With the bar and the two buttons you can control the range of scale the map is visible. The blue square on the bar indicates the actual scale. Zoom to the minimum scale you want to see the map and press the left button. Now zoom to the maximum scale to display the map and press the right button. The green bar will indicate the range of visibility now.

### Vector Maps

Vector maps have additional properties.

![Alt text](images/DocControlMapDem/maproom6.png)

Use the check boxes to control what major map elements are displayed. For example you can overlay your raster map with a vector map and display the points of interest only, to add more information to your map. 

### DEM Files

DEM Files have additional properties.

![Alt text](images/DocControlMapDem/maproom7.png)

_Hillshading_ will overlay the map with a gray shaded relief.
