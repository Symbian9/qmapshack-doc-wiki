*(This page is a draft based on email discussion with Oliver Eichler. I may have misunderstood some details. Not every step reported here is thoroughly tested)*

Shit happens. This is one of murphy's law. Power may fail, disks may crash, OS may bluescreen (at least some of them), and even the grat routino router plugged into QMapShack was proven to be able to segfault on rare conditions.

So: save your worK! while it is common knowledge, It requires soem through understanding where and when and how stuff is stored.

Basically, you have three distinct realms of storable work:

## Your Map view ##

You don't edit maps in QMapShack, so the maps themselves are readonly - no matter whether you use online maps or locally stored maps. However your **map view** is the way yo configure how your currently visible maps are diplayed. Details are covered elsewhere in the manual:
https://bitbucket.org/maproom/qmapshack/wiki/DocControlMapDem

You can can switch between different map views, but those are not directly related to your own data which is stored in projects.


## Your Projects ##

The **project** is the place where your own personal data lives in. In terms of storage, procjets may be implemented as:

* qms files, the QMapShack internal format
* gpx files, the most common format for exchanging GIS Data
* in databases, which are also a  QMapShack internal format not supposed to be disassembled by the causal end user
* on the storage of your satnav device, 

https://bitbucket.org/maproom/qmapshack/wiki/DocHandleGpxFiles


https://bitbucket.org/maproom/qmapshack/wiki/DocGisDevices


https://bitbucket.org/maproom/qmapshack/wiki/DocGisDatabase


## Your Workspace ##




