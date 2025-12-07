.MODEL SMALL
.STACK 100H
.DATA
	array1 db 41h,42h,43h,44h,45h,46h,47h,48h,'$'
	array2 db 1,2,3,4,5,6,7,8,'$'
	NEWLINE db 13,10,'$'
.CODE
	MAIN PROC
	MOV AX, @DATA
	MOV DS, AX
	
	MOV SI, offset array1
	MOV DI, offset array2
	ADD DI,7
	MOV CX,8
AGAIN:  MOV AL,[SI]
	MOV [DI],AL
	DEC CX
	INC SI
	DEC DI
	JNZ AGAIN
	
	MOV AH,9
	MOV DX, offset array1
	INT 21h

	MOV AH,9
	MOV DX, offset NEWLINE
	INT 21h

	MOV AH,9
	MOV DX, offset array2
	INT 21h

	
	
	
	
	MOV AH, 4Ch
	INT 21h

	MAIN ENDP
	END MAIN