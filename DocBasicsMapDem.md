[Home](Home) | [Manual](DocMain)

#Basic knowledge about maps and DEM files

MapRoom supports the following map formats:

<table  width="500px">
<tr valign="top">
    <td colspan="2"style="background-color: #0000FF; color: #FFFFFF;">Vector Maps</td>
</tr>
<tr valign="top">
    <td>*.img</td>
    <td>Garmin Map Image. This must be the same file as used on the devices. A collection with a *tdb file and several *img files won't do.</td>
</tr>
<tr valign="top">
    <td colspan="2" style="background-color: #0000FF; color: #FFFFFF;">Raster Maps</td>
</tr>
<tr valign="top">
    <td>*.vrt</td>
    <td>GDAL Virtual File. By that all raster map formats known to GDAL can be used.</td>
</tr>
<tr valign="top">
    <td>*.jnx</td>
    <td>Garmin Birds Eye.</td>
</tr>
<tr valign="top">
    <td>*.rmap</td>
    <td>CompeGPS Map Container. Just a very reduced feature set is supported. The tile format must be JPEG. The projection can be Mercator or Gauss Krueger 4/3</td>
</tr>
<tr valign="top">
    <td colspan="2" style="background-color: #0000FF; color: #FFFFFF;">DEM Files</td>
</tr>
<tr valign="top">
    <td>*.vrt</td>
    <td>GDAL Virtual File. By that all DEM file formats known to GDAL can be used.</td>
</tr>
</table>

## Projection and Scaling

The basic projection used by MapRoom is Mercator. The datum is WGS84. However you can use maps with different 
projections and datums as MapRoom will re-project them on-the-fly. The same applies to the scale. 
Maproom uses a fixed logarithmic list of scale levels. All maps will be scaled to these scale levels on-the-fly.

## GDAL Tips and Tricks

All raster maps handled by GDAL have to be wrapped into a virtual map. You can do this with _gdalbuildvrt_. 
A virtual map can contain one or several map files.

    gdalbuildvrt My_Map_Name.vrt path1/file1.tif path2/file2.tif

If the files are large it will take a lot of memory and time to display them in the outer zoom levels. 
You might consider to use gdaladdo to add overview levels to the files. 

    gdaladdo My_Map_Name.vrt 2 4 8 16

This will create a file _My_Map_Name.vrt.ovr_ next to _My_Map_Name.vrt_ containing scaled overviews by factor 
_2 4 8 16_.

The very same applies to DEM files.

## Sources of Maps and DEM files

A nice collection of Garmin vector maps can be found at [_Freizeitkarte OSM_](http://www.freizeitkarte-osm.de/). 
They publish their toolchain next to some ready to use maps. With the toolchain you can produce your 
own OSM based maps for any reagion. 

Still the best place to look for DEM data is [VIEWFINDER PANORAMAS](http://www.viewfinderpanoramas.org/). 

