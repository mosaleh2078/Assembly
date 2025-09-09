.MODEL SMALL
.STACK 32
.CODE 
    MAIN:
        XOR AX, AX
        INT 33H    ; IF THE MOUSE EXISTS, THEN AX=FFFF
        MOV AX, 1H
        INT 33H    ; ACTIVATES THE MOUSE
        MOV AH, 1H
        INT 21H    ; WAIT FOR KEYSTROKE
        MOV AX, 2H
        INT 33H    ; HIDE THE CURSOR
    END MAIN     