#CSE-341 Project-1
#Roy Joo 50016076
#MIPS code

.globl main 
.globl cloop
.globl dsloop
.globl DisplayString
.globl Convert
.globl DisplayArray
.globl cadd
.globl Mean
.globl cdup
.globl meanloop
.globl meanend
.globl meanendloop 
.globl csort1
.globl cswitch
.globl meanend2
.globl debug
.data	# lets processor know I'm submitting data into program now

 
task_options: .asciiz " 1 - Enter a New String \n 2 - Convert \n 3 - Mean \n 4 - Median \n 5 - Display String \n 6 - Display Array \n" #0x10000000
ask_menuinput: .asciiz "Select task by inputting number. Input 7 to repeat task options. \n"#0x1000069
enter_string: .asciiz " Please enter a string of numbers seperated by commas.\n" #0x10000C4
empty_array: .asciiz "Empty Array.\n" # 0x10000E4
empty_string: .asciiz "Empty String.\n" #0x10000F2

.text

main: 

lui $a0, 0x1000 #loads address for task_options from memory and stores it into argument register 0(a0)
or $0, $0, $0 #NOPE
add $v0, $0, 4 #loads immediate 4 into register v0 which is the operation code for print string
syscall # print string "task_options"
lui $a0, 0x1000 #loads address for ask_menuinput from memory and stores it into argument register 0
or $0, $0, $0 #NOPE
add $a0, $a0, 0x069
syscall # prints string "ask_menuinput" no need to change register v0
add $v0,$0, 5 #loads immediate 5 into register v0 which is the operation code for read integer
syscall # reads 5 from register v0 and then asks user for an integer input and store the input into register v0
add $t0, $v0, $0
add $v0, $0, $0

beq $t0, 1, EnterString #if input is 1 then branch to Enter String
or $0, $0, $0 #NOPE
beq $t0, 2, Convert # if 2 then branch to Convert
or $0, $0, $0 #NOPE
beq $t0, 3, Mean # if 3 then branch to Mean
or $0, $0, $0 #NOPE
beq $t0, 4, Median # if 4 then branch to Median
or $0, $0, $0 #NOPE
beq $t0, 5, DisplayString #if 5 then branch to Display String
or $0, $0, $0 #NOPE
beq $t0, 6, DisplayArray #if 6 then branch to Display Array
or $0, $0, $0 #NOPE
beq $t0, 7, RepeatTaskoptions #if 7 then Branch to Repeat Taskoptions
or $0, $0, $0 #NOPE


EnterString:

lui $a0, 0x1000 #loads address for enter_string from memory and stores it into argument 0
or $0, $0, $0 #NOPE
add $a0,$a0, 0x0AC
add $v0, $0, 4 #loads immediate 4 into register v0 which is the operation code for print string
syscall # print string "enter_string"
add $v0, $0, 8 # loads immediate 8 into register v0 which is the operation code for read string.
lui $a0, 0x1000 #loads address 0x10000100 into register a0 which is where the user inputted string is stored
or $0, $0, $0 #NOPE
add $a0, $a0, 0x0100
add $a1, $0, 201 #sets register a1 to 200+1 which is the maximum characters the processor will read
syscall # processor asks for user input string up to 200 characters
j main # jump back to main 
or $0, $0, $0 #NOPE

Convert:

lui $t0, 0x1000 #loads address 0x10000100 into register t0
or $0, $0, $0 #NOPE
add $t0, $t0, 0x0100
lui $t2, 0x1000 #loads address 0x10000202 into register t2
or $0, $0, $0 #NOPE
add $t2,$t2, 0x0202 
add $t3, $0, $0 #grounds register t3
lui $t5, 0x1000 #load address for count into t5
or $0, $0, $0 #NOPE
add $t5, $t5, 0x0200 

cloop:

