# This is just a stub / test dummy and not yet ready for public linkage. #

# Peculiarities of Motorcycle navigation #

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


Some supplemental waypoints I added to "nail down" a route to my desires where some dozen meters beneath the road. If you realize it during driving, you have to pass it by and then manually call "skip route point" (a feature I desperately missed on my car satnav I used before) to avoid your satnav insisting to "turn back". Not nice during when driving curvy roads, but better than a complete loss of navigation assistance.

![wiki-fl.jpg](https://bitbucket.org/repo/L5qerE/images/2580338973-wiki-fl.jpg)

If you do not realize it, you enter some residential area or some higway junction just be told that you can turn now: *Have been there, have done that* :-((( . So, carefully adjusting your "trip nails" close to your route is tantamount. 

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

## Working with QMapShack ##
### Configuring maps, DEM and routino ###
### Planning routes ###
### Importing tracks ###
### Exchanging data with the Garmin nüvi ###
## Some additional helper scripts ##