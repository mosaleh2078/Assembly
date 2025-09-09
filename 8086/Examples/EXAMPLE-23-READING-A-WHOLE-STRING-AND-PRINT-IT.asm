.MODEL SMALL
.STACK 32
.DATA
    BUFF DB 11
         DB ?
         DB 11 DUP(0)
.CODE
    MAIN:
        MOV AX, @DATA
        MOV DS, AX
        XOR AX, AX
        MOV AH, 0AH
        MOV DX, OFFSET BUFF
        INT 21H
        MOV SI, OFFSET BUFF+1
        MOV CL, [SI]
        XOR CH, CH
        INC CX
        ADD SI, CX
        MOV AL, '$'
        MOV [SI], AL
        MOV AH, 09H
        MOV DX, OFFSET BUF+2
        INT 21H
        MOV AH, 4CH
        INT 21H
    END MAIN             