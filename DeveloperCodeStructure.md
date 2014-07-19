[Home](Home) | [Manual](DocMain)

#Code Structure

On the QLandkarte the flat source tree became a problem with an increasing number of files. With QMapShack I started a complex source tree with folders. By that you can deflate folders of no interest in your IDE. I hope the code will be less intimidatory to new developers by that.

If you add a new file use the little python script 'mkfile' in the source root. That gives you a skeleton with the GPL V3 header. *ui files are just created with designer. Take a bit of time to consider where to place new files. If in doubt discuss it with me.

folder            |       comment
------------------|------------------
animation         | Animated icons like to "processing" doodle when rendering maps.
canvas            | The canvas is the map area that defines the map projection and what's drawn.
cursors           | Cursor icons.
dem               | Everything related to the DEM drawing layer. 
gis               | Everything related to the user's GIS data like waypoints, tracks, routes. Each of them having it's own sub-folder
grid              | Everything related to the grid drawing layer.
helpers           | Little helper classes and functions that are used through out the source.
icons             | Icons, icons, icons. Icons are created as *svg and converted to bitmaps by a little shell script 'makeicons'. There is a make icons script in every sub-folder. Sub-folders are: waypoints and cache .(GeoCaching)
map               | Everything related to the map drawing layer. Complex map items like Garmin maps have their own sub-folder.
mouse             | All classes to control mouse interaction.
units             | Everything related to units like metric and imperial units.
