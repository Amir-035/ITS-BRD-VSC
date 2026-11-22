; Aufgabe 4: Primzahlsieb des Eratosthenes
; Berechnet alle Primzahlen von 2 bis 1000.

; ----- Speicher -----
; sieb:        Feld mit 1001 Elementen zu je 1 Byte (1001 Bytes)
;              Index = Zahl (0 bis 1000)
;              Wert 1 = nicht gestrichen / Primzahl
;              Wert 0 = gestrichen / keine Primzahl
;
; primzahlen:  Feld mit 500 Elementen zu je 2 Bytes (1000 Bytes)
;              Index = laufende Nummer
;              Wert  = die gefundene Primzahl
;
; Variablen:
;   p = die Zahl, die gerade streicht
;   z = die Zahl, die gerade gestrichen wird
;   i = laeuft durch das Sieb-Feld
;   k = naechstes freies Element im Primzahl-Feld

; ----- Teil 1: Initialisieren -----
;   sieb[0] = 0                   ; 0 ist keine Primzahl
;   sieb[1] = 0                   ; 1 ist keine Primzahl
;   fuer i von 2 bis 1000:
;       sieb[i] = 1               ; erst mal ist jede Zahl nicht gestrichen

; ----- Teil 2: Sieben -----
;   p = 2
;   solange p * p <= 1000:        ; danach kann p nichts Neues mehr streichen
;       wenn sieb[p] = 1:         ; nur nicht gestrichene Zahlen streichen
;           z = p * p             ; Streichen beginnt beim Quadrat
;           solange z <= 1000:
;               sieb[z] = 0       ; z streichen
;               z = z + p         ; naechstes Vielfaches von p
;       p = p + 1                 ; naechste Zahl pruefen

; ----- Teil 3: Abspeichern -----
;   k = 0
;   fuer i von 2 bis 1000:
;       wenn sieb[i] = 1:         ; i ist eine Primzahl
;           primzahlen[k] = i     ; Primzahl ins naechste freie Element
;           k = k + 1             ; k zeigt auf das naechste freie Element
