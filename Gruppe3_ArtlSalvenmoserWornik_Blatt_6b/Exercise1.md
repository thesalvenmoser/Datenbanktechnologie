# Data Import

## Setup `temporal_tables`

Die Temporal-Erweiterung wird nach der Installation mit dem Befehl
``` sql
CREATE EXTENSION temporal_tables;
```
aktiviert [1].

Dann wird die erstellte Datenbank (temporaldb) befüllt:
- Haupttabelle (``internet_usage``) 
- History-Tabelle (``internet_usage_history``) 

## Unterschiede zwischen Haupttabelle und ihrer entsprechenden Historical Tabelle

### Haupttabelle
In der Haupttabelle internet_usage befindet sich immer nur der aktuelle Stand der Daten. Damit ist die neuste Version der Einträge gemeint [2].

### History-Tabelle
Die History-Tabelle internet_usage_history hingegen speichert (archiviert mit Datum) alle alten Versionen der Datensätze. Also wenn ein Eintrag geändert oder gelöscht wird, wird die alte Version automatisch dort gespeichert [2].

### Versioning-Funktion 
Die Versioning-Funktion, welche oft mithilfe eines Triggers umgesetzt wird, sorgt dafür, dass Änderungen automatisch archiviert werden. Also in der Tabelle internet_usage_history landen. Das geschieht, sobald ein Datensatz in der Haupttabelle geändert oder gelöscht wird [2].
Der Trigger ruft die Versionierungsfunktion auf:

``` sql
CREATE TRIGGER versioning_trigger
BEFORE INSERT OR UPDATE OR DELETE ON internet_usage
FOR EACH ROW
EXECUTE PROCEDURE versioning('sys_period', 'internet_usage_history', true);
```

Die alte Version des Datensatzes wird in die History-Tabelle kopiert und danach wird der neue Stand in der Haupttabelle gespeichert. Die Versioning-Funktion ist in der Extension „temporal_tables“ enthalten und wird bei Aufruf automatisch ausgeführt.

## Quellen
[1]	o.A. 2023. Temporal Tables PostgreSQL Extension: Installation (2023). Retrieved May 13, 2026 from https://github.com/arkhipov/temporal_tables#installation.
[2]	o.A. 2023. Temporal Tables PostgreSQL Extension: Usage (2023). Retrieved May 13, 2026 from https://github.com/arkhipov/temporal_tables#usage.