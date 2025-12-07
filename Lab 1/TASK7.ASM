.MODEL SMALL
.STACK 100H
.DATA
   array1 db 4Fh , 76h, 65h , 72h , 66h , 6Ch , 6Fh, 77h , '$'
.CODE
        MAIN PROC 
        MOV AX , @DATA
        MOV DS , AX


         MOV AH , 01
         INT 21h
         SUB AL , 30h
         MOV BL , AL
         MOV AH , 01
         INT 21h
         SUB AL , 30h
         ADD AL , BL
         CMP AL , 0ah
         JL ans
         MOV AH , 09
         MOV DX , offset array1
         INT 21h
         JMP exit

   ans:  ADD AL , 30h
         MOV DL , AL

         MOV AH , 02
         INT 21h
         JMP exit

  exit:  MOV AH , 4Ch
         INT 21h

        MAIN ENDP 
        END MAIN

