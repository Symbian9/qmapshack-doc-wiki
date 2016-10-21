[Prev](DeveloperTranslate) (Add translations) | [Home](Home) | [Manual](DocMain) | (Playground - start your new Wiki page) [Next](DocPlayground)
- - -
[TOC]
- - -

# Developing Documentation

## Prerequisites

If you want to contribute to the _QMapShack_ documentation wiki at
Bitbucket, the following conditions must be met:

*   **Most important:** You should have sufficient knowledge of the
    _Markdown_ language!

*   You have registered at
    [Bitbucket](https://bitbucket.org/account/signup/) and know your
    password.

*   If you want to do more than just correcting a typo (which can also be
    done directly on the
    [Bitbucket server](https://bitbucket.org/maproom/qmapshack/wiki), see
    [below](#online-editing)), you should be working on a local clone of
    the _Mercurial_ repository of the _QMapShack_ wiki at Bitbucket.

    If you have [_Mercurial_](https://www.mercurial-scm.org/) installed,
    you can clone the _QMapShack_ wiki by issuing the command

            hg clone https://bitbucket.org/maproom/qmapshack/wiki qmapshack-doc

*   You are editing an existing or creating a new `*.md` file.  **Never
    touch any `*.html` files**, because these only exist in your local
    wiki clone, are not version controlled, and are always created from
    the `*.md` files.

## The _Markdown_ Language

*   Documentation regarding the _Markdown_ language can be found at various
    places:

    *   John Gruber's original
        [_Markdown_ syntax definition](http://daringfireball.net/projects/markdown/syntax)
        dating back to 2004.

    *   The [differences](https://pythonhosted.org/Markdown/) between John
        Gruber's original _Markdown_ syntax and the _Markdown_ syntax
        implemented by the _Python_ _Markdown_ module used by Bitbucket.

    *   [Documentation](https://pythonhosted.org/Markdown/extensions/index.html)
        of the _Markdown_ syntax understood by every _Markdown_ extension
        used by Bitbucket[^1] (see
        [_Python_ requirements](OfflineDocumentation#prerequisites)) as
        well as the HTML code produced from it.

    *   Finally, you can look into any of the `*.md` files in this
        repository and at the same time point your browser to the
        corresponding web page at the
        [Bitbucket server](https://bitbucket.org/maproom/qmapshack/wiki)
        to see the effect of a particular _Markdown_ clause.  And if you
        want to see the HTML source of the current page in your browser,
        and your browser happens to be _Firefox_, just type `Ctrl-u`
        (other browsers may or may not need different handling, but most
        decent browsers will be able to display the HTML source of the
        current page one way or the other).

*   **Important note:** Mind that a _Markdown_ file isn't just a text
    file you're looking at using a browser.  For instance, a _Markdown_
    file containing the line

            For more information see here: http://x.y.z.com

    will result in an HTML file where you cannot even click the URL in
    your browser!  Instead, this line should be written as

            For more information see [here](http://x.y.z.com).

    in _Markdown_.  In this case the word "`here`" will be clickable in
    your browser, taking you to "`http://x.y.z.com`".

[^1]:
    Apart from using these _Markdown_ extensions the Bitbucket
    _Markdown_ dialect also accepts the clause "`~~xxx~~`" which is
    rendered to "~~xxx~~" ("strike through").  This clause is also
    accepted when locally rendering _Markdown_ files to HTML using
    script `Make.sh` or using `make doc`.

## Dos and Don'ts

*   If the file you want to edit does **not yet exist**, select a
    **blank-free** name for it which **only** consists of **plain upper-
    and lowercase characters** (no accented characters, no umlauts!),
    **digits**, as well as the **characters `underscore` ("`_`"),
    `period` ("`.`"), `plus` ("`+`"), and `minus`
    ("`-`")**.  Do your best to mimic the naming scheme used by the files
    already existing.

*   If the file you want to edit does **not yet exist**, create it in
    sub-directory `playground/`[^2].  This way your new file does
    neither disturb others running `make nav` against the repsository
    while you are developing the contents of your file nor do other
    people's `make nav` operations add currently unwanted changes to
    your file which is still in the making (after all, `make nav` does
    more than just adding navigation bars).  And you can develop your
    file at your own pace over a longer period of time or also ask
    others to have a look at it before it is _really_ added to the wiki.

*   If the file you want to edit does **not yet exist**, do not try to
    manually add to it the navigation bars you see in all the other wiki
    files because this could cause confusion when running `make nav`
    later.  Just start your file with its first headline.

*   If you are editing an **already existing** `*.md` file, leave the
    navigation bars at the top and bottom of it alone.  The top
    navigation bar looks like

            [Prev](... | [Home](Home) | [Manual](DocMain) | ...  
            - - -  
            [TOC]  
            - - -

    while the bottom navigation bar looks like

            - - -  
            [Prev](... | [Home](Home) | [Manual](DocMain) | ...

    When running `make nav` later, these lines will be updated
    automatically (and if they don't yet exist, they will be created).

*   Do not use the _Markdown_ directive "`- - -`" to insert a horizontal
    rule, that is, a horizontal line running from the left edge of the
    browser window to the right edge.  This special way of coding a
    horizontal rule is regarded part of the navigation bars and will be
    removed anywhere else in the file when the navigation bars are
    automatically inserted or updated.  Rather use the _Markdown_
    variants "`---`" or "`***`", if you need a horizontal rule somewhere
    in your _Markdown_ file.

*   Be conservative: try to maintain the general look of the original
    file.

*   You can edit an existing or create a new `*.md` file either
    [online](#online-editing) or [offline](#offline-editing), the latter
    being the preferred method.  **Online editing is discouraged and
    should only be used for minor changes like correcting a typo!**

    One reason for discouraging online editing is that it causes the
    Bitbucket server to use a stereotype "`Edited online`" commit
    message which doesn't convey any real information as to **why** a
    particular change was made to the wiki repository.  But keeping
    track of why a change was introduced is one of the benefits of
    maintaining the wiki as a _Mercurial_ repository at all.  Another
    reason for discouraging online editing is that the Bitbucket server
    does neither check the contents of your file nor update its
    navigation bars.  So either don't use online editing at all or only
    use it for really trivial changes.

    And finally, being able to use your favorite editor at home will
    presumably make life more easy for you, should the editing involve
    major searching, mass changes, or cut and paste operations.

*   Thoroughly check your edits, in particular make sure **you don't
    introduce unresolvable links**.  This checking can of course be done
    more easily and more thoroughly offline and thus this is just
    another reason for discouraging online editing.

[^2]:
    Mind however that links in your new file which point to other wiki
    files now have to be temporarily prefixed with "`../`" as in

    >    \[_Text_]\(../_File_)

    or they will not be resolvable while you inspect your work online on
    the Bitbucket server or offline by manually converting it to HTML.

## Online Editing

*   If the file you want to edit is **already existing**,

    |   |   |
    |---|---|
    | ![UnderConstruction](images/UnderConstruction.png) | **Help please! This section is still under construction:** The author is not at all familiar with online editing via the Bitbucket server, so the gory details should be inserted here by someone who is.  The following topics sould be covered by the description: |

    *   **_Where to point your browser to in order to enter your
        Bitbucket password._**

    *   **_How to select the existing file you want to edit._**

    *   **_How to enter edit mode, if not done automatically._**

    *   **_How to perform basic editing tasks like searching, mass
        changes, or cut and paste, if possible at all._**

    *   **_How to save or discard your changes._**

    *   **_How to inspect the HTML code rendered from your file without
        quitting edit mode._**

    *   **_How to exit edit mode so the changes are finally
        committed._**

*   If the file you want to edit does **not yet exist**,

    *   create it for the [reasons already given](#fnref:2) in
        sub-directory `playground/` by editing existing file
        `DocPlayground` as described above and creating a new link there
        pointing to your not yet existing file:

        >    \* \[_YourPersonalName_]\(playground/_YourNewFileName_)

        Mind that "_YourNewFileName_" must neither end in a `.md` nor in
        a `.html` extension.  Finally click the link, and Bitbucket will
        create the new file which you can then edit as described above.

    *   The final steps of moving your file one directory level up,
        creating at least one link to it in one of the other wiki files,
        and then running `make nav` against the wiki repository have to
        be done offline.

## Offline Editing

*   Additional Prerequisites:

    *   You have the software tools described
        [here](OfflineDocumentation#prerequisites) to manually
        convert your `*.md` file to HTML so you can locally inspect it
        using your browser.

    *   You have _GNU_ `gawk` to run `make nav` and `make check` against
        the repository.  The scripts `DocFix.sh`, `NavBar.sh`, and
        `LinkCheck.sh` use some `gawk` specific features, like a
        function `match()` which takes three arguments, function
        `gensub()`, and perhaps a few others.

    *   **You are using an editor which is capable of producing UTF-8
        encoded files.**

        This is required because the _Markdown_ language implemented on
        the Bitbucket server does not pass any HTML entities like for
        instance "`&amp;`", "`&ecirc;`", or the equivalent forms for the
        latter, "`&#234;`" and "`&#x000EA;`", on to the HTML code.
        Rather it renders "`&amp;`" into "`&amp;amp;`" which will then
        again be displayed literally as "`&amp;`" by your browser.  This
        is not a problem as long as you are only typing English text
        using 7-bit ASCII characters, even using any of the characters
        "`&<>[]{}`".  But as soon as you are using German umlauts,
        French accented characters, or even more exotic glyphs, you
        cannot just use their standard HTML entities but rather **you
        have to make sure your editor correctly encodes these characters
        as _UTF-8_** or they will not be displayed properly.  And of
        course you'll have to know how to tell your editor to insert an
        UTF-8 "`Ê`" character directly into your file (the author would
        recommend the _Mule_ package of
        [GNU _Emacs_](https://www.gnu.org/software/emacs/) for editing
        UTF-8 files, but your milage may vary).

*   Just open an existing `*.md` file you want to edit or create a new
    one (**in sub-directory `playground/`, as recommended
    [above](#fnref:1)!**) in your favorite, **UTF-8 capable** editor and
    edit it to your heart's content.

    **Mind that the `.md` extension is mandatory when creating a new
    _Markdown_ file offline!**  If you omit the `.md` extension, neither
    the local scripts nor the Bitbucket server will recognize your file
    as a _Markdown_ file.

*   If you want to see the outcome of rendering your file to HTML, just
    save the edited file to disk, `cd` to the top level of the wiki
    repository, if necessary, and then run the commands

    >    ./Make.sh _YourFilePath_.md  
    >    _YourBrowser_ _YourFilePath_.html

    where _YourFilePath_ has to start with `playground/`, if you created
    the file there.  This will open your freshly created HTML file in
    your browser for inspection.

*   If you reach a point where you want others to review your work and
    if you created a new `*.md` file, you should insert a link into file
    `DocPlayground.md`

    >    \* \[_Topic_]\(playground/_YourNewFileName_) - _YourName_

    pointing to your new file to make it easier for others to find it
    online.  Mind that "_YourNewFileName_" must neither end with a `.md`
    nor with a `.html` extension.  Then keep your Bitbucket password
    ready for pushing the repository upstream and run the commands

            hg commit
            hg push

*   If you finally decide to really include your new file into the wiki,
    some more steps are necessary:

    *   If you used "`](../`_TargetFile_" to link to other wiki files
        in your file, edit it one last time and change all strings
        "`](../`" to just "`](`" or else these links will no longer be
        resolvable in the new file location.

    *   Move your file one directory level up by `cd`-ing to the top
        level directory of your wiki repository and issuing the
        command

        >    mv playground/_YourNewFileName_.md .

    *   If your file isn't reachable via some link occuring in one of
        the other `*.md` files, it is dead.  Or at least as good as
        dead.  There is a good chance that nobody ever reads your text.
        So there should always be at least one link to it in the other
        `*.md` files.  There are two categories of files:

        *   **The general case:** your file covers some self-contained
            topic.  Most of the existing `*.md` files belong to that
            category.  In this case it's sufficient to insert the link
            to your new file at a suitable place in file `DocMain.md`.

        *   **The special case:** the contents of your file is more like
            an appendix or a lengthy footnote dealing with a special
            case.  File `Ubuntu-14.04-HowTo.md` is an example of a file
            in this category, it is only mentioned as a special case of
            Linux installation in file `DocGetQMapShack.md`.  In this
            case you should insert the appropriate link to your new file
            into the file needing the appendix or lengthy footnote,
            while your new file should contain a link `Continue here`,
            `Back to ...`, or the like at its end which takes you back
            to or at least near the point where you left off earlier.
            Alternatively you can also end your new file with a remark
            like

                    Use your Browser's "Back" button to return.

*   If you are done with editing, `cd` to the top level directory of
    your wiki repository, if necessary, and issue the commands

            make nav
            make check

    to ensure all your changed `*.md` files are in a consistent state
    which is usable both, locally and online[^3].  This includes fixing
    some URLs as well as adding or updating both, the top and bottom
    navigation bars and the table of contents of each `*.md` file
    affected.

    Mind however that the `make check` command does not just check the
    files containing your current changes, but rather checks the whole
    wiki repository[^4].  So if `make check` finds unreferenced files or
    undefined links introduced by **your recent work**, apply
    corrections, but leave errors not related to your current work
    unresolved in the current changeset you are working on, and if you
    want to resolve them, resolve them in a separate changeset later.

*   Finally, keep your Bitbucket password ready for pushing the
    repository upstream and run the commands

            hg commit
            hg push

[^3]:
    Mind that under some circumstances (in particular when running it
    for the very first time) the command `make nav` might process more
    than just the files you changed.  However, it should normally not
    introduce any real changes (not even changes to file modification
    dates) which aren't caused by your own changes.

[^4]:
    To be precise, `make check` checks all _tracked_ files of the wiki
    repository for being referenced in at least one _toplevel_ `*.md`
    file as well as all _toplevel_ `*.md` files for containing only
    defined local links into any _toplevel_ `*.md` file.  This implies
    that `make check` can neither find undefined links in `*.md` files
    still residing in directory `playground/` nor check whether (yet)
    untracked files are referenced.

///Footnotes Go Here///
- - -
[Prev](DeveloperTranslate) (Add translations) | [Home](Home) | [Manual](DocMain) | [Top](#) | (Playground - start your new Wiki page) [Next](DocPlayground)
