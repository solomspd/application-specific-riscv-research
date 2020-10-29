	.file	"towers_main.c"
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
	.globl	g_nodeFreeList
	.bss
	.align	3
	.type	g_nodeFreeList, @object
	.size	g_nodeFreeList, 16
g_nodeFreeList:
	.zero	16
	.globl	g_nodePool
	.align	3
	.type	g_nodePool, @object
	.size	g_nodePool, 112
g_nodePool:
	.zero	112
	.text
	.align	1
	.globl	list_getSize
	.type	list_getSize, @function
list_getSize:
	addi	sp,sp,-32
	sd	s0,24(sp)
	addi	s0,sp,32
	sd	a0,-24(s0)
	ld	a5,-24(s0)
	lw	a5,0(a5)
	mv	a0,a5
	ld	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	list_getSize, .-list_getSize
	.align	1
	.globl	list_init
	.type	list_init, @function
list_init:
	addi	sp,sp,-32
	sd	s0,24(sp)
	addi	s0,sp,32
	sd	a0,-24(s0)
	ld	a5,-24(s0)
	sw	zero,0(a5)
	ld	a5,-24(s0)
	sd	zero,8(a5)
	nop
	ld	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	list_init, .-list_init
	.align	1
	.globl	list_push
	.type	list_push, @function
