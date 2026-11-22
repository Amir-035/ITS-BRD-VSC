# Aufgabe 4 - Primzahlsieb

## Analyse der Aufgabenstellung
Das Programm soll alle Primzahlen von 2 bis 1000 mit dem Sieb des Eratosthenes berechnen.

Man schreibt alle Zahlen von 2 bis 1000 auf. Mit der 2 streicht man alle Vielfachen von 2,
dann mit der 3 alle Vielfachen von 3. Die 4 ist schon gestrichen und wird übersprungen.
Dann kommt die 5 usw. Am Ende bleiben nur die Primzahlen übrig.

- Das Streichen kann bei p * p anfangen, weil die kleineren Vielfachen schon von kleineren
  Zahlen gestrichen wurden. Bei der 5 sind 10 und 20 schon durch die 2 weg und 15 durch die 3.
  Also fängt die 5 bei 25 an.
- Danach wird immer + p gerechnet, also bei der 5: 25, 30, 35, ... bis 1000.
- Wenn eine Zahl schon gestrichen ist, hat sie einen kleineren Teiler. Alle ihre Vielfachen
  sind dann auch schon gestrichen. Die 4 muss z.B. nichts streichen, weil 2 ein Teiler von 4 ist.
- Man kann aufhören, wenn p * p > 1000 ist. 31 * 31 = 961 ist noch kleiner als 1000,
  32 * 32 = 1024 ist größer. Die 31 ist also die letzte Zahl, die noch streichen muss.

Das Programm besteht aus drei Teilen:
1. Initialisieren: Sieb-Feld mit Startwerten füllen
2. Sieben: Vielfache streichen
3. Abspeichern: Primzahlen aus dem Sieb-Feld in ein zweites Feld schreiben

## Aufbau des Programms (Pseudocode)
```
// Teil 1: Initialisieren
sieb[0] = 0
sieb[1] = 0
für i von 2 bis 1000:
    sieb[i] = 1

// Teil 2: Sieben
p = 2
solange p * p <= 1000:
    wenn sieb[p] = 1:
        z = p * p
        solange z <= 1000:
            sieb[z] = 0
            z = z + p
    p = p + 1

// Teil 3: Abspeichern
k = 0
für i von 2 bis 1000:
    wenn sieb[i] = 1:
        primzahlen[k] = i
        k = k + 1
```

p = Zahl, die gerade streicht
z = Zahl, die gerade gestrichen wird
i = läuft durch das Sieb-Feld
k = nächstes freies Element im Primzahl-Feld

## Verwendete Felder
| | sieb | primzahlen |
|---|---|---|
| Inhalt | 0 oder 1 | die Primzahlen |
| Index | die Zahl selbst | laufende Nummer |
| Startwerte | Element 0 und 1: 0, ab 2: 1 | - |
| Größe pro Element | 1 Byte | 2 Byte |
| Anzahl Elemente | 1001 (Index 0 bis 1000) | 500 |
| Gesamt | 1001 Byte | 1000 Byte |

sieb: 1 = nicht gestrichen bzw. Primzahl, 0 = gestrichen bzw. keine Primzahl.
Streichen heißt, dass eine 0 in das Element geschrieben wird. Es werden 1001 Elemente
gebraucht, weil der Index bei 0 anfängt und es ein Element für die 1000 geben muss.
Element 0 und 1 bleiben drin, damit Index und Zahl gleich sind. Sie bekommen eine 0,
weil 0 und 1 keine Primzahlen sind. Für 0 oder 1 reicht 1 Byte.

primzahlen: In 1 Byte passt nur bis 255 (2^8 - 1). Für Zahlen bis 1000 braucht man
10 Bit (2^10 - 1 = 1023), also 2 Byte. Wie viele Primzahlen es gibt, weiß man vorher nicht.
Von 2 bis 1000 sind es 999 Zahlen, davon 500 gerade und 499 ungerade. Außer der 2 ist keine
gerade Zahl eine Primzahl, also gibt es höchstens 499 + 1 = 500 Primzahlen.

## Aufbau des Speichers
sieb nach dem Sieben (1 Byte pro Element):
```
Index:   0    1    2    3    4    5    6    7    8    9   ...  1000
Wert:  [ 0 ][ 0 ][ 1 ][ 1 ][ 0 ][ 1 ][ 0 ][ 1 ][ 0 ][ 0 ] ... [ 0 ]
```

primzahlen (2 Byte pro Element):
```
Index:     0      1      2      3      4     ...   499
Wert:   [  2  ][  3  ][  5  ][  7  ][ 11  ] ... [     ]
```

## Nicht gelöste Aufgaben
Keine.
