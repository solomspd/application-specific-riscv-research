	.file	"mm_main.c"
	.option nopic
	.text
	.section	.srodata,"a"
	.align	2
	.type	RBM, @object
	.size	RBM, 4
RBM:
	.word	4
	.align	2
	.type	RBN, @object
	.size	RBN, 4
RBN:
	.word	5
	.align	2
	.type	RBK, @object
	.size	RBK, 4
RBK:
	.word	6
	.align	2
	.type	CBM, @object
	.size	CBM, 4
CBM:
	.word	24
	.align	2
	.type	CBN, @object
	.size	CBN, 4
CBN:
	.word	25
	.align	2
	.type	CBK, @object
	.size	CBK, 4
CBK:
	.word	24
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
	.section	.rodata
	.align	3
.LC0:
	.string	"C%d: reg block %dx%dx%d, cache block %dx%dx%d\n"
	.align	3
.LC1:
	.string	"C%d: %d instructions\n"
	.align	3
.LC2:
	.string	"C%d: %d cycles\n"
	.align	3
.LC3:
	.string	"C%d: %d flops\n"
	.align	3
.LC4:
	.string	"C%d: %d Mflops @ 1 GHz\n"
	.align	3
.LC6:
	.string	"C%d: c[%lu][%lu] %f != %f\n"
	.text
	.align	1
	.globl	thread_entry
	.type	thread_entry, @function
thread_entry:
	addi	sp,sp,-336
	sd	ra,328(sp)
	sd	s0,320(sp)
	sd	s2,312(sp)
	sd	s3,304(sp)
	sd	s4,296(sp)
	sd	s5,288(sp)
	sd	s6,280(sp)
	sd	s7,272(sp)
	sd	s8,264(sp)
	sd	s9,256(sp)
	sd	s10,248(sp)
	sd	s11,240(sp)
	addi	s0,sp,336
	mv	t0,a0
	mv	a0,a1
	mv	a1,t0
	sw	a1,-292(s0)
	mv	a1,a0
	sw	a1,-296(s0)
	li	a1,8
	sw	a1,-196(s0)
	li	a1,933982208
	slli	a1,a1,2
	addi	a1,a1,-273
	sd	a1,-192(s0)
	li	a1,24
	sw	a1,-200(s0)
	li	a1,25
	sw	a1,-204(s0)
	li	a1,24
	sw	a1,-208(s0)
	lw	a0,-200(s0)
	lw	a1,-208(s0)
	mulw	a1,a0,a1
	sext.w	a1,a1
	mv	a0,a1
	addi	a0,a0,-1
	sd	a0,-216(s0)
	mv	a0,a1
	sd	a0,-320(s0)
	sd	zero,-312(s0)
	ld	a0,-320(s0)
	srli	a0,a0,58
	ld	t0,-312(s0)
	slli	t6,t0,6
	or	t6,a0,t6
	ld	a0,-320(s0)
	slli	t5,a0,6
	mv	a0,a1
	mv	s10,a0
	li	s11,0
	srli	a0,s10,58
	slli	t4,s11,6
	or	t4,a0,t4
	slli	t3,s10,6
	slli	a1,a1,3
	addi	a1,a1,15
	srli	a1,a1,4
	slli	a1,a1,4
	sub	sp,sp,a1
	addi	a1,sp,16
	addi	a1,a1,7
	srli	a1,a1,3
	slli	a1,a1,3
	sd	a1,-224(s0)
	lw	a0,-208(s0)
	lw	a1,-204(s0)
	mulw	a1,a0,a1
	sext.w	a1,a1
	mv	a0,a1
	addi	a0,a0,-1
	sd	a0,-232(s0)
	mv	a0,a1
	mv	s8,a0
	li	s9,0
	srli	a0,s8,58
	slli	t2,s9,6
	or	t2,a0,t2
	slli	t1,s8,6
	mv	a0,a1
	mv	s6,a0
	li	s7,0
	srli	a0,s6,58
	slli	a7,s7,6
	or	a7,a0,a7
	slli	a6,s6,6
	slli	a1,a1,3
	addi	a1,a1,15
	srli	a1,a1,4
	slli	a1,a1,4
	sub	sp,sp,a1
	addi	a1,sp,16
	addi	a1,a1,7
	srli	a1,a1,3
	slli	a1,a1,3
	sd	a1,-240(s0)
	lw	a0,-200(s0)
	lw	a1,-204(s0)
	mulw	a1,a0,a1
	sext.w	a1,a1
	mv	a0,a1
	addi	a0,a0,-1
	sd	a0,-248(s0)
	mv	a0,a1
	mv	s4,a0
	li	s5,0
	srli	a0,s4,58
	slli	a3,s5,6
	or	a3,a0,a3
	slli	a2,s4,6
	mv	a3,a1
	mv	s2,a3
	li	s3,0
	srli	a3,s2,58
	slli	a5,s3,6
	or	a5,a3,a5
	slli	a4,s2,6
	mv	a5,a1
	slli	a5,a5,3
	addi	a5,a5,15
	srli	a5,a5,4
	slli	a5,a5,4
	sub	sp,sp,a5
	addi	a5,sp,16
	addi	a5,a5,7
	srli	a5,a5,3
	slli	a5,a5,3
	sd	a5,-256(s0)
	sd	zero,-184(s0)
	j	.L26
