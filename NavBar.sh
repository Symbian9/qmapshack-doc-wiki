#! /usr/bin/sh

########################################################################
########################################################################
##                                                                    ##
## Copyright (C) 2016 - 2017 Rainer Woitok, <Rainer.Woitok@Gmail.Com> ##
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
# Replace the original navigation links  in the file specified as second
# parameter with a slightly more sophisticated navigation bar,  and also
# insert this navigation bar at the bottom of the file.  Both navigation
# bars provide  a "Prev"  and a "Next" link  for easier navigation while
# reading.   The target information  required for these additional links
# is retrieved from the table of contents file specified as first param-
# eter.
#
# And if the second file already features navigation bars at the top and
# at the bottom, update the information in them according to the current
# contents of the first file.
#
#                                                    R Woitok 2016-03-04
#
########################################################################
#
# Define the URL to the online documentation wiki on the Bitbucket serv-
# er, the regular expression matching the default footnote place marker,
# and the regular expression  matching lines belonging to old navigation
# bars:

bitbucket='https://bitbucket.org/maproom/qmapshack/wiki/'
footnote='///Footnotes Go Here///$'
navbar='[[](Home|Prev)[]]|Prev [(][)]|- - -$|[[]TOC[]]$'

#
# The regular expression in variable "r0"  matches any line specifying a
# default footnote place marker or belonging to an already existing nav-
# igation bar.
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
#
# The regular expression in variable "r5"  matches lines with links con-
# tributing to the  table of contents.   The first parenthesized sub-ex-
# pression matches the  link description  while the second parenthesized
# sub-expression matches the link target.
#
# To prevent MinGW "gawk" on Windows  from producing  Windows-style line
# ends  we set MinGW specific "gawk" variable  "BINMODE" to "w" and just
# to make sure we also set standard "gawk" variable "ORS" (output record
# separator) to just "\n":

