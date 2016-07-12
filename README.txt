How to process all these "*.md" files
=====================================

Author: Rainer Woitok, Rainer.Woitok@Gmail.Com, 2016-04-07



A. Creating the "*.html" files locally on your computer
-------------------------------------------------------

   1. Prerequisites
   ................

      To successfully create "*.html" files  from these "*.md" files you
      will need the following:

         - Python 2.7 or better.

         - Python's "Markdown" module  version 2.6.6 or better including
           the following standard "Markdown" extensions:

              . admonition
              . codehilite
              . extra
              . meta
              . sane_lists
              . smarty
              . toc
              . wikilinks

           All this is downloadable from, for instance,

              https://pythonhosted.org/Markdown/

         - Some sort of  Unix/Linux shell  located at  "/usr/bin/sh" (if
           your shell resides  in some other place,  simply edit scripts
           "DocFix.sh" and "NavBar.sh" accordingly).

         - GNU "gawk".   Both scripts, "DocFix.sh"  and "NavBar.sh", use
           some "gawk" specific  features,  like function  "gensub()", a
           function "match()" which takes three arguments, and perhaps a
           few others.

         - GNU "make".  The makefile provided uses "simply expanded var-
           iables" (defined via "::=", as introduced by the Posix stand-
           ard in 2012) as well as "double-colon rules".


   2. Building the "*.html" files
   ..............................

      Change into the directory  containing  all these "*.md"  files and
      issue the command

         make

      If you are working  in a clone of the wiki repository  rather than
      in a normal directory  created from  a downloaded  "tar" ball, you
      should be aware  that your actions might have  changed some of the
      "*.md" files and that these actions should thus be committed.

      That's it :-)


B. Sanitizing the "*.md" files on the Bitbucket server
------------------------------------------------------

   1. Prerequisites
   ................

      To sanitize the  "*.md" files on the  Bitbucket server so the HTML
      code created  from them  is usable locally  and to add  navigation
      bars to them you'll need:

         - Some sort of  Unix/Linux shell  located at  "/usr/bin/sh" (if
           your shell resides  in some other place,  simply edit scripts
           "DocFix.sh" and "NavBar.sh" accordingly).

         - GNU "gawk".   Both scripts,  "DocFix.sh" and "NavBar.sh", use
           some "gawk" spcific features, like a function "match()" which
           takes three arguments, function "gensub()", and perhaps a few
           others.

         - GNU "make".  The makefile provided uses "simply expanded var-
           iables" (defined via "::=", as introduced by the Posix stand-
           ard in 2012) as well as "double-colon rules".

      Python and "Markdown" are not needed here, because the conversion
      from "*.md" to "*.html" is done by the Bitbucket server itself.


   2. Sanitizing the "*.md" files
   ..............................

      Change into the directory  containing all  these "*.md"  files and
      issue the command

         make nav

      Since you are definitely  working in a clone  of the wiki reposit-
      ory, you should be aware that your actions might have changed some
      of the "*.md" files and that these actions should thus be committ-
      ed.

      That's it again :-)


   3. What sanitizing includes
   ...........................

      - Make all "*.md" file names blank free, so "make" can easily pro-
        cess them.

      - Ensure that all  URLs referencing  other files  in this wiki are
        local and do not point to Bitbucket.

      - Ensure that "#..." suffixes in URLs  refer to the correct header
        identifiers in the local files.

      - Add a navigation bar (which does not only contain the "Home" and
        "Manual" links  currently provided  but also  "Prev"  and "Next"
        links for  easier reading)  to both,  the top  and the bottom of
        each "*.md" file.

========================================================================
