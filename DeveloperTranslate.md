[Prev](DeveloperCommitCode) (Commit Code) | [Home](Home) | [Manual](DocMain) | [Index](AxAdvIndex) | (Developing Documentation) [Next](DevelopingDocumentation)
- - -
[TOC]
- - -

# HOWTO enable/disable source translations extraction #
We now have the ability to choose when to update (extract) the
translations from the sources files within CMake. It's controlled by the `UPDATE_TRANSLATIONS` CMake command line option. It defaults to `OFF`. Translations are always compiled (.ts to .qm)

To update the translations just set the CMake command line option `UPDATE_TRANSLATIONS` to `ON`. E.g.:
```
#!cmake
cmake -DUPDATE_TRANSLATIONS=ON ..
make

```
The translations are extracted and also compiled. To return to the compilation only mode just set the `UPDATE_TRANSLATIONS` option to `OFF`. E.g.:

```
#!cmake
cmake -DUPDATE_TRANSLATIONS=OFF ..
```

**Warning**: For all other generators than Makefile: When `UPDATE_TRANSLATIONS` is enabled a clean command will also clean the generated .ts files. So, after extracting the translations sources it's advisable to set `UPDATE_TRANSLATIOS` to `OFF` right away.

# HOWTO translate qmapshack.desktop (UNIX like only) #
The qmapshack.desktop file contains the info that appears in the panel menus. It can also be translated. The process is different from the .ts files tough. Let's say we want to localize it to German (de):

* Create an `qmapashack_de.desktop` in the src/locale directory with the following contents:

```
#Translations
Name[de]=QMapShack
GenericName[de]=GPS Daten- und Kartenverwaltung
```
* The reference (English) strings are at `src/qmapshack.desktop.in`:
```
Name=QMapShack
GenericName=GPS device mapping utility
```
* To translate it to other language change the `de` in the filename and in the file itself to the language code you are translating for.

- - -
[Prev](DeveloperCommitCode) (Commit Code) | [Home](Home) | [Manual](DocMain) | [Index](AxAdvIndex) | [Top](#) | (Developing Documentation) [Next](DevelopingDocumentation)
