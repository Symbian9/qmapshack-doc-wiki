[Prev](AdvTracks) (Tracks) | [Home](Home) | [Manual](DocMain) | (Track filters) [Next](AdvTrkFilters)
- - -
[TOC]
- - -

# Tracks

## Get track information

There are various ways to get information about a track.

* _Using the workspace window:_
    * Move mouse on the name of the track
    * An info window pops up. This window gives summary information about the track:
        * Track name
        * Length
        * Total ascent/descent
        * Total and moving time
        * Total and moving average speed
        * Start and end time
        * Number of visible and total trackpoints in track

      Some of this information can be missing if the track is not recorded by a GPS device.

* _Using the map window:_
    * _Track is displayed without red frame:_
        * Left click on the track
        * An info window pops up that shows the same info as described in the previous point.

      With the help of the icons shown in this info window the user can carry out various operations with the track.

      In the style tab of the track edit window the user can select one of the track properties (speed, slope, elevation,
      fitness data, ...) to be used for coloring the track.

    * _Track is displayed with red frame:_
        * To get this state of a track in the map window double click on the track name in the workspace window. The map
          window is zoomed so that the complete track is displayed in the window.
        * Move the mouse pointer on the track
        * An info window pops up that shows information about the closest trackpoint:
            * Distance run from start and distance remaining to the end of the track
            * Time run from start and remaining time to the end of the track
            * Index of the trackpoint
            * Time at the trackpoint
            * Elevation, slope, speed and fitness data at the trackpoint
        * With a left click on the track the information described in the previous point is displayed.

          Some of this information can be missing if the track is not recorded by a GPS device.

        Get out of this track state by then double clicking
        on a location without a track.

 * _Using the track edit window:_
     * To open the track edit window right-click on the track name in the workspace window and select the `Edit...`
       menu entry in the context menu.
     * In the graphs tab the user can select up to 3 track properties (speed, slope, elevation, fitness data, ...)
       to be displayed as graphs.

## Symbols for trackpoints

The points of a track may have different properties. These properties can be seen when clicking on a track
in a map view and then selecting the `Select a range` or `Edit position ...` icons from the track info window.

The next image shows the collection of possible trackpoint icons (slightly enlarged):

![Trackpoint icons](images/DocAdv/TrackpointIcons.png "Overview of trackpoint icons")

The meaning of the icons is as follows:

1. _Black square with yellow border._ Startpoint of track. Properties like big black square.
1. _Black square with green border._ Endpoint of track. Properties like big black square.
1. _Big black square._ Routing point of a track. Can be moved to new position after selection. Changes to red square if selected (clicked).
1. _Small black square._ Track subpoint automatically created by a routing engine. Can't be moved to new position. Is automatically readjusted
   if a neighboring routing point is changed.
1. _Red square._ Selected routing point. Can be moved to new position.
1. _Magenta circle with dark gray border._ Start or end of a track range.
1. _Small gray square._ Hidden trackpoint.

Icons 1 - 5 are related to the edit position mode. Icons 6 and 7 are related to the track range selection and hide trackpoint modes.

## Add point to track

Given a track more points can be added to it using the following procedure:

* Display the track in a map view, e.g. by double clicking the track name in the workspace.
* Check if the settings for the used routing engine are correct.
* Click on the track in the map view to open the track info window.
* Click the `Edit position of track points` icon in the track info window.
* A new toolbar pops-up at the top of the map view. Click the `Add new points` icon in this toolbar. The cursor shows now a bold "__+__" icon.
* Move the mouse to the track. As soon as the mouse hits the track, the color of the track part between the closest routing trackpoints is
  changed to red. This is the smallest part of the track that can be recalculated by the routing engine. The neighboring routing
  trackpoints are shown as big red squares.
* With a click on the track a new routing trackpoint (big black square) is attached to the mouse at the selected location.
* Move the mouse to the wanted location of the new routing trackpoint. While moving the mouse the new trackpoint and its neighboring routing
  trackpoints are connected with straight line segments. As soon as the mouse comes to a standstill, the track is recalculated in
  accordance with the selected routing options (Avoid the `Snap line ...` routing option!).
* Click at the wanted location to add the new routing trackpoint to the track and to fix it at this location.
* Clicking `Save to original` or `Save as new`in the toolbar at the top of the map view saves the new track.




