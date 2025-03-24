; File: piscaled.asm
; Author: DEVitor0 (https://github.com/DEVitor0)
; Date: 03/24/25
; Description: Virtual LED blinker with proper bracket formatting
; Build: nasm -f elf64 piscaled.asm && ld piscaled.o -o piscaled
; Usage: ./blinking (Ctrl+C to exit)

section .data
    led_on    db  '[🔴]', 0xA      ; ON state (red circle)
    led_on_len equ $ - led_on    
    led_off   db  '[⚪]', 0xA       ; OFF state (white circle)
    led_off_len equ $ - led_off  
    clear     db  0x1B, '[2J', 0x1B, '[H', 0  

section .text
    global _start

_start:
    mov rbp, rsp        ; Set up stack frame

main_loop:
    ; Clear screen
    mov rax, 1          ; sys_write
    mov rdi, 1          ; stdout
    mov rsi, clear
    mov rdx, 7          ; clear sequence length
    syscall

    ; Display ON state
    mov rax, 1
    mov rdi, 1
    mov rsi, led_on
    mov rdx, led_on_len ; Use calculated length
    syscall

    call sleep

    ; Clear screen
    mov rax, 1
    mov rdi, 1
    mov rsi, clear
    mov rdx, 7
    syscall

    ; Display OFF state
    mov rax, 1
    mov rdi, 1
    mov rsi, led_off
    mov rdx, led_off_len ; Use calculated length
    syscall

    call sleep

    jmp main_loop

sleep:
    ; Sleep for 1 second
    mov rax, 35         ; sys_nanosleep
    mov rdi, timespec
    xor rsi, rsi        ; No remaining time
    syscall
    ret

section .data
    timespec:
        tv_sec  dq 1    ; 1 second
        tv_nsec dq 0    ; 0 nanoseconds