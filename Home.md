# Welcome to MapRoom

MapRoom is the successor of QLandkarte GT. But it's no QLandkarte GT 3.0, it's somthing complete new, braking with most of the concepts in QLandkarte. As most Open Source projects, QLandkarte evolved with no real roadmap. It was deveopment by need and request. And it was a playground for many ideas and concepts. Naturally that results into a kind of awkward code with a thick layer of slag and issues. And at a certain point of development the beast won't digest another flip in the concept anymore. That is why MapRoom starts from scratch. 

If you want to start with MapRoom visit the [documentation page](DocMain).

If you want to help developing MapRoom visit the [developer's page](Developer).

## Goals

So, what will be new?

* Use of several workspaces. QLandkarte has only one workspace. To see your data on another map you have to switch the map. Now you can open several independent workspaces with different maps each.

* Use several maps on a workspace. In QLandkarte you can select a single map and overlay it with a vector map. This is not very practically if you look at the border of two maps. With MapRoom you are able to select as many different map files to be displayed as you want. The maps can even have different projections and overlay each other. You can define the draw order, the opacity and the zoom range a map is visible.

*  Handle data project-oriented. In QLankarte you have a list for tracks, waypoints and so on. An then you have a geo database that somehow combines all these elements into a workspace. Over the years I developed the opinion that private consumer tend to organize their data as projects that combine all kind of data. 

     Let me explain: If I do a hike I use a track with waypoints for navigation. Some GeoCaches along the track. Sometimes a route to the parking lot. This should be all grouped into one project. During the hike I record a track and create more waypoints. This data should be added to the project. And later on I create a diary for the day. Back on the PC I want to see all that as a group, a project, next to other projects. 

* Exchange data with the device by drag-n-drop. In QLandkarte data exchange was strongly influenced by the old Garmin devices that could do an up- and download of all data only. This will be dropped including the support for old devices. The goal is to handle data on the device just as the data in the workspace. As projects where you add or update data.

