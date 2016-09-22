How to deal with all these Markdown ("*.md") files
==================================================

Author: Rainer Woitok, <Rainer.Woitok@Gmail.Com>, 2016-04-07



Contents:

A. Creating the "*.html" files
B. Sanitizing the "*.md" files
C. Changing the existing documentation



A. Creating the "*.html" files
------------------------------

   If you want to read the QMapShack documentation locally in your brow-
   ser without having installed some Markdown plugin for it, you need to
   create the "*.html" files from the "*.md" files yourself.


   1. Prerequisites
   ................

      To successfully create  "*.html" files  from the  "*.md" files you
      will need the following:

         * Python 2.7 or better.

         * Python's  Markdown module  version 2.6.6  or better  plus the
           following standard Markdown extensions:

              - Admonition

              - CodeHilite

              - Extra, containing the extensions
                  . Abbreviations
                  . Attribute Lists
                  . Definition Lists
                  . Fenced Code Blocks
                  . Footnotes
                  . Tables
                  . Smart Strong

              - Meta-Data

              - Sane Lists

              - SmartyPants

              - Table of Contents

              - WikiLinks

           All this is downloadable from, for instance,

              https://pythonhosted.org/Markdown/

         * Some sort of Unix/Linux shell.

         * GNU "make".  The makefile provided uses "simply expanded var-
           iables" (defined via "::=", as introduced by the Posix stand-
           ard in 2012).


   2. Building the "*.html" files
   ..............................

      Change into the directory  containing the  "*.md" files  and issue
      the command

         $ make doc
         $ your_browser file:///local/path/to/DocMain.html
         $

      This will update  all outdated "*.html" files  before your browser
      is opened at the main documentation page.

      That's it :-)



