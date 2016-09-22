[Prev](DocGisDevices) (GPS Devices) | [Home](Home) | [Manual](DocMain) | (Databases and projects) [Next](DocFaqData)
- - -
[TOC]
- - -

# Frequently Asked Questions - Configuring and running QMapShack

## Can I run several QMS instances at the same time?

As a general rule don't do this. QMS saves workspace information in the file `workspace.db`. There is only one such
file for all QMS instances. If this file is used by several QMS instances at the same time then the 
QMS workspace data behaviour is unpredictable.

## User-relevant QMapShack directories (Windows version)

* Directories relative to location of `qmapshack.exe`:
    * `.\translations`: language files
    * `.\routino-xml`: routino configuration files including `profiles.xml`
* Other directories:
    * `c:\Users\yor_user_name\AppData\Local\Temp\org.qlandkarte.QMapShack.log`: logfile written if command line option
      `-f` is used
    * `c:\Users\your_user_name\.QMapShack`: tile caches for online maps (default, can be changed by the user)
    * `c:\Users\your_user_name\.config\QLandkarte\workspace.db`: backup of last used workspace - used for rebuilding the last workspace when QMapShack is restarted
    
- - -
[Prev](DocGisDevices) (GPS Devices) | [Home](Home) | [Manual](DocMain) | [Top](#) | (Databases and projects) [Next](DocFaqData)
