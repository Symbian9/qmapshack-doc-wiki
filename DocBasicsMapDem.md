[Home](Home) | [Manual](DocMain)

[TOC]

---
# Install Maps & DEM

Sorry for not being a commercial software, that provides ready made map and DEM packages with an installer. The project does not have the financial resources to provide that kind of stuff. However we think it's really simple to install maps & DEM after you have read this.

## Organization of Maps & DEM

Maps & DEM data should be organized in folders on your system. One for maps and one for the DEM data. For example:

```
#!bash
<myglobal_path>/QMapShackData/Maps
<myglobal_path>/QMapShackData/DEM
```
You have to register these paths with ***File->Setup Map Paths*** and ***File->Setup DEM Paths*** in QMapShack. QMapShack will scan these paths for map and DEM files and lists them in the two list boxes for maps and DEM data. The filename will be the entry name. Underscores get replaced by a space.

## Installing Maps

You can start with the online maps provided by the "Help! I want maps!" button. Basically this will ask you for a path, copy some map files into the path and update the map list. If you have a Garmin device copy the \*.img and \*.jnx maps on the device to the maps folder. That should give you quite a fine collection of maps to be used by QMapShack.

## Installing Raster Maps or DEM Data

This is a bit tricky. Usually this kind of data is very large. And because it is large it is split into several files. But as we have learned QMapShack needs a single file to be listed. That is the point where GDAL's virtual file format (\*.vrt) jumps in. This is just a text file that defines what files in your folder should be taken as single data set. This sounds more complicated than it really is, because QMapShack provides you a tool. Open it with ***Tool->VRT Builder***.

![Alt text](images/DocBasicsMapDem/qmapshack1.png)

1. Select all the files you want to combine to one map or DEM data set.
2. Select a target filename. Of course this should be in your map or DEM path.
3. Press the start button.

When done you can reload the map or DEM list by a right click on the list. Choose ***Reload Maps*** or ***Reload DEM***. The new map should be listed.

