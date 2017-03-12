Prev () | [Home](Home) | [Manual](DocMain) | [Index](AxAdvIndex) | () Next
- - -
[TOC]
- - -

In particular Ubuntu 14.04 needs cmake 3 and Qt 5.4


# Build
## cmake 3
```
sudo add-apt-repository ppa:george-edison55/cmake-3.x
sudo apt-get update
```

## Qt 5.4
```
sudo add-apt-repository ppa:beineri/opt-qt542-trusty
sudo apt-get update
sudo apt-get install libgdal-dev libproj-dev qt54base qt54tools qt54-meta-full # qt54-meta-minimal might be enough instead of full
```

## Routino
```
#!bash

# install required dev-packages
sudo apt-get install gcc make libc6-dev libz-dev libbz2-dev libgraphics-magick-perl

# download, build and install routino
svn co http://routino.org/svn/trunk routino
cd routino
make
sudo make install
```
## QuaZip
```
# install required dev-packages
sudo apt-get install libquazip5-headers libquazip5-1 libquazip5-dev
```

## Use Qt 5.4 instead of 5.2 (it's only temporary and for the current terminal)
```
source /opt/qt54/bin/qt54-env.sh
```
[go on with the build instructions](DocGetQMapShack#markdown-header-linux)


# Running the software:
```
source /opt/qt54/bin/qt54-env.sh # to use Qt 5.4 instead of 5.2, this is only for the current terminal
qmapshack
```

Maybe there is a better way to use Qt 5.4

- - -

Prev () | [Home](Home) | [Manual](DocMain) | [Index](AxAdvIndex) | [Top](#) | () Next