# Abbreviations:

The HTML specification
is maintained by the W3C.

*[HTML]: Hyper Text Markup Language
*[W3C]:  World Wide Web Consortium


# Admonition:

!!! note "1"
    You should note that the title will be automatically capitalized.


# Code Highliting:

## Pure:

```
while true
do if   [[ "${x-}" -eq 12 ]]
   then { perform -Test 1 ; }
   elif ! perform Test 2
   then perform -Test 3
   else ( perform -Test 4 ; )
   fi
done
```

## Github 1:

```bash
while true
do if   [[ "${x-}" -eq 12 ]]
   then { perform -Test 1 ; }
   elif ! perform Test 2
   then perform -Test 3
   else ( perform -Test 4 ; )
   fi
done
```

## Github 2:

```sh
while true
do if   [[ "${x-}" -eq 12 ]]
   then { perform -Test 1 ; }
   elif ! perform Test 2
   then perform -Test 3
   else ( perform -Test 4 ; )
   fi
done
```

## Shebang 1:

```
#!bash
while true
do if   [[ "${x-}" -eq 12 ]]
   then { perform -Test 1 ; }
   elif ! perform Test 2
   then perform -Test 3
   else ( perform -Test 4 ; )
   fi
done
```

## Shebang 2:

```
#!sh
while true
do if   [[ "${x-}" -eq 12 ]]
   then { perform -Test 1 ; }
   elif ! perform Test 2
   then perform -Test 3
   else ( perform -Test 4 ; )
   fi
done
```

## PHP 1:

~~~~{.bash}
while true
do if   [[ "${x-}" -eq 12 ]]
   then { perform -Test 1 ; }
   elif ! perform Test 2
   then perform -Test 3
   else ( perform -Test 4 ; )
   fi
done
~~~~

## PHP 2:

~~~~{.sh}
while true
do if   [[ "${x-}" -eq 12 ]]
   then { perform -Test 1 ; }
   elif ! perform Test 2
   then perform -Test 3
   else ( perform -Test 4 ; )
   fi
done
~~~~

~~~~.html
<p>HTML Document</p>
~~~~

## Indented:

    while true
    do if   [[ "${x-}" -eq 12 ]]
       then { perform -Test 1 ; }
       elif ! perform Test 2
       then perform -Test 3
       else ( perform -Test 4 ; )
       fi
    done


# Definition Lists:

Apple
:   Pomaceous fruit of plants of the genus Malus in
    the family Rosaceae.

Orange
:   The fruit of an evergreen tree of the genus Citrus.


# Sane Lists:

## Example 1:

1. Ordered item 1
2. Ordered item 2
* Unordered item 1
* Unordered item 2

## Example 2:

1. Ordered item 1
2. Ordered item 2

* Unordered item 1
* Unordered item 2

## Example 3:

* Unordered item 1
* Unordered item 2
1. Ordered item 1
2. Ordered item 2

## Example 4:

* Unordered item 1
* Unordered item 2

1. Ordered item 1
2. Ordered item 2


# Smart Strong:

Text with double__underscore__words.
__Strong__ still works.
__this__works__too__.

Text with single_underscore_words.
_Emphasis_ still works.
_this_works_too_.


# Smarty Pants:

'single quote' "double quote" <<angle quote>>
elipsis1 ... elipsis1 elipsis2...elipsis2
ndash1 -- ndash1 ndash2--ndash2
mdash1 --- mdash1 mdash2---mdash2


# Wiki Links:

[[Wiki Link]]
[[DocMain]]
[[DocMain.html]]

# End
