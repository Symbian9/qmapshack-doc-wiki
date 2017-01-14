Prev () | [Home](Home) | [Manual](DocMain) | () Next
- - -
[TOC]
- - -

# Schnellstart 

___(deutsche Anleitung für Windows-Nutzer)___

_Mit Ausnahme der Teile, die sich auf die Installation von QMapShack selbst beziehen, gilt diese Anleitung auch für 
nicht-Windows-Betriebssysteme._ 

QMapShack (kurz QMS) für Windows ist eine 64-bit-Anwendung und erfordert deshalb ein 64-bit Windows Betriebssystem.

Diese Anleitung ist möglichst kurz gehalten, um den Nutzer rasch an die Arbeit mit QMS heranzuführen. Viele der beschriebenen
Aktionen können auch in anderer Form ausgeführt werden. Auf eine Diskussion dazu wird verzichtet.


Ausführliche Informationen zu QMS erhält man im englischsprachigen [Wiki](DocMain "QMS Wiki").

## Dateien aus dem Internet herunterladen

_Hinweise_:

* Die genannten Versionsnummern können sich ändern. Es sollte jeweils die neueste verfügbare Version gewählt werden.
* Häufig können auf den angegebenen Seiten Dateien für bestimmte Regionen ausgewählt werden. Der Nutzer sollte die ihn
  interessierende Region auswählen. 
* Die hier gemachten Empfehlungen sind Beispiele. Es gibt viele weitere Auswahlmöglichkeiten!  


Die folgenden Links sind Empfehlungen für Dateien, die ein bequemes Arbeiten mit QMS ermöglichen und die aus dem Internet 
heruntergeladen werden können.

