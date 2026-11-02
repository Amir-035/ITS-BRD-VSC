# Aufgabe 1

## Beobachtungen (Debugger)
Zeile für Zeile durchgegangen. Endzustand: nur D08 und D09 leuchten.

| Befehl | LEDs danach an |
|---|---|
| STRB R2,[R6] | D14 |
| STRB R3,[R6] | D14, D15 |
| STRB R0,[R6] | D14, D15, D08 |
| STRB R0,[R7] | D14, D15 |
| STRB R0,[R6] | D14, D15, D08 |
| STRB R1,[R6] | D14, D15, D08, D09 |
| STRB R2,[R7] | D15, D08, D09 |
| STRB R3,[R7] | D08, D09 |

## Falsche Kommentare
- MOV R2, #0x40: Kommentar sagt 0b0100, richtig ist 0b01000000
- MOV R3, #0x80: Kommentar sagt 0b1000, richtig ist 0b10000000

## Optimierung
Alle acht STRB-Befehle durch MOV R0,#0x03 und STRB R0,[R6] ersetzt.
0x03 = 0b00000011 = Bit 0 und Bit 1 = D08 und D09. Das Set-Register
schaltet nur die LEDs mit einer 1 an, die anderen bleiben unverändert.

## Probleme
- Build schlug fehl mit "Bad CPU type" (Apple Silicon): gelöst durch Installation von Rosetta 2.
- Debugger-Erweiterung "Arm Debugger" fehlte: nachinstalliert.
- Zeitweise USB-Fehler "No such device" durch Kabel/Adapter, danach stabil.