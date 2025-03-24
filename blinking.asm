; File: piscaled.asm
; Author: DEVitor0 (https://github.com/DEVitor0)
; Date: 03/24/25
; Description: Simple virtual LED blink program for Linux x86_64
; Build: nasm -f elf64 piscaled.asm && ld piscaled.o -o piscaled
; Usage: ./piscaled (Ctrl+C to exit)

section .data
    led_on    db  '[X]', 0xA
    led_off   db  '[ ]', 0xA
    clear     db  0x1B, '[2J', 0x1B, '[H', 0
