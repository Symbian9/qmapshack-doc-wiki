[Home](Home) | [Manual](DocMain)

[TOC]

# Install QMapShack

## Windows

For 64 bit Windows there is a binary installer available in the download section. There is also an outdated version for 32 bit Windows. To get up-to-date 32 bit binaries it needs someone maintaining it.

If you want to compile QMapShack for Windows have a look at **nsi/3rdparty.txt** and **nsi/HOWTO-BUILD.txt** in the source tree.

## OS X

A binary bundle is available in the download section.
The binary is build with compatibility for Mac OS X 10.5 (Leopard) and later. The build is done with the Xcode 7.0.1 and tested on OS-X 10.10.5 (Yosemite) and partly on OS-X 10.11 (El Capitan).

The application can also be installed through cask (homebrew addition).
Installing homebrew and cask, if not already done: 

    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install caskroom/cask/brew-cask

Installing QMapShack (latest provided version):

    brew cask install qmapshack

Update QMapShack to the latest version:

    brew cask install qmapshack --force 
   
## Linux

**Check out your distribution's package system. Probably there is a binary package already.**

Currently the software is distributed by the author as source code only. You need CMake, Qt5 (at least 5.4), GDAL, Proj4 and latest Routino from it's SVN repository to compile the code. Depending on your system you have to install compiler tools, too. This description is for \*nix based systems with GCC installed and a GNU make system.

If you want to use the cutting edge you need _Mercurial_ to access the repository. Find the [_instructions here_](https://bitbucket.org/maproom/qmapshack/overview).

If you prefer more or less stable releases have a look at the [_download_](https://bitbucket.org/maproom/qmapshack/downloads) section. You have to download and unpack the \*tar.gz files.

If you use Ubuntu 14.04 you have to proceed with these [instructions](https://bitbucket.org/maproom/qmapshack/wiki/Ubuntu%2014.04%20specific%20build%20&%20run%20instructions) before the next steps described on this page.

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

