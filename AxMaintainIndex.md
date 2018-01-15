[Prev](AxMaintainAutoPages) (Recommendations for editing QMS Wiki pages) | [Home](Home) | [Manual](DocMain) | [Index](AxAdvIndex) | (Playground - start your new Wiki page) [Next](DocPlayground)
- - -
[TOC]
- - -

_Attention: This page contains examples for formatting links. The anchors of these links don't exist. To avoid that these
links cause problems with the scripts `LinkCheck.sh` and `HtmlMake.py` a point is added in the middle of some file names and 3 points are added
at the end of a reference!_

# Maintaining the QMS Wiki Index

This page describes how to maintain (edit) the index of the QMS Wiki.

## Preface

* As a reader of the QMS manual (the Wiki) you are encouraged to contribute to the manual if you see a need for improvement.
  Make any changes to the text and its formatting that you feel necessary. If possible comply with the
  following rules and recommendations when editing the manual. Look how others formulated and formatted manual pages!

* Some manual pages are built automatically from the content of other pages. Some if these pages shouldn't be modified
  because their contents are automatically created (`AxAdvToc`, `AxWikiImages`). Others (`AxAdvIndex`) can be changed
  when complying with certain rules described in this page.

* The use of some tools for completing or improving the contents of manual pages is mentioned throughout this page.
  It is an advantage if you can run these tools when editing a page, but this is not a must. In some special
  cases described later it is recommended to contact a user who can run the tools to help you.

* _Remember:_
    * The (on-line) manual is maintained with the help of the Bitbucket version control system. Any change you make can
      be undone. _You can never make irreversible changes to the (on-line) manual!
      You never can destroy manual pages forever!_
    * The editor used for editing some text in a manual page must use UTF-8 encoding (without BOM). Other encodings
      (such as Latin1) are not allowed even when using ASCII characters only! Others might have used non-ASCII
      characters!

## Short description of index maintenance

The QMS index is saved in the Wiki page `AxAdvIndex.md` (the so-called _index file_ or _index_). This page is
created with the help of a Python script from the file `AxData4Index.txt` (the so called _index raw file_ or
_raw index_). The preferred procedure for editing the index is

* to make the required changes in the raw index,
* to run the Python script,
* to publish the edited index (push it into the Bitbucket repository).

This procedure guarantees consistency between the raw index and the index.

Index definitions in the raw index are attached to the (sub-)sections of the manual. Subsections of the manual may
change. This leads to inconsistencies between the table of contents of the manual (a list of subsections and their
headers) and the raw index.

You can edit the index itself, too. Doing so leads to inconsistencies between the index and its raw index.

Both types of inconsistencies can be identified with the help of Python scripts. Using the script results
you should manually adjust/edit the raw index in order to remove the inconsistencies.

## Structure of the raw index

The raw index is saved in the file `AxData4Index.txt`. It is formatted in the Markdown format.
This page is not part of the manual. It is not referenced from the manual main page.

