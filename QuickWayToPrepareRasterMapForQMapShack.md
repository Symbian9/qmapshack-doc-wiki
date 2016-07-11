# Quick way to prepare raster map for QMapShack

This is translation of the original article in my own blog: http://htrd.su/wiki/zhurnal/2016/02/11/bystro_i_nenavjazchivo_gotovim_kartu_dlja_otkrytija_v_qmapshack.

For example I describe service http://loadmap.net that provides simple way to take raster maps (milirary and updated maps by Goverment GIS Center) with OziExplorer references.

Major disadvantage of the such maps is a border that overlap near maps. To solve this issue I wrote small application that helps: [geocrop](https://github.com/h4tr3d/geocrop) (it is free and open source app, patches is welcomed!).

Major advantage of the QMapShack (QMS for short later): it can open GDAL maps in ``.vrt`` format. VRT file is a XML based map description that contains different useful information about map:

* link to the original map source (raster file in our case);
* reference description;
* and other useful transformations.

Big profit: my way to crop border can work with VRT files too: cropping does not affect original raster file and stores to VRT as transformation. It increase speed of the transformation dramatically!

I omit description how to build **geocrop**: you can read descripton on GitHub. Short note: you must install develop packets for **libgdal** and **libproj4**. Building and working on Windows not checked (any help is welcomed). Application does not required installation, simple put it to ``~/bin``.

Ok. Now you should do only three simple steps to prepare map:

1. Download needed sheet on http://loadmap.net, for example 500-meter (scale: 1:50 000 or 1 cm = 500 meters) sheet K-53-027-A and raster image - K-53-027-A.png
2. Download OziExplorer reference for map: K-53-027-A.map
3. Crop border and create VRT

        ~/bin/geocrop -s 50k -f VRT K-53-027-A.map K-53-027-A.vrt

    Look to the parameter **-s** - it allows to select scaler of the sheet: 50k (k - kilo) => 50 000 => scale 1:50 000. Scale parameter allows to select rules for sheet content calculation and detection of the border, so this parameters is a mandatory.

Repeat this steps for all needed sheets. Now you can add path to the maps to QMS and look to the result.
![qms-vrt-maps-1024.png](https://bitbucket.org/repo/L5qerE/images/1237331501-qms-vrt-maps-1024.png)

On screenshot above (image with better quality: http://htrd.su/wiki/_media/zhurnal/2016/02/11/qms-vrt-maps.png) opened two sheets with 200k map (2km). Sheet boundary observable but not affect overlapped maps.

Also, you can see podcast that describe procedure above: https://youtu.be/7mp35wYk0IQ

Note, you can create VRT of VRTs. In other words: combine multiple VRT files with same scale to the "atlas" and open only one file. Description will be provided ASAP.
