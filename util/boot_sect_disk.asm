%ifndef BOOT_SECT_DISK_ASM
%define BOOT_SECT_DISK_ASM
%include "../util/defConst.asm"
; A function to load data from the disk into ES:BX
;
; \param[in] dh - number of sectors to load
; \param[in] dl - drive to load from
; (0 = floppy, 1 = floppy2, 0x80 = hdd, 0x81 = hdd2)
disk_load:
    pusha
    push dx
    ; disk_read
    ; ah - function
    ; al - number of sectors to read
    ; cl - sector
    ; ch - cylinder
    ; dh - head number
    mov ah, disk_read
    mov al, dh
    mov cl, 0x2 ; 0x1 is boot, 0x2 is first available
    mov ch, 0x00
    mov dh, 0x00
    int BIOSDisk
    jc disk_error
    pop dx
    cmp al, dh ; al is the number of sectors read.
    jne sectors_error
    popa
    ret

disk_error:
    mov bx, DISK_ERROR
    call print
    call print_nl
    mov dh, ah ; ah = error code, dl = disk drive that dropped the error
    call print_hex
    jmp disk_loop

sectors_error:
    mov bx, SECTOR_ERROR
    call print

disk_loop:
    jmp $

DISK_ERROR: db "Disk read error", 0
SECTOR_ERROR: db "Incorrect number of sectors read", 0
%endif ; BOOT_SECT_DISK_ASM
