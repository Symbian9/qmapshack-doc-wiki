#! /usr/bin/sh

########################################################################
########################################################################
##                                                                    ##
## Copyright (C) 2016 - 2018 Rainer Woitok, <Rainer.Woitok@Gmail.Com> ##
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
# ./Make.sh [-d|-n|-dn|-nd] file ...
#
# If the  "-d" switch or if  no switch is specified,  the Markdown files
# will be converted to their corresponding "*.html" files  as with "make
# doc", and if the "-n" switch is specified,  the Markdown files will be
# processed as with "make nav".  Specifying both switches first process-
# es the  Markdown files  as with  "make nav"  before converting them to
# their corresponding "*.html" files as with "make doc".
#
#                                                    R Woitok 2016-07-31
#
########################################################################

case "${1-0}" in
  -d|-n) eval ${1#-}=1                 # Perform single action selected.
         shift
         ;;
-dn|-nd) d=1 ; n=1                               # Perform both actions.
         shift
         ;;
     -*) echo "Invalid switch '$1'." >&2
         exit 4
         ;;
      *) d=1                                   # Perform default action.
         ;;
esac

files=$(ls "${@-}")            # Determine the list of files to process.

if [ -n "${n-}" ]       # Update navigation bars in the files specified.
then for f in $files
     do echo ./NavBar.sh DocMain.md $f
             ./NavBar.sh DocMain.md $f
     done
fi                                              # End if [ -n "${n-}" ].

if [ -n "${d-}" ]                 # Convert the files specified to HTML.
then for f in $files
     do echo ./HtmlMake.py $f ">" ${f%.md}.html
             ./HtmlMake.py $f  >  ${f%.md}.html
     done
fi                                              # End if [ -n "${d-}" ].

