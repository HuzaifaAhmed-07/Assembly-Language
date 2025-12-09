.MODEL SMALL
.386
.STACK 100H
.DATA
 NEWLINE DB 13,10,'$'
 input_prompt db 'Enter a character : $'
.CODE
      MAIN PROC 
      MOV AX , @DATA
      MOV DS , AX
          ; PROPMTING TO ENTER CHARACTER
           MOV DX, OFFSET input_prompt 
           MOV AH , 09
           INT 21h
           
           MOV AH , 01  
           INT 21h
           MOV BL , AL
           MOV CX , 08   ; FOR DISPLAYING 8 BITS
           MOV BH , 0    ; COUNTER FOR COUNTING 1 IN BINARY


           MOV DX, OFFSET NEWLINE
           MOV AH , 09
           INT 21h

CONDITION: SHL BL , 1     
           JNC ZERO       ; DISPLAY ZERO IF CF = 0
           MOV DL , '1'
           MOV AH , 02
           INT 21h
           INC BH
           DEC CX         ; CONTINUE UNTIL 8 BITS COMPLETED
           JNZ CONDITION
           JMP EXIT


    ZERO:   MOV DL , '0'
            MOV AH , 02
            INT 21h
            DEC CX
            JNZ CONDITION
            JMP EXIT

           ;exit program
    EXIT:  
           MOV DX, OFFSET NEWLINE
           MOV AH , 09
           INT 21h

           MOV DL , BH     ; DISPLAY NUMBER OF ONES
           ADD DL , 30h
           MOV AH , 02
           INT 21h

           MOV AH , 4Ch
           INT 21h

      MAIN ENDP 
      END MAIN
