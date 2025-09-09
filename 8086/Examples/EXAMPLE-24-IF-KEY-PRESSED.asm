.MODEL SMALL
.STACK 32
.CODE
    MAIN:
        XOR AX, AX
        MOV AH, 02H
        MOV DL, 07H  ; 07H CHARACTER = BEEP SOUND
        INT 21H
        MOV AH, 01H
        INT 16H      ; IF A KEY PRESSED?
        JZ MAIN      ; YES: ZF = 0, NO: ZF = 1
        MOV AH, 0H
        INT 16H      ; CHAR -> AL WITHOUT ECHO
        CMP AL, 'Q'
        JE EXIT
        JMP MAIN
    
    EXIT:
        MOV AH, 4CH
        INT 21H
        
    END MAIN                