Index entries in the raw index should be defined on a per-section basis as follows:

    * [Test](Test.Page#markdown-header-label...)   <-------- link taken from section headers - don't change
    + Short Linktext           <-------- insert short but concise link text (optional)
    ++ Longer Linkcaption      <-------- insert longer link description, appears as caption text of the link (optional)
        1. MainIndex|subindex  <-------- MainIndex must be sortable!
        1. MainIndex2          <-------- subindex part missing (optional)
        1. MainIndex3|         <-------- possible variant of previous line
        1. MainIndex

    * [Test1](Test.Page1#markdown-header-label...)
    + Short Linktext1
    ++ longer Linkcaption1
        1. MainIndex|subindex  <-------- MainIndex with uppercase first character, subindex lowercase as a rule
        1. MainIndex1|subindex1

The lines with the "__*__" marker are subsection header lines from the manual pages. __Remark:__ Be careful to
get the correct label part - it has a special form for subsections! You can find it by comparing the HTML
version of the page.

The lines with the "__1.__" marker are index entries for the given subsection.

The text in the line with the "__+__" marker is used as link text in the index. It defaults to the section header
text in the "__*__" line. Make this text short and concise.

The text in the line with the "__++__" marker is displayed when moving the mouse on the link in the index. It can be
more detailed than the short text in the "__+__" line. This line requires a "__+__" line in front of it.

The order of the blocks in the raw index (starting with a "__*__"  line is the order of the table of contents
of the manual. The content of this line (the `[...](...)`part) is exactly the one used in the table of contents
of the manual which can be found in the automatically created manual page `AxAdvToc.md`.

## Structure of the index

The index is formatted as Markdown definition list.

After running the Python script `BuildIndex.py` the 2 blocks of index definitions in the previous section result in the
following part of the definition list in the index:


    **MainIndex**
    :  [Short Linktext](Test.Page#markdown-header-label... "longer Linkcaption")

    **MainIndex, subindex**
    :  [Short Linktext1](Test.Page1#markdown-header-label... "longer Linkcaption1")
        ⊞ [Short Linktext](Test.Page#markdown-header-label... "longer Linkcaption")

    **MainIndex1, subindex1**
    :  [Short Linktext1](Test.Page1#markdown-header-label... "longer Linkcaption1")

    **MainIndex2**
    :  [Short Linktext](Test.Page#markdown-header-label... "longer Linkcaption")

    **MainIndex3**
    :  [Short Linktext](Test.Page#markdown-header-label... "longer Linkcaption")

If several links are shown for an index entry, this means that the index entry is discussed in different subsections of the
manual. In this case the "⊞" character is inserted as a separator between links.

### Editing an existing index entry

The normal way of defining or editing an index entry is to
edit the raw index and after that to recreate the index with the help of a script.

If you found an index entry "__MainIndex, subindex__" in the index that you want to edit it, proceed as follows:

* Find the text string "__MainIndex, subindex__" in the index file.
* Select the link part of the index entry (the subsection to which the index entry belongs), e.g.

        [Short Linktext](Test.Page#markdown-header-label... "longer Linkcaption")

* Open the raw index in an editor and find the link part (the `TestPage#label` part).
  There should be exactly 1 line with a "__*__"
  marker and the given link part. If not then there is some inconsistency between the index and the raw index.
  Go to section [Consistency checks](#markdown-header-consistency-checks)
  first and remove the inconsistencies. Then continue here.
* Find in one of the following lines with a "__1.__" marker the text string "__MainIndex, subindex__".
* Now you can edit

    * the "__MainIndex, subindex__" part,
    * the texts in the lines with the "__+__" resp. "__++__" markers (link texts and captions). If these
      lines are missing, you can insert them.

* __Remarks:__
    * _Never edit the line with the "__*__" marker!_
    * If any possible use uppercase for the first word in __Mainindex__ and in the link texts and
      use lowercase for the first word in __subindex__.
    * Avoid any special formatting in the text strings.

* Continue as described in section [Updating the index](#markdown-header-updating-the-index).

## Consistency checks

### Table of contents consistency check

The manual has a main table of contents (TOC) in the page `DocMain.md`. The Python script `BuildTOC.py` takes
this information and scans all manual pages for (sub-)section headers. From this a _complete table of contents_
with references to all subsections of the manual is built. This complete table of contents is
found in the page `AxAdvToc.md`.

The complete table of contents is mirrored in form of the lines with the "__*__" marker in `AxData4Index`.

The structure of the manual may change. New pages emerge. New sections appear in pages. Section headers change.
This can lead to inconsistencies between the table of contents of the manual and the "__*__" lines (table of content lines)
of the raw index.

3 steps are required to remove inconsistencies of this type:

* Run the Python script `BuildToc.py`. This updates the complete table of contents page `AxAdvToc.md` of the manual.
* Run the Python script `CompareIdxToc.py`. This script compares the complete table of contents in `AxAdvToc.md` with the
  one in the raw index (more precisely: with the lines marked "__*__").
* The result is in a Diff-like form and shows the differences between the complete table of contents and the
  lines marked with a "__*__" in the raw index as follows:

        - * [Test1](Test.Page1#markdown-header-label...)

    Here the "**-**"" means that there is a line in the raw index that doesn't appear in the table of contents.

    The opposite case is shown with a "**+**" as first character.

Use the script results to manually adjust/edit the raw index in order to remove the inconsistencies.

* Case "**+**":
    * Find location of line in `AxAdvToc.md`.
    * Find parent section to this line in `AxAdvToc.md`.
    * Find this parent section in `AxData4Index.txt`.
    * Insert

            * [Test1](Test.Page1#markdown-header-label...)

         into `AxData4Index.txt` after the parent header block.

    * If necessary, add index entries and link descriptions to the new section block.
    * _Remark:_ It may happen that the inserted line replaces an existing line. In this case insert
         the new line and remove the old one.


* Case "**-**":

    Find line in `AxData4Index.txt` and remove it together with all index entries. _Attention:_
    The section block might have been renamed or moved to another location. In this case the index entries should be
    kept and moved to the correct location.


### Index consistency check

You can edit the index itself, too. Doing so leads to inconsistencies between the index and its raw index.

These steps are required to remove inconsistencies of this type:

* Copy the index file `AxAdvIndex` into the `doc/Tools` folder (overwrite an existing one!).
* Run the Python script `CheckIndex.py`. This script compares the index and the raw index. The differences are shown
  in a Diff-like form.
* Use the script results
  to manually adjust/edit the raw index in order to remove the inconsistencies.
* _Example of script output:_

         + Track, select range in edit mode ---> [Select a range...](AdvTrk.General#markdown-header-select-a-range...)
         - Track, select range in edit mode ---> [Select a range...](AdvTrk.General#markdown-header-select-a-range...)


     These lines mean

     * There is a difference between the raw index and the last version of the (Wiki) index.
     * An index entry "__Track|select range in edit mode__" was added ("__+__" marker!) to the raw index.
     * There is index entry "__Tratck|select range in edit mode__"  not found in the raw index ("__-__" marker!
       This line is found in the index).
     * Necessary steps:
         * Find the "[...](...)" strings in the raw index, i.e. find the subsections where the index entries are
           defined.
         * Decide about the necessary index changes for the given subsection. In the given case: nothing to do -
           a spelling error was corrected in the raw index file.

## Updating the index

After editing and removing all inconsistencies you should run the Python script `BuildIndex.py`. This recreates the index.

## Updating the navigation bars

The index page created with `BuildIndex.py` does not have navigation bars. You should run the navigation bar
tool by calling `make nav`. This is described in detail in the [Developing Documentation](DevelopingDocumentation)
page.

## Summary of recommended workflow for index maintenance

This is a recommended sequence of steps when editing the index in a local copy of the manual:

1. Update your local copy of the manual using your preferred Bitbucket version control tool.
1. Open a command-line window and change the working directory to `my_path_to_manual\doc\Tools`. Run all Python scripts
   mentioned from this working directory!
1. Copy the `AxAdvToc.md` to the `Tools` subfolder (overwrite an existing one!). This copy is used for the consistency check.
1. Run `BuildToc.py` to update the complete table of contents.
1. Run `CompareIdxToc.py` to get inconsistencies between the complete table of contents and the raw index (output in console window!).
1. Remove these inconsistencies (compare section
[Table of contents consistency check](#markdown-header-table-of-contents-consistency-check "TOC consistency check")).
1. Run `CheckIndex.py` to get inconsistencies between the raw index and the index (output in console window!).
1. Open the raw index `.\Tools\AxDate4Index.md` in an editor and remove manually these inconsistencies
  (compare section [Index consistency check](#markdown-header-index-consistency-check "Index consistency check")).
1. Modify index entries in the raw index as wanted and save the file when finished.
1. Run `BuildIndex.py` to rebuild the index.
1. Run the navbar tool `make nav` to insert navigation bars into the index page
   compare [Developing Documentation](DevelopingDocumentation)).
1. Upload the modified files to the Bitbucket server using your preferred Bitbucket version control tool.

## Further remarks

* The raw index file and all the Python scripts used for maintaining the index are located in the `Tools` subfolder
  of the `doc` folder of the manual. The scripts should be run in a command-line (console) window after changing the
  working directory to `my_path_to_manual\doc\Tools`. Some script output (e.g the results of consistency checks) is sent to
  the console window. The Python scripts rely on the described folder structure.

* The editor used for making index changes must use UTF-8 encoding (without BOM).

* Editing Wiki pages is recommended on a local copy of the Wiki on your computer. Try to install the necessary
  Bitbucket version control tools on your computer so that you

    * can download (pull) the Wiki from the Bitbucket server and
    * can upload (push) edited manual pages to the Bitbucket server.

* _Not recommended but possible:_ If a local copy of the manual can't be made available, then make your changes
  on-line in the Bitbucket Wiki. Other users editing the manual will see your changes and carry out the
  maintenance steps described on this page.

* No index entries are inserted for the following manual pages:

    * [Playground - start your new Wiki page](DocPlayground)
    * [Hotkeys](AxHotkeys)
    * [Complete table of contents](AxAdvToc)
    * [Glossary](AxGlossary)
    * [Index](AxAdvIndex)
    * [List of images (Advanced usage and FAQ parts only)](AxWikiImages)

* Running the scripts mentioned on this page requires a local copy of the Wiki on your computer.

* You (as a Windows user) might not be in a position to run a Python script or to run a makefile. If so, contact another user
  who could do this for you.

* All Python scripts are written for and tested with Python 3.3 under Windows. They use only modules from the
  standard Python
  distribution. Earlier versions of Python (Python 2.7.x) can be used as soon as the Python 3 syntax is understood
  and as soon as generators are supported. Other operating systems can be tried. This was not tested!

## Some remarks on the design of the index page

The proposed structure and the layout of the index page is similar to the one used for the
[Gimp index](https://docs.gimp.org/2.8/en/gimp-help-index.html).

Here is a description of some design principles for the index page that where used for the QMS Wiki:

* There must be exactly one _index text_ for an index entry. This text must be short, concise, and meaningful.
  It must be formulated in such a way that some "_main topic_" appears at the front of the
  text and that can be used for sorting the index.

    For the proposed index design a pair __(Mainindex, subindex)__ is used. subindex can be an
    empty string.

* Each index entry must have one _or even several_ targets where the user can find
  information about the index entry. This implies that the
  "index entry ---> target" relation __must__ be a "1-to-n relation".
  A "1-to-1 relation" or a mapping of a "1-to-n relation" to a series of
  "1-to-1 relations" won't be appropriate approaches to an index.

* A target should be implemented as a link. The address of the target
  must be composed of the target Wiki page and the (sub-)section in it.
  A Markdown link requires 1 and allows 2 text strings.
  Due to the fact that the link describes the target the text strings should be
  related to the target too and thus should be derived from the
  names of the target page and the referenced section in it.

* From the previous points it follows that a relation
  "index_entry ---> target_1, target_2,...target_n" must be implemented.
  Experience with the QMS Wiki shows that n is rarely greater than 3.
  This depends on the level of detail used for an index entry.

    Due to the relatively big number of index entries they must be arranged vertically.

    Several targets of an index entry can be arranged horizontally in order to make the index shorter.

* If a __Mainindex__ is used with several different __subindex__  entries, then they are presented in the index as

        Mainindex, subindex1: target_list1
        Mainindex, subindex2: target_list2

    and not in the form

        Mainindex
           subindex1: target_list1
           subindex2: target_list2

    The reason for this is that there are some __Mainindex__ entries with a rather big number of __subindex__ entries
    (more than fit on a typical browser page, e.g. Track, Database). Thus, the user would see in the browser
    window only the subindex entries and not the Mainindex which hampers the orientation in the index.


The design used for the index page in the QMS Wiki meets these principles.

The definition of index entries is manual work. When defining an index entry text strings must be
chosen for

* the __(Mainindex, subindex)__ pair,
* a short link text describing the target topic,
* a slightly longer text describing in more detail the target topic.

- - -
[Prev](AxMaintainAutoPages) (Recommendations for editing QMS Wiki pages) | [Home](Home) | [Manual](DocMain) | [Index](AxAdvIndex) | [Top](#) | (Playground - start your new Wiki page) [Next](DocPlayground)
