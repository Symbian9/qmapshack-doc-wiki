########################################################################
########################################################################
##                                                                    ##
## Copyright (C) 2016 - 2017 Rainer Woitok, <Rainer.Woitok@Gmail.Com> ##
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
# Define the names of the relevant scripts  ("htm" and "nav"),  the name
# of the file  containing the  table of contents  ("cnt"),  the lists of
# files to process  ("src" and "tgt"),  the name of the  time stamp file
# used to record the date of the last call to "make nav" ("nvt", the va-
# lue of which must be mentioned in file ".hgignore"):

cnt ::= DocMain.md
htm ::= ./HtmlMake.py
nav ::= ./NavBar.sh
nvt ::= nav.time
src ::= $(wildcard *.md)
tgt ::= $(src:.md=.html)

#
# Define function "select" which  either returns only those "*.md" files
# being younger than the target, or all "*.md" files,  depending on whe-
# ther or not  the files passed  as second and third  arguments are both
# older than the file passed as first argument (this function is used in
# the "nvt" target):

select = $(if $(shell test $(2) -ot $(1) && test $(3) -ot $(1) && echo 1),$?,$(src))

########################################################################
#
# Target rules:

.PHONY: check clean doc help nav

#
# Default rule  to display  "help" output  (mind that  the initial white
# space in the arguments for the "echo" commands consists of a tab char-
# acter!):

help:
	@echo '	make check  # Check for dead files and broken links.'     ; \
	 echo '	make clean  # Discard all "*.html" and time stamp files.' ; \
	 echo '	make doc    # Update all outdated "*.html" files.'        ; \
	 echo '	make [help] # Display this text.'                         ; \
	 echo '	make nav    # Sanitize all changed "*.md" files.'         ; \

#
# Rule to check for unreferenced local files,  undefined local links, as
# well as for self references:

check:
	@./LinkCheck.py

#
# Rule to remove all "*.html" files as well as any time stamp files:

clean:
	rm -f $(tgt) $(nvt)

#
# Rule to update all outdated "*.html" files:

doc: $(tgt)

#
# Rule to create  a single  "*.html" file from its  Markdown source file
# "*.md" (we also have  to re-create the "*.html" file,  should the con-
# version script change):

%.html: %.md $(htm)
	$(htm) $< > $@

#
# Rule to update the navigation bars in the "*.md" source files:

nav: $(nvt)

#
# Rule to either recreate the navigation bars in those "*.md" files hav-
# ing changed since the time of the last recreation,  or all "*.md" fil-
# es, if the source file containing the table of contents  or the script
# generating the navigation bars  has changed since then  (the recipe is
# using function "select" defined above to determine the set of files to
# be processed):

$(nvt): $(cnt) $(nav) $(src)
	@for f in $(call select,$(nvt),$(cnt),$(nav))  ; \
	 do echo $(nav) $(cnt) $$f ; $(nav) $(cnt) $$f ; \
	 done                                          ; \
	 echo 'Last modified by "make nav".' > $(nvt)