lb $t1, 0($t0) # loads byte t0 into t1
or $0, $0, $0 #NOPE
add $t0, $t0, 1 # increment by 1
beq $t1, 0x20 , cloop #check if t1 holds a space if so it branches back to cloop
or $0, $0, $0 # NOPE
beq $t1, 0x2c, cdup #checks if t1 holds a comma if so branches to cdup
or $0, $0, $0 #NOPE
beq $t1, 0x0A, cdup #checks if t1 holds a new line (\n) if so branches to cend
or $0, $0, $0 #NOPE
sub $t1, $t1, 48 # subtracts 48 from byte in t1 changing it from asciiz to decimal
sll $t4, $t3, 3 #multiplies t3 by sll 3 times and storing it in t4 and adding t3 to t4 twice
add $t4, $t4, $t3
add $t4, $t4, $t3
add $t3, $t4, $0
add $t4, $0, $0  
add $t3, $t3, $t1 #adds t1 to t3 then stores in t3
j cloop #jumps back to cloop to continue
or $0, $0, $0 #NOPE

cdup:

add $v0, $0, $t6 #count t6 = v0
lui $a0, 0x1000 # a0 set to starting point of array
or $0, $0, $0
add $a0, $a0, 0x0202

cduploop:

lh $t9 , 0($a0) #load halfword from array
or $0, $0, $0
beq $v0, 0 , cadd # if count is 0 go to cadd
or $0, $0, $0
sub $v0, $v0, 1 #decrement count
add $a0, $a0, 2 #increment address by 2
beq $t9, $t3, cdupend #branch if t9 = t3
or $0, $0, $0
j cduploop
or $0, $0, $0

cdupend:

add $t3, $0, $0 #get rid of duplicate
add $t8, $t8, 1 #increment duplicate count
beq $t1, 0x0A, cenddup # if t1 = new line then go to cenddup
or $0, $0, $0
j cloop 
or $0, $0, $0


cadd:

beq $t1, 0x0A , cend #if t1 is a new line go to cend
or $0, $0, $0
sh $t3, 0($t2) # store halfword in register t3 into address in register t2
add $t2, $t2, 2 #increment register t2 by 2
add $t3, $0, $0 #grounds register t3
add $t6, $t6, 1 #increment by 1 for count
j cloop #jumps back to cloop to continue
or $0, $0, $0 #NOPE

cend: 

sh $t3, 0($t2) #store halfworld in register t3 into address in register t2
or $0, $0, $0
add $t6, $t6, 1 #increment by 1 for count

cenddup:

sh $t6 , 0($t5) #finalize count into address 0x10000200
add $t0, $0, $0 #ground t0
add $t1, $0, $0 #ground t1
add $t2, $0, $0 #ground t2
add $t3, $0, $0 #ground t3
add $v0, $0, 1 # syscall for print integer
add $a0, $0, $t8 #load duplicatecount into a0
or $0, $0, $0 #NOPE
syscall #print count
add $t5, $0, $0
add $t6, $0, $0
add $v0, $0, $0
add $a0, $0, $0
j csort1 #jump csort1
or $0, $0, $0 	#NOPE

csort1:


lui $t0, 0x1000 #load address for count
or $0, $0, $0
add $t0, $t0, 0x0200
lh $t1, 0($t0) #store count into t1
or $0, $0, $0 
lui $t0, 0x1000 #t0 = starting point in array
or $0, $0, $0
add $t0, $t0, 0x0202
lui $t2, 0x1000 #t2 = starting point +2= 0x10000204
or $0, $0, $0
add $t2, $t2, 0x0204

csort2:

add $t3, $0, $t1 #move count from t1 to t3 
lh $t4, 0($t0) #load halfword from array
or $0, $0, $0

csortpartial:

beq $t1, 0 , csortend  #if count is 0 then array is empty go to csortend
or $0, $0, $0

csort3:

