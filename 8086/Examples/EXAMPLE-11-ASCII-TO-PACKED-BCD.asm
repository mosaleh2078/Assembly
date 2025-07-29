.MODEL SMALL
.STACK 32
.DATA
    A DB '94'
    B DB ?
    MASK DW 0F0FH
.CODE
    MAIN:
        MOV AX, @DATA
        MOV DS, AX
        MOV BX, OFFSET A
        MOV AX, [BX]
        AND AX, MASK
        XCHG AL, AH
        MOV CL, 4
        SHL AH, CL
        OR AL, AH
        MOV BX, OFFSET B
        MOV [BX], AL  
    END MAIN    