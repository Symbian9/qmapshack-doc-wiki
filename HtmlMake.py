#! /usr/bin/env python

########################################################################
########################################################################
##                                                                    ##
## Copyright (C) 2016 Rainer Woitok, Rainer.Woitok@Gmail.Com          ##
##                                                                    ##
## This Shell script is free software: you can redistribute it and/or ##
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
# From the  "*.md" Markdown source file  specified as argument create an
# "*.html" file  on standard output  by using Python's "Markdown" module
# which can be found at:
#
#      "https://pythonhosted.org/Markdown/".
#
#                                                    R Woitok 2016-03-04
#
########################################################################
#
# Specify UTF-8 encoding for the HTML file to be created  (since we esc-
# ape the angle brackets in our own extension below, the following three
# lines MUST NOT be piped to "Markdown"):

print('<head>')
print('<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">')
print('</head>')

import markdown, re, sys

#
# Check the argument,  and if there is none,  provide an  empty argument
# causing standard input to be read:

if len(sys.argv) == 1: sys.argv.extend([''])  # Default: standard input.

from markdown.extensions    import Extension
from markdown.preprocessors import Preprocessor

#
# Since references to local files in the various "*.md" source files are
# required by Bitbucket  to have  NO  extension  but are required by any
# browser to have an ".html" extension,  we use the following additional
# Markdown preprocessor:

class AddHtmlExt(Preprocessor):
    def run(self, InLines):
        OutLines  = []                    # To receive the output lines.
        ReHash    = re.compile('#')  # Match start of header identifier.

        #
        # Ignore URLs which refer  to a header identifier in the current
        # file ("#..."), to a remote location ("http://" or "https://"),
        # or which  already contain  an extension  (which is supposed to
        # consist of a dot  followed by  a sequence of  characters other
        # than dot  and dash  (the latter preventing  the trailing ".04-
        # HowTo" in the "Ubuntu*" URL to be mistaken for an extension)):

        ReIgnore  = re.compile('[]][(](#|https?://|(.*/)?.+[.][^-.]+(#|[)]))')
        ReProtect = re.compile('[]]=[(]')                 # Match "]=(".
        ReRPar    = re.compile('[)]')                # Match end of URL.

        #
        # In Markdown a URL is always  prefixed with  "]("  and suffixed
        # with ")":

        ReUrl     = re.compile('[]][(][^)]+[)]')

        for line in InLines:
            while True:
                url = ReUrl.search(line)              # Locate next URL.

                if not url: break                # No further URL found.

                OldUrl = url.group()                # Fetch current URL.

                if ReIgnore.match(OldUrl):
                      NewUrl = OldUrl           # Don't change this URL.
                elif ReHash.search(OldUrl):
                      NewUrl = ReHash.sub('.html#', OldUrl, count=1)
                else: NewUrl = ReRPar.sub('.html)', OldUrl, count=1)

                #
                # Replace the initial "](" with "]=("  to prevent match-
                # ing here again:

                line = ReUrl.sub(']=(' + NewUrl[2:], line, count=1)

            #
            # After having  processed all URLs  in this line,  again re-
            # place "]=(" with "](" and output the line:

            OutLines.append(ReProtect.sub('](',line))

        return OutLines

#
# Define a Markdown extension which solves all our HTML problems:

class FixHtml(Extension):
   def extendMarkdown(self, md, md_globals):

       #
       # Insert our own "AddHtmlExt" preprocessor  at the very beginning
       # of ordered "md" dict "preprocessors":

       md.preprocessors.add('add_html_ext',AddHtmlExt(md),'_begin')

       #
       # Since Markdown's "save_mode='...'" option  is meanwhile deprec-
       # ated,  delete the following  three components  from the various
       # "md" dicts  to achieve the same effect  as "safe_mode='escape'"
       # formerly had:

       del md.inlinePatterns['entity']
       del md.inlinePatterns['html']
       del md.preprocessors['html_block']

#
# Pass the input file to Markdown with all necessary extensions enabled,
# including our own "FixHtml" extension:

markdown.markdownFromFile(extensions=['markdown.extensions.admonition',
                                      'markdown.extensions.codehilite',
                                      'markdown.extensions.extra'     ,
                                      'markdown.extensions.meta'      ,
                                      'markdown.extensions.sane_lists',
                                      'markdown.extensions.smarty'    ,
                                      'markdown.extensions.toc'       ,
                                      'markdown.extensions.wikilinks' ,
                                      FixHtml()
                                     ],
                          extension_configs={'markdown.extensions.codehilite':
                                                {'linenums':     'False',
                                                 'use_pygments': 'False'
                                                }
                                            },
                          input=sys.argv[1]
                         )

sys.exit(0)
