[Home](Home) | [Manual](DocMain)

#Coding Guideline

No one likes them but it helps to read and maintain the code. Thus please stick to them:

* Indentation is 4 spaces
* Brackets are on a new line each:
 
```
#!c++
  ...
    if(item  == 0)
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

* Use the 'override' keyword where ever appropriate. When using GCC 5.1 and more recent the compiler will throw a warning. This is important because it prevents us from producing some nasty bugs.

* Use 'const' keyword on methods. Best practice is to use right on the spot for every method. And remove it the moment the method really alters the object's data.

I think that's it. Just look at the code and try to mimic the coding style as good as you can. A bit of discipline really helps to maintain the beast.




