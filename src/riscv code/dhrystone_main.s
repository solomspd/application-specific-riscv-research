	.file	"dhrystone_main.c"
	.option nopic
	.text
	.align	1
	.type	verify, @function
verify:
	addi	sp,sp,-80
	sd	s0,72(sp)
	addi	s0,sp,80
	mv	a5,a0
	sd	a1,-64(s0)
	sd	a2,-72(s0)
	sw	a5,-52(s0)
	sw	zero,-20(s0)
	j	.L2
.L6:
	lw	a5,-20(s0)
	slli	a5,a5,2
	ld	a4,-64(s0)
	add	a5,a4,a5
	lw	a5,0(a5)
	sw	a5,-24(s0)
	lw	a5,-20(s0)
	addi	a5,a5,1
	slli	a5,a5,2
	ld	a4,-64(s0)
	add	a5,a4,a5
	lw	a5,0(a5)
	sw	a5,-28(s0)
	lw	a5,-20(s0)
	slli	a5,a5,2
	ld	a4,-72(s0)
	add	a5,a4,a5
	lw	a5,0(a5)
	sw	a5,-32(s0)
	lw	a5,-20(s0)
	addi	a5,a5,1
	slli	a5,a5,2
	ld	a4,-72(s0)
	add	a5,a4,a5
	lw	a5,0(a5)
	sw	a5,-36(s0)
	lw	a4,-24(s0)
	lw	a5,-32(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	beq	a4,a5,.L3
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sext.w	a5,a5
	j	.L4
.L3:
	lw	a4,-28(s0)
	lw	a5,-36(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	beq	a4,a5,.L5
	lw	a5,-20(s0)
	addiw	a5,a5,2
	sext.w	a5,a5
	j	.L4
.L5:
	lw	a5,-20(s0)
	addiw	a5,a5,2
	sw	a5,-20(s0)
.L2:
	lw	a5,-52(s0)
	srliw	a4,a5,31
	addw	a5,a4,a5
	sraiw	a5,a5,1
	sext.w	a5,a5
	slliw	a5,a5,1
	sext.w	a4,a5
	lw	a5,-20(s0)
	sext.w	a5,a5
	blt	a5,a4,.L6
	lw	a5,-52(s0)
	andi	a5,a5,1
	sext.w	a5,a5
	beq	a5,zero,.L7
	lw	a5,-52(s0)
	slli	a5,a5,2
	addi	a5,a5,-4
	ld	a4,-64(s0)
	add	a5,a4,a5
	lw	a5,0(a5)
	sext.w	a3,a5
	lw	a5,-52(s0)
	slli	a5,a5,2
	addi	a5,a5,-4
	ld	a4,-72(s0)
	add	a5,a4,a5
	lw	a5,0(a5)
	mv	a4,a3
	beq	a4,a5,.L7
	lw	a5,-52(s0)
	j	.L4
.L7:
	li	a5,0
.L4:
	mv	a0,a5
	ld	s0,72(sp)
	addi	sp,sp,80
	jr	ra
	.size	verify, .-verify
	.align	1
	.type	verifyDouble, @function
verifyDouble:
	addi	sp,sp,-96
	sd	s0,88(sp)
	addi	s0,sp,96
	mv	a5,a0
	sd	a1,-80(s0)
	sd	a2,-88(s0)
	sw	a5,-68(s0)
	sw	zero,-20(s0)
	j	.L9
.L12:
	lw	a5,-20(s0)
	slli	a5,a5,3
	ld	a4,-80(s0)
	add	a5,a4,a5
	fld	fa5,0(a5)
	fsd	fa5,-32(s0)
	lw	a5,-20(s0)
	addi	a5,a5,1
	slli	a5,a5,3
	ld	a4,-80(s0)
	add	a5,a4,a5
	fld	fa5,0(a5)
	fsd	fa5,-40(s0)
	lw	a5,-20(s0)
	slli	a5,a5,3
	ld	a4,-88(s0)
	add	a5,a4,a5
	fld	fa5,0(a5)
	fsd	fa5,-48(s0)
	lw	a5,-20(s0)
	addi	a5,a5,1
	slli	a5,a5,3
	ld	a4,-88(s0)
	add	a5,a4,a5
	fld	fa5,0(a5)
	fsd	fa5,-56(s0)
	fld	fa4,-32(s0)
	fld	fa5,-48(s0)
	feq.d	a5,fa4,fa5
	snez	a5,a5
	andi	a5,a5,0xff
	sw	a5,-60(s0)
	fld	fa4,-40(s0)
	fld	fa5,-56(s0)
	feq.d	a5,fa4,fa5
	snez	a5,a5
	andi	a5,a5,0xff
	sw	a5,-64(s0)
	lw	a4,-60(s0)
	lw	a5,-64(s0)
	and	a5,a4,a5
	sext.w	a5,a5
	bne	a5,zero,.L10
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sext.w	a5,a5
	lw	a4,-60(s0)
	addw	a5,a4,a5
	sext.w	a5,a5
	j	.L11
.L10:
	lw	a5,-20(s0)
	addiw	a5,a5,2
	sw	a5,-20(s0)
.L9:
	lw	a5,-68(s0)
	srliw	a4,a5,31
	addw	a5,a4,a5
	sraiw	a5,a5,1
	sext.w	a5,a5
	slliw	a5,a5,1
	sext.w	a4,a5
	lw	a5,-20(s0)
	sext.w	a5,a5
	blt	a5,a4,.L12
	lw	a5,-68(s0)
	andi	a5,a5,1
	sext.w	a5,a5
	beq	a5,zero,.L13
	lw	a5,-68(s0)
	slli	a5,a5,3
	addi	a5,a5,-8
	ld	a4,-80(s0)
	add	a5,a4,a5
	fld	fa4,0(a5)
	lw	a5,-68(s0)
	slli	a5,a5,3
	addi	a5,a5,-8
	ld	a4,-88(s0)
	add	a5,a4,a5
	fld	fa5,0(a5)
	feq.d	a5,fa4,fa5
	bne	a5,zero,.L13
	lw	a5,-68(s0)
	j	.L11
.L13:
	li	a5,0
.L11:
	mv	a0,a5
	ld	s0,88(sp)
	addi	sp,sp,96
	jr	ra
	.size	verifyDouble, .-verifyDouble
	.section	.tbss,"awT",@nobits
	.align	2
	.type	threadsense.2, @object
	.size	threadsense.2, 4
threadsense.2:
	.zero	4
	.text
	.align	1
	.type	barrier, @function
barrier:
	addi	sp,sp,-32
	sd	s0,24(sp)
	addi	s0,sp,32
	mv	a5,a0
	sw	a5,-20(s0)
	fence	iorw,iorw
	lui	a5,%tprel_hi(threadsense.2)
	add	a5,a5,tp,%tprel_add(threadsense.2)
	lw	a5,%tprel_lo(threadsense.2)(a5)
	seqz	a5,a5
	andi	a5,a5,0xff
	sext.w	a4,a5
	lui	a5,%tprel_hi(threadsense.2)
	add	a5,a5,tp,%tprel_add(threadsense.2)
	sw	a4,%tprel_lo(threadsense.2)(a5)
	lui	a5,%hi(count.1)
	li	a4,1
	addi	a5,a5,%lo(count.1)
	fence iorw,ow; amoadd.w.aq a3,a4,0(a5)
	sext.w	a5,a3
	sext.w	a4,a5
	lw	a5,-20(s0)
	addiw	a5,a5,-1
	sext.w	a5,a5
	bne	a4,a5,.L18
	lui	a5,%hi(count.1)
	sw	zero,%lo(count.1)(a5)
	lui	a5,%tprel_hi(threadsense.2)
	add	a5,a5,tp,%tprel_add(threadsense.2)
	lw	a4,%tprel_lo(threadsense.2)(a5)
	lui	a5,%hi(sense.0)
	sw	a4,%lo(sense.0)(a5)
	j	.L16
.L18:
	nop
.L17:
	lui	a5,%hi(sense.0)
	lw	a5,%lo(sense.0)(a5)
	sext.w	a4,a5
	lui	a5,%tprel_hi(threadsense.2)
	add	a5,a5,tp,%tprel_add(threadsense.2)
	lw	a5,%tprel_lo(threadsense.2)(a5)
	bne	a4,a5,.L17
.L16:
	fence	iorw,iorw
	nop
	ld	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	barrier, .-barrier
	.align	1
	.type	lfsr, @function
lfsr:
	addi	sp,sp,-48
	sd	s0,40(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	ld	a5,-40(s0)
	srli	a4,a5,1
	ld	a5,-40(s0)
	xor	a5,a4,a5
	andi	a5,a5,1
	sd	a5,-24(s0)
	ld	a5,-40(s0)
	srli	a4,a5,1
	ld	a5,-24(s0)
	slli	a5,a5,62
	or	a5,a4,a5
	mv	a0,a5
	ld	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	lfsr, .-lfsr
	.align	1
	.type	insn_len, @function
insn_len:
	addi	sp,sp,-32
	sd	s0,24(sp)
	addi	s0,sp,32
	sd	a0,-24(s0)
	ld	a5,-24(s0)
	lhu	a5,0(a5)
	sext.w	a5,a5
	andi	a5,a5,3
	sext.w	a5,a5
	beq	a5,zero,.L22
	li	a5,4
	j	.L24
.L22:
	li	a5,2
.L24:
	mv	a0,a5
	ld	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	insn_len, .-insn_len
	.globl	Ptr_Glob
	.section	.sbss,"aw",@nobits
	.align	3
	.type	Ptr_Glob, @object
	.size	Ptr_Glob, 8
Ptr_Glob:
	.zero	8
	.globl	Next_Ptr_Glob
	.align	3
	.type	Next_Ptr_Glob, @object
	.size	Next_Ptr_Glob, 8
Next_Ptr_Glob:
	.zero	8
	.globl	Int_Glob
	.align	2
	.type	Int_Glob, @object
	.size	Int_Glob, 4
Int_Glob:
	.zero	4
	.globl	Bool_Glob
	.align	2
	.type	Bool_Glob, @object
	.size	Bool_Glob, 4
Bool_Glob:
	.zero	4
	.globl	Ch_1_Glob
	.type	Ch_1_Glob, @object
	.size	Ch_1_Glob, 1
Ch_1_Glob:
	.zero	1
	.globl	Ch_2_Glob
	.type	Ch_2_Glob, @object
	.size	Ch_2_Glob, 1
Ch_2_Glob:
	.zero	1
	.globl	Arr_1_Glob
	.bss
	.align	3
	.type	Arr_1_Glob, @object
	.size	Arr_1_Glob, 200
Arr_1_Glob:
	.zero	200
	.globl	Arr_2_Glob
	.align	3
	.type	Arr_2_Glob, @object
	.size	Arr_2_Glob, 10000
Arr_2_Glob:
	.zero	10000
	.globl	Reg
	.section	.sbss
	.align	2
	.type	Reg, @object
	.size	Reg, 4
Reg:
	.zero	4
	.globl	Done
	.align	2
	.type	Done, @object
	.size	Done, 4
Done:
	.zero	4
	.globl	Begin_Time
	.align	3
	.type	Begin_Time, @object
	.size	Begin_Time, 8
Begin_Time:
	.zero	8
	.globl	End_Time
	.align	3
	.type	End_Time, @object
	.size	End_Time, 8
End_Time:
	.zero	8
	.globl	User_Time
	.align	3
	.type	User_Time, @object
	.size	User_Time, 8
User_Time:
	.zero	8
	.globl	Microseconds
	.align	3
	.type	Microseconds, @object
	.size	Microseconds, 8
Microseconds:
	.zero	8
	.globl	Dhrystones_Per_Second
	.align	3
	.type	Dhrystones_Per_Second, @object
	.size	Dhrystones_Per_Second, 8
Dhrystones_Per_Second:
	.zero	8
	.section	.rodata
	.align	3
.LC0:
	.string	"DHRYSTONE PROGRAM, SOME STRING"
	.align	3
.LC1:
	.string	"DHRYSTONE PROGRAM, 1'ST STRING"
	.align	3
.LC2:
	.string	"\n"
	.align	3
.LC3:
	.string	"C, Version 2.2"
	.align	3
.LC4:
	.string	"Dhrystone Benchmark, Version %s\n"
	.align	3
.LC5:
	.string	"Program compiled with 'register' attribute\n"
	.align	3
.LC6:
	.string	"Program compiled without 'register' attribute\n"
	.align	3
.LC7:
	.string	"rdcycle()"
	.align	3
.LC8:
	.string	"Using %s, HZ=%d\n"
	.align	3
.LC9:
	.string	"Trying %d runs through Dhrystone:\n"
	.align	3
.LC10:
	.string	"DHRYSTONE PROGRAM, 2'ND STRING"
	.align	3
.LC11:
	.string	"DHRYSTONE PROGRAM, 3'RD STRING"
	.align	3
.LC12:
	.string	"Measured time too small to obtain meaningful results"
	.align	3
.LC13:
	.string	"Final values of the variables used in the benchmark:\n"
	.align	3
.LC14:
	.string	"Int_Glob:            %d\n"
	.align	3
.LC15:
	.string	"        should be:   %d\n"
	.align	3
.LC16:
	.string	"Bool_Glob:           %d\n"
	.align	3
.LC17:
	.string	"Ch_1_Glob:           %c\n"
	.align	3
.LC18:
	.string	"        should be:   %c\n"
	.align	3
.LC19:
	.string	"Ch_2_Glob:           %c\n"
	.align	3
.LC20:
	.string	"Arr_1_Glob[8]:       %d\n"
	.align	3
.LC21:
	.string	"Arr_2_Glob[8][7]:    %d\n"
	.align	3
.LC22:
	.string	"        should be:   Number_Of_Runs + 10\n"
	.align	3
.LC23:
	.string	"Ptr_Glob->\n"
	.align	3
.LC24:
	.string	"  Ptr_Comp:          %d\n"
	.align	3
.LC25:
	.string	"        should be:   (implementation-dependent)\n"
	.align	3
.LC26:
	.string	"  Discr:             %d\n"
	.align	3
.LC27:
	.string	"  Enum_Comp:         %d\n"
	.align	3
.LC28:
	.string	"  Int_Comp:          %d\n"
	.align	3
.LC29:
	.string	"  Str_Comp:          %s\n"
	.align	3
.LC30:
	.string	"        should be:   DHRYSTONE PROGRAM, SOME STRING\n"
	.align	3
.LC31:
	.string	"Next_Ptr_Glob->\n"
	.align	3
.LC32:
	.string	"        should be:   (implementation-dependent), same as above\n"
	.align	3
.LC33:
	.string	"Int_1_Loc:           %d\n"
	.align	3
.LC34:
	.string	"Int_2_Loc:           %d\n"
	.align	3
.LC35:
	.string	"Int_3_Loc:           %d\n"
	.align	3
.LC36:
	.string	"Enum_Loc:            %d\n"
	.align	3
.LC37:
	.string	"Str_1_Loc:           %s\n"
	.align	3
.LC38:
	.string	"        should be:   DHRYSTONE PROGRAM, 1'ST STRING\n"
	.align	3
.LC39:
	.string	"Str_2_Loc:           %s\n"
	.align	3
.LC40:
	.string	"        should be:   DHRYSTONE PROGRAM, 2'ND STRING\n"
	.align	3
.LC41:
	.string	"Microseconds for one run through Dhrystone: %ld\n"
	.align	3
.LC42:
	.string	"Dhrystones per Second:                      %ld\n"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-144
	sd	ra,136(sp)
	sd	s0,128(sp)
	addi	s0,sp,144
	mv	a5,a0
	sd	a1,-144(s0)
	sw	a5,-132(s0)
	li	a5,500
	sw	a5,-32(s0)
	addi	sp,sp,-64
	mv	a5,sp
	addi	a5,a5,15
	srli	a5,a5,4
	slli	a5,a5,4
	mv	a4,a5
	lui	a5,%hi(Next_Ptr_Glob)
	sd	a4,%lo(Next_Ptr_Glob)(a5)
	addi	sp,sp,-64
	mv	a5,sp
	addi	a5,a5,15
	srli	a5,a5,4
	slli	a5,a5,4
	mv	a4,a5
	lui	a5,%hi(Ptr_Glob)
	sd	a4,%lo(Ptr_Glob)(a5)
	lui	a5,%hi(Ptr_Glob)
	ld	a5,%lo(Ptr_Glob)(a5)
	lui	a4,%hi(Next_Ptr_Glob)
	ld	a4,%lo(Next_Ptr_Glob)(a4)
	sd	a4,0(a5)
	lui	a5,%hi(Ptr_Glob)
	ld	a5,%lo(Ptr_Glob)(a5)
	sw	zero,8(a5)
	lui	a5,%hi(Ptr_Glob)
	ld	a5,%lo(Ptr_Glob)(a5)
	li	a4,2
	sw	a4,12(a5)
	lui	a5,%hi(Ptr_Glob)
	ld	a5,%lo(Ptr_Glob)(a5)
	li	a4,40
	sw	a4,16(a5)
	lui	a5,%hi(Ptr_Glob)
	ld	a5,%lo(Ptr_Glob)(a5)
	addi	a4,a5,20
	lui	a5,%hi(.LC0)
	addi	a5,a5,%lo(.LC0)
	mv	a3,a5
	li	a5,31
	mv	a2,a5
	mv	a1,a3
	mv	a0,a4
	call	memcpy
	lui	a5,%hi(.LC1)
	addi	a5,a5,%lo(.LC1)
	ld	a2,0(a5)
	ld	a3,8(a5)
	ld	a4,16(a5)
	sd	a2,-96(s0)
	sd	a3,-88(s0)
	sd	a4,-80(s0)
	lw	a4,24(a5)
	sw	a4,-72(s0)
	lhu	a4,28(a5)
	sh	a4,-68(s0)
	lbu	a5,30(a5)
	sb	a5,-66(s0)
	lui	a5,%hi(Arr_2_Glob)
	addi	a5,a5,%lo(Arr_2_Glob)
	li	a4,10
	sw	a4,1628(a5)
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	debug_printf
	lui	a5,%hi(.LC3)
	addi	a1,a5,%lo(.LC3)
	lui	a5,%hi(.LC4)
	addi	a0,a5,%lo(.LC4)
	call	debug_printf
	lui	a5,%hi(Reg)
	lw	a5,%lo(Reg)(a5)
	beq	a5,zero,.L26
	lui	a5,%hi(.LC5)
	addi	a0,a5,%lo(.LC5)
	call	debug_printf
	j	.L27
.L26:
	lui	a5,%hi(.LC6)
	addi	a0,a5,%lo(.LC6)
	call	debug_printf
.L27:
	li	a5,999424
	addi	a2,a5,576
	lui	a5,%hi(.LC7)
	addi	a1,a5,%lo(.LC7)
	lui	a5,%hi(.LC8)
	addi	a0,a5,%lo(.LC8)
	call	debug_printf
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	debug_printf
	lui	a5,%hi(Done)
	sw	zero,%lo(Done)(a5)
	j	.L28
.L37:
	lw	a5,-32(s0)
	mv	a1,a5
	lui	a5,%hi(.LC9)
	addi	a0,a5,%lo(.LC9)
	call	debug_printf
	li	a0,1
	call	setStats
#APP
# 115 "/home/solom/Repos/riscv-tests/benchmarks/dhrystone/dhrystone_main.c" 1
	csrr a5, mcycle
# 0 "" 2
#NO_APP
	sd	a5,-40(s0)
	ld	a5,-40(s0)
	mv	a4,a5
	lui	a5,%hi(Begin_Time)
	sd	a4,%lo(Begin_Time)(a5)
	li	a5,1
	sw	a5,-28(s0)
	j	.L29
.L35:
	call	Proc_5
	call	Proc_4
	li	a5,2
	sw	a5,-52(s0)
	li	a5,3
	sw	a5,-20(s0)
	lui	a5,%hi(.LC10)
	addi	a5,a5,%lo(.LC10)
	ld	a2,0(a5)
	ld	a3,8(a5)
	ld	a4,16(a5)
	sd	a2,-128(s0)
	sd	a3,-120(s0)
	sd	a4,-112(s0)
	lw	a4,24(a5)
	sw	a4,-104(s0)
	lhu	a4,28(a5)
	sh	a4,-100(s0)
	lbu	a5,30(a5)
	sb	a5,-98(s0)
	li	a5,1
	sw	a5,-60(s0)
	addi	a4,s0,-128
	addi	a5,s0,-96
	mv	a1,a4
	mv	a0,a5
	call	Func_2
	mv	a5,a0
	seqz	a5,a5
	andi	a5,a5,0xff
	sext.w	a4,a5
	lui	a5,%hi(Bool_Glob)
	sw	a4,%lo(Bool_Glob)(a5)
	j	.L30
.L31:
	lw	a5,-52(s0)
	mv	a4,a5
	mv	a5,a4
	slliw	a5,a5,2
	addw	a5,a5,a4
	sext.w	a4,a5
	lw	a5,-20(s0)
	subw	a5,a4,a5
	sext.w	a5,a5
	sw	a5,-56(s0)
	lw	a5,-52(s0)
	addi	a3,s0,-56
	lw	a4,-20(s0)
	mv	a2,a3
	mv	a1,a4
	mv	a0,a5
	call	Proc_7
	lw	a5,-52(s0)
	addiw	a5,a5,1
	sext.w	a5,a5
	sw	a5,-52(s0)
.L30:
	lw	a4,-52(s0)
	lw	a5,-20(s0)
	sext.w	a5,a5
	bgt	a5,a4,.L31
	lw	a5,-52(s0)
	lw	a4,-56(s0)
	mv	a3,a4
	mv	a2,a5
	lui	a5,%hi(Arr_2_Glob)
	addi	a1,a5,%lo(Arr_2_Glob)
	lui	a5,%hi(Arr_1_Glob)
	addi	a0,a5,%lo(Arr_1_Glob)
	call	Proc_8
	lui	a5,%hi(Ptr_Glob)
	ld	a5,%lo(Ptr_Glob)(a5)
	mv	a0,a5
	call	Proc_1
	li	a5,65
	sb	a5,-21(s0)
	j	.L32
.L34:
	lbu	a5,-21(s0)
	sext.w	a5,a5
	li	a1,67
	mv	a0,a5
	call	Func_1
	mv	a5,a0
	sext.w	a4,a5
	lw	a5,-60(s0)
	bne	a4,a5,.L33
	addi	a5,s0,-60
	mv	a1,a5
	li	a0,0
	call	Proc_6
	lui	a5,%hi(.LC11)
	addi	a5,a5,%lo(.LC11)
	ld	a2,0(a5)
	ld	a3,8(a5)
	ld	a4,16(a5)
	sd	a2,-128(s0)
	sd	a3,-120(s0)
	sd	a4,-112(s0)
	lw	a4,24(a5)
	sw	a4,-104(s0)
	lhu	a4,28(a5)
	sh	a4,-100(s0)
	lbu	a5,30(a5)
	sb	a5,-98(s0)
	lw	a5,-28(s0)
	sw	a5,-20(s0)
	lui	a5,%hi(Int_Glob)
	lw	a4,-28(s0)
	sw	a4,%lo(Int_Glob)(a5)
.L33:
	lbu	a5,-21(s0)
	addiw	a5,a5,1
	sb	a5,-21(s0)
.L32:
	lui	a5,%hi(Ch_2_Glob)
	lbu	a4,%lo(Ch_2_Glob)(a5)
	lbu	a5,-21(s0)
	andi	a5,a5,0xff
	bleu	a5,a4,.L34
	lw	a5,-52(s0)
	lw	a4,-20(s0)
	mulw	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-56(s0)
	lw	a4,-20(s0)
	divw	a5,a4,a5
	sext.w	a5,a5
	sw	a5,-52(s0)
	lw	a5,-56(s0)
	lw	a4,-20(s0)
	subw	a5,a4,a5
	sext.w	a5,a5
	mv	a4,a5
	mv	a5,a4
	slliw	a5,a5,3
	subw	a5,a5,a4
	sext.w	a4,a5
	lw	a5,-52(s0)
	subw	a5,a4,a5
	sw	a5,-20(s0)
	addi	a5,s0,-52
	mv	a0,a5
	call	Proc_2
	lw	a5,-28(s0)
	addiw	a5,a5,1
	sw	a5,-28(s0)
.L29:
	lw	a4,-28(s0)
	lw	a5,-32(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	ble	a4,a5,.L35
#APP
# 167 "/home/solom/Repos/riscv-tests/benchmarks/dhrystone/dhrystone_main.c" 1
	csrr a5, mcycle
# 0 "" 2
#NO_APP
	sd	a5,-48(s0)
	ld	a5,-48(s0)
	mv	a4,a5
	lui	a5,%hi(End_Time)
	sd	a4,%lo(End_Time)(a5)
	li	a0,0
	call	setStats
	lui	a5,%hi(End_Time)
	ld	a4,%lo(End_Time)(a5)
	lui	a5,%hi(Begin_Time)
	ld	a5,%lo(Begin_Time)(a5)
	sub	a4,a4,a5
	lui	a5,%hi(User_Time)
	sd	a4,%lo(User_Time)(a5)
	lui	a5,%hi(User_Time)
	ld	a5,%lo(User_Time)(a5)
	bgt	a5,zero,.L36
	lui	a5,%hi(.LC12)
	addi	a0,a5,%lo(.LC12)
	call	puts
	lw	a4,-32(s0)
	mv	a5,a4
	slliw	a5,a5,2
	addw	a5,a5,a4
	slliw	a5,a5,1
	sw	a5,-32(s0)
	li	a0,10
	call	putchar
	j	.L28
.L36:
	lui	a5,%hi(Done)
	li	a4,1
	sw	a4,%lo(Done)(a5)
.L28:
	lui	a5,%hi(Done)
	lw	a5,%lo(Done)(a5)
	beq	a5,zero,.L37
	lui	a5,%hi(.LC13)
	addi	a0,a5,%lo(.LC13)
	call	debug_printf
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	debug_printf
	lui	a5,%hi(Int_Glob)
	lw	a5,%lo(Int_Glob)(a5)
	mv	a1,a5
	lui	a5,%hi(.LC14)
	addi	a0,a5,%lo(.LC14)
	call	debug_printf
	li	a1,5
	lui	a5,%hi(.LC15)
	addi	a0,a5,%lo(.LC15)
	call	debug_printf
	lui	a5,%hi(Bool_Glob)
	lw	a5,%lo(Bool_Glob)(a5)
	mv	a1,a5
	lui	a5,%hi(.LC16)
	addi	a0,a5,%lo(.LC16)
	call	debug_printf
	li	a1,1
	lui	a5,%hi(.LC15)
	addi	a0,a5,%lo(.LC15)
	call	debug_printf
	lui	a5,%hi(Ch_1_Glob)
	lbu	a5,%lo(Ch_1_Glob)(a5)
	sext.w	a5,a5
	mv	a1,a5
	lui	a5,%hi(.LC17)
	addi	a0,a5,%lo(.LC17)
	call	debug_printf
	li	a1,65
	lui	a5,%hi(.LC18)
	addi	a0,a5,%lo(.LC18)
	call	debug_printf
	lui	a5,%hi(Ch_2_Glob)
	lbu	a5,%lo(Ch_2_Glob)(a5)
	sext.w	a5,a5
	mv	a1,a5
	lui	a5,%hi(.LC19)
	addi	a0,a5,%lo(.LC19)
	call	debug_printf
	li	a1,66
	lui	a5,%hi(.LC18)
	addi	a0,a5,%lo(.LC18)
	call	debug_printf
	lui	a5,%hi(Arr_1_Glob)
	addi	a5,a5,%lo(Arr_1_Glob)
	lw	a5,32(a5)
	mv	a1,a5
	lui	a5,%hi(.LC20)
	addi	a0,a5,%lo(.LC20)
	call	debug_printf
	li	a1,7
	lui	a5,%hi(.LC15)
	addi	a0,a5,%lo(.LC15)
	call	debug_printf
	lui	a5,%hi(Arr_2_Glob)
	addi	a5,a5,%lo(Arr_2_Glob)
	lw	a5,1628(a5)
	mv	a1,a5
	lui	a5,%hi(.LC21)
	addi	a0,a5,%lo(.LC21)
	call	debug_printf
	lui	a5,%hi(.LC22)
	addi	a0,a5,%lo(.LC22)
	call	debug_printf
	lui	a5,%hi(.LC23)
	addi	a0,a5,%lo(.LC23)
	call	debug_printf
	lui	a5,%hi(Ptr_Glob)
	ld	a5,%lo(Ptr_Glob)(a5)
	ld	a5,0(a5)
	mv	a1,a5
	lui	a5,%hi(.LC24)
	addi	a0,a5,%lo(.LC24)
	call	debug_printf
	lui	a5,%hi(.LC25)
	addi	a0,a5,%lo(.LC25)
	call	debug_printf
	lui	a5,%hi(Ptr_Glob)
	ld	a5,%lo(Ptr_Glob)(a5)
	lw	a5,8(a5)
	mv	a1,a5
	lui	a5,%hi(.LC26)
	addi	a0,a5,%lo(.LC26)
	call	debug_printf
	li	a1,0
	lui	a5,%hi(.LC15)
	addi	a0,a5,%lo(.LC15)
	call	debug_printf
	lui	a5,%hi(Ptr_Glob)
	ld	a5,%lo(Ptr_Glob)(a5)
	lw	a5,12(a5)
	mv	a1,a5
	lui	a5,%hi(.LC27)
	addi	a0,a5,%lo(.LC27)
	call	debug_printf
	li	a1,2
	lui	a5,%hi(.LC15)
	addi	a0,a5,%lo(.LC15)
	call	debug_printf
	lui	a5,%hi(Ptr_Glob)
	ld	a5,%lo(Ptr_Glob)(a5)
	lw	a5,16(a5)
	mv	a1,a5
	lui	a5,%hi(.LC28)
	addi	a0,a5,%lo(.LC28)
	call	debug_printf
	li	a1,17
	lui	a5,%hi(.LC15)
	addi	a0,a5,%lo(.LC15)
	call	debug_printf
	lui	a5,%hi(Ptr_Glob)
	ld	a5,%lo(Ptr_Glob)(a5)
	addi	a5,a5,20
	mv	a1,a5
	lui	a5,%hi(.LC29)
	addi	a0,a5,%lo(.LC29)
	call	debug_printf
	lui	a5,%hi(.LC30)
	addi	a0,a5,%lo(.LC30)
	call	debug_printf
	lui	a5,%hi(.LC31)
	addi	a0,a5,%lo(.LC31)
	call	debug_printf
	lui	a5,%hi(Next_Ptr_Glob)
	ld	a5,%lo(Next_Ptr_Glob)(a5)
	ld	a5,0(a5)
	mv	a1,a5
	lui	a5,%hi(.LC24)
	addi	a0,a5,%lo(.LC24)
	call	debug_printf
	lui	a5,%hi(.LC32)
	addi	a0,a5,%lo(.LC32)
	call	debug_printf
	lui	a5,%hi(Next_Ptr_Glob)
	ld	a5,%lo(Next_Ptr_Glob)(a5)
	lw	a5,8(a5)
	mv	a1,a5
	lui	a5,%hi(.LC26)
	addi	a0,a5,%lo(.LC26)
	call	debug_printf
	li	a1,0
	lui	a5,%hi(.LC15)
	addi	a0,a5,%lo(.LC15)
	call	debug_printf
	lui	a5,%hi(Next_Ptr_Glob)
	ld	a5,%lo(Next_Ptr_Glob)(a5)
	lw	a5,12(a5)
	mv	a1,a5
	lui	a5,%hi(.LC27)
	addi	a0,a5,%lo(.LC27)
	call	debug_printf
	li	a1,1
	lui	a5,%hi(.LC15)
	addi	a0,a5,%lo(.LC15)
	call	debug_printf
	lui	a5,%hi(Next_Ptr_Glob)
	ld	a5,%lo(Next_Ptr_Glob)(a5)
	lw	a5,16(a5)
	mv	a1,a5
	lui	a5,%hi(.LC28)
	addi	a0,a5,%lo(.LC28)
	call	debug_printf
	li	a1,18
	lui	a5,%hi(.LC15)
	addi	a0,a5,%lo(.LC15)
	call	debug_printf
	lui	a5,%hi(Next_Ptr_Glob)
	ld	a5,%lo(Next_Ptr_Glob)(a5)
	addi	a5,a5,20
	mv	a1,a5
	lui	a5,%hi(.LC29)
	addi	a0,a5,%lo(.LC29)
	call	debug_printf
	lui	a5,%hi(.LC30)
	addi	a0,a5,%lo(.LC30)
	call	debug_printf
	lw	a5,-52(s0)
	mv	a1,a5
	lui	a5,%hi(.LC33)
	addi	a0,a5,%lo(.LC33)
	call	debug_printf
	li	a1,5
	lui	a5,%hi(.LC15)
	addi	a0,a5,%lo(.LC15)
	call	debug_printf
	lw	a5,-20(s0)
	mv	a1,a5
	lui	a5,%hi(.LC34)
	addi	a0,a5,%lo(.LC34)
	call	debug_printf
	li	a1,13
	lui	a5,%hi(.LC15)
	addi	a0,a5,%lo(.LC15)
	call	debug_printf
	lw	a5,-56(s0)
	mv	a1,a5
	lui	a5,%hi(.LC35)
	addi	a0,a5,%lo(.LC35)
	call	debug_printf
	li	a1,7
	lui	a5,%hi(.LC15)
	addi	a0,a5,%lo(.LC15)
	call	debug_printf
	lw	a5,-60(s0)
	mv	a1,a5
	lui	a5,%hi(.LC36)
	addi	a0,a5,%lo(.LC36)
	call	debug_printf
	li	a1,1
	lui	a5,%hi(.LC15)
	addi	a0,a5,%lo(.LC15)
	call	debug_printf
	addi	a5,s0,-96
	mv	a1,a5
	lui	a5,%hi(.LC37)
	addi	a0,a5,%lo(.LC37)
	call	debug_printf
	lui	a5,%hi(.LC38)
	addi	a0,a5,%lo(.LC38)
	call	debug_printf
	addi	a5,s0,-128
	mv	a1,a5
	lui	a5,%hi(.LC39)
	addi	a0,a5,%lo(.LC39)
	call	debug_printf
	lui	a5,%hi(.LC40)
	addi	a0,a5,%lo(.LC40)
	call	debug_printf
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	debug_printf
	lui	a5,%hi(User_Time)
	ld	a4,%lo(User_Time)(a5)
	lw	a5,-32(s0)
	div	a4,a4,a5
	lui	a5,%hi(Microseconds)
	sd	a4,%lo(Microseconds)(a5)
	lw	a4,-32(s0)
	li	a5,999424
	addiw	a5,a5,576
	mulw	a5,a4,a5
	sext.w	a5,a5
	mv	a4,a5
	lui	a5,%hi(User_Time)
	ld	a5,%lo(User_Time)(a5)
	div	a4,a4,a5
	lui	a5,%hi(Dhrystones_Per_Second)
	sd	a4,%lo(Dhrystones_Per_Second)(a5)
	lui	a5,%hi(Microseconds)
	ld	a5,%lo(Microseconds)(a5)
	mv	a1,a5
	lui	a5,%hi(.LC41)
	addi	a0,a5,%lo(.LC41)
	call	printf
	lui	a5,%hi(Dhrystones_Per_Second)
	ld	a5,%lo(Dhrystones_Per_Second)(a5)
	mv	a1,a5
	lui	a5,%hi(.LC42)
	addi	a0,a5,%lo(.LC42)
	call	printf
	li	a5,0
	mv	a0,a5
	addi	sp,s0,-144
	ld	ra,136(sp)
	ld	s0,128(sp)
	addi	sp,sp,144
	jr	ra
	.size	main, .-main
	.align	1
	.globl	Proc_1
	.type	Proc_1, @function
Proc_1:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	ld	a5,-40(s0)
	ld	a5,0(a5)
	sd	a5,-24(s0)
	lui	a5,%hi(Ptr_Glob)
	ld	a4,%lo(Ptr_Glob)(a5)
	ld	a5,-40(s0)
	ld	a5,0(a5)
	ld	a7,0(a4)
	ld	a6,8(a4)
	ld	a0,16(a4)
	ld	a1,24(a4)
	ld	a2,32(a4)
	ld	a3,40(a4)
	ld	a4,48(a4)
	sd	a7,0(a5)
	sd	a6,8(a5)
	sd	a0,16(a5)
	sd	a1,24(a5)
	sd	a2,32(a5)
	sd	a3,40(a5)
	sd	a4,48(a5)
	ld	a5,-40(s0)
	li	a4,5
	sw	a4,16(a5)
	ld	a5,-40(s0)
	lw	a4,16(a5)
	ld	a5,-24(s0)
	sw	a4,16(a5)
	ld	a5,-40(s0)
	ld	a4,0(a5)
	ld	a5,-24(s0)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	mv	a0,a5
	call	Proc_3
	ld	a5,-24(s0)
	lw	a5,8(a5)
	bne	a5,zero,.L40
	ld	a5,-24(s0)
	li	a4,6
	sw	a4,16(a5)
	ld	a5,-40(s0)
	lw	a4,12(a5)
	ld	a5,-24(s0)
	addi	a5,a5,12
	mv	a1,a5
	mv	a0,a4
	call	Proc_6
	lui	a5,%hi(Ptr_Glob)
	ld	a5,%lo(Ptr_Glob)(a5)
	ld	a4,0(a5)
	ld	a5,-24(s0)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	lw	a4,16(a5)
	ld	a5,-24(s0)
	addi	a5,a5,16
	mv	a2,a5
	li	a1,10
	mv	a0,a4
	call	Proc_7
	j	.L41
.L40:
	ld	a5,-40(s0)
	ld	a4,0(a5)
	ld	a5,-40(s0)
	ld	a7,0(a4)
	ld	a6,8(a4)
	ld	a0,16(a4)
	ld	a1,24(a4)
	ld	a2,32(a4)
	ld	a3,40(a4)
	ld	a4,48(a4)
	sd	a7,0(a5)
	sd	a6,8(a5)
	sd	a0,16(a5)
	sd	a1,24(a5)
	sd	a2,32(a5)
	sd	a3,40(a5)
	sd	a4,48(a5)
.L41:
	nop
	mv	a0,a5
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	Proc_1, .-Proc_1
	.align	1
	.globl	Proc_2
	.type	Proc_2, @function
Proc_2:
	addi	sp,sp,-48
	sd	s0,40(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	ld	a5,-40(s0)
	lw	a5,0(a5)
	addiw	a5,a5,10
	sw	a5,-20(s0)
.L44:
	lui	a5,%hi(Ch_1_Glob)
	lbu	a5,%lo(Ch_1_Glob)(a5)
	mv	a4,a5
	li	a5,65
	bne	a4,a5,.L43
	lw	a5,-20(s0)
	addiw	a5,a5,-1
	sw	a5,-20(s0)
	lui	a5,%hi(Int_Glob)
	lw	a5,%lo(Int_Glob)(a5)
	lw	a4,-20(s0)
	subw	a5,a4,a5
	sext.w	a4,a5
	ld	a5,-40(s0)
	sw	a4,0(a5)
	sw	zero,-24(s0)
.L43:
	lw	a5,-24(s0)
	sext.w	a5,a5
	bne	a5,zero,.L44
	nop
	mv	a0,a5
	ld	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	Proc_2, .-Proc_2
	.align	1
	.globl	Proc_3
	.type	Proc_3, @function
Proc_3:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	sd	a0,-24(s0)
	lui	a5,%hi(Ptr_Glob)
	ld	a5,%lo(Ptr_Glob)(a5)
	beq	a5,zero,.L46
	lui	a5,%hi(Ptr_Glob)
	ld	a5,%lo(Ptr_Glob)(a5)
	ld	a4,0(a5)
	ld	a5,-24(s0)
	sd	a4,0(a5)
.L46:
	lui	a5,%hi(Int_Glob)
	lw	a4,%lo(Int_Glob)(a5)
	lui	a5,%hi(Ptr_Glob)
	ld	a5,%lo(Ptr_Glob)(a5)
	addi	a5,a5,16
	mv	a2,a5
	mv	a1,a4
	li	a0,10
	call	Proc_7
	nop
	mv	a0,a5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	Proc_3, .-Proc_3
	.align	1
	.globl	Proc_4
	.type	Proc_4, @function
Proc_4:
	addi	sp,sp,-32
	sd	s0,24(sp)
	addi	s0,sp,32
	lui	a5,%hi(Ch_1_Glob)
	lbu	a5,%lo(Ch_1_Glob)(a5)
	sext.w	a4,a5
	li	a5,65
	sub	a5,a4,a5
	seqz	a5,a5
	andi	a5,a5,0xff
	sw	a5,-20(s0)
	lui	a5,%hi(Bool_Glob)
	lw	a4,%lo(Bool_Glob)(a5)
	lw	a5,-20(s0)
	or	a5,a4,a5
	sext.w	a4,a5
	lui	a5,%hi(Bool_Glob)
	sw	a4,%lo(Bool_Glob)(a5)
	lui	a5,%hi(Ch_2_Glob)
	li	a4,66
	sb	a4,%lo(Ch_2_Glob)(a5)
	nop
	mv	a0,a5
	ld	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	Proc_4, .-Proc_4
	.align	1
	.globl	Proc_5
	.type	Proc_5, @function
Proc_5:
	addi	sp,sp,-16
	sd	s0,8(sp)
	addi	s0,sp,16
	lui	a5,%hi(Ch_1_Glob)
	li	a4,65
	sb	a4,%lo(Ch_1_Glob)(a5)
	lui	a5,%hi(Bool_Glob)
	sw	zero,%lo(Bool_Glob)(a5)
	nop
	mv	a0,a5
	ld	s0,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	Proc_5, .-Proc_5
	.local	count.1
	.comm	count.1,4,4
	.local	sense.0
	.comm	sense.0,4,4
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
