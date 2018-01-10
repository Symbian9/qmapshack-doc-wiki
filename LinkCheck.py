#! /usr/bin/env python

########################################################################
########################################################################
##                                                                    ##
## Copyright (C) 2016 - 2018 Rainer Woitok, <Rainer.Woitok@Gmail.Com> ##
##                                                                    ##
## This Python script is free software:  you can redistribute it and/ ##
## or modify it under the terms  of the GNU General Public License as ##
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
# Check the documentation repository for unreferenced files,  for broken
# links, for "*.md" files  containing a link without a fragment identif-
# ier to themselves (with a few exceptions),  for undefined and unrefer-
# enced footnotes,  and for  undefined or  unreferenced  reference-style
# links.
#
#                                                    R Woitok 2016-07-29
#
########################################################################

from __future__ import unicode_literals
import codecs, copy, os, re, sys, tempfile, unicodedata

ec = 0                                              # Default exit code.

#
# Define global dicts:
#
# If and only if Boolean dict "FlUnref[]" contains a file name as a key,
# this file is (yet) unreferenced:

FlUnref = {}

#
# If and only if  a footnote  with identifier  "id"  is defined  in file
# "fl", Boolean dict "FnDef['fl'][]" will contain a key "id", and if and
# only if a footnote  with identifier "id"  is referenced  in file "fl",
# Boolean dict "FnRef['fl'][]" will contain a key "id":

FnDef = {} ; FnRef = {}

#
# If and only if a reference-style link  with identifier "id" is defined
# in file "fl",  Boolean dict  "IdDef['fl'][]"  will contain a key "id",
# and if and only if a reference-style link with identifier "id" is ref-
# erenced in file "fl",  Boolean dict "IdRef['fl'][]" will contain a key
# "id":

IdDef = {} ; IdRef = {}

#
# If and only if  file "f1" contains  a Markdown reference to file "f2",
# Boolean dict "Links['f1'][]" will contain key "f2":

Links = {}

#
# Boolean dict "LkDef[]"  contains a key  for every defined  link target
# (and thus in particular for every tracked "*.md",  "*.png",  or ".svg"
# file):

LkDef = {}

#
# Define the numbers  of self-references  allowed in "*.md" files  (file
# "AxAdvToc.md" contains a single self-reference, while files "AxAdvInd-
# ex.md" and "DocMain.md" both contain two self-references,  one each in
# the top and bottom navigation bars).   If a file isn't explicitly ref-
# erenced here, its self-reference count defaults to zero:

SelfRef = { 'AxAdvIndex': 2,
            'AxAdvToc'  : 1,
            'DocMain'   : 2
          }

#
# Indexed by Markdown link targets to or into local files dict "Where[]"
# keeps track from  which files a particular  link target is referenced.
# If a link target is referenced more than once in file "file",  it will
# also occur multiple times in the string associated with key "file":

Where = {}

########################################################################
#
# Define function "compare":

def compare(d, r, t):

    #
    # Delete all entries in dict "d[][]"  which are also defined in dict
    # "r[][]" and then report any components left in dict "d[][]" as un-
    # referenced:

    c = copy.deepcopy(d)               # To find undefined entries next.

    prune(d, r)
    notify(d, 'Unreferenced %s' % t)

    #
    # Delete all entries in dict "r[][]" which  are also defined in dict
    # "c[][]" and then report any components left in dict "r[][]" as un-
    # defined:

    prune(r, c)
    notify(r, 'Undefined %s' % t)

#
# Define function "linkref":
#
# This function records  the reference of a given target link in a given
# Markdown source file.

fragid = re.compile(r'#.*$')          # To remove a fragment identifier.

def linkref(fn, lk):

    global ec                           # Use global exit code variable.
    global Links, SelfRef, Where           # Use globally defined dicts.

    #
    # Skip links to external web pages as well as the "Top" link (global
    # regular expression  "ignore"  was defined in  the main program and
    # matches any external links as well as the local top link "#"):

    if ignore.search(lk): return
    elif fn == lk:                         # Deal with a self-reference.
         SelfRef[fn] = SelfRef.get(fn,0) - 1

         if SelfRef[fn] < 0:
            print('Self-reference in %s.md' % fn)
            ec = 1                       # Use non-zero exit code later.

         return       # No need to record that a file references itself.

    f = fragid.sub('', lk)             # Remove any fragment identifier.

    if f:   # File name present, so it's a link to or into another file.
          if not fn in Links: Links[fn] = {}          # Create sub-dict.

          Links[fn][f] = 1  # Reference from current file to other file.
    else: lk           = fn + lk     # Fragment identifier in same file.

    #
    # For later use  in messages  remember from where  a link target was
    # referenced:

    Where[lk] = '%s %s.md' % (Where.get(lk,''), fn)

#
# Define function "notify":
#
# If for any file "f"  dict "w['f'][]"  still contains defined keys, use
# string "t" as  initial headline  and then print all  existing keys for
# that file.

