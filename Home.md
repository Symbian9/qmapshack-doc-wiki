# Welcome to MapRoom

MapRoom is the successor of QLandkarte GT. But it's no QLandkarte GT 3.0, it's somthing complete new, braking with most of the concepts in QLandkarte. As most Open Source projects, QLandkarte evolved with no real roadmap. It was deveopment by need and request. And it was a playground for many ideas and concepts. Naturally that results into a kind of awkward code with a thick layer of slag and issues. And at a certain point of development the beast won't digest another flip in the concept anymore. That is why MapRoom starts from scratch. 

## Goals

So what is so new at this new application?

* Use several canvas. QLandkarte have only one canvas. To see your data on another map you had to switch the map. Now you can open several independent canvases with different maps each.

* Use several maps on a canvas. In QLandkarte you can select a map and overlay it with a vector map. This is not very practically if you look at an area on the border of two maps. Now you are able to select as many different map files to be displayed. The files can even have different projections. 

* Handle data project oriented. In QLankarte you have a list for tracks, waypoints and so on. An then you have a geo database that somehow combines all these elements into a workspace. Over the years I developed the opinion that private consumer geo data has to be structured as single projects. If I do a hike I use a track with waypoints. Some GeoCaches along the track. Sometimes a route to the parking lot. This should be all grouped into one project. During the hike I record a track and create more waypoints. This data should be added to the project. And later on I create a diary for the day. Back home on the PC I want to see these projects grouped on my workspace.

* Exchange data with the device by drag-n-drop. In QLandkarte data exchanged was strongly influenced by the old Garmin devices that could do an up- and download of all data only. This will be dropped including the support for old devices. The goal is to handle data on the device just as the data in the workspace. As projects where you add or update data.

