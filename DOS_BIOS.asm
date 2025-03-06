  ORG 100h   ; Origin for .COM programs

MOV DX, OFFSET MSG       ; Load message address
MOV AH, 09h              ; DOS interrupt to display message
INT 21h                  ; Call DOS interrupt

MOV DX, OFFSET INPUT     ; Load input buffer address
MOV AH, 0Ah              ; DOS interrupt to take string input
INT 21h                  ; Call DOS interrupt

MOV SI, OFFSET BUFFER    ; Load string address into SI
CALL STRING_LENGTH       ; Call procedure to find length

ADD AL, 30h              ; Convert length to ASCII
MOV DL, AL               ; Store result in DL for printing
MOV AH, 02h              ; DOS interrupt for single character output
INT 21h                  ; Print length

MOV AH, 4Ch              ; DOS terminate program
INT 21h                  ; Call DOS

; Procedure to Find String Length
STRING_LENGTH PROC
    XOR CX, CX           ; Clear CX (counter)
    MOV AL, '$'          ; Null terminator for string
FIND_LENGTH:
    LODSB                ; Load next byte from SI into AL
    CMP AL, '$'          ; Check for string terminator
    JE DONE              ; If found, exit loop
    INC CX               ; Increment length counter
    JMP FIND_LENGTH      ; Repeat
DONE:
    MOV AL, CL           ; Store length in AL
    RET
STRING_LENGTH ENDP

; Data Section
MSG DB 'Enter a string: $'
INPUT DB 0Ah, 0         ; Max length = 10, actual length = 0
BUFFER DB 10 DUP('$')   ; Buffer for input string
