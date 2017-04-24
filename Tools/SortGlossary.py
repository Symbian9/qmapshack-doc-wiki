#!python3
# -*- coding: utf-8 -*-

# Sort QMS glossary

'''
Additional Glossary format rules:

Definition term must be in the form: 

**Term**

on a line by itself followed by a line that starts with a colon and one or several spaces:

: definition of term
  additional line
  
Additional lines in a term definition must be indented.

At the end of a term definition block there must be one or several empty lines.
Empty lines are allowed in the term definition block.

If any lines follow the glossary (e.g. navigation bar) then the first of these lines should not be indented.

'''

import os
import re

def sortentries(key):      # key used for sorting entries list
  return key[0].lower() 

r1 = re.compile(r"(^\*\*[^*]+\*\*\s*$)", re.MULTILINE ) # line with term definition
r2 = re.compile("\n[^ :]")                              # not a term definition line

# split whole file into header - body - footer parts
r3 = re.compile("(?P<header>.*# Glossary\s*)(?P<body>[^\s].*?)(?P<footer>- - -.*$)", re.DOTALL | re.MULTILINE )
# split whole file into header - body. footer missing
r4 = re.compile("(?P<header>.*# Glossary\s*)(?P<body>[^\s].*?)(?P<footer>- - -.*$)", re.DOTALL | re.MULTILINE )

GLOSSARYFILE = "AxGlossary"                             # name of glossary file

# rename input file temporarily
os.replace("../%s.md" % GLOSSARYFILE, "%s_unsorted.md" % GLOSSARYFILE)

inpf = open("%s_unsorted.md" % GLOSSARYFILE, encoding = "utf-8")
outpf = open("../%s.md" % GLOSSARYFILE, "w", encoding="utf-8")

lines = inpf.read()

# split into header - body - footer
r = r3.search(lines)

if r:
  header = r.group("header")      # header: everything in front of first term definition
  body = r.group("body")          # all term definitions
  footer = r.group("footer")      # everything starting with "- - -" at end of file 

else:
  r = r4.search(lines)  
  header = r.group("header")      # header: everything in front of first term definition
  body = r.group("body")          # all term definitions - proper glossary part
  footer = ""                     # no navbar footer 
  
splitted = r1.split(body)[1:] # remove empty element at start and split at term definitions
  
# handle definition list entries  
entries = []

while splitted:
  term = splitted.pop(0)
  try:
    defterm  = splitted.pop(0)   
  except:
    print ("*******", term)
  entries.append((term, defterm))  # build list from terms and definitions
 
entries = sorted(entries, key=sortentries) # sort by term (lower)

# write header, sorted output, footer
outpf.write(header)

for e in entries:
  outpf.write("%s%s" % e)    

outpf.write(footer)
  
inpf.close()
outpf.close()

os.remove("%s_unsorted.md" % GLOSSARYFILE) # remove temporary file