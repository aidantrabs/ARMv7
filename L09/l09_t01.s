/*
-------------------------------------------------------
l09.s
Task 1
-------------------------------------------------------
Author:  Aidan Traboulay
ID:      200115590
Email:   trab5590@wlu.ca
-------------------------------------------------------
*/

.org    0x1000    	// Start at memory location 1000
.text  			// Code section
.global _start
_start:
    MOV    R3, #4
    STMFD  SP!, {R3}     
    MOV    R3, #5
    STMFD  SP!, {R3}     
    LDR    R3, =Data
    STMFD  SP!, {R3}     
    BL     swap_array
    ADD    SP, SP, #12

_stop:
B      _stop

//-------------------------------------------------------
swap_array:
/*
-------------------------------------------------------
Swaps location of two values in list.
Equivalent of: swap(*a, i, j)
-------------------------------------------------------
Parameters:
  a - address of list
  i - index of first value
  j - index of second value
Local variable
  temp (4 bytes)
Uses:
  R0 - address of list
  R1 - i
  R2 - j
  R3 - value to swap
-------------------------------------------------------
*/
    STMFD     SP!, {FP, LR}  
    MOV       FP, SP         
    SUB       SP, SP, #4     
    STMFD     SP!, {R0-R3}   

    LDR       R0, [FP, #8]
    LDR 	     R1, [FP, #12]
    LDR 	     R2, [FP, #16]

    LSL       R1, R1, #2    
    LSL       R2, R2, #2     

    LDR       R3, [R0, R1]  
    STR       R3, [FP, #-4]  

    LDR       R3, [R0, R2]    
    STR       R3, [R0, R1]   

    LDR       R3, [FP, #-4]   
    STR       R3, [R0, R2]   

    LDMFD     SP!, {R0-R3}   
    ADD       SP, SP, #4     
    LDMFD     SP!, {FP, PC} 

.data

Data:
  .word  4,5,-9,0,3,0,8,-7,12     
_Data:    						

.end