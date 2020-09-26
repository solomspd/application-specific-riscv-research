	.file	"pmp.c"
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
	.globl	trap_expected
	.section	.sbss,"aw",@nobits
	.align	2
	.type	trap_expected, @object
	.size	trap_expected, 4
trap_expected:
	.zero	4
	.text
	.align	1
	.globl	handle_trap
	.type	handle_trap, @function
handle_trap:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	sd	a2,-40(s0)
	ld	a4,-24(s0)
	li	a5,323
	bne	a4,a5,.L26
	li	a0,0
	call	exit
.L26:
	lui	a5,%hi(trap_expected)
	lw	a5,%lo(trap_expected)(a5)
	sext.w	a5,a5
	beq	a5,zero,.L27
	ld	a4,-24(s0)
	li	a5,4096
	addi	a5,a5,-883
	beq	a4,a5,.L28
.L27:
	li	a0,1
	call	exit
.L28:
	lui	a5,%hi(trap_expected)
	sw	zero,%lo(trap_expected)(a5)
	ld	a0,-32(s0)
	call	insn_len
	mv	a4,a0
	ld	a5,-32(s0)
	add	a5,a4,a5
	mv	a0,a5
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	handle_trap, .-handle_trap
	.globl	scratch
	.bss
	.align	12
	.type	scratch, @object
	.size	scratch, 4096
scratch:
	.zero	4096
	.globl	l1pt
	.align	12
	.type	l1pt, @object
	.size	l1pt, 4096
l1pt:
	.zero	4096
	.globl	l2pt
	.align	12
	.type	l2pt, @object
	.size	l2pt, 4096
l2pt:
	.zero	4096
	.globl	l3pt
	.align	12
	.type	l3pt, @object
	.size	l3pt, 4096
l3pt:
	.zero	4096
	.text
	.align	1
	.type	init_pt, @function
init_pt:
	addi	sp,sp,-32
	sd	s0,24(sp)
	addi	s0,sp,32
	lui	a5,%hi(l2pt)
	addi	a5,a5,%lo(l2pt)
	srli	a5,a5,12
	slli	a5,a5,10
	ori	a4,a5,1
	lui	a5,%hi(l1pt)
	sd	a4,%lo(l1pt)(a5)
	lui	a5,%hi(scratch)
	addi	a5,a5,%lo(scratch)
	srli	a5,a5,12
	slli	a5,a5,10
	ori	a4,a5,199
	lui	a5,%hi(l3pt)
	addi	a5,a5,%lo(l3pt)
	sd	a4,8(a5)
	lui	a5,%hi(l3pt)
	addi	a5,a5,%lo(l3pt)
	srli	a5,a5,12
	slli	a5,a5,10
	ori	a4,a5,1
	lui	a5,%hi(l2pt)
	sd	a4,%lo(l2pt)(a5)
	li	a5,8
	sd	a5,-24(s0)
	ld	a5,-24(s0)
	slli	a4,a5,60
	lui	a5,%hi(l1pt)
	addi	a5,a5,%lo(l1pt)
	srli	a5,a5,12
	or	a5,a4,a5
#APP
# 48 "/home/solom/Repos/riscv-tests/benchmarks/pmp/pmp.c" 1
	csrw sptbr, a5
# 0 "" 2
#NO_APP
	li	a5,-1
#APP
# 50 "/home/solom/Repos/riscv-tests/benchmarks/pmp/pmp.c" 1
	csrw pmpaddr2, a5
# 0 "" 2
#NO_APP
	li	a5,1638400
#APP
# 51 "/home/solom/Repos/riscv-tests/benchmarks/pmp/pmp.c" 1
	csrw pmpcfg0, a5
# 0 "" 2
#NO_APP
	nop
	ld	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	init_pt, .-init_pt
	.align	1
	.type	test_range, @function
test_range:
	addi	sp,sp,-656
	sd	ra,648(sp)
	sd	s0,640(sp)
	addi	s0,sp,656
	sd	a0,-648(s0)
	sd	a1,-656(s0)
	ld	a5,-648(s0)
	sd	a5,-184(s0)
	ld	a4,-184(s0)
	li	a5,4096
	bltu	a4,a5,.L32
	ld	a4,-184(s0)
	li	a5,8192
	bltu	a4,a5,.L33
