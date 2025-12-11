.MODEL SMALL
.386
.STACK 100H
.DATA
 NEWLINE DB 13,10,'$'
 input_prompt db 'Enter 16 bit binary number : $'
 invalid_prompt db 'Invalid input! Start again :  $' 
.CODE
      MAIN PROC 
      MOV AX , @DATA
      MOV DS , AX
           
           ; PROMPTING USER TO ENTER 16 BIT BINARY NUMBER
           MOV BX , 0
           MOV DX, OFFSET input_prompt
           MOV AH , 09h
           INT 21h
    
           MOV DX, OFFSET NEWLINE
           MOV AH , 09h
           INT 21h
           MOV CX , 16 

INPUT_AGAIN: MOV AH , 01h
             INT 21h

  ; CHECKING IF INPUT IS 0 OR 1
             CMP AL , '1'   
             JG WRONG
             CMP AL , '0'
             JL WRONG

   ; STORE BIT IN REGISTER          
             SHL BX, 1
             OR BX, AX 
             DEC CX
             JNZ INPUT_AGAIN
             JMP PERFORM_OPERATIONS

   ; INPUT AGAIN IF NOT 0 OR 1

    WRONG:  
             CMP AL , 13h
	     JE PERFORM_OPERATIONS
            MOV DX, OFFSET invalid_prompt
            MOV AH , 09h
            INT 21h
            MOV BX, 0
            MOV CX, 16
            JMP INPUT_AGAIN

PERFORM_OPERATIONS: 
           TEST BX , 1
	   JZ ROR4
	   ROL BX , 4
           JMP OP2
ROL4:      ROR BX ,4 
OP2:       TEST BX , 8000h
	    JZ SHR1
	   SHL BX , 1
	   JMP OP3
	   SHR BX , 1
OP3:       AND  BX, FFDFh
	   OR BX , 1
	   XOR BX , 0FF0h
 
  


OUTPUT:     MOV DX, OFFSET NEWLINE
            MOV AH, 09h
            INT 21h
            MOV CX, 16

OUTPUT_LOOP:SHL BX, 1
            JC ONE
            MOV DL, '0'    ; OUTPUT BY USING LEFT SHIFT AND CHECKING CARRY FLAG
            MOV AH, 02h
            INT 21h
            JMP NEXT
ONE:        MOV DL, '1'
            MOV AH, 02h
            INT 21h
NEXT:       DEC CX
            JNZ OUTPUT_LOOP




    exit:  MOV AH , 4Ch
           INT 21h



      MAIN ENDP 
      END MAIN
