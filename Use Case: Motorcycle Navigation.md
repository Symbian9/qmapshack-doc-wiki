# This is just a stub / test dummy and not yet ready for public linkage. #

# Peculiarities of Motorcycle navigation #

As it appears, motorcycle navigation has something special, so that all those major manufacturers of satnav navigation devices even offer special prouduct series. Beyond ruggedized design and glove optimized handling, mathere are special features like navigating along tracks, preference for curvy roads or skipping of intermediary route points.

**They way is the goal**. This implies special requirements for trip planning, which obviously not be present in this combination in other GIS related situations:

* extensive share of trip data with third parties (friends, other planning tools, web hosted trips)
* maps with indication of "scenicness"
* repeated replanning of trips already engaged
* fast replanning while driving on the satnav device
* refinding your tour (not some arbitrary waypoint) after deviation
* ....


The common trick to force your satnav device to stick to your preplanned route instead of guiding you away from the scenic river valley to the close by highway is to add a number of arbitrary **dummy waypoints**: Adresses you do not really want to vist, but keep your satnav to stick to your preferences, not the one the programmer implemented. Let's call this trick **nail down** your route.

For sake of example, let me report some encounters of my last tour I pre-planned with QMapShack and engaged with the route downloaded to a Garmin zumo 390LM (one of those dedicated motorcycle satnav gadgets).


Some supplemental waypoints I added to "nail down" a route to my desires where some dozen meters beneath the road. If you realize it during driving, you have to pass it by and then manually call "skip route point" to avoid your satnav insisting on "turn back". Not nice during driving curvy roads. 

If you do not realize it, you enter some residential area or some higway junction just be told that you can turn now: Have been there, have done that. So, carefully adjusting your "trip nails" is tantamount.

* One road that was both included by QMapShack backend routino and by Garmins nüvi I found decorated by the infamous "closed for cars and motorcycles". Pretending to be nice guy, I passed by and fund myself on a Highway that led me to miss one of the most interesting pieces of the journey I planned. Presumably there hat been an alternative to my sceny track, but you won't find that in heavy traffic when you are just entering a higwhay, unprotected between 40-ton-trucks. Nice reason to ride there again :-) . After the trip is before the trip. 

* On another junction, my eyes found a sideway that promised an even more sceny trip than the one that I had planned before. Great - just turne and enjoy the nüvis functionality to reroute me back to my preplanned tour on other curvy roads. This nice deviation is registered in my track log and avialable for future planning.

## Working with QMapShack ##
### Configuring maps, DEM and routino ###
### Planning routes ###
### Importing tracks ###
### Exchanging data with the Garmin nüvi ###
## Some additional helper scripts ##