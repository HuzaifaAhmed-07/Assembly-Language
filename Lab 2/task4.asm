.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC

    MOV AX, @DATA           ; Initializing data segment
    MOV DS, AX               

    ; Taking input
    MOV AH, 01h
    INT 21h   
    MOV BL , AL                         

    ; In uppercase
    MOV DL, BL             
    AND DL, 0DFh
    MOV AH, 02h
    INT 21h

    ; In Lowercase
    MOV DL, BL             
    OR DL, 20h
    MOV AH, 02h
    INT 21h

    ;Toggling
    MOV DL, BL              
    XOR DL, 20h
    MOV AH, 02h
    INT 21h
    
    ; Terminating program
    MOV AH, 4Ch              
    INT 21h                

MAIN ENDP
END MAIN