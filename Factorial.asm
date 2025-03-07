ORG 100h      ; Origin point for COM file

MOV CX, 5    ; Number whose factorial is to be calculated (change as needed)
CALL FACT    ; Call recursive factorial procedure
MOV DX, AX   ; Store the result in DX for output

; Display result (not necessary in recursion, but useful for output verification)
MOV AH, 02h  ; DOS interrupt to print character
ADD DL, '0'  ; Convert result to ASCII (only works for small factorials)
INT 21h      ; Print result

MOV AH, 4Ch  ; DOS interrupt to terminate program
INT 21h

; Recursive Factorial Procedure
FACT PROC
    CMP CX, 1    ; If CX == 1, return 1 (base case)
    JG RECURSE   ; If CX > 1, go to recursive case
    MOV AX, 1    ; Factorial(1) = 1
    RET          ; Return from function

RECURSE:
    PUSH CX      ; Save current CX on stack
    DEC CX       ; Reduce CX (n - 1)
    CALL FACT    ; Recursive call: FACT(n-1)
    POP CX       ; Restore original CX
    MUL CX       ; AX = AX * CX (n * FACT(n-1))
    RET          ; Return result
FACT ENDP

END