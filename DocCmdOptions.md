[Prev](DocGettingStarted) (Getting started) | [Home](Home) | [Manual](DocMain) | [Index](AxAdvIndex) | (Install Maps & DEM Data) [Next](DocInstallMapDem)
- - -
[TOC]
- - -

# List of options

| Switch | Parameter  | Comment                                        |
|:------:|:----------:|------------------------------------------------|
|*-d*    |            | enable debug output on the console (*stdout*, *nix only) |
|*-f*    |            | enable debug output and write it to the file *%temp%\org.qlandkarte.QMapShack.log* (Windows only). |
|*-c*    |*<filename>*| read/write the configuration from/to a configuration file.|

If you start the application without the *-c* option the configuration will be stored wherever your system stores application configurations otherwise it is stored in *<filename>* at the end of a QMapShack run.

Remark for Windows users:

There is no default configuration file. Instead, the default configuration is saved in the registry branch
"HKCU\Software\QLandkarte\QMapShack".

If the configuration file does not yet exist then QMapShack is started with its default layout (configuration) shown at the top of this page and the configuration is written to the file at the end of the QMapShack run.

The configuration file keeps information about

* the databases used,

* the routing information used,

* the map views with their structure,

* other user interface properties.

Configuration files are standard INI-files and can be edited (be careful!).

The *-c* option is pretty handy if you start QMapShack from a memory stick and want to take your
configuration with you.

It is handy too for the definition of a top level basic data structure. The user can define and use different configuration files and in doing so define separate data and map sets (e.g. referring to different countries).
As a consequence QMapShack starts much faster due to the fact that less map data must be loaded.

- - -
[Prev](DocGettingStarted) (Getting started) | [Home](Home) | [Manual](DocMain) | [Index](AxAdvIndex) | [Top](#) | (Install Maps & DEM Data) [Next](DocInstallMapDem)
