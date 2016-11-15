#! /usr/bin/sh

########################################################################
########################################################################
##                                                                    ##
## Copyright (C) 2016 Rainer Woitok, <Rainer.Woitok@Gmail.Com>        ##
##                                                                    ##
## This shell script is free software: you can redistribute it and/or ##
## modify it  under the terms  of the  GNU General  Public License as ##
## published by the Free Software Foundation, either version 3 of the ##
## License, or (at your option) any later version.                    ##
##                                                                    ##
## This program is  distributed in the hope that  it will be  useful, ##
## but  WITHOUT ANY WARRANTY;  without  even the implied warranty  of ##
## MERCHANTABILITY or FITNESS FOR A  PARTICULAR PURPOSE.  See the GNU ##
## General Public License for more details.                           ##
##                                                                    ##
## You should have received a copy  of the GNU General Public License ##
## along with this program.  If not, see                              ##
##                                                                    ##
##        <http://www.gnu.org/licenses/>                              ##
##                                                                    ##
########################################################################
########################################################################
#
# This script performs  the same actions  as running "make doc" or "make
# nav" would do, but only for exactly those files specified on the comm-
# and line.
#
# ./Make.sh [-d|-n] file ...
#
# If the  "-d" switch or if  no switch is specified,  the Markdown files
# will be converted to their corresponding "*.html" files  as with "make
# doc", and if the "-n" switch is specified,  the Markdown files will be
# processed as with "make nav".
#
#                                                    R Woitok 2016-07-31
#
########################################################################

if   [ "${1-}" = -n ]                    # Sanitize the files specified.
then op=n
     shift
elif [ "${1-}" = -d ]      # Create "*.html" files from files specified.
then shift
fi

files=$(ls "${@-}")                # Determine list of files to process.

if [ -n "${op-}" ]                           # Sanitize specified files.
then for f in $files
     do echo  ./DocFix.sh $f
              ./DocFix.sh $f
        echo  ./NavBar.sh DocMain.md $f
              ./NavBar.sh DocMain.md $f
     done
else for f in $files                  # Convert specified files to HTML.
     do echo "./HtmlMake.py $f >" ${f%.md}.html
              ./HtmlMake.py $f >  ${f%.md}.html
     done
fi                                           # End else [ -n "${op-}" ].

