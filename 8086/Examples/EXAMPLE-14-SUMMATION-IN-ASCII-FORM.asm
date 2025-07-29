.MODEL SMALL
.STACK 32
.DATA
    X DB '6', '4'
    Y DB '2', '8'
    Z DB 4 DUP(?)
.CODE
    MAIN:
        MOV AX, @DATA
        MOV DS, AX
        XOR AX, AX
        MOV AL, X[0]
        ADD AL, Y[0]
        AAA
        OR AL, 30H
        MOV Z[0], AL
        XOR AX, AX
        MOV AL, X[1]
        MOV BL, Y[1]
        ADD AL, BL
        AAA
        OR AX, 3030H
        MOV Z[1], AL
        MOV Z[2], AH  
        MOV CL, 4
        SHL AH, CL
        AND AL, 0FH
        ADD AL, AH
        MOV Z[3], AL
    END MAIN            