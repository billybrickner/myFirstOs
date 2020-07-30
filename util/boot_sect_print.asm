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

    mov ah, putc
    int BIOSVid

    add bx, 1
    jmp start

; newline print
; print with carriage return
done:
    popa
    ret

print_nl:
    pusha
    mov ah, putc
    mov al, 0x0a ; newline char
    int BIOSVid
    mov al, 0x0d ; carriage return
    int BIOSVid
    popa
    ret
