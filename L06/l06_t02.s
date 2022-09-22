/*
-------------------------------------------------------
l06.s
Task 2
Uses a subroutine to read strings from the UART into memory.
-------------------------------------------------------
Author:  Aidan Traboulay
ID:      200115590
Email:   trab5590@wlu.ca
-------------------------------------------------------
*/

.equ SIZE, 20    	
.text  				
.org	0x1000		
.global _start
_start:

	MOV    R5, #SIZE
	LDR    R4, =First
	BL	   ReadString
	LDR    R4, =Second
	BL	   ReadString	
	LDR    R4, =Third
	BL     ReadString
	LDR    R4, =Last
	BL     ReadString
    
_stop:
B	_stop

// Subroutine constants
.equ UART_BASE, 0xff201000     // UART base address
.equ VALID, 0x8000			   // Valid data in UART mask
.equ DATA, 0x00FF			   // Actual data in UART mask
.equ ENTER, 0x0A			   // End of line character

ReadString:
/*
-------------------------------------------------------
Reads an ENTER terminated string from the UART.
-------------------------------------------------------
Parameters:
  R4 - address of string buffer
  R5 - size of string buffer
Uses:
  R0 - holds character to print
  R1 - address of UART
-------------------------------------------------------
*/

STMFD 	SP!, {R0 - R1, R4 - R5, LR}
LDR 	     R1, =UART_BASE
ADD 	     R5, R4, R5 

rsLOOP:	
          LDR   R0, [R1] 			// Read UART
          TST 	 R0, #VALID	 		// Check for valid data
          BEQ 	_ReadString   		     // If no data, wait
          AND 	R0, R0, #DATA	 	     // Mask off valid data
          CMP 	R0, #ENTER			// Check for end of line
          BEQ 	_ReadString 		     // If end of line, exit
          STRB	R0, [R4]		
          ADD  R4, R4, #1	
          CMP	R4, R5	
          BNE 	rsLOOP

_ReadString:
	LDMFD 	SP!, {R0-R1, R4-R5, PC}
	
.data
.align

First:	.space  SIZE
Second:	.space	SIZE
Third:	.space	SIZE
Last:	.space	SIZE
_Last:    

.end