## Attach waypoints to a track to get additional track information

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
_Remark:_ If a selected waypoint has a distance of less than 50m to a trackpoint than it is attached to the track.

  ![Trackpoint info box](images/DocFaq/BubbleBox.jpg "Trackpoint info box")

* If elevation data for the track is available:
  * Open the edit window for the track and ensure that the profile graph of the track is displayed.
  * Zoom the graph horizontally with the mouse wheel for better detail.
  * Move the mouse cursor on the profile graph to a location where the index shown in the upper left corner
jumps to a new value (i.e. where a trackpoint is located).
  * Right click and select `Add waypoint` to attach a waypoint to the track.
_Remark:_ If a selected waypoint has a distance of less than 50m to a trackpoint than it is attached to the track.

Having waypoints attached to a track additional information about the waypoints is available in the roadbook of the
project.

To display this information proceed as follows:

* Right click on the project and select the context menu entry `Edit...`.
* The project roadbook opens as additional tab in the upper right part of the user interface.
* Select the `Sort along track (multiple)` or `Sort along track (single)` entry from the combobox in the
upper right part of the roadbook.
* Now for each attached waypoint its distance, ascent and descent
    * from the start of the track,
    * to the next attached waypoint, and
    * to the end of the track

    are shown together with a summary of the track information.

* It may happen that a track passes several times through a waypoint (in the example __WPT3__).  This
happens if the track intersects itself and if an attached waypoint is located at an intersection.
    * If the option `Sort along track (multiple)` is used, then the waypoint is shown several times in the list.
    * If the option `Sort along track (single)` is used then the waypoint is shown only once in the list. The
information given in the roadbook window refers to the last pass through the waypoint.

    ![Roadbook with waypoints attached to track](images/DocFaq/Roadbook.jpg "Roadbook with waypoints attached to track")

* If the option `Keep order of project` is used, then the edit window of the project shows waypoints and tracks in different
tables.

Attached waypoints are also shown with their icons - or in the case that the cursor is located at the waypoint position with
their name -
in the profile graph of the track (if elevation data is available). To see the profile graph open the edit window for the
track.

![Attached waypoints in elevation graph](images/DocFaq/TrackProfile.jpg "Attached waypoints in elevation graph")

A track can be copied together with its attached waypoints to a new project by selecting the track context menu entry
`Copy Track with Waypoints`.

## Select a range of a track

(_valid starting with QMS patch version 676511d9ba16 (2016-12-22)_)

The user can select in several ways a range of a track, that is a sequence of trackpoints of the track, for further handling:

* __Using a map window:__

     * Display the track in a map window.
     * Click with the left mouse button on the track and release the mouse button.
       An info box pops up. Choose the "_Select a range of points_" icon in this
       info box. The mouse cursor changes to the range selection icon.
     * Click with the left mouse button at the location of the start of the range to be selected in the track and
       release the mouse button. The clicked point is shown as a circle with red center.
     * Move the mouse to the location of the end of the range to be selected.
     * Left-click at the end of the range.
     * If the end of the range is not in the map view: left-click on the map and __don't release__ the mouse button.
     * The map is attached to the mouse.
     * Move the map to the wanted location and release the mouse button.
     * The map is fixed again.
     * Move the mouse to the wanted end of the range and left-click.
     * Select the necessary range operation (hide/show points, assign activity/copy) from the info window that pops-up.

     _Remarks:_

       * When selecting the start and end points of the range any trackpoint (ordinary trackpoints as well as subpoints
         created by a routing engine) can be selected.
       * This procedure is recommended for recorded tracks.

![Track range selection](images/DocFaq/RangeSelection.png "Track range selection")

* __Using a graph in an edit window:__

    * Click with the left mouse button at the location of the start of the range to be selected in one of the track
    graphs and
release the mouse button. A vertical red line jumps to the location of the nearest trackpoint of the track.
    * Move the mouse to the location of the end of the range to be selected __in the same graph__ and click with
the left mouse button. _Warning:_ If a `No go!` icon pops up at the location of the mouse pointer then the mouse
was moved out of the graph selected with the first click!