.L32:
	li	a0,3
	call	exit
.L33:
	lui	a5,%hi(scratch)
	addi	a4,a5,%lo(scratch)
	li	a5,-4096
	add	a4,a4,a5
	ld	a5,-184(s0)
	add	a5,a4,a5
	sd	a5,-152(s0)
	ld	a5,-656(s0)
	sd	a5,-160(s0)
	li	a5,9
	sd	a5,-544(s0)
	ld	a5,-152(s0)
	srli	a5,a5,2
	sd	a5,-536(s0)
	ld	a4,-152(s0)
	ld	a5,-160(s0)
	add	a5,a4,a5
	srli	a5,a5,2
	sd	a5,-528(s0)
	ld	a5,-544(s0)
	sd	a5,-568(s0)
	ld	a5,-536(s0)
	sd	a5,-560(s0)
	ld	a5,-528(s0)
	sd	a5,-552(s0)
#APP
# 138 "/home/solom/Repos/riscv-tests/benchmarks/pmp/pmp.c" 1
	csrr a5, pmpcfg0
# 0 "" 2
#NO_APP
	sd	a5,-168(s0)
	ld	a5,-168(s0)
	sd	a5,-176(s0)
	ld	a4,-176(s0)
	li	a5,-65536
	addi	a5,a5,255
	and	a5,a4,a5
#APP
# 139 "/home/solom/Repos/riscv-tests/benchmarks/pmp/pmp.c" 1
	csrw pmpcfg0, a5
# 0 "" 2
#NO_APP
	ld	a5,-560(s0)
#APP
# 140 "/home/solom/Repos/riscv-tests/benchmarks/pmp/pmp.c" 1
	csrw pmpaddr0, a5
# 0 "" 2
#NO_APP
	ld	a5,-552(s0)
#APP
# 141 "/home/solom/Repos/riscv-tests/benchmarks/pmp/pmp.c" 1
	csrw pmpaddr1, a5
# 0 "" 2
#NO_APP
	ld	a5,-568(s0)
	slli	a4,a5,8
	li	a5,65536
	addi	a5,a5,-1
	and	a4,a4,a5
	ld	a3,-176(s0)
	li	a5,-65536
	addi	a5,a5,255
	and	a5,a3,a5
	or	a5,a4,a5
#APP
# 142 "/home/solom/Repos/riscv-tests/benchmarks/pmp/pmp.c" 1
	csrw pmpcfg0, a5
# 0 "" 2
# 143 "/home/solom/Repos/riscv-tests/benchmarks/pmp/pmp.c" 1
	sfence.vma
# 0 "" 2
#NO_APP
	ld	a5,-568(s0)
	sd	a5,-376(s0)
	ld	a5,-560(s0)
	sd	a5,-368(s0)
	ld	a5,-552(s0)
	sd	a5,-360(s0)
	nop
	ld	a5,-376(s0)
	sd	a5,-592(s0)
	ld	a5,-368(s0)
	sd	a5,-584(s0)
	ld	a5,-360(s0)
	sd	a5,-576(s0)
	ld	a5,-648(s0)
	sd	a5,-24(s0)
	ld	a5,-656(s0)
	sd	a5,-32(s0)
	ld	a5,-24(s0)
	sd	a5,-40(s0)
	j	.L37
.L64:
	ld	a5,-592(s0)
	sd	a5,-616(s0)
	ld	a5,-584(s0)
	sd	a5,-608(s0)
	ld	a5,-576(s0)
	sd	a5,-600(s0)
	ld	a5,-40(s0)
	sd	a5,-48(s0)
	li	a5,1
	sd	a5,-56(s0)
	j	.L38
.L63:
	ld	a5,-56(s0)
	addi	a4,a5,-1
	ld	a5,-48(s0)
	and	a5,a4,a5
	bne	a5,zero,.L101
	ld	a5,-616(s0)
	sd	a5,-640(s0)
	ld	a5,-608(s0)
	sd	a5,-632(s0)
	ld	a5,-600(s0)
	sd	a5,-624(s0)
	ld	a5,-48(s0)
	sd	a5,-64(s0)
	ld	a5,-56(s0)
	sd	a5,-72(s0)
	ld	a5,-640(s0)
	andi	a5,a5,24
	bne	a5,zero,.L41
	li	a5,1
	j	.L42
