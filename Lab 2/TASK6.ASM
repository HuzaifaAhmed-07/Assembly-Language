MODEL SMALL
.STACK 100H

.DATA
    number db 82                    

    ;strings for displaying grade
    A        db 'Grade =  A$'
    A_neg    db 'Grade =  A-$'
    B_pos    db 'Grade =  B+$'
    B        db 'Grade =  B$'
    B_neg    db 'Grade =  B-$'
    C_pos    db 'Grade =  C+$'
    C        db 'Grade =  C$'
    C_neg    db 'Grade =  C-$'
    D        db 'Grade =  D$'
    F        db 'Grade =  F$'

.CODE
MAIN PROC
 ; Initializing data segment
    MOV AX, @DATA
    MOV DS, AX

 ; load number
   MOV AL, number

 ;comparing number

    CMP AL , 85
    JGE G_A
    
    CMP AL , 80
    JGE G_A_neg
    
    CMP AL , 75
    JGE G_B_pos

    CMP AL , 70
    JGE G_B

    CMP AL , 65
    JGE G_B_neg

    CMP AL , 61
    JGE G_C_pos

    CMP AL , 58
    JGE G_C
    
    CMP AL , 55
    JGE G_C_neg

    CMP AL , 50
    JGE G_D

    JMP G_F

G_A:
    MOV AH , 09h
    MOV DX , offset A
    INT 21h
    JMP EXIT

G_A_neg: 
    MOV AH , 09h
    MOV DX , offset A_neg
    INT 21h
    JMP EXIT

G_B_pos: 
    MOV AH , 09h
    MOV DX , offset B_pos
    INT 21h
    JMP EXIT

G_B: 
    MOV AH , 09h
    MOV DX , offset B
    INT 21h
    JMP EXIT

G_B_neg: 
    MOV AH , 09h
    MOV DX , offset B_neg
    INT 21h
    JMP EXIT

G_C_pos: 
    MOV AH , 09h
    MOV DX , offset C_pos
    INT 21h
    JMP EXIT

G_C: 
    MOV AH , 09h
    MOV DX , offset C
    INT 21h
    JMP EXIT

G_C_neg: 
    MOV AH , 09h
    MOV DX , offset C_neg
    INT 21h
    JMP EXIT

G_D: 
    MOV AH , 09h
    MOV DX , offset D
    INT 21h
    JMP EXIT

G_F: 
    MOV AH , 09h
    MOV DX , offset F
    INT 21h
    JMP EXIT

    ; Terminating program
EXIT:
    MOV AH, 4Ch      
    INT 21h          

MAIN ENDP
END MAIN