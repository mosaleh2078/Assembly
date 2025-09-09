.MODEL SMALL
.STACK 32
.CODE  
    MAIN:
        XOR AH, AH
        MOV AL, 12H
        INT 10H
        MOV AX, 01H
        INT 33H
        BACK:
            MOV AX, 03H
            INT 33H
            MOV AH, 0CH
            MOV AL, 07H
            SHR CX, 1
            INT 10H
            MOV AH, 01H
            INT 16H
            JNZ KEY
            JMP BACK 
            
    KEY:
        MOV AH, 00H
        INT 16H
        CMP AL, 'Q'
        JE EXIT
        JMP BACK            
            
    EXIT:
        MOV AH, 4CH
        MOV AL, 0
        INT 21H 
           
    END MAIN        