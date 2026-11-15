# Aufgabe 2

## Anw01 bis Anw06
Am Anfang steht im Speicher bei VariableA: EF BE (der Wert ist 0xBEEF).

| Zeile | R0 | R2 | R3 | Speicher ab VariableA |
|---|---|---|---|---|
| Anw01 | Adresse von VariableA | - | - | EF BE |
| Anw02 | gleich | 0x000000EF | - | EF BE |
| Anw03 | gleich | 0x000000EF | 0x000000BE | EF BE |
| Anw04 | gleich | 0x0000EF00 | 0x000000BE | EF BE |
| Anw05 | gleich | 0x0000EFBE | 0x000000BE | EF BE |
| Anw06 | gleich | 0x0000EFBE | 0x000000BE | BE EF |

Nach Anw06 steht im Speicher BE EF. Der Wert ist jetzt aber 0xEFBE,
weil das kleine Byte im Speicher zuerst steht.

## Anw07 und Anw08
R5 = 0xAFFE. Nach Anw08 steht im Speicher bei VariableA: FE AF.
Danach werden die zwei Bytes wie bei beef getauscht und in VariableC gespeichert.
Bei VariableC steht dann AF FE.

## Anw09
In Anw0B 0x30ED durch 0x21DE ersetzt. 0x1234 + 0x21DE = 0x3412.
Im Speicher steht dann 12 34.

## Probleme
- Am Anfang nicht verstanden, dass in R0 nur die Adresse steht und nicht der Wert.
- Die Reihenfolge der Bytes im Speicher war verwirrend.
