.MODEL SMALL
.STACK 100H
.DATA
     num1 db 65
     num2 db 97
.CODE
      MAIN PROC 
      MOV AX , @DATA
      MOV DS , AX
      
      MOV AL , num1
      AND AL , num2 ; AND operation
      MOV DL , AL
      MOV AH , 02   ; output after AND
      INT 21h

      MOV AL , num1
      OR  AL , num2 ; OR operation
      MOV DL , AL
      MOV AH , 02  ; output after OR
      INT 21h

      MOV AL , num1
      XOR AL , num2 ; XOR operation
      MOV DL , AL
      MOV AH , 02  ; output after XOR
      INT 21h

      MOV AH , 4Ch
      INT 21h

      MAIN ENDP 
      END MAIN
