	.file	"vvadd_main.c"
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
	.globl	input1_data
	.data
	.align	3
	.type	input1_data, @object
	.size	input1_data, 1200
input1_data:
	.word	41
	.word	833
	.word	564
	.word	187
	.word	749
	.word	350
	.word	132
	.word	949
	.word	584
	.word	805
	.word	621
	.word	6
	.word	931
	.word	890
	.word	392
	.word	694
	.word	961
	.word	110
	.word	116
	.word	296
	.word	426
	.word	314
	.word	659
	.word	774
	.word	319
	.word	678
	.word	875
	.word	376
	.word	474
	.word	938
	.word	539
	.word	569
	.word	203
	.word	280
	.word	759
	.word	606
	.word	511
	.word	657
	.word	195
	.word	81
	.word	267
	.word	229
	.word	337
	.word	944
	.word	902
	.word	241
	.word	913
	.word	826
	.word	933
	.word	985
	.word	195
	.word	960
	.word	566
	.word	350
	.word	649
	.word	657
	.word	181
	.word	111
	.word	859
	.word	65
	.word	288
	.word	349
	.word	141
	.word	905
	.word	886
	.word	264
	.word	576
	.word	979
	.word	761
	.word	241
	.word	478
	.word	499
	.word	403
	.word	222
	.word	444
	.word	721
	.word	676
	.word	317
	.word	224
	.word	937
	.word	288
	.word	119
	.word	615
	.word	606
	.word	389
	.word	351
	.word	455
	.word	278
	.word	367
	.word	358
	.word	584
	.word	62
	.word	985
	.word	403
	.word	346
	.word	517
	.word	559
	.word	908
	.word	775
	.word	255
	.word	778
	.word	598
	.word	143
	.word	33
	.word	125
	.word	941
	.word	933
	.word	799
	.word	553
	.word	431
	.word	648
	.word	952
	.word	287
	.word	19
	.word	49
	.word	86
	.word	95
	.word	441
	.word	587
	.word	614
	.word	382
	.word	280
	.word	808
	.word	971
	.word	819
	.word	344
	.word	450
	.word	512
	.word	965
	.word	347
	.word	808
	.word	882
	.word	537
	.word	946
	.word	701
	.word	356
	.word	567
	.word	891
	.word	22
	.word	568
	.word	665
	.word	423
	.word	434
	.word	158
	.word	2
	.word	84
	.word	247
	.word	49
	.word	435
	.word	792
	.word	869
	.word	486
	.word	414
	.word	369
	.word	548
	.word	518
	.word	888
	.word	682
	.word	284
	.word	264
	.word	499
	.word	290
	.word	897
	.word	215
	.word	731
	.word	688
	.word	251
	.word	786
	.word	555
	.word	302
	.word	528
	.word	544
	.word	322
	.word	947
	.word	287
	.word	824
	.word	304
	.word	788
	.word	733
	.word	959
	.word	366
	.word	722
	.word	294
	.word	975
	.word	653
	.word	748
	.word	91
	.word	378
	.word	105
	.word	102
	.word	381
	.word	651
	.word	825
	.word	840
	.word	356
	.word	148
	.word	54
	.word	140
	.word	955
	.word	343
	.word	533
	.word	757
	.word	521
	.word	837
	.word	592
	.word	13
	.word	173
	.word	63
	.word	121
	.word	133
	.word	758
	.word	372
	.word	951
	.word	39
	.word	129
	.word	110
	.word	847
	.word	437
	.word	255
	.word	269
	.word	409
	.word	628
	.word	399
	.word	549
	.word	753
	.word	564
	.word	171
	.word	19
	.word	727
	.word	501
	.word	777
	.word	43
	.word	753
	.word	81
	.word	202
	.word	853
	.word	153
	.word	760
	.word	357
	.word	943
	.word	922
	.word	328
	.word	496
	.word	442
	.word	516
	.word	641
	.word	276
	.word	786
	.word	113
	.word	842
	.word	907
	.word	275
	.word	237
	.word	32
	.word	784
	.word	565
	.word	357
	.word	803
	.word	819
	.word	751
	.word	280
	.word	85
	.word	458
	.word	454
	.word	710
	.word	459
	.word	41
	.word	253
	.word	377
	.word	508
	.word	700
	.word	860
	.word	480
	.word	741
	.word	499
	.word	709
	.word	49
	.word	371
	.word	873
	.word	945
	.word	992
	.word	526
	.word	721
	.word	435
	.word	232
	.word	497
	.word	697
	.word	30
	.word	348
	.word	250
	.word	350
	.word	250
	.word	573
	.word	784
	.word	749
	.word	502
	.word	823
	.word	826
	.word	170
	.word	160
	.globl	input2_data
	.align	3
	.type	input2_data, @object
	.size	input2_data, 1200
