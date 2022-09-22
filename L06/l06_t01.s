/*
-------------------------------------------------------
l06.s
Task 1
Demonstrates the use of a subroutine to print to the UART.
-------------------------------------------------------
Author:  Aidan Traboulay
ID:      200115590
Email:   trab5590@wlu.ca
-------------------------------------------------------
*/

.org    0x1000    
.text             
.global _start
_start:

	LDR 	R4, =First
	BL  	PrintString
	LDR 	R4, =Second
	BL  	PrintString	
	LDR 	R4, =Third
	BL  	PrintString
	LDR 	R4, =Last
	BL  	PrintString

_stop:
B    _stop

// Subroutine constants
.equ UART_BASE, 0xff201000     

PrintString:
/*
-------------------------------------------------------
Prints a null terminated string.
-------------------------------------------------------
Parameters:
  R4 - address of string
Uses:
  R0 - holds character to print
  R1 - address of UART
-------------------------------------------------------
*/
STMFD  	     SP!, {R0-R1, R4, LR}
LDR 	          R1, =UART_BASE

psLOOP:
	LDRB 	R0, [R4], #1   // Byte load
	CMP  	R0, #0
	BEQ  	_PrintString   // Exit if null
	STR  	R0, [R1]       // Copy char to the UART DATA field
	B    	psLOOP

_PrintString:
	mov 	r0, #0x0A    
	str 	r0, [r1]
	LDMFD   SP!, {R0-R1, R4, PC}

.data
.align

First:	.asciz  "First string"
Second:	.asciz  "Second string"
Third:	.asciz  "Third string"
Last:	.asciz  "Last string"
_Last:   

.end