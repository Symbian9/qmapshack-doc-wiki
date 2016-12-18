[Prev](DocGisDatabaseLostFound) ('Lost & Found' Folder) | [Home](Home) | [Manual](DocMain) | (Databases and projects) [Next](AdvProjects)
- - -
[TOC]
- - -

# Working with GPS Devices

QMapShack supports data exchange with several GPS outdoor units. All newer Garmin devices accessible with mass storage mode will work. And all devices based on the CompeGPS software TwoNav, that are accessible as mass storage.

**Linux:** Make sure you have installed the UDisks2 package.  
**Windows:** Supported from version 1.0.0 on.

**Garmin**: If you want to see your device's SD memory card you have to copy the file _GarminDevice.xml_ from the internal _Garmin_ folder to the _Garmin_ folder on your SD memory card.

After you plugged your device to the PC and switched it to mass storage mode you should see something link this:

![maproom2](images/DocGisDevices/qmapshack2.png)

Each memory of the device is listed  in the workspace. If data is found on the device it will be attached as project to it's device entry.

The important part to understand is that a project on the device is stored differently than on the workspace. For example devices won't be able to deal with the idea of hidden track points. Or it simply has no way to store all the information QMapShack is able to store. That is why projects have to be copied via the device entry to the device. And consequently projects on the device can't be copied to the workspace. This would lead to a project clash that is hard to resolve and very likely to loose data.

![maproom2](images/DocGisDevices/qmapshack4.png)

That understood you copy projects by drag-n-drop  to the device entry you want to store them. And after the tour you copy items like track recordings by drag-n-drop to what ever project on the workspace you want them. 

![maproom2](images/DocGisDevices/qmapshack5.png)

The context menu for items on devices is working, too. However with a limited range of options, as the items on the device are considered as read-only. Copy them to the workspace to change them ore to derive other items from them. Next to drag-n-drop you can use the copy option from the menu.

![maproom2](images/DocGisDevices/qmapshack6.png)

The context menu for the projects is working, too. Note that _Close_ is replaced _Delete_. This will delete the project from your device's memory.

# Remark about Garmin GPSmap 60CSx and similar devices

If the following _GarminDevice.xml_ file is copied to the _Garmin_ folder of the SD memory card
then the tracks written by the device on its memory card are shown in QMapShack as described above.

```
<?xml version="1.0" encoding="UTF-8"?>
<Device xmlns="http://www.garmin.com/xmlschemas/GarminDevice/v2" 
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
xsi:schemaLocation="http://www.garmin.com/xmlschemas/GarminDevice/v2 http://www.garmin.com/xmlschemas/GarminDevicev2.xsd">
  <Model>
    <PartNumber>000-BBBB-00</PartNumber>
    <Description>GPSmap 60CSx</Description>
  </Model>
  <Id>12345678</Id>
  <MassStorageMode>
    <DataType>
      <Name>GPSData</Name>
      <File>
        <Specification>
          <Identifier>http://www.topografix.com/GPX/1/1</Identifier>
          <Documentation>http://www.topografix.com/GPX/1/1/gpx.xsd</Documentation>
        </Specification>
        <Location>
          <Path>.</Path>
        </Location>
      </File>
    </DataType>
  </MassStorageMode>
</Device>
```



- - -
[Prev](DocGisDatabaseLostFound) ('Lost & Found' Folder) | [Home](Home) | [Manual](DocMain) | [Top](#) | (Databases and projects) [Next](AdvProjects)