input2_data:
	.word	454
	.word	335
	.word	1
	.word	989
	.word	365
	.word	572
	.word	64
	.word	153
	.word	216
	.word	140
	.word	210
	.word	572
	.word	339
	.word	593
	.word	898
	.word	228
	.word	12
	.word	883
	.word	750
	.word	646
	.word	500
	.word	436
	.word	701
	.word	812
	.word	981
	.word	150
	.word	696
	.word	564
	.word	272
	.word	258
	.word	647
	.word	509
	.word	88
	.word	703
	.word	669
	.word	375
	.word	551
	.word	936
	.word	592
	.word	569
	.word	952
	.word	800
	.word	584
	.word	643
	.word	368
	.word	489
	.word	328
	.word	313
	.word	592
	.word	388
	.word	543
	.word	649
	.word	979
	.word	997
	.word	814
	.word	79
	.word	208
	.word	998
	.word	629
	.word	847
	.word	704
	.word	997
	.word	253
	.word	715
	.word	430
	.word	415
	.word	538
	.word	700
	.word	4
	.word	494
	.word	100
	.word	864
	.word	693
	.word	416
	.word	296
	.word	285
	.word	620
	.word	78
	.word	351
	.word	540
	.word	646
	.word	169
	.word	527
	.word	289
	.word	796
	.word	801
	.word	720
	.word	758
	.word	745
	.word	92
	.word	989
	.word	271
	.word	853
	.word	788
	.word	531
	.word	222
	.word	461
	.word	241
	.word	358
	.word	332
	.word	684
	.word	740
	.word	446
	.word	311
	.word	743
	.word	557
	.word	479
	.word	557
	.word	925
	.word	796
	.word	357
	.word	891
	.word	666
	.word	514
	.word	557
	.word	870
	.word	853
	.word	440
	.word	61
	.word	678
	.word	396
	.word	9
	.word	17
	.word	170
	.word	291
	.word	380
	.word	536
	.word	185
	.word	917
	.word	539
	.word	983
	.word	887
	.word	54
	.word	612
	.word	951
	.word	479
	.word	151
	.word	7
	.word	641
	.word	335
	.word	730
	.word	95
	.word	728
	.word	280
	.word	395
	.word	688
	.word	911
	.word	476
	.word	815
	.word	729
	.word	265
	.word	127
	.word	236
	.word	214
	.word	180
	.word	6
	.word	503
	.word	596
	.word	173
	.word	643
	.word	346
	.word	599
	.word	68
	.word	849
	.word	658
	.word	619
	.word	121
	.word	131
	.word	828
	.word	667
	.word	433
	.word	487
	.word	753
	.word	125
	.word	626
	.word	14
	.word	10
	.word	403
	.word	106
	.word	703
	.word	818
	.word	964
	.word	406
	.word	874
	.word	856
	.word	86
	.word	60
	.word	660
	.word	667
	.word	153
	.word	121
	.word	98
	.word	412
	.word	236
	.word	12
	.word	423
	.word	965
	.word	216
	.word	621
	.word	361
	.word	921
	.word	715
	.word	647
	.word	299
	.word	886
	.word	682
	.word	36
	.word	493
	.word	551
	.word	537
	.word	969
	.word	643
	.word	434
	.word	415
	.word	303
	.word	438
	.word	860
	.word	203
	.word	478
	.word	988
	.word	675
	.word	719
	.word	990
	.word	338
	.word	450
	.word	633
	.word	155
	.word	646
	.word	452
	.word	427
	.word	509
	.word	988
	.word	426
	.word	12
	.word	483
	.word	142
	.word	339
	.word	390
	.word	50
	.word	171
	.word	601
	.word	105
	.word	968
	.word	121
	.word	879
	.word	81
	.word	870
	.word	600
	.word	603
	.word	871
	.word	887
	.word	610
	.word	404
	.word	234
	.word	745
	.word	526
	.word	275
	.word	441
	.word	226
	.word	752
	.word	943
	.word	726
	.word	709
	.word	201
	.word	54
	.word	758
	.word	53
	.word	397
	.word	41
	.word	141
	.word	416
	.word	747
	.word	219
	.word	478
	.word	770
	.word	180
	.word	482
	.word	691
	.word	725
	.word	173
	.word	186
	.word	914
	.word	1
	.word	963
	.word	247
	.word	464
	.word	362
	.word	521
	.word	233
	.word	120
	.word	40
	.word	779
	.word	195
	.word	161
	.word	743
	.word	439
	.word	355
	.word	403
	.word	141
	.word	633
	.globl	verify_data
	.align	3
	.type	verify_data, @object
	.size	verify_data, 1200
