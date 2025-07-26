.MODEL SMALL
.STACK 32
.DATA
    N DW 16DH, 3BFH, 5A3H
    SUM DW 2 DUP(?)
    COUNT EQU 3
.CODE
    MAIN:
        MOV AX, @DATA
        MOV DS, AX
        MOV CX, COUNT
        MOV SI, OFFSET N
        XOR AX, AX
        XOR BX, BX
    BACK:
        ADD AX, [SI]
        ADC BX, 0
        INC SI
        INC SI
        DEC CX
        JNZ BACK
        MOV SUM, AX
        MOV SUM+2, BX
    END MAIN            