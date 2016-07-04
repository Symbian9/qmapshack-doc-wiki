[Prev](DocMain) (Manual) | [Home](Home) | [Manual](DocMain) | (Getting started) [Next](DocGettingStarted)
- - -

[TOC]

# Install QMapShack

## Windows

For 64 bit Windows there is a binary installer available [in the download section](https://bitbucket.org/maproom/qmapshack/downloads).
There is also an outdated version for 32 bit Windows. To get up-to-date 32 bit binaries it needs someone maintaining it.

If you want to compile QMapShack for Windows have a look at ["Compiling and Building QMapShack for Windows"](BuildWindowsVisualStudio) in the source tree.

## OS X

A binary bundle is available [in the download section](https://bitbucket.org/maproom/qmapshack/downloads).
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


### From distribution's package system

Many distributions come with a prebuilt version of QMapShack.
Installing via official repository is the prefered way of installing QMapShack.
Below a (non-exhaustive) list of Linux Distributions shipping QMapShack:

* [Debian](https://packages.debian.org/testing/qmapshack)
* [Ubuntu](http://packages.ubuntu.com/xenial/qmapshack)
* [OpenSUSE](https://software.opensuse.org/package/qmapshack)
* [Arch](https://aur.archlinux.org/packages/qmapshack/)
* [Fedora](https://admin.fedoraproject.org/pkgdb/package/rpms/qmapshack/)

Refer your distributions manual on howto install packages from using the package system.

### From Source

#### Prerequisites

To compile QMapShack, you need to have installed:

* [Qt5](https://www.qt.io/) (at least 5.4)
* [GDAL](http://www.gdal.org/)
* [Proj4](https://github.com/OSGeo/proj.4/wiki)
* [Routino](http://www.routino.org/) (at least 3.0)
* CMake/Make
* a C++ compiler (supporting C++11)

Prefer installing those dependencies via the distribution's package system.
You also need to **install the development packages** in order to build QMapShack

#### Obtaining the Source

If you want to use the cutting edge you need _Mercurial_ to access the repository. Find the [_instructions here_](https://bitbucket.org/maproom/qmapshack/overview).

If you prefer more or less stable releases have a look [at the _download_ section](https://bitbucket.org/maproom/qmapshack/downloads). You have to download and unpack the \*tar.gz files.

If you use Ubuntu 14.04 you have to proceed with these [instructions](Ubuntu-14.04-HowTo) before the next steps described on this page.

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

- - -
[Prev](DocMain) (Manual) | [Home](Home) | [Manual](DocMain) | (Getting started) [Next](DocGettingStarted)