.L29:
	sd	zero,-176(s0)
	j	.L27
.L28:
	ld	a0,-192(s0)
	call	lfsr
	sd	a0,-192(s0)
	lw	a4,-208(s0)
	ld	a5,-184(s0)
	mul	a4,a4,a5
	ld	a5,-176(s0)
	add	a5,a4,a5
	ld	a4,-192(s0)
	fcvt.d.lu	fa5,a4
	ld	a4,-224(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	fsd	fa5,0(a5)
	ld	a5,-176(s0)
	addi	a5,a5,1
	sd	a5,-176(s0)
.L27:
	lw	a5,-208(s0)
	ld	a4,-176(s0)
	bltu	a4,a5,.L28
	ld	a5,-184(s0)
	addi	a5,a5,1
	sd	a5,-184(s0)
.L26:
	lw	a5,-200(s0)
	ld	a4,-184(s0)
	bltu	a4,a5,.L29
	sd	zero,-168(s0)
	j	.L30
.L33:
	sd	zero,-160(s0)
	j	.L31
.L32:
	ld	a0,-192(s0)
	call	lfsr
	sd	a0,-192(s0)
	lw	a4,-204(s0)
	ld	a5,-168(s0)
	mul	a4,a4,a5
	ld	a5,-160(s0)
	add	a5,a4,a5
	ld	a4,-192(s0)
	fcvt.d.lu	fa5,a4
	ld	a4,-240(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	fsd	fa5,0(a5)
	ld	a5,-160(s0)
	addi	a5,a5,1
	sd	a5,-160(s0)
.L31:
	lw	a5,-204(s0)
	ld	a4,-160(s0)
	bltu	a4,a5,.L32
	ld	a5,-168(s0)
	addi	a5,a5,1
	sd	a5,-168(s0)
.L30:
	lw	a5,-208(s0)
	ld	a4,-168(s0)
	bltu	a4,a5,.L33
	lw	a4,-200(s0)
	lw	a5,-204(s0)
	mulw	a5,a4,a5
	sext.w	a5,a5
	slli	a5,a5,3
	mv	a2,a5
	li	a1,0
	ld	a0,-256(s0)
	call	memset
	sw	zero,-132(s0)
	j	.L34
.L35:
#APP
# 36 "/home/solom/Repos/riscv-tests/benchmarks/mm/mm_main.c" 1
	csrr a5, minstret
# 0 "" 2
#NO_APP
	sd	a5,-264(s0)
	ld	a5,-264(s0)
	neg	a5,a5
	sd	a5,-152(s0)
#APP
# 37 "/home/solom/Repos/riscv-tests/benchmarks/mm/mm_main.c" 1
	csrr a5, mcycle
# 0 "" 2
#NO_APP
	sd	a5,-272(s0)
	ld	a5,-272(s0)
	neg	a5,a5
	sd	a5,-144(s0)
	lw	a0,-200(s0)
	lw	a1,-204(s0)
	lw	a2,-208(s0)
	lw	a4,-208(s0)
	lw	a3,-204(s0)
	lw	a5,-204(s0)
	sd	a5,0(sp)
	ld	a7,-256(s0)
	mv	a6,a3
	ld	a5,-240(s0)
	ld	a3,-224(s0)
	call	mm
#APP
# 39 "/home/solom/Repos/riscv-tests/benchmarks/mm/mm_main.c" 1
	csrr a5, minstret
# 0 "" 2
#NO_APP
	sd	a5,-280(s0)
	ld	a5,-280(s0)
	ld	a4,-152(s0)
	add	a5,a4,a5
	sd	a5,-152(s0)
#APP
# 40 "/home/solom/Repos/riscv-tests/benchmarks/mm/mm_main.c" 1
	csrr a5, mcycle
# 0 "" 2
#NO_APP
	sd	a5,-288(s0)
	ld	a5,-288(s0)
	ld	a4,-144(s0)
	add	a5,a4,a5
	sd	a5,-144(s0)
	lw	a5,-132(s0)
	addiw	a5,a5,1
	sw	a5,-132(s0)
.L34:
	lw	a4,-132(s0)
	lw	a5,-196(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L35
#APP
# 43 "/home/solom/Repos/riscv-tests/benchmarks/mm/mm_main.c" 1
	fence
# 0 "" 2
#NO_APP
	li	a2,4
	li	a3,5
	li	a4,6
	li	a5,24
	li	a0,25
	li	a6,24
	lw	a1,-292(s0)
	mv	a7,a6
	mv	a6,a0
	lui	a0,%hi(.LC0)
	addi	a0,a0,%lo(.LC0)
	call	printf
	ld	a5,-152(s0)
	sext.w	a4,a5
	lw	a5,-292(s0)
	mv	a2,a4
	mv	a1,a5
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	printf
	ld	a5,-144(s0)
	sext.w	a4,a5
	lw	a5,-292(s0)
	mv	a2,a4
	mv	a1,a5
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	printf
	lw	a4,-200(s0)
	lw	a5,-204(s0)
	mulw	a5,a4,a5
	sext.w	a5,a5
	lw	a4,-208(s0)
	mulw	a5,a4,a5
	sext.w	a5,a5
	slliw	a5,a5,1
	sext.w	a4,a5
	lw	a5,-292(s0)
	mv	a2,a4
	mv	a1,a5
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	lw	a4,-200(s0)
	lw	a5,-204(s0)
	mulw	a5,a4,a5
	sext.w	a5,a5
	lw	a4,-208(s0)
	mulw	a5,a4,a5
	sext.w	a4,a5
	li	a5,2000
	mulw	a5,a4,a5
	sext.w	a5,a5
	mv	a4,a5
	ld	a5,-144(s0)
	divu	a4,a4,a5
	lw	a5,-292(s0)
	mv	a2,a4
	mv	a1,a5
	lui	a5,%hi(.LC4)
	addi	a0,a5,%lo(.LC4)
	call	printf
	sd	zero,-128(s0)
	j	.L36
.L43:
	sd	zero,-120(s0)
	j	.L37
.L42:
	sd	zero,-112(s0)
	sd	zero,-104(s0)
	j	.L38
.L39:
	lw	a4,-208(s0)
	ld	a5,-128(s0)
	mul	a4,a4,a5
	ld	a5,-104(s0)
	add	a5,a4,a5
	ld	a4,-224(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	fld	fa4,0(a5)
	lw	a4,-204(s0)
	ld	a5,-104(s0)
	mul	a4,a4,a5
	ld	a5,-120(s0)
	add	a5,a4,a5
	ld	a4,-240(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	fld	fa5,0(a5)
	fmul.d	fa5,fa4,fa5
	fld	fa4,-112(s0)
	fadd.d	fa5,fa4,fa5
	fsd	fa5,-112(s0)
	ld	a5,-104(s0)
	addi	a5,a5,1
	sd	a5,-104(s0)
.L38:
	lw	a5,-208(s0)
	ld	a4,-104(s0)
	bltu	a4,a5,.L39
	lw	a5,-196(s0)
	fcvt.d.w	fa5,a5
	fld	fa4,-112(s0)
	fmul.d	fa5,fa4,fa5
	fsd	fa5,-112(s0)
	lw	a4,-204(s0)
	ld	a5,-128(s0)
	mul	a4,a4,a5
	ld	a5,-120(s0)
	add	a5,a4,a5
	ld	a4,-256(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	fld	fa4,0(a5)
	fld	fa5,-112(s0)
	fsub.d	fa5,fa4,fa5
	fabs.d	fa4,fa5
	fld	fa3,-112(s0)
	lui	a5,%hi(.LC5)
	fld	fa5,%lo(.LC5)(a5)
	fmul.d	fa5,fa3,fa5
	fabs.d	fa5,fa5
	fgt.d	a5,fa4,fa5
	beq	a5,zero,.L45
	lw	a4,-204(s0)
	ld	a5,-128(s0)
	mul	a4,a4,a5
	ld	a5,-120(s0)
	add	a5,a4,a5
	ld	a4,-256(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	fld	fa5,0(a5)
	lw	a1,-292(s0)
	ld	a5,-112(s0)
	fmv.x.d	a4,fa5
	ld	a3,-120(s0)
	ld	a2,-128(s0)
	lui	a0,%hi(.LC6)
	addi	a0,a0,%lo(.LC6)
	call	printf
	li	a0,1
	call	exit
.L45:
	ld	a5,-120(s0)
	addi	a5,a5,1
	sd	a5,-120(s0)
.L37:
	lw	a5,-204(s0)
	ld	a4,-120(s0)
	bltu	a4,a5,.L42
	ld	a5,-128(s0)
	addi	a5,a5,1
	sd	a5,-128(s0)
.L36:
	lw	a5,-200(s0)
	ld	a4,-128(s0)
	bltu	a4,a5,.L43
	lw	a5,-296(s0)
	mv	a0,a5
	call	barrier
	li	a0,0
	call	exit
	.size	thread_entry, .-thread_entry
	.local	count.1
	.comm	count.1,4,4
	.local	sense.0
	.comm	sense.0,4,4
	.section	.rodata
	.align	3
.LC5:
	.word	-1598689907
	.word	1051772663
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
