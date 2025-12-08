.MODEL SMALL
.STACK 100H
.DATA
    array1 DB  'l' , 'e' , 's' , 's' , '$'
    array2 DB  'G' , 'r' , 'e' , 'a' , 't' , 'e' , 'r' , '$'
    array3 DB  'e' , 'q' , 'u' , 'a' , 'l' , '$'
.CODE
      MAIN PROC 
      MOV AX , @DATA
      MOV DS , AX
      
           
           MOV AH , 01  ; first character input
           INT 21h
           MOV BL , AL

           MOV AH , 01 ; second character input
           INT 21h
           MOV BH , AL

           ;compare if first number is less
           CMP BL , BH
           JL LESS    

           ;compare if first number is greater
           CMP BL , BH
           JG GREATER
           
           ;compare if first number is equal
           CMP BL , BH
           JE EQUAL
           
           ; display less
    LESS:  MOV AH , 09
           MOV DX , offset array1
           INT 21h
           JMP EXIT

           ; display grater
  GREATER: MOV AH , 09
           MOV DX , offset array2
           INT 21h
           JMP EXIT
           ;display equal 
   EQUAL:  MOV AH , 09
           MOV DX , offset array3
           INT 21h
           JMP EXIT

           ;exit program
    EXIT:  MOV AH , 4Ch
           INT 21h

      MAIN ENDP 
      END MAIN
