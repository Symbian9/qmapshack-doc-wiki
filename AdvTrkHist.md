[Prev](AdvTrkElevation) (Editing elevation data) | [Home](Home) | [Manual](DocMain) | [Index](AxAdvIndex) | (Routes and Routing) [Next](AdvRoutes)
- - -
[TOC]
- - -

# Track history and saving

QMapShack maintains a record of all changes made while editing a track (the same is also true for routes, waypoints, and areas). To see the list of all changes made select `Edit` from the
track context menu to open the track edit window and click the `History` tab in this window. Each entry in the list has a short description of the
change made to the given track.

A left click on a row in the history list reverts the track to the selected state.

A right click on an entry in the history list opens a context menu which allows to drop all revisions of the track before or after the given one.

When saving a track (i.e. the project to which the track belongs) into a database or a QMS file, then the track (and all other data object in the project) 
is saved together with its complete history.
Thus, having a long history list for a track may result in a large data volume to be stored. To avoid this consider dropping obsolete revisions of the track
as described above.

When saving a track (i.e. the project to which the track belongs) into a GPX or TCX file only the currently selected revision of the track/project and not the complete history is saved.

- - -
[Prev](AdvTrkElevation) (Editing elevation data) | [Home](Home) | [Manual](DocMain) | [Index](AxAdvIndex) | [Top](#) | (Routes and Routing) [Next](AdvRoutes)