.L41:
	ld	a5,-640(s0)
	andi	a4,a5,24
	li	a5,8
	beq	a4,a5,.L43
	li	a5,1
	sd	a5,-80(s0)
	ld	a5,-640(s0)
	andi	a4,a5,24
	li	a5,24
	bne	a4,a5,.L44
	ld	a5,-80(s0)
	slli	a5,a5,1
	sd	a5,-80(s0)
	li	a5,1
	sd	a5,-88(s0)
	j	.L45
.L47:
	ld	a4,-624(s0)
	ld	a5,-88(s0)
	and	a5,a4,a5
	beq	a5,zero,.L102
	ld	a4,-624(s0)
	ld	a5,-88(s0)
	not	a5,a5
	and	a5,a4,a5
	sd	a5,-624(s0)
	ld	a5,-80(s0)
	slli	a5,a5,1
	sd	a5,-80(s0)
	ld	a5,-88(s0)
	slli	a5,a5,1
	sd	a5,-88(s0)
.L45:
	ld	a5,-88(s0)
	bne	a5,zero,.L47
	j	.L44
.L102:
	nop
.L44:
	ld	a5,-624(s0)
	sd	a5,-632(s0)
	ld	a4,-632(s0)
	ld	a5,-80(s0)
	add	a5,a4,a5
	sd	a5,-624(s0)
.L43:
	ld	a5,-632(s0)
	slli	a5,a5,2
	sd	a5,-632(s0)
	ld	a5,-624(s0)
	slli	a5,a5,2
	sd	a5,-624(s0)
	ld	a5,-64(s0)
	sd	a5,-96(s0)
	ld	a4,-96(s0)
	li	a5,4096
	bltu	a4,a5,.L48
	ld	a4,-96(s0)
	li	a5,8192
	bltu	a4,a5,.L49
.L48:
	li	a0,3
	call	exit
.L49:
	lui	a5,%hi(scratch)
	addi	a4,a5,%lo(scratch)
	li	a5,-4096
	add	a4,a4,a5
	ld	a5,-96(s0)
	add	a5,a4,a5
	sd	a5,-64(s0)
	sd	zero,-104(s0)
	sd	zero,-112(s0)
	j	.L51
.L53:
	ld	a4,-632(s0)
	ld	a3,-64(s0)
	ld	a5,-112(s0)
	add	a5,a3,a5
	bgtu	a4,a5,.L52
	ld	a4,-64(s0)
	ld	a5,-112(s0)
	add	a4,a4,a5
	ld	a5,-624(s0)
	bgeu	a4,a5,.L52
	ld	a5,-104(s0)
	addi	a5,a5,4
	sd	a5,-104(s0)
.L52:
	ld	a5,-112(s0)
	addi	a5,a5,4
	sd	a5,-112(s0)
.L51:
	ld	a4,-72(s0)
	ld	a5,-112(s0)
	bgtu	a4,a5,.L53
	ld	a5,-104(s0)
	beq	a5,zero,.L54
	ld	a4,-72(s0)
	ld	a5,-104(s0)
	bgtu	a4,a5,.L55
.L54:
	li	a5,1
	j	.L42
.L55:
	li	a5,0
.L42:
	seqz	a5,a5
	andi	a5,a5,0xff
	sext.w	a4,a5
	lui	a5,%hi(trap_expected)
	sw	a4,%lo(trap_expected)(a5)
	ld	a5,-48(s0)
	sd	a5,-120(s0)
	ld	a5,-56(s0)
	sd	a5,-128(s0)
#APP
# 106 "/home/solom/Repos/riscv-tests/benchmarks/pmp/pmp.c" 1
	csrr a5, mstatus
# 0 "" 2
#NO_APP
	sd	a5,-136(s0)
	ld	a4,-136(s0)
	li	a5,-139264
	addi	a5,a5,2047
	and	a4,a4,a5
	li	a5,135168
	addi	a5,a5,-2048
	or	a5,a4,a5
	sd	a5,-144(s0)
	ld	a4,-128(s0)
	li	a5,8
	beq	a4,a5,.L57
	ld	a4,-128(s0)
	li	a5,8
	bgtu	a4,a5,.L58
	ld	a4,-128(s0)
	li	a5,4
	beq	a4,a5,.L59
	ld	a4,-128(s0)
	li	a5,4
	bgtu	a4,a5,.L58
	ld	a4,-128(s0)
	li	a5,1
	beq	a4,a5,.L60
	ld	a4,-128(s0)
	li	a5,2
	beq	a4,a5,.L61
	j	.L58
