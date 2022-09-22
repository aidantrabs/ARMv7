/*
-------------------------------------------------------
l04.s
Task 1
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
     LDR            R1, =UART_BASE
          
     LOOP:
          LDRB      R0, [R1]    
          CMP       R0, #0x0a   
          BEQ       _stop       
          STRB      R0, [R1]    
          B         LOOP

_stop:
     B    _stop

.data  

READ_STRING:  .space   SIZE

.end