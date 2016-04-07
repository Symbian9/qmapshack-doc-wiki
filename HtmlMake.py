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

print '<head>'
print '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">'
print '</head>'

import markdown, sys

#
# Check the argument,  and if there is none,  provide an  empty argument
# causing standard input to be read:

if len(sys.argv) == 1: sys.argv.extend([''])  # Default: standard input.

#
# Since Markdown's  "save_mode='...'" option  is  meanwhile  deprecated,
# provide the following "EscapeHtml" extension which does the same thing
# as "safe_mode='escape'" did:

from markdown.extensions import Extension

class EscapeHtml(Extension):
   def extendMarkdown(self, md, md_globals):
       del md.inlinePatterns['entity']
       del md.inlinePatterns['html']
       del md.preprocessors['html_block']

#
# Pass the input file to Markdown with all necessary extensions enabled,
# including our own "EscapeHtml" extension:

markdown.markdownFromFile(extensions=['markdown.extensions.admonition',
                                      'markdown.extensions.codehilite',
                                      'markdown.extensions.extra'     ,
                                      'markdown.extensions.meta'      ,
                                      'markdown.extensions.sane_lists',
                                      'markdown.extensions.smarty'    ,
                                      'markdown.extensions.toc'       ,
                                      'markdown.extensions.wikilinks' ,
                                      EscapeHtml()
                                     ],
                          extension_configs={'markdown.extensions.codehilite':
                                                {'linenums':     'False',
                                                 'use_pygments': 'False'
                                                }
                                            },
                          input=sys.argv[1]
                         )

sys.exit(0)
