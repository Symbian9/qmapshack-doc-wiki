
[TOC]

_This page is partially copied from DocMain.md. Links on this page don't work!_

# QMapShack Manual

![no image shown here](xyz.png "QMapShack Main window")

**Note**: As the software is subject to a constant development progress, this manual will
always reflect just a snapshot of the current state. Screenshots seen in this manual might 
not reflect the current appearance of the program. The manual will be updated if there are 
large changes to the GUI. However smaller changes will be ignored. 


# Proposal for re-organiation/restructuring of QMS manual/wiki  

At the bottom of this page there is an attempt of an implementation of proposals for Wiki re-organization 
submitted to the newsgroup.
    
## Summary of discussion in the newsgroup
    
### _Oliver:_

...

The documentation was written with a first time user in mind. That's why
the topics start with the "first start" experience and move on to
installing/handling maps. Next it explains the general idea behind
projects and the 4 elements a project can contain. I recommend to read
the wiki up to this point for everyone. The database is not a must. And
devices only of interest if you got one that is supported.

Most of these topics I wrote while developing the software and
occasionally updated it. Thus it's not always up-to-date. And it's more
a documentation about what is available. Less a documentation about work
flow.

Many of Wolfgang's FAQ articles compensate that lack of work flow
documentation. These parts would fit better right into the real
documentation. Maybe in a different font to mark them as work flow
documentation vs what's available documentation. I am not sure if we can
squeeze that out of the Markdown tags.

The FAQ probably should contain answers to questions that will not be
documented e.g. why there are not a trillion digits behind the colon.
There is no sense to explain that in the documentation. But it's quite
frequently asked and has to be answered.

But always keep in mind that the docs are for new users in the first
place. Thus keep it short, keep it simple. Place the important stuff in
the first paragraph rather than in between a lot of side information.
The strong reader will find the details while reading the complete
article. And for the weak one I am happy if he/she gets the basic idea
without reading everything.

One thing I personally dislike in the Wiki are the images. Images are
important but they are a pain in the ass to keep them up-to-date and to
organize them. Plus I think I made a real bad start with the naming
scheme. If you guys have a better idea go for it.

...

### _Rainer:_

...

But is the FAQ the right place for ANY kind of information?   I mean, we
could put everything into the FAQ: how to download QMapShack, how to in-
stall it, how to report a bug, how to write documentation.   But I don't
think that's what a FAQ is made for.  The four topics mentioned just ab-
ove clearly should go  into the regular documentation,  and in fact they
do, as far as the QMapShack documentation is concerned.

To explain more precisely what I'm up to let's take file "DocFaqHandling
.md" as an example:  the various tricks to find distances between points
probably belong in the FAQ (even though I think QMapShack should provide
an easy to use  tool to measure  the distance between  two points rather
than requiring creation, projection, and deletion of a waypoint) whereas
information about selecting a range within a track should -- in my opin-
ion -- be contained in file "DocGisItemsTrk2.md",  where most users most
probably would expect it anyway.

And keeping this information in one place would also save us from having
to more or less duplicate plenty of screen shots  (which sooner or later
have to be updated).
   
... 
   
### _Wolfgang:_

...

* The list of contents of the Wiki in DocMain is relatively short and should certainly be extended due 
to the fact that QMS has plenty of useful features not yet described (some are now in the FAQ). Otherwise 
the Wiki pages are getting too long. And above of this: The structure of the list of contents should reflect 
the philosophy of the software designer!
 
* What is the best structure for the QMS Wiki? Is the linear structure proposed in connection with your (i.e. Rainer)
toolset the best way to describe QMS or would a tree structure as normally used in Wikis to be preferred? 
I don't know how to answer this question. Both approaches have their pros and cons. Think what happens with the
 DocMain page when having there a much longer linear list of contents required by your tools!

...
 
## _Proposed changes:_
* _Structure of the manual:_
    * Add new header to existing first part of manual: __Basic QMapShack features__. This part gives very basic information
for working with QMS.
    * Define a new part of the manual __Working with QMapShack (detailed QMapShack information)__ as proposed by Oliver.
Collect here much of the information from FAQ and some rather detailed information from the basic part. This part could
have a structure similar to the one of the basic part. 
    * Keep reduced FAQ and rest of the manual
* _Navigation bars:_    
    * Extend navbar handling toolset to support a mixture of linear and tree structure in the manual as described in the next point.
The objective of this proposal is to keep the contents list in DocMain.md short. 
    * Proposed extension of the navigation bar handling tools: 
        * Process DocMain as before
        * Check each page/link mentioned in DocMain if there is a "content structure" similar to the one in DocMain. If yes
then run the toolset against the found page (toolset supports this already!). _Result:_ subordinate navigation bar structure.
        * Repeat recursively.
        * _Remark:_ New is only that the subpages must be treated recursively. If the implementation of such a recursive loop
