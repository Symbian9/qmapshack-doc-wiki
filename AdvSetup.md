[Prev](AdvRoutes) (Routes and Routing) | [Home](Home) | [Manual](DocMain) | [Index](AxAdvIndex) | (Frequently Asked Questions) [Next](DocFaq)
- - -
[TOC]
- - -

# Overview of setup and configuration options

_Valid from patch version 55d8aa7 (18.11.2017)._

This page gives an overview over the available QMS setup and configuration options.

More details of the topics mentioned on this page can be found elsewhere in this Wiki.

## General options

### Workspace setup 

* Goto menu  `Workspace - Setup workspace`

  In the pop-up windows define
    * a time interval for automatic project data backup,
    * a listening port for a QMS multi-user environment.
* To control the visibility of parts of the workspace goto menu `Window`
    * `Toggle docks:` change visibility of all docked window parts at once.
    * `Toolbar:` change visibility of toolbar.
    * `Maps, Dig.Elev.Model (DEM), Workspace, Database, Routing:` change visibility of single docked window part.
    
### Waypoint icons setup

* Goto menu  `Workspace - Setup waypoint icons`
* In the pop-up windows click the `Open` icon and define a path from which additional user-defined waypoint icons can be loaded


### Toolbar setup

The toolbar allows quick access to important QMS actions.

* Toggle the display of the toolbar with the help of the menu `Window - Toolbar`.
* Configure the toolbar with the help of the menu `Window - Setup toolbar`:
    * Move actions to be included in the toolbar from the left part of the pop-up window to the right part of the window.
    * Move actions not to be included in the toolbar from the right part of the pop-up window to the left of the window.
    * Select the checkbox, if the toolbar should be displayed in the fullscreen mode, too.

## Map and DEM setup

### Map paths

* Goto the `Maps` tab (dockable window, if not visible, then open it with the menu entry `Window - Maps`)
* Right click in the window to open the context menu
* Select `Setup map paths` (alternatively: select menu `File - Setup map paths`)
* In the pop-up window, add or remove paths with vector or raster maps

### Map cache path for online maps

* Goto the `Maps` tab (dockable window, if not visible, then open it with the menu entry `Window - Maps`)
* Right click in the window to open the context menu
* Select `Setup map paths` (alternatively: select menu `File - Setup map paths`)
* In the pop-up window, define a path used for caching online map tiles

### DEM file paths

* Goto the `Dig.Elev.Model (DEM)` tab (dockable window, if not visible, then open it with the menu entry `Window - Dig.Elev.Model (DEM)`)
* Right click in the window to open the context menu
* Select `Setup DEM paths` (alternatively: select menu `File - Setup DEM paths`)
* In the pop-up window add or remove paths with digital elevation (DEM) data 


### Map window display switches (toggles)

The following toggles change the layout of all map windows:

* Menu `View - Show scale`: switch on or off display of map scale 
* Menu `View - Show grid`:  switch on or off display of map grid
* Menu `View - POI text`: switch on or off display of POI names on vector maps
* Menu `View - Map tooltip`: switch on or off tooltip window display of features of the objects under the mouse cursor in a vector map
* Menu `View - Night/Day`: change map display between day and night layout (if supported by map)
* Menu `View - Flip mouse wheel`: change the zoom direction when zooming a map with the mouse wheel
* Menu `View - Ext. profile`: if selected: track profile is shown in a resizable and floating separate window, otherwise in a small and fixed window

### Map window display setup

The following setup options change the layout of all map windows:

* Menu `View - Setup map font`: In the pop-up window select the font and its properties used for text in map objects
* Menu `View - Setup map background`: In the pop-up window select the color of the map background
* Menu `View - Setup units`: In the pop-up window select the length unit (nautic, imperial, metric) and the slope unit (% or °). 
  _Hint:_ Changes may take effect only after a QMS restart
* Menu `View - Setup grid`: 
    * Select the color of the map grid with the help of the palette icon
    * _Expert mode_: Define the projection used for the grid
* Menu `View - Setup map view`: 
    * Set the map scales to _Logarithmic_ or _Square_. A change of this option leads to a different zoom behavior of maps 
     (compare section "[Map scale type](AdvMapDetails#markdown-header-map-scale-type)").
    * _Expert mode_: Define the projection and datum of maps
