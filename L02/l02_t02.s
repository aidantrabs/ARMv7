/*
-------------------------------------------------------
l02.s
Task 2
Assign to and add contents of registers.
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

// Copy data from memory to registers
LDR	R3, =First
LDR	R0, [R3]
LDR	R3, =Second
LDR	R1, [R3]
// Perform arithmetic and store results in memory
ADD	R2, R0, R1
LDR	R3, =Total
STR	R2, [R3] // Store R3 in R2 - added square brackets
SUB	R2, R0, R1	// Subtract Second from First
LDR	R3, =Diff // Store difference in R3 - changed spelling
STR	R2, [R3] // Store R3 in R2 - added square brackets
// End program
_stop:
B _stop

.data	// Initialized data section
First:
.word	4
Second:
.word	8
.bss	// Uninitialized data section
Total:
.space 4	// Set aside 4 bytes for total
Diff:
.space 2	// Set aside 4 bytes for difference

.end