[Prev](DocFaqData) (Databases and projects) | [Home](Home) | [Manual](DocMain) | (Maps and routing) [Next](DocFaqMaps)
- - -
[TOC]
- - -

# Frequently Asked Questions - Data handling

## Which hotkeys are available in QMapShack?

Hotkey | Meaning
--------|---------
__Routing__ |
CTRL-A | Use routing algorithm with options selected in the routing window when creating route or track. Choice can be modified during routing. No map data required.
CTRL-O | Use straight lines for routing when creating route or track. Choice can be modified during routing. 
CTRL-V | If available use polyline from map for routing from one point to the next one (_snap to line_), otherwise use straight lines. Choice can be modified during routing. No routing data required
__Track edit mode__ |
CTRL-+ | Add trackpoints to track.
CTRL-D | Delete trackpoints.
CTRL-M | Move trackpoints.
CTRL-R | Select range of track points.
__General__ |
CTRL-E | Show extended track profile (toggle!).
CTRL-G | Show grid on map (toggle!).
CTRL-ALT-G | Open grid setup window.
CTRL-I | Show map tooltips (type of map object at cursor location, toggle!).
CTRL-L | Load GIS data.
CTRL-P | Print selected map area.
CTRL-Q | Close QMapShack.
CTRL-S | Save all projects from the workspace.
CTRL-T | Add new view tab.
CTRL-SHIFT-T | Clone map view.

When in text edit fields the usual hotkeys can be used.

## How to edit the elevation of a track point manually?

* Open the edit window for the track, 
* ensure that track data can be edited (open lock in description part of edit window - if lock is closed, click it!)
* go to the _Points_ tab, 
* find the track point to be edited, 
* double-click in the elevation column,
* set the new elevation in the pop-up window.

## How to find route instructions?

* Open some map which can display the route under consideration
* Double-click the route name to see the route on the map
* Right-click on the route name and select the context menu entry `Route Instructions`
* Points on the route with instructions are shown in light-blue
* Move the mouse pointer on a light-blue point
* See the instructions for the given point in a bubble box

![Route instructions bubble box](images/DocFaq/RouteInstructions.png)

## How to find distance between waypoints

(_inspired by and partially copied from_ [QMS issues list](https://bitbucket.org/maproom/qmapshack/issues/169/distance-between-waypoints-popup-window))
 
* _Find the direct distance from a waypoint to some other point:_ set a waypoint and move it to the other point. 
  This will give you the distance and the course (direction) to the other point. When done abort the operation (right mouse click) and remove the waypoint.

![Waypoint distance](images/DocFaq/WPTDistance.jpg)

* _Find a defined distance from several waypoints:_ add the distance as proximity to the waypoints.

![Waypoint distances](images/DocFaq/WPTDistances.jpg)

![Waypoint proximity](images/DocFaq/WPTProximity.jpg)

* _Find the street distance or the direct distance between several points:_ start to create a track with or without routing.

![Direct track distance](images/DocFaq/Directtrack.jpg)

![Routed track distance](images/DocFaq/Routedtrack.jpg)

## How to attach waypoints to a track to get additional track information

(_inspired by_ [QMS issues list](https://bitbucket.org/maproom/qmapshack/issues/169/distance-between-waypoints-popup-window))

Waypoints can be attached to tracks or more precisely to trackpoints of a given track. 

There are several ways to do this:

* If the track does not yet exist but some waypoints for the track under constructions are already known:
  * Create the required waypoints within one project.
  * Select the waypoints in the project window.
  * Right click and select the context menu entry `Create Route`.
  * In the `Create Route from Waypoints` window move the waypoints into the necessary order and click ok.
  * Enter a route name.
  * Select the target project (the project with the waypoints under consideration) and click ok.
  * Right click on the new route in the project window and select the context menu entry `Convert to Track`.
  * Enter a track name.
  * Select the target project (the project with the waypoints under consideration) and click ok.
  * Delete the temporary route.  
* If the track exists and is displayed in a map:
  * double click on the track in the project window.
  * Zoom the map in such a way that track details (trackpoints) become visible.
  * Move the mouse pointer to the required waypoint location on the track. 
  * A bubble box pops up at the closest trackpoint.
  * Move the mouse pointer to the bubble box, right click and select `Add waypoint` from the context menu.
_Remark:_ If a the selected waypoint has a distance of less than 50m to a trackpoint than it is attached to the track.
  
  ![Trackpoint bubble box](images/DocFaq/BubbleBox.jpg)
  
* If elevation data for the track is available:  
  * Open the edit window for the track and ensure that the profile graph of the track is displayed.
  * Zoom the graph horizontally with the mouse wheel for better detail.
  * Move the mouse cursor on the profile graph to a location where the index shown in the upper left corner
jumps to a new value (i.e. where a trackpoint is located).
  * Right click and select `Add waypoint` to attach a waypoint to the track.
_Remark:_ If a the selected waypoint has a distance of less than 50m to a trackpoint than it is attached to the track.
  
Having waypoints attached to a track additional information about the waypoints is available in the roadbook of the
project.

To display this information proceed as follows:

* Right click on the project and select the context menu entry `Edit...`.
* The project roadbook opens as additional tab in the upper right part of the user interface.  
* Select the `Sort along track (multiple)` entry from the combobox in the upper right part of the roadbook.
* Now for each attached waypoint its distance
  * from the start of the track,
  * to the next attached waypoint, and
  * to the end of the track
  
is shown.  
  
![Roadbook with attached waypoints](images/DocFaq/Roadbook.jpg)
 
Attached waypoints are also shown with their icons - or in the case that the cursor is located at the waypoint position with 
their name - 
in the profile graph of the track (if elevation data is available). To see the profile graph open the edit window for the
track.

![Attached waypoints](images/DocFaq/TrackProfile.jpg)



- - -
[Prev](DocFaqData) (Databases and projects) | [Home](Home) | [Manual](DocMain) | [Top](#) | (Maps and routing) [Next](DocFaqMaps)
