.MODEL SMALL
.STACK 100H
.DATA
  NEWLINE db 13, 10 , '$'
  DISTANCE dB 'DISTANCE : $'
  KILOMETERS db 'KILOMETERS : $'
  METERS db 'METERS : $'
  YEARS   db 'YEARS : $'
  MONTHS  db 'MONTHS : $'
  DAYS    db 'DAYS : $'
  PKR     db 'AMOUNT IN PKR : $'
  USD     db 'USD : $'
  EUR     dB 'EUR : $'
  GBP     dB 'GBP : $'   
  FACTORIAL db 'FACTORIAL : $'   
  X        db ' x $'
  EQUAL    dB ' = $'   
  CELSIUS  db 'CELSIUS : $'             
  FAHRENHIET   db 'FAHRENHIET : $'             
  KELVIN  db 'KELVIN : $'             
.CODE

main proc
	
      MOV AX , @DATA
      MOV DS , AX

     ; MOV AH , 0
     ; MOV AL , 10h
     ; CALL Task1_8BitDecimalDisplay
      
     ; MOV AX , 1234h
     ; CALL Task2_16BitDecimalDisplay

     ; MOV DX , OFFSET NEWLINE
     ; MOV AH , 09h
     ; INT 21h


     ; MOV DX , OFFSET DISTANCE
     ; MOV AH , 09h
     ; INT 21h

     ; MOV AX , 42335
     ; CALL Task3_DistanceConverter

     ;DISPLAY KILOMETERS 

     ;  MOV BX , DX
     ;  CALL Task2_16BitDecimalDisplay

     ; MOV DX , OFFSET KILOMETERS
     ; MOV AH , 09h
     ; INT 21h
     ; MOV DX , OFFSET NEWLINE
     ; MOV AH , 09h
     ; INT 21h

    ;DISPLAY METERS
     ; MOV DX , OFFSET DISTANCE
     ; MOV AH , 09h
     ; INT 21h
     ; MOV AX, BX
     ; CALL Task1_8BitDecimalDisplay

    ; MOV AX , 28
    ; CALL Task4_AgeConverter


     ; MOV ax , 1000
     ; CALL Task5_SalaryBreakdown

     ; MOV AX , 600
     ; CALL Task6_CurrencyConverter

     ; MOV AX , 4
     ; CALL Task7_FactorialCalculator

     ;MOV AH, 0 
     ;MOV AL , 5
     ;CALL Task8_MultiplicationTable

     MOV AX , 170
     CALL Task9_TemperatureConverter

      MOV AH , 4Ch
      INT 21h
	

main endp

Task1_8BitDecimalDisplay PROC
PUSH AX
PUSH BX
PUSH CX
PUSH DX
MOV CX , 0
MOV BX , 10

BIT_AGAIN: MOV DX , 0
             DIV BX
             PUSH DX
             INC CX
             CMP AX , 0
             JZ PRINT_8BIT
             JMP BIT_AGAIN

PRINT_8BIT: POP DX
            ADD DL , 30h
            MOV AH , 02h
            INT 21h
            DEC CX
            JNZ PRINT_8BIT
POP DX
POP CX
POP BX 
POP AX
RET 

Task1_8BitDecimalDisplay ENDP

Task2_16BitDecimalDisplay PROC
PUSH AX
PUSH BX 
PUSH DX
PUSH CX
MOV CX , 0
MOV BX , 10
AGAIN : 
	MOV DX , 0
        DIV BX 
        PUSH DX
	INC CX
        CMP AX , 0
        JZ PRINT_LOOP
        JMP AGAIN

PRINT_LOOP: POP DX
	    ADD DL , 30h
	    MOV AH , 02h
	    INT 21h
	    DEC CX
        JNZ PRINT_LOOP

POP CX
POP DX
POP BX
POP AX
RET
Task2_16BitDecimalDisplay ENDP

Task3_DistanceConverter PROC
PUSH BX
MOV BX , 1000
MOV DX , 0
DIV BX
POP BX
RET 
Task3_DistanceConverter ENDP

