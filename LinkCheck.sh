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

            delete file_unref[gensub("[.]png$",".svg",1,file)]

            #
            # Process each file mentioned in the current file:

            while ( match(refs,"^(.*) ([^ ]+) *$",mm) ) {
               refs = mm[1]                   # For next loop iteration.
               referenced(mm[2])         # Mark next file as referenced.
                                   }   }                }

      #
      # Provide input file name without extension:

      BEGINFILE { filename = gensub("[.]md$","",1,FILENAME) }

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
         sub(" *#* *$","",l)                     # Drop trailing marker.
         gsub("[^a-z0-9_ \t-]+","" ,l)  # Drop chars not wanted in URLs.
         l = "markdown-header-" l             # Insert Bitbucket prefix.
         gsub(        "[ \t-]+","-",l)      # Squeeze blanks and dashes.
         link_def[filename "#" l] = 1             # Mark URL as defined.
                                 }

      #
      # Mark any links defined by  Markdown footnotes definitions as ex-
      # isting:

      match($0,"^[[]\\^([^]]+)[]]:",m) {
         link_def[filename "#fn:" m[1]] = \
         def_fn1[filename][m[1]]        = def_fn2[filename][m[1]] = 1
         next
                                       }

      #
      # Process Markdown reference-style link definitions:

      match($0,"^ {0,3}[[]([^]]+)[]]:[ \t]+([^ ]+)",m) {

         #
         # If this  is not a reference  to the current input  file, save
         # the link target  associated with the reference identifier (we
         # have to keep  two almost  identical arrays  "def_id1[][]" and
         # "def_id2[][]" here because we will later compare them to arr-
         # ay "link_id[][]" twice  (both ways),  thereby first  deleting
         # any correct array components  in array "def_id1[][]" and then
         # in array "link_id[][]"):

         if ( m[2] == filename ) printf "Self-reference in %s\n", FILENAME
         else def_id2[filename][m[1]] = m[2]

         #
         # By not recording a self-reference  in array "def_id2[][]" the
         # reference identifier will be reported as being undefined, and
         # by nevertheless  recording it  in array  "def_id1[][]" below,
         # this self reference  will be reported as unreferenced, should
         # this definition never be referenced:

         def_id1[filename][m[1]] = m[2]
         next
                                                       }

      #
      # Process  every Markdown footnote   reference in the current line
      # (since regular expressions are greedy, we  process the last link
      # in the  currently remaining line first, and  then we simply drop
      # it by iterating over "m[1]":

      { m[1] = $0                                   # Save current line.

        while ( match(m[1],"^(.*)[[]\\^([^]]+)[]]",m) ) {
           link_def[filename "#fnref:" m[2]] = ref_fn[filename][m[2]] = 1
      }                                                 }

      #
      # Process every  Markdown  reference-style  link reference  in the
      # current line (since regular  expressions are greedy,  we process
      # the last link in the currently remaining line first, and then we
      # simply drop it by iterating over "m[1]":

      { m[1] = $0                                   # Save current line.

        while ( match(m[1],"^(.*)[[]([^]]+)[]] ?[[]([^]]*)[]]",m) ) {

           #
           # Prevent the rare case where the  "[...][...]" is part of an
           # inline URL as in  "](http://.../x?y[...][...]=z)" (starting
           # the greedy  regular  expression with  "^.*"  will check the
           # rightmost remaining inline link):

           if ( m[1] ~ "^.*[]][(][^)]*$" ) continue

           #
           # Replace empty link identifier with link text:

           if ( ! m[3] ) m[3] = m[2]

           #
           # Record the reference to the link identifier in Boolean arr-
           # ay "ref_id[][]":

           ref_id[filename][m[3]] = 1
      }                                                             }

      #
      # Process every  Markdown inline link  in the current line  (since
      # regular expressions are greedy,  we process the last link in the
      # currently remaining  line first,  and then we  simply drop it by
      # iterating over "m[1]":

      { m[1] = $0                                   # Save current line.

        while ( match(m[1],"^(.*)[]][(] *([^ \")]+)( *[)]| +[\"])",m) ) {

           #
           # Skip links to external web pages as well as the "Top" link:

           if ( m[2] ~ "^http|#$" ) continue

           #
           # If this is not  a self-reference,  that is,  a reference to
           # the current input file,  add it to arrays "linked_in[]" and
           # "called_in[]",  otherwise complain (mind however, that file
           # "DocMain.md" contains two self-references,  one each in the
           # top and bottom navigation bars.  Thus suppress the corresp-
           # onding message in that case):

           if ( m[2] == filename ) {
              if ( filename != "DocMain" ) \
                 printf "Self-reference in %s\n", FILENAME
                                   }
           else { f = l = m[2]

                  sub("#.*$",""          ,f)  # Discard local link part.
                  sub("^#"  ,filename "#",l) # Prefix name to local lnk.

                  linked_in[filename] = linked_in[filename] " " f
                  called_in[l]        = called_in[l]        " " FILENAME
      }         }                                                     }

      END { #
            # Sort arrays ascending with respect to their indices:

            PROCINFO["sorted_in"] = "@ind_str_asc"

            #
            # Delete all footnote definition identifiers  in array "def_
            # fn1[][]" which are also referenced in the same file:

            for ( f in def_fn1 )                         \
                for ( i in def_fn1[f] )                  \
                    if ( f in ref_fn && i in ref_fn[f] ) \
                       delete def_fn1[f][i]

            #
            # Any array components left  in array "def_fn1[][]" refer to
            # defined but unreferenced footnote identifiers and are thus
            # printed:

            for ( f in def_fn1 ) if ( length(def_fn1[f]) ) {
                printf "\nUnreferenced footnotes in %s.md:\n", f
                for ( i in def_fn1[f] ) print i
                                                           }

            #
            # Delete all footnote references in array "ref_fn[][]" which
            # are also defined in the same file:

            for ( f in def_fn2 )        \
                for ( i in def_fn2[f] ) \
                    if ( f in ref_fn ) delete ref_fn[f][i]

            #
            # Any array components  left in array "ref_fn[][]"  refer to
            # referenced but undefined footnote identifiers and are thus
            # printed:

            for ( f in ref_fn ) if ( length(ref_fn[f]) ) {
                printf "\nUndefined footnotes in %s.md:\n", f
                for ( i in ref_fn[f] ) print i
                                                         }

            #
            # Delete all reference-style link definitions in array "def_
            # id1[][]" which are also referenced in the same file:

            for ( f in def_id1 )                         \
                for ( i in def_id1[f] )                  \
                    if ( f in ref_id && i in ref_id[f] ) \
                       delete def_id1[f][i]

            #
            # Any array components  left in array "def_id1[][]" refer to
            # defined but  unreferenced reference-style  identifiers and
            # are thus printed:

            for ( f in def_id1 ) if ( length(def_id1[f]) ) {
                printf "\nUnreferenced reference-style identifiers in %s.md:\n", f
                for ( i in def_id1[f] ) print i
                                                           }

            #
            # Delete all reference-style link references  in array "ref_
            # id[][]" which are also defined  in the same file,  and add
            # the link targets  of all defined  reference-style links to
            # arrays "linked_in[]" and "called_in[]":

            for ( f in def_id2 ) \
                for ( i in def_id2[f] ) {
                    if ( f in ref_id ) delete ref_id[f][i]

                    l = def_id2[f][i]

                    if ( l !~ "^http|#$" ) {
                       linked_in[f] = linked_in[f] " " l
                       called_in[l] = called_in[l] " " f ".md"
                                        }  }

            #
            # Any array components  left in array "ref_id[][]"  refer to
            # referenced  but undefined  reference-style identifiers and
            # are thus printed:

            for ( f in ref_id ) if ( length(ref_id[f]) ) {
                printf "\nUndefined reference-style identifiers in %s.md:\n", f
                for ( i in ref_id[f] ) print i
                                                         }

            #
            # Remove all files from array "file_unref[]"  which are rec-
            # ursively referenced  from within file "Home.md"  (which in
            # turn references the top documentation file "DocMain.md"):

            referenced("Home")

            #
            # Any array components left in array "file_unref[]" refer to
            # unreferenced files and are thus printed:

            if ( length(file_unref) ) {
               printf "\nUnreferenced files:\n"
               for ( f in file_unref ) {

                   #
                   # If the file name already contains an extension, use
                   # it, otherwise append extension ".md":

                   if ( f ~ "[.][a-z]+$" ) printf "%s\n"   , f
                   else                    printf "%s.md\n", f
                                      }}

            #
            # Remove all links marked  as defined in  array "link_def[]"
            # from array "called_in[]":

            for ( l in called_in ) if ( l in link_def ) delete called_in[l]

            #
            # Any array components left  in array "called_in[]" refer to
            # non-existing link targets and are thus printed:

            if ( length(called_in) ) {
               printf "\nBroken links:\n"
               for ( l in called_in ) \
                   printf "%s in: %s\n", l, substr(called_in[l],2)
          }                          }
     ' F=1 - F= *.md
