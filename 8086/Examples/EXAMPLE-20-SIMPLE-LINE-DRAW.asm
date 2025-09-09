.MODEL SMALL
.STACK 32
.DATA
    GM           DB 13H ; GRAPHICAL MODE
    F1           DB 0H
    F2           DB 0CH
    START_ROW    DW 5H
    START_COLUMN DW 0AH
    COLOR        DB 2H ; GREEN
.CODE
    MAIN:
        MOV AX, @DATA
        MOV DS, AX
        XOR AX, AX
        MOV AH, F1
        MOV AL, GM 
        INT 10H
        
        MOV DX, START_ROW   
        MOV CX, START_COLUMN
        L:
            MOV AH, F2
            MOV AL, COLOR
            INT 10H
            INC CX
            CMP CX, 80
            JNZ L
    END MAIN    