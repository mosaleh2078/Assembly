.MODEL SMALL
.STACK 32
.DATA
    FUNC1 DB 02H
    FUNC2 DB 09H
    PAGEN DB 0H
    ROW   DB 10H
    COL   DB 20H
    CHAR  DB 'A'
    COUNT DW 10H
    COLOR DB 00001111B 
.CODE
    MAIN:
        MOV AX, @DATA
        MOV DS, AX
        MOV BH, PAGEN
        MOV CX, 1
        MOV BL, COLOR
        MOV DH, 0
        MOV DL, 0
        MOV AL, CHAR
        MOV DI, COUNT
        L:
            CALL SET_CURSOR
            CALL PRINT
            INC DH
            INC DL
            DEC DI
            CMP DI, 0           
            JNZ L
            JMP EXIT
         
    SET_CURSOR:
        MOV AH, FUNC1
        INT 10H
        RET      
        
    PRINT:
        MOV AH, FUNC2
        INT 10H
        RET
               
    EXIT:
        MOV AH, 4CH
        INT 21H
                             
    END MAIN