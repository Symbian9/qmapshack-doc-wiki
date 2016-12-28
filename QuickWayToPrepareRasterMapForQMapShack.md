Prev () | [Home](Home) | [Manual](DocMain) | () Next
- - -
[TOC]
- - -

# Quick way to prepare raster maps for use in QMapShack

This is a translation of the original article in the blog: 
[http://htrd.su/wiki](http://htrd.su/wiki/zhurnal/2016/02/11/bystro_i_nenavjazchivo_gotovim_kartu_dlja_otkrytija_v_qmapshack).

Let us take [http://loadmap.net](http://loadmap.net) as an example server for getting raster maps 
(military maps updated by the Goverment GIS Center) with `OziExplorer` references.

A major disadvantage of such maps is a border that overlaps neighbouring maps. 
To solve this issue A. Drozdoff wrote the small [geocrop](https://github.com/h4tr3d/geocrop) application 
(free and open source, patches welcome, *nix only) which helps to crop the maps. 

A major advantage of `QMapShack` (`QMS`) is that it can open maps defined in a `GDAL` `.vrt` format file. 
A VRT file is a XML based map description containing different useful information about maps:

* links to the original map source (raster file in our case),
* reference description,
* other useful transformations.

The method used in `geocrop` in order to crop map borders works with VRT files too: 
cropping does not affect the original raster file transformation. The cropped file can be opened properly. 
The transformation speed is increased dramatically.

The `geocrop` build process is described in the GitHub (see link above). 
It requires the installation of developer packages for `libgdal` and `libproj4`. 
Building on Windows is not yet supported (any help is welcome). 
The application does not require any installation, simply copy it into `~/bin`.

Having prepared `geocrop` 3 simple steps are required to prepare a map:

* Download the needed map sheet from [http://loadmap.net](http://loadmap.net), 
   for example assume the 500-meter (scale: 1:50 000 or 1 cm = 500 meters) sheet `K-53-027-A` with 
   raster image file `K-53-027-A.png`
* Download from the same location the OziExplorer reference file for the map: `K-53-027-A.map`
* Crop the border and create a VRT file with `geocrop`:

        `~/bin/geocrop -s 50k -f VRT K-53-027-A.map K-53-027-A.vrt`

  Pay attention to the parameter `-s` - it allows to select the scale of the sheet: 
  
  50k (k - kilo) => 50 000 => scale 1:50 000. 
  
  The scale parameter allows to select suitable rules for the sheet content calculation and the detection of the border.
  Thus, this parameters is a mandatory.

Repeat these steps for all necessary sheets. 

Next add the path to the maps to `QMS` and check the result.

On the following screenshot (for image with better quality see: 
[http://htrd.su/wik](http://htrd.su/wiki/_media/zhurnal/2016/02/11/qms-vrt-maps.png)) 
two sheets of a 200k map (2km) are displayed. The sheet boundaries can be seen but they do not affect the maps.

![qms-vrt-maps-1024.png](https://bitbucket.org/repo/L5qerE/images/1237331501-qms-vrt-maps-1024.png)

The podcast [https://youtu.be/7mp35wYk0IQ](https://youtu.be/7mp35wYk0IQ) describes the required procedure.

A single VRT file can be created out of several VRT files. 
In other words: it is possible to combine multiple VRT files for maps with the same scale into a single file (an "atlas")
and open only one VRT file for loading a whole series of raster maps. 

- - -
Prev () | [Home](Home) | [Manual](DocMain) | [Top](#) | () Next
