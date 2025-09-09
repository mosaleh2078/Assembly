.MODEL SMALL
.STACK 32
.DATA
    SETC      DB 02H
    ECHO      DB 09H
    CLEAR     DB 06H
    PAGEN     DB 0H
    ROW_START_LEFT_EYE DB 5H
    COL_START_LEFT_EYE DB 5H
    ROW_END_LEFT_EYE   DB 0AH
    COL_END_LEFT_EYE   DB 0FH 
    
    ROW_START_RIGHT_EYE DB 5H
    COL_START_RIGHT_EYE DB 14H
    ROW_END_RIGHT_EYE   DB 0AH
    COL_END_RIGHT_EYE   DB 1FH

    ROW_START_MOUTH DB 0EH
    COL_START_MOUTH DB 5H
    ROW_END_MOUTH   DB 0EH
    COL_END_MOUTH   DB 1FH
    
    CHAR      DB 'ABCDEFGHIJKLMNOPQRSTUVWS'
    COUNT     DW 18H
    COLOR     DB 00001111B 
.CODE
    MAIN:
        MOV AX, @DATA
        MOV DS, AX
        MOV BH, PAGEN
        MOV CX, 80
        MOV BL, COLOR
        MOV DH, 0
        MOV DL, 0
        MOV DI, COUNT
        MOV SI, 0
        L:
            MOV AL, CHAR[SI]
            CALL SET_CURSOR
            CALL PRINT
            INC DH
            INC SI
            DEC DI
            CMP DI, 0           
            JNZ L 
            CALL LEFT_EYE
            CALL RIGHT_EYE
            CALL MOUTH
            JMP EXIT
         
    SET_CURSOR:
        MOV AH, SETC
        INT 10H
        RET      
        
    PRINT:
        MOV AH, ECHO
        INT 10H
        RET
        
    LEFT_EYE:
        MOV AH, CLEAR
        MOV AL, 00H
        MOV BH, 07H
        MOV CH, ROW_START_LEFT_EYE
        MOV CL, COL_START_LEFT_EYE
        MOV DH, ROW_END_LEFT_EYE
        MOV DL, COL_END_LEFT_EYE
        INT 10H
        RET 
        
    RIGHT_EYE:
        MOV AH, CLEAR
        MOV AL, 00H
        MOV BH, 07H
        MOV CH, ROW_START_RIGHT_EYE
        MOV CL, COL_START_RIGHT_EYE
        MOV DH, ROW_END_RIGHT_EYE
        MOV DL, COL_END_RIGHT_EYE
        INT 10H
        RET
        
    MOUTH:
        MOV AH, CLEAR
        MOV AL, 00H
        MOV BH, 07H
        MOV CH, ROW_START_MOUTH
        MOV CL, COL_START_MOUTH
        MOV DH, ROW_END_MOUTH
        MOV DL, COL_END_MOUTH
        INT 10H
        RET
               
    EXIT:
        MOV AH, 4CH
        INT 21H
                             
    END MAIN