beq $t3, 0 , csort4 #if count is 0 then go to csort4
or $0, $0, $0
lh $t5, 0($t2) #load halfworld from t2
or $0, $0, $0
slt $t6, $t5, $t4 #if t5<t4 then 1 if t5>t4 then 0
bne $t6, 0 ,cswitch # if t4 is greater than t5 then switch
or $0, $0, $0
add $t2, $t2, 2 #increment sp array +2 by 2
sub $t3, $t3, 1 #decrement count t3
j csort3 #jump back
or $0, $0, $0

cswitch:

add $t7, $t5, $0 # store t5 into t7
add $t6, $t4, $0 # store t4 into t6
add $t4, $t7, $0 # load t7 into t4
add $t5, $t8, $0 # load t8 into t5
add $t2, $t2, 2 #increment sp array +2 by 2
sub $t3, $t3, 1 #decrement count by 1
j csort3
or $0, $0, $0



csort4:
 
add $t0, $t0, 2 #increment sp array by 2
add $t2, $t0, 2 #whater t0 is +2 
sub $t1, $t1, 1 #decrement real count by 1
j csortpartial # jump to csortpartial
or $0, $0, $0
 
csortend:

add $v0, $0, $0
add $t0, $0, $0
add $t1, $0, $0
add $t2, $0, $0
add $t3, $0, $0
add $t4, $0, $0
add $t5, $0, $0
add $t6, $0, $0
add $t7, $0, $0
add $t8, $0, $0
add $t9, $0, $0

j main 
or $0, $0, $0


Mean:

lui $t0, 0x1000 #load 0x10000202 into t0
or $0, $0, $0 #NOPE
add $t0, $t0, 0x0202
add $t3, $0, $0 #ground 
lui $t4, 0x1000 #load 0x10000200 into t4
or $0, $0, $0 #NOPE
add $t4, $t4, 0x0200 
lh $t5 , 0($t4) #load count as halfword

meanloop:

lh $t1, 0($t0) #load byte from t0 into t1
or $0, $0, $0 #NOPE
beq $t5, 0 , meanend # branch meanend if count = 0
sub $t5, $t5, 1 #decrement 1
or $0, $0, $0 # NOPE
add $t3, $t3, $t1 # add t1 to t3 for sum
add $t0, $t0, 2 #increment by 2
j meanloop # j back to meanloop
or $0, $0, $0 #NOPE


meanend:

lh $t5, 0($t4) #loads the halfword count that tells how many numbers in array
or $0, $0, $0 #NOPE
j meanendloop #jump to meanendloop
or $0, $0, $0 #NOPE

meanendloop:

slt $t6, $t3, $t5 # t6= 1 if t3<t5 if t3>t5 then 0
bne $t6, $0, meanend2 # if t6 not equal 0 then branch to meanend2
or $0, $0, $0 #Nope
sub $t3,$t3,$t5 # t3-t5 = t3
add $t7, $t7, 1 #increment subtractions done by 1
j meanendloop # loop
or $0, $0, $0 #NOPE

meanend2:

add $v0,$0, 1 #load vo with 1 for print integer
add $a0, $0, $t7 #load a0 with subtractions done t7
syscall # syscall printing t7
add $v0, $0, 11 #print character
add $a0, $0, 0x20 #print space
syscall 
add $v0, $0, 1 
add $a0, $0, $t3 # printing t3 
syscall 
add $v0, $0, 11 # print character operation
add $a0, $0, 0x2F #print a backslash to say "divided by"
syscall 
add $v0, $0, 1 #print t5
add $a0, $0, $t5 
syscall
add $a0, $0, $0
add $v0, $0, $0
add $t0, $0, $0
add $t1, $0, $0
add $t2, $0, $0
add $t3, $0, $0
add $t4, $0, $0
add $t5, $0, $0
add $t6 $0, $0
add $t7, $0, $0 
j main #j main
or $0, $0, $0 #NOPE

Median:

lui $t1, 0x1000 #load address count into t1
or $0, $0, $0
add $t1, $t1, 0x0200
lh $t0, 0($t1) #load count into t0
or $0, $0, $0
add $t0, $t0, 1 #add 1 to count
srl $t0,$t0, 1 #shift right on count dividing it by two

