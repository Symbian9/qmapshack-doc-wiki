########################################################################
########################################################################
##                                                                    ##
## Copyright (C) 2016 Rainer Woitok, <Rainer.Woitok@Gmail.Com>        ##
##                                                                    ##
## This makefile  is free software:  you can  redistribute it  and/or ##
## modify it  under the terms  of the  GNU General  Public License as ##
## published by the Free Software Foundation, either version 3 of the ##
## License, or (at your option) any later version.                    ##
##                                                                    ##
## This makefile  is distributed  in the hope that it will be useful, ##
## but WITHOUT  ANY WARRANTY;  without even  the implied  warranty of ##
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.   See the GNU ##
## General Public License for more details.                           ##
##                                                                    ##
## You should have received a copy  of the GNU General Public License ##
## along with this file.  If not, see                                 ##
##                                                                    ##
##        <http://www.gnu.org/licenses/>                              ##
##                                                                    ##
########################################################################
########################################################################
#
# Makefile for managing  creation of the "*.html" files  from their cor-
# responding "*.md" Markdown source files.
#
#                                                    R Woitok 2016-03-04
#
########################################################################
#
# Variables:
#
# Define the paths to the relevant scripts  ("fix",  "htm",  and "nav"),
# the name  of the file containing  the table of contents ("cnt"), both,
# the original ("UBU") and the blank free ("ubu")  name of the "Ubuntu*.
# md" source file, the lists of files to process  ("src" and "tgt", both
# featuring the blank free "Ubuntu*.*" names obtained by using the comm-
# ands "ls" and "sed"  in a shell,  because the "make" specific function
# "patsubst" only operates  on blank free words),  the names of the time
# stamp files used internally to record various actions ("fxt" and "nvt"
# the values of which  must be mentioned  in file ".hgignore"),  and the
# name of the Mercurial command ("HG"), if we are executing in a Mercur-
# ial repository's main directory:

cnt ::= DocMain.md
fix ::= ./DocFix.sh
fxt ::= fix.time
HG  ::= $(shell [ -d .hg ] && echo hg)
htm ::= ./HtmlMake.py
nav ::= ./NavBar.sh
nvt ::= nav.time
Ubu ::= $(wildcard Ubuntu*.md)
ubu ::= Ubuntu-14.04-HowTo.md
src ::= $(shell ls *.md | sed 's/^$(Ubu)$$/$(ubu)/')
tgt ::= $(src:.md=.html)

#
# Define function "select" which  either returns only those "*.md" files
# being younger than the target, or all "*.md" files,  depending on whe-
# ther or not  the files passed  as second and third  arguments are both
# older than the file passed as first argument (this function is used in
# the "fxt" and "nvt" targets):

select = $(if $(shell test $(2) -ot $(1) && test $(3) -ot $(1) && echo 1),$?,$(src))

########################################################################
#
# Target rules:

.PHONY: clean doc fix help nav

#
# Default rule to update all outdated "*.html" files:

doc: nav $(tgt)

#
# Rule to check for unreferenced local files,  undefined local links, as
# well as for self references:

check:
	@./LinkCheck.sh

#
# Rule to remove all "*.html" files as well as any time stamp files:

clean:
	rm -f $(tgt) $(fxt) $(nvt)

#
# Rules to rename file "Ubuntu*.md", if not yet done, and to fix the in-
# dividual "*.md" Markdown source files so they are usable locally (this
# rule is  implicitly called  as prerequisite  by both rules,  "doc" and
# "nav", and thus there's hardly any need to call it directly):

fix: $(ubu) $(fxt)

#
# Rule to either fix all  "*.md" files having changed  since the time of
# the last fixing,  or all "*.md" files,  if the script performing these
# fixes has  changed since then  (the recipe is using  function "select"
# defined above to determine the set of files to be processed):

$(fxt): $(fix) $(src)
	@for f in $(call select,$(fxt),$(fix),$(fix)) ; \
	 do echo $(fix) $$f ; $(fix) $$f              ; \
	 done                                         ; \
	 echo 'Last modified by "make fix".' > $(fxt)

#
# Rule to display  "help" output  (mind that the  initial white space in
# the arguments for the "echo" commands consists of a tab character!):

help:
	@echo '	make check # Check for dead files and broken links.'     ; \
	 echo '	make clean # Discard all "*.html" and time stamp files.' ; \
	 echo '	make [doc] # Update all outdated "*.html" files.'        ; \
	 echo '	make help  # Display this text.'                         ; \
	 echo '	make nav   # Sanitize all changed "*.md" files.'         ; \

#
# Rule to create  a single  "*.html" file from its  Markdown source file
# "*.md" (we also have  to re-create the "*.html" file,  should the con-
# version script change):

%.html: %.md $(htm)
	$(htm) $< > $@

#
# Rule to update  the navigation bars in the  "*.md" source files  (this
# rule is implicitly called as prerequisite  by rule "doc", and explicit
# use of it is required only when no "*.html" files should be created):

nav: fix $(nvt)

#
# Rule to either recreate the navigation bars in those "*.md" files hav-
# ing changed since the time of the last recreation,  or all "*.md" fil-
# es, if the source file containing the table of contents  or the script
# generating the navigation bars  has changed since then  (the recipe is
# using function "select" defined above to determine the set of files to
# be processed,  and since the  "nav" target  has the  "fix" target as a
# prerequisite, the changes  made by  this rule  should not  again cause
# "make fix" to process any files):

$(nvt): $(cnt) $(nav) $(src)
	@for f in $(call select,$(nvt),$(cnt),$(nav))  ; \
	 do echo $(nav) $(cnt) $$f ; $(nav) $(cnt) $$f ; \
	 done                                          ; \
	 echo 'Last modified by "make nav".' | tee $(fxt) > $(nvt)

#
# Rule to make the name of the "Ubuntu*.md" file blank free, either in a
# Mercurial repository or in a normal directory:

$(ubu):
	$(HG) mv "$(Ubu)" $(ubu)
