.MODEL SMALL
.STACK 32
.DATA
    ARR DB 11, 5, 17, 6, 1, 58, 32
    TARGET DB 32
    LEN DW 7
    INDEX DW ?
.CODE
    MAIN:
        MOV AX, @DATA
        MOV DS, AX
        MOV CX, LEN
        XOR SI, SI 
        MOV AL, TARGET
        N:
            INC SI
            CMP ARR[SI-1], AL
            LOOPNE N
        CMP ARR[SI-1], AL
        JNZ FAILURE    
        DEC SI
        MOV INDEX, SI
        FAILURE:
            
    END MAIN            