In both cases the selected range will be highlighted in green color and the required action for the trackpoint range
can be selected from the info box that pops up. This info box shows also some summary information about the range.

Select the action to perform with the track range from this info window:

* Hide trackpoints located in the range. The part of the track between start and end of the range will be
  replaced with a straight line. The track remains in the range selection mode, that is, more range selections
  can be made immediately.

    The hidden part of the track is shown as a gray track while in range selection mode.

* Show all trackpoints in the range
* Assign an activity type to the range
* Copy range into new track

If part of the track is hidden, then this is shown in the track info box when moving the mouse pointer on the track
in a map window as shown in the following image:

![Hidden trackpoints](images/DocFaq/HiddenWPTs.png "Hidden trackpoints")

Here, the numbers of visible and of total points are different.

## Select a range of a track in edit mode

(_valid starting with QMS patch version 880e20099637 (2016-12-28)_)

This form of range selection can be used if the track is in the edit mode. It is different from the one described in the
previous subsection. _Remember when working in edit mode:_ The edit mode is intended to modify trackpoints.
Subpoints are - in contrast to
ordinary trackpoints - not designed to be modified manually.

This track range selection mode is useful when refining planned tracks.

* Display the track in a map window.
* Click with the left mouse button on the track and release the mouse button.
  An info box pops up. Choose the "_Edit position of track points_" icon in this
  info box. This starts the track edit mode. The mouse cursor changes to the edit position icon.
* In the toolbar that appears at the top of the map window click the "_Select a range of points_" icon.
  The mouse cursor changes to the range selection icon.
* Click with the left mouse button at an ordinary  trackpoint (big black square changed to red square if mouse is moved on it,
  not a subpoint with small black square!)
  as the start of the range to be selected in the track and release the mouse button.
* Move the mouse in the direction of the track. The color of the selected track range is changed to green.
  Left click at the end of the wanted range.

    ![Range in track edit mode](images/DocAdv/RangeSelected.jpg "Selected range in track edit mode")

* An info window with 2 icons pops-up:
    * _Delete all points between first and last one_: If icon is active: The selected range of the track is
      replaced with a straight line segment between the first and the last ordinary trackpoint in the range.

        ![Points deleted from range](images/DocAdv/RangeDeleted.jpg "Points deleted from range in track edit mode")

    * _Calculate a route between the first and last selected point_: Use the selected routing engine with the selected options
      and recalculate the track between the first and the last point of the track range. _Hint:_ If in a previous step
      one of the ordinary trackpoints had been deleted, then this does not re-establish the original track!

        ![Points recalculated in range](images/DocAdv/RangeRecalculated.jpg "Points recalculated for range in track edit mode")

## Move track range to new location

The user can quickly move part of a track to a new location using a range of the track in edit mode. Proceed as
described below:

* Click the `Edit...` context menu of the track.
* Go to the `Filter - Miscellaneous - Convert subpoint to points` filter and apply this filter. Now, each trackpoint
  of the track is an ordinary trackpoint (big black square in edit mode) and can be edited. _Remark:_ If there are already
  enough ordinary trackpoints to select the track range, then this step is superfluous.
* Display the track in a map view.
* Zoom the map view so that you can see the wanted details of the track.
* Click with the left mouse button on the track and release the mouse button.
  An info box pops up. Choose the "_Edit position of track points_" icon in this
  info box. This starts the track edit mode.

    ![Track in edit mode](images/DocAdv/MoveTrack.jpg "Track in edit mode. Only ordinary trackpoints")

* In the toolbar that appears at the top of the map window click the "_Select a range of points_" icon.
  The mouse cursor changes to the range selection icon.
* Click with the left mouse button at the start of the range that should be moved to a new location and
  release the mouse button.
* Move the mouse in the direction of the track. The color of the selected track range is changed to green.
  Left click at the end of the wanted range.

    ![Track range in edit mode](images/DocAdv/MoveTrackRange.jpg "Track range in edit mode")

* Click the `Delete all points ...` icon. The first and the last point of the range are now connected
  with a straight line segment.

    ![Trackpoints removed](images/DocAdv/MoveTrack_DeletedPts.jpg "Trackpoints in range removed")

* Click the `Add new points` icon at the top of the map view.