B. Sanitizing the "*.md" files
------------------------------

   If you work on a clone of the QMapShack wiki repository and have made
   changes to the  documentation,  you afterwards need  to make sure all
   your local  "*.md" files  are in a  consistent state which  is usable
   both, locally and over the web.  We call this process "sanitizing".

   This process includes fixing  URLs so the  Markdown files  are usable
   both,  locally and  over the web,  adding or updating  the navigation
   bars on the  top and bottom  of each "*.md" file  to ease navigation,
   and adding a table of contents near the top of it.


   1. Prerequisites
   ................

      To sanitize the "*.md" files in a local clone of the QMapShack wi-
      ki repository you'll need:

         * Some sort of  Unix/Linux shell  located at  "/usr/bin/sh" (if
           your shell resides  in some other place,  simply edit scripts
           "DocFix.sh", "NavBar.sh",  and optionally also "LinkCheck.sh"
           accordingly).

         * GNU "gawk".  The scripts "DocFix.sh", "NavBar.sh", and "Link-
           Check.sh" use some  "gawk" spcific features,  like a function
           "match()" which takes  three arguments,  function "gensub()",
           and perhaps a few others.

         * GNU "make".  The makefile provided uses "simply expanded var-
           iables" (defined via "::=", as introduced by the Posix stand-
           ard in 2012).


   2. Sanitizing
   .............

      Change into the directory  containing all  these "*.md"  files and
      issue the command

         $ make nav
         $

      This will sanitize  all "*.md" files  modified since the last call
      of "make nav".   And if you want  to check for dead files  ("*.md"
      files not pointed to  by a link in  any other "*.md" file) as well
      as for broken links (links to  non-existing "*.md" files), you can
      additionally run the command

         $ make check
         $

      Since you are definitely  working in a clone  of the wiki reposit-
      ory, you should be aware that your actions might have changed some
      of the "*.md" files and that these actions should thus be committ-
      ed.

      That's it again :-)


   3. What sanitizing includes
   ...........................

      * Make the name  of a "Ubuntu*.md" file blank free  and update all
        references to this  file accordingly  (the "make" command simply
        isn't made to deal with file names containing blanks).

      * Ensure that all  URLs referencing  other files  in this wiki are
        local and do not point to Bitbucket.

      * Ensure that "#..." suffixes in URLs  refer to the correct header
        identifiers in the local files.

      * Add a navigation bar (which does not only contain the "Home" and
        "Manual" links  previously provided  but also "Prev"  and "Next"
        links for  easier reading)  to both,  the top  and the bottom of
        each "*.md" file.

      * Add a clickable table of contents  immediately following the top
        navigation bar.



C. Changing the existing documentation
--------------------------------------

   1. Prerequisites
   ................

      To change the documentation files  the following conditions should
      be met:

         * MOST IMPORTANT: You have sufficient knowledge of the Markdown
           language!

         * You are working with a local clone  of the upstream Mercurial
           repository at Bitbucket.

         * You are editing  an existing  or creating  a new "*.md" file.
           NEVER TOUCH ANY "*.html" FILES, because these -- if at all --
           only exist in  your local clone,  are not version controlled,
           and are always created from the "*.md" files.

         * If you want to see in a browser what your changes are looking
           like, you'll either need a Markdown extension for your brows-
           er or all the tools mentioned in section "A.1" above.


   2. The Markdown language
   ........................

      You can find plenty of documentation of the Markdown language at

         * http://daringfireball.net/projects/markdown/syntax

           This URL refers to John Gruber's original Markdown syntax de-
           finition dating back to 2004.

         * https://pythonhosted.org/Markdown/

           Among other things  this URL  contains the  deviations of the
           Markdown syntax implemented by the Python Markdown module us-
           ed here from John Gruber's original syntax

         * https://pythonhosted.org/Markdown/extensions/index.html

           For every  Markdown extension  used here  (see section "A.1",
           above) this URL also documents the Markdown syntax understood
           by the extension as well as the HTML code produced from it.

      Finally, you can look  into any of the "*.md" files in this repos-
      itory and at the same time  point your broser at the corresponding
      web page at

         https://bitbucket.org/maproom/qmapshack/wiki/

      to see the  effect of a  particular  Markdown clause.   And if you
      want to see the HTML source  of the current page  in your browser,
      and your  browser happens  to be Firefox,  just type Ctrl-u (other
      browsers may or may  not need different handling,  but most decent
      browsers will be  able to display  the HTML source of  the current
      page one way or the other).

      IMPORTANT NOTE:

      Mind that a Markdown file isn't just a text file you look at using
      a browser.  For instance, a line containing the text

         For more information see here: http://x.y.z.com

      will result in an HTML file where you cannot even click at the URL
      when you look at it in your browser!  Instead, this line should be
      written as

         For more information see [here](http://x.y.z.com).

      in Markdown.   In this case  the word "here"  will be clickable in
      your browser, taking you to "http://x.y.z.com".


   3. Editing an existing "*.md" file
   ..................................

      When editing an existing file please mind:

         * Always leave the navigation bars at the top and bottom of the
           "*.md" file alone.  The top navigation bar looks like

              [Prev](... | [Home](Home) | [Manual](DocMain) | ...
              - - -
              [TOC]
              - - -

           while the bottom navigation bar looks like this

              - - -
              [Prev](... | [Home](Home) | [Manual](DocMain) | ...

           When running "make nav" these lines are automatically created
           if they don't yet exist, and are automatically updated other-
           wise.

         * Do not use the Markdown directive "- - -"  to insert a horiz-
           ontal rule, that is, a  horizontal line running from the left
           edge of the browser window  to the right edge.   This special
           variant is regarded  part of the navigation bars  and will be
           removed anywhere else  in the file  when the  navigation bars
           are automatically inserted or updated.   Rather use the Mark-
           down variants  "---" or "***",  if you need a horizontal rule
           somewhere in your Markdown file.

         * Apart from the advices above try to maintain the general look
           of the original file.


   4. Creating a new "*.md" file
   .............................

      When creating a new file please stick to the following guidelines:

         * Chose a  name for  your file  which smoothly  blends into the
           naming scheme  already in use.   The file name must only con-
           tain upper and lower case characters, digits,  as well as the
           characters  "+", "-", "_", and  ".".  In particular DO NEITH-
           ER USE blanks,  NOR ":",  "/", "\",  "*",  or "?" characters.
           And make sure your file name ends in ".md", otherwise it will
           not be recognized.

         * Don't try to add the navigation bars at the top and bottom of
           your new "*.md" file yourself.   These lines  will be created
           automatically when running  "make nav".   Just start the file
           with your first headline.

         * Do not use the Markdown directive "- - -"  to insert a horiz-
           ontal rule, that is, a  horizontal line running from the left
           edge of the browser window  to the right edge.   This special
           variant is regarded  part of the navigation bars  and will be
           removed anywhere else  in the file  when the  navigation bars
           are automatically inserted or updated.   Rather use the Mark-
           down variants  "---" or "***",  if you need a horizontal rule
           somewhere in your Markdown file.

         * If your file isn't reachable via some link occuring in one of
           the other "*.md" files,  it is dead.   Or at least as good as
           dead.   There is  a good chance  that nobody ever  reads your
           text.  So there should  always be at least  one link to it in
           the other "*.md" files.  There are two categories of files:

              - The general case:  your file covers  some self-contained
                topic.  Most of the existing "*.md" files belong to that
                category.   In this case  it's sufficient  to insert the
                link to the new file  at a suitable  place in file "Doc-
                Main.md".

              - The special case: the contents of your file is more like
                an appendix or a lengthy footnote dealing with a special
                case.   File "Ubuntu-14.04-HowTo.md"  is an example of a
                file in this category, it is only mentioned as a special
                case of Linux installation in file "DocGetQMapShack.md".
                In this case you should add to the file needing the app-
                endix or  lengthy footnote  the appropriate  link to the
                new file, while the new file should contain a link "Con-
                tinue here", "Back to ...", or the like at its end which
                takes you back to  or at least near  the point where you
                left off earlier.


   5. Activating your changes
   ..........................

      Depending on what you want and depending on what prerequisites are
      met by your installation  follow the instructions in sections "B."
      and optionally "A.", above.


   6. Sharing your changes
   .......................

      If you are finally satisfied with your changes, it's time to share
      them with the world.  There are two cases:

         * You have successfully  run the command  "make nav".   By this
           you have added  some changes  to your local clone of the Bit-
           bucket wiki repository which you should now commit according-
           ly and then push to the upstream Bitbucket repository.

         * You can't run "make nav" yourself.  In this case it's probab-
           ly your best bet to send your proposed changes (preferably in
           "unified diff" format, see "man diff") to the QMapShack mail-
           ing list at

              <qlandkartegt-users@lists.sourceforge.net>

           so someone who cares  and has the tools  can apply your patch
           to a current clone  of the upstream Bitbucket repository, can
           run "make nav" against it, and can finally push the resulting
           repository back to Bitbucket.

========================================================================
