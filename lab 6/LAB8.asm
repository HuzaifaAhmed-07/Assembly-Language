.MODEL SMALL
.STACK 100H
.386
.DATA
    even_msg  db  'Even$' 
    odd_msg  db 'Odd$'  
    pos_msg db 'POSITIVE$'
    neg_msg db 'NEGATIVE$'
    cap_msg  db 'CAPITAL$'
    small_msg db 'SMALL$'
    dig_msg  db 'DIGIT$'
    other_msg db 'OTHER$'

.CODE

main proc
	
      MOV AX , @DATA
      MOV DS , AX
      MOV AX , 1234h
      CALL binary
      CALL hex_output
      CALL CHK_NUM

main endp

binary proc

MOV CX , 16
PUSH AX
OUTPUT_LOOP: SHL AX, 1
            JC ONE
            MOV DL, '0'    ; OUTPUT BY USING LEFT SHIFT AND CHECKING CARRY FLAG
            MOV AH, 02h
            INT 21h
            JMP NEXT
ONE:        MOV DL, '1'
            MOV AH, 02h
            INT 21h
NEXT:       DEC CX
            JNZ OUTPUT_LOOP
POP AX
RET
binary endp

hex_output proc

MOV CX , 4
push bx
PUSH AX
mov bx , ax
OUTPUTLOOP:  ROL bX , 4
             MOV DL,bL
             AND DL, 0Fh
             CMP DL, 10
             JB DIG
             ADD DL , 55
             JMP DISPLAY
             
        DIG: ADD DL , '0'
             JMP DISPLAY
        
    DISPLAY: MOV AH , 02h
             INT 21h
             DEC CX
             JNZ OUTPUTLOOP
POP AX
pop bx
RET
hex_output endp

CHK_NUM proc
 PUSH AX 
 TEST AX , 1
 JZ EVE
 MOV DX , OFFSET odd_msg
 MOV AH , 09
 INT 21h
 JMP NEX

EVE: 
  MOV DX , OFFSET even_msg
  MOV AH , 09
  INT 21h
NEX:
  TEST AX , 8000h
  JZ POS
  MOV DX , OFFSET neg_msg
  MOV AH , 09 
  INT 21h
  RET
POS:
  MOV DX , OFFSET pos_msg
  MOV AH , 09 
  INT 21h
  RET
CHK_NUM endp


check proc

push ax
push bx
mov bl , al
cmp bl , 48
jb other
cmp bl , 57
jbe dig
cmp bl , 65
jb other
cmp bl , 90
jbe capital
cmp bl , 97
jb other
cmp bl , 122
jbe small
other: mov dx , offset other_msg
       MOV AH , 09 
       INT 21h
       jmp exit
small:
       mov dx , offset small_msg
       MOV AH , 09 
       INT 21h
       jmp exit

capital:
       mov dx , offset cap_msg
       MOV AH , 09 
       INT 21h
       jmp exit
       
exit: pop bx
pop ax
ret
check endp
end main




  