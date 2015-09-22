[Home](Home) | [Manual](DocMain)

#Maps: Tips & Tricks

If you have a hot tip for free maps or a spiffy trick to do with maps add a small section here.

# WMTS configuration to access French IGN maps ("Géoportail") #

As an individual, you can apply for a free non-commercial access to the French IGN WMTS servers (for example through their "Géoportail API", but also works with other WMTS clients like QGIS and QMapShack). The original source of information about this is at the following URL (in French):

http://dogeo.fr/wmts_ign/

Just register for a free "licence géoservices IGN pour usage grand public" at the following URL:

[http://professionnels.ign.fr/api-web](http://professionnels.ign.fr/api-web)

You will be prompted to select which layers you want. Although the same procedure probably applies to any of the available layers, the process described here has only been tried with the map layer called "cartes IGN" (or "GEOGRAPHICALGRIDSYSTEMS.MAPS" on the WMTS server).

Note that you'll need to provide your IP address in the application process. The WMTS access may be denied if you try to connect from another IP (and this may be a problem if your ISP keeps changing your IP).

Shortly after your order (less than one hour), you will receive a confirmation e-mail, and you will be able to retrieve a personal ID (24 character key) from your personal account on the IGN website.

You can test the WMTS access directly in your web browser by fetching a random map tile, for example:

[https://wxs.ign.fr/**[YOUR_ID]**/wmts?LAYER=GEOGRAPHICALGRIDSYSTEMS.MAPS&EXCEPTIONS=text/xml&FORMAT=image/jpeg&SERVICE=WMTS&VERSION=1.0.0&REQUEST=GetTile&STYLE=normal&TILEMATRIXSET=PM&&TILEMATRIX=1&TILECOL=0&TILEROW=0](https://wxs.ign.fr/[YOUR_ID]/wmts?LAYER=GEOGRAPHICALGRIDSYSTEMS.MAPS&EXCEPTIONS=text/xml&FORMAT=image/jpeg&SERVICE=WMTS&VERSION=1.0.0&REQUEST=GetTile&STYLE=normal&TILEMATRIXSET=PM&&TILEMATRIX=1&TILECOL=0&TILEROW=0)

(don't forget to replace **[YOUR_ID]** with your actual 24 character personal key)

The WMTS "capabilities" can then be fetched at the following URL:

[https://wxs.ign.fr/**[YOUR_ID]**/geoportail/wmts?SERVICE=WMTS&REQUEST=GetCapabilities](https://wxs.ign.fr/[YOUR_ID]/geoportail/wmts?SERVICE=WMTS&REQUEST=GetCapabilities)

(don't forget to replace **[YOUR_ID]** with your actual 24 character personal key)

Unfortunately, unlike other WMTS servers, this capabilities file does not directly work in QMapShack (although it works "as is" in QGIS). To work around this, you will have to modify it with a text editor to include a <ResourceURL> line at the end of the layer description (just before the </Layer>) for the "GEOGRAPHICALGRIDSYSTEMS.MAPS" layer (must be adjusted and tested for other layers).


```
#!xml

<ResourceURL format="image/jpeg" resourceType="tile" template="https://wxs.ign.fr/**[YOUR_ID]**/geoportail/wmts?LAYER=GEOGRAPHICALGRIDSYSTEMS.MAPS&amp;EXCEPTIONS=text/xml&amp;FORMAT=image/jpeg&amp;SERVICE=WMTS&amp;VERSION=1.0.0&amp;REQUEST=GetTile&amp;STYLE=normal&amp;TILEMATRIXSET={TileMatrixSet}&amp;&amp;TILEMATRIX={TileMatrix}&amp;TILECOL={TileCol}&amp;TILEROW={TileRow}"/>mp;&amp;TILEMATRIX={TileMatrix}&amp;TILECOL={TileCol}&amp;TILEROW={TileRow}"/>
```


(again, don't forget to replace **[YOUR_ID]** with your actual 24 character personal key)