is too complicated then the same result can be achieved with some additional manual work.
    * If the described procedure could be implemented then it would be possible to shorten also the basic part of the manual
simply by applying to it the same rules and procedures.        
    * _Example:_  
        * _Main level navigation bars (found from DocMain.md):_  `page1` <--> `page2` ...  _Up:_ `DocMain`
        * _Next level navigation bars (found from page1.md):_  `page1sub1` <--> `page1sub2` ... _Up:_ `page1`     
        * _Next level:_ ...
    

## _Necessary steps to be done:_ 
* Confirmation of proposals after due discussion 
* Extension of toolset (Rainer would be the one who could do this knowing the tools very well)
* Move suitable parts of FAQ into new manual part (Wolfgang could to this)
* Move suitable parts of basic info (those with very detailed and not basic info) into new manual part      
* Update manual handling rules (describe structure and extent/update DevelopingDocumentation.md) 
* _Remark on images:_ The danger of outdated images (and other stuff) is imminent. _Thus:_ lesser images, lesser outdated
images. _But:_ an image can tell more than 1000 words. _Conclusion:_ Use image only if it can replace 1000 words.

# Contents of the manual (_Proposal for list of Wiki contents in DocMain.md_)

_This section shows a possible structure of the manual in the future. The following items should not be shown in the 
[TOC] of the page (duplication!). Therefore a list structure and not a header structure is used!_
     
1. __Basic QMapShack features__ (_unchanged existing structure_)
    * Installing QMapShack

        * [Install QMapShack](DocGetQMapShack)
        * [Compile Instructions for Windows](BuildWindowsVisualStudio)
        * [Create Offline Documentation](OfflineDocumentation)
    * Using QMapShack

        * [Getting started](DocGettingStarted)
        * [Command line parameters](DocCmdOptions)
        * [Maps & Digital Elevation Model (DEM)](DocInstallMapDem)
            * [Install Maps & DEM Data](DocInstallMapDem)
            * [Basics about maps and DEM files](DocBasicsMapDem)
            * [Control maps and DEM files](DocControlMapDem)
            * [Maps: Tips and Tricks](DocMapsTipsTricks)
        * [Working with Projects](DocWorkingWithProjects)
            * [Handle GPX and QMS files](DocHandleGpxFiles)
            * [Search Google](DocSearchGoogle)
        * [Tracks, Waypoints & Co](DocGisItems)
            * [Create new tracks, waypoints etc.](DocGisItemsNew)
            * [Tracks](DocGisItemsTrk2)
            * [Routes](DocGisItemsRte)
            * [Waypoints](DocGisItemsWpt)
            * [Areas](DocGisItemsArea)
            * [Edit items with multiple points (tracks, routes, areas)](DocGisItemsEditMultiple)
        * [Database](DocGisDatabase)
            * [Workspace and Database](DocGisDatabaseWorkspaceDatabase)
            * [Add/Remove/Synchronize/Search a Database](DocGisDatabaseAddRemove)
            * [Folders and Items](DocGisDatabaseFoldersItems)
            * ['Lost & Found' Folder](DocGisDatabaseLostFound)
        * [GPS Devices](DocGisDevices)

1. __Working with QMapShack (detailed QMapShack information)__

    _Only the following links/topics/headers are on this page - links to subpages of the following topics are 
only on each of these pages.
The navigation bar lead from header page to header page. Navigation bars in subpages lead from one subpage 
to the next one. In principle already now the tools support these 
__subordinate navigation bars__ 
based on TOC (i.e. list of contents!) in the each of the header pages (using the header 
pages for creating Navbars instead of DocMain)_

    * [Installation, configuration, running](DocInstall)
    * [User interface](DocGui) 
    * [Data organization](DocDataOrganization)
    * [Data handling](DocHandling)
    * [Other topics](DocEtc)
1. __Getting Help__

    * [Frequently Asked Questions](DocFaqConfig)
        * _No further links here - links to subpages only in page FAQ (see remark in previous point)_
        * Only those topics not yet handled in "Working with ..." part remain here
    * [Troubleshooting QMapShack](TroubleShooting)
    * [Reporting a bug](ReportBugs)
    * [Requesting a feature](RequestFeatures)
    * [Dictionary of terms/Glossary/Terminology](DocGlossary)  (_why not having such a section?_)    
1. __Developing QMapShack__

    * [Coding Guideline](DeveloperCodingGuideline)
    * [Commit Code](DeveloperCommitCode)
    * [Add translations](DeveloperTranslate)
    * [Developing Documentation](DevelopingDocumentation)
    * [Playground - start your new Wiki page](DocPlayground)


__*Please comment!*__    