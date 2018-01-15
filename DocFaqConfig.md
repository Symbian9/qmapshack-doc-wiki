[Prev](DocFaq) (Frequently Asked Questions) | [Home](Home) | [Manual](DocMain) | [Index](AxAdvIndex) | (Databases and projects) [Next](DocFaqData)
- - -
[TOC]
- - -

# Frequently Asked Questions - Configuring and running QMapShack

## Can I run several QMS instances at the same time?


_Valid from patch version aa576e2 (22.02.2017)._ 

No. QMS saves workspace information in the file `workspace.db`. There is only one such
file. If this file would be used by several QMS instances at the same time, then the 
QMS workspace data behavior would be unpredictable.

If an attempt is made to start a second QMS instance, then the file parameters of this call are transferred to the first QMS instance
and the files are loaded there silently.


## User-relevant QMapShack directories (Windows version)

* Directories relative to location of `qmapshack.exe`:
    * `.\translations`: language files
    * `.\routino-xml`: routino configuration files including `profiles.xml`
* Other directories:
    * `c:\Users\your_user_name\AppData\Local\Temp\org.qlandkarte.QMapShack.log`: logfile written if command line option
      `-f` is used
    * `c:\Users\your_user_name\.QMapShack`: tile caches for online maps (default, can be changed by the user)
    * `c:\Users\your_user_name\.config\QLandkarte\workspace.db`: backup of last used workspace - used for rebuilding the last workspace when QMapShack is restarted

## How to change the GUI language?

The language used in the QMapShack user interface (GUI) is defined using the following rules:

* If the language of the operating system is a language supported by QMS, then this language is used as the default GUI language.
* Languages available in QMS are:
    * English 
    * German (de)
    * French (fr)
    * Czech  (cs)
    * Russian (ru)
    * Spanish (es)
    * Dutch (nl)
* If the language of the operating system is not supported by QMS, then English is used as the QMS GUI language.
* The user can change the GUI language with the help of these steps:
    * Find the abbreviation of the operating system language (the so-called locale, e.g. `hu` for Hungarian).
    * Find in the QMS installation directory or its subdirectories the language files `qmapshack_*.qm` 
      (Windows: go to subdirectory `translations`).
    * Select one of the supported languages (e.g. `de` for German).
    * Copy the file `qmapshack_de.qm` to `qmapshack_hu.qm`.
    * After the next start of QMS the GUI language will be the selected language (German in the example).
    * _Remarks:_ 
       * The (default) English language file is `qmapshack.qm`, not `qmapshack_en.qm`! 
       * Both the locale (en, de, fr, ...) and the language file used with its full path can be 
         found in the [QMS logfile (debug output)](DocCmdOptions "Use of QMS logfile"). Check for lines of the form
    
             2017-01-31 13:24:30.594 [debug] locale "de"    
             2017-01-31 13:24:30.594 [debug] "using file 'c:...\\translations/qmapshack_de.qm' for translations."
     
         If the language of the operating system is not supported by QMS than these lines have the form
     
             2017-01-31 13:26:00.785 [debug] locale "de"
             2017-01-31 13:26:00.785 [warning] "no file found for translations 'c:...\\translations/qmapshack_de' (using default)."


- - -
[Prev](DocFaq) (Frequently Asked Questions) | [Home](Home) | [Manual](DocMain) | [Index](AxAdvIndex) | [Top](#) | (Databases and projects) [Next](DocFaqData)
