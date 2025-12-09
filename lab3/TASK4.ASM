.MODEL SMALL
.386
.STACK 100H
.DATA
 NEWLINE DB 13,10,'$'
 input_prompt db 'Enter 4 hexadecimal digits  : $'
 invalid_prompt db 'Invalid input! Start again :  $' 
.CODE
      MAIN PROC 
      MOV AX , @DATA
      MOV DS , AX

 ; PROMPTING USER TO ENTER INPUT

             MOV BX , 0
             MOV DX, OFFSET input_prompt
             MOV AH , 09h
             INT 21h
    
             MOV DX, OFFSET NEWLINE
             MOV AH , 09h
             INT 21h
             MOV CX , 4 

INPUT_AGAIN: MOV AH , 01
             INT 21h

; check if 0–9
    CMP AL, '0'
    JB INVALID
    CMP AL, '9'
    JBE DIGIT

; check if A–F
    CMP AL, 'A'
    JB CHECK_LOWER
    CMP AL, 'F'
    JBE UPPER

CHECK_LOWER:
; check if a–f
    CMP AL, 'a'
    JB INVALID
    CMP AL, 'f'
    JBE LOWER

DIGIT:
 SUB AL , 48
 JMP STORE_INPUT

UPPER:
 SUB AL , 55
 JMP STORE_INPUT

LOWER:
 SUB AL , 87
 JMP STORE_INPUT

STORE_INPUT: SHL BX, 4 
             OR BL, AL 
             DEC CX
             JNZ INPUT_AGAIN
             JMP OUTPUT

INVALID:    MOV DX, OFFSET invalid_prompt
            MOV AH , 09h
            INT 21h
            MOV BX, 0
            MOV CX, 4
            JMP INPUT_AGAIN

OUTPUT:     MOV DX, OFFSET NEWLINE
            MOV AH, 09h
            INT 21h
            MOV CX, 4
OUTPUT_LOOP: ROL BX , 4
             MOV DL,BL
             AND DL, 0Fh
             CMP DL, 10
             JB DIG
             ADD DL , 55
             JMP DISPLAY
             
        DIG: ADD DL , '0'
             JMP DISPLAY
        
    DISPLAY: MOV AH , 02h
             INT 21h
             DEC CX
             JNZ OUTPUT_LOOP

    exit:  MOV AH , 4Ch
           INT 21h



      MAIN ENDP 
      END MAIN
