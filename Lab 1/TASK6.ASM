.MODEL SMALL
.STACK 100H
.DATA
      array1 db 'C', 'A' , 'P', 'I' , 'T' , 'A', 'L' , '$'
      array2 db 'S' , 'm' , 'a' , 'l' , 'l'  , '$'
 
.CODE
      MAIN PROC 
      MOV AX , @DATA
      MOV DS , AX
      
        MOV AH, 01
	INT 21h
	
	CMP AL , 61h
	JL CAPITAL

        MOV AH , 09
        MOV DX , offset array2
        INT 21h
	JMP EXIT


CAPITAL :     MOV AH , 09
              MOV DX , offset array1
              INT 21h



      
EXIT  :  MOV AH , 4Ch
         INT 21h

      MAIN ENDP 
      END MAIN
