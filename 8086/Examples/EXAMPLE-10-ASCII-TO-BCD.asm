.MODEL SMALL
.STACK 32
.DATA
    A DB '5487226546849844'
    B DB 16 DUP(?)
    MASK DW 0F0FH
.CODE
    MAIN:
        MOV AX, @DATA
        MOV DS, AX
        MOV CX, 8
        MOV BX, OFFSET A
        MOV DI, OFFSET B
        L:
            MOV AX, [BX]
            AND AX, MASK
            MOV [DI], AX
            ADD BX, 2
            ADD DI, 2
            LOOP L
    END MAIN            