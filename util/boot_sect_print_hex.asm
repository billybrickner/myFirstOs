%ifndef BOOT_SECT_PRINT_HEX_ASM
%define BOOT_SECT_PRINT_HEX_ASM
; print hex
; print a number in hex
;
; \param[in] dx : hex number to print
print_hex:
    pusha
    mov cx, 0 ; i=0

hex_loop:
    cmp cx, 4; i<4
    je end

    ; Get character
    mov ax, dx
    and ax, 0xf
    add ax, 0x30 ; ASCII '0'
    cmp ax, 0x39 ; > 9
    je write_char
    add ax, 7 ; 'A' - '0' + 0xa

write_char:
    ; HEX_OUT[5-i] = char
    mov bx, HEX_OUT + 5
    sub bx, cx
    mov [bx], al

    ; get next char
    ror dx, 4
    add cx, 1 ; i++
    jmp hex_loop

end:
    mov bx, HEX_OUT
    call print
    popa
    ret

HEX_OUT:
    db '0x0000', 0
%endif ; BOOT_SECT_PRINT_HEX_ASM
