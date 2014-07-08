# Install MapRoom

Currently the software is distributed as source code only. You need CMake, Qt5, GDAL and Proj4 to compile the code. Depending on your system you have to install compiler tools, too. This description is for \*nix based systems with GCC installed and a GNU make system.

If you want to use the cutting edge you need _Mercurial_ to access the repository. Find the [_instructions here_](https://bitbucket.org/maproom/maproom/overview).

If you prefer more or less stable releases have a look at the [_download_](https://bitbucket.org/maproom/maproom/downloads) section. You have to download and unpack the \*tar.gz files.

Anyway you should end up with a directory containing the source code. Let's say the directory's name is _MapRoom_. Create anther directory next to _MapRoom_:

    mkdir build_MapRoom

And then:

    cd build_MapRoom
    ccmake ../MapRoom

You might want to change _CMAKE_INSTALL_PREFIX_ from _/usr/local_ to _/usr_. And you might want to edit the file _CMakeLists.txt_ in _MapRoom_. Line 5 and 6:

    # has to be removed later on
    set(CMAKE_PREFIX_PATH /opt/Qt/5.3/gcc_64/)

This is because on my system Qt5 is not integrated into the usual paths, yet. Probably you have to remove that, or change it to where ever Qt5 is on your system.

While in ccmake press the keys 'c' and then 'g'. If everything is fine leave with 'q'. Now compile the source with:

    make

And install the application with:

    sudo make install



