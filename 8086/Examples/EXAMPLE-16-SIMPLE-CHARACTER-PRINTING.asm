.MODEL SMALL
.STACK 32
.DATA
    CHAR  DB 'A'
    FUNC  DB 9H
    COUNT DW 5H
    COLOR DB 00001111B
    PAGEN DB 0H
.CODE
    MAIN:
        MOV AX, @DATA
        MOV DS, AX
        MOV AH, FUNC
        MOV BH, PAGEN
        MOV AL, CHAR    
        MOV CX, COUNT
        MOV BL, COLOR
        INT 10H
    END MAIN    