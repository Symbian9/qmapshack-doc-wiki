[Prev](DocFaqData) (Databases and projects) | [Home](Home) | [Manual](DocMain) | (Routing) [Next](DocFaqRouting)
- - -
[TOC]
- - -

# Frequently Asked Questions - Data handling


## How to find distance between waypoints

(_inspired by and partially copied from_ [QMS issues list](https://bitbucket.org/maproom/qmapshack/issues/169/distance-between-waypoints-popup-window))

* _Find the direct distance from a waypoint to some other point:_ set a waypoint and move it to the other point.
  This will give you the distance and the course (direction) to the other point. When done abort the operation (right mouse click) and remove the waypoint.

![Distance between waypoints](images/DocFaq/WPTDistance.jpg "Distance between waypoints")

* _Find a defined distance from several waypoints:_ add the distance as proximity to the waypoints.

![Set waypoint proximity](images/DocFaq/WPTProximity.jpg "Set waypoint proximity")

![Waypoint distances](images/DocFaq/WPTDistances.jpg "Waypoint distances")


* _Find the street distance or the direct distance between several points:_ start to create a track with or without routing.

![Direct track distance](images/DocFaq/Directtrack.jpg "Direct track distance")

![Routed track distance](images/DocFaq/Routedtrack.jpg "Routed track distance")

## Which track data is saved in GPX files?

(_valid starting with QMS patch version 7ac34c818ec1/2016-12-06_)

QMS supports 2 kinds of GPX files:

* GPX files that follow strictly the rules of the GPX 1.1 standard,
* GPX files using additional extensions (_special format_).

In both cases the following track data is saved in the GPX file:

* track name,
* location of each trackpoint,
* timestamp of each trackpoint (if available),
* elevation of each trackpoint (if available).

The additional extensions used in the _special format_ provide information about

* the track history (can't be re-activated when GPX file is re-loaded into QMS),
* the track display color
* the type of a trackpoint (trackpoint created by routing engine (so-called subpoint) or
  trackpoint created by user interaction, hidden trackpoint, activity)

Trackpoints created by a routing engine can't be edited by the user whereas trackpoints
created by a user can be
edited (compare section ["Edit items with multiple points"](DocGisItemsEditMultiple)).



- - -
[Prev](DocFaqData) (Databases and projects) | [Home](Home) | [Manual](DocMain) | [Top](#) | (Routing) [Next](DocFaqRouting)
