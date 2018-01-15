#!python3
# -*- coding: utf-8 -*-

# Create AxAdvToc.md containing links to all header lines in all QMS Wiki pages

# Script only tested with Windows7 and Python 3.3!

# Script is based on the following assumptions about the formatting of used files
# * indentation in DocMain is with 4 spaces
# * subsections in MD files have header lines with one more "#" than parent section

# The following formattings are handled correctly by this script:
# * Top-level entries in the DocMain TOC list without a link 
# * Section headers with included images
# * Section headers with "#" at the end

import os
import fnmatch
import re
import unicodedata

# define folder to be considered
filedir = r".."  

# name of complete table of contents file
outf = r"../AxAdvToc.md"
# name of DocMain page
docmainfile = r"../DocMain.md"

# find [..](..) link expression in DocMain TOC line
# matches:   * [Create Offline Documentation](OfflineDocumentation)          
r1 = re.compile("(\s*)\*\s+\[([^]]*)\]\(([^)]*)\)")         
  
# find line in DocMain TOC without link
# matches:   * Using QMapShack 
r2 = re.compile("(\s*)\*\s+(.+)$")
  
# find ## subsections in DocMain and in MD files
# matches:   ## __Advanced usage__          
r3 = re.compile("^\s*##\s+.*$")
  
# delete image links in section headers
# matches:   ## ![EditDetails](images/DocGisItemsWpt/EditDetails.png) View / Edit Details
r4 = re.compile("\!\[[^]]*\]\([^)]*\)")
  
# delete ## at end of line
# matches:   ## Track Details Dialog ## 
r5 = re.compile("#+\s+$")


# build MD reference from given string using separator as word separator (taken from HtmlMake.py)
def slugify(value, separator):
    value = unicodedata.normalize('NFKD', value).encode('ascii', 'ignore') # Ergebnis ist string
    value = re.sub('[^\w\s-]', '', value.decode('ascii')).strip().lower() # beseitige einige nicht gewollte Zeichen

    # Insert Bitbucket's "markdown-header-" prefix  and squeeze separat-
    # ors and white space:

    return re.sub('[%s\s]+' % separator, separator, 'markdown-header-' + value) # sorge für saubere separators und hänge Präfix davor

     
# read TOC from open DocMain.md    
def gen_pageorder(docmain, outpf):
  for lne in docmain:
    rr = r1.search(lne)
    if rr:                                  # TOC line with link
      outpf.write("%s" % lne)               # this page link should be in the output (link to top of page) 
      yield rr.groups()                     # ("   ", 'General topics', 'AdvTrkGeneral')
    
    else:
      rr = r2.search(lne)                  
      if rr:                                # TOC list line without link
        outpf.write("%s" % lne)      

      else:        
        rr = r3.search(lne)
        if rr:                              # subsection in TOC
          outpf.write("\n\n%s\n\n" % lne)    
      
# open each MD file (filenames: (("    ", 'Working with projects', 'ProjActions'), ...)     
def gen_open(filenames):
  for name in filenames:
    yield (open("%s/%s.md" % (filedir, name[2]), encoding="utf-8"), name[0]) # name0 = "    "     

# find each line in each open files    
def gen_cat(sources):
  for s in sources:                   # loop over files
    for item in s[0]:                 # loop over lines of file
      yield (item, s[0].name, s[1])   # yields each line of each file with a link together with its filename and "    "
   

# input: sequence of (MD_link_line, filename) as generated by gen_cat      
# output: printable MD line with link
def gen_output(lines):      
  for lne in lines:
    lnk = lne[0]                            # MD file line   
    
    rr = r3.search(lnk)
    if rr:                                  # subsection header
      lnk = r4.sub("", lnk)                 # remove possible image link
     
    lnk = r5.sub("", lnk)                   # remove "#" at line end
    
    if lnk.startswith("##"):                # section header line but not top header
      f = lne[1].split("/")[-1][:-3]        # get filename for given line without folder 
      prefix = lne[2] + "    " * (lnk.count("#")-1) + "*" # build list prefix, lne[2] is indentation coming from DocMain
      lnk = re.sub("#+ *", "", lnk[:-1])    # remove section header markers from line 
      lnk1 = slugify(lnk, "-")              # build MD link label
      yield "%s [%s](%s#%s)\n" % (prefix, lnk, f, lnk1) # line for MD output   

#-------------------------------------------------------------------------

# open output file - start with new name, rename at the end - otherwise a file is read and written at the same time!
outpf = open("%s.tmp" % outf, "w", encoding="utf-8")
outpf.write("# Complete table of contents\n\n___Do not edit - automatically created from DocMain!___\n" )

# open DocMain 
docmain = open(docmainfile, encoding="utf-8")   
  
# get entries from TOC of DocMain
toc_entries = gen_pageorder(docmain, outpf) 

# open all referenced MD file in the order given by DocMain
openmdfiles = gen_open(toc_entries)
  
# join all referenced MD files (Linux cat!)
catopenmdfiles = gen_cat(openmdfiles)

# get necessary output lines = lines with links from TOC and prepare output for printing
lnklines = gen_output(catopenmdfiles)

for l in lnklines:
  outpf.write(l)  

docmain.close()                             # don't close to early - generators must work first!  
outpf.close()    

os.replace("%s.tmp" % outf, outf)