Task4_AgeConverter PROC
MOV CX, 0
YEAR_CONVERT: CMP AX , 365
              JB MONTH_CONVERT
              MOV BX , 365
              MOV DX , 0
              DIV BX 
              MOV CX , AX
              MOV AX , DX
              MOV DX , 0
              MOV BX , 0
              CMP AX , 30
              JB CONVERTED

MONTH_CONVERT: MOV DX , 0
               CMP AX , 30
               JB CONVERTED
               MOV BX , 30
               DIV BX
               MOV DX , AX
CONVERTED: 
            MOV BX , AX

          ;YEARS DISPLAY
            PUSH DX
            MOV DX , OFFSET YEARS
            MOV AH , 09h
            INT 21h
            POP DX 

            MOV AX , CX
            CALL Task2_16BitDecimalDisplay

            PUSH DX
            MOV DX , OFFSET NEWLINE
            MOV AH , 09h
            INT 21h
            POP DX

          ;MONTHS DISPLAY
            PUSH DX
            MOV DX , OFFSET MONTHS
            MOV AH , 09h
            INT 21h
            POP DX 

            MOV AX , DX
            CALL Task2_16BitDecimalDisplay

            PUSH DX
            MOV DX , OFFSET NEWLINE
            MOV AH , 09h
            INT 21h
            POP DX


          ;DAYS DISPLAY

            PUSH DX
            MOV DX , OFFSET DAYS
            MOV AH , 09h
            INT 21h
            POP DX 

            MOV AX , BX
            CALL Task2_16BitDecimalDisplay

            PUSH DX
            MOV DX , OFFSET NEWLINE
            MOV AH , 09h
            INT 21h
            POP DX
RET
Task4_AgeConverter ENDP

Task5_SalaryBreakdown PROC 
PUSH AX 
PUSH BX
PUSH CX
PUSH DX
MOV CX , AX

;BASIC
MOV BX , 100
MOV DX , 0
DIV BX
MOV BX , 40
MUL BX
MOV BX , AX
MOV AX , DX
CALL Task2_16BitDecimalDisplay
MOV AX , BX
CALL Task2_16BitDecimalDisplay

    MOV DX , OFFSET NEWLINE
    MOV AH , 09h
    INT 21h


;HOUSE RENT
MOV AX , CX
MOV BX , 100
MOV DX , 0
DIV BX
MOV BX , 30
MUL BX
MOV BX , AX
MOV AX , DX
CALL Task2_16BitDecimalDisplay
MOV AX , BX
CALL Task2_16BitDecimalDisplay

      MOV DX , OFFSET NEWLINE
      MOV AH , 09h
      INT 21h

;CONVEYANCE
MOV AX , CX
MOV BX , 100
MOV DX , 0
DIV BX
MOV BX , 20
MUL BX
MOV BX , AX
MOV AX , DX
CALL Task2_16BitDecimalDisplay
MOV AX , BX
CALL Task2_16BitDecimalDisplay

      MOV DX , OFFSET NEWLINE
      MOV AH , 09h
      INT 21h

;Other Allowances
MOV AX , CX
MOV BX , 100
MOV DX , 0
DIV BX
MOV BX , 10
MUL BX
MOV BX , AX
MOV AX , DX
CALL Task2_16BitDecimalDisplay
MOV AX , BX
CALL Task2_16BitDecimalDisplay

      MOV DX , OFFSET NEWLINE
      MOV AH , 09h
      INT 21h

POP DX
POP CX
POP BX
POP AX
RET

Task5_SalaryBreakdown ENDP


Task6_CurrencyConverter PROC
PUSH BX
PUSH DX
PUSH CX
MOV CX , AX 

MOV DX , OFFSET PKR
MOV AH , 09h
INT 21h

MOV AX , CX
CALL Task2_16BitDecimalDisplay

MOV DX , OFFSET NEWLINE
MOV AH , 09h
INT 21h

MOV DX , OFFSET USD
MOV AH , 09h
INT 21h

