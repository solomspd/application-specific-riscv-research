	.file	"dhrystone.c"
	.option nopic
	.text
	.align	1
	.globl	Proc_6
	.type	Proc_6, @function
Proc_6:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	mv	a5,a0
	sd	a1,-32(s0)
	sw	a5,-20(s0)
	ld	a5,-32(s0)
	lw	a4,-20(s0)
	sw	a4,0(a5)
	lw	a5,-20(s0)
	mv	a0,a5
	call	Func_3
	mv	a5,a0
	bne	a5,zero,.L2
	ld	a5,-32(s0)
	li	a4,3
	sw	a4,0(a5)
.L2:
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,4
	bgtu	a4,a5,.L3
	lwu	a5,-20(s0)
	slli	a4,a5,2
	lui	a5,%hi(.L5)
	addi	a5,a5,%lo(.L5)
	add	a5,a4,a5
	lw	a5,0(a5)
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L5:
	.word	.L9
	.word	.L8
	.word	.L7
	.word	.L12
	.word	.L4
	.text
.L9:
	ld	a5,-32(s0)
	sw	zero,0(a5)
	j	.L3
.L8:
	lui	a5,%hi(Int_Glob)
	lw	a5,%lo(Int_Glob)(a5)
	mv	a4,a5
	li	a5,100
	ble	a4,a5,.L10
	ld	a5,-32(s0)
	sw	zero,0(a5)
	j	.L3
.L10:
	ld	a5,-32(s0)
	li	a4,3
	sw	a4,0(a5)
	j	.L3
.L7:
	ld	a5,-32(s0)
	li	a4,1
	sw	a4,0(a5)
	j	.L3
.L4:
	ld	a5,-32(s0)
	li	a4,2
	sw	a4,0(a5)
	j	.L3
.L12:
	nop
.L3:
	nop
	mv	a0,a5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	Proc_6, .-Proc_6
	.align	1
	.globl	Proc_7
	.type	Proc_7, @function
Proc_7:
	addi	sp,sp,-48
	sd	s0,40(sp)
	addi	s0,sp,48
	mv	a5,a0
	mv	a4,a1
	sd	a2,-48(s0)
	sw	a5,-36(s0)
	mv	a5,a4
	sw	a5,-40(s0)
	lw	a5,-36(s0)
	addiw	a5,a5,2
	sw	a5,-20(s0)
	lw	a4,-40(s0)
	lw	a5,-20(s0)
	addw	a5,a4,a5
	sext.w	a4,a5
	ld	a5,-48(s0)
	sw	a4,0(a5)
	nop
	mv	a0,a5
	ld	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	Proc_7, .-Proc_7
	.align	1
	.globl	Proc_8
	.type	Proc_8, @function
Proc_8:
	addi	sp,sp,-64
	sd	s0,56(sp)
	addi	s0,sp,64
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	mv	a5,a2
	mv	a4,a3
	sw	a5,-52(s0)
	mv	a5,a4
	sw	a5,-56(s0)
	lw	a5,-52(s0)
	addiw	a5,a5,5
	sw	a5,-24(s0)
	lw	a5,-24(s0)
	slli	a5,a5,2
	ld	a4,-40(s0)
	add	a5,a4,a5
	lw	a4,-56(s0)
	sw	a4,0(a5)
	lw	a5,-24(s0)
	slli	a5,a5,2
	ld	a4,-40(s0)
	add	a4,a4,a5
	lw	a5,-24(s0)
	addi	a5,a5,1
	slli	a5,a5,2
	ld	a3,-40(s0)
	add	a5,a3,a5
	lw	a4,0(a4)
	sw	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,30
	slli	a5,a5,2
	ld	a4,-40(s0)
	add	a5,a4,a5
	lw	a4,-24(s0)
	sw	a4,0(a5)
	lw	a5,-24(s0)
	sw	a5,-20(s0)
	j	.L15
