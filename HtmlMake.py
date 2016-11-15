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

from markdown.extensions     import Extension
from markdown.inlinepatterns import Pattern, SimpleTagPattern
from markdown.preprocessors  import Preprocessor

#
# References to local files in the various "*.md" source files are requ-
# ired by Bitbucket to have NO extension but are required by any browser
# to have an ".html"  extension.  Likewise the  HTML Bitbucket sends  to
# the browser defines header identifiers  starting with  "markdown-head-
# er-" and thus also requires header identifiers  occuring in local URLs
# to contain  this prefix.   In contrast  the standard  Python  Markdown
# "TOC" extension  used here generates  header identifiers  without this
# prefix,  and thus we have  to remove this prefix  from any local URLs.
# Therefore we use the following additional Markdown preprocessor to add
# ".html" extensions  and to remove the  "markdown-header-" prefix where
# necessary:

class AddHtmlExt(Preprocessor):
    def run(self, InLines):
        OutLines  = []                    # To receive the output lines.
        ReHash    = re.compile(r'#')         # Match start of header id.
        ReHashOth = re.compile(r'([^ (])#')  # Match start of header id.

        #
        # Ignore URLs  which refer  to a remote  location  ("http://" or
        # "https://"), or which already  contain an extension  (which is
        # supposed to consist  of a dot followed by  a sequence of char-
        # acters other than slash, dot, and dash  (the latter preventing
        # the trailing ".04-HowTo"  in the "Ubuntu*" URL  to be mistaken
        # for an extension)):

        ReIgnore  = re.compile(r'\]\((https?://|(.*/)?[^/]+\.[^/.-]+[#)])')
        RePrefix  = re.compile(r'#markdown-header-') # Bitbucket prefix.
        ReProtect = re.compile(r'\]=\(')                  # Match "]=(".
        ReRPar    = re.compile(r'\)')                # Match end of URL.

        #
        # In Markdown a URL is always  prefixed with  "]("  and suffixed
        # with ")":

        ReUrl     = re.compile(r'\]\([^)]+\)')

        for line in InLines:                 # Process whole input file.
            while True:                   # Process a single input line.
                url = ReUrl.search(line)              # Locate next URL.

                if not url: break   # No further URL found in this line.

                Url = url.group()                   # Fetch current URL.

                if not ReIgnore.match(Url):          # Process this URL.
                    Url = RePrefix.sub('#', Url) # Drop prefix if there.

                    #
                    # If the URL  refers to another  local file,  insert
                    # the ".html" file extension in the correct place:

                    char = ReHashOth.search(Url)   # Char preceding "#".

                    if char:  # Character preceding "#" is valid in URL.
                        Url = ReHashOth.sub(char.group(1) + '.html#',
                                            Url,
                                            count=1
                                           )

                    #
                    # If the URL does not contain a "#" character, suff-
                    # ix it with ".html",  otherwise leave it as is, be-
                    # cause it refers to a file local header identifier:

                    elif not ReHash.search(Url):
                        Url = ReRPar.sub('.html)', Url, count=1)

                #
                # Replace the initial "](" with "]=("  to prevent match-
                # ing here again  and replace the URL with  the possibly
                # modified version:

                line = ReUrl.sub(']=(' + Url[2:], line, count=1)

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
# Define a Markdown extension  to process the  "~~xxxxx~~"  notation for
# "strike through"  (mind that the regular expression  assigned to vari-
# able "ReDel" must not be compiled, and mind the additional parentheses
# around the first "~~" which cause the text to be striked through to be
# returned by "group(3)",  the place where  "SimpleTagPattern()"  is ex-
# pecting it):

ReDel = r'(~~)(.*?)~~'   # Regular expression matching "strike through".

class StrikeThrough(Extension):
   def extendMarkdown(self, md, md_globals):
       md.inlinePatterns.add('del',
                             SimpleTagPattern(ReDel, 'del'),
                             '>not_strong'
                            )

#
# Pass the input file to Markdown with all necessary extensions enabled,
# including our own "FixHtml" and "StrikeThrough" extensions:

markdown.markdownFromFile(extensions=['markdown.extensions.abbr'        ,
                                      'markdown.extensions.def_list'    ,
                                      'markdown.extensions.fenced_code' ,
                                      'markdown.extensions.footnotes'   ,
                                      'markdown.extensions.sane_lists'  ,
                                      'markdown.extensions.tables'      ,
                                      'markdown.extensions.toc'         ,
                                      'markdown.extensions.wikilinks'   ,
                                      FixHtml()                         ,
                                      StrikeThrough()
                                     ],
                          extension_configs={'markdown.extensions.wikilinks':
                                                {'base_url': '' ,
                                                 'end_url':  '.html'
                                                }
                                            },
                          input=sys.argv[1]
                         )

sys.exit(0)
