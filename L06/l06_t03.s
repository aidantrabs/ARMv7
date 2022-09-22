/*
-------------------------------------------------------
l06.s
Task 3
Uses a subroutine to read strings from the UART into memory.
-------------------------------------------------------
Author:  Aidan Traboulay
ID:      200115590
Email:   trab5590@wlu.ca
-------------------------------------------------------
*/

.equ SIZE, 20    	            // Size of string buffer
.text  				       // Code section
.org	0x1000		            // Start at memory location 1000
.global _start

_start:
	MOV    R5, #SIZE
	LDR    R4, =First
	BL	   ReadString
	BL     PrintString
	LDR    R4, =Second
	BL	   ReadString	
	BL     PrintString
	LDR    R4, =Third
	BL     ReadString
	BL     PrintString
	LDR    R4, =Last
	BL     ReadString
	BL     PrintString
    
_stop:
B	_stop

// Subroutine constants
.equ UART_BASE, 0xff201000         // UART base address
.equ VALID, 0x8000			     // Valid data in UART mask
.equ DATA, 0x00FF			     // Actual data in UART mask
.equ ENTER, 0x0A			     // End of line character

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

STMFD 	     SP!, {R0 - R1, R4 - R5, LR}
LDR 	          R1, =UART_BASE
ADD 	          R5, R4, R5 

rsLOOP:	
	LDR		R0, [R1] 			  
	TST 	     R0, #VALID	 		
	BEQ 	     _ReadString   	
	AND 	     R0, R0, #DATA	 	
	CMP 	     R0, #ENTER			
	BEQ 	     _ReadString 		
	STRB	     R0, [R4]		
	ADD		R4, R4, #1	
	CMP		R4, R5	
	BNE 	     rsLOOP

_ReadString:
	LDMFD 	SP!, {R0-R1, R4-R5, PC}
		
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
	LDRB 	R0, [R4], #1   
	CMP  	R0, #0
	BEQ  	_PrintString   
	STR  	R0, [R1]       
	B    	psLOOP

_PrintString:
	mov 	     r0, #0x0A    	
	str 	     r0, [r1]		  
	LDMFD     SP!, {R0-R1, R4, PC}

.data
.align

First:	.space  SIZE
Second:	.space	SIZE
Third:	.space	SIZE
Last:	.space	SIZE
_Last:    

.end