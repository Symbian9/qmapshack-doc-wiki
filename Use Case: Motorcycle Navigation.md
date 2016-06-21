# This is just a stub / test dummy and not yet ready for public linkage. #

# Peculiarities of Motorcycle Navigation #

As it appears, motorcycle navigation demands some special requirements, so that all those major manufacturers of satnav navigation devices even offer special prouduct series. Beyond ruggedized design and glove optimized handling, there are special features like navigating along tracks, preference for curvy roads or skipping of intermediary route points.

**They way is the goal**. This implies some special approach for trip planning, which obviously is not present in this combination in other GIS related situations:

* extensive share of trip data with third parties (friends, other planning tools, web hosted trips)
* maps with indication of "scenicness"
* repeated replanning of trips already engaged
* fast replanning while driving on the satnav device
* refinding your tour (not some arbitrary waypoint) after deviation
* ....


The common trick to force your satnav device to stick to your preplanned route instead of guiding you away from the scenic river valley to the close by highway is to add a number of arbitrary **dummy waypoints**: Adresses you do not really want to vist, but keep your satnav to stick to your preferences, not the one the programmer implemented. Let's call this trick to **nail down** your route.

For sake of example, let me report some encounters of my last tour I pre-planned with QMapShack and engaged with the route downloaded to a Garmin zumo 390LM (one of those dedicated motorcycle satnav gadgets).


Some supplemental waypoints I added to "nail down" a route to my desires where some dozen meters beneath the road. If you realize it during driving, you have to pass it by and then manually call "skip route point" (a feature I desperately missed on my car satnav I used before) to avoid your satnav insisting to "turn back". Not nice during driving curvy roads, but still better than a complete loss of navigation assistance.

