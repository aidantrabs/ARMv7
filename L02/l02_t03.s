/*
-------------------------------------------------------
l02.s
Task 3
Copies contents of one vector to another.
-------------------------------------------------------
Author:  Aidan Traboulay
ID:      200115590
Email:   trab5590@wlu.ca
Date:    22-01-2022
-------------------------------------------------------
*/

.org	0x1000	// Start at memory location 1000
.text  // Code section
.global _start
_start:

.text	// code section
// Copy contents of first element of Vec1 to Vec2
LDR	R0, =Vec1
LDR	R1, =Vec2
LDR	R2, [R0]
STR	R2, [R0]
// Copy contents of second element of Vec1 to Vec2
ADD	R0, R0, #4 // changed to 4 bytes
ADD	R1, R1, #4 // changed to 4 bytes
LDR	R2, [R0]
STR	R2, [R1]
// Copy contents of second element of Vec1 to Vec2
ADD	R0, R0, #4 // changed register to R0
ADD	R1, R1, #4
LDR	R2, [R0]
STR	R2, [R1] // changed register to R1
// End program
_stop:
B _stop

.data	// Initialized data section
Vec1:
.word	1, 2, 3
.bss	// Uninitialized data section
Vec2:
.space	9 // 9 bytes of space - changed word to space 

.end