%include "../util/defConst.asm"

print:
    pusha

; print
; print null terminated string
;
; \param[in] bx - pointer to string to print
start:
    mov al, [bx]
    cmp al, 0
    je done

    mov ah, tty_mode
    int tty_print

    add bx, 1
    jmp start

; newline print
; print with carriage return
done:
    popa
    ret

print_nl:
    pusha
    mov ah, tty_mode
    mov al, 0x0a ; newline char
    int tty_print
    mov al, 0x0d ; carriage return
    int tty_print
    popa
    ret
