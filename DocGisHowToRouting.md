# Planning a Route #
# Quick start Routing #

Activate a proper map. OpenStreetMap as installed by "I want maps" will do perfectly.

Activate **Menue -> Project -> Add empty project**  

![projmenu.png](https://bitbucket.org/repo/L5qerE/images/1188753088-projmenu.png)

and give it a proper name. Leave qms project type unless you know why not.

![proj_new.png](https://bitbucket.org/repo/L5qerE/images/2189981266-proj_new.png)

Activate **Menue -> Project -> Search Google** if not yet open.

Type some search term for your adress into the Google Project Field. You may activate the left triangle to see your results. If you get "Error:", try to change or refine your search term. Usually, a road and a town should give reasonable results. Right click on your result, activate "copy to" and select your project name given in the first step. If your search yields multiple results, only add the one desired.

This way, you collect **waypoints** in your project.
Repeat the steps for all waypoints your route is desired to pass.

Use **shift-<click>** or **ctrl-<click>** to solect some or all of your waypoints in the project. Be sure to select at least two waypoints and no other objects.
In the context menue (right mouse button), select "Create Route". 

![rte_create.png](https://bitbucket.org/repo/L5qerE/images/541772100-rte_create.png)

You can now adjust the sequence in which the route should pass your waypoints.

![rte_cr_rearrange.png](https://bitbucket.org/repo/L5qerE/images/3043379165-rte_cr_rearrange.png)

Continue with OK, enter a route name in the next window and select your project in the following window.

QMapShack automagically will calculate the route according to your current routing prefrences, which more or less may take some time.

Double click your route to zoom your map view to the whole route.

![ge_must_see.jpg](https://bitbucket.org/repo/L5qerE/images/2544969820-ge_must_see.jpg)

Click on the route between the waypoints to display route properties

![rte_properties.png](https://bitbucket.org/repo/L5qerE/images/866504795-rte_properties.png)

Save your project if you want to use the results later.

# Manipulating a Route #

### route context menue ###

![rte_context.png](https://bitbucket.org/repo/L5qerE/images/3754465212-rte_context.png)

"Edit...", "Copy to... " and "Delete" are generic object functions and do what they say.

"Route Instructions": highlight route and see routing instructions.

"Reset Route" removes the calculated pathway and returns to waypoints linked by straigt lines of flight.

"Calculate" restores the calculated pathway or recalculates it according to your (maybe changed) routing preferences.

See here
https://bitbucket.org/maproom/qmapshack/wiki/DocGisItemsRte
how to configure your routing engine. It is strongly encouraged to use offline routine routing, if you want to use serious route planning - both for performance reasons and to limit load on MapQuest online routing.


"Convert to Track" creates a track with a large number of points ("breadcrumb track") which remains independet of the routing engine, the router map and the routing properties. If your GPS device supports routing by track, this will deliver exactly what you have planned. This includes the disadvantage that you cannot easily replan your route on the GPS device.

"Edit route" .....
This allows you to add/delete/move maypoints to your route. See here
https://bitbucket.org/maproom/qmapshack/wiki/DocGisItemsEditMultiple
for a detailled description of the dialogue.

You may notice that the routepoints have lost their relation to the waypoints from which they were initially created. Moving a routepoint does not change the waypoint it was derived from.

### issue: named route points ###

The routepoints do not inherit their name or description from the waypoints they were generated from.
There is a bug report/feature request on this in the issue list:
https://bitbucket.org/maproom/qmapshack/issues/127/create-a-route-from-waypoints-does-not-add

### Manually create, edit and move a waypoint ###

If you are not always happy with the results of the "Google Search" function, You may manually fine tune your waypoints before deriving a route from them - see here for instructions:
https://bitbucket.org/maproom/qmapshack/wiki/DocGisItemsNew#markdown-header-waypoint

### import waypoints ###


### import routes ###


### send route to device ###

Save your project, plug your device and call "send to device" in the project context menue. Be aware that all objects in the project - waypoints, routes and tracks - are sent to the device. If this is not what you want, create a new project and copy only desired items into this. Send this project to the device, then.

See here
https://bitbucket.org/maproom/qmapshack/wiki/DocGisDevices
for more infos about exchanging data with mobile GPS devices.