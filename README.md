# piscaled

A simple virtual LED blink program for Linux x86_64 written in Assembly (NASM).

## Description
`piscaled` simulates an LED blinking effect in the terminal by alternating between an "ON" and "OFF" state. It utilizes system calls to print to the terminal and clear the screen, creating a blinking effect. This project is for educational purposes only, designed to help understand how system calls work and how function return values are stored.

## Features
- Simulates an LED blinking effect.
- Uses system calls for output handling.
- Runs in an infinite loop until manually stopped.

## Requirements
- Linux x86_64
- NASM (Netwide Assembler)
- GNU linker (ld)

## Build
To assemble and link the program, run the following commands:

```sh
nasm -f elf64 piscaled.asm && ld piscaled.o -o piscaled
```

## Usage
Execute the program with:

```sh
./piscaled
```

To stop execution, press `Ctrl+C`.

## How It Works
1. Prints `[X]` (LED ON state) to the terminal.
2. Waits for 1 second.
3. Clears the screen.
4. Prints `[ ]` (LED OFF state) to the terminal.
5. Waits for 1 second.
6. Clears the screen.
7. Repeats the cycle indefinitely.

## Author
**DEVitor0** - [GitHub Profile](https://github.com/DEVitor0)

## License
This project is licensed under the MIT License.