def notify(w, t):

    global ec                           # Use global exit code variable.

    for f in sorted(w.keys()):
        if len(w[f]):
           print('\n%s in %s.md:' % (t, f))
           ec = 1                        # Use non-zero exit code later.

           for n in sorted(w[f].keys()): print(n)

#
# Define function "prune":
#
# Weed out all entries in dict "w[][]" which also exist in dict "r[][]".

def prune(w, r):

    for f in r:
        if f in w:
           for n in r[f]:
               if n in w[f]: del w[f][n]

#
# Define function "referenced":
#
# This function  marks the file  specified as referenced and recursively
# marks all files referenced in the file specified as referenced, too.

png = re.compile(r'\.png$')         # To replace ".png" file extensions.

def referenced(f):

    global FlUnref, Links                  # Use globally defined dicts.

    if f in FlUnref:    # If the file is no longer unreferenced, return.
       del  FlUnref[f]

       #
       # If the file has a ".png" extension, also mark the corresponding
       # ".svg" file as referenced:

       f = png.sub('.svg', f)

       if f in FlUnref: del FlUnref[f]

       #
       # If the current file references other files,  also mark these as
       # referenced:

       if f in Links:
          for r in Links[f]: referenced(r)

#
# Define function "slugify":
#
# This function does  the same thing as the standard  "slugify" function
# built into the Markdown "toc" extension and additionally adds the Bit-
# bucket specific "markdown-header-" prefix to header line identifiers.

no = re.compile(r'[^\w\s-]+') # Non-word, non-dash, and non-space chars.
sp = re.compile(r'[\s-]+'   )       # To squeeze white space and dashes.
im = re.compile(r'!\[[^]]*\][[(][^])]+[])]')   # Remove image in header.
tl = re.compile(r' *[*_`]* *#* *$')  # Remove trailing non-header chars.

def slugify(st):

    #
    # Normalize the Unicode string, map accented characters to unaccent-
    # ed ones by temporarily  encoding the string as ASCII,  remove non-
    # word, non-dash, and non-space characters, strip white space at ei-
    # ther end, convert string to lower case,  insert Bitbucket's "mark-
    # down-header-" prefix,  and finally squeeze dashes  and white space
    # into single dashes:

    return sp.sub('-', 'markdown-header-' +
                       no.sub('',
                              unicodedata.normalize('NFKD',
                                                    im.sub('', tl.sub('', st))
                                                   ).encode('ascii', 'ignore'
                                                           ).decode('ascii')
                             ).strip().lower()
                 )

########################################################################
#
# Main program:
#
# Read in the names of tracked files from the temporary file, skip Merc-
# urial files, file "Makefile",  as well as scripts and pure text files,
# remove the extension  from "*.md" files,  and mark all  these files as
# existing but not yet referenced:

tmp = tempfile.mktemp()       # List of all tracked or all "*.md" files.
err = os.system('hg manifest > %s' % tmp)   # Get list of tracked files.

if err:
   os.remove(tmp)                                # Delete temporary file
   sys.exit(err >> 8)                                    # and bail out.

#
# Regular expression "ignore"  weeds out tracked non-documentation files
# and "md" removes a ".md" extension  from a file name together with any
# trailing line end characters.  And if the file name does not contain a
# ".md" extension the regular expression will at least remove any trail-
# ing line end characters:

ignore = re.compile(r'^\.hg|^Makefile$|\.(py|sh|txt)$') # Files to skip.
md     = re.compile(r'(\.md)?[\r\n]*$')  # To drop ".md" file extension.
trk    = codecs.open(tmp, 'r',                         # List of tracked
                     encoding='ascii')                # Mercurial files.

for ln in trk:                             # Read list of tracked files.
    if ignore.search(ln): continue

    fn          = md.sub('', ln)    # File name without ".md" extension.
    FlUnref[fn] = LkDef[fn] = 1

trk.close()                                          # Close input file.

#
# Define globally used regular expressions:
#
# The regular expression "footdef" matches  a Markdown footnote definit-
# ion, "header" matches a Markdown header line, "ignore" matches extern-
# al links, the top link "#", as well as any links ending in three dots,
# "inlref" matches inline link, reference-style link,  and footnote ref-
# erences, while "refdef" matches a reference-style link definition:

footdef = re.compile(r'^\[\^([^]]+)\]:') # Markdown footnote definition.
header  = re.compile(r'^ *#+ *[*_`]* *(.*)$')         # Markdown header.
ignore  = re.compile(r'^http|#$|\.{3}$')              # Links to ignore.
inlref  = re.compile(r'\[([^]]+)\]((\() *([^ )]+)[^)]*\)| ?(\[)([^]]*)\]|.?)')
refdef  = re.compile(r'^ {0,3}\[([^]]+)\]:\s+([^ \r\n]+)')

#
# Process all toplevel "*.md" files found in the repository:

err = os.system('ls *.md > %s' % tmp)   # List of toplevel "*.md" files.

if err:
   os.remove(tmp)                                # Delete temporary file
   sys.exit(err >> 8)                                    # and bail out.

