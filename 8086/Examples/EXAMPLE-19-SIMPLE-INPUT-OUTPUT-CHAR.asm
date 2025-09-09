.MODEL SMALL
.STACK 32
.DATA
    COUNTER DB 3H
.CODE
    MAIN:
        MOV AX, @DATA
        MOV DS, AX
        MOV CL, COUNTER
        L:
            MOV AH, 01H
            INT 21H
            MOV AH, 02H
            MOV DL, AL
            INT 21H
            LOOP L
        MOV AH, 4CH
        MOV AL, 00H
        INT 21H
    END MAIN            