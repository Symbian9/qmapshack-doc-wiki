[Prev](AdvMapDetails) (Details of map use) | [Home](Home) | [Manual](DocMain) | [Index](AxAdvIndex) | (Data handling) [Next](AdvDataHandling)
- - -
[TOC]
- - -

# Maps: Tips & Tricks

If you have a hot tip for free maps or a spiffy trick about what to do with maps add few words here.

## Backdoor to use a WMS server as TMS server

QMapShack's TMS file specification allows Java Script to build URLs. This can be used to build a WMS URL if the WMS server supports the projection commonly used for TMS. This is either EPSG:3857 or EPSG:900913.

This is an example how to do it. You have to replace the URL before **&BBOX=" + bbox + "&WIDTH=256&HEIGHT=256** with what ever is needed for the WMS server. This might be a bit tricky.
```
#!XML
<TMS>
<Layer idx="0">
<Title>NRW DTK Sammeldienst</Title>
<Script><![CDATA[(
function convert(z1,x1,y1)
{ function M(n){return 256*n*(156543.03392804062/(1<<z1))-20037508.342789244}
  y=(1<<z1)-1-y1;
  bbox=M(x1)+','+M(y)+','+M(x1+1)+','+M(y+1);
  return "http://www.wms.nrw.de/geobasis/wms_nw_dtk?LAYERS=nw_dtk_col&FORMAT=image/png&SRS=EPSG:3857&EXCEPTIONS=application/vnd.ogc.se_inimage&SERVICE=WMS&VERSION=1.1.1&REQUEST=GetMap&BBOX=" + bbox + "&WIDTH=256&HEIGHT=256";
}
)]]></Script>
</Layer>
<Copyright>Geobasis NRW 2015</Copyright>
</TMS>

```
The official documentation of WMS standard can be found on [http://www.opengeospatial.org/standards/wms](http://www.opengeospatial.org/standards/wms).

The following version loads the French BRGM WMS tiles (adapted from QLandkarteGT xml config file) :
```
#!XML
<TMS>
<Layer idx="0">
<Title>IGN BRGM France</Title>
<Script><![CDATA[(
function convert(z1,x1,y1)
{ function M(n){return 256*n*(156543.03392804062/(1<<z1))-20037508.342789244}
  y=(1<<z1)-1-y1;
  bbox=M(x1)+','+M(y)+','+M(x1+1)+','+M(y+1);
  return "http://mapsref.brgm.fr/wxs/refcom-brgm/refign?LAYERS=FONDS_SCAN&FORMAT=image/png&SRS=EPSG:3857&SERVICE=WMS&VERSION=1.1.1&REQUEST=GetMap&BBOX=" + bbox + "&WIDTH=256&HEIGHT=256";
}
)]]></Script>
</Layer>
<Copyright>France IGN BRGM</Copyright>
</TMS>

```

### Use ArcGIS Server like a TMS Server
The same logic can be implemented on the **export** command of ArcGIS server maps. Here is an example URL:

```
"http://www.pcn.minambiente.it/arcgis/rest/services/immagini/IGM_25000/MapServer/export?dpi=96&transparent=true&format=png8&bbox=" + bbox + " &bboxSR=3857&imageSR=3857&size=256,256&f=image"
```
In most cases the request will work as expected, even though the native projection wouldn't be 3857 (Web Mercator).
For documentation of export command refer to:
[http://resources.arcgis.com/en/help/arcgis-rest-api/index.html#/Export_Map/02r3000000v7000000/](http://resources.arcgis.com/en/help/arcgis-rest-api/index.html#/Export_Map/02r3000000v7000000/).


### Use a WMTS server as TMS server
Nearly the same can be applied to build a WMTS request. Here is an example for Spanish IGN Raster map:
 
```
#!XML
<TMS>
<Layer idx="0">
<Title>IGN topografico</Title>
<Script><![CDATA[(
function convert(z1,x1,y1)
{y=(1<<z1)-1-y1;
  return "http://www.ign.es/wmts/mapa-raster?request=getTile&format=image/png&layer=MTN&TileMatrixSet=GoogleMapsCompatible&TileMatrix="+z1+"&TileCol="+x1+"&TileRow="+y1;
}
)]]></Script>
</Layer>
<Copyright>IGN</Copyright>
</TMS>

```
For most cases you only have to edit the URL string before **&TileMatrix=**

Note that WMTS request is `getTile` instead of `getMap` , so there is no need to define a BBOX, but the `TileMatrix`, `TileRow`, and  `TileCol` parameters must be included.

This is a useful workaround if loading a map with its WMTSCapabilities.xml file fails.

## Access most online maps as TMS using MapProxy

Preparing your next outdoors adventure using all available information sources in a single software (QMapShack) is quite useful. For some parts of the world, access to local topo maps may even be paramount to your safe return. Yet, QMapShack has less support for web maps than QLandkarteGT did, and even in QLGT crafting a GDAL source file was already akin to black magic.

This section describes how to coerce most online maps into a format that QMapShack can use using MapProxy.

Pros:

* Can use maps in SRS (projections) incompatible with QMapShack. QMapShack can only use the web-standard EPSG:3857 and EPSG:900913.
* Can access maps through different protocols. QMapShack only supports natively Web-TMS, and WMS-C through hacks.
* Can rescale a layer, for example if you prefer to have an overview with that rich topo map scaled down to 1:100k rather than an 1:100k OSM map that's empty in that part of the world.
* No JavaScript hackery.

Cons:

* It requires an extra piece of software to run along QMapShack.

### Gathering information

Required information, for each map layer you want to display:

* Layer name.
* Source URL.
* Source SRS, EPSG:xxxx.
* Bounding box of the served map.
* Size of the served tiles, in pixels.
* Supported resolutions (in pixels per ground unit).

Most public map servers are configured to serve only map tiles already in their cache. Otherwise, the server would consume a lot of resources to reproject, scale and tile the source material to meet your requirements.

So, please double-check that your requests match precisely (coordinates etc.) the usage examples you found, even if "it works": not only it wouldn't be fair to other users, but you'd probably attract unwanted attention and get yourself banned. If it doesn't work or your requests are wrong, you probably got one of the parameters above wrong.

### MapProxy basic usage

This example uses the libre [MapProxy](https://mapproxy.org). See their documentation for installation options, configuration etc. In its simplest deployment option, just start it like this:

    mapproxy-util serve-develop ./myconf.yaml

And configure this URL as a TMS source in QMapShack or QLandkarteGT:

    http://localhost:8080/tiles/base_EPSG3857/%1/%2/%3.png?origin=nw

You can also access `http://localhost:8080/` for a basic web GUI ("demo") with an OpenLayer demo of your setup.

### Configuration template

Here is a template for myconf.yaml, with the following fictious values. Adapt it to suit your needs.

* Layer name: mylayer.
* Source SRS, EPSG:1234.
* Bounding box of the served map: `0,0` -> `24000000,42000000` in the EPSG:1234.
* Size of the served tiles, in pixels: 256x256.
* Supported resolutions: 2 (only).

NB: There is a `fallback` OSM-based source for areas or resolutions not covered by `upstream` (the target web map). That fallback is useful when testing the configuration with the MapProxy built-in "demo" page (see above). You can strip it out of the configuration once it works.

```yaml
services:
  demo:
  tms:

sources:
  upstream_mylayer:
    # That server is speaking WMS-C, but the tile type will let us mimic the
    # example URL exactly.
    type: tile
    url: https://example.com/mapserver/wms?KEY=&SERVICE=WMS&VERSION=1.1.1&REQUEST=GetMap&STYLES=&FORMAT=image%%2Fpng&LAYERS=mylayer&SRS=EPSG%%3A1234&BBOX=%(bbox)s&WIDTH=256&HEIGHT=256
    grid: upstream_mylayer_grid
    # Upstream's native resolution for this layer is 2. We *don't* set this
    # here, it's already in the upstream_mylayer_grid definition. Instead, we
    # specificy that content from this source is to be used scaled, down to res
    # 10 if needed (larger res numbers mean lower-detail map!).
    # min/max_res in sources is the key to setting which source serves which
    # resolution.
    min_res: 10
    coverage:
      bbox: [ 0, 0, 24000000, 42000000 ]
      srs: 'EPSG:1234'
  fallback:
    type: tile
    url: https://tile.thunderforest.com/landscape/%(tms_path)s.png
    grid: GLOBAL_WEBMERCATOR
    # We don't restrict resolutions here: we're only a fallback. upstream will
    # get precedence because of the cache source order and will serve all
    # resolutions we allowed for it.

layers:
  - name: base
    title: base
    sources: [output_cache]

grids:
  upstream_mylayer_grid:
    # Adapt `origin` to the actual origin in EPSG:1234.
    srs: 'EPSG:1234'
    origin: sw
    tile_size: [ 256, 256 ]
    # That's the only resolution we're interested into in this layer.
    # This will prevent MapProxy from attempting to fetch higher/lower
    # resolutions for this layer. Instead, it'll scale up/down the 2 res as
    # needed.
    res: [ 2 ]
    bbox: [ 0, 0, 24000000, 42000000 ]
    max_shrink_factor: 16

caches:
  output_cache:
    sources: [fallback, upstream_cache]
    grids: [GLOBAL_WEBMERCATOR]
  upstream_cache:
    sources: [upstream_mylayer]
    grids: [upstream_mylayer_grid]

globals:
  cache:
    # upstream does not support this, and MapProxy whines if we compose a layer
    # from caches with different such settings.
    meta_size: [1, 1]
    meta_buffer: 0
  http:
    ssl_no_cert_checks: true
```

### Troubleshooting

* No map for `upstream`:
    * Check the MapProxy log for errors.
    * Try one of the upstream GET requests in your browser: most likely you'll get an error message that may hint at which parameters you got wrong.
    * Double-check your parameters from "Gathering information" (yes, again) and how you filled them in the configuration template.
    * Some map servers may reject requests that do not originate from their web-based map viewer, based on HTTP headers like User-Agent and Referer. Check what your regular browser sends for these and replicate them in `sources.upstream_mylayer.http.headers` (see the [MapProxy documentation](https://mapproxy.org/docs/nightly/sources.html#id7)).
* No map for `fallback`:
    * ThunderForest announced they would require an API key in the URLs in early 2017, try adding one.
* Tiles are misplaced or upside-down:
    * Check that `grids.upstream_mylayer_grid.origin` is correct: where is the 0,0 point in that SRS? Top-left or bottom-left?
    * Make sure that you are passing `?origin=nw` in your requests to MapProxy.
    * Do not attempt to customize the resolution list for real web-TMS sources, IOW those with a %z parameter. At least, it didn't work for me (user error or MapProxy bug?). It's OK to use a subset of available resolutions for WMS-C sources however (those with a bounding box).

---

## WMTS configuration to access French IGN maps ("Géoportail")

As an individual, you can apply for a free non-commercial access to the French IGN WMTS servers (for example through their "Géoportail API", but also works with other WMTS clients like QGIS and QMapShack). Lots of thanks to them for this free access because their maps are truly awesome. The original source of information about this is at the following URL (in French):

[http://dogeo.fr/wmts_ign/](http://dogeo.fr/wmts_ign/)

The terms of use enforce a few restrictions listed at the following URL:

[http://professionnels.ign.fr/licence-api-geoportail-libre-et-gratuite](http://professionnels.ign.fr/licence-api-geoportail-libre-et-gratuite)

You can register for this free "licence géoservices IGN pour usage grand public" at the following URL:

[http://professionnels.ign.fr/api-web](http://professionnels.ign.fr/api-web)

You will be prompted to select which layers you want. Although the same procedure probably applies to any of the available layers, the process described here has only been tried with the map layer called "cartes IGN" (or "GEOGRAPHICALGRIDSYSTEMS.MAPS" on the WMTS server).

Note that you will also need to provide your IP address (external IP: that is the IP of your internet router) during the application process. Usually you can easily find this IP in your router status page, or alternatively you can visit websites such as this one:

[http://tell-my-ip.com/](http://tell-my-ip.com/)

The WMTS access may be denied if you try to connect from another IP (and this may be a problem if your ISP keeps changing your IP). This problem can be diagnosed by trying to access a map tile directly from a web browser (use the sample URL below). In case of IP mismatch you will obtain an error message saying "wrong IP address" instead of the map tile. The registered IP can be modified on the "IGN Espace Pro" website, under your account, you should click on "mes commandes" and then "modifier mon contrat". Note that they say it can take up to 12h 
before the new IP is actually activated.

Shortly after your order (less than one hour), you will receive a confirmation e-mail, and you will be able to retrieve a personal ID (24 character key) from your personal account on the IGN website.

You can test the WMTS access directly in your web browser by fetching a random map tile, for example:

[https://wxs.ign.fr/**[YOUR_ID]**/wmts?LAYER=GEOGRAPHICALGRIDSYSTEMS.MAPS&EXCEPTIONS=text/xml&FORMAT=image/jpeg&SERVICE=WMTS&VERSION=1.0.0&REQUEST=GetTile&STYLE=normal&TILEMATRIXSET=PM&&TILEMATRIX=1&TILECOL=0&TILEROW=0](https://wxs.ign.fr/[YOUR_ID]/wmts?LAYER=GEOGRAPHICALGRIDSYSTEMS.MAPS&EXCEPTIONS=text/xml&FORMAT=image/jpeg&SERVICE=WMTS&VERSION=1.0.0&REQUEST=GetTile&STYLE=normal&TILEMATRIXSET=PM&&TILEMATRIX=1&TILECOL=0&TILEROW=0)

(don't forget to replace **[YOUR_ID]** with your actual 24 character personal key)

The WMTS "capabilities" can then be fetched at the following URL:

[https://wxs.ign.fr/**[YOUR_ID]**/geoportail/wmts?SERVICE=WMTS&REQUEST=GetCapabilities](https://wxs.ign.fr/[YOUR_ID]/geoportail/wmts?SERVICE=WMTS&REQUEST=GetCapabilities)

(don't forget to replace **[YOUR_ID]** with your actual 24 character personal key)

Unfortunately, unlike other WMTS servers, this capabilities file does not directly work in QMapShack (although it works "as is" in QGIS). To work around this, you will have to modify it with a text editor to include a <ResourceURL> line at the end of the layer description (just before the </Layer> directive) for the "GEOGRAPHICALGRIDSYSTEMS.MAPS" layer (must be adjusted and tested for other layers).

**Download: [IGN.wmts](IGN.wmts)**

(again, don't forget to replace the 3 occurrences of **[YOUR_ID]** with your actual 24 character personal key)

Note that this file was working as of September 22, 2015 but may stop working in the future in case IGN changes its WMTS server configuration.

---
## Contour lines
There are two ways to add a transparent contour line layer to your map view:

- vector map in Garmin IMG format
- raster map with transparent contour line tiles 
### Vector map in Garmin IMG format
Some maps for Garmin devices provide a separate img file with contour lines. Add this file to your QMS map directory and you can use it as contour line overlay in map views. 

Sources for vector contour line maps:

- [OpenTopoMap](http://garmin.opentopomap.org/#download): the "Garmin" file contains both a base map and a contour line map in img format
- [BBBike](http://extract.bbbike.org/?lang=en): allows to create a contour line file for a custom area. 
- [Velomap](https://www.velomap.org): download the .exe file and chose "install a separate contour lines only map" during the installation process.

### Raster contour line layer
Some TMS tile servers provide contour line only layers. To use such a layer in QMS, add a *.tms file to your map directory. 

Sample TMS file for the contour line layer from [OpenSnowMap](http://www.opensnowmap.org):


```
#!xml

<TMS>
 <Title>OpenSnowMap Contour Lines</Title>
 <MinZoomLevel>1</MinZoomLevel>
 <MaxZoomLevel>1024</MaxZoomLevel>
 <Layer idx="0">
     <ServerUrl>http://www.opensnowmap.org/opensnowmap-overlay/%1/%2/%3.png</ServerUrl>
 </Layer>
 <Copyright>Openstreetmap contributors | Rendering: www.opensnowmap.org | DEM: ASTER GDEM is a product of METI and NASA
SRTM V4.1 from CGIAR-CSI EU-DEM: Produced using Copernicus data and information funded by the European Union </Copyright>
</TMS>

```
Other sources for transparent contour line tiles:

- OpenMapSurfer from GIScience at Heidelberg University   
```<ServerUrl>http://129.206.74.245:8006/tms_il.ashx?x=%2&amp;y=%3&amp;z=%1</ServerUrl>```

---
## Using openmtbmap.org & velomap.org in QMapShack (Linux only)
In order to use openmtbmap.org or velomap.org maps within QMapShack you first need to create a gmapsupp.img from the map tiles. 
For Windows user, there is an integrated batchfile, which will do all necessary steps; so this tutorial is for Linux users. More information you may find [here](https://openmtbmap.org/de/tutorials/mkgmap/).

In Linux, please check if package p7zip-full is installed – we need it to unpack the .exe file. Open the console and execute *sudo apt-get install p7zip-full* . We need [Mkgmap](http://www.mkgmap.org.uk/), too. Also Java is required.

1. Download openmtbmap-ALPS and the latest version of mkgmap
2. Create a folder like ~/openmtbmap_alps and unzip your downloaded version
3. Open the .exe file and extract all files called 6528xxxx.img (maptiles) and 7528xxxx (contour lines), and a typ file (the layout of the map). For this sample we choose *widealp.TYP* 

The folder should now contain all map tiles, the contour lines, the layout file and the extracted files from mkgmap.

Now start your console, browse to your folder and copy the following code: 


```
#!sh

java  -Xmx2048M -jar mkgmap.jar --index --family-id=6528 --description="openmtbmap_alps" --series-name="openmtbmap_alps" --family-name="openmtbmap_alps" --product-id=1 --gmapsupp 6*.img 7*.img widealp.TYP
```


Then press <Enter> and a gmapsupp.img will be created, which you can easily rename to opentmtbmap_alps.img. Now copy this file onto your GPS unit and in your QMapShack maps folder as well.

If you would like do it with some other layout, simply replace the *.TYP (f.e. easyalps.TYP). 
If you prefer another country be careful: all 6x.img and 7x.img must be from the particular openmtbmap country file! Also don't forget to replace the --family-id with the one from your country.

This is really a quick way, to integrate your favorite openmtbmaps or velomaps into QMapShack.

If you prefer a GUI: you can still use QLandkarteGT for creating gmapsupp.img, too. 

Links (with further information and some tutorials):

* [openmtbmap.org](https://openmtbmap.org/)
* [velomap.org](https://velomap.org/)
* [Mkgmap](http://www.mkgmap.org.uk/)

### Script

If you want to update your maps regularly you might consider using the script below.
The script requires the following tools to be installed:

 * `wget` (downloading)
 * `7z` (extraction)
 * `mkgmap` (creation of gmapsupp.img)

#### Configuration

The script below is configured to download the OpenMTBMap for Bavaria, convert it to `OpenMTBMap_<date>.img` using traddby.TYP and move it to `~/.qmapshack_maps/`.

If this does not match your requirements, you will need to adopt the values *FILESRC*, *IMGFMT*, *QMSMAPDIR* and *TYPE*:

* *FILESRC*: [Navigate here](http://ftp5.gwdg.de/pub/misc/openstreetmap/openmtbmap/odbl/), find the file you want to download and write the URL to *FILESRC*

* *IMGFMT*: Name of the resulting file, see `man 1 date`

* *QMSMAPDIR*: Path to your QMS-Map folder (`~` will not work, use `${HOME}` instead)

Depending on your system's configuration you will need to change *MKGMAP* to allow proper execution of `mkgmap` (see section above).


```
#!sh
#! /bin/sh

# configuration

FILESRC="http://ftp5.gwdg.de/pub/misc/openstreetmap/openmtbmap/odbl/germany/mtbbayern.exe"
IMGFMT="OpenMTBMap_%Y-%m-%d.img"
QMSMAPDIR="${HOME}/.qmapshack_maps/"
TYPE="traddby.TYP"
MKGMAP="mkgmap"

# code starts here, no changes below here required

error_check() {
	if [ $1 != 0 ]; then
		echo ${red}ERROR${NC}
		exit 1
	else
		echo ${green}OK${NC}
	fi
}

tool_check() {
	which $1 2>&1 1>/dev/null
	if [ $? != 0 ]; then
		echo ${red}ERROR: $1 missing${NC}
		exit 1
	fi
}

red="\033[0;31m"
green="\033[0;32m"
NC="\033[0m"

TMP=`mktemp`
if [ ! -f "${TMP}" ]; then
	echo ${red}ERROR: failed to get temp. file${NC}
	exit 1
fi

tool_check "wget"
tool_check "7z"
${MKGMAP} >/dev/null 2>&1
if [ $? != 0 ]; then
	echo ${red}ERROR: mkgmap can\'t be executed${NC}
	echo ${red}ERROR: make sure MKGMAP is set properly in script configuration${NC}
	exit 1
fi

echo -n " * Downloading... "
wget -q -O "$TMP" "$FILESRC"
error_check $?

echo -n " * Decompressing... "
7z e -o"${TMP}_" ${TMP} >/dev/null
error_check $?

FILETIME=`stat -c %Y ${TMP}`
IMGFILE=`date -d@${FILETIME} +"${IMGFMT}"`

echo -n " * Building ${IMGFILE}... "
cd "${TMP}_"
FID=`ls -x 7*.img | cut -c1-4`
${MKGMAP} --show-profiles=1 --product-id=1 --family-id=${FID} --index --gmapsupp 6*.img 7*.img ${TYPE} >/dev/null
error_check $?

echo -n " * Moving gmapsupp.img to ${QMSMAPDIR}... "
mv "${TMP}_/gmapsupp.img" "${QMSMAPDIR}/${IMGFILE}"
error_check $?

echo -n " * Cleanup... "
rm -rf "${TMP}" "${TMP}_"
error_check $?

```

## TMS Configuration for NZ Topo

Script converts to OSGEO TMS (http://www.maptiler.org/google-maps-coordinates-tile-bounds-projection/)
(Optimized by KartenFreak, thank you)
```
<TMS>
	<Title>NZTopo</Title>
	<MinZoomLevel>6</MinZoomLevel>
	<MaxZoomLevel>15</MaxZoomLevel>
	<Layer idx="0">
		<Title>NZTopo</Title>
		<Script><![CDATA[(
		function convert(z1,x1,y1)
		{  return "http://nz1.nztopomaps.com/" + z1 + "/" + x1 + "/" + ((1<<z1) - y1 - 1) + ".png";
		}
		)]]></Script>
	</Layer>
</TMS>
```

## (Russian) Raster maps (ex-military (aka "Genshtab" /Maps of the General Staff/), non-classified maps and so on) 

[Quick way to prepare raster map for QMapShack](QuickWayToPrepareRasterMapForQMapShack)

## Some more WMS & WMTS Server Maps

[Download WMS & WMTS Server Maps](http://www.mtb-touring.net/qms/onlinekarten-einbinden) 

* Sat: ArcGIS, Bing
* OSM Style: mapnik, german & french style, hikebikemap, humanitarian, landscape, opencyclemap, oepnvkarte, outdoors
* Topo: OSM Topo, World Topo, Alpenkarte, 4UMaps.eu, MTBMap.cz, Reit- und Wanderkarte
* Waymarkedtrails: Inlinescating, Mountainbiking, Cycling, Riding, Hiking, Slopemap
* Overlay: Hillshading
* Google: Google Hybrid Maps, Google Maps, Google Sat Map, Google Terrain Map
* Geoland.at: Basemap, Basemap Overlay, Basemap Grau, Basemap High DPI & Basemap Orthofoto
* Strava: Running & Cycling Heatmap

[Spanish IGN and other regions online maps](https://www.dropbox.com/s/sfzxdehmdqfs784/ESP_IGN_QMS_onlinemaps.zip?dl=0) 

* ESP IGN:  Ortofoto, Topo map, Historical maps
* Other: Topo Euskal Herria, Gipuzkoa_5bm , Catalunya topo

- - -
[Prev](AdvMapDetails) (Details of map use) | [Home](Home) | [Manual](DocMain) | [Index](AxAdvIndex) | [Top](#) | (Data handling) [Next](AdvDataHandling)