medloop:

beq $t0, 0 , medend #if count t0 is go to medend
or $0, $0, $0
add $t1, $t1, 2 #add 2 to address 
sub $t0, $t0, 1 #subtract 1 from count
j medloop
or $0, $0, $0

medend:

lh $a0, 0($t1) 
or $0, $0, $0
add $v0, $0, 1
syscall #print integer where a0 is t1
j main
or $0, $0, $0

DisplayString:

lui $t1, 0x1000 #load address 0x10000100 into t1
or $0, $0, $0 #NOPE
add $t1,$t1, 0x0100
add $v0,$0, 11 #loads 11 into register v0 which is the operation for print character
or $0, $0, $0 #NOPE
lb $t2, 0($t1)
or $0, $0, $0
beq $t2, 0, emptystring #branch if zero
or $0, $0, $0 #NOPE
j dsloop #jump to dsloop
or $0, $0, $0 #NOPE

emptystring:

add $v0, $0, 4 #print string
lui $a0, 0x1000 #load 0x100000F2
or $0, $0, $0 #NOPE
add $a0, $a0, 0x0F2
syscall # empty_string
j main 
or $0, $0, $0 



dsloop:

lb $t2, 0($t1) # loads byte stored in t1 into t2
or $0, $0, $0
beq $t2, 0x0A, dsend #if t2 is a new line then branch to dsend
or $0, $0, $0 # NOPE
add $a0, $t2, $0  #loads t2 into a0
syscall #system call for operation read character and reads a0
add $t1, $t1, 1 # increments t1 by 1
j dsloop #back to beginning

dsend: 

add $a0, $0, $0 #ground a0
add $v0, $0, $0 # ground v0
add $t1, $0, $0	# grounds t1
add $t2, $0, $0 #grounds t2
j main #jump to main
or $0, $0, $0 # NOPE

DisplayArray:

lui $t1, 0x1000 #load address 0x10000202 int0 t1
or $0, $0, $0 #NOPE
add $t1, $t1, 0x0202 
add $v0,$0, 1 #loads  1 into register v0 which is the operation for print integer
or $0, $0, $0 #NOPE
lui $t8, 0x1000 #check if array is empty
or $0, $0, $0 #NOPE
add $t8, $t8, 0x0200 
lh $t9, 0($t8) #load halfword into t9 to check for count
or $0, $0, $0 #NOPE
beq $t9, 0 , emptyarray #branch to emptyarray if 0x10000200 is 0
j daloop #jump to daloop
or $0, $0 ,$0 #NOPE

emptyarray:

add $v0, $0, 4 #syscall for print string
lui $a0, 0x1000 # load address for "empty_array"
or $0, $0, $0 #NOPE
add $a0, 0x0E4
syscall # print string
add $a0, $0 , $0
add $t9 , $0, $0
add $t8, $0, $0
add $t1, $0, $0
add $v0, $0, $0
j main #jump main
or $0, $0, $0 #NOPE

daloop:

beq $t9, 0, daend #if count is 0 branch daend
lh $t2, 0($t1) #loads halfword from t1 into t2
or $0, $0, $0 #NOPE
add $a0, $t2, $0 #loads t2 into a0
syscall #system call for print integer printing t2
add $a0,$0, 0x20 #loads asciiz for space into a0 
add $v0, $0, 11 #syscall for print character
syscall #syscall for print character  which is a space
add $v0, $0, 1 #back to print integer
add $t1, $t1, 2 #increment t1 by 2
sub $t9,$t9,1 #decrement t9 which is count by 1
j daloop #jump to daloop
or $0, $0, $0 #NOPE


daend:

add $t1, $0, $0 #ground t1
add $t2, $0, $0 #ground t2
add $a0, $0, $0 #ground a0
add $v0, $0, $0 #ground v0
j main #jump back to main
or $0, $0, $0 #NOPE

RepeatTaskoptions:

j main # jumps to main 
or $0, $0, $0 # NOPE 
