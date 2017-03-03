[Prev](AdvTrkFilters) (Track filters) | [Home](Home) | [Manual](DocMain) | [Index](AxAdvIndex) | (Editing elevation data) [Next](AdvTrkElevation)
- - -
[TOC]
- - -

# Working with track graphs

## Zoom track graphs

(_valid starting with QMS patch version  b9235da (18.11.2016)_)

The edit window of a track can show up to 3 graphs displaying the track profile and at most 2 of the 3 features _progress_,
_speed_ and _slope_.

The initial scaling of the graphs is so that the whole graph/track data can be seen.

All graph scales allow horizontal and vertical zooming with the mouse wheel as follows:

* move the mouse pointer on a graph,
* use the mouse wheel to zoom in or out on the horizontal __and__ on the vertical scale at the same time,
* press the _CTRL_ key and use the mouse wheel to zoom in or out on the vertical scale only,
* press the _ALT_ key and use the mouse wheel to zoom in or out on the horizontal scale only.


A red vertical or horizontal line at the scales shows how much of the whole scale is actually displayed in the graph.

If only part of the graph is displayed (red line is shorter than the whole scale) then the graph can be moved by
pressing the left mouse button, moving the mouse vertically or horizontally and releasing the mouse button.

## Select a scale range for track data display

When displaying track graphs in the track edit window or when using different colors on a track shown in a map window
the user can select a scale range. There are 3 different strategies for such a selection that can be chosen by a click on
the respective icon in the _Graphs_ resp. _Style_ tabs of the edit window:

* User defined limits for this track
* Automatic limits
* User defined limits for all tracks

A separate range can be defined for each of the available data fields.

When selecting _Automatic limits_ the QMS sets the range from the minimum to the maximum value of the data field in
the given track.

When selecting _User defined limits for all tracks_ then initially the latest used settings are displayed which can
be changed by the user. A change will affect every track for which this option was selected for the given data field.
_Remark:_ Other already open track edit windows won't be updated when changing the settings for the given track.
The user should re-open them.

- - -
[Prev](AdvTrkFilters) (Track filters) | [Home](Home) | [Manual](DocMain) | [Index](AxAdvIndex) | [Top](#) | (Editing elevation data) [Next](AdvTrkElevation)