verify_data:
	.word	495
	.word	1168
	.word	565
	.word	1176
	.word	1114
	.word	922
	.word	196
	.word	1102
	.word	800
	.word	945
	.word	831
	.word	578
	.word	1270
	.word	1483
	.word	1290
	.word	922
	.word	973
	.word	993
	.word	866
	.word	942
	.word	926
	.word	750
	.word	1360
	.word	1586
	.word	1300
	.word	828
	.word	1571
	.word	940
	.word	746
	.word	1196
	.word	1186
	.word	1078
	.word	291
	.word	983
	.word	1428
	.word	981
	.word	1062
	.word	1593
	.word	787
	.word	650
	.word	1219
	.word	1029
	.word	921
	.word	1587
	.word	1270
	.word	730
	.word	1241
	.word	1139
	.word	1525
	.word	1373
	.word	738
	.word	1609
	.word	1545
	.word	1347
	.word	1463
	.word	736
	.word	389
	.word	1109
	.word	1488
	.word	912
	.word	992
	.word	1346
	.word	394
	.word	1620
	.word	1316
	.word	679
	.word	1114
	.word	1679
	.word	765
	.word	735
	.word	578
	.word	1363
	.word	1096
	.word	638
	.word	740
	.word	1006
	.word	1296
	.word	395
	.word	575
	.word	1477
	.word	934
	.word	288
	.word	1142
	.word	895
	.word	1185
	.word	1152
	.word	1175
	.word	1036
	.word	1112
	.word	450
	.word	1573
	.word	333
	.word	1838
	.word	1191
	.word	877
	.word	739
	.word	1020
	.word	1149
	.word	1133
	.word	587
	.word	1462
	.word	1338
	.word	589
	.word	344
	.word	868
	.word	1498
	.word	1412
	.word	1356
	.word	1478
	.word	1227
	.word	1005
	.word	1843
	.word	953
	.word	533
	.word	606
	.word	956
	.word	948
	.word	881
	.word	648
	.word	1292
	.word	778
	.word	289
	.word	825
	.word	1141
	.word	1110
	.word	724
	.word	986
	.word	697
	.word	1882
	.word	886
	.word	1791
	.word	1769
	.word	591
	.word	1558
	.word	1652
	.word	835
	.word	718
	.word	898
	.word	663
	.word	903
	.word	1395
	.word	518
	.word	1162
	.word	438
	.word	397
	.word	772
	.word	1158
	.word	525
	.word	1250
	.word	1521
	.word	1134
	.word	613
	.word	650
	.word	583
	.word	728
	.word	524
	.word	1391
	.word	1278
	.word	457
	.word	907
	.word	845
	.word	889
	.word	965
	.word	1064
	.word	1389
	.word	1307
	.word	372
	.word	917
	.word	1383
	.word	969
	.word	961
	.word	1031
	.word	1075
	.word	1072
	.word	913
	.word	838
	.word	314
	.word	1191
	.word	839
	.word	1662
	.word	1184
	.word	1686
	.word	700
	.word	1849
	.word	1509
	.word	834
	.word	151
	.word	1038
	.word	772
	.word	255
	.word	502
	.word	749
	.word	1237
	.word	1076
	.word	368
	.word	571
	.word	1019
	.word	356
	.word	1576
	.word	704
	.word	1454
	.word	1472
	.word	1168
	.word	1136
	.word	1478
	.word	695
	.word	209
	.word	556
	.word	672
	.word	670
	.word	1727
	.word	1015
	.word	1385
	.word	454
	.word	432
	.word	548
	.word	1707
	.word	640
	.word	733
	.word	1257
	.word	1084
	.word	1347
	.word	1389
	.word	887
	.word	1203
	.word	1197
	.word	326
	.word	665
	.word	1179
	.word	928
	.word	1286
	.word	1031
	.word	1179
	.word	93
	.word	685
	.word	995
	.word	492
	.word	1150
	.word	407
	.word	1114
	.word	1523
	.word	433
	.word	1464
	.word	563
	.word	1395
	.word	722
	.word	1146
	.word	1386
	.word	716
	.word	1713
	.word	1794
	.word	885
	.word	641
	.word	266
	.word	1529
	.word	1091
	.word	632
	.word	1244
	.word	1045
	.word	1503
	.word	1223
	.word	811
	.word	1167
	.word	655
	.word	764
	.word	1217
	.word	94
	.word	650
	.word	418
	.word	649
	.word	1116
	.word	1607
	.word	699
	.word	1219
	.word	1269
	.word	889
	.word	531
	.word	1062
	.word	1598
	.word	1118
	.word	1178
	.word	1440
	.word	722
	.word	1398
	.word	479
	.word	961
	.word	1059
	.word	551
	.word	581
	.word	370
	.word	390
	.word	1029
	.word	768
	.word	945
	.word	1492
	.word	941
	.word	1178
	.word	1229
	.word	311
	.word	793
	.text
	.align	1
	.globl	vvadd
	.type	vvadd, @function
