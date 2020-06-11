.globl main 
.data
.text
main:
addi t1,t0,1 #t1_should_contain_1
add t1, t1, t1 #t1_should_contain_2
addi t1,t1, 1022 #t1_should_contain_1024
addi t2, t1, -512 #t2_should_contain_512
sub t3, t1,t2 #t3_should_contain_512
and t3,t3,t0 #t3_should_contain_0
or t3, t1, t2 #t3_should_contain_1536


