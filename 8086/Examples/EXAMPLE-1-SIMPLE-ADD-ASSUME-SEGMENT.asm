S   SEGMENT
        DB 32 DUP(?)
S   ENDS
    
D SEGMENT
    N1 DB 1H
    N2 DB 2H
    N3 DB 3H
    SUM DB ?
D ENDS

C SEGMENT 
    MAIN PROC FAR
        ASSUME CS:C, DS:D, SS:S
        MOV AX, D
        MOV DS, AX
        MOV AL, N1
        ADD AL, N2
        ADD AL, N3
        MOV SUM, AL
    MAIN ENDP
C ENDS
    END MAIN