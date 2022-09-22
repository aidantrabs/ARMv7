/*
-------------------------------------------------------
l04.s
Task 2
Reads a string from the UART
-------------------------------------------------------
Author:  Aidan Traboulay
ID:      200115590
Email:   trab5590@wlu.ca
Date:    
-------------------------------------------------------
*/

.equ UART_BASE, 0xff201000     
.equ SIZE, 80                  
.equ VALID, 0x8000             
.equ ENTER, 0x0a
.org    0x1000                 
.text  
.global _start

// Constants
_start:

     LDR     R1, =UART_BASE
     LDR     R4, =READ_STRING
     LDR     R7, =ENTER
     ADD     R5, R4, #SIZE         
          
     LOOP:
     LDRB    R0, [R1] 		           
     CMP     R0, R7			           
     BEQ     _stop			             
     STRB    R0, [R4]               
     ADD     R4, R4, #1             
     CMP     R4, R5                 
     BEQ     _stop
     B       LOOP

// Read string from UART
_stop:
     B    _stop 

.data // Data section

// Global variables
READ_STRING:  .space    SIZE

.end