If you want to know more about the details of creating a \*.vrt file jump [here](DocBasicsMapDem#markdown-header-gdal-vrt-maps)

---
# Sources of Maps and DEM files

## Maps
A nice collection of Garmin vector maps can be found at [_Freizeitkarte OSM_](http://www.freizeitkarte-osm.de/). 
Next to ready to use maps they publish their tool chain, too. With the tool chain you can produce your 
own OSM based maps for any region. 

## DEM
* Still the best place to look for DEM data is [VIEWFINDER PANORAMAS](http://www.viewfinderpanoramas.org/). 
* For Europe the EEA offers [DEM files with quite good resolution](http://www.eea.europa.eu/data-and-maps/data/eu-dem). 
* For Austria you can download quite high detailed data [here](https://www.data.gv.at/katalog/dataset/d88a1246-9684-480b-a480-ff63286b35b7).

---
#Basic knowledge about maps and DEM files

QMapShack supports the following map formats:

### Vector Maps

 Ext.   | Comment
--------|-------------
.img    | Garmin Map Image. This must be the same file as used on the devices. A collection with a \*tdb file and several \*img files won't do.

### Raster Maps

 Ext.   | Comment
--------|-------------
*.vrt   | GDAL Virtual File. This is a wrapper format for all files supported by GDAL. (see details below)
*.jnx   | Garmin Birds Eye.
*.rmap  | CompeGPS Map Container. Just a very reduced feature set is supported. The tile format must be JPEG. The projection can be Mercator or Gauss Krueger 4/3

### Online Maps

 Ext.   | Comment
--------|-------------
*.wmts | The WMTS server's WMTSCapabilities.xml sheet renamed to a unique name. (see details below)
*.tms | This is a small XML file to define all data needed to access TMS serves. (see details below)

### DEM Files
 
 Ext.   | Comment
--------|-------------
*.vrt | GDAL Virtual File. This is a wrapper format for all files supported by GDAL. (see details below)


## Projection and Scaling

The default basic projection used by QMapShack is Mercator. The geographic datum is WGS84. However you can use maps with different projections and datums as QMapShack will re-project them on-the-fly. The same applies to the scale. 
QMapShack uses a fixed logarithmic scale. All maps will be re-scaled to this scale on-the-fly. 

It is also possible to change the basic projection via "View->Setup Map Workspace".

## GDAL *.vrt Maps

All raster maps handled by GDAL have to be wrapped by a virtual map. You can do this with _gdalbuildvrt_. 
A virtual map can contain one or several map files (you can replace \*.tif with any other extension supported by GDAL, e.g. \*.hgt).

    gdalbuildvrt My_Map_Name.vrt path1/file1.tif path2/file2.tif

If you have a lot of files you can use wildcards:

    gdalbuildvrt My_Map_Name.vrt path1/*.tif

If you use the wacky console of Windows you have to do this in two steps:

    for %f in (*.tif) DO echo %f >> hgt_list.txt
    gdalbuildvrtMy_Map_Name.vrt -input_file_list hgt_list.txt

You can define a no data value, too. This is quite useful for DEM data that does not cover a complete rectangular area:

    gdalbuildvrt -vrtnodata 32767  ASTER_GDEM2_Europe.vrt europe/*.tif

**Important:** All files must have the same color mode and the same projection/datum/scaling.

If the files are large it will take a lot of memory and time to display them in the outer zoom levels. 
You might consider to use gdaladdo to add overview levels to the files. 

    gdaladdo My_Map_Name.vrt 2 4 8 16

This will create a file _My_Map_Name.vrt.ovr_ next to _My_Map_Name.vrt_ containing scaled overviews by factor 
_2 4 8 16_.


## WMTS Maps

A Web Map Tile Service (WMTS) is a standard protocol for serving pre-rendered georeferenced map tiles over the Internet (says Wikipedia). The capabilities of a WMTS server are defines in a XML document named WMTSCapabilities.xml. It can be found on the server:

    http://<server_address>/<optional_path>/1.0.0/WMTSCapabilities.xml

For example there is a variety of free world wide WMTS map from [Arcgis](http://services.arcgisonline.com/arcgis/rest/services). The capability sheet of the topo map can be found at:

    http://services.arcgisonline.com/arcgis/rest/services/World_Topo_Map/MapServer/WMTS/1.0.0/WMTSCapabilities.xml

Or satellite images:

    http://services.arcgisonline.com/arcgis/rest/services/World_Imagery/MapServer/WMTS/1.0.0/WMTSCapabilities.xml

To use the map you download the XML file and rename it, let's say: _World_Topo.wmts_. Move the file into QMapShack's map path and you can use the map online.

For some servers, the "capabilities" XML sheet may need some hand tuning (comparing with the above working ones from Arcgis may greatly help in fixing it). For example, there is some detailed info about French IGN WMTS server in the ["maps tips & tricks"](DocMapsTipsTricks) section.

## TMS Maps

To access TMS servers you have to define a few properties via XML file.  This is an example for definition file with two layers.

```
#!xml
<TMS>
 <Title>OSM D-Land TK 50</Title>
 <MinZoomLevel>3</MinZoomLevel>
 <MaxZoomLevel>18</MaxZoomLevel>
 <Layer idx="0">
  <Title>Open Topo Map</Title>
  <ServerUrl>http://a.tile.opentopomap.org/%1/%2/%3.png</ServerUrl>
  <MinZoomLevel>3</MinZoomLevel>
  <MaxZoomLevel>11</MaxZoomLevel>
 </Layer>
 <Layer idx="1">
  <Title>Trails</Title>
  <ServerUrl>http://tile.waymarkedtrails.org/hiking/%1/%2/%3.png</ServerUrl>
  <MinZoomLevel>3</MinZoomLevel>
  <MaxZoomLevel>9</MaxZoomLevel>
 </Layer>
 <RawHeader>
   <Value name="User-Agent">Whatever</Value>
 </RawHeader>
 <Copyright>Map data: (c) OpenStreetMap contributors, ODbL | Rendering: (c) OpenTopoMap, CC-BY-SA | Trails by tile.waymarkedtrails.org </Copyright>
</TMS>
```
**<Title>** This tag is currently of no use and just for backward compatibility to QLandkarte

**<Copyright>** A copyright notice for the maps displayed.

**<RawHeader>** An optional list of name/value pairs to be inserted into the HTTP header of the request. Some servers want to see special value here.

**<MinZoomLevel>** Can be 0..17. 0 is the most detailed level. Below this level tiles from the specified level will be taken and scaled.

**<MaxZoomLevel>** Can be 1..18. 1 is the most detailed level. Above this level the map will not be drawn.

MinZoomLevel and MaxZoomLevel will be taken as default for the layers. _Note_: zoom level = 18 - map level

**<Layer idx="0">** Specifies a layer. **idx** gives the order to display layers. 0 is first.

On each layer you can define:

**<Title>** A name for the layer. If no title is given "Layer" with the index number is used.
  
**<ServerUrl>** This is the servers URL with placeholders. %1 is for the map level (z), %2 for the column (x) and %3 for the row (y). If the URL contains special characters you have to escape them according to the HTML specification, e.g. & becomes &amp;

**<MinZoomLevel>** Override the default MinZoomLevel for this layer. Can be 0..17. 0 is the most detailed level. Below this level tiles from the specified level will be taken and scaled.

**<MaxZoomLevel>** Override the default MaxZoomLevel for this layer. Can be 1..18. 1 is the most detailed level. Above this level the map will not be drawn.

Next to the normal TMS naming scheme for URLs the URL can be formed by a bit of JavaScript. Here is an example for Microsoft's Bing:

```
#!xml
<TMS>
<Title>Bing</Title>
<Layer idx="0">
<Script><![CDATA[
(
function convert(z1, x1, y1)
{
  serverpart = 0
  serverpart = (serverpart + 1) % 4;
  function encodeQuadTree(zoom, tilex, tiley)
  {
    var tileNum = []
    for (var i = zoom - 1; i >= 0; i--)
    {
      var num = (tilex % 2) | ((tiley % 2) << 1);
      tileNum[i] = new String(num);
      tilex >>= 1;
      tiley >>= 1;
    }
    return tileNum.join("");
  }
  return "http://ecn.t" + serverpart + ".tiles.virtualearth.net/tiles/a" + encodeQuadTree(z1,x1,y1) + ".jpeg?g=1036";
}
)
]]></Script>
</Layer>
<Copyright>Microsoft - Bing</Copyright>
</TMS>
```
Instead of a **<ServerUrl>** the layer has a **<Script>** tag with JavaScript code.



