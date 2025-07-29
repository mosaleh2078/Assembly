.MODEL SMALL
.STACK 32
.DATA
    A DB 29H
    B DB 18H
    C DB ?
.CODE
    MAIN:
        MOV AX, @DATA
        MOV DS, AX
        XOR AX, AX
        MOV AL, A
        MOV AH, B
        ADD AL, AH
        DAA ; ADD AL, 6 IF AF (AUXILARY FLAG) IS 1
        MOV C, AL
    END MAIN    