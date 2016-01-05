We now have the ability to choose when to update (extract) the
translations from the sources files within CMake. It's controlled by the `UPDATE_TRANSLATIONS` CMake command line option. It defaults to `OFF`. Translations are always compiled (.ts to .qm)
    
To update the translations just set the CMake command line option `UPDATE_TRANSLATIONS` to `ON`. E.g.: 
```
#!cmake
cmake -DUPDATE_TRASNLATIONS=ON ..
make

```
The translations are extracted and also compiled. To return to the compilation only mode just set the `UPDATE_TRANSLATIONS` option to `OFF`. E.g.:

```
#!cmake
cmake -DCMAKE_UPDATE_TRANSLATIONS=OFF ..
```
    
**Warning**: For all other generators than Makefile: When `UPDATE_TRANSLATIONS` is enabled a clean command will also clean the generated .ts files. So, after extracting the translations sources it's advisable to set `UPDATE_TRANSLATIOS` to `OFF` right away.