mkd = codecs.open(tmp, 'r',                           # List of toplevel
                  encoding='ascii')             # Markdown source files.

for fl in mkd:                    # Process all toplevel Markdown files.
    fn = md.sub('', fl)       # Input file name without ".md" extension.
    sf = codecs.open(fl.rstrip(), 'r',                    # Open current
                     encoding='utf-8')           # Markdown source file.

    for ln in sf:            # Process all lines in current source file.

        #
        # A header,  a footnote  definition,  and a reference-style link
        # definition are  mutually exclusive, but the first two may con-
        # tain inline link references in the same line,  while the third
        # cannot.  Therefore only the third alternative requires a "con-
        # tinue" statement:

        m = header.match(ln)      # Test for Markdown header definition.

        if m:        # Record header identifier in this file as defined.
           LkDef['%s#%s' % (fn, slugify(m.group(1)))] = 1
        else:
           m = footdef.match(ln)       # Test for Markdown footnote def.

           if m:
              i = m.group(1)              # Get footnote name or number.

              #
              # Mark the footnote  definition link  to the current foot-
              # note as  defined and  record the  footnote identifier as
              # having been defined in the current file:

              if not fn in FnDef: FnDef[fn] = {}      # Create sub-dict.

              LkDef['%s#fn:%s' % (fn, i)] = FnDef[fn][i] = 1
           else:
              m = refdef.match(ln)  # Test for reference-style link def.

              if m:
                 if not fn in IdDef: IdDef[fn] = {}   # Create sub-dict.

                 IdDef[fn][m.group(1)] = 1

                 linkref(fn, m.group(2))    # Record ref-style link ref.

                 continue  # Ref-style link def is on a line of its own.

        #
        # Process every Markdown inline reference in the current line:

        for m in inlref.finditer(ln):    # Locate next inline reference.

            #
            # First check for a normal inline link reference,  and if we
            # found one, record it:

            if   m.group(3) == '(': linkref(fn, m.group(4))

            #
            # Next check for a reference-style link reference, and if we
            # found one,  check the reference identifier for being empty
            # before recording the reference:

            elif m.group(5) == '[':    # Reference-style link reference.
               i = m.group(6)                # Get reference identifier.

               if not i: i = m.group(1)       # If empty, use link text.

               #
               # Record the reference to the reference-style link ident-
               # ifier in Boolean dict "IdRef[][]":

               if not fn in IdRef: IdRef[fn] = {}     # Create sub-dict.

               IdRef[fn][i] = 1

            #
            # Finally check for a footnote reference:

            else:
               i = m.group(1)                 # Get footnote identifier.

               #
               # A footnote  reference identifier starting in column one
               # and being immediately followed by a colon is a footnote
               # definition and is thus skipped here.   Likewise, if the
               # first character  of the identifier is not "^",  this is
               # something else and is skipped, too:

               if m.start(1) == 1 and ln[m.end(1)+1] == ':' or i[0] != '^':
                  continue                   # Not a footnote reference.

               i = i[1:]          # Get footnote identifier without "^".

               #
               # Mark the  footnote reference  link associated  with the
               # current footnote as defined  and record the footnote as
               # having been referenced in the current file:

               if not fn in FnRef: FnRef[fn] = {}     # Create sub-dict.

               LkDef['%s#fnref:%s' % (fn, i)] = FnRef[fn][i] = 1

    sf.close()                              # Close current source file.

mkd.close()                                          # Close input file.
os.remove(tmp)                                  # Delete temporary file.

#
# Postprocess the information collected:
#
# Compare all footnote definitions to all footnote references as well as
# all reference-style link definitions  to all reference-style link ref-
# erences and report any discrepancies:

compare(FnDef, FnRef, 'footnotes'            )
compare(IdDef, IdRef, 'reference-style links')

#
# Remove all files from dict "FlUnref[]" which are recursively referenc-
# ed from within file "Home.md" (which in turn references the top docum-
# entation file "DocMain.md"):

referenced("Home")

#
# Any components left  in dict "FlUnref[]"  refer to  unreferenced files
# and are thus printed:

ext = re.compile(r'\.[a-z]+$')  # To check for existing file extensions.

if len(FlUnref):
   print('\nUnreferenced files:')
   ec = 1                                # Use non-zero exit code later.

   #
   # If the file name  already contains an extension,  use it, otherwise
   # append extension ".md":

   for fn in sorted(FlUnref.keys()):
       if ext.search(fn): print(          fn)
       else:              print('%s.md' % fn)

#
# Remove all links marked as defined in dict "LkDef[]"  from dict "Where
# []":

for lk in LkDef:
    if lk in Where: del Where[lk]

#
# Any components left in dict "Where[]" refer to non-existing link targ-
# ets and are thus printed:

if len(Where):
   print('\nBroken links:')
   ec = 1                                # Use non-zero exit code later.

   for lk in sorted(Where.keys()):
       print('%s in: %s' % (lk, Where[lk][1:]))

sys.exit(ec)
