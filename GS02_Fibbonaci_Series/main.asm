extern GetStdHandle: proc
extern WriteFile: proc

.data?
    written dq ?

.data

	OuterIterator db 6

	InnerIterator db ?

	NewValue db 1

	PreviousValue db 1

	WriteOut db "The Fibbonnaci Sequence: ",13,10
	lenOne equ $-WriteOut

.code
main PROC
	
	;OuterLoop:
	;dec OuterIterator

	InnerIterator = 6
	InnerLoop:
    dec InnerIterator
	
	WriteOut = WriteOut + NewValue 

	NewValue = NewValue + PreviousValue
	PreviousValue = NewValue + PreviousValue

	cmp InnerIterator, 0
	je InnerLoop
    
	mov rcx, -11
    call    GetStdHandle    ; get stdout file handle
    mov rcx, rax            ; set as first parameter
    mov rdx, offset WriteOut  ; set message address as second argument
    mov r8, lenOne             ; length as third
    mov r9, written         ; variable to write # bytes written
    call    WriteFile       ; prints message to console

	;cmp OuterIterator, 0
	;je OuterLoop

	ret

	main ENDP
	END