vvadd:
	addi	sp,sp,-64
	sd	s0,56(sp)
	addi	s0,sp,64
	mv	a5,a0
	sd	a1,-48(s0)
	sd	a2,-56(s0)
	sd	a3,-64(s0)
	sw	a5,-36(s0)
	sw	zero,-20(s0)
	j	.L26
.L27:
	lw	a5,-20(s0)
	slli	a5,a5,2
	ld	a4,-48(s0)
	add	a5,a4,a5
	lw	a3,0(a5)
	lw	a5,-20(s0)
	slli	a5,a5,2
	ld	a4,-56(s0)
	add	a5,a4,a5
	lw	a4,0(a5)
	lw	a5,-20(s0)
	slli	a5,a5,2
	ld	a2,-64(s0)
	add	a5,a2,a5
	addw	a4,a3,a4
	sext.w	a4,a4
	sw	a4,0(a5)
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L26:
	lw	a4,-20(s0)
	lw	a5,-36(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L27
	nop
	nop
	ld	s0,56(sp)
	addi	sp,sp,64
	jr	ra
	.size	vvadd, .-vvadd
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-1232
	sd	ra,1224(sp)
	sd	s0,1216(sp)
	addi	s0,sp,1232
	mv	a5,a0
	sd	a1,-1232(s0)
	sw	a5,-1220(s0)
	li	a0,1
	call	setStats
	addi	a5,s0,-1216
	mv	a3,a5
	lui	a5,%hi(input2_data)
	addi	a2,a5,%lo(input2_data)
	lui	a5,%hi(input1_data)
	addi	a1,a5,%lo(input1_data)
	li	a0,300
	call	vvadd
	li	a0,0
	call	setStats
	addi	a4,s0,-1216
	lui	a5,%hi(verify_data)
	addi	a2,a5,%lo(verify_data)
	mv	a1,a4
	li	a0,300
	call	verify
	mv	a5,a0
	mv	a0,a5
	ld	ra,1224(sp)
	ld	s0,1216(sp)
	addi	sp,sp,1232
	jr	ra
	.size	main, .-main
	.local	count.1
	.comm	count.1,4,4
	.local	sense.0
	.comm	sense.0,4,4
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
