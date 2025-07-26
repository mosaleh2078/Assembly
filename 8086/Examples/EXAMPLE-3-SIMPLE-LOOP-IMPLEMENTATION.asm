.MODEL SMALL
.STACK 32
.DATA 
    N DB 6DH, 0BFH, 0FFH ; DB : 8 BITS
    SUM DW ?      ; DW : 16 BITS
    COUNT EQU 3
.CODE
    MAIN:
        MOV AX, @DATA
        MOV DS, AX
        MOV CX, COUNT
        MOV SI, OFFSET N
        XOR AX, AX
    BACK:
        ADD AL, [SI]
        ADC AH, 00
        INC SI
        DEC CX
        JNZ BACK
        MOV SUM, AX
    END MAIN                          