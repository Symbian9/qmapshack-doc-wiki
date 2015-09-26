[Home](Home) | [Manual](DocMain)

#Maps: Tips & Tricks

If you have a hot tip for free maps or a spiffy trick to do with maps add a small section here.

# WMTS configuration to access French IGN maps ("Géoportail") #

As an individual, you can apply for a free non-commercial access to the French IGN WMTS servers (for example through their "Géoportail API", but also works with other WMTS clients like QGIS and QMapShack). The original source of information about this is at the following URL (in French):

http://dogeo.fr/wmts_ign/

The terms of use enforce a few restrictions listed at the following URL:

[http://professionnels.ign.fr/licence-api-geoportail-libre-et-gratuite](http://professionnels.ign.fr/licence-api-geoportail-libre-et-gratuite)

You can register for this free "licence géoservices IGN pour usage grand public" at the following URL:

[http://professionnels.ign.fr/api-web](http://professionnels.ign.fr/api-web)

You will be prompted to select which layers you want. Although the same procedure probably applies to any of the available layers, the process described here has only been tried with the map layer called "cartes IGN" (or "GEOGRAPHICALGRIDSYSTEMS.MAPS" on the WMTS server).

Note that you will also need to provide your IP address (external IP: that is the IP of your internet router) during the application process. Usually you can easily find this IP in your router status page, or alternatively you can visit websites such as this one:

[http://tell-my-ip.com/](http://tell-my-ip.com/)

The WMTS access may be denied if you try to connect from another IP (and this may be a problem if your ISP keeps changing your IP). This problem can be diagnosed by trying to access a tile from a web browser (use the sample URL below). In case of IP mismatch you will obtain an error message saying "wrong IP address" instead of the map tile. The registered IP can be modified on the "IGN Espace Pro" website, under your account, you should click on "mes commandes" and then "modifier mon contrat". Note that they say it can take up to 12h 
before the new IP is actually activated.

Shortly after your order (less than one hour), you will receive a confirmation e-mail, and you will be able to retrieve a personal ID (24 character key) from your personal account on the IGN website.

You can test the WMTS access directly in your web browser by fetching a random map tile, for example:

[https://wxs.ign.fr/**[YOUR_ID]**/wmts?LAYER=GEOGRAPHICALGRIDSYSTEMS.MAPS&EXCEPTIONS=text/xml&FORMAT=image/jpeg&SERVICE=WMTS&VERSION=1.0.0&REQUEST=GetTile&STYLE=normal&TILEMATRIXSET=PM&&TILEMATRIX=1&TILECOL=0&TILEROW=0](https://wxs.ign.fr/[YOUR_ID]/wmts?LAYER=GEOGRAPHICALGRIDSYSTEMS.MAPS&EXCEPTIONS=text/xml&FORMAT=image/jpeg&SERVICE=WMTS&VERSION=1.0.0&REQUEST=GetTile&STYLE=normal&TILEMATRIXSET=PM&&TILEMATRIX=1&TILECOL=0&TILEROW=0)

(don't forget to replace **[YOUR_ID]** with your actual 24 character personal key)

The WMTS "capabilities" can then be fetched at the following URL:

[https://wxs.ign.fr/**[YOUR_ID]**/geoportail/wmts?SERVICE=WMTS&REQUEST=GetCapabilities](https://wxs.ign.fr/[YOUR_ID]/geoportail/wmts?SERVICE=WMTS&REQUEST=GetCapabilities)

(don't forget to replace **[YOUR_ID]** with your actual 24 character personal key)

Unfortunately, unlike other WMTS servers, this capabilities file does not directly work in QMapShack (although it works "as is" in QGIS). To work around this, you will have to modify it with a text editor to include a <ResourceURL> line at the end of the layer description (just before the </Layer> directive) for the "GEOGRAPHICALGRIDSYSTEMS.MAPS" layer (must be adjusted and tested for other layers).

```
#!xml

<ResourceURL format="image/jpeg" resourceType="tile" template="https://wxs.ign.fr/[YOUR_ID]/geoportail/wmts?LAYER=GEOGRAPHICALGRIDSYSTEMS.MAPS&amp;EXCEPTIONS=text/xml&amp;FORMAT=image/jpeg&amp;SERVICE=WMTS&amp;VERSION=1.0.0&amp;REQUEST=GetTile&amp;STYLE=normal&amp;TILEMATRIXSET={TileMatrixSet}&amp;&amp;TILEMATRIX={TileMatrix}&amp;TILECOL={TileCol}&amp;TILEROW={TileRow}"/>
```

(again, don't forget to replace **[YOUR_ID]** with your actual 24 character personal key)

For those just wanting to take the shortcut to a quick config, here is a full configuration file that you can copy and paste as "IGN.wmts" in your QMapShack map directory:

```
#!xml

<?xml version="1.0" encoding="UTF-8"?>
<Capabilities xmlns="http://www.opengis.net/wmts/1.0" xmlns:gml="http://www.opengis.net/gml" xmlns:ows="http://www.opengis.net/ows/1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.0.0" xsi:schemaLocation="http://www.opengis.net/wmts/1.0 http://schemas.opengis.net/wmts/1.0/wmtsGetCapabilities_response.xsd">
<ows:ServiceIdentification>
<ows:Title>Service de visualisation WMTS</ows:Title>
<ows:Abstract>Ce service permet la visualisation de couches de données raster IGN au travers d'un flux WMTS</ows:Abstract>
<ows:Keywords>
<ows:Keyword>Unités administratives</ows:Keyword>
<ows:Keyword>Limites administratives</ows:Keyword>
<ows:Keyword>Surfaces bâties</ows:Keyword>
<ows:Keyword>Réseaux de transport</ows:Keyword>
<ows:Keyword>Routes</ows:Keyword>
<ows:Keyword>Réseaux ferroviaires</ows:Keyword>
<ows:Keyword>Aérodromes</ows:Keyword>
<ows:Keyword>Réseau hydrographique</ows:Keyword>
<ows:Keyword>Parcelles cadastrales</ows:Keyword>
<ows:Keyword>Bâtiments</ows:Keyword>
<ows:Keyword>Services d'utilité publique et services publics</ows:Keyword>
<ows:Keyword>Réseaux de transport</ows:Keyword>
<ows:Keyword>Hydrographie</ows:Keyword>
<ows:Keyword>Photographies aériennes</ows:Keyword>
<ows:Keyword>Cartes</ows:Keyword>
<ows:Keyword>Cartes historiques</ows:Keyword>
<ows:Keyword>Altitude</ows:Keyword>
</ows:Keywords>
<ows:ServiceType>OGC WMTS</ows:ServiceType>
<ows:ServiceTypeVersion>1.0.0</ows:ServiceTypeVersion>
<ows:Fees>licences</ows:Fees>
<ows:AccessConstraints>Conditions Générales d'Utilisation disponibles ici : http://professionnels.ign.fr/sites/default/files/CGU_API_Pro.pdf</ows:AccessConstraints>
</ows:ServiceIdentification>
<ows:ServiceProvider>
<ows:ProviderName>IGN</ows:ProviderName>
<ows:ProviderSite xlink:href=""/>
<ows:ServiceContact>
<ows:IndividualName>Géoportail SAV</ows:IndividualName>
<ows:PositionName>custodian</ows:PositionName>
<ows:ContactInfo>
<ows:Phone>
<ows:Voice/>
<ows:Facsimile/>
</ows:Phone>
<ows:Address>
<ows:DeliveryPoint>73 avenue de Paris</ows:DeliveryPoint>
<ows:City>Saint Mandé</ows:City>
<ows:AdministrativeArea/>
<ows:PostalCode>94160</ows:PostalCode>
<ows:Country>France</ows:Country>
<ows:ElectronicMailAddress>geop_services@geoportail.fr</ows:ElectronicMailAddress>
</ows:Address>
</ows:ContactInfo>
</ows:ServiceContact>
</ows:ServiceProvider>
<ows:OperationsMetadata>
<ows:Operation name="GetCapabilities">
<ows:DCP>
<ows:HTTP>
<ows:Get xlink:href="https://wxs.ign.fr/[YOUR_ID]/geoportail/wmts?">
<ows:Constraint name="GetEncoding">
<ows:AllowedValues>
<ows:Value>KVP</ows:Value>
</ows:AllowedValues>
</ows:Constraint>
</ows:Get>
</ows:HTTP>
</ows:DCP>
</ows:Operation>
<ows:Operation name="GetTile">
<ows:DCP>
<ows:HTTP>
<ows:Get xlink:href="https://wxs.ign.fr/[YOUR_ID]/geoportail/wmts?">
<ows:Constraint name="GetEncoding">
<ows:AllowedValues>
<ows:Value>KVP</ows:Value>
</ows:AllowedValues>
</ows:Constraint>
</ows:Get>
</ows:HTTP>
</ows:DCP>
</ows:Operation>
</ows:OperationsMetadata>
<Contents>
<Layer>
<ows:Title>Cartes IGN</ows:Title>
<ows:Abstract>Cartes IGN</ows:Abstract>
<ows:Keywords>
<ows:Keyword>Cartes</ows:Keyword>
</ows:Keywords>
<ows:WGS84BoundingBox>
<ows:LowerCorner>-180 -68.1389</ows:LowerCorner>
<ows:UpperCorner>180 80</ows:UpperCorner>
</ows:WGS84BoundingBox>
<ows:Identifier>GEOGRAPHICALGRIDSYSTEMS.MAPS</ows:Identifier>
<Style isDefault="true">
<ows:Title>Données Brutes</ows:Title>
<ows:Abstract>Données brutes sans changement de palette</ows:Abstract>
<ows:Keywords>
<ows:Keyword>Défaut</ows:Keyword>
</ows:Keywords>
<ows:Identifier>normal</ows:Identifier>
<LegendURL format="image/jpeg" height="200" maxScaleDenominator="100000000" minScaleDenominator="200" width="200" xlink:href="http://www.geoportail.gouv.fr/depot/LEGEND.jpg"/>
</Style>
<Format>image/jpeg</Format>
<TileMatrixSetLink>
<TileMatrixSet>PM</TileMatrixSet>
<TileMatrixSetLimits>
<TileMatrixLimits>
<TileMatrix>0</TileMatrix>
<MinTileRow>0</MinTileRow>
<MaxTileRow>0</MaxTileRow>
<MinTileCol>0</MinTileCol>
<MaxTileCol>1</MaxTileCol>
</TileMatrixLimits>
<TileMatrixLimits>
<TileMatrix>1</TileMatrix>
<MinTileRow>0</MinTileRow>
<MaxTileRow>1</MaxTileRow>
<MinTileCol>0</MinTileCol>
<MaxTileCol>2</MaxTileCol>
</TileMatrixLimits>
<TileMatrixLimits>
<TileMatrix>10</TileMatrix>
<MinTileRow>341</MinTileRow>
<MaxTileRow>780</MaxTileRow>
<MinTileCol>5</MinTileCol>
<MaxTileCol>990</MaxTileCol>
</TileMatrixLimits>
<TileMatrixLimits>
<TileMatrix>11</TileMatrix>
<MinTileRow>681</MinTileRow>
<MaxTileRow>1544</MaxTileRow>
<MinTileCol>10</MinTileCol>
<MaxTileCol>1981</MaxTileCol>
</TileMatrixLimits>
<TileMatrixLimits>
<TileMatrix>12</TileMatrix>
<MinTileRow>1363</MinTileRow>
<MaxTileRow>3088</MaxTileRow>
<MinTileCol>20</MinTileCol>
<MaxTileCol>3962</MaxTileCol>
</TileMatrixLimits>
<TileMatrixLimits>
<TileMatrix>13</TileMatrix>
<MinTileRow>2726</MinTileRow>
<MaxTileRow>6177</MaxTileRow>
<MinTileCol>40</MinTileCol>
<MaxTileCol>7924</MaxTileCol>
</TileMatrixLimits>
<TileMatrixLimits>
<TileMatrix>14</TileMatrix>
<MinTileRow>5452</MinTileRow>
<MaxTileRow>12355</MaxTileRow>
<MinTileCol>81</MinTileCol>
<MaxTileCol>15847</MaxTileCol>
</TileMatrixLimits>
<TileMatrixLimits>
<TileMatrix>15</TileMatrix>
<MinTileRow>10944</MinTileRow>
<MaxTileRow>21176</MaxTileRow>
<MinTileCol>163</MinTileCol>
<MaxTileCol>31695</MaxTileCol>
</TileMatrixLimits>
<TileMatrixLimits>
<TileMatrix>16</TileMatrix>
<MinTileRow>21889</MinTileRow>
<MaxTileRow>42353</MaxTileRow>
<MinTileCol>326</MinTileCol>
<MaxTileCol>63382</MaxTileCol>
</TileMatrixLimits>
<TileMatrixLimits>
<TileMatrix>17</TileMatrix>
<MinTileRow>43776</MinTileRow>
<MaxTileRow>73526</MaxTileRow>
<MinTileCol>42528</MinTileCol>
<MaxTileCol>85869</MaxTileCol>
</TileMatrixLimits>
<TileMatrixLimits>
<TileMatrix>18</TileMatrix>
<MinTileRow>87557</MinTileRow>
<MaxTileRow>147052</MaxTileRow>
<MinTileCol>85058</MinTileCol>
<MaxTileCol>171738</MaxTileCol>
</TileMatrixLimits>
<TileMatrixLimits>
<TileMatrix>2</TileMatrix>
<MinTileRow>0</MinTileRow>
<MaxTileRow>2</MaxTileRow>
<MinTileCol>0</MinTileCol>
<MaxTileCol>4</MaxTileCol>
</TileMatrixLimits>
<TileMatrixLimits>
<TileMatrix>3</TileMatrix>
<MinTileRow>0</MinTileRow>
<MaxTileRow>5</MaxTileRow>
<MinTileCol>0</MinTileCol>
<MaxTileCol>8</MaxTileCol>
</TileMatrixLimits>
<TileMatrixLimits>
<TileMatrix>4</TileMatrix>
<MinTileRow>1</MinTileRow>
<MaxTileRow>11</MaxTileRow>
<MinTileCol>0</MinTileCol>
<MaxTileCol>16</MaxTileCol>
</TileMatrixLimits>
<TileMatrixLimits>
<TileMatrix>5</TileMatrix>
<MinTileRow>3</MinTileRow>
<MaxTileRow>22</MaxTileRow>
<MinTileCol>0</MinTileCol>
<MaxTileCol>32</MaxTileCol>
</TileMatrixLimits>
<TileMatrixLimits>
<TileMatrix>6</TileMatrix>
<MinTileRow>7</MinTileRow>
<MaxTileRow>45</MaxTileRow>
<MinTileCol>0</MinTileCol>
<MaxTileCol>64</MaxTileCol>
</TileMatrixLimits>
<TileMatrixLimits>
<TileMatrix>7</TileMatrix>
<MinTileRow>42</MinTileRow>
<MaxTileRow>97</MaxTileRow>
<MinTileCol>0</MinTileCol>
<MaxTileCol>115</MaxTileCol>
</TileMatrixLimits>
<TileMatrixLimits>
<TileMatrix>8</TileMatrix>
<MinTileRow>84</MinTileRow>
<MaxTileRow>195</MaxTileRow>
<MinTileCol>1</MinTileCol>
<MaxTileCol>247</MaxTileCol>
</TileMatrixLimits>
<TileMatrixLimits>
<TileMatrix>9</TileMatrix>
<MinTileRow>170</MinTileRow>
<MaxTileRow>390</MaxTileRow>
<MinTileCol>2</MinTileCol>
<MaxTileCol>495</MaxTileCol>
</TileMatrixLimits>
</TileMatrixSetLimits>
</TileMatrixSetLink>
<ResourceURL format="image/jpeg" resourceType="tile" template="https://wxs.ign.fr/[YOUR_ID]/geoportail/wmts?LAYER=GEOGRAPHICALGRIDSYSTEMS.MAPS&amp;EXCEPTIONS=text/xml&amp;FORMAT=image/jpeg&amp;SERVICE=WMTS&amp;VERSION=1.0.0&amp;REQUEST=GetTile&amp;STYLE=normal&amp;TILEMATRIXSET={TileMatrixSet}&amp;&amp;TILEMATRIX={TileMatrix}&amp;TILECOL={TileCol}&amp;TILEROW={TileRow}"/>
</Layer>
<TileMatrixSet>
<ows:Identifier>PM</ows:Identifier>
<ows:SupportedCRS>EPSG:3857</ows:SupportedCRS>
<TileMatrix>
<ows:Identifier>0</ows:Identifier>
<ScaleDenominator>559082264.0287178958533332</ScaleDenominator>
<TopLeftCorner>-20037508 20037508</TopLeftCorner>
<TileWidth>256</TileWidth>
<TileHeight>256</TileHeight>
<MatrixWidth>1</MatrixWidth>
<MatrixHeight>1</MatrixHeight>
</TileMatrix>
<TileMatrix>
<ows:Identifier>1</ows:Identifier>
<ScaleDenominator>279541132.0143588959472254</ScaleDenominator>
<TopLeftCorner>-20037508 20037508</TopLeftCorner>
<TileWidth>256</TileWidth>
<TileHeight>256</TileHeight>
<MatrixWidth>2</MatrixWidth>
<MatrixHeight>2</MatrixHeight>
</TileMatrix>
<TileMatrix>
<ows:Identifier>10</ows:Identifier>
<ScaleDenominator>545978.7734655447186469</ScaleDenominator>
<TopLeftCorner>-20037508 20037508</TopLeftCorner>
<TileWidth>256</TileWidth>
<TileHeight>256</TileHeight>
<MatrixWidth>1024</MatrixWidth>
<MatrixHeight>1024</MatrixHeight>
</TileMatrix>
<TileMatrix>
<ows:Identifier>11</ows:Identifier>
<ScaleDenominator>272989.3867327723085907</ScaleDenominator>
<TopLeftCorner>-20037508 20037508</TopLeftCorner>
<TileWidth>256</TileWidth>
<TileHeight>256</TileHeight>
<MatrixWidth>2048</MatrixWidth>
<MatrixHeight>2048</MatrixHeight>
</TileMatrix>
<TileMatrix>
<ows:Identifier>12</ows:Identifier>
<ScaleDenominator>136494.6933663861796617</ScaleDenominator>
<TopLeftCorner>-20037508 20037508</TopLeftCorner>
<TileWidth>256</TileWidth>
<TileHeight>256</TileHeight>
<MatrixWidth>4096</MatrixWidth>
<MatrixHeight>4096</MatrixHeight>
</TileMatrix>
<TileMatrix>
<ows:Identifier>13</ows:Identifier>
<ScaleDenominator>68247.3466831930771477</ScaleDenominator>
<TopLeftCorner>-20037508 20037508</TopLeftCorner>
<TileWidth>256</TileWidth>
<TileHeight>256</TileHeight>
<MatrixWidth>8192</MatrixWidth>
<MatrixHeight>8192</MatrixHeight>
</TileMatrix>
<TileMatrix>
<ows:Identifier>14</ows:Identifier>
<ScaleDenominator>34123.6733415965449154</ScaleDenominator>
<TopLeftCorner>-20037508 20037508</TopLeftCorner>
<TileWidth>256</TileWidth>
<TileHeight>256</TileHeight>
<MatrixWidth>16384</MatrixWidth>
<MatrixHeight>16384</MatrixHeight>
</TileMatrix>
<TileMatrix>
<ows:Identifier>15</ows:Identifier>
<ScaleDenominator>17061.8366707982724577</ScaleDenominator>
<TopLeftCorner>-20037508 20037508</TopLeftCorner>
<TileWidth>256</TileWidth>
<TileHeight>256</TileHeight>
<MatrixWidth>32768</MatrixWidth>
<MatrixHeight>32768</MatrixHeight>
</TileMatrix>
<TileMatrix>
<ows:Identifier>16</ows:Identifier>
<ScaleDenominator>8530.9183353991362289</ScaleDenominator>
<TopLeftCorner>-20037508 20037508</TopLeftCorner>
<TileWidth>256</TileWidth>
<TileHeight>256</TileHeight>
<MatrixWidth>65536</MatrixWidth>
<MatrixHeight>65536</MatrixHeight>
</TileMatrix>
<TileMatrix>
<ows:Identifier>17</ows:Identifier>
<ScaleDenominator>4265.4591676995681144</ScaleDenominator>
<TopLeftCorner>-20037508 20037508</TopLeftCorner>
<TileWidth>256</TileWidth>
<TileHeight>256</TileHeight>
<MatrixWidth>131072</MatrixWidth>
<MatrixHeight>131072</MatrixHeight>
</TileMatrix>
<TileMatrix>
<ows:Identifier>18</ows:Identifier>
<ScaleDenominator>2132.7295838497840572</ScaleDenominator>
<TopLeftCorner>-20037508 20037508</TopLeftCorner>
<TileWidth>256</TileWidth>
<TileHeight>256</TileHeight>
<MatrixWidth>262144</MatrixWidth>
<MatrixHeight>262144</MatrixHeight>
</TileMatrix>
<TileMatrix>
<ows:Identifier>19</ows:Identifier>
<ScaleDenominator>1066.3647919248918304</ScaleDenominator>
<TopLeftCorner>-20037508 20037508</TopLeftCorner>
<TileWidth>256</TileWidth>
<TileHeight>256</TileHeight>
<MatrixWidth>524288</MatrixWidth>
<MatrixHeight>524288</MatrixHeight>
</TileMatrix>
<TileMatrix>
<ows:Identifier>2</ows:Identifier>
<ScaleDenominator>139770566.0071793960087234</ScaleDenominator>
<TopLeftCorner>-20037508 20037508</TopLeftCorner>
<TileWidth>256</TileWidth>
<TileHeight>256</TileHeight>
<MatrixWidth>4</MatrixWidth>
<MatrixHeight>4</MatrixHeight>
</TileMatrix>
<TileMatrix>
<ows:Identifier>20</ows:Identifier>
<ScaleDenominator>533.1823959624461134</ScaleDenominator>
<TopLeftCorner>-20037508 20037508</TopLeftCorner>
<TileWidth>256</TileWidth>
<TileHeight>256</TileHeight>
<MatrixWidth>1048576</MatrixWidth>
<MatrixHeight>1048576</MatrixHeight>
</TileMatrix>
<TileMatrix>
<ows:Identifier>21</ows:Identifier>
<ScaleDenominator>266.5911979812228585</ScaleDenominator>
<TopLeftCorner>-20037508 20037508</TopLeftCorner>
<TileWidth>256</TileWidth>
<TileHeight>256</TileHeight>
<MatrixWidth>2097152</MatrixWidth>
<MatrixHeight>2097152</MatrixHeight>
</TileMatrix>
<TileMatrix>
<ows:Identifier>3</ows:Identifier>
<ScaleDenominator>69885283.0035897239868063</ScaleDenominator>
<TopLeftCorner>-20037508 20037508</TopLeftCorner>
<TileWidth>256</TileWidth>
<TileHeight>256</TileHeight>
<MatrixWidth>8</MatrixWidth>
<MatrixHeight>8</MatrixHeight>
</TileMatrix>
<TileMatrix>
<ows:Identifier>4</ows:Identifier>
<ScaleDenominator>34942641.5017948619934032</ScaleDenominator>
<TopLeftCorner>-20037508 20037508</TopLeftCorner>
<TileWidth>256</TileWidth>
<TileHeight>256</TileHeight>
<MatrixWidth>16</MatrixWidth>
<MatrixHeight>16</MatrixHeight>
</TileMatrix>
<TileMatrix>
<ows:Identifier>5</ows:Identifier>
<ScaleDenominator>17471320.7508974309967016</ScaleDenominator>
<TopLeftCorner>-20037508 20037508</TopLeftCorner>
<TileWidth>256</TileWidth>
<TileHeight>256</TileHeight>
<MatrixWidth>32</MatrixWidth>
<MatrixHeight>32</MatrixHeight>
</TileMatrix>
<TileMatrix>
<ows:Identifier>6</ows:Identifier>
<ScaleDenominator>8735660.3754487154983508</ScaleDenominator>
<TopLeftCorner>-20037508 20037508</TopLeftCorner>
<TileWidth>256</TileWidth>
<TileHeight>256</TileHeight>
<MatrixWidth>64</MatrixWidth>
<MatrixHeight>64</MatrixHeight>
</TileMatrix>
<TileMatrix>
<ows:Identifier>7</ows:Identifier>
<ScaleDenominator>4367830.1877243577491754</ScaleDenominator>
<TopLeftCorner>-20037508 20037508</TopLeftCorner>
<TileWidth>256</TileWidth>
<TileHeight>256</TileHeight>
<MatrixWidth>128</MatrixWidth>
<MatrixHeight>128</MatrixHeight>
</TileMatrix>
<TileMatrix>
<ows:Identifier>8</ows:Identifier>
<ScaleDenominator>2183915.0938621788745877</ScaleDenominator>
<TopLeftCorner>-20037508 20037508</TopLeftCorner>
<TileWidth>256</TileWidth>
<TileHeight>256</TileHeight>
<MatrixWidth>256</MatrixWidth>
<MatrixHeight>256</MatrixHeight>
</TileMatrix>
<TileMatrix>
<ows:Identifier>9</ows:Identifier>
<ScaleDenominator>1091957.5469310886252288</ScaleDenominator>
<TopLeftCorner>-20037508 20037508</TopLeftCorner>
<TileWidth>256</TileWidth>
<TileHeight>256</TileHeight>
<MatrixWidth>512</MatrixWidth>
<MatrixHeight>512</MatrixHeight>
</TileMatrix>
</TileMatrixSet>
</Contents>
</Capabilities>
```

(again, don't forget to replace the 3 occurrences of **[YOUR_ID]** with your actual 24 character personal key)

Note that this file was working as of September 22, 2015 but may stop working in the future in case IGN changes its WMTS server configuration.
