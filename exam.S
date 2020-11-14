@ 
@ Exam problem solution file
@
 
.data

 
.text
.global problem1
.global problem2
.global problem3

    
@
@ int problem1(int a, int b, int c)
@ Compute the indicated function
@ \param a First parameter
@ \param b Second parameter
@ \param c Third parameter
@
problem1: 
sub r0, r0, r1   @a-b
mov r1, #0       @ counter
mov r3, #0       @ product
cmp r2, r1       @ check c sign
bpl prob1pos
b prob1min

prob1pos:
cmp r2, r1
beq return1
sub r0, r0, r2
add r1, r1, #1
b prob1pos

prob1min:
cmp r2, r1
beq return1
add r0, r0, r2
add r1, r1, #-1
b prob1min

return1:
bx lr


	
	
@
@ int problem2(int *data, int size)
@ Compute the indicated function
@ \param data Array of integers
@ \param size Size of the array
@
problem2:
stmfd sp!,{r4-r8,lr}
mov r2, #2   
cmp r2, r1
bgt return2a
mov r2, #0       @ counter
mov r3, r0       @current address
ldr r4, [r3]    @ r4 is the current max
add r1, r1,#-1
b max


max:
cmp r1, r2
beq max2
add r3, r3, #4
ldr r5, [r3]
cmp r4, r5
bmi newmax
add r2, r2, #1
b max

newmax:        @ replacing max
mov r4, r5
add r2, r2, #1
b max

max2:
mov r3, r0
mov r2, #0
ldr r5, [r3]
cmp r5, r4       @ testing for if first is largest
beq maxfirst
mov r8, r5       @ max 2 location
b max2loop

maxfirst:        @ establishing the second largest number
add r3, r3, #4
ldr r8, [r3]
add r2, r2, #2
b max2loop

max2loop:          @ looping to find second largest
cmp r2, r1
bpl return2b
add r3, r3, #4
ldr r5, [r3]
cmp r5, r8
bpl newmax2
add r2, r2, #1
b max2loop

newmax2:
cmp r5, r4        @ dont accidently put in max
beq skip
mov r8, r5
b skip
skip:
add r2, r2, #1
b max2loop

return2a:
ldmfd sp!,{r4-r8,lr}
mov r0, #0
bx lr

return2b:
mov r0, r8
ldmfd sp!,{r4-r8,lr} 
bx lr





@
@ int problem3(char *str)
@ Determine if str has my user ID in it
@
problem3:
start:
ldrb r1, [r0]
cmp r1, #0     @ test for end
beq return30
cmp r1, #122    @ascii for z
beq Z
add r0, r0, #1 
b start
Z:
add r0, r0, #1
ldrb r1, [r0]
cmp r1, #117      @ascii for u
beq U117
cmp r1, #0      
beq return30    @ test for end
b start

U117:
add r0, r0, #1
ldrb r1, [r0]
cmp r1, #111      @ascii for o
beq O111
cmp r1, #0      
beq return30    @ test for end
b start

O111:
add r0, r0, #1
ldrb r1, [r0]
cmp r1, #104      @ascii for h
beq H104
cmp r1, #0      
beq return30    @ test for end
b start

H104:
add r0, r0, #1
ldrb r1, [r0]
cmp r1, #97      @ascii for a
beq A97
cmp r1, #0      
beq return30    @ test for end
b start

A97:
add r0, r0, #1
ldrb r1, [r0]
cmp r1, #110      @ascii for n
beq N110
cmp r1, #0      
beq return30    @ test for end
b start


N110:
add r0, r0, #1
ldrb r1, [r0]
cmp r1, #115      @ascii for s
beq S115
cmp r1, #0      
beq return30    @ test for end
b start


S115:
add r0, r0, #1
ldrb r1, [r0]
cmp r1, #104      @ascii for h
beq return31
cmp r1, #0      
beq return30    @ test for end
b start

return30:
mov r0, #0
bx lr

return31:
mov r0, #1
bx lr
