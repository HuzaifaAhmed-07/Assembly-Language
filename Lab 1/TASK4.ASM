.MODEL SMALL
.STACK 100H
.DATA
      array1 db 41h , 42h, 43h , 44h , 45h , 46h , 47h,  48h , '$'
      array2 db 49h , 50h, 51h , 52h , 53h , 54h , 55h,  56h , '$'
      NEWLINE db 13 , 10 , '$'
 
.CODE
      MAIN PROC 
      MOV AX , @DATA
      MOV DS , AX
      
           MOV CX , 8
           MOV SI , offset array1
           MOV DI , offset array2
	   ADD DI , 7
    AGAIN: MOV AL , [SI]
	   MOV AH , [DI]
           MOV [DI] , AL
	   MOV [SI] , AH
           INC SI 
           DEC DI
           DEC CX 
           JNZ AGAIN
           
           MOV AH , 09
           MOV DX , offset array1
           INT 21h

           MOV AH , 09
           MOV DX , offset NEWLINE
           INT 21h
           
           MOV AH , 09
           MOV DX , offset array2
           INT 21h


      

      MOV AH , 4Ch
      INT 21h

      MAIN ENDP 
      END MAIN
