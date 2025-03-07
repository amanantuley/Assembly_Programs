ORG 100h  ; Set origin for .COM file

; Macro to display a string
PRINT MACRO msg
    MOV DX, OFFSET msg  ; Load address of the string
    MOV AH, 09h         ; DOS interrupt to display string
    INT 21h             ; Call DOS interrupt
ENDM

; Data Section
MSG DB 'Hello, EMU 8086!', '$'  ; Define message with '$' termination

; Code Section
MOV AX, @DATA  ; Initialize data segment
MOV DS, AX

PRINT MSG  ; Call macro to print the string

MOV AH, 4Ch  ; DOS interrupt to terminate program
INT 21h

END
