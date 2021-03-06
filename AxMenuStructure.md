[Prev](AxHotkeys) (Hotkeys) | [Home](Home) | [Manual](DocMain) | [Index](AxAdvIndex) | (Complete table of contents) [Next](AxAdvToc)
- - -
[TOC]
- - -

# Main and context menu overview

_Overview derived from commit 9efcf8b76960 (Thu Jan 25 14:44:47 2018 +0100)_ 

## Structure of main menu

*(Global QMS actions)*

*Main menu*|*Submenu*|*Shortcut*|*Checkable*|*Tooltip*
----|----|----|----|----
**File**| | | |
 |Load GIS Data|Ctrl+L| |Load projects from file
 |Save All GIS Data|Ctrl+S| |Save all projects in the workspace
 |Load Map View| | |Restore view with active map and DEM list including the properties from a file
 |Store Map View| | |Write current active map and DEM list including the properties to a file
 |Setup Map Paths| | |Setup Map Paths
 |Setup DEM Paths| | | 
 |Save(Print) Map Screenshot|Ctrl+P| |Print a selected area of the map
 |Close|Ctrl+Q| | 
**Workspace**| | | |
 |Add empty project| | | 
 |Search Google| |True| 
 |Close all projects|F8| | 
 |Setup Workspace| | |Setup save on exit.
 |Setup Waypoint Icons| | |Setup path to custom icons
**View**| | | |
 |Add Map View|Ctrl+T| |Add Map View
 |Clone Map View|Ctrl+Shift+T| | 
 |Show Scale| |True| 
 |Show Grid|Ctrl+G|True| 
 |POI Text| |True| 
 |Map Tool Tip|Ctrl+I|True| 
 |Night / Day| |True| 
 |Min./Max. Track Values|Ctrl+N|True|Show the minimum and maximum values of the track properties along the track in the map view.
 |Flip Mouse Wheel| |True| 
 |Ext. Profile|Ctrl+E|True| 
 |Setup Map Font| | | 
 |Setup Map Background| | | 
 |Setup Units| | | 
 |Setup Grid|Ctrl+Alt+G| | 
 |Setup Map View| | |Setup Map View
 |Setup Time Zone| | | 
 |Setup Coord. Format| | |Change the format coordinates are displayed
**Tool**| | | |
 |Import Database from QLandkarte| | |Import QLandkarte GT database
 |VRT Builder| | |GUI front end to gdalbuildvrt
 |Create Routino Database| | | 
 |Start QMapTool| | | 
**Window**| | | |
 |Close Tab|Ctrl+W| | 
 |Full Screen|F11| | 
 |Toggle Docks|Ctrl+D|True|Toggle visibility of dockable windows
 |Toolbar| |True | 
 |Maps| |True | 
 |Dig. Elev. Model (DEM)| |True | 
 |Workspace| |True | 
 |Database| |True | 
 |Routing| |True | 
 |Realtime| |True | 
 |Setup Toolbar| | | 
**?**| | | |
 |About| | | 
 |Help|F1| | 
 |Quickstart Help| | | 


_Remarks:_
* The `Start QMapTool` menu entry is visible only if `qmaptool.exe` can be found in the `PATH  environment variable.

## Structure of most important context menus

*(Actions with different QMS objects)*


### Context menu of project

*Name*|*Exclusive*|*Checkable*
----|----|----
Edit.. |   |   
Copy to... |   |   
Show on Map |   |   
Hide from Map |   |   
Sort by Time | True |   
Sort by Name | True |   
Autom. Save |   | True 
Save |   |   
Save as... |   |   
Save as GPX 1.1 w/o ext... |   |   
Send to Devices |   |   
Sync. with Database |   |   
Close |   |   

### Context menu of device project

*Name*|*Exclusive*|*Checkable*
----|----|----
Edit.. |   |   
Copy to... |   |   
Show on Map |   |   
Hide from Map |   |   
Update Project on Device |   |   
Delete |   |   

### Context menu of track

*Name*|*Exclusive*|*Checkable*
----|----|----
Edit... |   |   
Copy to... |   |   
Track Profile |   | True 
Select Range |   |   
Edit Track Points |   |   
Reverse Track |   |   
Combine Tracks |   |   
Set Track Activity |   |   
Copy Track with Waypoints |   |   
Delete |   |   

### Context menu of route

*Name*|*Exclusive*|*Checkable*
----|----|----
Edit... |   |   
Copy to... |   |   
Route Instructions |   | True 
Calculate Route |   |   
Reset Route |   |   
Edit Route |   |   
Reverse Route |   |   
Convert to Track |   |   
Delete |   |   

### Context menu of waypoint

*Name*|*Exclusive*|*Checkable*
----|----|----
Edit... |   |   
Copy to... |   |   
Show Bubble |   | True 
Move Waypoint |   |   
Proj. Waypoint... |   |   
Change Radius |   |   
Toggle Nogo-Area |   | True 
Delete Radius |   |   
Delete |   |   

### Context menu of multiple selected items

*Name*|*Exclusive*|*Checkable*
----|----|----
Copy to... |   |   
Create Route |   |   
Change Icon (sel. waypt. only) |   |   
Combine Tracks |   |   
Set Track Activity |   |   
Delete |   |   

### Context menu of map window

*Name*|*Exclusive*|*Checkable*
----|----|----
Add POI as Waypoint |   |   
Add Waypoint |   |   
Add Track |   |   
Add Route |   |   
Add Area |   |   
Select Items On Map |   |   
Copy position |   |   
Copy position (Grid) |   |   


**Comments:**

* `True` in the column `Exclusive` marks a group of menu entries where only one checkable action in the group can ever be active at any time. 
  If the user chooses another checkable action in the group, the one they chose becomes active and the one that was active becomes inactive.
* `True` in the column `Checkable` marks a menu entry which has an on/off state (`checked/selected` or 
  `not checked/not selected`).
* Depending on the state of the objects for which the context menu is called one or more menu entries can be inactive. 
  As a rule all context menu entries (actions) in an unselected workspace project that produce new data are active, because the new data can 
  be placed into an active project. Most other context menu entries (those changing only a given data object) are inactive.

- - -
[Prev](AxHotkeys) (Hotkeys) | [Home](Home) | [Manual](DocMain) | [Index](AxAdvIndex) | [Top](#) | (Complete table of contents) [Next](AxAdvToc)
