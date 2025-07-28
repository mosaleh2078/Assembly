.MODEL SMALL
.STACK 32
.DATA
    ARR DB 5H, 0AH, 9H, 1H, 3H, 7H, 2H, 8H, 0FH, 1H, 6H, 2H, 8H, 0H, 0BH, 11H, 0DH, 5H, 4H, 6H
    SARR DB 20 DUP(?)
    MIN DB ?
    MAX DB 11111111B
    INDEX DW ?
    LEN DW 20
.CODE
    MAIN:
        MOV AX, @DATA
        MOV DS, AX
        XOR AX, AX
        MOV BX, OFFSET SARR
        MOV SI, OFFSET ARR
        MOV CX, LEN 
        L1: 
            MOV AL, [SI]
            MOV MIN, AL
            PUSH CX
            MOV CX, LEN
            L2:
                MOV DI, LEN
                SUB DI, CX
                MOV AL, ARR[DI]
                CMP MIN, AL
                JB NEXT
                MOV MIN, AL
                MOV INDEX, DI
                NEXT:
                    LOOP L2
            POP CX
            MOV AL, MIN
            MOV [BX], AL
            MOV DI, SI
            ADD DI, INDEX
            MOV AL, MAX
            MOV [DI], AL
            INC BX
            LOOP L1
    END MAIN                 