.MODEL SMALL
.STACK 100H
.DATA
    key db 31h , 32h , 33h, 34h, 35h, '$' 
    password db 5 dup(?)
    encrypted db 5 dup(?)
    input_prompt db 'Enter 5 character password : $'
    key_msg db 'Key = $'
    decryption_msg db 'Decrypted = $'
    encryption_msg db 'Encrypted = $'
    newline db 13,10,'$'
.CODE
MAIN PROC

    MOV AX, @DATA           ; Initializing data segment
    MOV DS, AX    

    ;prompting to enter password
    MOV AH, 09h              
    MOV DX, OFFSET input_prompt
    INT 21h                        

  ; taking 5 character input
    MOV CX, 05             
    MOV SI, offset password
    input: MOV AH, 01h              
    INT 21h                  
    MOV [SI] , AL     
    INC SI  
    DEC CX
    JNZ input

  ; Performing encryption
    MOV CX , 5
    MOV SI, offset key          
    MOV DI, offset password
    MOV BX, offset encrypted
encrypt:    
    MOV AL , [SI]
    MOV DL , [DI]
    XOR AL , DL
    MOV [BX] , AL               
    INC SI  
    INC DI  
    INC BX
    DEC CX
    JNZ encrypt

  ; Displaying newline
    MOV AH, 09h
    MOV DX, OFFSET newline
    INT 21h


  ; Displaying key message
    MOV AH, 09h
    MOV DX, OFFSET key_msg
    INT 21h

  ; Displaying key
    MOV AH, 09h
    MOV DX, OFFSET key
    INT 21h

  ; Displaying newline
    MOV AH, 09h
    MOV DX, OFFSET newline
    INT 21h

  ; Displaying encryption_msg
    MOV AH, 09h
    MOV DX, OFFSET encryption_msg
    INT 21h

; displaying encrypted password
    MOV CX, 05             
    MOV SI, offset encrypted
    OUT: 
    MOV DL , [SI]
    MOV AH, 02h              
    INT 21h                      
    INC SI  
    DEC CX
    JNZ OUT


  ; Displaying newline
    MOV AH, 09h
    MOV DX, OFFSET newline
    INT 21h

  ; Displaying decryption_msg
    MOV AH, 09h
    MOV DX, OFFSET decryption_msg
    INT 21h

  ; decrypting and showing the original password
    MOV CX , 5
    MOV SI, offset key          
    MOV DI, offset encrypted
decrypt:    
    MOV AL , [SI]
    MOV DL , [DI]
    XOR DL , AL 
    MOV AH , 02
    INT 21h           
    INC SI  
    INC DI  
    DEC CX
    JNZ decrypt

; Terminating program
    MOV AH, 4Ch              
    INT 21h                

MAIN ENDP
END MAIN