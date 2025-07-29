.MODEL SMALL
.STACK 32
.DATA
    X DB '6', '4'
    Y DB '2', '8'
    Z DB 3 DUP(?)
.CODE
    MAIN:
        MOV AX, @DATA
        MOV DS, AX
        XOR AX, AX
        MOV AL, X[0]
        AND AL, 0FH
        MOV BL, Y[0]
        AND BL, 0FH
        MUL BL
        AAM
        OR AX, 3030H
        MOV Z[0], AL
        MOV Z[1], AH
        MOV CL, 4
        AND AX, 0F0FH
        SHL AH, CL
        ADD AL, AH
        MOV Z[2], AL
    END MAIN            