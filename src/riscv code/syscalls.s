	.file	"syscalls.c"
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
	.type	threadsense.5, @object
	.size	threadsense.5, 4
threadsense.5:
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
	lui	a5,%tprel_hi(threadsense.5)
	add	a5,a5,tp,%tprel_add(threadsense.5)
	lw	a5,%tprel_lo(threadsense.5)(a5)
	seqz	a5,a5
	andi	a5,a5,0xff
	sext.w	a4,a5
	lui	a5,%tprel_hi(threadsense.5)
	add	a5,a5,tp,%tprel_add(threadsense.5)
	sw	a4,%tprel_lo(threadsense.5)(a5)
	lui	a5,%hi(count.2)
	li	a4,1
	addi	a5,a5,%lo(count.2)
	fence iorw,ow; amoadd.w.aq a3,a4,0(a5)
	sext.w	a5,a3
	sext.w	a4,a5
	lw	a5,-20(s0)
	addiw	a5,a5,-1
	sext.w	a5,a5
	bne	a4,a5,.L18
	lui	a5,%hi(count.2)
	sw	zero,%lo(count.2)(a5)
	lui	a5,%tprel_hi(threadsense.5)
	add	a5,a5,tp,%tprel_add(threadsense.5)
	lw	a4,%tprel_lo(threadsense.5)(a5)
	lui	a5,%hi(sense.1)
	sw	a4,%lo(sense.1)(a5)
	j	.L16
.L18:
	nop
.L17:
	lui	a5,%hi(sense.1)
	lw	a5,%lo(sense.1)(a5)
	sext.w	a4,a5
	lui	a5,%tprel_hi(threadsense.5)
	add	a5,a5,tp,%tprel_add(threadsense.5)
	lw	a5,%tprel_lo(threadsense.5)(a5)
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
	.align	1
	.type	syscall, @function
syscall:
	addi	sp,sp,-176
	sd	s0,168(sp)
	addi	s0,sp,176
	sd	a0,-136(s0)
	sd	a1,-144(s0)
	sd	a2,-152(s0)
	sd	a3,-160(s0)
	addi	a5,s0,-16
	sd	a5,-168(s0)
	ld	a5,-168(s0)
	addi	a5,a5,-112
	addi	a5,a5,63
	srli	a5,a5,6
	slli	a5,a5,6
	ld	a4,-136(s0)
	sd	a4,0(a5)
	ld	a4,-144(s0)
	sd	a4,8(a5)
	ld	a4,-152(s0)
	sd	a4,16(a5)
	ld	a4,-160(s0)
	sd	a4,24(a5)
	fence	iorw,iorw
	mv	a3,a5
	lui	a4,%hi(tohost)
	sd	a3,%lo(tohost)(a4)
	nop
.L26:
	lui	a4,%hi(fromhost)
	ld	a4,%lo(fromhost)(a4)
	beq	a4,zero,.L26
	lui	a4,%hi(fromhost)
	sd	zero,%lo(fromhost)(a4)
	fence	iorw,iorw
	ld	a5,0(a5)
	mv	a0,a5
	ld	s0,168(sp)
	addi	sp,sp,176
	jr	ra
	.size	syscall, .-syscall
	.local	counters
	.comm	counters,16,8
	.local	counter_names
	.comm	counter_names,16,8
	.section	.rodata
	.align	3
.LC0:
	.string	"mcycle"
	.align	3
.LC1:
	.string	"minstret"
	.text
	.align	1
	.globl	setStats
	.type	setStats, @function
setStats:
	addi	sp,sp,-80
	sd	s0,72(sp)
	addi	s0,sp,80
	mv	a5,a0
	sw	a5,-68(s0)
	sw	zero,-36(s0)
.L29:
	lw	a5,-36(s0)
	sext.w	a4,a5
	li	a5,1
	bgt	a4,a5,.L29
#APP
# 50 "/home/solom/Repos/riscv-tests/benchmarks/common/syscalls.c" 1
	csrr a5, mcycle
