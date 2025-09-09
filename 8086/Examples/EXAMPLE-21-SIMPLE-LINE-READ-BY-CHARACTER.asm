.MODEL SMALL
.STACK 32
.DATA
    COUNTER DW 5H
    COLOR   DB 00001010B
    CHARS   DB 3 DUP(?)
.CODE
    MAIN:
        MOV AX, @DATA
        MOV DS, AX
        XOR AX, AX
        XOR BH, BH
        XOR DH, DH
        XOR DH, DH
        MOV DI, 0H
        MOV CX, COUNTER
        L1:
            MOV AH, 02H
            INT 10H
            MOV AH, 01H
            INT 21H
            MOV CHARS[DI], AL
            INC DL
            INC DI
            LOOP L1
        MOV BL, COLOR
        MOV DI, 0H
        MOV CX, COUNTER 
        INC DH
        XOR DL, DL
        L2:
            MOV AH, 02H
            INT 10H
            PUSH CX
            MOV CX, 1H
            MOV AL, CHARS[DI]
            MOV AH, 09H
            INT 10H
            INC DI
            INC DL
            POP CX
            LOOP L2
        MOV AH, 4CH
        MOV AL, 0H
        INT 21H        
                