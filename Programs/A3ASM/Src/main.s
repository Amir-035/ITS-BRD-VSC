;************************************************
;* Beginn der globalen Daten *
;************************************************
                   AREA MyData, DATA, align = 2
Base
VariableA          DCW 0x1234
VariableB          DCW 0x4711

VariableC          DCD  0

MeinHalbwortFeld   DCW 0x22 , 0x3e , -52, 78 , 0x27 , 0x45

MeinWortFeld       DCD 0x12345678 , 0x9dca5986
                   DCD -872415232 , 1308622848
                   DCD 0x27000000
                   DCD 0x45000000

MeinTextFeld       DCB "ABab0123",0

                   EXPORT VariableA
                   EXPORT VariableB
                   EXPORT VariableC
                   EXPORT MeinHalbwortFeld
                   EXPORT MeinWortFeld
                   EXPORT MeinTextFeld

;***********************************************
;* Beginn des Programms *
;************************************************
    AREA |.text|, CODE, READONLY, ALIGN = 3
; ----- S t a r t des Hauptprogramms -----
                EXPORT main
                EXTERN initITSboard
main            PROC
                bl    initITSboard                 ; HW Initialisieren

; Laden von Konstanten in Register
                ; r0 = 0x12 (kleine Konstante direkt laden)
                mov   r0,#0x12                      ; Anw-01
                ; r1 = -128 (in Hex 0xFFFFFF80)
                mov   r1,#-128                      ; Anw-02
                ; r2 = 0x12345678 (grosse Konstante, wird aus dem Speicher geladen)
                ldr   r2,=0x12345678                ; Anw-03

; Zugriff auf Variable
                ; r0 = Adresse von VariableA
                ldr   r0,=VariableA                 ; Anw-04
                ; r1 = 16 Bit von VariableA laden
                ldrh  r1,[r0]                       ; Anw-05
                ; r2 = 32 Bit ab VariableA laden (VariableA und VariableB zusammen)
                ldr   r2,[r0]                       ; Anw-06
                ; r2 in VariableC speichern (Adresse = r0 + Abstand von VariableA zu VariableC)
                str   r2,[r0,#VariableC-VariableA]  ; Anw-07

; Zugriff auf Felder (Speicherzellen)
                ; r0 = Adresse von MeinHalbwortFeld
                ldr   r0,=MeinHalbwortFeld          ; Anw-08
                ; r1 = Element 0 vom Feld
                ldrh  r1,[r0]                       ; Anw-09
                ; r2 = Element 1 vom Feld (Adresse r0 + 2)
                ldrh  r2,[r0,#2]                    ; Anw-10
                ; r3 = 10
                mov   r3,#10                        ; Anw-11
                ; r4 = Element 5 vom Feld (Adresse r0 + r3)
                ldrh  r4,[r0,r3]                    ; Anw-12

                ; erst r0 um 2 erhoehen, dann r5 = Element an der neuen Adresse (Element 1)
                ldrh  r5,[r0,#2]!                   ; Anw-13
                ; erst r0 um 2 erhoehen, dann r6 = Element an der neuen Adresse (Element 2)
                ldrh  r6,[r0,#2]!                   ; Anw-14
                ; erst r0 um 2 erhoehen, dann r6 dort speichern (Element 3 wird ueberschrieben)
                strh  r6,[r0,#2]!                   ; Anw-15

; Addition und Subtraktion von unsigned / signed Integer-Werten
                ; r0 = Adresse von MeinWortFeld
                ldr  r0,=MeinWortFeld               ; Anw-16
                ; r1 = Element 0 vom Feld
                ldr  r1,[r0]                        ; Anw-17
                ; r2 = Element 1 vom Feld
                ldr  r2,[r0,#4]                     ; Anw-18
                ; r3 = r1 + r2, die Flags werden gesetzt
                adds r3,r1,r2                       ; Anw-19

                ; r4 = Element 2 vom Feld
                ldr  r4,[r0,#8]                     ; Anw-20
                ; r5 = Element 3 vom Feld
                ldr  r5,[r0,#12]                    ; Anw-21
                ; r6 = r4 - r5, die Flags werden gesetzt
                subs r6,r4,r5                       ; Anw-22

                ; r7 = Element 4 vom Feld
                ldr  r7,[r0,#16]                    ; Anw-23
                ; r8 = Element 5 vom Feld
                ldr  r8,[r0,#20]                    ; Anw-24
                ; r9 = r7 - r8, die Flags werden gesetzt
                subs r9,r7,r8                       ; Anw-25

                ; Endlosschleife, das Programm bleibt hier stehen
forever         b   forever                         ; Anw-26
                ENDP
                END