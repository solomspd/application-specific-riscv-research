.globl main 
.data
.text
main:
addi t1,zero,1 #t1_should_contain_1
add t1, t1, t1 #t1_should_contain_2
addi t1,t1, 1022 #t1_should_contain_1024
addi t2, t1, -512 #t2_should_contain_512
sub t3, t1,t2 #t3_should_contain_512
and t3,t3,zero #t3_should_contain_0
or t3, t1, t2 #t3_should_contain_1536
andi t3,t3,1 #t3_should_contain_1
ori t3,t3,0 #t3_should_still_contain_1
xori t3,t3,2 #t3_should_contain_0
slti t3,t3,-1266  #t3_should_contain_0
slt t3,t3,t2 #t3_should_contain_1
sw t3,4(zero)
addi t3,t3, 2047 #t3_should_contain_2048
sh t3,8(zero)  #should_store_half_0000000000000000_0000100000000000
sb t3,10(zero) 
lw t3, 0(zero)
lh t3, 0(zero)
lb t3, 0(zero)
lhu t3, 0(zero)
lbu t3, 0(zero)
addi t3,zero,2   #t3_contains_2
addi t4,zero,1   #t4_contains_1
srl t3,t3,t4     #t3_contains_1
addi t4,zero,2    #t4_contains_2
sll t3,t3,t4    #t3_contains_4
sra t3,t4,t4     #sra 2 by 2
addi t3, zero,1024
addi t4,zero,512
xor t3, t3, t4    #should yield 0
slt t3, t3,t4      #is 0 < 512? yes (1)
slt t3, t4,t3      #is 512<1?  no (0)
srli t3, t4,1    #256
slli t3,t3,2      #1024
srai t3,t3,15     #shift 1024 arithmetic to the right


