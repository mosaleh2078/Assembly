.MODEL SMALL
.STACK 32
.DATA
    POINTER DB 'HELLO', '$' ; THE STRING MUST ENDED WITH $
.CODE
    MAIN:
        MOV AX, @DATA
        MOV DS, AX
        MOV AH, 9H
        MOV DX, OFFSET POINTER
        INT 21H
    END MAIN        