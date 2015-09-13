[Home](Home) | [Manual](DocMain)

# Install QMapShack

## Windows

For 64 bit Windows there is a binary installer available in the download section. There is also an outdated version for 32 bit Windows. To get up-to-date 32 bit binaries it needs someone maintaining it.

## OS X

As no one volunteers to maintain an OS X binary, there is none.

## Linux

**Check out your distribution's package system. Probably there is a binary package already.**

Currently the software is distributed by the author as source code only. You need CMake, Qt5, GDAL, Proj4 and Routino to compile the code. Depending on your system you have to install compiler tools, too. This description is for \*nix based systems with GCC installed and a GNU make system.

If you want to use the cutting edge you need _Mercurial_ to access the repository. Find the [_instructions here_](https://bitbucket.org/maproom/qmapshack/overview).

If you prefer more or less stable releases have a look at the [_download_](https://bitbucket.org/maproom/qmapshack/downloads) section. You have to download and unpack the \*tar.gz files.

Anyway you should end up with a directory containing the source code. Let's say the directory's name is _QMapShack_. Create another directory next to _QMapShack_:

    mkdir build_QMapShack

And then:

    cd build_QMapShack
    ccmake ../QMapShack

You might want to change _CMAKE_INSTALL_PREFIX_ from _/usr/local_ to _/usr_. 

While in ccmake press the keys 'c' and then 'g'. If everything is fine leave with 'q'. Now compile the source with:

    make

And install the application with:

    sudo make install

