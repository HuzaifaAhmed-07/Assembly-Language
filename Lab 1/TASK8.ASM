.MODEL SMALL
.STACK 100H
.DATA
      array1 db 44h , 69h, 67h , 69h , 74h , '$'
      array2 db 4Eh , 6Fh , 74h , 20h , 61h , 20h , 44h , 69h , 67h, 69h, 74h , '$'

.CODE
    MAIN PROC
    MOV AX , @DATA
    MOV DS , AX

            MOV AH , 01
            INT 21h
            CMP AL , 30h
            JL notdigit
            CMP AL , 39h
            JG notdigit
            MOV AH , 09
            MOV DX , offset array1
            INT 21h
            JMP exit
 notdigit:  MOV AH , 09
            MOV DX , offset array2
            INT 21h
            JMP exit

     exit:  MOV AH , 4Ch
            INT 21h

            MAIN ENDP 
            END MAIN
