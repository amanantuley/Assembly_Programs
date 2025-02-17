ORG 100h   ; Set origin for COM file

MOV AL, 35h   ; Load first 8-bit number (hex 35)
MOV BL, 12h   ; Load second 8-bit number (hex 12)

ADD AL, BL    ; AL = AL + BL (Addition)
MOV CL, AL    ; Store result of addition in CL

MOV AL, 35h   ; Reload first 8-bit number
SUB AL, BL    ; AL = AL - BL (Subtraction)
MOV DL, AL    ; Store result of subtraction in DL

MOV AL, 08h   ; Load first 8-bit number for multiplication
MOV BL, 06h   ; Load second 8-bit number
MUL BL        ; AX = AL * BL (Multiplication)
MOV SI, AX    ; Store result of multiplication in SI

MOV AX, 1234h ; Load first 16-bit number (hex 1234)
MOV BX, 0005h ; Load second 16-bit number (hex 0005)
DIV BX        ; AX = AX / BX (Division), remainder in DX
MOV DI, AX    ; Store quotient in DI
MOV BP, DX    ; Store remainder in BP

MOV DX, 002Ah ; Load another 16-bit number (hex 002A)
ADD AX, DX    ; AX = AX + DX (Addition)
MOV SI, AX    ; Store result of addition in SI

MOV DX, 0014h ; Load another 16-bit number (hex 0014)
SUB AX, DX    ; AX = AX - DX (Subtraction)
MOV DI, AX    ; Store result of subtraction in DI

HLT           ; Stop execution
