[Prev](DevelopingDocumentation) (Developing Documentation) | [Home](Home) | [Manual](DocMain) | [Index](AxAdvIndex) | (Maintaining the QMS Wiki Index) [Next](AxMaintainIndex)
- - -
[TOC]
- - -

_Attention: This page contains examples for formatting links. The anchors of these links don't exist. To avoid that these
links cause problems with the scripts `LinkCheck.sh` and `HtmlMake.py` a point is added in the middle of some file names and 3 points are added
at the end of a reference!_

# Recommendations for editing QMS Wiki pages

This page is a collection of recommendations for people editing the QMS manual.
Special attention is paid to the handling of automatically created pages.

A detailed description of handling the manual index page can be found
[here](AxMaintainIndex "Maintaining the QMS Wiki Index"). The user is advised to read
the preface section of that page.


## General recommendations for editing the manual

* The editor used for editing some text in the manual must use UTF-8 encoding (without BOM). Other encodings
  (such as Latin1) are not allowed even when using ASCII characters only! Others might have used non-ASCII
  characters!

* An MD page should have __exactly one__ top-level section, i.e. a line of the form

        # Header_of_page

  Other sections of the page should be subsections of the header (section) and form a tree structure.

* An MD page should normally appear in the main table of contents in `DocMain`. *Header_of_page* should
  be used also as text in the `DocMain` entry for this page.

* Avoid complicated/extra formatting in section headers. Make them short but concise.

* The format of links should be as follows:

        [short_link_description](relative_path_to_section... "longer_link_description")

    * The _short_link_description_ should formulated so that the phrase in which the link appears is well-formatted.
    * The _longer_link_description_ can be used for a more detailed description of the content of the link.
      It is displayed as caption.

* The format of image links should be as follows:

        ![short_image_description](relative_path_to_image... "longer_image_description")

    * The _short_image_description_ should give a short description of the content of the image.
    * The _longer_image_description_ can be used for a more detailed image description. It is displayed as
      image caption.

* As a Windows user you should edit normal Wiki pages (not automatically created ones!) and upload them to the Bitbucket repository even if you can't run
  the tools for maintaining the navigation bars of pages (the so-called _Navbar_ tools) or other tools for
  creating Wiki pages.

* The Python scripts mentioned on this page are tested with Python 3.3 under Windows. Other Python versions supporting the
  Python 3 syntax and generators and other operating system can be tried but are not tested.



## More recommendations

* Files edited in Windows have Windows line ends. Thus, on the server side MD files might have both Unix- and Windows-like
  line ends. This is tolerated by the Navbar tools. Bitbucket can handle MD files with both types of
  line ends. There is no need for special line end configurations in your editor.

* New pages can only be created by users being capable of running the Navbar tools. If you can't run these tools,
  ask a user who can run the tools to help you.

* Changes to the table of contents in DocMain that involve changes in the navigation bars are only possible if the
  user can execute an update of the navigation bars. If you can't run these tools,
  contact a user who can run the tools to help you.


## Workflow after editing page

This section describes the necessary workflow after making some special changes in manual pages.

* In the case that you have to run a script mentioned in this section carry out the following steps:

    * Open a command line window.
    * Change to the `doc\Tools` folder and run the Python scripts from this folder.
    * If you want to run the navbar tools, then change to the `doc` folder and run the scripts from this folder.

* Change of a section header, new section, or change in the table of contents of the manual main page
  `DocMain`:

  This leads to a change in the automatically created complete table of contents. Run the Python script
  `BuildToc.py` to update the complete table of contents.

* Change of a link to another manual page (some basic knowledge of HTML required):

  Subsections of the manual can be used as targets for links. A special marker is added by the Markdown processor
  to each section header. This marker can be found as follows:

  * Open the on-line Wiki page in your browser.
  * Open the source text of this page.
  * Find the wanted section header in the source text.
  * The `<a href="#markdown-header-some_text">` string in front of the section header shows the quoted marker.

* Change of an image link:

  If the change is in the "_Advanced_" resp. "_FAQ_" parts of the manual, then you should run  the Python script
  `BuildImgLink.py` which updates the list of used images in the manual.

  Be sure the updated image is under version control.

* Change of index entries:

  Refer to this  [page](AxMaintainIndex "Maintaining the QMS Wiki Index") for details.


* You should run the navbar tool `make nav` to update navigation bars after changing the table of contents,
  the image links, or the index page. Automatically (re-)created pages don't have navigation bars.

* Upload to Bitbucket


## Formatting rules:

Here are some recommendations for formatting some typical text strings:

* File reference:

         `file_reference`

* Menu reference:

         `File - Save`



## Comments on some script-created pages in the Appendix part

All Python scripts are written for Python 3.3 and use only modules from the standard distribution

__Attention:__ Manual pages created by one of the discussed Python scripts do not have navigation bars! To insert
the navigation bars you have to run the navbar tools!

### BuildImgLink.py and AxWikiImages.md

* The Python script (re-)creates the mentioned manual page.
* The page lists of all images used in the _Advanced usage_ and _FAQ_ parts of the manual in form of links and it
  shows the source page of the image link. Other parts of the manual are not considered by various reasons.

* It is assumed that all image files can be found in the `doc\images\FAQ` and `doc\images\DocAdv` folders.

* If an image link in the page is clicked, the image is displayed in a browser window.

* The page on which the image link is found is given next to the image as a link.
* The Python script must be re-run if an image link has changed in one of the scanned pages.
* The script displays in a console window a list of used and unused images in the `doc\images\FAQ` and `doc\images\DocAdv`
  folders.
* Don't use the local Markdown variant of the file - it doesn't have the correct link form. Correct links can be found
  either in the on-line Bitbucket Wiki or in the off-line HTML form of the page!

### BuildToc.py and AxAdvToc.md

* The Python scripts creates the mentioned manual page which displays a complete table of contents of the manual.
* Formatting requirements are described in `BuildToc.py`.
* The script must be re-run if the table of contents in `DocMain` or the (sub-)section structure of some page has changed.

### SortGlossary.py and AxGlossary.md

`AxGlossary` is a manually maintained glossary page for the manual. The glossary entries are alphabetically ordered.
The mentioned Python script re-establishes this order if it was destroyed while editing.

The glossary entries are formatted as a definition list with the following rules:

* The glossary term `**Term**` should be on a separate line followed by a line that starts with a colon and
  one or several spaces:

        **Term**
        : definition of term
          additional term definition line

* Additional lines in a term definition must be indented.
* At the end of a term definition block there must be one or several empty lines.
* Empty lines are allowed in the term definition block.
* If any lines follow the glossary (e.g. navigation bar lines), then the first of these lines should not be indented.






- - -
[Prev](DevelopingDocumentation) (Developing Documentation) | [Home](Home) | [Manual](DocMain) | [Index](AxAdvIndex) | [Top](#) | (Maintaining the QMS Wiki Index) [Next](AxMaintainIndex)