.L60:
	ld	a4,-120(s0)
	ld	a5,-144(s0)
#APP
# 108 "/home/solom/Repos/riscv-tests/benchmarks/pmp/pmp.c" 1
	csrrw a5, mstatus, a5; lb x0, (a4); csrw mstatus, a5
# 0 "" 2
#NO_APP
	sd	a5,-144(s0)
	j	.L62
.L61:
	ld	a4,-120(s0)
	ld	a5,-144(s0)
#APP
# 109 "/home/solom/Repos/riscv-tests/benchmarks/pmp/pmp.c" 1
	csrrw a5, mstatus, a5; lh x0, (a4); csrw mstatus, a5
# 0 "" 2
#NO_APP
	sd	a5,-144(s0)
	j	.L62
.L59:
	ld	a4,-120(s0)
	ld	a5,-144(s0)
#APP
# 110 "/home/solom/Repos/riscv-tests/benchmarks/pmp/pmp.c" 1
	csrrw a5, mstatus, a5; lw x0, (a4); csrw mstatus, a5
# 0 "" 2
#NO_APP
	sd	a5,-144(s0)
	j	.L62
.L57:
	ld	a4,-120(s0)
	ld	a5,-144(s0)
#APP
# 112 "/home/solom/Repos/riscv-tests/benchmarks/pmp/pmp.c" 1
	csrrw a5, mstatus, a5; ld x0, (a4); csrw mstatus, a5
# 0 "" 2
#NO_APP
	sd	a5,-144(s0)
	j	.L62
.L58:
.L62:
	nop
	lui	a5,%hi(trap_expected)
	lw	a5,%lo(trap_expected)(a5)
	sext.w	a5,a5
	beq	a5,zero,.L40
	li	a0,2
	call	exit
.L101:
	nop
.L40:
	ld	a5,-56(s0)
	slli	a5,a5,1
	sd	a5,-56(s0)
.L38:
	ld	a4,-56(s0)
	li	a5,8
	bleu	a4,a5,.L63
	nop
	ld	a5,-40(s0)
	addi	a5,a5,4
	sd	a5,-40(s0)
.L37:
	ld	a4,-24(s0)
	ld	a5,-32(s0)
	add	a5,a4,a5
	ld	a4,-40(s0)
	bltu	a4,a5,.L64
	nop
	ld	a5,-656(s0)
	addi	a4,a5,-1
	ld	a5,-656(s0)
	and	a5,a4,a5
	bne	a5,zero,.L103
	ld	a5,-656(s0)
	addi	a4,a5,-1
	ld	a5,-648(s0)
	and	a5,a4,a5
	bne	a5,zero,.L103
	ld	a5,-648(s0)
	sd	a5,-352(s0)
	ld	a4,-352(s0)
	li	a5,4096
	bltu	a4,a5,.L66
	ld	a4,-352(s0)
	li	a5,8192
	bltu	a4,a5,.L67
.L66:
	li	a0,3
	call	exit
.L67:
	lui	a5,%hi(scratch)
	addi	a4,a5,%lo(scratch)
	li	a5,-4096
	add	a4,a4,a5
	ld	a5,-352(s0)
	add	a5,a4,a5
	sd	a5,-320(s0)
	ld	a5,-656(s0)
	sd	a5,-328(s0)
	ld	a4,-328(s0)
	li	a5,4
	bleu	a4,a5,.L69
	li	a5,25
	j	.L70
.L69:
	li	a5,17
.L70:
	sd	a5,-424(s0)
	sd	zero,-416(s0)
	ld	a5,-328(s0)
	srli	a4,a5,1
	ld	a5,-320(s0)
	add	a5,a4,a5
	addi	a5,a5,-1
	srli	a5,a5,2
	sd	a5,-408(s0)
	ld	a5,-424(s0)
	sd	a5,-448(s0)
	ld	a5,-416(s0)
	sd	a5,-440(s0)
	ld	a5,-408(s0)
	sd	a5,-432(s0)
