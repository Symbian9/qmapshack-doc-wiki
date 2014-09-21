[Home](Home) | [Manual](DocMain)

#Basic knowledge about maps and DEM files

QMapShack supports the following map formats:

### Vector Maps

 Ext.   | Comment
--------|-------------
.img    | Garmin Map Image. This must be the same file as used on the devices. A collection with a \*tdb file and several \*img files won't do.

### Raster Maps

 Ext.   | Comment
--------|-------------
*.vrt   | GDAL Virtual File. This is a wrapper format for all files supported by GDAL.
*.jnx   | Garmin Birds Eye.
*.rmap  | CompeGPS Map Container. Just a very reduced feature set is supported. The tile format must be JPEG. The projection can be Mercator or Gauss Krueger 4/3

### Online Maps

 Ext.   | Comment
--------|-------------
*.wmts |  The WMTS server's WMTSCapabilities.xml sheet renamed to a unique name. (QMapShack V. 0.5.0 and later)

### DEM Files
 
 Ext.   | Comment
--------|-------------
*.vrt   | GDAL Virtual File. This is a wrapper format for all files supported by GDAL.


## Projection and Scaling

The default basic projection used by QMapShack is Mercator. The geographic datum is WGS84. However you can use maps with different projections and datums as QMapShack will re-project them on-the-fly. The same applies to the scale. 
QMapShack uses a fixed logarithmic scale. All maps will be re-scaled to this scale on-the-fly. 

It is also possible to change the basic projection via "View-Setup Map Workspace".

## GDAL *.vrt Maps

All raster maps handled by GDAL have to be wrapped by a virtual map. You can do this with _gdalbuildvrt_. 
A virtual map can contain one or several map files.

    gdalbuildvrt My_Map_Name.vrt path1/file1.tif path2/file2.tif

If you have a lot of files you can use wildcards:

    gdalbuildvrt My_Map_Name.vrt path1/*.tif

**Important:** All files must have the same color mode and the same projection/datum/scaling.

If the files are large it will take a lot of memory and time to display them in the outer zoom levels. 
You might consider to use gdaladdo to add overview levels to the files. 

    gdaladdo My_Map_Name.vrt 2 4 8 16

This will create a file _My_Map_Name.vrt.ovr_ next to _My_Map_Name.vrt_ containing scaled overviews by factor 
_2 4 8 16_.

The very same applies to DEM files.

## WMTS Maps

A Web Map Tile Service (WMTS) is a standard protocol for serving pre-rendered georeferenced map tiles over the Internet (says Wikipedia). The capabilities of a WMTS server are defines in a XML document named WMTSCapabilities.xml. It can be found on the server:

    http://<server_address>/<optional_path>/1.0.0/WMTSCapabilities.xml

For example there is a variety of free world wide WMTS map from [Arcgis](http://services.arcgisonline.com/arcgis/rest/services). A the capability sheet of the topo map can be found at:

    http://services.arcgisonline.com/arcgis/rest/services/World_Topo_Map/MapServer/WMTS/1.0.0/WMTSCapabilities.xml

Or satellite images:

    http://services.arcgisonline.com/arcgis/rest/services/World_Imagery/MapServer/WMTS/1.0.0/WMTSCapabilities.xml

To use the map you download the XML file and rename it to let's say: _World_Topo.wmts_. Move the file into QMapShack's map path and you can use the map online.

## Sources of Maps and DEM files

A nice collection of Garmin vector maps can be found at [_Freizeitkarte OSM_](http://www.freizeitkarte-osm.de/). 
Next to read to use maps they publish their toolchain, too. With the toolchain you can produce your 
own OSM based maps for any region. 

Still the best place to look for DEM data is [VIEWFINDER PANORAMAS](http://www.viewfinderpanoramas.org/). 

