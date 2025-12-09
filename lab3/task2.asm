.MODEL SMALL
.386
.STACK 100H
.DATA
 NEWLINE DB 13,10,'$'
.CODE
      MAIN PROC 
      MOV AX , @DATA
      MOV DS , AX
           
           MOV AH , 01     ; TAKING INPUT
           INT 21h
           MOV BL , AL

           MOV DX, OFFSET NEWLINE ; DISPLAYING NEWLINE
           MOV AH , 09
           INT 21h

           SHR AL , 4             ; DISPLAY FIRST 4 BITS DATA
           ADD AL , 30h           

           MOV DL , AL
           MOV AH , 02 
           INT 21h

           AND BL , 0Fh           ; DISPLAYING LAST 4 BITS DATA
           MOV DL , BL
           ADD DL , 30H
           MOV AH , 02 
           INT 21h


    exit:  MOV AH , 4Ch
           INT 21h



      MAIN ENDP 
      END MAIN
