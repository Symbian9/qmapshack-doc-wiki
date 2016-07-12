Prev () | [Home](Home) | [Manual](DocMain) | () Next
- - -

[TOC]

# Troubleshooting

Since the 13-Oct-2015 development version, you can start qmapshack 
with the commandline option "-f".
Then a logfile "org.qlandkarte.QMapShack.log" will be created in 
the system's temporary folder.
On a Windows 7 installation this temporary folder seems to be 
C:\Users\your user name\AppData\Local\Temp. 
That log file may give additional insight to the root cause.

# Create a backtrace of a crash on Linux

If QMapShack crashes on Linux the best you can do to help development is to send a backtrace. A backtrace is a log of the last code lines executed before the crash. Usually this contains enough hints to fix the problem fast.

To create a backtrace you have to compile QMapShack as debug version yourself. Have a look at [the getting started chapter of the wiki](DocGetQMapShack) for basic instructions. 

When you do the step:


```
#!bash
ccmake ../QMapShack


```

Change the variable CMAKE_BUILD_TYPE to *Debug*. Now start the build process with 

```
#!bash
make


```

No need to do a "make install". To create a backtrace you have to start QMapShack with the GDB debugger:

```
#!bash
gdb bin/qmapshack


```
At gdb's command line prompt enter 'r' to run QMapShack. Now you can provoke the crash. After the crash enter 'bt' on gdb's command line. This will output the backtrace. Copy the lines and attach them to your bug report.





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
- - -
Prev () | [Home](Home) | [Manual](DocMain) | () Next
