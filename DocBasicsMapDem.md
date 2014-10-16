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
*.wmts | The WMTS server's WMTSCapabilities.xml sheet renamed to a unique name. 
*.tms | This is a small XML file to define all data needed to access TMS serves. 

### DEM Files
 
 Ext.   | Comment
--------|-------------
*.vrt | GDAL Virtual File. This is a wrapper format for all files supported by GDAL.


## Projection and Scaling

The default basic projection used by QMapShack is Mercator. The geographic datum is WGS84. However you can use maps with different projections and datums as QMapShack will re-project them on-the-fly. The same applies to the scale. 
QMapShack uses a fixed logarithmic scale. All maps will be re-scaled to this scale on-the-fly. 

It is also possible to change the basic projection via "View->Setup Map Workspace".

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

For example there is a variety of free world wide WMTS map from [Arcgis](http://services.arcgisonline.com/arcgis/rest/services). The capability sheet of the topo map can be found at:

    http://services.arcgisonline.com/arcgis/rest/services/World_Topo_Map/MapServer/WMTS/1.0.0/WMTSCapabilities.xml

Or satellite images:

    http://services.arcgisonline.com/arcgis/rest/services/World_Imagery/MapServer/WMTS/1.0.0/WMTSCapabilities.xml

To use the map you download the XML file and rename it, let's say: _World_Topo.wmts_. Move the file into QMapShack's map path and you can use the map online.

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
 <Copyright>Map data: (c) OpenStreetMap contributors, ODbL | Rendering: (c) OpenTopoMap, CC-BY-SA | Trails by tile.waymarkedtrails.org </Copyright>
</TMS>
```
**<Title>** This tag is currently of no use and just for backward compatibility to QLandkarte

**<Copyright>** A copyright notice for the maps displayed.

**<MinZoomLevel>** Can bee 0..17. 0 is the most detailed level. Below this level tiles from the specified level will be taken and scaled.

**<MaxZoomLevel>** Can be 1..18. 1 is the most detailed level. Above this level the map will not be drawn.

MinZoomLevel and MaxZoomLevel will be taken as default for the layers. _Note_: zoom level = 18 - map level

**<Layer idx="0">** Specifies a layer. **idx** gives the order to display layers. 0 is first.

On each layer you can define:

**<Title>** A name for the layer. If no title is given "Layer" with the index number is used.
  
**<ServerUrl>** This is the servers URL with placeholders. %1 is for the map level (z), %2 for the column (x) and %3 for the row (y)

**<MinZoomLevel>** Override the default MinZoomLevel for this layer.

**<MaxZoomLevel>** Override the default MaxZoomLevel for this layer.

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
Instead of a **<ServerUrl>** the layer as a **<Script>* tag with Java code.


## Sources of Maps and DEM files

A nice collection of Garmin vector maps can be found at [_Freizeitkarte OSM_](http://www.freizeitkarte-osm.de/). 
Next to ready to use maps they publish their tool chain, too. With the tool chain you can produce your 
own OSM based maps for any region. 

Still the best place to look for DEM data is [VIEWFINDER PANORAMAS](http://www.viewfinderpanoramas.org/). 

