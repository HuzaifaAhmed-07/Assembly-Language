.MODEL SMALL
.STACK 100H
.DATA
    num db 65
    res1 db  'Even$' 
    res2 db  'Odd$'  
.CODE
      MAIN PROC 
      MOV AX , @DATA
      MOV DS , AX
      
    MOV AL, num       ; Load number
    AND AL, 1h        ; Checking Least significant bit
    JZ EVEN           ; If zero, number is even

    MOV DX, OFFSET res2
    MOV AH, 09h
    INT 21h
    JMP EXIT

EVEN:
    MOV DX, OFFSET res1
    MOV AH, 09h
    INT 21h

EXIT:
    MOV AH, 4Ch
    INT 21h

      MAIN ENDP 
      END MAIN
