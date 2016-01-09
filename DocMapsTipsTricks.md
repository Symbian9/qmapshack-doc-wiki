[Home](Home) | [Manual](DocMain)

[TOC]


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

### Use ArcGIS Server like a TMS Server
The same logic can be implemented on the **export** command of ArcGIS server maps. Here is an example URL:

```
"http://sigel.aneel.gov.br/arcgis/rest/services/CartasTopograficas/MapServer/export?dpi=96&transparent=true&format=png8&bbox=" + bbox + " &bboxSR=3857&imageSR=3857&size=256,256&layers=show:17&f=image"
```
In most cases the request will work as expected, even though the native projection wouldn't be 3857 (Web Mercator).
For documentation of export command refer to:
[http://resources.arcgis.com/en/help/arcgis-rest-api/index.html#/Export_Map/02r3000000v7000000/](http://resources.arcgis.com/en/help/arcgis-rest-api/index.html#/Export_Map/02r3000000v7000000/).

---

## WMTS configuration to access French IGN maps ("Géoportail")

As an individual, you can apply for a free non-commercial access to the French IGN WMTS servers (for example through their "Géoportail API", but also works with other WMTS clients like QGIS and QMapShack). Lots of thanks to them for this free access because their maps are truely awesome. The original source of information about this is at the following URL (in French):

http://dogeo.fr/wmts_ign/

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
##Contour lines
There are two ways to add a transparent contour line layer to your map view:

- vector map in Garmin IMG format
- raster map with transparent contour line tiles 
###Vector map in Garmin IMG format
Some maps for Garmin devices provide a separate img file with contour lines. Add this file to your QMS map directory and you can use it as contour line overlay in map views. 

Sources for vector contour line maps:

- [OpenTopoMap](http://garmin.opentopomap.org/#download): the "Garmin" file contains both a base map and a contour line map in img format
- [BBBike](http://extract.bbbike.org/?lang=en): allows to create a contour line file for a custom area. 
- [Velomap](https://www.velomap.org): download the .exe file and chose "installe a separate contour lines only map" during the installation process.

###Raster contour line layer
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
##Using openmtbmap.org & velomap.org in QMapShack
In order to use openmtbmap.org or velomap.org maps within QMapShack you first need to create a gmapsupp.img from the map tiles. 
For Windows user, there is an integrated batchfile, which will do all necessary steps; so this tutorial is for Linux users. More information you may find [here](https://openmtbmap.org/de/tutorials/mkgmap/).

In Linux, please check if package p7zip-full is installed – we need it to unpack the .exe file. Open the console and execute *sudo apt-get install p7zip-full* . We need [Mkgmap](http://www.mkgmap.org.uk/), too. Also Java 1.6 is required.

1. Download openmtbmap-ALPS and the latest version of mkgmap
2. Create a folder like ~/openmtbmap_alps and put in the mkmap.jar
3. Open the .exe file and extract all files called 6528xxxx.img (maptiles) and 7528xxxx (counterlines), and a typ file (the layout of the map). For this sample we choose *widealp.TYP* 

The folder should now contain all map tiles, the counterlines, the layout file and the mkgmap.jar.

Now start your console, browse to your folder and copy the following code: 

*java  -Xmx2048M -jar --family-id=6528 --description="openmtbmap_alps" --series-name="openmtbmap_alps“ --family-name="openmtbmap_alps" --product-id=1 --gmapsupp 6*.img 7*.img widealp.TYP*

Then press <Enter> and  a gmapsupp.img will be created, which you can easily rename to opentmtbmap_alps.img. Now copy this file unto your GPS unit and in your QMapShack maps folder as well.

If you would like do it with some other layout, simply replace the *.TYP (f.e. easyalps.TYP). 
If you prefer another country be careful: all 6x.img and 7x.img must be from the particular openmtbmap country file! Also don't forget to replace the --family-id with the one from your country.

This is really a quick way, to integrate your favourite openmtbmaps or velomaps into QMapShack.

If you prefer a GUI: you can still use QLandkarteGT for creating gmapsupp.img, too. 

Links (with further information and some tutorials):

* [openmtbmap.org](https://openmtbmap.org/)
* [velomap.org](https://velomap.org/)
* [Mkgmap](http://www.mkgmap.org.uk/)