# 0 "" 2
#NO_APP
	sd	a5,-48(s0)
	ld	a5,-48(s0)
	sd	a5,-24(s0)
	lw	a5,-68(s0)
	sext.w	a5,a5
	bne	a5,zero,.L30
	lui	a5,%hi(counters)
	addi	a4,a5,%lo(counters)
	lw	a5,-36(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	ld	a5,0(a5)
	ld	a4,-24(s0)
	sub	a5,a4,a5
	sd	a5,-24(s0)
	lui	a5,%hi(counter_names)
	addi	a4,a5,%lo(counter_names)
	lw	a5,-36(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	lui	a4,%hi(.LC0)
	addi	a4,a4,%lo(.LC0)
	sd	a4,0(a5)
.L30:
	lw	a5,-36(s0)
	addiw	a4,a5,1
	sw	a4,-36(s0)
	lui	a4,%hi(counters)
	addi	a4,a4,%lo(counters)
	slli	a5,a5,3
	add	a5,a4,a5
	ld	a4,-24(s0)
	sd	a4,0(a5)
.L31:
	lw	a5,-36(s0)
	sext.w	a4,a5
	li	a5,1
	bgt	a4,a5,.L31
#APP
# 51 "/home/solom/Repos/riscv-tests/benchmarks/common/syscalls.c" 1
	csrr a5, minstret
# 0 "" 2
#NO_APP
	sd	a5,-56(s0)
	ld	a5,-56(s0)
	sd	a5,-32(s0)
	lw	a5,-68(s0)
	sext.w	a5,a5
	bne	a5,zero,.L32
	lui	a5,%hi(counters)
	addi	a4,a5,%lo(counters)
	lw	a5,-36(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	ld	a5,0(a5)
	ld	a4,-32(s0)
	sub	a5,a4,a5
	sd	a5,-32(s0)
	lui	a5,%hi(counter_names)
	addi	a4,a5,%lo(counter_names)
	lw	a5,-36(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	lui	a4,%hi(.LC1)
	addi	a4,a4,%lo(.LC1)
	sd	a4,0(a5)
.L32:
	lw	a5,-36(s0)
	addiw	a4,a5,1
	sw	a4,-36(s0)
	lui	a4,%hi(counters)
	addi	a4,a4,%lo(counters)
	slli	a5,a5,3
	add	a5,a4,a5
	ld	a4,-32(s0)
	sd	a4,0(a5)
	nop
	ld	s0,72(sp)
	addi	sp,sp,80
	jr	ra
	.size	setStats, .-setStats
	.align	1
	.globl	tohost_exit
	.type	tohost_exit, @function
tohost_exit:
	addi	sp,sp,-32
	sd	s0,24(sp)
	addi	s0,sp,32
	sd	a0,-24(s0)
	ld	a5,-24(s0)
	slli	a5,a5,1
	ori	a4,a5,1
	lui	a5,%hi(tohost)
	sd	a4,%lo(tohost)(a5)
.L34:
	j	.L34
	.size	tohost_exit, .-tohost_exit
	.align	1
	.weak	handle_trap
	.type	handle_trap, @function
handle_trap:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	sd	a2,-40(s0)
	li	a0,1337
	call	tohost_exit
	.size	handle_trap, .-handle_trap
	.align	1
	.globl	exit
	.type	exit, @function
exit:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	mv	a5,a0
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	mv	a0,a5
	call	tohost_exit
	.size	exit, .-exit
	.align	1
	.globl	abort
	.type	abort, @function
abort:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	addi	s0,sp,16
	li	a0,134
	call	exit
	.size	abort, .-abort
	.align	1
	.globl	printstr
	.type	printstr, @function
printstr:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	ld	s1,-40(s0)
	ld	a0,-40(s0)
	call	strlen
	mv	a5,a0
	mv	a3,a5
	mv	a2,s1
	li	a1,1
	li	a0,64
	call	syscall
	nop
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	addi	sp,sp,48
	jr	ra
	.size	printstr, .-printstr
	.align	1
	.weak	thread_entry
	.type	thread_entry, @function
thread_entry:
	addi	sp,sp,-32
	sd	s0,24(sp)
	addi	s0,sp,32
	mv	a5,a0
	mv	a4,a1
	sw	a5,-20(s0)
	mv	a5,a4
	sw	a5,-24(s0)
.L40:
	lw	a5,-20(s0)
	sext.w	a5,a5
	bne	a5,zero,.L40
	nop
	nop
	ld	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	thread_entry, .-thread_entry
	.section	.rodata
	.align	3
.LC2:
	.string	"Implement main(), foo!\n"
	.text
	.align	1
	.weak	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	mv	a5,a0
	sd	a1,-32(s0)
	sw	a5,-20(s0)
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	printstr
	li	a5,-1
	mv	a0,a5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.align	1
	.type	init_tls, @function
init_tls:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	lui	a5,%hi(_tdata_end)
	addi	a4,a5,%lo(_tdata_end)
	lui	a5,%hi(_tdata_begin)
	addi	a5,a5,%lo(_tdata_begin)
	sub	a5,a4,a5
	sd	a5,-24(s0)
	mv	a4,tp
	ld	a2,-24(s0)
	lui	a5,%hi(_tdata_begin)
	addi	a1,a5,%lo(_tdata_begin)
	mv	a0,a4
	call	memcpy
	lui	a5,%hi(_tbss_end)
	addi	a4,a5,%lo(_tbss_end)
	lui	a5,%hi(_tdata_end)
	addi	a5,a5,%lo(_tdata_end)
	sub	a5,a4,a5
	sd	a5,-32(s0)
	mv	a4,tp
	ld	a5,-24(s0)
	add	a5,a4,a5
	ld	a2,-32(s0)
	li	a1,0
	mv	a0,a5
	call	memset
	nop
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	init_tls, .-init_tls
	.section	.rodata
	.align	3
.LC3:
	.string	"%s = %d\n"
	.text
	.align	1
	.globl	_init
	.type	_init, @function
_init:
	addi	sp,sp,-176
	sd	ra,168(sp)
	sd	s0,160(sp)
	sd	s1,152(sp)
	addi	s0,sp,176
	mv	a5,a0
	mv	a4,a1
	sw	a5,-164(s0)
	mv	a5,a4
	sw	a5,-168(s0)
	addi	a5,s0,-32
	sd	a5,-176(s0)
	ld	a5,-176(s0)
	addi	a5,a5,-128
	addi	a5,a5,63
	srli	a5,a5,6
	slli	s1,a5,6
	call	init_tls
	lw	a4,-168(s0)
	lw	a5,-164(s0)
	mv	a1,a4
	mv	a0,a5
	call	thread_entry
	li	a1,0
	li	a0,0
	call	main
	mv	a5,a0
	sw	a5,-48(s0)
	sd	s1,-40(s0)
	sw	zero,-44(s0)
	j	.L45
.L47:
	lui	a5,%hi(counters)
	addi	a4,a5,%lo(counters)
	lw	a5,-44(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	ld	a5,0(a5)
	beq	a5,zero,.L46
	lui	a5,%hi(counter_names)
	addi	a4,a5,%lo(counter_names)
	lw	a5,-44(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	ld	a2,0(a5)
	lui	a5,%hi(counters)
	addi	a4,a5,%lo(counters)
	lw	a5,-44(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	ld	a5,0(a5)
	mv	a3,a5
	lui	a5,%hi(.LC3)
	addi	a1,a5,%lo(.LC3)
	ld	a0,-40(s0)
	call	sprintf
	mv	a5,a0
	mv	a4,a5
	ld	a5,-40(s0)
	add	a5,a5,a4
	sd	a5,-40(s0)
.L46:
	lw	a5,-44(s0)
	addiw	a5,a5,1
	sw	a5,-44(s0)
.L45:
	lw	a5,-44(s0)
	sext.w	a4,a5
	li	a5,1
	ble	a4,a5,.L47
	ld	a5,-40(s0)
	beq	s1,a5,.L48
	mv	a0,s1
	call	printstr
.L48:
	lw	a5,-48(s0)
	mv	a0,a5
	call	exit
	.size	_init, .-_init
	.section	.tbss
	.align	6
	.type	buf.4, @object
	.size	buf.4, 64
buf.4:
	.zero	64
	.align	2
	.type	buflen.3, @object
	.size	buflen.3, 4
buflen.3:
	.zero	4
	.text
	.align	1
	.globl	putchar
	.type	putchar, @function
putchar:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	mv	a5,a0
	sw	a5,-20(s0)
	lui	a5,%tprel_hi(buflen.3)
	add	a5,a5,tp,%tprel_add(buflen.3)
	lw	a5,%tprel_lo(buflen.3)(a5)
	addiw	a4,a5,1
	sext.w	a3,a4
	lui	a4,%tprel_hi(buflen.3)
	add	a4,a4,tp,%tprel_add(buflen.3)
	sw	a3,%tprel_lo(buflen.3)(a4)
	lw	a4,-20(s0)
	andi	a4,a4,0xff
	lui	a3,%tprel_hi(buf.4)
	add	a3,a3,tp,%tprel_add(buf.4)
	addi	a3,a3,%tprel_lo(buf.4)
	add	a5,a3,a5
	sb	a4,0(a5)
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,10
	beq	a4,a5,.L50
	lui	a5,%tprel_hi(buflen.3)
	add	a5,a5,tp,%tprel_add(buflen.3)
	lw	a5,%tprel_lo(buflen.3)(a5)
	mv	a4,a5
	li	a5,64
	bne	a4,a5,.L51
.L50:
	lui	a5,%tprel_hi(buf.4)
	add	a5,a5,tp,%tprel_add(buf.4)
	addi	a4,a5,%tprel_lo(buf.4)
	lui	a5,%tprel_hi(buflen.3)
	add	a5,a5,tp,%tprel_add(buflen.3)
	lw	a5,%tprel_lo(buflen.3)(a5)
	mv	a3,a5
	mv	a2,a4
	li	a1,1
	li	a0,64
	call	syscall
	lui	a5,%tprel_hi(buflen.3)
	add	a5,a5,tp,%tprel_add(buflen.3)
	sw	zero,%tprel_lo(buflen.3)(a5)
.L51:
	li	a5,0
	mv	a0,a5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	putchar, .-putchar
	.align	1
	.globl	printhex
	.type	printhex, @function
printhex:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	addi	s0,sp,64
	sd	a0,-56(s0)
	sw	zero,-20(s0)
	j	.L54
.L57:
	ld	a5,-56(s0)
	andi	a5,a5,0xff
	andi	a5,a5,15
	andi	a4,a5,0xff
	ld	a5,-56(s0)
	andi	a3,a5,15
	li	a5,9
	bgtu	a3,a5,.L55
	li	a5,48
	j	.L56
.L55:
	li	a5,87
.L56:
	li	a2,15
	lw	a3,-20(s0)
	subw	a3,a2,a3
	sext.w	a3,a3
	addw	a5,a5,a4
	andi	a4,a5,0xff
	addi	a5,s0,-16
	add	a5,a5,a3
	sb	a4,-24(a5)
	ld	a5,-56(s0)
	srli	a5,a5,4
	sd	a5,-56(s0)
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L54:
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,15
	ble	a4,a5,.L57
	sb	zero,-24(s0)
	addi	a5,s0,-40
	mv	a0,a5
	call	printstr
	nop
	ld	ra,56(sp)
	ld	s0,48(sp)
	addi	sp,sp,64
	jr	ra
	.size	printhex, .-printhex
	.align	1
	.type	printnum, @function
printnum:
	addi	sp,sp,-336
	sd	ra,328(sp)
	sd	s0,320(sp)
	addi	s0,sp,336
	sd	a0,-296(s0)
	sd	a1,-304(s0)
	sd	a2,-312(s0)
	mv	a2,a3
	mv	a3,a4
	mv	a4,a5
	mv	a5,a2
	sw	a5,-316(s0)
	mv	a5,a3
	sw	a5,-320(s0)
	mv	a5,a4
	sw	a5,-324(s0)
	sw	zero,-20(s0)
.L61:
	lwu	a5,-316(s0)
	ld	a4,-312(s0)
	remu	a3,a4,a5
	lw	a5,-20(s0)
	addiw	a4,a5,1
	sw	a4,-20(s0)
	sext.w	a4,a3
	slli	a5,a5,2
	addi	a3,s0,-16
	add	a5,a3,a5
	sw	a4,-264(a5)
	lwu	a5,-316(s0)
	ld	a4,-312(s0)
	bltu	a4,a5,.L69
	lwu	a5,-316(s0)
	ld	a4,-312(s0)
	divu	a5,a4,a5
	sd	a5,-312(s0)
	j	.L61
.L69:
	nop
	j	.L62
.L63:
	lw	a5,-324(s0)
	ld	a4,-296(s0)
	ld	a1,-304(s0)
	mv	a0,a5
	jalr	a4
.L62:
	lw	a5,-320(s0)
	addiw	a4,a5,-1
	sw	a4,-320(s0)
	lw	a4,-20(s0)
	sext.w	a4,a4
	blt	a4,a5,.L63
	j	.L64
.L67:
	lw	a5,-20(s0)
	slli	a5,a5,2
	addi	a4,s0,-16
	add	a5,a4,a5
	lw	a4,-264(a5)
	lw	a5,-20(s0)
	slli	a5,a5,2
	addi	a3,s0,-16
	add	a5,a3,a5
	lw	a5,-264(a5)
	mv	a3,a5
	li	a5,9
	bleu	a3,a5,.L65
	li	a5,87
	j	.L66
.L65:
	li	a5,48
.L66:
	addw	a5,a5,a4
	sext.w	a5,a5
	sext.w	a5,a5
	ld	a4,-296(s0)
	ld	a1,-304(s0)
	mv	a0,a5
	jalr	a4
.L64:
	lw	a5,-20(s0)
	addiw	a4,a5,-1
	sw	a4,-20(s0)
	bgt	a5,zero,.L67
	nop
	nop
	ld	ra,328(sp)
	ld	s0,320(sp)
	addi	sp,sp,336
	jr	ra
	.size	printnum, .-printnum
	.align	1
	.type	getuint, @function
getuint:
	addi	sp,sp,-32
	sd	s0,24(sp)
	addi	s0,sp,32
	sd	a0,-24(s0)
	mv	a5,a1
	sw	a5,-28(s0)
	lw	a5,-28(s0)
	sext.w	a4,a5
	li	a5,1
	ble	a4,a5,.L71
	ld	a5,-24(s0)
	ld	a5,0(a5)
	addi	a3,a5,8
	ld	a4,-24(s0)
	sd	a3,0(a4)
	ld	a5,0(a5)
	j	.L72
.L71:
	lw	a5,-28(s0)
	sext.w	a5,a5
	beq	a5,zero,.L73
	ld	a5,-24(s0)
	ld	a5,0(a5)
	addi	a3,a5,8
	ld	a4,-24(s0)
	sd	a3,0(a4)
	ld	a5,0(a5)
	j	.L72
.L73:
	ld	a5,-24(s0)
	ld	a5,0(a5)
	addi	a3,a5,8
	ld	a4,-24(s0)
	sd	a3,0(a4)
	lw	a5,0(a5)
	slli	a5,a5,32
	srli	a5,a5,32
.L72:
	mv	a0,a5
	ld	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	getuint, .-getuint
	.align	1
	.type	getint, @function
getint:
	addi	sp,sp,-32
	sd	s0,24(sp)
	addi	s0,sp,32
	sd	a0,-24(s0)
	mv	a5,a1
	sw	a5,-28(s0)
	lw	a5,-28(s0)
	sext.w	a4,a5
	li	a5,1
	ble	a4,a5,.L75
	ld	a5,-24(s0)
	ld	a5,0(a5)
	addi	a3,a5,8
	ld	a4,-24(s0)
	sd	a3,0(a4)
	ld	a5,0(a5)
	j	.L76
.L75:
	lw	a5,-28(s0)
	sext.w	a5,a5
	beq	a5,zero,.L77
	ld	a5,-24(s0)
	ld	a5,0(a5)
	addi	a3,a5,8
	ld	a4,-24(s0)
	sd	a3,0(a4)
	ld	a5,0(a5)
	j	.L76
.L77:
	ld	a5,-24(s0)
	ld	a5,0(a5)
	addi	a3,a5,8
	ld	a4,-24(s0)
	sd	a3,0(a4)
	lw	a5,0(a5)
.L76:
	mv	a0,a5
	ld	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	getint, .-getint
	.section	.rodata
	.align	3
.LC4:
	.string	"(null)"
	.text
	.align	1
	.type	vprintfmt, @function
vprintfmt:
	addi	sp,sp,-112
	sd	ra,104(sp)
	sd	s0,96(sp)
	sd	s1,88(sp)
	sd	s2,80(sp)
	addi	s0,sp,112
	sd	a0,-88(s0)
	sd	a1,-96(s0)
	sd	a2,-104(s0)
	sd	a3,-112(s0)
	j	.L79
.L82:
	beq	s1,zero,.L121
	ld	a5,-104(s0)
	addi	a5,a5,1
	sd	a5,-104(s0)
	ld	a5,-88(s0)
	ld	a1,-96(s0)
	mv	a0,s1
	jalr	a5
.L79:
	ld	a5,-104(s0)
	lbu	a5,0(a5)
	sext.w	s1,a5
	mv	a4,s1
	li	a5,37
	bne	a4,a5,.L82
	ld	a5,-104(s0)
	addi	a5,a5,1
	sd	a5,-104(s0)
	ld	a5,-104(s0)
	sd	a5,-72(s0)
	li	a5,32
	sb	a5,-57(s0)
	li	a5,-1
	sw	a5,-52(s0)
	li	a5,-1
	sw	a5,-56(s0)
	sw	zero,-48(s0)
	sw	zero,-76(s0)
.L83:
	ld	a5,-104(s0)
	addi	a4,a5,1
	sd	a4,-104(s0)
	lbu	a5,0(a5)
	sext.w	s1,a5
	addiw	a3,s1,-35
	sext.w	a4,a3
	li	a5,85
	bgtu	a4,a5,.L84
	slli	a5,a3,32
	srli	a5,a5,32
	slli	a4,a5,2
	lui	a5,%hi(.L86)
	addi	a5,a5,%lo(.L86)
	add	a5,a4,a5
	lw	a5,0(a5)
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L86:
	.word	.L100
	.word	.L84
	.word	.L99
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L98
	.word	.L84
	.word	.L84
	.word	.L97
	.word	.L96
	.word	.L84
	.word	.L95
	.word	.L94
	.word	.L94
	.word	.L94
	.word	.L94
	.word	.L94
	.word	.L94
	.word	.L94
	.word	.L94
	.word	.L94
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L93
	.word	.L92
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L84
	.word	.L91
	.word	.L84
	.word	.L84
	.word	.L90
	.word	.L89
	.word	.L84
	.word	.L84
	.word	.L88
	.word	.L84
	.word	.L87
	.word	.L84
	.word	.L84
	.word	.L85
	.text
.L97:
	li	a5,45
	sb	a5,-57(s0)
	j	.L83
.L95:
	li	a5,48
	sb	a5,-57(s0)
	j	.L83
.L94:
	sw	zero,-56(s0)
.L102:
	lw	a4,-56(s0)
	mv	a5,a4
	slliw	a5,a5,2
	addw	a5,a5,a4
	slliw	a5,a5,1
	sext.w	a5,a5
	addw	a5,s1,a5
	sext.w	a5,a5
	addiw	a5,a5,-48
	sw	a5,-56(s0)
	ld	a5,-104(s0)
	lbu	a5,0(a5)
	sext.w	s1,a5
	mv	a4,s1
	li	a5,47
	ble	a4,a5,.L122
	mv	a4,s1
	li	a5,57
	bgt	a4,a5,.L122
	ld	a5,-104(s0)
	addi	a5,a5,1
	sd	a5,-104(s0)
	j	.L102
.L98:
	ld	a5,-112(s0)
	addi	a4,a5,8
	sd	a4,-112(s0)
	lw	a5,0(a5)
	sw	a5,-56(s0)
	j	.L103
.L96:
	lw	a5,-52(s0)
	sext.w	a5,a5
	bge	a5,zero,.L83
	sw	zero,-52(s0)
	j	.L83
.L100:
	li	a5,1
	sw	a5,-76(s0)
	j	.L83
.L122:
	nop
.L103:
	lw	a5,-52(s0)
	sext.w	a5,a5
	bge	a5,zero,.L83
	lw	a5,-56(s0)
	sw	a5,-52(s0)
	li	a5,-1
	sw	a5,-56(s0)
	j	.L83
.L91:
	lw	a5,-48(s0)
	addiw	a5,a5,1
	sw	a5,-48(s0)
	j	.L83
.L93:
	ld	a5,-112(s0)
	addi	a4,a5,8
	sd	a4,-112(s0)
	lw	a5,0(a5)
	ld	a4,-88(s0)
	ld	a1,-96(s0)
	mv	a0,a5
	jalr	a4
	j	.L106
.L88:
	ld	a5,-112(s0)
	addi	a4,a5,8
	sd	a4,-112(s0)
	ld	s2,0(a5)
	bne	s2,zero,.L107
	lui	a5,%hi(.LC4)
	addi	s2,a5,%lo(.LC4)
.L107:
	lw	a5,-52(s0)
	sext.w	a5,a5
	ble	a5,zero,.L111
	lbu	a5,-57(s0)
	andi	a4,a5,0xff
	li	a5,45
	beq	a4,a5,.L111
	lw	s1,-52(s0)
	lw	a5,-56(s0)
	mv	a1,a5
	mv	a0,s2
	call	strnlen
	mv	a5,a0
	sext.w	a5,a5
	subw	a5,s1,a5
	sext.w	a5,a5
	sw	a5,-52(s0)
	j	.L109
.L110:
	lbu	a5,-57(s0)
	sext.w	a5,a5
	ld	a4,-88(s0)
	ld	a1,-96(s0)
	mv	a0,a5
	jalr	a4
	lw	a5,-52(s0)
	addiw	a5,a5,-1
	sw	a5,-52(s0)
.L109:
	lw	a5,-52(s0)
	sext.w	a5,a5
	bgt	a5,zero,.L110
	j	.L111
.L113:
	ld	a5,-88(s0)
	ld	a1,-96(s0)
	mv	a0,s1
	jalr	a5
	addi	s2,s2,1
	lw	a5,-52(s0)
	addiw	a5,a5,-1
	sw	a5,-52(s0)
.L111:
	lbu	a5,0(s2)
	sext.w	s1,a5
	beq	s1,zero,.L114
	lw	a5,-56(s0)
	sext.w	a5,a5
	blt	a5,zero,.L113
	lw	a5,-56(s0)
	addiw	a5,a5,-1
	sw	a5,-56(s0)
	lw	a5,-56(s0)
	sext.w	a5,a5
	bge	a5,zero,.L113
	j	.L114
.L115:
	ld	a5,-88(s0)
	ld	a1,-96(s0)
	li	a0,32
	jalr	a5
	lw	a5,-52(s0)
	addiw	a5,a5,-1
	sw	a5,-52(s0)
.L114:
	lw	a5,-52(s0)
	sext.w	a5,a5
	bgt	a5,zero,.L115
	j	.L106
.L92:
	lw	a4,-48(s0)
	addi	a5,s0,-112
	mv	a1,a4
	mv	a0,a5
	call	getint
	mv	a5,a0
	sd	a5,-40(s0)
	ld	a5,-40(s0)
	bge	a5,zero,.L116
	ld	a5,-88(s0)
	ld	a1,-96(s0)
	li	a0,45
	jalr	a5
	ld	a5,-40(s0)
	neg	a5,a5
	sd	a5,-40(s0)
.L116:
	li	a5,10
	sw	a5,-44(s0)
	j	.L117
.L87:
	li	a5,10
	sw	a5,-44(s0)
	j	.L118
.L90:
	li	a5,8
	sw	a5,-44(s0)
	j	.L118
.L89:
	li	a5,1
	sw	a5,-48(s0)
	ld	a5,-88(s0)
	ld	a1,-96(s0)
	li	a0,48
	jalr	a5
	ld	a5,-88(s0)
	ld	a1,-96(s0)
	li	a0,120
	jalr	a5
.L85:
	li	a5,16
	sw	a5,-44(s0)
.L118:
	lw	a4,-48(s0)
	addi	a5,s0,-112
	mv	a1,a4
	mv	a0,a5
	call	getuint
	sd	a0,-40(s0)
.L117:
	lw	a3,-44(s0)
	lbu	a5,-57(s0)
	sext.w	a5,a5
	lw	a4,-52(s0)
	ld	a2,-40(s0)
	ld	a1,-96(s0)
	ld	a0,-88(s0)
	call	printnum
	j	.L106
.L99:
	ld	a5,-88(s0)
	ld	a1,-96(s0)
	mv	a0,s1
	jalr	a5
	j	.L106
.L84:
	ld	a5,-88(s0)
	ld	a1,-96(s0)
	li	a0,37
	jalr	a5
	ld	a5,-72(s0)
	sd	a5,-104(s0)
	nop
.L106:
	j	.L79
.L121:
	nop
	ld	ra,104(sp)
	ld	s0,96(sp)
	ld	s1,88(sp)
	ld	s2,80(sp)
	addi	sp,sp,112
	jr	ra
	.size	vprintfmt, .-vprintfmt
	.align	1
	.globl	printf
	.type	printf, @function
printf:
	addi	sp,sp,-112
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	sd	a1,8(s0)
	sd	a2,16(s0)
	sd	a3,24(s0)
	sd	a4,32(s0)
	sd	a5,40(s0)
	sd	a6,48(s0)
	sd	a7,56(s0)
	addi	a5,s0,64
	sd	a5,-48(s0)
	ld	a5,-48(s0)
	addi	a5,a5,-56
	sd	a5,-24(s0)
	ld	a5,-24(s0)
	mv	a3,a5
	ld	a2,-40(s0)
	li	a1,0
	lui	a5,%hi(putchar)
	addi	a0,a5,%lo(putchar)
	call	vprintfmt
	li	a5,0
	mv	a0,a5
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,112
	jr	ra
	.size	printf, .-printf
	.align	1
	.type	sprintf_putch.0, @function
sprintf_putch.0:
	addi	sp,sp,-64
	sd	s0,56(sp)
	addi	s0,sp,64
	mv	a5,a0
	sd	a1,-48(s0)
	sw	a5,-36(s0)
	sd	t2,-56(s0)
	ld	a5,-48(s0)
	sd	a5,-24(s0)
	ld	a5,-24(s0)
	ld	a5,0(a5)
	lw	a4,-36(s0)
	andi	a4,a4,0xff
	sb	a4,0(a5)
	ld	a5,-24(s0)
	ld	a5,0(a5)
	addi	a4,a5,1
	ld	a5,-24(s0)
	sd	a4,0(a5)
	nop
	ld	s0,56(sp)
	addi	sp,sp,64
	jr	ra
	.size	sprintf_putch.0, .-sprintf_putch.0
	.globl	__riscv_flush_icache
	.align	1
	.globl	sprintf
	.type	sprintf, @function
sprintf:
	addi	sp,sp,-272
	sd	ra,216(sp)
	sd	s0,208(sp)
	addi	s0,sp,224
	sd	a0,-200(s0)
	sd	a1,-208(s0)
	sd	a2,0(s0)
	sd	a3,8(s0)
	sd	a4,16(s0)
	sd	a5,24(s0)
	sd	a6,32(s0)
	sd	a7,40(s0)
	addi	a5,s0,48
	sd	a5,-216(s0)
	ld	a5,-216(s0)
	sd	a5,-40(s0)
	addi	a5,s0,-184
	addi	a3,s0,-184
	li	a4,919
	sw	a4,0(a5)
	li	a4,25407488
	addi	a4,a4,771
	sw	a4,4(a5)
	li	a4,17018880
	addi	a4,a4,899
	sw	a4,8(a5)
	li	a4,196608
	addi	a4,a4,103
	sw	a4,12(a5)
	sd	a3,16(a5)
	lui	a4,%hi(sprintf_putch.0)
	addi	a4,a4,%lo(sprintf_putch.0)
	sd	a4,24(a5)
	addi	a4,a5,144
	li	a2,0
	mv	a1,a4
	mv	a0,a5
	call	__riscv_flush_icache
	ld	a5,-200(s0)
	sd	a5,-24(s0)
	addi	a5,s0,48
	sd	a5,-216(s0)
	ld	a5,-216(s0)
	addi	a5,a5,-48
	sd	a5,-32(s0)
	ld	a4,-32(s0)
	addi	a5,s0,-184
	mv	a0,a5
	addi	a5,s0,-200
	mv	a3,a4
	ld	a2,-208(s0)
	mv	a1,a5
	call	vprintfmt
	ld	a5,-200(s0)
	sb	zero,0(a5)
	ld	a4,-200(s0)
	ld	a5,-24(s0)
	sub	a5,a4,a5
	sext.w	a5,a5
	mv	a0,a5
	ld	ra,216(sp)
	ld	s0,208(sp)
	addi	sp,sp,272
	jr	ra
	.size	sprintf, .-sprintf
	.align	1
	.globl	memcpy
	.type	memcpy, @function
memcpy:
	addi	sp,sp,-80
	sd	s0,72(sp)
	addi	s0,sp,80
	sd	a0,-56(s0)
	sd	a1,-64(s0)
	sd	a2,-72(s0)
	ld	a4,-56(s0)
	ld	a5,-64(s0)
	or	a4,a4,a5
	ld	a5,-72(s0)
	or	a5,a4,a5
	andi	a5,a5,7
	bne	a5,zero,.L129
	ld	a5,-64(s0)
	sd	a5,-24(s0)
	ld	a5,-56(s0)
	sd	a5,-32(s0)
	j	.L130
.L131:
	ld	a4,-24(s0)
	addi	a5,a4,8
	sd	a5,-24(s0)
	ld	a5,-32(s0)
	addi	a3,a5,8
	sd	a3,-32(s0)
	ld	a4,0(a4)
	sd	a4,0(a5)
.L130:
	ld	a4,-56(s0)
	ld	a5,-72(s0)
	add	a5,a4,a5
	ld	a4,-32(s0)
	bltu	a4,a5,.L131
	j	.L132
.L129:
	ld	a5,-64(s0)
	sd	a5,-40(s0)
	ld	a5,-56(s0)
	sd	a5,-48(s0)
	j	.L133
.L134:
	ld	a4,-40(s0)
	addi	a5,a4,1
	sd	a5,-40(s0)
	ld	a5,-48(s0)
	addi	a3,a5,1
	sd	a3,-48(s0)
	lbu	a4,0(a4)
	sb	a4,0(a5)
.L133:
	ld	a4,-56(s0)
	ld	a5,-72(s0)
	add	a5,a4,a5
	ld	a4,-48(s0)
	bltu	a4,a5,.L134
.L132:
	ld	a5,-56(s0)
	mv	a0,a5
	ld	s0,72(sp)
	addi	sp,sp,80
	jr	ra
	.size	memcpy, .-memcpy
	.align	1
	.globl	memset
	.type	memset, @function
memset:
	addi	sp,sp,-80
	sd	s0,72(sp)
	addi	s0,sp,80
	sd	a0,-56(s0)
	mv	a5,a1
	sd	a2,-72(s0)
	sw	a5,-60(s0)
	ld	a4,-56(s0)
	ld	a5,-72(s0)
	or	a5,a4,a5
	andi	a5,a5,7
	bne	a5,zero,.L137
	lw	a5,-60(s0)
	andi	a5,a5,255
	sd	a5,-40(s0)
	ld	a5,-40(s0)
	slli	a5,a5,8
	ld	a4,-40(s0)
	or	a5,a4,a5
	sd	a5,-40(s0)
	ld	a5,-40(s0)
	slli	a5,a5,16
	ld	a4,-40(s0)
	or	a5,a4,a5
	sd	a5,-40(s0)
	ld	a5,-40(s0)
	slli	a5,a5,32
	ld	a4,-40(s0)
	or	a5,a4,a5
	sd	a5,-40(s0)
	ld	a5,-56(s0)
	sd	a5,-24(s0)
	j	.L138
.L139:
	ld	a5,-24(s0)
	addi	a4,a5,8
	sd	a4,-24(s0)
	ld	a4,-40(s0)
	sd	a4,0(a5)
.L138:
	ld	a4,-56(s0)
	ld	a5,-72(s0)
	add	a5,a4,a5
	ld	a4,-24(s0)
	bltu	a4,a5,.L139
	j	.L140
.L137:
	ld	a5,-56(s0)
	sd	a5,-32(s0)
	j	.L141
.L142:
	ld	a5,-32(s0)
	addi	a4,a5,1
	sd	a4,-32(s0)
	lw	a4,-60(s0)
	andi	a4,a4,0xff
	sb	a4,0(a5)
.L141:
	ld	a4,-56(s0)
	ld	a5,-72(s0)
	add	a5,a4,a5
	ld	a4,-32(s0)
	bltu	a4,a5,.L142
.L140:
	ld	a5,-56(s0)
	mv	a0,a5
	ld	s0,72(sp)
	addi	sp,sp,80
	jr	ra
	.size	memset, .-memset
	.align	1
	.globl	strlen
	.type	strlen, @function
strlen:
	addi	sp,sp,-48
	sd	s0,40(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	ld	a5,-40(s0)
	sd	a5,-24(s0)
	j	.L145
.L146:
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
.L145:
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	bne	a5,zero,.L146
	ld	a4,-24(s0)
	ld	a5,-40(s0)
	sub	a5,a4,a5
	mv	a0,a5
	ld	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	strlen, .-strlen
	.align	1
	.globl	strnlen
	.type	strnlen, @function
strnlen:
	addi	sp,sp,-48
	sd	s0,40(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	ld	a5,-40(s0)
	sd	a5,-24(s0)
	j	.L149
.L151:
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
.L149:
	ld	a5,-48(s0)
	addi	a4,a5,-1
	sd	a4,-48(s0)
	beq	a5,zero,.L150
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	bne	a5,zero,.L151
.L150:
	ld	a4,-24(s0)
	ld	a5,-40(s0)
	sub	a5,a4,a5
	mv	a0,a5
	ld	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	strnlen, .-strnlen
	.align	1
	.globl	strcmp
	.type	strcmp, @function
strcmp:
	addi	sp,sp,-48
	sd	s0,40(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	sd	a1,-48(s0)
.L155:
	ld	a5,-40(s0)
	addi	a4,a5,1
	sd	a4,-40(s0)
	lbu	a5,0(a5)
	sb	a5,-17(s0)
	ld	a5,-48(s0)
	addi	a4,a5,1
	sd	a4,-48(s0)
	lbu	a5,0(a5)
	sb	a5,-18(s0)
	lbu	a5,-17(s0)
	andi	a5,a5,0xff
	beq	a5,zero,.L154
	lbu	a4,-17(s0)
	lbu	a5,-18(s0)
	andi	a4,a4,0xff
	andi	a5,a5,0xff
	beq	a4,a5,.L155
.L154:
	lbu	a5,-17(s0)
	sext.w	a4,a5
	lbu	a5,-18(s0)
	sext.w	a5,a5
	subw	a5,a4,a5
	sext.w	a5,a5
	mv	a0,a5
	ld	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	strcmp, .-strcmp
	.align	1
	.globl	strcpy
	.type	strcpy, @function
strcpy:
	addi	sp,sp,-48
	sd	s0,40(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	ld	a5,-40(s0)
	sd	a5,-24(s0)
	nop
.L158:
	ld	a4,-48(s0)
	addi	a5,a4,1
	sd	a5,-48(s0)
	ld	a5,-24(s0)
	addi	a3,a5,1
	sd	a3,-24(s0)
	lbu	a4,0(a4)
	sb	a4,0(a5)
	lbu	a5,0(a5)
	bne	a5,zero,.L158
	ld	a5,-40(s0)
	mv	a0,a5
	ld	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	strcpy, .-strcpy
	.align	1
	.globl	atol
	.type	atol, @function
atol:
	addi	sp,sp,-48
	sd	s0,40(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	sd	zero,-24(s0)
	sw	zero,-28(s0)
	j	.L161
.L162:
	ld	a5,-40(s0)
	addi	a5,a5,1
	sd	a5,-40(s0)
.L161:
	ld	a5,-40(s0)
	lbu	a5,0(a5)
	mv	a4,a5
	li	a5,32
	beq	a4,a5,.L162
	ld	a5,-40(s0)
	lbu	a5,0(a5)
	mv	a4,a5
	li	a5,45
	beq	a4,a5,.L163
	ld	a5,-40(s0)
	lbu	a5,0(a5)
	mv	a4,a5
	li	a5,43
	bne	a4,a5,.L165
.L163:
	ld	a5,-40(s0)
	lbu	a5,0(a5)
	sext.w	a4,a5
	li	a5,45
	sub	a5,a4,a5
	seqz	a5,a5
	andi	a5,a5,0xff
	sw	a5,-28(s0)
	ld	a5,-40(s0)
	addi	a5,a5,1
	sd	a5,-40(s0)
	j	.L165
.L166:
	ld	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,1
	sd	a5,-24(s0)
	ld	a5,-40(s0)
	addi	a4,a5,1
	sd	a4,-40(s0)
	lbu	a5,0(a5)
	sext.w	a5,a5
	addiw	a5,a5,-48
	sext.w	a5,a5
	mv	a4,a5
	ld	a5,-24(s0)
	add	a5,a5,a4
	sd	a5,-24(s0)
.L165:
	ld	a5,-40(s0)
	lbu	a5,0(a5)
	bne	a5,zero,.L166
	lw	a5,-28(s0)
	sext.w	a5,a5
	beq	a5,zero,.L167
	ld	a5,-24(s0)
	neg	a5,a5
	j	.L169
.L167:
	ld	a5,-24(s0)
.L169:
	mv	a0,a5
	ld	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	atol, .-atol
	.local	count.2
	.comm	count.2,4,4
	.local	sense.1
	.comm	sense.1,4,4
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"x",@progbits
