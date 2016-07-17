Prev () | [Home](Home) | [Manual](DocMain) | () Next
- - -

[TOC]


# Routing Quick Start  #

Activate a proper map. OpenStreetMap as installed by "I want maps" will do perfectly.

Activate **Menu -> Project -> Add empty project**  

**kiozen: Images are stored in the correct folder of the images folder. Keep in mind that the Wiki can be converted into a stand alone HTML document by the scripts. Therefore all stuff has to be in this repository.**


![projmenu.png](https://bitbucket.org/repo/L5qerE/images/1188753088-projmenu.png)

and give it a proper name. Leave qms project type unless you know why not.

![proj_new.png](https://bitbucket.org/repo/L5qerE/images/2189981266-proj_new.png)

Activate **Menu -> Project -> Search Google** if not yet open.

Type some search term for your address into the "Google Project" field. You may expand the left triangle to see your results. If you get "Error:", try to change or refine your search term. Usually, a road and a town should give reasonable results. Right click on your result, activate "copy to" and select your project name given in the first step. If your search yields multiple results, select the one desired.

This way, you collect **waypoints** in your project.
Repeat the steps for all waypoints your route is desired to pass.

Use **shift-<click>** or **ctrl-<click>** to select some or all of your waypoints in the project. Be sure to select at least two waypoints and no other objects.
In the context menu (right mouse button), select "Create Route". 

![rte_create.png](https://bitbucket.org/repo/L5qerE/images/541772100-rte_create.png)

You can now adjust the sequence in which the route should pass your waypoints.

![rte_cr_rearrange.png](https://bitbucket.org/repo/L5qerE/images/3043379165-rte_cr_rearrange.png)

Continue with OK, enter a route name in the next window and select your project in the following window.

QMapShack automagically will calculate the route according to your current routing preferences, which more or less may take some time.

Double click your route to zoom your map view to the whole route.

![ge_must_see.jpg](https://bitbucket.org/repo/L5qerE/images/2544969820-ge_must_see.jpg)

Click on the route between the waypoints to display route properties

![rte_properties.png](https://bitbucket.org/repo/L5qerE/images/866504795-rte_properties.png)

Save your project if you want to use the results later.



# Manipulating a Route #

### route context menu ###

![rte_context.png](https://bitbucket.org/repo/L5qerE/images/3754465212-rte_context.png)

"**Edit...**", "**Copy to...** " and "**Delete**" are generic object functions and do what their name promises.

"**Route Instructions**": highlight route and see routing instructions.

"**Reset Route**" removes the calculated pathway and returns to waypoints linked by straight lines of flight.

"**Calculate**" restores the calculated pathway or recalculates it according to your (maybe changed) routing preferences.

**kiozen: Local documents are referenced like this:**

See [here](DocGisItemsRte)
how to configure your routing engine. It is strongly encouraged to **use** offline **routino** routing, if you want to use serious route planning - both for performance reasons and to limit load on MapQuest online routing.


"**Convert to Track**" creates a track with a large number of points ("breadcrumb track") which remains independent of the routing engine, the router map and the routing properties (available in version 1.6.2). If your GPS device supports routing by track, this will deliver exactly what you have planned. Be aware, that from track data, you cannot easily replan your route on the GPS device.

"**Edit route**" .....
This allows you to add/delete/move maypoints to your route. See here
https://bitbucket.org/maproom/qmapshack/wiki/DocGisItemsEditMultiple
for a detailled description of the dialogue.

You may notice that the routepoints have lost their relation to the waypoints from which they were initially created. Moving a routepoint does not change the waypoint it was derived from.

### Issue: named route points ###

The routepoints do not inherit their name or description from the waypoints they were generated from.
There is a bug report/feature request on this in the issue list:
https://bitbucket.org/maproom/qmapshack/issues/127/create-a-route-from-waypoints-does-not-add

### Manually create, edit and move a waypoint ###

If you are not always happy with the results of the "Google Search" function, you may manually fine tune your waypoints before deriving a route from them. See here for detailed instructions:
https://bitbucket.org/maproom/qmapshack/wiki/DocGisItemsNew#markdown-header-waypoint

### Import Waypoints ###

The GPX file format is a widely used de facto standard for GIS data exchange. Many GIS data sources may produce GPX directly, which can be used in the "File -> Load GIS" dialogue.

If not, the GPS "swiss army knife" **gpsbabel**  may help to convert nearyly any relevant GIS data format into GPX. 
For details, read the manual you may find here: https://www.gpsbabel.org/htmldoc-1.4.4/gpsbabel-1.4.4.pdf

For example, take this little csv formatted text file, saved as "wpts-test5.csv":


```
#!
49.43226,11.09153 , Nürnberg Hermundurenstraße 17
49.73233,11.07244 , Forchheim Hugo-Post-Straße 84
49.42029,11.89065 , Kümmersbruck Grasiger Weg
49.15800,11.71157 , parsberg lindlbergstraße
49.43226,11.09153 , Nürnberg Hermundurenstraße 17
```

Call gpsbabel like this to convert this to a gpx with waypoints:
```
#!
gpsbabel -i csv -f wpts-test5.csv  -o gpx -F wpts-test5-wpt.gpx
```
Short explanation of the options:

* *-i csv* : input file format
* *-f wpts-test5.csv* : input file name
* *-o gpx* : output file format
* *-F wpts-test5-wpt.gpx* : output file name

Open the output file in QMapShack with "File -> Load GIS Data" yields 

![import-wpt-list.png](https://bitbucket.org/repo/L5qerE/images/995727279-import-wpt-list.png)

and

![import-wpt-map.jpg](https://bitbucket.org/repo/L5qerE/images/3896244447-import-wpt-map.jpg)

As you see, the coordinates and the descriptive labels of the waypoints are imported.

### Import Routes ###

To import the points as routepoints instead, call this:

```
#!
gpsbabel -i csv -f wpts-test5.csv -x  transform,rte=wpt -x nuketypes,waypoints -o gpx -F wpts-test5-rtpt.gpx
```
which differs from above command by the gpsbabel filter options

* *-x transform,rte=wpt* : transform the (way-)points found in input to routepoints
* *-x nuketypes,waypoints* : remove the waypoints from the output

This will display in QMapShack as

![import-rtpt-list.png](https://bitbucket.org/repo/L5qerE/images/2542930625-import-rtpt-list.png)

and in the map as path of flight:

![import-rtpt-map.jpg](https://bitbucket.org/repo/L5qerE/images/1051625912-import-rtpt-map.jpg)

Call "Calculate route" to get:

![import-rtpt-map-calc.jpg](https://bitbucket.org/repo/L5qerE/images/1950590911-import-rtpt-map-calc.jpg)

Notice that the routepoints now have kept their labels, as opposed to their anonymous behavior when QMapShack derives routepoints from waypoints.

As soon as you call "Edit Route", e.g. to move points, you get a warning 

![edit-warning.png](https://bitbucket.org/repo/L5qerE/images/2327772757-edit-warning.png)

If you continue, the edited route points now have lost their description.

**kiozen: Keep in mind that once these issues are fixed this statement will be obsolete and misleading. And it's very likely that no one will take care of fixing the text. Therefore it's ok to mention and reference the issue once. But avoid hidden references like that.**

This property is consistently transferred to the mobile GPS device.

???#### screenshots from device ?? 
not here, better in the issue case ########


### Send Route to Device ###

Save your project, plug your device and call "**send to device**" in the project context menu. Be aware that all objects in the project - waypoints, routes and tracks - are sent to the device. If this is not what you want, create a new project and copy only desired items into this. Send this project to the device, then.

See here
https://bitbucket.org/maproom/qmapshack/wiki/DocGisDevices
for more infos about exchanging data with mobile GPS devices.

### Gotchas and Tricks ###

Be aware that your device presumably uses different maps, routing preferences and routing engine than QMapShack / routino does. While the routepoints are fixed by coordinates, the calculated route between them may differ significantly.

One way to prevent this is to convert your route to a track and send this to your device. However, this is not flexible for rerouting if you deviate from your preplanned route for whatever reason and want to find back to it.

You also may add addional waypoints to your route, using the "edit route" functionality. This let's you "nail down" your route to the desired pathway. Be sure to select "nails" as close to your target pathway as possible. Otherwise, your device might navigate you to artificial stepaways just to collect an imaginary flag. Some devices, e.g. the Garmin zumo motorcycle navigators, have a "skip next route point" function for this reason.

You also may send waypoints as such to your device. However, many devices will add them to their list of favorites. So this may be clobbered with supplementary way points you are not permanently interested in.

The best solution would be to share the same map, routing engine and routing preference setting between workstation and mobile device. Any reports on such solutions are welcome ... where? on the mailing list????
- - -
Prev () | [Home](Home) | [Manual](DocMain) | () Next
