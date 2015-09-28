[Home](Home) | [Manual](DocMain)

# Commit Code #

For small changes it's sufficient to send me a patch. On the command line you can change into the QMapShack project root directory (the one with the README.md) and execute:


```
#!bash

hg diff > descriptive_name.patch
```
This will make a patch of your latest uncommitted changes. If you have done one or several commits locally you can use TortoiseHg to select these commits and export them (right mouse button on the selection).

A much more sophisticated approach is to fork the repository and to start a pull request. Have a look at BitBucket's [documentation](https://confluence.atlassian.com/bitbucket/work-with-pull-requests-223220593.html) for that.