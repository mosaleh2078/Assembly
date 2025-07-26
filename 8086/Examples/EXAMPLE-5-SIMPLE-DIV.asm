.MODEL SMALL
.STACK 32
.DATA
    N1 DB 0D3H
    N2 DB 5FH
    N3 DW 04A27H
    R1 DB 2 DUP(?) ; Quotient:Remainder
    ;R2
.CODE
    MAIN:
        MOV AX, @DATA
        MOV DS, AX
        
   ; -------- WORD / WORD --------     
        XOR AX, AX
        MOV AL, N1
        DIV N2
        MOV BX, OFFSET R1
        MOV [BX], AL
        MOV [BX+1], AH
        
   ; -------- WORD / WORD --------   
        XOR AX, AX
        MOV AX, N3
        DIV N1  
        
    END MAIN    