#APP
# 138 "/home/solom/Repos/riscv-tests/benchmarks/pmp/pmp.c" 1
	csrr a5, pmpcfg0
# 0 "" 2
#NO_APP
	sd	a5,-336(s0)
	ld	a5,-336(s0)
	sd	a5,-344(s0)
	ld	a4,-344(s0)
	li	a5,-65536
	addi	a5,a5,255
	and	a5,a4,a5
#APP
# 139 "/home/solom/Repos/riscv-tests/benchmarks/pmp/pmp.c" 1
	csrw pmpcfg0, a5
# 0 "" 2
#NO_APP
	ld	a5,-440(s0)
#APP
# 140 "/home/solom/Repos/riscv-tests/benchmarks/pmp/pmp.c" 1
	csrw pmpaddr0, a5
# 0 "" 2
#NO_APP
	ld	a5,-432(s0)
#APP
# 141 "/home/solom/Repos/riscv-tests/benchmarks/pmp/pmp.c" 1
	csrw pmpaddr1, a5
# 0 "" 2
#NO_APP
	ld	a5,-448(s0)
	slli	a4,a5,8
	li	a5,65536
	addi	a5,a5,-1
	and	a4,a4,a5
	ld	a3,-344(s0)
	li	a5,-65536
	addi	a5,a5,255
	and	a5,a3,a5
	or	a5,a4,a5
#APP
# 142 "/home/solom/Repos/riscv-tests/benchmarks/pmp/pmp.c" 1
	csrw pmpcfg0, a5
# 0 "" 2
# 143 "/home/solom/Repos/riscv-tests/benchmarks/pmp/pmp.c" 1
	sfence.vma
# 0 "" 2
#NO_APP
	ld	a5,-448(s0)
	sd	a5,-400(s0)
	ld	a5,-440(s0)
	sd	a5,-392(s0)
	ld	a5,-432(s0)
	sd	a5,-384(s0)
	nop
	ld	a5,-400(s0)
	sd	a5,-376(s0)
	ld	a5,-392(s0)
	sd	a5,-368(s0)
	ld	a5,-384(s0)
	sd	a5,-360(s0)
	ld	a5,-376(s0)
	sd	a5,-472(s0)
	ld	a5,-368(s0)
	sd	a5,-464(s0)
	ld	a5,-360(s0)
	sd	a5,-456(s0)
	ld	a5,-648(s0)
	sd	a5,-192(s0)
	ld	a5,-656(s0)
	sd	a5,-200(s0)
	ld	a5,-192(s0)
	sd	a5,-208(s0)
	j	.L73
.L100:
	ld	a5,-472(s0)
	sd	a5,-496(s0)
	ld	a5,-464(s0)
	sd	a5,-488(s0)
	ld	a5,-456(s0)
	sd	a5,-480(s0)
	ld	a5,-208(s0)
	sd	a5,-216(s0)
	li	a5,1
	sd	a5,-224(s0)
	j	.L74
.L99:
	ld	a5,-224(s0)
	addi	a4,a5,-1
	ld	a5,-216(s0)
	and	a5,a4,a5
	bne	a5,zero,.L104
	ld	a5,-496(s0)
	sd	a5,-520(s0)
	ld	a5,-488(s0)
	sd	a5,-512(s0)
	ld	a5,-480(s0)
	sd	a5,-504(s0)
	ld	a5,-216(s0)
	sd	a5,-232(s0)
	ld	a5,-224(s0)
	sd	a5,-240(s0)
	ld	a5,-520(s0)
	andi	a5,a5,24
	bne	a5,zero,.L77
	li	a5,1
	j	.L78
.L77:
	ld	a5,-520(s0)
	andi	a4,a5,24
	li	a5,8
	beq	a4,a5,.L79
	li	a5,1
	sd	a5,-248(s0)
	ld	a5,-520(s0)
	andi	a4,a5,24
	li	a5,24
	bne	a4,a5,.L80
	ld	a5,-248(s0)
	slli	a5,a5,1
	sd	a5,-248(s0)
	li	a5,1
	sd	a5,-256(s0)
	j	.L81
