.MODEL SMALL
.STACK 32
.DATA
    N1 DW 0FFFFH
    R DW 6 DUP(?)
.CODE
    MAIN:
    ; ------ RIGHT AND LEFT SHIFT ------
        MOV AX, @DATA
        MOV DS, AX
        MOV AX, N1
        SHR AX, 1
        MOV BX, OFFSET R
        MOV [BX], AX
        MOV AX, N1
        MOV CL, 2H
        SHL AX, CL
        MOV [BX+2], AX
      
    ; ----- RIGHT AND LEFT ROTATE -----    
        ROR AX, 1
        MOV [BX+4], AX
        ROL AX, CL
        MOV [BX+6], AX 
        
    ; -- RIGHT AND LEFT CARRY ROTATE --
        CLC
        MOV AX, N1
        RCR AX, 1
        MOV [BX+8], AX
        RCL AX, CL
        MOV [BX+10], AX
        
    END MAIN  