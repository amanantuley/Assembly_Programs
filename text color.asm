ORG 100h  ; Set origin for .COM file

; Macro to set text color and blinking
SET_COLOR MACRO color
    MOV AH, 09h   ; BIOS video function
    MOV BH, 00h   ; Page number
    MOV BL, color ; Set text attribute (color and blinking)
ENDM

; Macro to display a string
PRINT MACRO msg
    MOV DX, OFFSET msg  ; Load address of the string
    MOV AH, 09h         ; DOS interrupt to display string
    INT 21h             ; Call DOS interrupt
ENDM

; Data Section
MSG DB 'Hello, EMU 8086!$'  ; Define message with '$' termination

; Code Section
MOV AX, @DATA  ; Initialize data segment
MOV DS, AX

; Set color (e.g., 0x8C for blinking red text on black background)
SET_COLOR 8Ch

PRINT MSG  ; Call macro to print the string

MOV AH, 4Ch  ; DOS interrupt to terminate program
INT 21h

END