MOV AX , CX 
MOV BX , 280
MOV DX , 0
DIV BX
CALL Task2_16BitDecimalDisplay

MOV DX , OFFSET NEWLINE
MOV AH , 09h
INT 21h

MOV DX , OFFSET EUR
MOV AH , 09h
INT 21h

MOV AX , CX
MOV BX , 300
MOV DX , 0
DIV BX
CALL Task2_16BitDecimalDisplay

MOV DX , OFFSET NEWLINE
MOV AH , 09h
INT 21h

MOV DX , OFFSET GBP
MOV AH , 09h
INT 21h

MOV AX , CX
MOV BX , 350
MOV DX , 0
DIV BX
CALL Task2_16BitDecimalDisplay

MOV DX , OFFSET NEWLINE
MOV AH , 09h
INT 21h

POP CX
POP DX
POP BX
RET
Task6_CurrencyConverter ENDP

Task7_FactorialCalculator PROC
PUSH CX

PUSH DX 
PUSH AX

MOV DX , OFFSET FACTORIAL
MOV AH , 09h
INT 21h

POP AX
POP DX

MOV CX , AX
MOV AX , 1
FACT: CMP CX , 1
      JE DISPLAY_FACT
      MUL CX
      DEC CX
      JMP FACT
DISPLAY_FACT:
      CALL Task2_16BitDecimalDisplay 

PUSH DX 
PUSH AX

MOV DX , OFFSET NEWLINE
MOV AH , 09h
INT 21h

POP AX
POP DX

POP CX
RET 
Task7_FactorialCalculator ENDP

Task8_MultiplicationTable PROC
PUSH CX
PUSH BX
PUSH DX
MOV CL, 1
MOV CH , 0
MOV BH , 0
MOV BL , AL 
PRINT_TABLE: MOV AL , BL
             MOV AH , 0
             CALL Task1_8BitDecimalDisplay 
             PUSH DX

             MOV DX , OFFSET X
             MOV AH , 09h
             INT 21h  

             POP DX

             MOV AL , CL
             MOV AH , 0
             CALL Task1_8BitDecimalDisplay

             PUSH DX

             MOV DX , OFFSET EQUAL
             MOV AH , 09h
             INT 21h  

             POP DX
             
             MOV AL , BL 
             MOV AH , 0
             MUL CL 
             CALL Task1_8BitDecimalDisplay
             PUSH DX

             MOV DX , OFFSET NEWLINE
             MOV AH , 09h
             INT 21h  

             POP DX

             INC CL 
             CMP CL , 11
             JL PRINT_TABLE
                         
POP DX
POP BX
POP CX
RET 
Task8_MultiplicationTable ENDP

Task9_TemperatureConverter PROC
PUSH AX
PUSH BX
PUSH CX
PUSH DX
MOV BX , AX
            MOV DX , OFFSET CELSIUS
            MOV AH , 09h
            INT 21h
            MOV AX , BX
            CALL Task2_16BitDecimalDisplay

            MOV DX , OFFSET NEWLINE
            MOV AH , 09h
            INT 21h 

    MOV AX, BX                 
    MOV CX, 9
    MUL CX                     

    MOV CX, 5
    MOV DX, 0                   
    DIV CX                      
    
    ADD AX, 32                  
    PUSH AX                     

    MOV DX, OFFSET FAHRENHIET
    MOV AH, 09h
    INT 21h
    
    POP AX                                      
    CALL Task2_16BitDecimalDisplay
    
            MOV DX , OFFSET NEWLINE
            MOV AH , 09h
            INT 21h 
    
    MOV AX, BX                  
    ADD AX, 273                 
    PUSH AX                     
    
    MOV DX , OFFSET KELVIN
    MOV AH, 09h
    INT 21h
    
    POP AX                     
    CALL Task2_16BitDecimalDisplay
    
            MOV DX , OFFSET NEWLINE
            MOV AH , 09h
            INT 21h 
    

POP DX
POP CX
POP BX
POP AX
RET
Task9_TemperatureConverter ENDP
end main