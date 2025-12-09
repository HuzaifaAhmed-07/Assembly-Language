.MODEL SMALL
.386
.STACK 100H
.DATA
 NEWLINE DB 13,10,'$'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
           
    MOV BL, 'A'        ; Start from 'A'

CHECK:
    CMP BL, 'Z'        ; If beyond 'Z', exit
    JA EXIT

PRINT:
    MOV DX, OFFSET NEWLINE
    MOV AH, 09h
    INT 21h

    ; Print the letter
    MOV DL, BL
    MOV AH, 02h
    INT 21h

    ; Print space
    MOV DL, ' '
    MOV AH, 02h
    INT 21h

    ; bitS printing
    MOV DH, BL      
    MOV CX, 8        ; 8 bits to print

CONDITION:
    SHL DH, 1          
    JNC ZERO            ; If CF = 0, print '0'

    ; Print '1'
    MOV DL, '1'
    MOV AH, 02h
    INT 21h
    JMP CONTINUE

ZERO:
    MOV DL, '0'
    MOV AH, 02h
    INT 21h

CONTINUE:
    DEC CX
    JNZ CONDITION       ; Repeat until 8 bits done

NEXT:
    INC BL               ; Move to next letter
    JMP CHECK

EXIT:
    MOV AH, 4Ch
    INT 21h

MAIN ENDP
END MAIN