* _QMapShack_:

    * [QMS vom Bitbucket-Server laden](https://bitbucket.org/maproom/qmapshack/downloads "QMS Installationsdatei laden").
      Von dieser Seite Datei `QMapShack_Install_Windows64bit__1.7.2.exe` laden (etwa 50 MB, Versionsnummer kann verschieden sein).

* _Kartenunterstützung (empfohlen)_:

    * [Vektorkarte Deutschland (Freizeitkarte) laden](http://download.freizeitkarte-osm.de/garmin/latest/DEU_de_gmapsupp.img.zip "Freizeitkarte Deutschland"). 
      (Etwa 1.4 GB, falls Garmin Navigationsgerät benutzt wird, ist eine geeignete Datei `gmapsupp*.img` möglicherweise schon vorhanden 
      und kann für diesen Schritt benutzt werden)
    * _Optional:_ [Online-Kartenlinks laden](http://www.mtb-touring.net/qms/onlinekarten-einbinden/ "Online-Karten"). _Hinweis:_ Blaues Feld `Download online maps`
      klicken! Liefert Datei `Onlinemaps.zip`.
    
* _Routingunterstützung (empfohlen zum Erstellen neuer Strecken)_:

    * [Routino-Daten laden](http://download.geofabrik.de/europe/germany.html "Routino-Daten laden"). Auf dieser Seite z.B. in Zeile `Berlin` gehen und 
      in dieser Zeile auf `.osm.pbf` klicken. Liefert Datei `berlin-latest.osm.pbf`.
    
* _Höhendaten (empfohlen, falls Höhenangaben für neue Strecken erforderlich sind)_:     

    * [Kacheln für Höhendaten laden](https://dds.cr.usgs.gov/srtm/version2_1/SRTM3/Eurasia "Einzelne Kacheln"). Über die Koordinaten passende
      Datei(en) auswählen, z.B. `N51E012.hgt.zip`. Die angegebenen Koordinaten beschreiben die südwestliche Ecke einer Kachel.
    
        _Oder:_
      
    * [Höhendaten für Regionen laden](http://www.viewfinderpanoramas.org/Coverage%20map%20viewfinderpanoramas_org3.htm "DEM Höhendaten für Regionen"). 
      Auf der
      angezeigten Karte passende Region wählen und auf diese klicken. Es wird z.B. eine Datei `N32.zip` heruntergeladen. `N32` ist dabei
      die Bezeichnung für die sogenannte UTM-Zone.

    _Hinweis:_ Es sollten alle für die gewählte Region erforderlichen Dateien heruntergeladen werden!
    
## Installation
* Alle heruntergeladenen Dateien sind im Downloadverzeichnis des Nutzers zu finden.
* Finde die Datei `QMapShack_Install_Windows64bit__1.7.2.exe` im Download-Verzeichnis.
* Starte diese Installationsdatei durch einen Doppelklick auf den Dateinamen.
* Bestätige die Informationen in den ersten Installationsfenstern.
* Im Fenster `Komponenten auswählen` muss der Punkt `MSVC++ 2013 SP1 runtime` ausgewählt werden (dies kann unterbleiben, wenn auf dem
  benutzten Rechner bereits diese Laufzeitumgebung installiert ist). 
* Bestätige das Starten der Installation der Laufzeitumgebung. _Hinweis:_ Die Installation kann einige Minuten dauern!
* Am Ende der Installation der Laufzeitumgebung muss mit `Close` diese Installation beendet werden. Die QMS Installation wird daraufhin fortgesetzt
  und QMS wird vollständig installiert. 
* Bereits jetzt kann QMS über das Startmenü gestartet werden. Es wird aber empfohlen, vorher 
  noch die folgenden Schritte auszuführen.
* Lege ein Verzeichnis an, in dem der Nutzer Schreibrechte hat. In der folgenden Diskussion wird 
  dieses Verzeichnis `QMS` genannt. _Anmerkung:_ Der Nutzer hat keine 
  vollständigen Schreibrechte für das Standardinstallationsverzeichnis, deshalb muss in diesem Schritt ein 
  gesondertes Verzeichnis für Daten angelegt werden.
* Lege im Verzeichnis `QMS` 
    * ein Unterverzeichnis `Karten`,
    * ein Unterverzeichnis `Routino`,
    * ein Unterverzeichnis `DEM`,
    * ein Unterverzeichnis `Datenbanken`
    
    an.
  
* Öffne die Datei `DEU_de_gmapsupp.img.zip` mit der Freizeitkarte Deutschland und kopiere die darin enthaltene Datei `gmapsupp.img` 
  in das Verzeichnis `Karten`.
* Benenne die Datei `gmapsupp.img` in `Freizeitkarte_DE.img` um.
* _Optional:_ Öffne die Datei `Onlinemaps.zip` und kopiere die darin enthaltenen Dateien in das Verzeichnis `Karten`.
* _Optional:_ Verschiebe die Datei `berlin-latest.osm.pbf` in das Verzeichnis `Routino`.
* _Optional:_ Öffne die Datei `N51E012.hgt.zip` bzw. `N32.zip` und kopiere die darin enthaltenen Dateien in das Verzeichnis `DEM`.


## Schritte nach dem ersten Start

* Starte QMS über das Startmenü (`QMapShack - QMapShack` wählen).

    ![QMS starten](images/DocAdv/InstallProgramMenu.jpg "QMapShack Startmenü")
  
* Es erscheint die noch leere QMS Oberfläche. Ist die Betriebssystemssprache deutsch, so wird auch deutsch als Sprache in 
  der QMS Oberfläche benutzt.
  
    ![QMS Arbeitsoberfläche](images/DocAdv/InstallGuiDe.jpg "QMS Anfangsoberfläche")

    Der mittlere Teil der Oberfläche wird für Kartendarstellungen und für Fenster zum Editieren von Daten und für einige weitere Zwecke benutzt.
  
    Die 4 Teilfenster am linken und rechten Rand (`Karten`, `Dig. Höhenmodell (DEM)`, `Daten`, `Route`) können einzeln verschoben und
    anders angeordnet werden. Mit dem Menüpunkt `Fenster` können sie geöffnet und geschlossen werden.
  
* Die Arbeitsoberfläche enthält einige Hinweise über empfohlene erste Aktionen. Diese werden in den folgenden Punkten beschrieben. Ähnliche
  Hinweise in Form von Infoblasen erhält man häufig beim Arbeiten mit QMS, wenn man mit der Maus auf ein angezeigtes Objekt weist. 
* _Vektorkarten aktivieren:_ 
    * Gehe mit der Maus in das Fenster `Karten`.
    * Öffne mit Rechtsklick das Kontextmenu und wähle `Kartenverzeichnis angeben`.
    * Öffne das Verzeichnis `QMS\Karten` und wähle dieses Verzeichnis aus.
    * Im Kartenfenster erscheint als neuer Eintrag `Freizeitkarte DE`.
    * Öffne mit Rechtsklick auf den Kartennamen das Kontextmenü und wähle `Aktivieren`.
    * Verschiebe Karte zu einer Position, die in der Karte enthalten ist. Die Karte sollte zu sehen sein.
* _Optional: Online-Karten aktivieren: (setzt Wahl des Kartenverzeichnisses in vorhergehenden Schritt voraus!)_
    * Gehe mit der Maus in das Fenster `Karten`.
    * Öffne mit Rechtsklick das Kontextmenü und wähle `Karten erneut laden`.
    * Im Kartenfenster erscheint als neuer Eintrag z.B. `4UMaps-eu` (war möglicherweise schon während der Aktivierung der Vektorkarte
      erschienen!).
    * Öffne mit Rechtsklick auf den Kartennamen das Kontextmenü und wähle `Aktivieren`.
    * Falls eine Internetverbindung aktiv ist, wird jetzt die gewählte Onlinekarte geladen (kann etwas dauern, Verlaufsanzeige erscheint!) 
      und im mittleren Fenster angezeigt.

      ![Aktiviere Onlinekarte](images/DocAdv/InstallMaps.jpg "Aktivieren einer Onlinekarte")
    
    
* _Optional: Routingunterstützung aktivieren:_
    * Wähle den Menüpunkt `Werkzeug - Routino Datenbank erstellen`.
    * Es öffnet sich ein neues Fenster.
    * Wähle als Quelldatei `QMS\Routino\berlin-latest.osm.pbf` und als Zielpfad `QMS\Routino` aus.
    * Gib als Dateipräfix z.B. `BE` ein.
    * Wähle `Starten`.
    * In der rechten Spalte des Fensters kann man die ablaufenden Aktionen verfolgen. Dieser Vorgang kann einige Zeit dauern!
      Der Abschluss der Operation wird angezeigt.
    * Gehe zum Fenster `Route` und füge über die Öffnen-Ikone das Verzeichnis `QMS\Routino` hinzu.
    * Öffne die Datenbankauswahlliste im Fenster `Route` und wähle `BE`.
    * Es können jetzt mit Unterstützung des offline Routino-Routers Strecken erstellt werden (in dem Bereich der durch die 
      gewählte Datenbank abgedeckt wird, im Beispiel für Berlin!).
      
      ![Erstellen Routino-Datenbank](images/DocAdv/InstallRoutinoDb.jpg "Erstellen einer Routino-Datenbank")
      
      
* _Optional: Unterstützung für digitale Höhendaten aktivieren:_    
    * Wähle den Menüpunkt `Werkzeug - VRT Builder`.
    * Es öffnet sich ein neues Fenster.
    * Wähle als Quelldatei `QMS\DEM\N51E012.hgt` (Mehrfachauswahl für weitere HGT-Dateien möglich!) und als Zieldatei `QMS\DEM\N51E012` aus
      (die Endung `.vrt` wird automatisch angefügt).
    * Wähle `Start`. Der Abschluss der Operation wird angezeigt.

      ![VRT für Höhendaten erstellen](images/DocAdv/InstallDem2Vrt.jpg "VRT für Höhendaten erstellen")

    * Gehe mit der Maus zum Fenster `Dig. Höhenmodell (DEM)`.
    * Öffne mit Rechtsklick das Kontextmenü und wähle `DEM Verzeichnisse angeben`.
    * Wähle `QMS\DEM` als Verzeichnis aus.
    * In dem Fenster  `Dig. Höhenmodell (DEM)` erscheint jetzt u.a. ein Eintrag `N51E012`.
    * Öffne mit Rechtsklick auf diesen Namen das Kontextmenü und wähle `Aktivieren`.
    * Es stehen jetzt Höhendaten für den gewählten Bereich zur Verfügung (die südwestliche Ecke des Bereichs hat im Beispiel die Koordinaten 
      51° Nord, 12° Ost und erstreckt sich jeweils über 1° in beide Richtungen).
    * Das Vorhandensein von Höhendaten am Ort des Mauszeigers wird in der Statuszeile durch eine vorhandene Höhenangabe angezeigt.

        Statuszeile ohne Höhendaten:
      
        ![Statuszeile ohne Höhendaten](images/DocAdv/InstallNoDem.jpg "Keine Höhendaten in Statuszeile")
    
        Statuszeile mit Höhendaten:
      
        ![Statuszeile mit Höhendaten](images/DocAdv/InstallDem.jpg "Höhendaten in Statuszeile")
      
    
    
Mit diesen Schritten ist ein arbeitsfähiger Zustand für QMS hergestellt.

   
## Einige typische Arbeitsschritte

### Karte bewegen und zoomen

* _Mit der Tastatur:_ 
    * Pfeiltasten bewegen die Karte in die jeweilige Richtung.
    * Die Tasten "__+__" und die "__-__" vergrößern bzw. verkleinern den Kartenmaßstab.
* _Mit der Maus:_
    * Linke Maustaste drücken und gedrückt halten fixiert die Karte an der Maus. Beim Bewegen der Maus (ohne Loslassen der gedrückten Taste)
      wird die Karte bewegt. Ist die gewünschte Kartenposition erreicht, Maustaste loslassen.
    * Mit dem Mausrad kann die Karte vergrößert oder verkleinert werden.  
    
### GPX-Datei laden und Daten anzeigen

* _Annahme:_ Es ist eine GPX-Datei `QMS\MeinProjekt.gpx` vorhanden.
* Wähle Menüpunkt `Datei - GIS Daten laden` und wähle `QMS\MeinProjekt.gpx` im Dateiauswahlfenster aus.
* Im oberen Teil des Fensters `Daten` (_Projektfenster_) erscheint ein neuer Projekteintrag mit Namen `MeinProjekt`.
* Nach Öffnen des Projekts werden die in der GPX-Datei (d.h. die im Projekt) vorhandenen Wegpunkte und Tracks angezeigt.
* Bewegt man den Mauszeiger auf eine der angezeigten Zeilen, so erhält man einige Informationen über das jeweilige Objekt.
* Ein Doppelklick auf einen Wegpunkt oder einen Track zentriert die gewählte Karte um dieses Objekt.

     ![Projekt anzeigen](images/DocAdv/InstallProject.jpg "Projekt anzeigen")

### Datenbank anlegen

QMS bietet verschiedene Formen der Datenspeicherung an. Eine empfohlene und leistungsfähige Form ist das Speichern der Daten in
einer Datenbank. Zum Anlegen einer Datenbank sind folgende Schritte erforderlich:

* Gehe mit der Maus in die untere Hälfte des Fensters `Daten` (_Datenbankfenster_).
* Öffne mit einem Rechtsklick das Kontextmenü und wähle `Datenbank hinzufügen`.
* Wähle im nächsten Fenster einen Datenbanknamen und einen Dateinamen in der Form `QMS\Datenbanken\MeineDatenbank.db` als Speicherort 
  (`SQLite` ausgewählt lassen!). 
* Der gewählte Datenbankname erscheint als neue Zeile im Datenbankfenster.

### Datenorganisation in der Datenbank

QMS Datenbanken ermöglichen eine übersichtliche baumförmige Datenanordnung ähnlich der in einem Verzeichnisbaum. 
Den Knoten des Baums (auch als Ordner bezeichnet) 
kann einer von drei verschiedene Typen 
zur übersichtlicheren Organisation der Daten zugeordnet werden:

* _Gruppe:_ dient lediglich zur Zusammenfassung von untergeordneten Ordnern. Kann nur Unterordner, aber keine Daten enthalten.
* _Projekt, Sonstige:_ Kann Unterordner und Daten enthalten. Anzeige und Bearbeitung von Daten im Projektfenster möglich.

Physisch gespeichert werden Datenbanken. Speichern kann manuell oder nach Einstellung über den Menüpunkt `Projekt - Arbeitsplatz konfigurieren`
 auch automatisch innerhalb bestimmter
Zeitintervalle erfolgen.

_Beispiel:_

![Beispiel Datenbankstruktur](images/DocAdv/DbStructureExample.jpg "Beispiel für Projektorganisation in einer Datenbank")

Die im Beispiel gewählten Namen beschreiben den Zweck der Datenbank bzw. des jeweiligen Ordners.

Die Gruppe _Radfahren_ kann mit einer analogen Struktur angelegt werden.
   
Das Anlegen von Datenbanken wurde im vorangegangenen Schritt beschrieben.
  
Das Anlegen von Gruppen-, Projekt und sonstigen Ordner erfolgt nach dem gleichen Schema:
 
* Mit Rechtsklick auf Datenbank- bzw. Ordnernamen Kontextmenü öffnen.
* Menüpunkt `Ordner hinzufügen` auswählen.
* Im nächsten Fenster Ordnername und Ordnertyp (unterschiedliche Typen zeigen unterschiedliche Ordnerfarben) auswählen.
 
_Weitere Informationen:_ 

* Durch Setzen eines Hakens im Feld vor dem Ordnernamen wird der Ordner im Projektfenster geöffnet und die darin enthaltenen Daten
  werden (so sie ebenfalls ausgewählt sind) im Kartenfenster angezeigt. Zur deutlicheren Kennzeichnung der
  Herkunft des Ordners wird an den Ordnernamen nach dem Trennzeichen "__@__" der Name des nächsthöheren Ordners angefügt. 
  Dieser Zusatz entfällt bei Ordnern auf
  der obersten Ebene. Dieses Vorgehen ermöglicht ein gezieltes und strukturiertes Anzeigen ausgewählter Daten im Projekt- und im Kartenfenster.
* Ändern und Löschen von Daten erfolgt im Projektfenster. 
  Wurden Daten eines Ordners bearbeitet, so wird das durch einen Punkt vor dem Ordner- und dem Datennamen angezeigt (im Beispiel ist der
  Track _Süßer See_ neu angelegt, noch nicht gespeichert und deshalb auch noch nicht in der Datenbank vorhanden). Geänderte Projekte
  sollten regelmäßig über den Kontextmenüeintrag `Speichern` in der Datenbank gespeichert werden.
* Vollständiges Löschen von Daten hat im Datenbankfenster zu erfolgen. Gelöschte Daten werden in den automatisch angelegten 
  Ordner `Verloren & Gefunden` verschoben und können von hier
  aus endgültig gelöscht werden. Löschen im Projektfenster löscht die Daten aus dem angezeigten Projekt, aber nicht aus der
  Datenbank.  
* Außer Ordnern (Projekten), die zu Datenbanken gehören, gibt es noch Projekte, die direkt in einer GPX- oder QMS-Datei gespeichert werden. 


### Track erzeugen

* _Annahme:_ Die Routingunterstützung wurde installiert.
* Gehe mit der Maus zum Fenster `Route`.
* Wähle in der obersten Auswahlliste des Fensters `Routino (offline)`.
* Wähle in den weiteren Listen das Profil (die Fortbewegungsart), die Sprache (für Abbiegehinweise), den Modus (kürzeste/schnellste) 
  sowie eine der
  vorhandenen Routingdatenbanken (im Beispiel `BE`) aus.
* Verschiebe die Maus zum Anfangspunkt des Tracks im Kartenfenster aus.
* Öffne mit Rechtsklick das Kontextmenü und wähle `Track hinzufügen`.
* Drücke `Strg-A` auf der Tastatur (dies wählt den automatischen Routingmodus aus).
* Bewege die Maus zum nächsten gewünschten Zwischenpunkt des Tracks und fixiere diesen mit einem Linksklick. Zwischen den zwei zuletzt
  gewählten Punkten wird automatisch in Übereinstimmung mit den gewählten Routingoptionen eine Zwischenstrecke ermittelt und angezeigt.
* Wiederhole den vorhergehenden Schritt solange, bis das Ende des Tracks erreicht ist.
* Schließe mit einem Rechtsklick das Hinzufügen neuer Trackpunkte ab.
* Wähle aus der Werkzeugleiste am oberen Rand des Kartenfensters den Punkt `Als neu speichern`.
* Gib einen Tracknamen ein.
* Wähle einen neuen Projektnamen und `Datenbank` als Typ des Projekts.
* Wähle die verfügbare Datenbank.
* Wähle einen Namen für einen Datenbankordner.
* Im Projektfenster wird ein neues Projekt mit dem gewählten Namen angezeigt. In diesem ist der neu erzeugte Track enthalten.
* Im Datenbankfenster wird ein neuer Ordner für die benutzte Datenbank angezeigt.
* Öffne mit einem Rechtsklick auf den Projektnamen das Kontextmenü und wähle `Speichern`. Das Projekt mit seinen
  Daten wird in dem gewählten Datenbankordner permanent gespeichert. Der gespeicherte Track erscheint als Zeile im Datenbankordner.
  
  
  

- - -
Prev () | [Home](Home) | [Manual](DocMain) | [Top](#) | () Next
