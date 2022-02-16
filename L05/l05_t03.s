/*
-------------------------------------------------------
l05.s
Task 3
list_demo.s
A simple list demo program. Traverses all elements of an integer list.
R0: temp storage of value in list
R2: address of start of list
R3: address of end of list
-------------------------------------------------------
Author:  Aidan Traboulay
ID:      200115590
Email:   trab5590@wlu.ca
Date:    12-02-2022
-------------------------------------------------------
*/

.org	0x1000	// Start at memory location 1000
.text  // Code section
.global _start
_start:

LDR R2, =Data // Store address of start of list
LDR R3, =_Data // Store address of end of list
LDR R6, [R2] // Store first element of list (minimum)
LDR R7, [R2] // Store second element of list (maximum)

Loop:
LDR R0, [R2], #4 // Read address with post-increment (R0 = *R2, R2 += 4)
CMP R0, R6 // Compare R0 to minimum
MOVLT R6, R0 // If R0 < R6, set R6 = R0
CMP R0, R7 // Compare R0 to maximum
MOVGT R7, R0 // If R0 > R7, set R7 = R0
CMP R3, R2 // Compare current address with end of list
BNE Loop // If not at end, continue

_stop:
B	_stop

.data
.align
Data:
.word   4,5,-9,0,3,0,8,-7,12 // The list of data
_Data:	// End of list address

.end