gawk -v BINMODE=w -v ORS='\n'                                                 \
     -v "r0=^($footnote|$navbar)"                                             \
     -v "r1=(^ *[[][^^][^]]*[]]:[ \t]+|[]][(] *)$bitbucket"                   \
     -v 'r2=((^ *[[][^^][^]]*[]]:[ \t]+|[]][(] *)[^: #)]+)[.](md|html)'       \
     -v 'r3=((^ *[[][^^][^]]*[]]:[ \t]+|[]][(] *)[^: #)]*#)markdown-header-'  \
     -v 'r4=((^ *[[][^^][^]]*[]]:[ \t]+|[]][(] *)[^: #)]*#)([^: )]+([ )]|$))' \
     -v 'r5=^ *[*][ \t]+[[]([^]]+)[]][(] *([^ )]+)'                           \
     -v "toc=${1%.*}" '

     #
     # Define a function  which takes the  current "*.md"  input file as
     # argument and which  creates the Markdown code  for the navigation
     # bar from the information stored in arrays "prv[]" and "nxt[]":

     function nav(file,bottom) {
        sub("[.]md$","",file)              # Remove the ".md" extension.

        #
        # Provide information for previous file:

        if ( prv[file] ) { match(prv[file],"^([^]]*)[]](.*)$",m)
                           pr = "[Prev](" m[2] ") (" m[1] ")"
                         }
        else             pr = "Prev ()"         # Non-clickable element.

        #
        # Provide information for next file:

        if ( nxt[file] ) { match(nxt[file],"^([^]]*)[]](.*)$",m)
                           nx = "(" m[1] ") [Next](" m[2] ")"
                         }
        else             nx = "() Next"         # Non-clickable element.

        #
        # If this is the bottom navigation bar, also add a "Top" link:

        if ( bottom ) tp = "[Top](#) | "
        else          tp = ""

        # Print navigation links:

        printf "%s | [Home](Home) | [Manual](%s) | %s\n", pr, toc, tp nx
                               }                # End of function "nav".

     #
     # Extract the sequence of documents mentioned  in the table of con-
     # tents source file  and initialize arrays  "prv[]" (previous), and
     # "nxt[]" (next) from this information (both arrays take file names
     # without extensions as indices and for each index contain the link
     # text and the link target  separated with "]"  (because this char-
     # acter is not allowed in link texts, anyway)):

     C { #
         # Skip lines which do not directly belong to the table of cont-
         # ents:

         if ( ! match($0,r5,m) ) next

         #
         # Remove a ".html" or ".md" extension from the link target:

         tgt = gensub("[.](md|html)$","",1,m[2])
         val = m[1] "]" tgt    # Separate link text and target with "]".

         #
         # Set the "prv[]"  and "nxt[]" array components from the target
         # information extracted  (if the entry  is already set in array
         # "prv[]", this is caused by a bullet list entry and an immedi-
         # ately following bullet list entry in the contents file point-
         # ing to the same  target file.   In that case  we do not again
         # set the component in array "prv[]" to  prevent it from point-
         # ing to the current file):

         if ( ! (tgt in prv) ) prv[tgt] = last_val

         nxt[last_tgt] = val
         last_tgt      = tgt
         last_val      = val

         next
       }

     #
     # After the table of contents  has been read,  correctly initialize
     # the "next file" navigation information  for the table of contents
     # file to the first file found  in this table of contents and init-
     # ialize the "previous file"  navigation information  for the first
     # file found in the table of contents file with the information for
     # the table of contents file:

     F { nxt[toc                          ] = nxt[""]
         prv[gensub("^.*[]]","",1,nxt[""])] = "Manual]" toc
         begin = 1                            # Document is still empty.
         F     = 0                                  # Do this only once.
       }

     #
     # If the current input file is not "Home.md", insert a top navigat-
     # ion bar at the very beginning:

     ++i == 1 && FILENAME != "Home.md" {
        nav(FILENAME,0)                                   # Create upper
        printf "- - -\n[TOC]\n- - -\n\n"               # navigation bar.

        navbar = 1     # Also insert a bottom navigation bar at the end.
                                       }

     #
     # Remove anything  belonging to the old navigation bars  as well as
     # any default footnote place markers:

     $0 ~ r0 { next }

     #
     # At the beginning of the file drop both, empty lines and rules:

     begin && /^( *|---)$/ { next     }

     /^[[]\^/              { foot = 1 }       # File contains footnotes.

     { #
       # For the sake of the "END" clause check the current line for be-
       # ing empty or not  (if it is  not empty and  the current line is
       # the last line of the file, the "END" clause will insert an add-
       # itional empty line  before adding  the optional  footnote place
       # marker and the bottom navigation bar):

       if ( $0 ~ /^ *$/ ) mark = 0                      # Line is empty.
       else               mark = 1        # Line contains Markdown code.

       #
       # Replace Windows-style line ends  with Unix-style line ends, and
       # from both,  inline and reference-style  link definitions remove
       # the URL to the external Bitbucket server ("r1"),  any ".md" and
       # ".html" extensions ("r2"),  as well as all Bitbucket "markdown-
       # header-" prefixes ("r3")  to prevent their duplication,  and in
       # all inline and reference-style  link definitions  again add the
       # Bitbucket "markdown-header-" prefix to fragment identifiers re-
       # ferring to header identifiers ("r4"):

       printf "%s\n", gensub(r4,          "\\1markdown-header-\\3","G",
                             gensub(r3,                      "\\1","G",
                                    gensub(r2,               "\\1","G",
                                           gensub(r1,        "\\1","G",
                                                  gensub("\r$", "", 1)))))

       begin = 0                          # Document is no longer empty.
     }

     #
     # Also insert a navigation bar at the end of the file,  provided we
     # have added one at the beginning:

     END { if ( ! navbar ) exit            # No navigation bar required.

           #
           # Append an  additional empty line,  if the last  line in the
           # file contained Markdown code:

           if ( mark ) printf "\n"

           #
           # Insert the default footnote place marker, if necessary:

           if ( foot ) printf "///Footnotes Go Here///\n"

           printf "- - -\n"                              # Create bottom
           nav(FILENAME,1)                             # navigation bar.
         }            ' C=1 "$1" C= F=1 "$2" > "$2.out" &&

if cmp  -s "$2" "$2.out"                          # File did not change,
then rm -f      "$2.out"                        # so remove output file.
else mv         "$2.out" "$2"  # Move output file back to original file.
fi

exit 0
