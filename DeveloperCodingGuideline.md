[Prev](RequestFeatures) (Requesting a feature) | [Home](Home) | [Manual](DocMain) | [Index](AxAdvIndex) | (Commit Code) [Next](DeveloperCommitCode)
- - -
[TOC]
- - -

# Coding Guideline

No one likes them but it helps to read and maintain the code. Thus please stick to them:

* Indentation is 4 spaces
* Brackets are on a new line each:
 
```
#!c++
  ...
    if(item == nullptr)
    {
        return;
    }
  ...
```
* Use camel case with first character lower case on variables.

```
#!c++

    int n;
    int maxBrownFoxes;
```

* Use the Qt types (qreal, quint8, qint8, etc) exclusively, as all other definitions might not be portable.

* Use the Qt wrappers for C/C++ API (qAbs(), qMin(), etc) exclusively as all other definitions might not be portable.

* Classes start with a capital 'C'

```
#!c++

    class CMyClass
```
* Base (interface) classes start with a capital 'I'

```
#!c++

    class IItem
    {
        ....
    };

    class CMyItemX : public IItem
    {
        // I think you get the idea.
    }
```

* Structures are lowercase and have a trailing '_t'

```
#!c++
   struct my_funny_data_t
   {
       ....
   };
```

* Enumerations are lowercase and have a trailing '_e'. Enumeration items start with a 'e' and are camel case. It helps if the enumeration name is repeated in the item.
```
#!c++
   enum my_enum_e
   {
        eMyEnumThing1
       ,eMyEnumThing2
   };
```

* Use the `override` keyword where ever appropriate. When using GCC 5.1 and more recent the compiler will throw a warning. This is important because it prevents us from producing some nasty bugs.

* As we use the keyword `override` we do not have to use `virtual`, too. This is just redundant and of no real use anyway.

* Use `const` keyword on methods. Best practice is to use right on the spot for every method. And remove it the moment the method really alters the object's data.

* Use `nullptr` for checking pointers against null, avoid using `0` or `NULL` for pointers
  
* The use of `QStringLiteral` is kind of depreciated. On a PC system with a lot of memory and a powerful CPU the benefits are quite negligible. On the other hand side it spams the code, making it more tiring to read. Additionally the QT API is not very homogeneous in supplying overrides strictly for const QString& or  const char \*. You have to figure it out for each API method. That is why we drop the use of QStringLiteral. But of course if you use literals in a quite frequent or large loop the use of QStringLiteral is recommended.


- - -
[Prev](RequestFeatures) (Requesting a feature) | [Home](Home) | [Manual](DocMain) | [Index](AxAdvIndex) | [Top](#) | (Commit Code) [Next](DeveloperCommitCode)
