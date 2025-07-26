.MODEL SMALL
.STACK 32
.DATA
    N1 DB 1FH
    N2 DB 3AH
    N3 DW 12F4H
    N4 DW 3E21H
    R1 DW ?
    R2 DW 2 DUP(?)
    R3 DW 2 DUP(?)
.CODE
    MAIN:
        MOV AX, @DATA
        MOV DS, AX
        
    ; -------- BYTE X BYTE --------
        XOR AX, AX
        MOV AL, N1
        MUL N2     ; MUL OPERATES BASED ON AX
        MOV R1, AX                 
        
    ; -------- WORD X WORD --------
        XOR AX, AX
        MOV AX, N3
        MUL N4     ; THE RESULT IS STORED IN DX:AX
        MOV R2, AX
        MOV R2+2, DX
        
    ; -------- WORD X WORD --------
        XOR AX, AX
        XOR DX, DX
        MOV AL, N1
        MUL N3
        MOV R3, AX
        MOV R3+2, DX
        
    END MAIN    
            