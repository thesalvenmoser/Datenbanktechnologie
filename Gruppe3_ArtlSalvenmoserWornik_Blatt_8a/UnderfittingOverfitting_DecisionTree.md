# Data Mining und Machine Learning
Im Data Mining werden Datensätze zur Identifikation von Mustern für die weitere Verarbeitung klassifiziert. Diese Muster können einerseits für Vorhersagen verwendet werden. Dabei dienen die Muster, die durch Analyse von Testdaten erkannt wurden, als Funktion für weitere Datensätze. Andererseits kann dadurch auch der Einfluss bestimmter Eigenschaften der Daten auf andere bestimmt werden. Zur Klassifikation werden unterschiedliche Machine-Learning-Werkzeuge verwendet. Ziel dieser Verfahren ist die Bestimmung eines Modells, das jegliche Daten-Inputs spezifischen Daten-Outputs zuweist. Je nach Learning Algorithmus können unterschiedliche Arten von Modellen trainiert werden. Das Trainingsset ist eine bestimmte Menge an Daten, die anhand bestimmter Eigenschaften ihrer einzelnen Einträge analysiert wird. Die Einträge werden anhand ihrer Eigenschaften in unterschiedliche Klassen eingordnet. Dabei kann eine Vielzahl unterschiedlicher Modelle entstehen. Nicht jeder Entscheidungsbaum ist für die Klassifizierung verschiedener Datensätze geeignet. Um das am besten geeignete Modell zu bestimmen, werden die Modelle auf ein Test-Set angewendet, das Daten aus dem gleichen Datensatz enthält. Zumeist wird eine Aufteilung des Datensatzes in 75% Trainingsset und 25% Test-Set angestrebt.

## Decision-Tree-Induction allgemein
Die Induktion eines Entscheidungsbaums ist der erste Schritt im Prozess des Supervised (Machine) Learning. Es gibt exponentiell viele Möglichkeiten, wie dieser aussehen kann und den optimalen zu finden ist nicht lösbar. Durch die Aufspaltung der einzelnen Einträge nach unterschiedlichen Werden ihrer Attribute wird Schritt für Schritt ein Entscheidungsbaum gebaut.

Anhand des Informationsgewinns, verursacht durch die einzelnen Schritte, kann die Renatabilität der Aufspaltung des Datensatzes an dem jeweiligen Attribut berechnet werden. Dabei kann es zu Under- bzw, Overfitting kommen. Durch spezielle Verfahren werden die Knoten des Entscheidungsbaum, die nicht zur verbesserung des Informationsgewinns beitragen, anschließend von seinen Blattknoten aufwärts gekürzt.

## Under- und Overfitting
Das Ziel von Supervised Learning ist die Generalisierung von Daten zur Kategorisierung von neuen Datensätzen, um Vorhersagen über gewisse Eigenschaften zu treffen. Ohne sogenanntes Pruning wächst ein Entscheidungsbaum bei Overfitting bis jedes Blatt rein ist. D.h. das Modell richtet sich auch nach evtl. Ausreissern und Fehlern. Umgekehrt wächst der Entscheidungsbaum bei Underfitting nicht tief genug und bietet nur unzureichend starke Entscheidungskriterien. Neue Datensätze, die mit Modellen analysiert werden, die zu allgemein oder zu spezifisch sind, können nur schlecht kategorisiert werden. Anhand eines Beispiels zur Diabetesdiagnose sollen die Effekte von Under- und Overfitting verdeutlicht werden.

### Underfitting
- Das Modell ist zu einfach und erfasst die zugrundeliegenden Muster in den Daten nicht
- Hoher Bias – das Modell macht systematische Fehler
- Kategorisierung aller Patienten über 50 als Diabetiker – zu simpel

### Overfitting
- Das Modell ist zu komplex und zu sehr an die Unterschiede in den Trainingsdaten angepasst. Es lernt nicht nur die Muster, sondern auch das Rauschen in den Trainingsdaten
- Hohe Varianz – das Modell reagiert zu sensitiv auf kleine Schwankungen
- Kategorisierung aller Patienten, die nicht über 50 sind, einen BMI von 25.0 oder niedriger und keinen Bluthochdruck haben als Nicht-Diabetiker - zu komplex

## Decision-Tree-Algorithmen

Das meistverwendete Verfahren zur Erstellung von Entscheidungsbäumen ist heute der C4.5 Algorithmus. Er basiert auf dem rekursiven Iterative Dichtomiser 3 (ID3) und enthält in der Data Mining Software Weka per Default einen Pruning-Mechanismus.
Ähnlich wie beim ID3 wird die Entropie des Trainingssatzes und damit für jedes Attribut der Informationsgewinn berechnet. Dieser Wert bietet sich als Split-Kriterium für kategoriale Attribute an. Kontinuierlichen Attribute erhalten jedoch einen künstlich hohen Informationsgewinn. Beim C4.5 Algorithmus wird daher zusätzlich das Informationsgewinn-Verhältnis berechnet. Dieser Wert ist durch die Bestrafung von Attributen, die den Datensatz in viele kleine Teile spalten, als Split-Kriterium besser geeignet.
Darüber hinaus enthält C4.5 einige Verbesserungen in Bezug auf unvollständige Datensätze. Während ID3 mit fehlenden Werten schlecht umgehen konnte, nutzt C4.5 beim Training des Modells nur Einträge mit bekannten Werten für die Berechnung des Informationsgewinns und verteilt die Einträge mit fehlenden Werten bspw. proportional auf alle Zweige.

### C4.5 Schritt für Schritt
Das C4.5 Verfahren zur Erstellung von Entscheidungsbäumen ist ein rekursiver Algorithmus mit folgenden Basisfällen, in denen er abbricht:

- Alle Einträge eines Datensatzes gehören zu der gleichen Klasse.
- Für die Aufspaltung des Datensatzes sind keine Attribute mehr übrig.
1. Berechne Entropie des gesamten Datensatzes
2. Für jedes Attribut: Berechne Informationsgewinn / Informationsgewinn-Verhältnis
3. Wähle Attribut mit bestem Informationsgewinn-Verhältnis als Wurzel/Knoten
4. Teile Datensatz anhand dieses Attributs
5. Wiederhole rekursiv für Teilmengen