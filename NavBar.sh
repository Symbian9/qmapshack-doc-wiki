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

gawk -v "toc=${1%.*}" '
     #
     # Define a function  which takes the  current "*.md"  input file as
     # argument and which  creates the Markdown code  for the navigation
     # bar from the information stored in arrays "p[]" and "n[]":

     function nav(file) {  
        sub("[.]md$","",file)              # Remove the ".md" extension.

        #
        # Provide information for previous file:

        if ( p[file] ) { match(p[file],"[[]([^]]*)[]][(]([^)]*)",m)
                         pr = "[Prev](" m[2] ") (" m[1] ")"
                       }
        else             pr = "Prev ()"         # Non-clickable element.

        #
        # Provide information for next file:

        if ( n[file] ) { match(n[file],"[[]([^]]*)[]][(]([^)]*)",m)
                         nx = "(" m[1] ") [Next](" m[2] ")"
                       }
        else             nx = "() Next"         # Non-clickable element.

        printf "%s | [Home](Home) | [Manual](%s) | %s\n", pr, toc, nx
                        }                       # End of function "nav".

     #
     # Extract the sequence of documents mentioned  in the table of con-
     # tents source file  and initialize  arrays  "p[]"  (previous), and
     # "n[]" (next)  from this information  (both arrays take file names
     # without extensions as indices):

     C                                  { #
                                          # Skip lines which do not dir-
                                          # ectly belong to the table of
                                          # contents:

                                          if ( ! sub("^ *[*] +","") ) next

                                          #
                                          # Set the "p[]" and "n[]" arr-
                                          # ay components from the targ-
                                          # et information extracted:

                                          match($0,"[[][^]]*[]][(]([^)]*)",m)

                                          p[m[1]]      = last_info
                                          n[last_file] = $0
                                          last_info    = $0
                                          last_file    = m[1]

                                          next
                                        }

     #
     # When the  table of contents  has been read,  correctly initialize
     # the "next file" navigation information  for the table of contents
     # file to the first file found  in this table of contents and init-
     # ialize the  "previous file"  navigation information  for the next
     # file with the  information for  the table  of contents  file (the
     # "ENDFILE" rule will be executed twice, after reading the table of
     # contents  and after processing  the source file,  but this second
     # execution simply does not matter):

     ENDFILE                            {
        n[toc                                     ] = n[""]
        p[gensub("^.*[(]([^)]+).*$","\\1",1,n[""])] = "[Manual](" toc ")"
                                        }

     #
     # Replace the  original simple  navigation link(s)  with a slightly
     # more sophisticated  navigation bar  or update the  top navigation
     # bar (if this regular expression should match  a second time, this
     # is the bottom navigation bar,  which we skip here and create anew
     # in the "END" rule):

     /^([[](Home|Prev)[]]|Prev [(][)])/ { if ( U ) next      # Skip bar.

                                          nav(FILENAME)
                                          print "- - -"

                                          U = 1    # Upper nav bar done.

                                          next
                                        }

     #
     # Drop our special rule line indicator "- - -" belonging to the old
     # navigation bars but print all other lines:

     ! /^- - -$/

     #
     # Also insert a navigation bar at the end of the file,  provided we
     # have added or updated one at the beginning:

     END                                { if ( ! U ) exit

                                          print "- - -"
                                          nav(FILENAME)
                                        }
                      ' C=1 "$1" C= "$2" > "$2.out" &&

if cmp  -s "$2" "$2.out"                          # File did not change,
then rm -f      "$2.out"                        # so remove output file.
else mv         "$2.out" "$2"  # Move output file back to original file.
fi

exit 0
