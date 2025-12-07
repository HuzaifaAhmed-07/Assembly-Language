.MODEL SMALL
.STACK 100H
.DATA
      NEWLINE db 13 , 10 , '$'
 
.CODE
        MAIN PROC 
        MOV AX , @DATA
        MOV DS , AX

        MOV AH, 01
	INT 21h
	MOV DL,AL

	MOV AH,02
	INT 21h
   
        MOV AH , 4Ch
        INT 21h

        MAIN ENDP 
        END MAIN

