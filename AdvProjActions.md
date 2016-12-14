[Prev](AdvProjects) (Databases and projects) | [Home](Home) | [Manual](DocMain) | (Data handling) [Next](AdvDataHandling)
- - -
[TOC]
- - -

# General actions

## Working with databases

### Export database to GPX file

(_valid starting with QMS patch version  f2297514ff5f (2016-12-08)_)

The data of a whole database or one of its subfolders (project, group, other) can be saved into GPX files. To do so

* right-click the database or folder name and select the context menu entry `Export to GPX...`,
* the window that pops-up ("_export window_") allows to select the target folder and the type of GPX file wanted,
* click the `Start` button to start the save operation. 

  _Attention:_ Saving of big databases
  can take a while. The export window shows the progress of the operation and the storage location of each 
  newly created folder and GPX file. Wait for the `Done` information in the export window!
  
If a database is saved a new folder is created in the selected target directory. Subfolders to this folder for projects 
and groups in the database are created - if necessary - to mirror the tree structure of the database. Data items (waypoints, tracks, 
routes) in a database folder are saved into a GPX file having the name of the folder to which they belong. 

If a subfolder (project or group) of a database is saved then this rule is applied in a similar way.
  
## Working with projects

### Merge projects

**Source:** [gmane.comp.gis.qlandkartegt](http://article.gmane.org/gmane.comp.gis.qlandkartegt.user/2612)

With QMapShack version 1.6.1 or later:

  * Load all stuff you want to have in a single project into the workspace (possibly resulting in several new projects).
  * Zoom the map window so that all data of interest can be seen on the map.
  * Right click on the map window and choose `Select Items on Map`.
  * Follow the instructions displayed and select whatever data you want to have in one project.
  * When the selection is finished, click `Copy all selected items to a project` icon.
  * Select or create the destination project.
  * Remove all unnecessary projects from the workspace.

If you use a database you do not have to load all data of a project.
You can load only the items needed. Additionally, if you store a newly created
project into the database you do not need to clone (duplicate) the data.

In the same way all the contents of one project can be dragged into another project. 


### Copy project

**Source:** [QMS newsgroup thread](https://sourceforge.net/p/qlandkartegt/mailman/message/35527720/)

To move a project from the workspace into a group in a database and keep the workspace project name proceed as follows:

* Right click on the project folder in the workspace and select `Copy to...` 
* Enter the name you want it to have in the database
* Select the destination database and in the next dialog the location in the database

### Save project

* _Save a single workspace project:_

    When saving a project from the workspace exactly the project data displayed in the workspace is saved. 
    _Remark:_ If the project belongs to a database then the user can select the data to be displayed in the workspace.
    The part of the project data not selected for display is not saved by this method!
    * Right-click on the project name in the workspace
    * Select one of the `Save ... ` menu entries in the context menu of the project
        * If `Save` is selected then the project is saved in the form selected when the project was created
           (`QMS` or `GPX` file or database file).
        * If `Save as ...` is selected then the user can decide if the project should be saved as `QMS` or as `GPX` file.
        * If `Save as GPX 1.1 w/o ext...` is selected then the project is saved as GPX file without extensions
           (compare section
           ["Which track data is saved in GPX files?"](DocFaqHandling#markdown-header-which-track-data-is-saved-in-gpx-files))

* _Save all projects in workspace:_

    Select menu entry `File - Save all GIS data` or press `CTRL-S`. Depending on the type of the project (QMS, GPX or database)
    the data is saved to a file or to a database.    

* _Save (export) project as part of a database:_

    See section ["Export database to GPX file"](AdvProjActions#markdown-header-export-database-to-gpx-file)!


- - -
[Prev](AdvProjects) (Databases and projects) | [Home](Home) | [Manual](DocMain) | [Top](#) | (Data handling) [Next](AdvDataHandling)
