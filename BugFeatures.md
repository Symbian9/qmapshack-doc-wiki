[TOC]

# Bugs & Features

There is an issue tracker, that can be used for that kind of stuff. It's open to anonymous access. However if you register to BitBucket you will be informed when ever there is a change of your topic. Sometimes I will ask for more information. If you miss these questions and there is **no feedback in a reasonable time**, I will **delete the request** without further attention.

**Do not assign an issue to anyone!** The issue will be assigned when someone volunteers to solve it. 

## Bugs

If you have found a bug file a bug report on the [Issues](https://bitbucket.org/maproom/qmapshack/issues?status=new&status=open) page. 

1. **Consider fixing it yourself.** For example bad spelling, confusing names or explanations and bad translations can be fixed by everyone. Use Qt5 Linguist to edit the translations. Linguist will tell you the source file containing the string, too. By that you can change the original string in the source code. 

Please make sure to provide:

2. Information about the **operating system and the software's version**. You find this in the menu "?" -> About
3. Give a **detailed report** about what is broken
4. Give instructions about **how to reproduce** the problem
5. If **additional data** is needed give **real links** to that data. A mellow description where to find it is not sufficient.

All bugs will get some attention. Due to vacations this might take up to 2 weeks. If there is no answer after that period make yourself heard via email.

## Features

Your **best chance** to get a new feature is to** implement it on your own**. If you want someone else to do the work for you open an [Issue](https://bitbucket.org/maproom/qmapshack/issues?status=new&status=open). Do not assign it to anyone. If someone volunteers to implement it the issue will be assigned. To increase your chances consider the following:

1. Give a detailed description of what you want and why you think it's of a general interest. Just because software XYZ does it, is a bad reason. 
2. Sketch in detail how you think the feature should be integrated into the GUI or the workflow. 
3. If your request requires eye candy like icons, make a suggestion how the icons should look like or provide the icons as SVG. If you want certain colors, name them and give a reason for your choice. 

It's ok if you do not know how to code C++. But always keep in mind you ask someone to spend his/her time for you. Thus try to prepare  as much as possible the stuff that does not need programming skills. And if someone implemented a feature for you it would be more than fair of you to test it faithfully and to add a nice documentation about it in the Wiki. 

# Troubleshooting

Since the 13-Oct-2015 developerment version, you can start qmapshack 
with the commandline option "-f".
Then a logfile "org.qlandkarte.QMapShack.log" will be created in 
the system's temporary folder.
On a Windows 7 installation this temporary folder seems to be 
C:\Users\your user name\AppData\Local\Temp. 
That log file may give additional insight to the root cause.

# Limitations of QMapShack for Windows (short: QMS)

To limit the build and maintenance effort, the Windows binary packages 
for QMS come with a restricted set of 3rd party libraries.
In particular the timely maintenance of security related libraries would 
either put an unmanageable burden on your QMS Windows maintainer or add 
an uncalculable risk to the users (imagine what could happen if I package 
a SSL library where severe bugs such as Heartbleed are not yet fixed).
Due to this limitation certain kinds of maps - in particular online maps - 
will not work.

Below those restrictions are summarized and  possible workarounds are 
described. Please be aware that those workarounds are on the sole risk 
of the users - I cannot take responsibility in which situations they work 
or not.

## Qt comes without SSL support

Qt5 binaries are delivered without SSL support due to legal restrictions in 
some countries. See [qt-5-ssl](http://doc.qt.io/qt-5/ssl.html).
This may hinder some kinds of web maps (TMS, WMTS) to be downloaded properly.
As a workaround you could download the and compatible Windows SSL package
and copy the 2 DLLs libeay32.dll and ssleay32.dll to QMS home directory.
The DLLs from the following 2 sources have been reported to work: 
[indy](https://indy.fulgan.com/SSL/openssl-1.0.2d-x64_86-win64.zip) or
[gisinternals](http://download.gisinternals.com/sdk/downloads/release-1800-x64-gdal-1-11-1-mapserver-6-4-1.zip).
Please judge by yourself whether those sources are trustable for you and 
whether they fit to your actual installation.

## GDAL comes without curl support

The default GDAL libraries come without curl support. 
This may hinder some kinds of web maps to be downloaded properly.
As a workaround you could download GDAL binaries from 
[gisinternals](http://download.gisinternals.com/sdk/downloads/release-1800-x64-gdal-1-11-1-mapserver-6-4-1.zip)
and then brute-force-copy the complete "bin" subdirectory including 
subdirectories to the QMS home directory.

## GDAL comes without support for exotic formats

Some raster map formats (e.g. wavelet based) are not supported by the default
GDAL installation. The reasons may be various (licences, dependencies, ...).
A possible workaround is the same as to add curl support: use the GDAL binaries 
from [gisinternals](http://gisinternals.com/).