.L83:
	ld	a4,-504(s0)
	ld	a5,-256(s0)
	and	a5,a4,a5
	beq	a5,zero,.L105
	ld	a4,-504(s0)
	ld	a5,-256(s0)
	not	a5,a5
	and	a5,a4,a5
	sd	a5,-504(s0)
	ld	a5,-248(s0)
	slli	a5,a5,1
	sd	a5,-248(s0)
	ld	a5,-256(s0)
	slli	a5,a5,1
	sd	a5,-256(s0)
.L81:
	ld	a5,-256(s0)
	bne	a5,zero,.L83
	j	.L80
.L105:
	nop
.L80:
	ld	a5,-504(s0)
	sd	a5,-512(s0)
	ld	a4,-512(s0)
	ld	a5,-248(s0)
	add	a5,a4,a5
	sd	a5,-504(s0)
.L79:
	ld	a5,-512(s0)
	slli	a5,a5,2
	sd	a5,-512(s0)
	ld	a5,-504(s0)
	slli	a5,a5,2
	sd	a5,-504(s0)
	ld	a5,-232(s0)
	sd	a5,-264(s0)
	ld	a4,-264(s0)
	li	a5,4096
	bltu	a4,a5,.L84
	ld	a4,-264(s0)
	li	a5,8192
	bltu	a4,a5,.L85
.L84:
	li	a0,3
	call	exit
.L85:
	lui	a5,%hi(scratch)
	addi	a4,a5,%lo(scratch)
	li	a5,-4096
	add	a4,a4,a5
	ld	a5,-264(s0)
	add	a5,a4,a5
	sd	a5,-232(s0)
	sd	zero,-272(s0)
	sd	zero,-280(s0)
	j	.L87
.L89:
	ld	a4,-512(s0)
	ld	a3,-232(s0)
	ld	a5,-280(s0)
	add	a5,a3,a5
	bgtu	a4,a5,.L88
	ld	a4,-232(s0)
	ld	a5,-280(s0)
	add	a4,a4,a5
	ld	a5,-504(s0)
	bgeu	a4,a5,.L88
	ld	a5,-272(s0)
	addi	a5,a5,4
	sd	a5,-272(s0)
.L88:
	ld	a5,-280(s0)
	addi	a5,a5,4
	sd	a5,-280(s0)
.L87:
	ld	a4,-240(s0)
	ld	a5,-280(s0)
	bgtu	a4,a5,.L89
	ld	a5,-272(s0)
	beq	a5,zero,.L90
	ld	a4,-240(s0)
	ld	a5,-272(s0)
	bgtu	a4,a5,.L91
.L90:
	li	a5,1
	j	.L78
.L91:
	li	a5,0
.L78:
	seqz	a5,a5
	andi	a5,a5,0xff
	sext.w	a4,a5
	lui	a5,%hi(trap_expected)
	sw	a4,%lo(trap_expected)(a5)
	ld	a5,-216(s0)
	sd	a5,-288(s0)
	ld	a5,-224(s0)
	sd	a5,-296(s0)
#APP
# 106 "/home/solom/Repos/riscv-tests/benchmarks/pmp/pmp.c" 1
	csrr a5, mstatus
# 0 "" 2
#NO_APP
	sd	a5,-304(s0)
	ld	a4,-304(s0)
	li	a5,-139264
	addi	a5,a5,2047
	and	a4,a4,a5
	li	a5,135168
	addi	a5,a5,-2048
	or	a5,a4,a5
	sd	a5,-312(s0)
	ld	a4,-296(s0)
	li	a5,8
	beq	a4,a5,.L93
	ld	a4,-296(s0)
	li	a5,8
	bgtu	a4,a5,.L94
	ld	a4,-296(s0)
	li	a5,4
	beq	a4,a5,.L95
	ld	a4,-296(s0)
	li	a5,4
	bgtu	a4,a5,.L94
	ld	a4,-296(s0)
	li	a5,1
	beq	a4,a5,.L96
	ld	a4,-296(s0)
	li	a5,2
	beq	a4,a5,.L97
	j	.L94
.L96:
	ld	a4,-288(s0)
	ld	a5,-312(s0)
#APP
# 108 "/home/solom/Repos/riscv-tests/benchmarks/pmp/pmp.c" 1
	csrrw a5, mstatus, a5; lb x0, (a4); csrw mstatus, a5
# 0 "" 2
#NO_APP
	sd	a5,-312(s0)
	j	.L98