* Move the mouse on the straight line segment.
* Left click and release the mouse button. A new trackpoint is attached to the mouse.
* Move the mouse (i.e. the new trackpoint) to the wanted new location and left click. The track is re-routed using
  this additional trackpoint.
* If necessary, repeat the last step to get the wanted new location of the track.

    ![Track moved to new position](images/DocAdv/MoveTrack_NewPosition.jpg "Track range moved to new position")

* Save the edited track by either clicking the `Save to original` or the `Save as new` button on top of the map view.

## Assign colors to track activities

**Source:** [Newsgroup discussion](https://sourceforge.net/p/qlandkartegt/mailman/message/35502464)

To assign an activity to a range of a track proceed as follows:

* Select a track range (for details see [here](#markdown-header-select-a-range-of-a-track)).
* In the bubble box that pops up click the `Select an activity` icon.
* Choose the activity from the list which appears.

The graphs in the track edit window show the track activity ranges:

![Activity types in track elevation graph](images/DocFaq/ActivityType.png "Activity types in track elevation graph")

Selecting the `Activity` tab in the edit window shows various information about the activities:

![Track activity overview](images/DocFaq/ActivityOverview.png "Track activity overview")

Selecting `Activity` in the `Style` tab of the edit window allows to assign a color for each activity type:

* click the colored square for the activity under consideration,
* a list shows the supported colors,
* select one by clicking on it,
* if the list was opened but no color was changed then press the `ESC` to close the list.

![Activity color selection](images/DocFaq/ActivityColorSelection.png "Activity color selection")

Now the selected colors are displayed on the track (red color: color selected for the track itself - no activity was
assigned to red parts):

![Activity colors on track](images/DocFaq/TrackActivity.png "Activity colors on track")

## Recorded and calculated track data

The type of track data recorded with the help of one GPS device differs from the type of track data recorded
by another GPS device. While the location and the timestamp is recorded for each trackpoint the recording of
other data such as
* elevation
* speed
* heart rate
* temperature

depend on the used device. There can be even a dependence between different data fields. Thus, speed can
be calculated from locations and timestamps and can be recorded directly.

QMS is in a position to visualize track data in form of graphs in the track edit window and in form
of various colors on the track in map windows. In the _Graphs_ and _Style_ tabs of the track edit window
the user can select the type of data to be displayed.

A track data field may have a star at the end of its name (_speed*_). This is an indication that the values for
this data field are calculated internally by QMS from other available data fields. The similar data field without a star
(_speed_) is for recorded data.

A track may have a calculated _speed*_ (if timestamps are available) and a recorded _speed_ data field at the same time
and both can be visualized in 2 different graphs.

When editing a track with the `Change timestamps of trackpoints` filter the recorded _speed_ data remain unchanged
whereas the calculated _speed*_ data will change their values.

## Avoid and remove invalid data in a track

QMS is a software for

* _managing and displaying of recorded waypoints and tracks_ (GPS data). A recorded track consists of a sequence of recorded
trackpoints. The trackpoint data consists of location, elevation, timestamp and some other data. Except for
rare failures caused by the recording GPS device this data is consistent (valid).

* _creating new waypoints and tracks_. The creation of a track requires a map so that track points can be properly located.
If elevation data should be added to the track, then this data (DEM data) should be available in QMS. Finally,
if routing should be used for track creation then routing data should be available in QMS.

QMS offers quite a few easy ways to create and edit tracks. Among others

* copy, cut-and-paste and
* adding and deleting

of trackpoints are supported.

In a track created with the methods mentioned in the last paragraph

* can be trackpoints with or without timestamps,
* can different track segments have trackpoints with inconsistent (invalid) timestamps,
* can elevation data be available or not or can be even invalid (see discussion
[here](AdvTrkElevation#markdown-header-handle-invalid-elevation-data)).

If there are invalid timestamps or elevation data in a newly created or edited track then QMS displays a red warning message in the track info box.

The user should use the __Change timestamps of track points__ filter to remove invalid timestamps.

Different approaches for avoiding or removing invalid elevations are described
[here](AdvTrkElevation#markdown-header-handle-invalid-elevation-data).


- - -
[Prev](AdvTracks) (Tracks) | [Home](Home) | [Manual](DocMain) | [Top](#) | (Track filters) [Next](AdvTrkFilters)
