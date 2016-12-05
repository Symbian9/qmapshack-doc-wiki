#! /usr/bin/sh

########################################################################
########################################################################
##                                                                    ##
## Copyright (C) 2016 Rainer Woitok, Rainer.Woitok@Gmail.Com          ##
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
# Make the "*.md" Markdown source file specified as argument locally us-
# able.
#
#                                                    R Woitok 2016-03-04
#
########################################################################

gawk '{ sub("$","") } # Convert Windows style line ends to Unix style.

      #
      # If the current input file is not "Home.md" and if its first line
      # does neither start with the "Home" link  nor with the new navig-
      # ation bar,  insert the "Home" link  at the top of the file (this
      # is enough for the line to be recognized later by script "NavBar.
      # sh" and to be correctly updated to its final state):

      ++i == 1 && FILENAME != "Home.md" && \
      ! /^([[](Home|Prev)[]]|Prev [(][)])/ {
          printf "[Home](Home)\n\n"
                                           }

      { #
        # Replace URLs pointing into  the documentation wiki on the Bit-
        # bucket server  with URLs  pointing to the  corresponding local
        # files:

        gsub("[]][(]https://bitbucket.org/maproom/qmapshack/wiki/","](")

        #
        # Remove ".md" and ".html" extensions from Markdown file links:

        while ( match($0,"^(.*[]][(][^(]]*)[.](md|html)([#)].*)$",m) ) {
           $0 = m[1] m[3]                  # Remove file name extension.
                                                                       }

        #
        # Where necessary but missing insert the "markdown-header-" pre-
        # fix into URLs referring to the documentation wiki repository:

        while ( match($0,"^(.*)[]][(]([^#)]*)#([^)]+[)].*)$",m)) {

           #
           # If this is an external URL,  a URL referring to a footnote,
           # or if the URL already contains  the "markdown-header-" pre-
           # fix,  leave it as is,  otherwise insert  the missing "mark-
           # down-header-" prefix.  And in any case insert an additional
           # equal sign  in the middle of the  "]("  sequence which pre-
           # vents a URL from being processed repeatedly  and which will
           # be removed again  immediately  after the  "while"  loop has
           # finished:

           if ( m[2] ~ "^http" || m[3] ~ "^(fn(ref)?:|markdown-header-)" ) \
                $0 = m[1] "]=(" m[2] "#" m[3]         # Leave URL as is.
           else $0 = m[1] "]=(" m[2] "#markdown-header-" m[3]
                                                              }

        gsub("[]]=[(]","](")   # Again remove equal signs just inserted.

        print        # Finally output the possibly modified source line.
      }' "$1" > "$1.out" &&

if cmp  -s "$1" "$1.out"                          # File did not change,
then rm -f      "$1.out"                        # so remove output file.
else mv         "$1.out" "$1"  # Move output file back to original file.
fi

exit 0
