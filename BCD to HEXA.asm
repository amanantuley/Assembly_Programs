.MODEL SMALL
.STACK 100H
.DATA
    HEX_NUM DW 0256H  ; Example Hexadecimal number (256 in decimal)
    BCD_NUM DB 3 DUP(0)  ; Storage for BCD digits

.CODE
MAIN PROC
    MOV AX, @DATA  ; Load data segment
    MOV DS, AX
    
    MOV AX, HEX_NUM  ; Load hexadecimal number into AX
    MOV CX, 10       ; Divisor (decimal 10)
    
    ; Extract Ones Place
    MOV DX, 0        ; Clear DX before division
    DIV CX           ; AX / 10, Quotient in AX, Remainder in DX
    MOV BCD_NUM+2, DL  ; Store ones place
    
    ; Extract Tens Place
    MOV DX, 0
    DIV CX
    MOV BCD_NUM+1, DL  ; Store tens place
    
    ; Extract Hundreds Place
    MOV DX, 0
    DIV CX
    MOV BCD_NUM, DL   ; Store hundreds place

    ; BCD values are now stored in BCD_NUM (Hundreds, Tens, Ones)

    MOV AH, 4CH       ; Exit program
    INT 21H           ; DOS Interrupt

MAIN ENDP
END MAIN
