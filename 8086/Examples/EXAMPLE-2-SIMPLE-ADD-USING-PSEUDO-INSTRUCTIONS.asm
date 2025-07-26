.MODEL SMALL
.STACK 32
.DATA
    N1 DW 7DH
    N2 DW 34H
    N3 DW 0DCH
    SUM DW ?
.CODE
    MAIN:
        MOV AX, @DATA
        MOV DS, AX
        MOV AL, N1
        ADD AX, N2
        ADD AX, N3
        MOV SUM, AX
    END MAIN    