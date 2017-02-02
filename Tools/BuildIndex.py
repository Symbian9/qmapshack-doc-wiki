#!python3
# -*- coding: utf-8 -*-

# Convert raw index info from AxData4Index.txt into formatted MD page AxAdvIndex.md

'''
Structure of AxData4Index.txt:
-----------------------------

* [Test](TestPage#label)   <-------- Taken from section headers - don't change
+ kurzer Linktext          <-------- insert short but concise link text (optional)
++ längere Linkcaption     <-------- insert longer link description, appears as caption text (optional)
    1. MainIndex|subindex  <-------- MainIndex must be sortable!
    1. MainIndex2
    1. MainIndex3|
    1. MainIndex
    
* [Test1](TestPage1#label)
+ kurzer Linktext1
++ längere Linkcaption1    
    1. MainIndex|subindex  <-------- Mainindex with capital letter, subindex with small one as a rule
    1. MainIndex1|subindex1
    
Struture of AxAdvIndex.md:
--------------------------

**MainIndex**
:  [kurzer Linktext](TestPage#label "längere Linkcaption")

**MainIndex, subindex**
:  [kurzer Linktext1](TestPage1#label "längere Linkcaption1") ⊞ [kurzer Linktext](TestPage#label "längere Linkcaption")

**MainIndex1, subindex1**
:  [kurzer Linktext1](TestPage1#label "längere Linkcaption1")

**MainIndex2**
:  [kurzer Linktext](TestPage#label "längere Linkcaption")

**MainIndex3**
:  [kurzer Linktext](TestPage#label "längere Linkcaption")

'''

import os
import re

# names of index files
indexfile = r"../AxAdvIndex.md"
rawindexfile = r"AxData4Index.txt"

def sortentries(key):              # key used for sorting entries list (lowercase index)
  return key[0].lower() 

# match TOC line of form "* [General topics](AdvTrkGeneral#xxxx)"
r1 = re.compile("\*\s+\[([^]]*)\]\(([^]]*)\)") # find link target from TOC

# match line of form "1. Waypoint|attached to track"
r2 = re.compile("1\.\s*([^|]*)\|?(.*)")         # find index entry

r3 = re.compile('["(]')                         # used for removing link caption from some strange header lines

# match link text line of form "+ Linktext"
r4 = re.compile("^\s*\+\s+(.*)")

# match link caption line of form "++ Linkcaption"
r5 = re.compile("^\s*\+\+\s+(.*)")

# open file with basic index info 
idxmain = open(rawindexfile, encoding="utf-8")

idxlistd = {}

cnt = 0                              # total number of index entries found in basic index info

for lne in idxmain:
  rr = r1.search(lne) # match TOC line
  if rr:
    currentpage = list(rr.groups())  # found line from TOC. currentpage = ('Test', 'TestPage#label')
    currentpage.reverse()
    continue

  rr = r4.search(lne)                # match link text line
  if rr:
    currentpage.append(rr.group(1).strip())
    continue

  rr = r5.search(lne)                # match link caption line
  if rr:
    currentpage.append(rr.group(1).strip())  # ['TestPage#label', 'Test', 'Linktext', 'Linkcaption']
    continue
    
  rr = r2.search(lne)          
  if rr:                             # found line with index entry
    cnt += 1
    link = currentpage[0]
    if len(currentpage) == 4:        # linkcaption found - use it
      linkcaption = currentpage[3]
      linktext = currentpage[2]
      
    elif len(currentpage) == 3:      # no linkcaption - use linktext instead
      linkcaption = currentpage[2]
      linktext = currentpage[2]
      
    else:                            # neither linkcaption nor linktext found - use text (section name) of link
      if not r3.search(currentpage[1]):
        linkcaption = currentpage[1]
        linktext = currentpage[1]    
        
      else:                          # replace strange section header with "-" to avoid formatting problems
        linkcaption = "-"
        linktext = currentpage[1]
        
    lnk = '[%s](%s "%s")' % ( linktext.strip(), link, linkcaption.strip()) # complete link
    mainidx = rr.group(1).strip()
    subidx = rr.group(2).strip()
    
    idx = '**%s, %s**' % (mainidx, subidx) if subidx else '**%s**' % mainidx # complete index term (subidx can be missing!)
    idxlistd.setdefault(idx, []).append(lnk) # dictionary of index entries: {'**Index, subindex**': [link1, ...]
 
print("\nTotal number of index entries:   %3d." % cnt)

# open output file 
outpf = open(indexfile, "w", encoding="utf-8")
  
# prepare data for output  
idxlistd = list(idxlistd.items())
idxlistd = sorted(idxlistd, key=sortentries) # sort by index term (lower)

# define separator of link entries
LF0 =  " %s " %  (u'\u229e',) # framed cross, possible also: 20de diamond open, 25c6 diamond filled

# write header to output
outpf.write("\n# Index\n\n")
outpf.write(''' 
_Each entry of this page consists of the name of the index entry in a separate line in the form_

"__**IndexName, subindexname**__"

_followed by a comma-separated list of links to manual (sub-)sections where this topic is discussed._

_The index is in alphabetical order._

_The symbol_ "%s" _is used as a separator in the case that several links belong to a given index entry._

------

------

''' % LF0)

idxtoc = {}   # list used for Index TOC (capital first letters of index entries) in form of link

for x in idxlistd:
  if x[0][2] not in idxtoc:
    idxtoc["[%s](#markdown-header-%s)" % (x[0][2].upper(), x[0][2].lower())] = x[0]

usedletters = list(idxtoc.keys())   
usedletters.sort()                                          # sorted list of used first uppercase letters
usedletters = " ".join(usedletters)

outpf.write("\n\n%s\n\n------\n\n------\n\n" % usedletters) # line with links to uppercase characters
  
lastused = None                                             # marker for new first letter  

print("Number of entries in index file: %3d." % len(idxlistd)) 

# write index as definition list
for x in idxlistd:
  if not lastused == x[0][2].upper():       # new first letter
    lastused = x[0][2].upper()
    outpf.write("\n\n## %s\n\n" % lastused)  # output of capital letter as section header
    
  xx = x[1]
  xx.sort()  
  LF1 = LF0.join(xx)                        # join links with selected separator 
  outpf.write("\n%s\n:  %s\n" % (x[0],LF1)) # write complete index entry

outpf.close()  

