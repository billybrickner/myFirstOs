; Infinite loop
loop:
	jmp loop

;Fill with 510 zeros, the size of the previous code
times 510-($-$$) db 0

; Magic Number
dw 0xaa55