.L16:
	lw	a4,-24(s0)
	li	a5,200
	mul	a5,a4,a5
	ld	a4,-48(s0)
	add	a4,a4,a5
	lw	a5,-20(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,-24(s0)
	sw	a4,0(a5)
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L15:
	lw	a5,-24(s0)
	addiw	a5,a5,1
	sext.w	a4,a5
	lw	a5,-20(s0)
	sext.w	a5,a5
	ble	a5,a4,.L16
	lw	a4,-24(s0)
	li	a5,200
	mul	a5,a4,a5
	ld	a4,-48(s0)
	add	a4,a4,a5
	lw	a5,-24(s0)
	addiw	a5,a5,-1
	sext.w	a5,a5
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,0(a5)
	lw	a3,-24(s0)
	li	a5,200
	mul	a5,a3,a5
	ld	a3,-48(s0)
	add	a3,a3,a5
	lw	a5,-24(s0)
	addiw	a5,a5,-1
	sext.w	a5,a5
	addiw	a4,a4,1
	sext.w	a4,a4
	slli	a5,a5,2
	add	a5,a3,a5
	sw	a4,0(a5)
	lw	a5,-24(s0)
	slli	a5,a5,2
	ld	a4,-40(s0)
	add	a5,a4,a5
	lw	a3,-24(s0)
	li	a4,200
	mul	a3,a3,a4
	li	a4,4096
	addi	a4,a4,-96
	add	a4,a3,a4
	ld	a3,-48(s0)
	add	a3,a3,a4
	lw	a4,0(a5)
	lw	a5,-24(s0)
	slli	a5,a5,2
	add	a5,a3,a5
	sw	a4,0(a5)
	lui	a5,%hi(Int_Glob)
	li	a4,5
	sw	a4,%lo(Int_Glob)(a5)
	nop
	mv	a0,a5
	ld	s0,56(sp)
	addi	sp,sp,64
	jr	ra
	.size	Proc_8, .-Proc_8
	.align	1
	.globl	Func_1
	.type	Func_1, @function
Func_1:
	addi	sp,sp,-48
	sd	s0,40(sp)
	addi	s0,sp,48
	mv	a5,a0
	mv	a4,a1
	sb	a5,-36(s0)
	mv	a5,a4
	sb	a5,-40(s0)
	lbu	a5,-36(s0)
	sb	a5,-17(s0)
	lbu	a5,-17(s0)
	sb	a5,-18(s0)
	lbu	a4,-18(s0)
	lbu	a5,-40(s0)
	andi	a4,a4,0xff
	andi	a5,a5,0xff
	beq	a4,a5,.L18
	li	a5,0
	j	.L19
.L18:
	lui	a5,%hi(Ch_1_Glob)
	lbu	a4,-17(s0)
	sb	a4,%lo(Ch_1_Glob)(a5)
	li	a5,1
.L19:
	mv	a0,a5
	ld	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	Func_1, .-Func_1
	.align	1
	.globl	Func_2
	.type	Func_2, @function
Func_2:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	li	a5,2
	sw	a5,-20(s0)
	j	.L21
.L22:
	lw	a5,-20(s0)
	ld	a4,-40(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	sext.w	a3,a5
	lw	a5,-20(s0)
	addi	a5,a5,1
	ld	a4,-48(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	sext.w	a5,a5
	mv	a1,a5
	mv	a0,a3
	call	Func_1
	mv	a5,a0
	sext.w	a5,a5
	bne	a5,zero,.L21
	li	a5,65
	sb	a5,-21(s0)
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L21:
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,2
	ble	a4,a5,.L22
	lbu	a5,-21(s0)
	andi	a4,a5,0xff
	li	a5,86
	bleu	a4,a5,.L23
	lbu	a5,-21(s0)
	andi	a4,a5,0xff
	li	a5,89
	bgtu	a4,a5,.L23
	li	a5,7
	sw	a5,-20(s0)
.L23:
	lbu	a5,-21(s0)
	andi	a4,a5,0xff
	li	a5,82
	bne	a4,a5,.L24
	li	a5,1
	j	.L25
.L24:
	ld	a1,-48(s0)
	ld	a0,-40(s0)
	call	strcmp
	mv	a5,a0
	ble	a5,zero,.L26
	lw	a5,-20(s0)
	addiw	a5,a5,7
	sw	a5,-20(s0)
	lui	a5,%hi(Int_Glob)
	lw	a4,-20(s0)
	sw	a4,%lo(Int_Glob)(a5)
	li	a5,1
	j	.L25
.L26:
	li	a5,0
.L25:
	mv	a0,a5
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	Func_2, .-Func_2
	.align	1
	.globl	Func_3
	.type	Func_3, @function
Func_3:
	addi	sp,sp,-48
	sd	s0,40(sp)
	addi	s0,sp,48
	mv	a5,a0
	sw	a5,-36(s0)
	lw	a5,-36(s0)
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,2
	bne	a4,a5,.L28
	li	a5,1
	j	.L29
.L28:
	li	a5,0
.L29:
	mv	a0,a5
	ld	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	Func_3, .-Func_3
	.align	1
	.globl	debug_printf
	.type	debug_printf, @function
debug_printf:
	addi	sp,sp,-96
	sd	s0,24(sp)
	addi	s0,sp,32
	sd	a0,-24(s0)
	sd	a1,8(s0)
	sd	a2,16(s0)
	sd	a3,24(s0)
	sd	a4,32(s0)
	sd	a5,40(s0)
	sd	a6,48(s0)
	sd	a7,56(s0)
	nop
	ld	s0,24(sp)
	addi	sp,sp,96
	jr	ra
	.size	debug_printf, .-debug_printf
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