list_push:
	addi	sp,sp,-48
	sd	s0,40(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	mv	a5,a1
	sw	a5,-44(s0)
	lui	a5,%hi(g_nodeFreeList)
	addi	a5,a5,%lo(g_nodeFreeList)
	ld	a5,8(a5)
	sd	a5,-24(s0)
	lui	a5,%hi(g_nodeFreeList)
	addi	a5,a5,%lo(g_nodeFreeList)
	ld	a5,8(a5)
	ld	a4,8(a5)
	lui	a5,%hi(g_nodeFreeList)
	addi	a5,a5,%lo(g_nodeFreeList)
	sd	a4,8(a5)
	ld	a5,-40(s0)
	ld	a4,8(a5)
	ld	a5,-24(s0)
	sd	a4,8(a5)
	ld	a5,-40(s0)
	ld	a4,-24(s0)
	sd	a4,8(a5)
	ld	a5,-40(s0)
	ld	a5,8(a5)
	lw	a4,-44(s0)
	sw	a4,0(a5)
	ld	a5,-40(s0)
	lw	a5,0(a5)
	addiw	a5,a5,1
	sext.w	a4,a5
	ld	a5,-40(s0)
	sw	a4,0(a5)
	nop
	ld	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	list_push, .-list_push
	.align	1
	.globl	list_pop
	.type	list_pop, @function
list_pop:
	addi	sp,sp,-48
	sd	s0,40(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	ld	a5,-40(s0)
	ld	a5,8(a5)
	lw	a5,0(a5)
	sw	a5,-20(s0)
	ld	a5,-40(s0)
	ld	a5,8(a5)
	sd	a5,-32(s0)
	ld	a5,-40(s0)
	ld	a5,8(a5)
	ld	a4,8(a5)
	ld	a5,-40(s0)
	sd	a4,8(a5)
	lui	a5,%hi(g_nodeFreeList)
	addi	a5,a5,%lo(g_nodeFreeList)
	ld	a4,8(a5)
	ld	a5,-32(s0)
	sd	a4,8(a5)
	lui	a5,%hi(g_nodeFreeList)
	addi	a5,a5,%lo(g_nodeFreeList)
	ld	a4,-32(s0)
	sd	a4,8(a5)
	ld	a5,-40(s0)
	lw	a5,0(a5)
	addiw	a5,a5,-1
	sext.w	a4,a5
	ld	a5,-40(s0)
	sw	a4,0(a5)
	lw	a5,-20(s0)
	mv	a0,a5
	ld	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	list_pop, .-list_pop
	.align	1
	.globl	list_clear
	.type	list_clear, @function
list_clear:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	sd	a0,-24(s0)
	j	.L32
.L33:
	ld	a0,-24(s0)
	call	list_pop
.L32:
	ld	a0,-24(s0)
	call	list_getSize
	mv	a5,a0
	bgt	a5,zero,.L33
	nop
	nop
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	list_clear, .-list_clear
	.align	1
	.globl	towers_init
	.type	towers_init, @function
towers_init:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	mv	a5,a1
	sw	a5,-44(s0)
	ld	a5,-40(s0)
	lw	a4,-44(s0)
	sw	a4,0(a5)
	ld	a5,-40(s0)
	sw	zero,4(a5)
	ld	a5,-40(s0)
	addi	a5,a5,8
	mv	a0,a5
	call	list_init
	ld	a5,-40(s0)
	addi	a5,a5,24
	mv	a0,a5
	call	list_init
	ld	a5,-40(s0)
	addi	a5,a5,40
	mv	a0,a5
	call	list_init
	sw	zero,-20(s0)
	j	.L35
.L36:
	ld	a5,-40(s0)
	addi	a3,a5,8
	lw	a4,-44(s0)
	lw	a5,-20(s0)
	subw	a5,a4,a5
	sext.w	a5,a5
	mv	a1,a5
	mv	a0,a3
	call	list_push
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L35:
	lw	a4,-20(s0)
	lw	a5,-44(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L36
	nop
	nop
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	towers_init, .-towers_init
	.align	1
	.globl	towers_clear
	.type	towers_clear, @function
towers_clear:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	sd	a0,-24(s0)
	ld	a5,-24(s0)
	addi	a5,a5,8
	mv	a0,a5
	call	list_clear
	ld	a5,-24(s0)
	addi	a5,a5,24
	mv	a0,a5
	call	list_clear
	ld	a5,-24(s0)
	addi	a5,a5,40
	mv	a0,a5
	call	list_clear
	ld	a5,-24(s0)
	lw	a5,0(a5)
	mv	a1,a5
	ld	a0,-24(s0)
	call	towers_init
	nop
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	towers_clear, .-towers_clear
	.align	1
	.globl	towers_solve_h
	.type	towers_solve_h, @function
towers_solve_h:
	addi	sp,sp,-80
	sd	ra,72(sp)
	sd	s0,64(sp)
	addi	s0,sp,80
	sd	a0,-40(s0)
	mv	a5,a1
	sd	a2,-56(s0)
	sd	a3,-64(s0)
	sd	a4,-72(s0)
	sw	a5,-44(s0)
	lw	a5,-44(s0)
	sext.w	a4,a5
	li	a5,1
	bne	a4,a5,.L39
	ld	a0,-56(s0)
	call	list_pop
	mv	a5,a0
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	mv	a1,a5
	ld	a0,-72(s0)
	call	list_push
	ld	a5,-40(s0)
	lw	a5,4(a5)
	addiw	a5,a5,1
	sext.w	a4,a5
	ld	a5,-40(s0)
	sw	a4,4(a5)
	j	.L41
.L39:
	lw	a5,-44(s0)
	addiw	a5,a5,-1
	sext.w	a5,a5
	ld	a4,-64(s0)
	ld	a3,-72(s0)
	ld	a2,-56(s0)
	mv	a1,a5
	ld	a0,-40(s0)
	call	towers_solve_h
	ld	a4,-72(s0)
	ld	a3,-64(s0)
	ld	a2,-56(s0)
	li	a1,1
	ld	a0,-40(s0)
	call	towers_solve_h
	lw	a5,-44(s0)
	addiw	a5,a5,-1
	sext.w	a5,a5
	ld	a4,-72(s0)
	ld	a3,-56(s0)
	ld	a2,-64(s0)
	mv	a1,a5
	ld	a0,-40(s0)
	call	towers_solve_h
.L41:
	nop
	ld	ra,72(sp)
	ld	s0,64(sp)
	addi	sp,sp,80
	jr	ra
	.size	towers_solve_h, .-towers_solve_h
	.align	1
	.globl	towers_solve
	.type	towers_solve, @function
towers_solve:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	sd	a0,-24(s0)
	ld	a5,-24(s0)
	lw	a1,0(a5)
	ld	a5,-24(s0)
	addi	a2,a5,8
	ld	a5,-24(s0)
	addi	a3,a5,24
	ld	a5,-24(s0)
	addi	a5,a5,40
	mv	a4,a5
	ld	a0,-24(s0)
	call	towers_solve_h
	nop
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	towers_solve, .-towers_solve
	.align	1
	.globl	towers_verify
	.type	towers_verify, @function
towers_verify:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	sw	zero,-28(s0)
	ld	a5,-40(s0)
	addi	a5,a5,8
	mv	a0,a5
	call	list_getSize
	mv	a5,a0
	beq	a5,zero,.L44
	li	a5,2
	j	.L45
.L44:
	ld	a5,-40(s0)
	addi	a5,a5,24
	mv	a0,a5
	call	list_getSize
	mv	a5,a0
	beq	a5,zero,.L46
	li	a5,3
	j	.L45
.L46:
	ld	a5,-40(s0)
	addi	a5,a5,40
	mv	a0,a5
	call	list_getSize
	mv	a5,a0
	mv	a4,a5
	ld	a5,-40(s0)
	lw	a5,0(a5)
	beq	a4,a5,.L47
	li	a5,4
	j	.L45
.L47:
	ld	a5,-40(s0)
	ld	a5,48(a5)
	sd	a5,-24(s0)
	j	.L48
.L50:
	lw	a5,-28(s0)
	addiw	a5,a5,1
	sw	a5,-28(s0)
	ld	a5,-24(s0)
	lw	a4,0(a5)
	lw	a5,-28(s0)
	sext.w	a5,a5
	beq	a5,a4,.L49
	li	a5,5
	j	.L45
.L49:
	ld	a5,-24(s0)
	ld	a5,8(a5)
	sd	a5,-24(s0)
.L48:
	ld	a5,-24(s0)
	bne	a5,zero,.L50
	ld	a5,-40(s0)
	lw	a3,4(a5)
	ld	a5,-40(s0)
	lw	a5,0(a5)
	li	a4,1
	sllw	a5,a4,a5
	sext.w	a5,a5
	addiw	a5,a5,-1
	sext.w	a5,a5
	mv	a4,a3
	beq	a4,a5,.L51
	li	a5,6
	j	.L45
.L51:
	li	a5,0
.L45:
	mv	a0,a5
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	towers_verify, .-towers_verify
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-96
	sd	ra,88(sp)
	sd	s0,80(sp)
	addi	s0,sp,96
	mv	a5,a0
	sd	a1,-96(s0)
	sw	a5,-84(s0)
	lui	a5,%hi(g_nodeFreeList)
	addi	a0,a5,%lo(g_nodeFreeList)
	call	list_init
	lui	a5,%hi(g_nodeFreeList)
	addi	a5,a5,%lo(g_nodeFreeList)
	lui	a4,%hi(g_nodePool)
	addi	a4,a4,%lo(g_nodePool)
	sd	a4,8(a5)
	lui	a5,%hi(g_nodeFreeList)
	addi	a5,a5,%lo(g_nodeFreeList)
	li	a4,7
	sw	a4,0(a5)
	lui	a5,%hi(g_nodePool)
	addi	a5,a5,%lo(g_nodePool)
	sd	zero,104(a5)
	lui	a5,%hi(g_nodePool)
	addi	a5,a5,%lo(g_nodePool)
	li	a4,99
	sw	a4,96(a5)
	sw	zero,-20(s0)
	j	.L53
.L54:
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sext.w	a5,a5
	slli	a4,a5,4
	lui	a5,%hi(g_nodePool)
	addi	a5,a5,%lo(g_nodePool)
	add	a4,a4,a5
	lui	a5,%hi(g_nodePool)
	addi	a3,a5,%lo(g_nodePool)
	lw	a5,-20(s0)
	slli	a5,a5,4
	add	a5,a3,a5
	sd	a4,8(a5)
	lui	a5,%hi(g_nodePool)
	addi	a4,a5,%lo(g_nodePool)
	lw	a5,-20(s0)
	slli	a5,a5,4
	add	a5,a4,a5
	lw	a4,-20(s0)
	sw	a4,0(a5)
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L53:
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,5
	ble	a4,a5,.L54
	addi	a5,s0,-80
	li	a1,7
	mv	a0,a5
	call	towers_init
	addi	a5,s0,-80
	mv	a0,a5
	call	towers_clear
	li	a0,1
	call	setStats
	addi	a5,s0,-80
	mv	a0,a5
	call	towers_solve
	li	a0,0
	call	setStats
	addi	a5,s0,-80
	mv	a0,a5
	call	towers_verify
	mv	a5,a0
	mv	a0,a5
	ld	ra,88(sp)
	ld	s0,80(sp)
	addi	sp,sp,96
	jr	ra
	.size	main, .-main
	.local	count.1
	.comm	count.1,4,4
	.local	sense.0
	.comm	sense.0,4,4
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
