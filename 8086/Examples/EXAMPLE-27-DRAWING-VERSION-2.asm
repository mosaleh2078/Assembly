.MODEL SMALL
.STACK 32
.DATA
    COLOR DB 07H
    LKEY  DW 01H
    EXITC DB 'Q'
.CODE
    MAIN:
        MOV AX, @DATA
        MOV DS, AX
        XOR AX, AX
        MOV AL, 12H
        INT 10H
        MOV AX, 01H
        INT 33H
        DRAW:
            MOV AH, 01H
            INT 16H
            JNZ CROT
            MOV AX, 03H
            INT 33H
            CMP BX, LKEY
            JNZ DRAW
            MOV AH, 0CH
            MOV AL, COLOR
            SHR CX, 1
            INT 10H
            JMP DRAW
    
    CROT:
        MOV AH, 00H
        INT 16H
        CMP AL, EXITC
        JZ EXIT
        JMP DRAW
        
    EXIT:
        MOV AH, 4CH
        INT 21H
        
    END MAIN                        