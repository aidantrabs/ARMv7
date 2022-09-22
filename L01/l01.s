/*
-------------------------------------------------------
l01.s
Task 1
Assign to and add contents of registers.
-------------------------------------------------------
Author:  Aidan Traboulay
ID:      200115590
Email:   trab5590@wlu.ca
Date:    2021-01-06
-------------------------------------------------------
*/

.org 0x1000 // set origin to 0x1000
.text // declare text segment
.global _start // declare entry point
_start:

MOV r0, #9 // Store decimal 9 in register r0
MOV r1, #0xE // Store hexadecimal 0xE (decimal 14) in register r1
ADD r2, r1, r0 // Add contents of r1 and r0 and store result in r2

// End program
_stop:
B _stop // Branch to stop

.end // end program