.L97:
	ld	a4,-288(s0)
	ld	a5,-312(s0)
#APP
# 109 "/home/solom/Repos/riscv-tests/benchmarks/pmp/pmp.c" 1
	csrrw a5, mstatus, a5; lh x0, (a4); csrw mstatus, a5
# 0 "" 2
#NO_APP
	sd	a5,-312(s0)
	j	.L98
.L95:
	ld	a4,-288(s0)
	ld	a5,-312(s0)
#APP
# 110 "/home/solom/Repos/riscv-tests/benchmarks/pmp/pmp.c" 1
	csrrw a5, mstatus, a5; lw x0, (a4); csrw mstatus, a5
# 0 "" 2
#NO_APP
	sd	a5,-312(s0)
	j	.L98
.L93:
	ld	a4,-288(s0)
	ld	a5,-312(s0)
#APP
# 112 "/home/solom/Repos/riscv-tests/benchmarks/pmp/pmp.c" 1
	csrrw a5, mstatus, a5; ld x0, (a4); csrw mstatus, a5
# 0 "" 2
#NO_APP
	sd	a5,-312(s0)
	j	.L98
.L94:
.L98:
	nop
	lui	a5,%hi(trap_expected)
	lw	a5,%lo(trap_expected)(a5)
	sext.w	a5,a5
	beq	a5,zero,.L76
	li	a0,2
	call	exit
.L104:
	nop
.L76:
	ld	a5,-224(s0)
	slli	a5,a5,1
	sd	a5,-224(s0)
.L74:
	ld	a4,-224(s0)
	li	a5,8
	bleu	a4,a5,.L99
	nop
	ld	a5,-208(s0)
	addi	a5,a5,4
	sd	a5,-208(s0)
.L73:
	ld	a4,-192(s0)
	ld	a5,-200(s0)
	add	a5,a4,a5
	ld	a4,-208(s0)
	bltu	a4,a5,.L100
	nop
.L103:
	nop
	ld	ra,648(sp)
	ld	s0,640(sp)
	addi	sp,sp,656
	jr	ra
	.size	test_range, .-test_range
	.align	1
	.type	test_ranges, @function
test_ranges:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	li	a5,4
	sd	a5,-24(s0)
	j	.L107
.L108:
	ld	a1,-24(s0)
	ld	a0,-40(s0)
	call	test_range
	ld	a5,-24(s0)
	addi	a5,a5,4
	sd	a5,-24(s0)
.L107:
	ld	a4,-24(s0)
	ld	a5,-48(s0)
	bleu	a4,a5,.L108
	nop
	nop
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	test_ranges, .-test_ranges
	.align	1
	.type	exhaustive_test, @function
exhaustive_test:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	ld	a5,-40(s0)
	sd	a5,-24(s0)
	j	.L110
.L111:
	ld	a4,-40(s0)
	ld	a5,-24(s0)
	sub	a4,a4,a5
	ld	a5,-48(s0)
	add	a5,a4,a5
	mv	a1,a5
	ld	a0,-24(s0)
	call	test_ranges
	ld	a5,-24(s0)
	addi	a5,a5,4
	sd	a5,-24(s0)
.L110:
	ld	a4,-40(s0)
	ld	a5,-48(s0)
	add	a5,a4,a5
	ld	a4,-24(s0)
	bltu	a4,a5,.L111
	nop
	nop
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	exhaustive_test, .-exhaustive_test
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	call	init_pt
	li	a5,32
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	mv	a1,a5
	li	a0,4096
	call	exhaustive_test
	li	a4,8192
	lw	a5,-20(s0)
	subw	a5,a4,a5
	sext.w	a5,a5
	mv	a4,a5
	lw	a5,-20(s0)
	mv	a1,a5
	mv	a0,a4
	call	exhaustive_test
	li	a1,4096
	li	a0,4096
	call	test_range
	li	a5,4096
	addi	a1,a5,-2048
	li	a0,4096
	call	test_range
	li	a5,4096
	addi	a1,a5,-2048
	li	a5,8192
	addi	a0,a5,-2048
	call	test_range
	li	a5,0
	mv	a0,a5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.local	count.1
	.comm	count.1,4,4
	.local	sense.0
	.comm	sense.0,4,4
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
