.MODEL SMALL
.STACK 32
.DATA
    X DB 98h, 76h, 54h, 32h, 10h
    Y DB 32h, 19h, 87h, 04h, 51h
    Z DB 5 DUP(?)
.CODE
    MAIN:
        MOV AX, @DATA
        MOV DS, AX
        MOV CX, 10
        MOV BX, 9
        CLC
        L:
            MOV AL, X[BX]
            SBB AL, Y[BX]
            DAS  
            MOV DI, OFFSET Z
            MOV Z[BX] , AL
            DEC BX
            LOOP L
    END MAIN            