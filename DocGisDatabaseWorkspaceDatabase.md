[Prev](DocGisDatabase) (Database) | [Home](Home) | [Manual](DocMain) | [Index](AxAdvIndex) | (Add/Remove/Synchronize/Search a Database) [Next](DocGisDatabaseAddRemove)
- - -
[TOC]
- - -

# The Workspace and the Database

![Database - workspace relation](images/DocGisDatabaseWorkspaceDatabase/maproom2.png "Database - workspace relation")

To work with the database you have to keep a single fundamental rule in mind. The database view is to load, unload and delete items from the database only. Everything else like adding/copying/editing data is done in the workspace. Thus you have to load the item into the workspace first. And after you have done your work you have to save it into the database.

For example if you want to copy an item from one database folder to another, you have to load both folders into the workspace, copy the item and save the folder with the item added.

If you delete an item from a database project in the workspace it's not deleted from the database. It's just removed from the workspace. You have to delete it explicitly in the database view. If the item is not referenced by any other folder in the database it is moved to the 'Lost & Found' folder.

- - -
[Prev](DocGisDatabase) (Database) | [Home](Home) | [Manual](DocMain) | [Index](AxAdvIndex) | [Top](#) | (Add/Remove/Synchronize/Search a Database) [Next](DocGisDatabaseAddRemove)