* Menu `View - Setup coord. format`: Select one out of 3 supported coordinate formats 

### Single map display options

With the help of these options the user controls the rendering of a single map. For details, see 
section "[Adjustable map properties](AdvMapDetails#markdown-header-adjustable-map-properties)"


## Routing setup

### Routino database paths

* Goto the `Route` tab (dockable window, if not visible, then open it with the menu entry `Window - Route`)
* In the combobox on the top of the window, select `Routino (offline)` 
* In the pop-up window, add or remove paths for Routino databases

### Routino setup

* Goto the `Route` tab (dockable window, if not visible, then open it with the menu entry `Window - Route`)
* In the combobox on the top of the window, select `Routino (offline)` 
* Select 
    * Profile (vehicle type)
    * Language (for routing instructions)
    * Mode (quickest/shortest)
    * Routino database (should cover area under consideration)
    
### BRouter setup

* For general information about the use of BRouter see [here](http://brouter.de/brouter/).
* Goto the `Route` tab (dockable window, if not visible, then open it with the menu entry `Window - Route`)
* In the combobox on the top of the window, select `BRouter (...)` 
* Be sure the Internet can be accessed
* Click the `Setup` button
* In the pop-up window choose 
    * online (`BRouter-Web (online)`) or offline (`local installation`) routing. _Remark:_ This selection will change the router name shown in the above mentioned combobox.
    * `Expert mode:` if appropriate: enables setting of some additional parameters for off- or online routing
* _Online router settings (recommended, easier to use, no additional installation step):_ 
    * Click `Next` after selecting online routing
    * In the next window, add or remove available BRouter profiles
    * If necessary, change the order of selected profiles
    * Close the profile selection window
* _Offline router settings (requires additional installation step):_
    * Click `Next` after selecting offline routing
    * Select local BRouter installation directory
        * If the installation directory is empty or doesn't exist: click button `Create new BRouter installation` resp. `Create directory and install BRouter there`
        * If a BRouter installation is found in the installation directory: click button `Update existing BRouter installation` and select the version you
          want to install
    * Select Java executable
    * Click `Update existing BRouter installation`, if appropriate
    * Go to the next window
    * Add or remove available BRouter profiles
    * If necessary, change the order of selected profiles
    * Close the profile selection window
    * In the next window, select the tiles (areas) to be used for routing.
    
        _Comments:_
       
         * The tiles (segments) have a size of 5° in each direction
         * The scale of the tile selection window can't be changed
         * The tile selection window is centered at the center of the last map view used. It shows the map of this view with minimal scale.
         * _Recommendation:_ Before starting the BRouter setup define with the help of context menu `Add area` a sufficiently large area on the map for which routing
           data are required. This area can be seen in the tile selection window and tiles around it can be selected properly.  
           
    * Click `Download` to start the download of routing data for offline use. _Attention:_ Depending on the size of the selected area
      the download duration can be considerable!
    * Close the download window after the end of the download
 * Select one of the available routing profiles
 * Select, if required, an alternative to the original route
 * In the case of offline routing, select the `on the fly routing` checkbox, if the next route segment should be calculated
   immediately after selecting the next route point.
    

### MapQuest setup

* Goto the `Route` tab (dockable window, if not visible, then open it with the menu entry `Window - Route`)
* In the combobox on the top of the window, select `MapQuest (online)` 
* Select 
    * Profile (vehicle type)
    * Language (for routing instructions)
    * Road types to avoid
* _Hint:_ When creating a new track, create first a new route, select - if necessary - `Calculate route` from the route context menu
  and after the route has been completely constructed, convert it to a track with the help of the route context menu.

## Further setup and configuration options

The following list shows some more setup options without detailed description:

* Database import from QLandkarte (menu `Tool - Import database from QLandkarte`)
* VRT Builder for raster maps (menu `Tool - VRT Builder`)
* Routino database creation (menu `Tool - Create Routino database`)

- - -
[Prev](AdvRoutes) (Routes and Routing) | [Home](Home) | [Manual](DocMain) | [Index](AxAdvIndex) | [Top](#) | (Frequently Asked Questions) [Next](DocFaq)
