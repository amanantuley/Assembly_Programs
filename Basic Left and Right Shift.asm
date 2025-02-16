                                                                                    .MODEL SMALL
.STACK 100H
.DATA
    num DB 5  ; Predefined number to be shifted
    shift_count DB ?  ; Variable to store shift count
    prompt1 DB "Enter 'L' for left shift or 'R' for right shift: $"
    prompt2 DB 0DH,0AH, "Enter the number of shifts (0-7): $"
    result_msg DB 0DH,0AH, "Shifted Result: $"
    newline DB 0DH,0AH, "$"

.CODE
MAIN PROC
    ; Initialize Data Segment
    MOV AX, @DATA
    MOV DS, AX

    ; Display prompt for shift direction
    MOV DX, OFFSET prompt1
    MOV AH, 09H
    INT 21H

    ; Read user input (L/R)
    MOV AH, 01H
    INT 21H
    MOV BL, AL  ; Store input in BL

    ; Display prompt for shift count
    MOV DX, OFFSET prompt2
    MOV AH, 09H
    INT 21H

    ; Read shift count (0-7)
    MOV AH, 01H
    INT 21H
    SUB AL, '0'  ; Convert ASCII to integer
    MOV shift_count, AL  ; Store shift count

    ; Load the number into AL
    MOV AL, num

    ; Check if Left Shift ('L' or 'l')
    CMP BL, 'L'
    JE LEFT_SHIFT
    CMP BL, 'l'
    JE LEFT_SHIFT

    ; Check if Right Shift ('R' or 'r')
    CMP BL, 'R'
    JE RIGHT_SHIFT
    CMP BL, 'r'
    JE RIGHT_SHIFT

    ; Invalid input, exit program
    JMP EXIT

LEFT_SHIFT:
    MOV CL, shift_count  ; Load shift count into CL
    SHL AL, CL  ; Perform left shift
    JMP DISPLAY_RESULT

RIGHT_SHIFT:
    MOV CL, shift_count  ; Load shift count into CL
    SHR AL, CL  ; Perform right shift

DISPLAY_RESULT:
    ; Print newline
    MOV DX, OFFSET newline
    MOV AH, 09H
    INT 21H

    ; Display result message
    MOV DX, OFFSET result_msg
    MOV AH, 09H
    INT 21H

    ; Convert AL to ASCII and display result
    MOV AH, 0
    AAM  ; Convert AL to two ASCII digits
    ADD AH, '0'
    ADD AL, '0'
    MOV DL, AH
    MOV AH, 02H
    INT 21H
    MOV DL, AL
    MOV AH, 02H
    INT 21H

EXIT:
    MOV AH, 4CH  ; Exit program
    INT 21H

MAIN ENDP
END MAIN
