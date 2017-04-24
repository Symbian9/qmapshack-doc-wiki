Prev () | [Home](Home) | [Manual](DocMain) | [Index](AxAdvIndex) | () Next
- - -
[TOC]
- - -

# Quickstart

___(Short summary for Windows users)___

_Except for the parts relating to the QMapShack installation itself this summary is valid for non-Windows operating systems, too._

QMapShack (in brief QMS) for Windows is a 64-bit application and requires therefore a 64-bit Windows operating system.

This summary is kept as short as possible in order to quickly get the user to work with QMS. Many of the described
actions can also be performed in a different way. The discussion of these possibilities is suppressed.

Detailed information on QMS is available in the
[Wiki](DocMain "QMS Wiki").

## Download files from Internet

_Hints_:

* The version numbers mentioned can change. The latest available version should always be selected.
* Often, files can be selected for specific regions on the specified pages. The user should find the region he is interested in.
* The recommendations given here are examples. There are many other options available!

The following links are recommendations for files which allow comfortable working with QMS and which can be downloaded from the Internet.

* _QMapShack_:

    * [Load QMS from Bitbucket-Server](https://bitbucket.org/maproom/qmapshack/downloads "Load QMS installation file").
      Download the file `QMapShack_Install_Windows64bit__1.7.2.exe` from this site (approximately 50 MB, version number can be different).

* _Use of maps (recommended)_:

    * [Load vector map Germany (Freizeitkarte)](http://download.freizeitkarte-osm.de/garmin/latest/DEU_de_gmapsupp.img.zip "Freizeitkarte Deutschland"). 
      (Choose your region! Approximately 1.4 GB, if a Garmin navigation device is used, a suitable file `gmapsupp*.img` may already exist
       and can be used in this step)
    * _Optional:_ [Load links to on-line maps](http://www.mtb-touring.net/qms/onlinekarten-einbinden/ "On-line maps"). 
      _Hint:_ Click blue field `Download online maps`! Result is a downloaded file `Onlinemaps.zip`.
    
* _Routing support (recommended for creation of new routes and tracks)_:

    * [Load Routino data](http://download.geofabrik.de/europe/germany.html "Load Routino data"). On this page, go e.g. to line `Berlin` 
      (choose your region!) and 
      click in this line on `.osm.pbf`. The file `berlin-latest.osm.pbf` is downloaded.
    
* _Elevation data (recommended, if elevations should be assigned to new tracks)_:     

    * [Load tiles with elevation data](https://dds.cr.usgs.gov/srtm/version2_1/SRTM3/Eurasia "Load elevation tiles"). 
      Use coordinates to choose necessary file(s), e.g. `N51E012.hgt.zip`. The coordinates in the file name describe the south-western 
      corner of a tile. 
    
        _Or:_
      
    * [Load elevation data for a region](http://www.viewfinderpanoramas.org/Coverage%20map%20viewfinderpanoramas_org3.htm "Load DEM data for region"). 
      On the displayed map select your region and click on it.
      E.g. a file `N32.zip` is downloaded. Here, `N32` is the name of the so-called UTM zone.

    _Hint:_ Download as many files as needed for your region!  
      
## Installation
* All downloaded files are in the user's download directory.
* Find the file `QMapShack_Install_Windows64bit__1.7.2.exe` in the download directory.
* Start this installation file by double-clicking the filename.
* Confirm the information in the first installation windows.
* In the `Select Components window`, select `MSVC ++ 2013 SP1 runtime` (this can be omitted if 
  this runtime environment has been already installed).
* Confirm starting the installation of the runtime environment. _Hint:_ The installation may take a few minutes!
* At the end of the installation of the runtime environment, finish this installation with the `Close` button. 
  The QMS installation is then continued and QMS is installed completely.
* QMS can already now be started from the Start menu. However, it is recommended to perform still the following steps.
* Create a directory where the user has write permission. In the following discussion
  this directory called `QMS`. _Note:_ The user has no
  full write permission for the default installation directory, so in this step a
  separate directory for data must be created.
* Add the following subdirectories to the directory `QMS`
    * `Maps`,
    * `Routino`,
    * `DEM`,
    * `Databases`.
* Open the file `DEU_de_gmapsupp.img.zip` (or the vector map you downloaded) with the leisure map of Germany and copy 
  the file `gmapsupp.img` into the `Maps` folder.    
* Rename the file `gmapsupp.img` to `LeisureMap_DE.img`.
* _Optional:_ Open the file `Onlinemaps.zip` and copy the files contained in it into the `Maps` folder.
* _Optional:_ Move the file `berlin-latest.osm.pbf` (or the Routino data you downloaded) to the `Routino` folder.
* _Optional:_ Open the file `N51E012.hgt.zip` or ` N32.zip` and copy the files in it into the `DEM` folder.


## Steps after the first start

* Start QMS from the Start menu (Choose `QMapShack - QMapShack`).

    ![Start QMS](images/DocAdv/InstallProgramMenu.jpg "QMapShack start menu")
  
* The empty QMS user interface (GUI) appears. QMS tries to use the language of the operating system. If this language is not supported
  by QMS, then English is used as language of the QMS interface.  
 
    ![QMS GUI](images/DocAdv/InstallGuiEn.jpg "QMS Initial GUI")

    The middle part of the user interface is designed for map display, for data editing windows, and for some other purposes.
  
    The 4 subwindows on the left and right edges (`Maps`, ` Dig.Elev.Model(DEM)`, `Data`, `Route`) can be moved separately and
    can be docked in different arrangements at different locations. You can open and close the windows using the `Window` menu item.
 
* The GUI contains some hints about recommended first actions. These are described in the following points. Similar
  information in the form of info boxes is often obtained if one points with the mouse on a displayed object. 
   
* _Activate vector maps:_
    * Go to the `Maps` window with your mouse.
    * Open the context menu with a right click and select `Setup map paths`.
    * Open the folder `QMS\Maps` and select this folder.
    * In the map window appears a new entry `LeisureMap DE`.
    * Open the context menu with a right click on the map name and select `Activate`.
    * Move the map to a position that is contained in the map. The map should be visible.
* _Optional: Activate on-line maps: (requires selection of the map folder in the previous step!)_
    * Go to the `Maps` window with your mouse.
    * Open the context menu with a right click and select `Reload Maps`.
    * In the map window appears a new entry, in the example `4UMaps-eu` (maybe appeared already during the activation of the vector map!).
    * Open the context menu with a right click on the map name and select `Activate`.
    * If an Internet connection is active, then the selected on-line map is now loaded (this can take some time, progress is shown in 
      the middle window!)

      ![Activate on-line map](images/DocAdv/InstallMapsEn.jpg "Activating on-line map")
    
    
* _Optional: Activate routing support:_
    * Choose menu entry `Tool - Create Routino Database`.
    * A new window will open.
    * Select `QMS\Routino\berlin-latest.osm.pbf` as source file and ` QMS\Routino` as target path.
    * Type `BE` as file prefix.
    * Click the `Start` button.
    * In the right column of the window you can follow the executed actions. This process can take some time!
      The completion of the operation is shown.
    * Go to the `Route` window and add the `QMS\Routino` folder using the 'Open' icon.
    * Open the database selection list in the `Route` window and select `BE`.
    * Routes and tracks can now be created with the support of the off-line Routino router (in the area covered by the
      selected database, in the example for Berlin!).
      
      ![Create Routino database](images/DocAdv/InstallRoutinoDbEn.jpg "Create Routino database")
      
      
* _Optional: Activate support for digital elevation data:_    
    * Choose the menu entry `Tool - VRT Builder`.
    * A new window will open.
    * Select `QMS\DEM\N51E012.hgt` as source file (multiple selections for further HGT files possible!) and `QMS\DEM\N51E012` as target file
      (the extension `.vrt` is added automatically).
    * Click the `Start` button. The completion of the operation is shown.

      ![Create VRT for elevation data](images/DocAdv/InstallDem2VrtEn.jpg "Create VRT file for elevation data")

    * Move the mouse to the `Dig.Elev.Model (DEM)` window.  
    * Open the context menu with a right click and choose `Setup DEM paths`.
    * Choose `QMS\DEM` as folder.
    * In the `Dig.Elev.Model (DEM)` window now appears, among others, an entry `N51E012`.
    * Open the context menu with a right click on this name and select `Activate`.
    * Elevation data is now available for the selected area (in the example the south-west corner of the area has the coordinates 
      51° North, 12° East and extends over 1° in both directions).
    * The existence of elevation data at the location of the mouse pointer is indicated in the status line by an existing elevation specification.
 
        Status line without elevation data:
      
        ![No elevation data in status line](images/DocAdv/InstallNoDem.jpg "No elevation data in status line")
    
        Status line with elevation data:
      
        ![Elevation data in status line](images/DocAdv/InstallDemEn.jpg "Elevation data in status line")
      
    
    
With these steps, a workable state of QMS is reached.
   
## Some typical operations in QMS

### Zoom and move map

* _With the keyboard:_ 
    * Arrow keys move the map in the selected direction.
    * The keys "__+__" and "__-__" increase or decrease the map scale (zoom in and out).
* _With the mouse:_
    * Press and hold the left mouse button to fix the map to the mouse. When moving the mouse (without releasing the pressed key),
      the map is moved. Once the desired map position has been reached, release the mouse key.
    * Use the mouse wheel to zoom in or out.
    
### Load GPX file and show data

* _Assumption:_ There exists a GPX file `QMS\MyProject.gpx`.
* Choose the menu entry `File - Load GIS Data` and select `QMS\MyProject.gpx` in the file selection window.
* In the upper part of the `Data` window (the _project window_) appears a new project entry with name ` MyProject`.
* After opening the project, the waypoints and tracks present in the GPX file (that is, the project) are displayed.
* If you move the mouse pointer to one of the displayed lines, you get some information about the selected object.
* A double click on a waypoint or track centers the selected map around this object.

     ![Show project](images/DocAdv/InstallProjectEn.jpg "Show project")

### Create new database

QMS provides various forms of data storage. A recommended and powerful form is storing the data in
a database. The following steps are required to create a database:

* Go with the mouse to the bottom half of the `Data` window (the _database window_).
* Open the context menu with a right click and select `Add Database`.
* In the next window, select a database name and a file name in the form `QMS\Databases\MyDatabase.db`
  (leave `SQLite` selected!).
* The selected database name appears as a new line in the database window.

### Data organization in the database

QMS databases are appropriate for a clear tree-like data structure similar to that in a folder tree.
The nodes of the tree (also called folders) can have one out of three different types used for a clearer organization of the data:

* _Group:_ Is only used to keep together subordinate folders. Groups can only contain subfolders, but no data.
* _Project, Other:_ Can contain subfolders and data. Data can be displayed and edited in the project window.

Physically saved are databases. Saving can be done manually or, if properly setup with the help of the menu entry `Project - Setup workspace`,
automatically within certain time intervals.

_Example:_

![Example project organization](images/DocAdv/DbStructureExampleEn.jpg "Example for project organization in database")

The names selected in the example describe the purpose of the database or the folders.

The group _Bicycle_ can be filled with an analogous structure.
   
The creation of databases was described in the previous step.   

To create group, project and other folders follow these steps:  
 
* Open the context  menu with a right click on the database or folder name.
* Choose the menu entry `Add folder`.
* In the next window, select a folder name and a folder type (different types use different folder colors).
 
_Further information:_ 

* By setting a hook in the field in front of the folder name, the folder 
  is opened in the project window and the data contained in it (if also selected) is shown in the map window. 
  For a clearer identification of the source of the project (folder) the name of the next higher folder is appended 
  to the folder name after the separator "__@__".
  This additional information is not appended to top-level folders.
  The described procedure allows a target-oriented and structured display of selected data in the project and in the map windows.
* Editing and deleting data is done in the project window.
  If the data of a folder has been edited, then this is indicated by a dot in front of the folder name and the data name (in the example the
  new track _Süßer See_ is not yet saved and therefore not yet available in the database). Edited projects
  should be saved regularly to the database using the context menu entry `Save`.
* Complete deletion of data has to take place in the database window. Deleted data is moved to the automatically created
  Folder `Lost & Found` and final deletion should be done from this folder.
  Deletion in the project window deletes the data from the displayed project, but not from the database.
* In addition to folders (projects) that belong to databases, there are still projects that are saved directly in a GPX or QMS file.


### Create track 

* _Assumption:_ Routing support has been installed.
* Move the mouse to the `Route` window.
* In the selection list at the top of the window select `Routino (offline)`.
* In the other lists select the profile (the kind of movement), the language (for turn-by-turn instructions), the mode (quickest/shortest) 
  and one of the
  existing Routing databases (in the example `BE`).
* Move the mouse to the starting point of the track in the map window.
* Open the context  menu with a right click and select `Add Track`.
* Press `Ctrl-A` on the keyboard (this selects the automatic routing mode).
* Move the mouse to the wanted next intermediate point of the track and fix it with a left click. An intermediate track segment is 
  automatically calculated in accordance with the selected routing options between the last two
  selected points. This segment is displayed in the map window.
* Repeat the previous step until the end of the track is reached.
* Right click to finish the new track.
* Select `Save as new`  from the toolbar at the top of the map window.
* Enter a track name.
* Select a new project name and `Database` as the project type.
* Select the available database.
* Select a name for a database folder.
* A new project with the selected name is displayed in the project window. This project contains the newly created track.
* The database window shows a new folder for the used database.
* Open the context menu with a right click on the project name and select `Save`. The project with its
  data is permanently saved in the selected database folder. The saved track appears as a line in the database folder.

  
  
  

- - -
Prev () | [Home](Home) | [Manual](DocMain) | [Index](AxAdvIndex) | [Top](#) | () Next
