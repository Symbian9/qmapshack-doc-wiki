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
#
# This script will update the modification date of the source file spec-
# ified, regardless  of whether or not any  real changes  were introduc-
# ed.  But since a simple change of the modification date does not cause
# Mercurial to regard a file as having changed, this is ok here:

gawk '#
      # If the current input file is not "Home.md" and if its first line
      # does neither start with the "Home" link  nor with the new navig-
      # ation bar,  insert the "Home" link  at the top of the file (this
      # is enough for the line to be recognized later by script "NavBar.
      # sh" and to be correctly updated to its final state):

      ++i == 1 && FILENAME != "Home.md" && \
      ! /^([[](Home|Prev)[]]|Prev [(][)])/ {
          printf "[Home](Home.html)\n\n"
                                           }

      { #
        # In the reference to the "Ubuntu*" file  use its new blank free
        # name (and because the name  without the extension already con-
        # tains a dot  which would be missinterpreted in the rule adding
        # missing ".html" extensions, explicitly add the ".html" extens-
        # ion manually):

        sub("[]][(][^)]*Ubuntu[^)]*[)]","](Ubuntu-14.04-HowTo.html)")

        #
        # Replace URLs  pointing into the  documentation wiki  with URLs
        # pointing to the corresponding local files:

        sub("https://bitbucket.org/maproom/qmapshack/wiki/","")

        #
        # Remove prefixes  "markdown-header-" from header identifiers in
        # URLs:

        sub("#markdown-header-","#")

        #
        # Add missing ".html" extensions to URLs pointing to local files
        # (and since a line  in the source  file could  contain multiple
        # URLs, from which a normal greedy regular expression would only
        # process the last one,  we use a loop  searching for  "](", and
        # apart from adding ".html" where necessary,  we also temporari-
        # ly replace the string "](" with "]=(" to prevent if from being
        # processed again):

        while ( match($0,"^(.*)[]][(]([^)]*)([)].*)$",m) ) {

           #
           # Leave the URL as is, if it refers to a header identifier in
           # the current file,  to a remote  location,  or if it already
           # contains an extension:

           if ( m[2] ~ "^(#|https?://)" || m[2] ~ "^(.*/)?.+[.][^.]+$" \
              ) $0 = m[1] "]=(" m[2] m[3]

           #
           # If the URL  refers to a header identifier  in another local
           # file, insert the missing  ".html" extension immediately be-
           # fore the header identifier:

           else if ( match(m[2],"^(.+)(#.*)$",mm)                      \
                   ) $0 = m[1] "]=(" mm[1] ".html" mm[2] m[3]

                #
                # Otherwise append the missing  ".html" extension to the
                # local file name:

                else $0 = m[1] "]=("  m[2] ".html"       m[3]
                                                           }

        #
        # When a line  is processed completely,  again remove  the equal
        # signs squeezed between the square brackets and parentheses:

        gsub("[]]=[(]","](")

        print        # Finally output the possibly modified source line.
      }' "$1" > "$1.out" &&

if cmp  -s "$1" "$1.out"                          # File did not change,
then rm -f      "$1.out"                        # so remove output file.
else mv         "$1.out" "$1"  # Move output file back to original file.
fi

exit 0
