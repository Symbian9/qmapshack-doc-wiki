#!python3
# -*- coding: utf-8 -*-

# Find direct changes in AxAdvIndex.md 

# manually copy last version of AxAdvIndex.md to Tools folder and then run this script!

import difflib
import re

idxfile = r"AxAdvIndex.md"            # last version of index file from Bitbucket copied to this location
idxsrcfile = r"../AxAdvIndex.md"      # new index file created by script from raw index

# parse index definition line
# **Activity, assign color to**
r1 = re.compile("^\s*\*\*([^*]+)\*\*")    

# parse link line
# :  [Assign colors to track activities](AdvTrkGeneral#markdown-header-assign-colors-to-track-activities "Assign colors to track activities") ⊞ [Track activity](DocGisItemsTrk2#markdown-header-activity "Track details, activity tab")
r2 = re.compile("^\s*:\s+\[[^\]]+\]\([^\)]+\)")

# delete : part at start
r3 = re.compile("^\s*:\s+")

r4 = re.compile("^[-+]*\s*$")  # result lines of diff with "+" or "-" in first position and empty in the rest

# define separator of link entries
LF0 =  " %s " %  (u'\u229e',) # framed cross, possible also: 20de diamond open, 25c6 diamond filled

oidxfile = open(idxfile, encoding="utf-8")
oidxsrcfile = open(idxsrcfile, encoding="utf-8")

def ParseIndex(ofile):
  idxlist = []
  for lne in ofile:
    rr = r1.search(lne)
    if rr:
      lastidx = rr.group(1)
     
      continue  
    
    rr = r2.search(lne)
    if rr:
      lne1 = r3.sub("", lne, 1)   # delete : at start
      lne1 = lne1.replace("\n","")
       
      lne2 = lne1.split(LF0)
    
      for l in lne2:
        idxlist.append("%s ---> %s" % (lastidx, l))
    
  idxlist.sort()
  
  return idxlist

ilist = ParseIndex(oidxfile)
isrclist = ParseIndex(oidxsrcfile)
       
d = difflib.Differ()

res = d.compare(ilist, isrclist)        # carry out a diff

# - line: missing in raw index - should be checked and most likely added to raw file
# + line: missing in edited index - will appear after next update from raw file - nothing to do, just info
# ? line: if + and - for similar/same line: position of difference - check differences and update raw file if necessary

for r in res:
  if not r4.search(r) and r[0] != " ": # find important (+ or -) diff lines, suppress equal lines 
    print(r)   
    
print("\nEnd of run.")    