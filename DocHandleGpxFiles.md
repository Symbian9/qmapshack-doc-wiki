[Home](Home) | [Manual](DocMain)

# Handle GPX Files

Despite all deficiencies, GPS manufactors support this format. A common format is a good approach in general, but TopoGrafix, the company behind GPX, fails miserably to evolve their format to the needs of today's GPS systems. Anyway, GPX is it to be. QMapShack does support the GPX definition version 1.1 and some of the proprietary extensions to GPX. And it adds a few more. But due to the sheer rank growth of extensions, caused by a lack of guidance, it can't support everything. Keep this in mind when you load and save GPX files that do not origin from QMapShack. You will loose information.

## Load GPX Files

There are two ways to load GPX files. 

1) When you start QMapShack from the command line you can add a list of GPX files

    qmapshack file1.gpx file2.gpx
    
2) Use the menu _File->Load GIS Data_ (GIS = Geographic Information Sytems)

![Alt text](images/DocHandleGpxFiles/maproom1.png)

## Data view

Each file will create a new top level item in the data view's workspace list. 

![Alt text](images/DocHandleGpxFiles/maproom2.png)

If you expand the item you can see the elements like waypoints, tracks, routes and so on. If you let the mouse hoover over an element you get more information.

![Alt text](images/DocHandleGpxFiles/maproom3.png)

## Save GPX Files

You can either save all files in the workspace via _Save All GIS Data_. Or you can save a single file by a right click on the item in the data view's workspace list.

![Alt text](images/DocHandleGpxFiles/maproom4.png)
