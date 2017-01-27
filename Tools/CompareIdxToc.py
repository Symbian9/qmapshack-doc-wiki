#!python3
# -*- coding: utf-8 -*-

# Find inconsistencies between the TOC in AxAdvToc.md and AxData4Index.txt

import difflib
import re

tocfile = r"../AxAdvToc.md"             # complete TOC file 
idxfile = r"AxData4Index.txt"            # raw index file

r2 = re.compile("^[-+]*\s*$")  # result lines of diff with "+" or "-" in first position and empty in the rest

r3 = re.compile("^\s*\*\s+\[")  # TOC line in DocMain & AxData4Index

def gen_toclines(inpfile):      # find TOC lines in input files - generator used as a filter
  for lne in inpfile:          
    if r3.search(lne):          # skip non-TOC lines
      yield lne.strip()

oidxfile = open(idxfile, encoding="utf-8")
otocfile = open(tocfile, encoding="utf-8")
    
# Differ reuqires lists    
idxtoc = list(gen_toclines(oidxfile))
toctoc = list(gen_toclines(otocfile))

d = difflib.Differ()
res = d.compare(idxtoc, toctoc)        # carry out a diff

for r in res:
  if not r2.search(r) and r[0] != " ": # find important (+ or -) diff lines
     if not "* [Installing QMapShack]" in r and not "* [Using QMapShack]" in r: # these lines are there for hierarchy reasons only!
       print(r)    
 
print("\nEnd of run.") 
