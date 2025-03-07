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
MSG DB 'Finding Min and Max in Assembly$'  ; Define message with '$' termination
NUMS DW 5, 3, 8, 1, 4  ; Array of numbers
COUNT DW 5  ; Number of elements
MIN DW 0FFFFh  ; Variable to store minimum value
MAX DW 0000h   ; Variable to store maximum value
; Code Section
MOV AX, @DATA  ; Initialize data segment
MOV DS, AX

; Set color (e.g., 0x8C for blinking red text on black background)
SET_COLOR 8Ch

PRINT MSG  ; Call macro to print the string
; Finding Minimum and Maximum
MOV CX, COUNT  ; Number of elements
MOV SI, 0      ; Index for array

FIND_LOOP:
    MOV AX, NUMS[SI]  ; Load current number
    CMP AX, MIN
    JGE CHECK_MAX
    MOV MIN, AX  ; Update minimum
CHECK_MAX:
    CMP AX, MAX
    JLE SKIP_MAX
    MOV MAX, AX  ; Update maximum
SKIP_MAX:
    ADD SI, 2  ; Move to next element
    LOOP FIND_LOOP  ; Repeat for all elements

MOV AH, 4Ch  ; DOS interrupt to terminate program
INT 21h

END