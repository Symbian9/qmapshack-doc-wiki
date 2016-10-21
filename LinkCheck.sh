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
# Check for  dead files  ("*.md" files  not pointed to  by a link in any
# other "*.md" file) as well as for broken links  (links to non-existing
# "*.md" files or non-existing header identifiers within an "*.md" file).
#
#                                                    R Woitok 2016-07-29
#
########################################################################

hg manifest |                 # Provide list of currently tracked files.
gawk '#
      # Define a function which removes  the file passed as argument and
      # all files  which are  recursively reachable  from it from global
      # array "file_unref[]":

      function referenced(file , refs) {
         if ( file in file_unref ) {
            refs = linked_in[file]    # Files mentioned in current file.
            delete file_unref[file]           # Mark file as referenced.

            #
            # If the current file is a "*.png" file, also mark the corr-
            # esponding "*.svg" file as referenced:

            if ( match(file,"^(.*)[.]png$",mm) ) \
               delete file_unref[mm[1] ".svg"]

            #
            # Process each file mentioned in the current file:

            while ( match(refs,"^(.*) ([^ ]+) *$",mm) ) {
               refs = mm[1]                   # For next loop iteration.
               referenced(mm[2])         # Mark next file as referenced.
                                   }   }                }

      #
      # Provide input file name without extension:

      BEGINFILE { filename = FILENAME
                  sub("[.]md$","",filename)
                }

      #
      # Read in  the names of  tracked files  from standard input,  skip
      # Mercurial files,  file "Makefile",  as well as scripts  and pure
      # text files, remove the extension from "*.md" files, and mark all
      # these files as existing but not yet referenced:

      F { if ( $0 ~ "^[.]hg|^Makefile$|[.](py|sh|txt)$" ) next

          sub("[.]md$","")        # Remove ".md" extension, if existing.
          file_unref[$0] = link_def[$0] = 1      # Mark file as existing
          next                                   # but yet unreferenced.
        }

      #
      # Now we are reading  all existing Markdown files,  and first mark
      # any local link target implicitly created for each Markdown head-
      # line as existing:

      match($0,"^ *#+ *(.*)$",m) {
         l = tolower(m[1])
         sub("^![[][^]]*[]][(][^)]+[)] *","",l)     # Ignore image link.
         sub(" *#*$","",l)                       # Drop trailing marker.
         gsub("[^a-zA-Z0-9]+","-",l)
         link_def[filename "#" l] = 1
                                 }

      #
      # Mark any links defined by footnotes as existing:

      match($0,"[[]\\^([^]]+)[]]:",m) { link_def[filename "#fn:"    m[1]] = 1
                                        link_def[filename "#fnref:" m[1]] = 1
                                      }

      #
      # Check every Markdown link in the current line (since regular ex-
      # pressions are greedy,  we process the last link in the currently
      # remaining line first and then we simply drop it.  And because we
      # potentially modify the current input line in this loop, this ac-
      # tion must be the last one):

      { while ( match($0,"^(.*)[]][(]([^)]+)[)]",m) ) {
           $0 = m[1]                 # Drop last link from current line.

           #
           # Skip links to external web pages as well as the "Top" link:

           if ( match(m[2],"^http|#$") ) continue

           #
           # If this is not  a self reference,  that is,  a reference to
           # the current  input file,  add it to the list of  links con-
           # tained in the current input file, and also mark the link as
           # existing (mind however, that file "DocMain.md" contains two
           # self references,  one each in the top and bottom navigation
           # bars.  So suppress the correspondig message in that case):

           if ( m[2] == filename ) {
              if ( filename != "DocMain" ) printf "Self-reference in %s\n", FILENAME
                                   }
           else { f = l = m[2]

                  sub("#.*$",""          ,f)  # Discard local link part.
                  sub("^#"  ,filename "#",l) # Prefix name to local lnk.

                  linked_in[filename] = linked_in[filename] " " f
                  called_in[l]        = called_in[l]        " " FILENAME
      }         }                                     } # End while ....

      END { #
            # Sort arrays ascending with respect to their indices:

            PROCINFO["sorted_in"] = "@ind_str_asc"

            #
            # Remove all files from array "file_unref[]"  which are rec-
            # ursively referenced  from within file "Home.md"  (which in
            # turn references the top documentation file "DocMain.md"):

            referenced("Home")

            #
            # Remove all links marked  as defined in  array "link_def[]"
            # from array "called_in[]":

            for ( l in called_in ) if ( l in link_def ) delete called_in[l]

            #
            # If there are any unreferenced files left, print them:

            if ( length(file_unref) ) {
               printf "\nUnreferenced files:\n"
               for ( f in file_unref ) {

                   #
                   # If the file name already contains an extension, use
                   # it, otherwise append extension ".md":

                   if ( f ~ "[.][a-z]+$" ) print f
                   else                    print f ".md"
                                      }}
            #
            # If there are any undefined links left, print them:

            if ( length(called_in) ) {
               printf "\nUndefined links:\n"
               for ( l in called_in ) print l, "in:" called_in[l]
          }                          }
     ' F=1 - F= *.md
