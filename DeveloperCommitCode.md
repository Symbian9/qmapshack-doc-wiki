[Home](Home) | [Manual](DocMain)

# Commit Code #

## Pull Request

BitBucket offers you to fork the QMapShack repository. By that you have your own repository and you can do whatever you want to do. There is also a function to keep your fork in sync with the main repository. Once you are done and you think the stuff should really go into the main repository, you can start a pull request. 

This request will be reviewed. Maybe it needs a few fixes. Anyway, if the code has been reviewed and obviously does not break anything, it will be merged into the main repository. 

## Send a Patch

For small changes it's sufficient to send me a patch. On the command line you can change into the QMapShack project root directory (the one with the README.md) and execute:


```
#!bash

hg diff > descriptive_name.patch
```
This will make a patch of your latest uncommitted changes. If you have done one or several commits locally you can use TortoiseHg to select these commits and export them (right mouse button on the selection).

