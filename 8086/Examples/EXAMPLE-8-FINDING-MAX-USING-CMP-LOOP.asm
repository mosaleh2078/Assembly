; CMP A, B:
;   IF(A == B) THEN ZF = 1
;   IF(A > B) THEN CF = 0
;   IF(A < B) THEN CF = 1

.MODEL SMALL
.STACK 32
.DATA
    N1 DB 0F5H
    N2 DB 0F5H
    N3 DB 0FDH
    N4 DB 34H
    ARR DB 25H, 31H, 0F1H, 0AAH, 58H, 27H, 0DCH, 79H, 00H ; FINAL NUMBER MUST BE 0
    MAX DB ?
.CODE
    MAIN:  
    ; ------ SIMPLE CMP ------ 
        MOV AX, @DATA
        MOV DS, AX
        MOV AL, N1
        MOV AH, N2
        CMP AH, AL ; ZF = 0
        MOV AH, N3
        CMP AH, AL ; CF = 0
        MOV AH, N4
        CMP AH, AL ; CF = 1    
     
    ; ---- FINDING MAX ----
    ;  1. FINDING THE LENGTH OF ARRAY
    ;  2. FINDING MAX USING LOOP AND CMP
        MOV BX, OFFSET ARR
        XOR CX, CX
    LEN_LOOP:
        CMP [BX], 00H
        JE LEN_FOUND
        INC CX
        INC BX
        JMP LEN_LOOP
    LEN_FOUND:
        MOV BX, OFFSET ARR
        MOV AL, [BX]
    MAX_FIND:
        CMP [BX], AL
        JBE NO_UPDATE
        MOV AL, [BX]
    NO_UPDATE:
        INC BX
        LOOP MAX_FIND
        MOV MAX, AL        
         
    END MAIN        