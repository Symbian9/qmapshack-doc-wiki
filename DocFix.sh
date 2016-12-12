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
# Make the Markdown source file specified  as argument usable both, loc-
# ally and on the Bitbucket server.
#
#                                                    R Woitok 2016-03-04
#
########################################################################
#
# The URL to the online documentation wiki on the Bitbucket server:

bitbucket='https://bitbucket.org/maproom/qmapshack/wiki/'

#
# The regular expression  in variable "r1"  matches any inline or refer-
# ence-style link to a file in the online documentation wiki on the Bit-
# bucket server.  The first parenthesized sub-expression matches the be-
# gin of the link definition up to but excluding the Bitbucket URL.
#
# The regular expression  in variable "r2"  matches any inline or refer-
# ence-style link  to a local file specified with  ".html" or ".md" ext-
# ension.   The first parenthesized  sub-expression matches the begin of
# the link definition up to but excluding this extension.
#
# The regular expression  in variable "r3"  matches any inline or refer-
# ence-style link  to a local file  with a fragment  identifier starting
# with the Bitbucket "markdown-header-" prefix.  The first parenthesized
# sub-expression matches the begin of the  link definition up to and in-
# cluding the "#" character.
#
# The regular expression  in variable "r4"  matches any inline or refer-
# ence-style link  to a local file  with a fragment identifier  not con-
# taining a colon.   The first parenthesized  sub-expression matches the
# begin of the link definition  up to and  including the  "#" character,
# while the third  parenthesized sub-expression matches the fragment id-
# entifier including  its delimiting character,  provided the identifier
# isn't delimited by the end of the line.

gawk -v "r1=(^ *[[][^^][^]]*[]]:[ \t]+|[]][(] *)$bitbucket"                   \
     -v 'r2=((^ *[[][^^][^]]*[]]:[ \t]+|[]][(] *)[^: #)]+)[.](md|html)'       \
     -v 'r3=((^ *[[][^^][^]]*[]]:[ \t]+|[]][(] *)[^: #)]*#)markdown-header-'  \
     -v 'r4=((^ *[[][^^][^]]*[]]:[ \t]+|[]][(] *)[^: #)]*#)([^: )]+([ )]|$))' '

      #
      # If the current input file is not "Home.md" and if its first line
      # does neither start with the "Home" link  nor with the new navig-
      # ation bar,  insert the "Home" link  at the top of the file (this
      # is enough for the line to be recognized later by script "NavBar.
      # sh" and to be correctly updated to its final state):

      ++i == 1 && FILENAME != "Home.md" && \
      ! /^([[](Home|Prev)[]]|Prev [(][)])/ { printf "[Home](Home)\n\n" }

      #
      # From all  input lines  remove Windows-style line ends,  from all
      # inline and  reference-style  link definitions  remove the URL to
      # the external Bitbucket server ("re1"), any ".md" and ".html" ex-
      # tensions  ("re2")  as well as  all Bitbucket  "markdown-header-"
      # prefixes ("re3") to prevent their duplication, and in all inline
      # and reference-style  link  definitions  again add  the Bitbucket
      # "markdown-header-" prefix to  fragment identifiers  referring to
      # header identifiers ("re4"):

      { printf "%s\n", gensub(r4,          "\\1markdown-header-\\3","G",
                              gensub(r3,                      "\\1","G",
                                     gensub(r2,               "\\1","G",
                                            gensub(r1,        "\\1","G",
                                                   gensub("\\r$","", 1 )))))
      }' "$1" > "$1.out" &&

if cmp  -s "$1" "$1.out"                          # File did not change,
then rm -f      "$1.out"                        # so remove output file.
else mv         "$1.out" "$1"  # Move output file back to original file.
fi

exit 0