![wiki-fl.jpg](https://bitbucket.org/repo/L5qerE/images/2580338973-wiki-fl.jpg)

If you do not realize that you just hunt a dummy nail, you may enter some residential area, city center or some highway junction just to be told that you can turn now: *have come far but what am I doing here?* :-((( . So, carefully adjusting your "trip nails" close to your route is tantamount. 

![wiki-kc.jpg](https://bitbucket.org/repo/L5qerE/images/1500573576-wiki-kc.jpg)
![wiki-bf.jpg](https://bitbucket.org/repo/L5qerE/images/3741804599-wiki-bf.jpg)

One road that was both included by QMapShack backend routino and by Garmins zumo I found decorated by the infamous "closed for cars and motorcycles". (Yes, I know, OSM is a community endeavour, too. Put on my todo list).

![wiki-ol.jpg](https://bitbucket.org/repo/L5qerE/images/3337226930-wiki-ol.jpg)

Pretending to be the nice guy, I passed by and found myself on a highway that led me to miss one of the most interesting pieces of river valley in the journey I'd planned. Presumably there had been an alternative to my sceny track back (yellow road between the blue plan and the magenta track), but you won't find that in heavy traffic when you are just entering a higwhay, nearly naked between 40-ton-trucks. Never mind: nice reason to ride there again :-) . After the trip is before the trip. 

![wiki-or.jpg](https://bitbucket.org/repo/L5qerE/images/2715376200-wiki-or.jpg)

At some other junction, my eyes found a sideway that promised an even more scenic trip into the mountains than the river valley that I had planned with my eyes on the map only. Great - just turn and enjoy the nüvis functionality to reroute me back to my preplanned tour on other curvy roads. This nice deviation is registered in my track log and avialable for future planning.

![wiki-lk.jpg](https://bitbucket.org/repo/L5qerE/images/1078212255-wiki-lk.jpg)

When you use differend maps and/or different routing engines and/or different routing prefernces, your plan in the workstation might nevertheless show differences from the one your satnav displays on the trip:

![wiki-sk.jpg](https://bitbucket.org/repo/L5qerE/images/3193648309-wiki-sk.jpg)
![wiki-eg.jpg](https://bitbucket.org/repo/L5qerE/images/2078719396-wiki-eg.jpg)

This is where you learn to appreciate the "prefer curvy roads" option of the zümo. At least, as long as the curves are not loacted in the middle of some industrial area.

#Why QMapShack?#

##Glimpse on the GIS software Field##
This is not a thourough overview if GIS software for linux, just my own personal experience.
Being a farmer by profession, I have used **qgis** since about 5 years now to assist the ever growing documentation needs of work in the field. I have a samll matchbox sized **BT747 GPS logger** I can carry with me on the tractor. At home, I can import the tracks into qgis and reconstruct the partitioning of my fields for different crops. While I'd consider qgis much more elaborate and mature than QMApShack, it is in many cases much more tedious, overcrowded, and slow - not to say *bloated*. However, when it comes to the handling of 2-D geospatial objects aka areas, QMapShack appears to me still far behind qgis.

Maintaining a collection of trip records may become a source of chaos over time.
A Tool for a quick preview of shape and location of track might be of great assistance for sorting.
On my old SuSE 11 workstation, I misused **josm** - the OSM map edit tool - for this purpose. While it is quite slow due to its java architecture and a lot features of which I do not even know the purpose, it was still faster as the qgis track conversion procedure. I used it for opening tracks on a OSM or Satellite image bakground - just to get an idea what is in the track when organizing them.

Some day I stuck my BT747 into the pocket to carry it along what should become a nice motorcycle trip. Reading the trip into josm and dreaming of what I might change the next time I'd ride into those areas became the beginning of what is documented right here.

On my new debian, I found **marble** as a much better tool for fast preview of tracks (and other GPS data files). It is even preregistered as standard application for gpx files and fires up within seconds, when I click on it in my file manager. Ah, marble is part of KDE, I see. While in some instances targeting similiar use cases as QMapShack, I did not dig deeper into it. Well - I had preplanned a tour using the address search capability I was (then) still missing in QMapShack. I had to find out that marble can only export some nasty kml file format, which even gpsbabel was not able to properly transform into gpx. However, one nice feature might come handy again: It looks like marble can integrate a live GPS receiver device and thus keep a map view centered at the current position. More on this on "further plans". 

Garmin, one of the major satnav device manufacturers, offers a product called **BaseCamp**. As the name suggests, it is targeted precisely to planing and replanning trips which are then guided by one of its devices "out there in the wild". Consequently, what is called a "project" in QMapShack, is labeled an "adventure" in BaseCamp. Of course, it offers a good integration with its own satnav gadgets. The main disadvantage for me: it only runs on WIN$. Becoming fed up with the latter in the times of WIN2k, I use Linux as main OS for more than a decade now.

Googling for "BaseCamp wine", I found many reports of failure - and a pointer to **QLandkarteGT**, and from the last ones web page a Pointer to its successor QMapShack. So I started to explore QMapShack considering it as the open surce / linux alternative to Garmins BaseCamp. Haven't even tried "wine BaseCamp" yet.

Last but not least, there is one tool you should know whenever you face tasks of integrating GPS data from different sources and formats: **gpsbabel** . I call it the "GPS swiss army knive". It is "just" a command line tool, hence a very versatile and powerful one, if it comes to manipulate GPS/GIS data and convert them between different file formats. Maybe there is some GUI wrapper for gpsbabel out there, but to my experience, such things just add a layer of obfuscation.




##FEatures of QMapShack I learned to appreciate##
* Really fast performance when zooiming in and out
even with multiple maps
* DEM, Topo mapsm bicycle maps, Sat images for estimation the "scenicity" of a tour
* Offline OSM and offline DEM
* Offline router routino
* possibilty to build all on a single data source OSM
(well, there may be some time lags if we used prefabricated sources as recommended in Manual

* Routing
* GPX import and export (havent yet tested ohter formats)
* Handle many GPX projects simultaneously
* workable GArmin device integration (no access to test other brands)

## downsides##
To me, QMapShack appears to be a project of rapid devlopment. Why this is good news if it comes to features and quality we can expect, we see that documentation does not catch up. For example, recently I asked in QMS issue list for some functionality that might resemble some basic route plannig features, as (still to be) described below. Surprise: route planning support is available and works fine, but simply is not yet documented. I agree, another candidate for my ToDo list.

Of course, repidly growing projects also display some higher risk of regression bugs. I encountered a segfault issue in the routino part - a really great and performant routing engine - which is integrated in QMS. I only received defending comments from the programmers when reporting this issue. In mature projects, you always find some people doing the boring job of quality assurance. In QMS, all good people still seem to fight at the frontier of innovation. However, QMS at least took the hurdel of debian listing, so we can at least expect workable stability.

Look, feel and features may severly change in future relases. I would not dare to rely on QMapShack in "mission critical" professional applications, as long as you do not feel confident to be able to grab into the nuts and bolts of the source code on your own responsibility.

However

.... route point labels missing ????....
well this happened on the nüvi with BaseCamp as well 
maybe the problem is located between chair and keyboard?


#Geopatial data#



##Geospatial entities: Tracks, Routes, Waypoints##

##Some Words on data formats##

### sources of track data ###

breadcrumb

I have a bunch of GPS mice laying around from a 
NMEA ... collection with a raspi ... gpsbabel -> gpx 
Logger
Mobile apps (most mobiles have built in GPS -
reportedly bad accuracy - no systematic tests yet

Import from other route planners, 
Trips from Friends





# Working with QMapShack #
## Installation ##
### Configuring maps, DEM and routino ###
### Configuring maps, DEM and routino ###
### Configuring maps, DEM and routino ###



### Planning routes ###
### Importing tracks ###
### Exchanging data with the Garmin nüvi ###
## Some additional helper scripts ##
##gpsbabel##

#Further plans#

##Inverse routing##



rationale .... 
status quo
link to code snippet 




## Geotagged Videos ##
I donsider it a great idea to record a video during driving along with the track coordinates.
Many car dashboard cams do this, but I did not yet find a ruggedized one for motorcycle mounting.
Recently, I got a ruggedized "action cam" with GPS receiver included. 
Sadly, first test where disappointing: huge files, small memory, small battery, 30 min recording max.
Not suited for a trip.

Calls for some DIY, e.g. on a raspberry. There I could record cam and GPS from independent sources and perform image / video extraction matching to my needs, not to some GoPro-cloning marketing geek.
My Idea were to record low quality video at say 30 fps, and additionaly extract high quality images at say 1 fps or so.

Unfortunately, most players for geotagged video playing is for WIN$ only.
I could not get one to work on my old SuSE 11.0 those days. I got a WIN Laptop now, and a recent debian jessie on the workstation. Time to try again.

And it would be great to display a combined view of track on map, video, images and track profile synchronized in the web, I haven't found any player yet. Pointers were welcome.

Nice-Stuff-ToDo list growing still longer....