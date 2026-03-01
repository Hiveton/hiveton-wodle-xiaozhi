
build_sf32lb52-lcd_n16r8_hcpu/bootloader/bootloader.elf:     file format elf32-littlearm


Disassembly of section .text:

20020208 <deregister_tm_clones>:
20020208:	4803      	ldr	r0, [pc, #12]	@ (20020218 <deregister_tm_clones+0x10>)
2002020a:	4b04      	ldr	r3, [pc, #16]	@ (2002021c <deregister_tm_clones+0x14>)
2002020c:	4283      	cmp	r3, r0
2002020e:	d002      	beq.n	20020216 <deregister_tm_clones+0xe>
20020210:	4b03      	ldr	r3, [pc, #12]	@ (20020220 <deregister_tm_clones+0x18>)
20020212:	b103      	cbz	r3, 20020216 <deregister_tm_clones+0xe>
20020214:	4718      	bx	r3
20020216:	4770      	bx	lr
20020218:	200449b4 	.word	0x200449b4
2002021c:	200449b4 	.word	0x200449b4
20020220:	00000000 	.word	0x00000000

20020224 <register_tm_clones>:
20020224:	4b06      	ldr	r3, [pc, #24]	@ (20020240 <register_tm_clones+0x1c>)
20020226:	4907      	ldr	r1, [pc, #28]	@ (20020244 <register_tm_clones+0x20>)
20020228:	1ac9      	subs	r1, r1, r3
2002022a:	1089      	asrs	r1, r1, #2
2002022c:	bf48      	it	mi
2002022e:	3101      	addmi	r1, #1
20020230:	1049      	asrs	r1, r1, #1
20020232:	d003      	beq.n	2002023c <register_tm_clones+0x18>
20020234:	4b04      	ldr	r3, [pc, #16]	@ (20020248 <register_tm_clones+0x24>)
20020236:	b10b      	cbz	r3, 2002023c <register_tm_clones+0x18>
20020238:	4801      	ldr	r0, [pc, #4]	@ (20020240 <register_tm_clones+0x1c>)
2002023a:	4718      	bx	r3
2002023c:	4770      	bx	lr
2002023e:	bf00      	nop
20020240:	200449b4 	.word	0x200449b4
20020244:	200449b4 	.word	0x200449b4
20020248:	00000000 	.word	0x00000000

2002024c <__do_global_dtors_aux>:
2002024c:	b510      	push	{r4, lr}
2002024e:	4c06      	ldr	r4, [pc, #24]	@ (20020268 <__do_global_dtors_aux+0x1c>)
20020250:	7823      	ldrb	r3, [r4, #0]
20020252:	b943      	cbnz	r3, 20020266 <__do_global_dtors_aux+0x1a>
20020254:	f7ff ffd8 	bl	20020208 <deregister_tm_clones>
20020258:	4b04      	ldr	r3, [pc, #16]	@ (2002026c <__do_global_dtors_aux+0x20>)
2002025a:	b113      	cbz	r3, 20020262 <__do_global_dtors_aux+0x16>
2002025c:	4804      	ldr	r0, [pc, #16]	@ (20020270 <__do_global_dtors_aux+0x24>)
2002025e:	f3af 8000 	nop.w
20020262:	2301      	movs	r3, #1
20020264:	7023      	strb	r3, [r4, #0]
20020266:	bd10      	pop	{r4, pc}
20020268:	200449b4 	.word	0x200449b4
2002026c:	00000000 	.word	0x00000000
20020270:	2002c2cc 	.word	0x2002c2cc

20020274 <frame_dummy>:
20020274:	b508      	push	{r3, lr}
20020276:	4b05      	ldr	r3, [pc, #20]	@ (2002028c <frame_dummy+0x18>)
20020278:	b11b      	cbz	r3, 20020282 <frame_dummy+0xe>
2002027a:	4905      	ldr	r1, [pc, #20]	@ (20020290 <frame_dummy+0x1c>)
2002027c:	4805      	ldr	r0, [pc, #20]	@ (20020294 <frame_dummy+0x20>)
2002027e:	f3af 8000 	nop.w
20020282:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
20020286:	f7ff bfcd 	b.w	20020224 <register_tm_clones>
2002028a:	bf00      	nop
2002028c:	00000000 	.word	0x00000000
20020290:	200449b8 	.word	0x200449b8
20020294:	2002c2cc 	.word	0x2002c2cc

20020298 <boot_uart_tx>:
20020298:	2300      	movs	r3, #0
2002029a:	b510      	push	{r4, lr}
2002029c:	4293      	cmp	r3, r2
2002029e:	db00      	blt.n	200202a2 <boot_uart_tx+0xa>
200202a0:	bd10      	pop	{r4, pc}
200202a2:	69c4      	ldr	r4, [r0, #28]
200202a4:	0624      	lsls	r4, r4, #24
200202a6:	d5fc      	bpl.n	200202a2 <boot_uart_tx+0xa>
200202a8:	5ccc      	ldrb	r4, [r1, r3]
200202aa:	3301      	adds	r3, #1
200202ac:	6284      	str	r4, [r0, #40]	@ 0x28
200202ae:	e7f5      	b.n	2002029c <boot_uart_tx+0x4>

200202b0 <boot_error>:
200202b0:	b507      	push	{r0, r1, r2, lr}
200202b2:	2201      	movs	r2, #1
200202b4:	f88d 0007 	strb.w	r0, [sp, #7]
200202b8:	f10d 0107 	add.w	r1, sp, #7
200202bc:	480e      	ldr	r0, [pc, #56]	@ (200202f8 <boot_error+0x48>)
200202be:	f7ff ffeb 	bl	20020298 <boot_uart_tx>
200202c2:	4b0e      	ldr	r3, [pc, #56]	@ (200202fc <boot_error+0x4c>)
200202c4:	f8d3 2088 	ldr.w	r2, [r3, #136]	@ 0x88
200202c8:	f002 0203 	and.w	r2, r2, #3
200202cc:	2a03      	cmp	r2, #3
200202ce:	f102 0101 	add.w	r1, r2, #1
200202d2:	d00f      	beq.n	200202f4 <boot_error+0x44>
200202d4:	f8d3 2088 	ldr.w	r2, [r3, #136]	@ 0x88
200202d8:	f022 0203 	bic.w	r2, r2, #3
200202dc:	f8c3 2088 	str.w	r2, [r3, #136]	@ 0x88
200202e0:	f8d3 2088 	ldr.w	r2, [r3, #136]	@ 0x88
200202e4:	430a      	orrs	r2, r1
200202e6:	f8c3 2088 	str.w	r2, [r3, #136]	@ 0x88
200202ea:	f00c f837 	bl	2002c35c <HAL_PMU_Reboot>
200202ee:	b003      	add	sp, #12
200202f0:	f85d fb04 	ldr.w	pc, [sp], #4
200202f4:	e7fe      	b.n	200202f4 <boot_error+0x44>
200202f6:	bf00      	nop
200202f8:	50084000 	.word	0x50084000
200202fc:	500ca000 	.word	0x500ca000

20020300 <HAL_MspInit>:
20020300:	2234      	movs	r2, #52	@ 0x34
20020302:	4b01      	ldr	r3, [pc, #4]	@ (20020308 <HAL_MspInit+0x8>)
20020304:	60da      	str	r2, [r3, #12]
20020306:	4770      	bx	lr
20020308:	50094000 	.word	0x50094000

2002030c <mpu_config>:
2002030c:	4770      	bx	lr

2002030e <cache_enable>:
2002030e:	4770      	bx	lr

20020310 <board_pinmux_mpi1_puya_base>:
20020310:	b510      	push	{r4, lr}
20020312:	2301      	movs	r3, #1
20020314:	2200      	movs	r2, #0
20020316:	2103      	movs	r1, #3
20020318:	2002      	movs	r0, #2
2002031a:	f004 fb33 	bl	20024984 <HAL_PIN_Set>
2002031e:	2301      	movs	r3, #1
20020320:	2200      	movs	r2, #0
20020322:	4619      	mov	r1, r3
20020324:	200a      	movs	r0, #10
20020326:	f004 fb2d 	bl	20024984 <HAL_PIN_Set>
2002032a:	2301      	movs	r3, #1
2002032c:	2210      	movs	r2, #16
2002032e:	2109      	movs	r1, #9
20020330:	2008      	movs	r0, #8
20020332:	f004 fb27 	bl	20024984 <HAL_PIN_Set>
20020336:	2301      	movs	r3, #1
20020338:	2210      	movs	r2, #16
2002033a:	210a      	movs	r1, #10
2002033c:	2003      	movs	r0, #3
2002033e:	f004 fb21 	bl	20024984 <HAL_PIN_Set>
20020342:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
20020346:	2301      	movs	r3, #1
20020348:	2200      	movs	r2, #0
2002034a:	210c      	movs	r1, #12
2002034c:	200b      	movs	r0, #11
2002034e:	f004 bb19 	b.w	20024984 <HAL_PIN_Set>

20020352 <board_pinmux_mpi1_puya_ext>:
20020352:	b510      	push	{r4, lr}
20020354:	4604      	mov	r4, r0
20020356:	2101      	movs	r1, #1
20020358:	2005      	movs	r0, #5
2002035a:	f004 fcbb 	bl	20024cd4 <HAL_PIN_Set_Analog>
2002035e:	2101      	movs	r1, #1
20020360:	2006      	movs	r0, #6
20020362:	f004 fcb7 	bl	20024cd4 <HAL_PIN_Set_Analog>
20020366:	2101      	movs	r1, #1
20020368:	2007      	movs	r0, #7
2002036a:	f004 fcb3 	bl	20024cd4 <HAL_PIN_Set_Analog>
2002036e:	2101      	movs	r1, #1
20020370:	2009      	movs	r0, #9
20020372:	f004 fcaf 	bl	20024cd4 <HAL_PIN_Set_Analog>
20020376:	2101      	movs	r1, #1
20020378:	200c      	movs	r0, #12
2002037a:	f004 fcab 	bl	20024cd4 <HAL_PIN_Set_Analog>
2002037e:	2101      	movs	r1, #1
20020380:	200d      	movs	r0, #13
20020382:	f004 fca7 	bl	20024cd4 <HAL_PIN_Set_Analog>
20020386:	2101      	movs	r1, #1
20020388:	b154      	cbz	r4, 200203a0 <board_pinmux_mpi1_puya_ext+0x4e>
2002038a:	4608      	mov	r0, r1
2002038c:	f004 fca2 	bl	20024cd4 <HAL_PIN_Set_Analog>
20020390:	2301      	movs	r3, #1
20020392:	2230      	movs	r2, #48	@ 0x30
20020394:	210b      	movs	r1, #11
20020396:	2004      	movs	r0, #4
20020398:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
2002039c:	f004 baf2 	b.w	20024984 <HAL_PIN_Set>
200203a0:	2004      	movs	r0, #4
200203a2:	f004 fc97 	bl	20024cd4 <HAL_PIN_Set_Analog>
200203a6:	2301      	movs	r3, #1
200203a8:	2230      	movs	r2, #48	@ 0x30
200203aa:	210b      	movs	r1, #11
200203ac:	4618      	mov	r0, r3
200203ae:	e7f3      	b.n	20020398 <board_pinmux_mpi1_puya_ext+0x46>

200203b0 <board_pinmux_mpi1_gd>:
200203b0:	b508      	push	{r3, lr}
200203b2:	2200      	movs	r2, #0
200203b4:	2301      	movs	r3, #1
200203b6:	2103      	movs	r1, #3
200203b8:	2005      	movs	r0, #5
200203ba:	f004 fae3 	bl	20024984 <HAL_PIN_Set>
200203be:	2301      	movs	r3, #1
200203c0:	2200      	movs	r2, #0
200203c2:	4619      	mov	r1, r3
200203c4:	200a      	movs	r0, #10
200203c6:	f004 fadd 	bl	20024984 <HAL_PIN_Set>
200203ca:	2301      	movs	r3, #1
200203cc:	2210      	movs	r2, #16
200203ce:	2109      	movs	r1, #9
200203d0:	200c      	movs	r0, #12
200203d2:	f004 fad7 	bl	20024984 <HAL_PIN_Set>
200203d6:	2301      	movs	r3, #1
200203d8:	2210      	movs	r2, #16
200203da:	210a      	movs	r1, #10
200203dc:	2003      	movs	r0, #3
200203de:	f004 fad1 	bl	20024984 <HAL_PIN_Set>
200203e2:	2301      	movs	r3, #1
200203e4:	2230      	movs	r2, #48	@ 0x30
200203e6:	210b      	movs	r1, #11
200203e8:	4618      	mov	r0, r3
200203ea:	f004 facb 	bl	20024984 <HAL_PIN_Set>
200203ee:	2301      	movs	r3, #1
200203f0:	2230      	movs	r2, #48	@ 0x30
200203f2:	210c      	movs	r1, #12
200203f4:	2009      	movs	r0, #9
200203f6:	f004 fac5 	bl	20024984 <HAL_PIN_Set>
200203fa:	2101      	movs	r1, #1
200203fc:	2002      	movs	r0, #2
200203fe:	f004 fc69 	bl	20024cd4 <HAL_PIN_Set_Analog>
20020402:	2101      	movs	r1, #1
20020404:	2004      	movs	r0, #4
20020406:	f004 fc65 	bl	20024cd4 <HAL_PIN_Set_Analog>
2002040a:	2101      	movs	r1, #1
2002040c:	2006      	movs	r0, #6
2002040e:	f004 fc61 	bl	20024cd4 <HAL_PIN_Set_Analog>
20020412:	2101      	movs	r1, #1
20020414:	2007      	movs	r0, #7
20020416:	f004 fc5d 	bl	20024cd4 <HAL_PIN_Set_Analog>
2002041a:	2101      	movs	r1, #1
2002041c:	2008      	movs	r0, #8
2002041e:	f004 fc59 	bl	20024cd4 <HAL_PIN_Set_Analog>
20020422:	2101      	movs	r1, #1
20020424:	200b      	movs	r0, #11
20020426:	f004 fc55 	bl	20024cd4 <HAL_PIN_Set_Analog>
2002042a:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
2002042e:	2101      	movs	r1, #1
20020430:	200d      	movs	r0, #13
20020432:	f004 bc4f 	b.w	20024cd4 <HAL_PIN_Set_Analog>

20020436 <board_pinmux_mpi2>:
20020436:	b510      	push	{r4, lr}
20020438:	2301      	movs	r3, #1
2002043a:	2200      	movs	r2, #0
2002043c:	2119      	movs	r1, #25
2002043e:	201e      	movs	r0, #30
20020440:	f004 faa0 	bl	20024984 <HAL_PIN_Set>
20020444:	2301      	movs	r3, #1
20020446:	2200      	movs	r2, #0
20020448:	211b      	movs	r1, #27
2002044a:	201a      	movs	r0, #26
2002044c:	f004 fa9a 	bl	20024984 <HAL_PIN_Set>
20020450:	2301      	movs	r3, #1
20020452:	2210      	movs	r2, #16
20020454:	2121      	movs	r1, #33	@ 0x21
20020456:	201d      	movs	r0, #29
20020458:	f004 fa94 	bl	20024984 <HAL_PIN_Set>
2002045c:	2301      	movs	r3, #1
2002045e:	2210      	movs	r2, #16
20020460:	2122      	movs	r1, #34	@ 0x22
20020462:	201b      	movs	r0, #27
20020464:	f004 fa8e 	bl	20024984 <HAL_PIN_Set>
20020468:	2301      	movs	r3, #1
2002046a:	2230      	movs	r2, #48	@ 0x30
2002046c:	2123      	movs	r1, #35	@ 0x23
2002046e:	201c      	movs	r0, #28
20020470:	f004 fa88 	bl	20024984 <HAL_PIN_Set>
20020474:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
20020478:	2301      	movs	r3, #1
2002047a:	2230      	movs	r2, #48	@ 0x30
2002047c:	2124      	movs	r1, #36	@ 0x24
2002047e:	201f      	movs	r0, #31
20020480:	f004 ba80 	b.w	20024984 <HAL_PIN_Set>

20020484 <board_pinmux_sd>:
20020484:	b510      	push	{r4, lr}
20020486:	2301      	movs	r3, #1
20020488:	2230      	movs	r2, #48	@ 0x30
2002048a:	f44f 71da 	mov.w	r1, #436	@ 0x1b4
2002048e:	201d      	movs	r0, #29
20020490:	f004 fa78 	bl	20024984 <HAL_PIN_Set>
20020494:	2014      	movs	r0, #20
20020496:	f001 fd66 	bl	20021f66 <HAL_Delay_us>
2002049a:	2301      	movs	r3, #1
2002049c:	2200      	movs	r2, #0
2002049e:	f44f 71d9 	mov.w	r1, #434	@ 0x1b2
200204a2:	201c      	movs	r0, #28
200204a4:	f004 fa6e 	bl	20024984 <HAL_PIN_Set>
200204a8:	2301      	movs	r3, #1
200204aa:	2230      	movs	r2, #48	@ 0x30
200204ac:	f240 11b5 	movw	r1, #437	@ 0x1b5
200204b0:	201e      	movs	r0, #30
200204b2:	f004 fa67 	bl	20024984 <HAL_PIN_Set>
200204b6:	2301      	movs	r3, #1
200204b8:	2230      	movs	r2, #48	@ 0x30
200204ba:	f44f 71db 	mov.w	r1, #438	@ 0x1b6
200204be:	201f      	movs	r0, #31
200204c0:	f004 fa60 	bl	20024984 <HAL_PIN_Set>
200204c4:	2301      	movs	r3, #1
200204c6:	2230      	movs	r2, #48	@ 0x30
200204c8:	f240 11b7 	movw	r1, #439	@ 0x1b7
200204cc:	201a      	movs	r0, #26
200204ce:	f004 fa59 	bl	20024984 <HAL_PIN_Set>
200204d2:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
200204d6:	2301      	movs	r3, #1
200204d8:	2230      	movs	r2, #48	@ 0x30
200204da:	f44f 71dc 	mov.w	r1, #440	@ 0x1b8
200204de:	201b      	movs	r0, #27
200204e0:	f004 ba50 	b.w	20024984 <HAL_PIN_Set>

200204e4 <board_boot_from>:
200204e4:	b510      	push	{r4, lr}
200204e6:	4b0d      	ldr	r3, [pc, #52]	@ (2002051c <board_boot_from+0x38>)
200204e8:	685b      	ldr	r3, [r3, #4]
200204ea:	f3c3 2302 	ubfx	r3, r3, #8, #3
200204ee:	2b07      	cmp	r3, #7
200204f0:	d10c      	bne.n	2002050c <board_boot_from+0x28>
200204f2:	2400      	movs	r4, #0
200204f4:	3401      	adds	r4, #1
200204f6:	2101      	movs	r1, #1
200204f8:	4620      	mov	r0, r4
200204fa:	f004 fbeb 	bl	20024cd4 <HAL_PIN_Set_Analog>
200204fe:	2c0d      	cmp	r4, #13
20020500:	d1f8      	bne.n	200204f4 <board_boot_from+0x10>
20020502:	2000      	movs	r0, #0
20020504:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
20020508:	f00b bee8 	b.w	2002c2dc <HAL_Get_backup>
2002050c:	b11b      	cbz	r3, 20020516 <board_boot_from+0x32>
2002050e:	2b01      	cmp	r3, #1
20020510:	d1f7      	bne.n	20020502 <board_boot_from+0x1e>
20020512:	2002      	movs	r0, #2
20020514:	bd10      	pop	{r4, pc}
20020516:	2001      	movs	r0, #1
20020518:	e7fc      	b.n	20020514 <board_boot_from+0x30>
2002051a:	bf00      	nop
2002051c:	5000b000 	.word	0x5000b000

20020520 <board_flash_power_on>:
20020520:	4770      	bx	lr

20020522 <board_pinmux_psram_func0>:
20020522:	b508      	push	{r3, lr}
20020524:	2210      	movs	r2, #16
20020526:	2301      	movs	r3, #1
20020528:	2109      	movs	r1, #9
2002052a:	2002      	movs	r0, #2
2002052c:	f004 fa2a 	bl	20024984 <HAL_PIN_Set>
20020530:	2301      	movs	r3, #1
20020532:	2210      	movs	r2, #16
20020534:	210a      	movs	r1, #10
20020536:	2003      	movs	r0, #3
20020538:	f004 fa24 	bl	20024984 <HAL_PIN_Set>
2002053c:	2301      	movs	r3, #1
2002053e:	2210      	movs	r2, #16
20020540:	210b      	movs	r1, #11
20020542:	2004      	movs	r0, #4
20020544:	f004 fa1e 	bl	20024984 <HAL_PIN_Set>
20020548:	2301      	movs	r3, #1
2002054a:	2210      	movs	r2, #16
2002054c:	210c      	movs	r1, #12
2002054e:	2005      	movs	r0, #5
20020550:	f004 fa18 	bl	20024984 <HAL_PIN_Set>
20020554:	2301      	movs	r3, #1
20020556:	2210      	movs	r2, #16
20020558:	210d      	movs	r1, #13
2002055a:	2006      	movs	r0, #6
2002055c:	f004 fa12 	bl	20024984 <HAL_PIN_Set>
20020560:	2301      	movs	r3, #1
20020562:	2210      	movs	r2, #16
20020564:	210e      	movs	r1, #14
20020566:	2007      	movs	r0, #7
20020568:	f004 fa0c 	bl	20024984 <HAL_PIN_Set>
2002056c:	2301      	movs	r3, #1
2002056e:	2210      	movs	r2, #16
20020570:	210f      	movs	r1, #15
20020572:	2008      	movs	r0, #8
20020574:	f004 fa06 	bl	20024984 <HAL_PIN_Set>
20020578:	2210      	movs	r2, #16
2002057a:	2301      	movs	r3, #1
2002057c:	4611      	mov	r1, r2
2002057e:	2009      	movs	r0, #9
20020580:	f004 fa00 	bl	20024984 <HAL_PIN_Set>
20020584:	2301      	movs	r3, #1
20020586:	2210      	movs	r2, #16
20020588:	2106      	movs	r1, #6
2002058a:	200a      	movs	r0, #10
2002058c:	f004 f9fa 	bl	20024984 <HAL_PIN_Set>
20020590:	2301      	movs	r3, #1
20020592:	2200      	movs	r2, #0
20020594:	4619      	mov	r1, r3
20020596:	200b      	movs	r0, #11
20020598:	f004 f9f4 	bl	20024984 <HAL_PIN_Set>
2002059c:	2301      	movs	r3, #1
2002059e:	2200      	movs	r2, #0
200205a0:	2103      	movs	r1, #3
200205a2:	200c      	movs	r0, #12
200205a4:	f004 f9ee 	bl	20024984 <HAL_PIN_Set>
200205a8:	2101      	movs	r1, #1
200205aa:	4608      	mov	r0, r1
200205ac:	f004 fb92 	bl	20024cd4 <HAL_PIN_Set_Analog>
200205b0:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
200205b4:	2101      	movs	r1, #1
200205b6:	200d      	movs	r0, #13
200205b8:	f004 bb8c 	b.w	20024cd4 <HAL_PIN_Set_Analog>

200205bc <board_pinmux_psram_func1_2_4>:
200205bc:	b510      	push	{r4, lr}
200205be:	2301      	movs	r3, #1
200205c0:	4604      	mov	r4, r0
200205c2:	2210      	movs	r2, #16
200205c4:	2109      	movs	r1, #9
200205c6:	2002      	movs	r0, #2
200205c8:	f004 f9dc 	bl	20024984 <HAL_PIN_Set>
200205cc:	2301      	movs	r3, #1
200205ce:	2210      	movs	r2, #16
200205d0:	210a      	movs	r1, #10
200205d2:	2003      	movs	r0, #3
200205d4:	f004 f9d6 	bl	20024984 <HAL_PIN_Set>
200205d8:	2301      	movs	r3, #1
200205da:	2210      	movs	r2, #16
200205dc:	210b      	movs	r1, #11
200205de:	2004      	movs	r0, #4
200205e0:	f004 f9d0 	bl	20024984 <HAL_PIN_Set>
200205e4:	2301      	movs	r3, #1
200205e6:	2210      	movs	r2, #16
200205e8:	210c      	movs	r1, #12
200205ea:	2005      	movs	r0, #5
200205ec:	f004 f9ca 	bl	20024984 <HAL_PIN_Set>
200205f0:	2301      	movs	r3, #1
200205f2:	2210      	movs	r2, #16
200205f4:	210d      	movs	r1, #13
200205f6:	2009      	movs	r0, #9
200205f8:	f004 f9c4 	bl	20024984 <HAL_PIN_Set>
200205fc:	2301      	movs	r3, #1
200205fe:	2210      	movs	r2, #16
20020600:	210e      	movs	r1, #14
20020602:	200a      	movs	r0, #10
20020604:	f004 f9be 	bl	20024984 <HAL_PIN_Set>
20020608:	2301      	movs	r3, #1
2002060a:	2210      	movs	r2, #16
2002060c:	210f      	movs	r1, #15
2002060e:	200b      	movs	r0, #11
20020610:	f004 f9b8 	bl	20024984 <HAL_PIN_Set>
20020614:	2210      	movs	r2, #16
20020616:	2301      	movs	r3, #1
20020618:	4611      	mov	r1, r2
2002061a:	200c      	movs	r0, #12
2002061c:	f004 f9b2 	bl	20024984 <HAL_PIN_Set>
20020620:	2301      	movs	r3, #1
20020622:	2200      	movs	r2, #0
20020624:	4619      	mov	r1, r3
20020626:	2008      	movs	r0, #8
20020628:	f004 f9ac 	bl	20024984 <HAL_PIN_Set>
2002062c:	2301      	movs	r3, #1
2002062e:	2200      	movs	r2, #0
20020630:	2103      	movs	r1, #3
20020632:	2006      	movs	r0, #6
20020634:	f004 f9a6 	bl	20024984 <HAL_PIN_Set>
20020638:	2c02      	cmp	r4, #2
2002063a:	d013      	beq.n	20020664 <board_pinmux_psram_func1_2_4+0xa8>
2002063c:	2c04      	cmp	r4, #4
2002063e:	d025      	beq.n	2002068c <board_pinmux_psram_func1_2_4+0xd0>
20020640:	2c01      	cmp	r4, #1
20020642:	d12c      	bne.n	2002069e <board_pinmux_psram_func1_2_4+0xe2>
20020644:	2106      	movs	r1, #6
20020646:	4623      	mov	r3, r4
20020648:	2210      	movs	r2, #16
2002064a:	200d      	movs	r0, #13
2002064c:	f004 f99a 	bl	20024984 <HAL_PIN_Set>
20020650:	4621      	mov	r1, r4
20020652:	4620      	mov	r0, r4
20020654:	f004 fb3e 	bl	20024cd4 <HAL_PIN_Set_Analog>
20020658:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
2002065c:	2101      	movs	r1, #1
2002065e:	2007      	movs	r0, #7
20020660:	f004 bb38 	b.w	20024cd4 <HAL_PIN_Set_Analog>
20020664:	2301      	movs	r3, #1
20020666:	2210      	movs	r2, #16
20020668:	2104      	movs	r1, #4
2002066a:	4618      	mov	r0, r3
2002066c:	f004 f98a 	bl	20024984 <HAL_PIN_Set>
20020670:	2301      	movs	r3, #1
20020672:	2210      	movs	r2, #16
20020674:	2105      	movs	r1, #5
20020676:	200d      	movs	r0, #13
20020678:	f004 f984 	bl	20024984 <HAL_PIN_Set>
2002067c:	4621      	mov	r1, r4
2002067e:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
20020682:	2301      	movs	r3, #1
20020684:	2200      	movs	r2, #0
20020686:	2007      	movs	r0, #7
20020688:	f004 b97c 	b.w	20024984 <HAL_PIN_Set>
2002068c:	2106      	movs	r1, #6
2002068e:	2301      	movs	r3, #1
20020690:	2200      	movs	r2, #0
20020692:	200d      	movs	r0, #13
20020694:	f004 f976 	bl	20024984 <HAL_PIN_Set>
20020698:	2101      	movs	r1, #1
2002069a:	4608      	mov	r0, r1
2002069c:	e7da      	b.n	20020654 <board_pinmux_psram_func1_2_4+0x98>
2002069e:	bd10      	pop	{r4, pc}

200206a0 <board_pinmux_psram_func3>:
200206a0:	b508      	push	{r3, lr}
200206a2:	2301      	movs	r3, #1
200206a4:	2200      	movs	r2, #0
200206a6:	4619      	mov	r1, r3
200206a8:	200a      	movs	r0, #10
200206aa:	f004 f96b 	bl	20024984 <HAL_PIN_Set>
200206ae:	2301      	movs	r3, #1
200206b0:	2200      	movs	r2, #0
200206b2:	2103      	movs	r1, #3
200206b4:	2009      	movs	r0, #9
200206b6:	f004 f965 	bl	20024984 <HAL_PIN_Set>
200206ba:	2301      	movs	r3, #1
200206bc:	2210      	movs	r2, #16
200206be:	2109      	movs	r1, #9
200206c0:	2006      	movs	r0, #6
200206c2:	f004 f95f 	bl	20024984 <HAL_PIN_Set>
200206c6:	2301      	movs	r3, #1
200206c8:	2210      	movs	r2, #16
200206ca:	210a      	movs	r1, #10
200206cc:	2008      	movs	r0, #8
200206ce:	f004 f959 	bl	20024984 <HAL_PIN_Set>
200206d2:	2301      	movs	r3, #1
200206d4:	2230      	movs	r2, #48	@ 0x30
200206d6:	210b      	movs	r1, #11
200206d8:	2007      	movs	r0, #7
200206da:	f004 f953 	bl	20024984 <HAL_PIN_Set>
200206de:	2301      	movs	r3, #1
200206e0:	2230      	movs	r2, #48	@ 0x30
200206e2:	210c      	movs	r1, #12
200206e4:	200b      	movs	r0, #11
200206e6:	f004 f94d 	bl	20024984 <HAL_PIN_Set>
200206ea:	2101      	movs	r1, #1
200206ec:	4608      	mov	r0, r1
200206ee:	f004 faf1 	bl	20024cd4 <HAL_PIN_Set_Analog>
200206f2:	2101      	movs	r1, #1
200206f4:	2002      	movs	r0, #2
200206f6:	f004 faed 	bl	20024cd4 <HAL_PIN_Set_Analog>
200206fa:	2101      	movs	r1, #1
200206fc:	2003      	movs	r0, #3
200206fe:	f004 fae9 	bl	20024cd4 <HAL_PIN_Set_Analog>
20020702:	2101      	movs	r1, #1
20020704:	2004      	movs	r0, #4
20020706:	f004 fae5 	bl	20024cd4 <HAL_PIN_Set_Analog>
2002070a:	2101      	movs	r1, #1
2002070c:	2005      	movs	r0, #5
2002070e:	f004 fae1 	bl	20024cd4 <HAL_PIN_Set_Analog>
20020712:	2101      	movs	r1, #1
20020714:	200c      	movs	r0, #12
20020716:	f004 fadd 	bl	20024cd4 <HAL_PIN_Set_Analog>
2002071a:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
2002071e:	2101      	movs	r1, #1
20020720:	200d      	movs	r0, #13
20020722:	f004 bad7 	b.w	20024cd4 <HAL_PIN_Set_Analog>

20020726 <bootloader_switch_clock>:
20020726:	2102      	movs	r1, #2
20020728:	2004      	movs	r0, #4
2002072a:	f004 bc05 	b.w	20024f38 <HAL_RCC_HCPU_ClockSelect>
	...

20020730 <boot_psram_init>:
20020730:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
20020734:	2400      	movs	r4, #0
20020736:	b08a      	sub	sp, #40	@ 0x28
20020738:	4605      	mov	r5, r0
2002073a:	2230      	movs	r2, #48	@ 0x30
2002073c:	4621      	mov	r1, r4
2002073e:	4863      	ldr	r0, [pc, #396]	@ (200208cc <boot_psram_init+0x19c>)
20020740:	f00a f880 	bl	2002a844 <memset>
20020744:	4b62      	ldr	r3, [pc, #392]	@ (200208d0 <boot_psram_init+0x1a0>)
20020746:	1ea8      	subs	r0, r5, #2
20020748:	9305      	str	r3, [sp, #20]
2002074a:	f04f 5380 	mov.w	r3, #268435456	@ 0x10000000
2002074e:	9307      	str	r3, [sp, #28]
20020750:	2303      	movs	r3, #3
20020752:	9406      	str	r4, [sp, #24]
20020754:	9309      	str	r3, [sp, #36]	@ 0x24
20020756:	2804      	cmp	r0, #4
20020758:	d804      	bhi.n	20020764 <boot_psram_init+0x34>
2002075a:	e8df f000 	tbb	[pc, r0]
2002075e:	6264      	.short	0x6264
20020760:	5d04      	.short	0x5d04
20020762:	60          	.byte	0x60
20020763:	00          	.byte	0x00
20020764:	e7fe      	b.n	20020764 <boot_psram_init+0x34>
20020766:	2305      	movs	r3, #5
20020768:	9309      	str	r3, [sp, #36]	@ 0x24
2002076a:	2304      	movs	r3, #4
2002076c:	9d09      	ldr	r5, [sp, #36]	@ 0x24
2002076e:	9308      	str	r3, [sp, #32]
20020770:	2d03      	cmp	r5, #3
20020772:	d162      	bne.n	2002083a <boot_psram_init+0x10a>
20020774:	f009 fdac 	bl	2002a2d0 <BSP_GetFlash1DIV>
20020778:	a905      	add	r1, sp, #20
2002077a:	4602      	mov	r2, r0
2002077c:	4853      	ldr	r0, [pc, #332]	@ (200208cc <boot_psram_init+0x19c>)
2002077e:	f003 fe9d 	bl	200244bc <HAL_OPI_PSRAM_Init>
20020782:	462a      	mov	r2, r5
20020784:	2108      	movs	r1, #8
20020786:	4851      	ldr	r0, [pc, #324]	@ (200208cc <boot_psram_init+0x19c>)
20020788:	f003 fd8a 	bl	200242a0 <HAL_MPI_MR_WRITE>
2002078c:	484f      	ldr	r0, [pc, #316]	@ (200208cc <boot_psram_init+0x19c>)
2002078e:	f003 fa95 	bl	20023cbc <HAL_QSPI_GET_CLK>
20020792:	4b50      	ldr	r3, [pc, #320]	@ (200208d4 <boot_psram_init+0x1a4>)
20020794:	4298      	cmp	r0, r3
20020796:	d948      	bls.n	2002082a <boot_psram_init+0xfa>
20020798:	f103 63a4 	add.w	r3, r3, #85983232	@ 0x5200000
2002079c:	f503 4383 	add.w	r3, r3, #16768	@ 0x4180
200207a0:	4298      	cmp	r0, r3
200207a2:	d944      	bls.n	2002082e <boot_psram_init+0xfe>
200207a4:	f103 7337 	add.w	r3, r3, #47972352	@ 0x2dc0000
200207a8:	f503 43d8 	add.w	r3, r3, #27648	@ 0x6c00
200207ac:	4298      	cmp	r0, r3
200207ae:	d940      	bls.n	20020832 <boot_psram_init+0x102>
200207b0:	4b49      	ldr	r3, [pc, #292]	@ (200208d8 <boot_psram_init+0x1a8>)
200207b2:	4298      	cmp	r0, r3
200207b4:	d93f      	bls.n	20020836 <boot_psram_init+0x106>
200207b6:	4b49      	ldr	r3, [pc, #292]	@ (200208dc <boot_psram_init+0x1ac>)
200207b8:	4298      	cmp	r0, r3
200207ba:	bf98      	it	ls
200207bc:	2407      	movls	r4, #7
200207be:	2600      	movs	r6, #0
200207c0:	2507      	movs	r5, #7
200207c2:	f04f 0803 	mov.w	r8, #3
200207c6:	0067      	lsls	r7, r4, #1
200207c8:	b2ff      	uxtb	r7, r7
200207ca:	1e7a      	subs	r2, r7, #1
200207cc:	4633      	mov	r3, r6
200207ce:	b252      	sxtb	r2, r2
200207d0:	4629      	mov	r1, r5
200207d2:	483e      	ldr	r0, [pc, #248]	@ (200208cc <boot_psram_init+0x19c>)
200207d4:	e9cd 5502 	strd	r5, r5, [sp, #8]
200207d8:	e9cd 6800 	strd	r6, r8, [sp]
200207dc:	f002 f93e 	bl	20022a5c <HAL_FLASH_CFG_AHB_RCMD>
200207e0:	4631      	mov	r1, r6
200207e2:	483a      	ldr	r0, [pc, #232]	@ (200208cc <boot_psram_init+0x19c>)
200207e4:	f002 f92f 	bl	20022a46 <HAL_FLASH_SET_AHB_RCMD>
200207e8:	1e62      	subs	r2, r4, #1
200207ea:	4633      	mov	r3, r6
200207ec:	b252      	sxtb	r2, r2
200207ee:	4629      	mov	r1, r5
200207f0:	4836      	ldr	r0, [pc, #216]	@ (200208cc <boot_psram_init+0x19c>)
200207f2:	e9cd 5502 	strd	r5, r5, [sp, #8]
200207f6:	e9cd 6800 	strd	r6, r8, [sp]
200207fa:	f002 f958 	bl	20022aae <HAL_FLASH_CFG_AHB_WCMD>
200207fe:	2180      	movs	r1, #128	@ 0x80
20020800:	4832      	ldr	r0, [pc, #200]	@ (200208cc <boot_psram_init+0x19c>)
20020802:	f002 f948 	bl	20022a96 <HAL_FLASH_SET_AHB_WCMD>
20020806:	4623      	mov	r3, r4
20020808:	463a      	mov	r2, r7
2002080a:	2101      	movs	r1, #1
2002080c:	482f      	ldr	r0, [pc, #188]	@ (200208cc <boot_psram_init+0x19c>)
2002080e:	f003 fd6b 	bl	200242e8 <HAL_MPI_SET_FIXLAT>
20020812:	b00a      	add	sp, #40	@ 0x28
20020814:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
20020818:	2302      	movs	r3, #2
2002081a:	9309      	str	r3, [sp, #36]	@ 0x24
2002081c:	e7a6      	b.n	2002076c <boot_psram_init+0x3c>
2002081e:	2306      	movs	r3, #6
20020820:	9309      	str	r3, [sp, #36]	@ 0x24
20020822:	2308      	movs	r3, #8
20020824:	e7a2      	b.n	2002076c <boot_psram_init+0x3c>
20020826:	2310      	movs	r3, #16
20020828:	e7a0      	b.n	2002076c <boot_psram_init+0x3c>
2002082a:	462c      	mov	r4, r5
2002082c:	e7c7      	b.n	200207be <boot_psram_init+0x8e>
2002082e:	2404      	movs	r4, #4
20020830:	e7c5      	b.n	200207be <boot_psram_init+0x8e>
20020832:	2405      	movs	r4, #5
20020834:	e7c3      	b.n	200207be <boot_psram_init+0x8e>
20020836:	2406      	movs	r4, #6
20020838:	e7c1      	b.n	200207be <boot_psram_init+0x8e>
2002083a:	2d05      	cmp	r5, #5
2002083c:	d10d      	bne.n	2002085a <boot_psram_init+0x12a>
2002083e:	f009 fd47 	bl	2002a2d0 <BSP_GetFlash1DIV>
20020842:	a905      	add	r1, sp, #20
20020844:	4602      	mov	r2, r0
20020846:	4821      	ldr	r0, [pc, #132]	@ (200208cc <boot_psram_init+0x19c>)
20020848:	f003 feb4 	bl	200245b4 <HAL_LEGACY_PSRAM_Init>
2002084c:	481f      	ldr	r0, [pc, #124]	@ (200208cc <boot_psram_init+0x19c>)
2002084e:	f003 fdbd 	bl	200243cc <HAL_LEGACY_CFG_READ>
20020852:	481e      	ldr	r0, [pc, #120]	@ (200208cc <boot_psram_init+0x19c>)
20020854:	f003 fdd5 	bl	20024402 <HAL_LEGACY_CFG_WRITE>
20020858:	e7db      	b.n	20020812 <boot_psram_init+0xe2>
2002085a:	2d06      	cmp	r5, #6
2002085c:	d10d      	bne.n	2002087a <boot_psram_init+0x14a>
2002085e:	f009 fd37 	bl	2002a2d0 <BSP_GetFlash1DIV>
20020862:	a905      	add	r1, sp, #20
20020864:	4602      	mov	r2, r0
20020866:	4819      	ldr	r0, [pc, #100]	@ (200208cc <boot_psram_init+0x19c>)
20020868:	f003 ff70 	bl	2002474c <HAL_HYPER_PSRAM_Init>
2002086c:	4817      	ldr	r0, [pc, #92]	@ (200208cc <boot_psram_init+0x19c>)
2002086e:	f003 ffa7 	bl	200247c0 <HAL_HYPER_CFG_READ>
20020872:	4816      	ldr	r0, [pc, #88]	@ (200208cc <boot_psram_init+0x19c>)
20020874:	f003 ffb6 	bl	200247e4 <HAL_HYPER_CFG_WRITE>
20020878:	e7cb      	b.n	20020812 <boot_psram_init+0xe2>
2002087a:	f009 fd29 	bl	2002a2d0 <BSP_GetFlash1DIV>
2002087e:	2500      	movs	r5, #0
20020880:	2403      	movs	r4, #3
20020882:	2701      	movs	r7, #1
20020884:	2602      	movs	r6, #2
20020886:	4602      	mov	r2, r0
20020888:	a905      	add	r1, sp, #20
2002088a:	4810      	ldr	r0, [pc, #64]	@ (200208cc <boot_psram_init+0x19c>)
2002088c:	f003 fcb2 	bl	200241f4 <HAL_SPI_PSRAM_Init>
20020890:	462b      	mov	r3, r5
20020892:	2206      	movs	r2, #6
20020894:	4621      	mov	r1, r4
20020896:	e9cd 4702 	strd	r4, r7, [sp, #8]
2002089a:	e9cd 5600 	strd	r5, r6, [sp]
2002089e:	480b      	ldr	r0, [pc, #44]	@ (200208cc <boot_psram_init+0x19c>)
200208a0:	f002 f8dc 	bl	20022a5c <HAL_FLASH_CFG_AHB_RCMD>
200208a4:	21eb      	movs	r1, #235	@ 0xeb
200208a6:	4809      	ldr	r0, [pc, #36]	@ (200208cc <boot_psram_init+0x19c>)
200208a8:	f002 f8cd 	bl	20022a46 <HAL_FLASH_SET_AHB_RCMD>
200208ac:	4621      	mov	r1, r4
200208ae:	462b      	mov	r3, r5
200208b0:	462a      	mov	r2, r5
200208b2:	e9cd 4702 	strd	r4, r7, [sp, #8]
200208b6:	e9cd 5600 	strd	r5, r6, [sp]
200208ba:	4804      	ldr	r0, [pc, #16]	@ (200208cc <boot_psram_init+0x19c>)
200208bc:	f002 f8f7 	bl	20022aae <HAL_FLASH_CFG_AHB_WCMD>
200208c0:	2138      	movs	r1, #56	@ 0x38
200208c2:	4802      	ldr	r0, [pc, #8]	@ (200208cc <boot_psram_init+0x19c>)
200208c4:	f002 f8e7 	bl	20022a96 <HAL_FLASH_SET_AHB_WCMD>
200208c8:	e7a3      	b.n	20020812 <boot_psram_init+0xe2>
200208ca:	bf00      	nop
200208cc:	200449d0 	.word	0x200449d0
200208d0:	50041000 	.word	0x50041000
200208d4:	07de2901 	.word	0x07de2901
200208d8:	13c9eb01 	.word	0x13c9eb01
200208dc:	17d78401 	.word	0x17d78401

200208e0 <board_init_psram>:
200208e0:	b510      	push	{r4, lr}
200208e2:	4b15      	ldr	r3, [pc, #84]	@ (20020938 <board_init_psram+0x58>)
200208e4:	685c      	ldr	r4, [r3, #4]
200208e6:	f3c4 2402 	ubfx	r4, r4, #8, #3
200208ea:	1ea3      	subs	r3, r4, #2
200208ec:	2b04      	cmp	r3, #4
200208ee:	d821      	bhi.n	20020934 <board_init_psram+0x54>
200208f0:	e8df f003 	tbb	[pc, r3]
200208f4:	03151b1d 	.word	0x03151b1d
200208f8:	19          	.byte	0x19
200208f9:	00          	.byte	0x00
200208fa:	f7ff fed1 	bl	200206a0 <board_pinmux_psram_func3>
200208fe:	2201      	movs	r2, #1
20020900:	2000      	movs	r0, #0
20020902:	4611      	mov	r1, r2
20020904:	f00b fcf0 	bl	2002c2e8 <HAL_PMU_ConfigPeriLdo>
20020908:	2001      	movs	r0, #1
2002090a:	f7ff ff0c 	bl	20020726 <bootloader_switch_clock>
2002090e:	2002      	movs	r0, #2
20020910:	f009 fcea 	bl	2002a2e8 <BSP_SetFlash1DIV>
20020914:	4620      	mov	r0, r4
20020916:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
2002091a:	f7ff bf09 	b.w	20020730 <boot_psram_init>
2002091e:	2002      	movs	r0, #2
20020920:	f7ff fe4c 	bl	200205bc <board_pinmux_psram_func1_2_4>
20020924:	e7eb      	b.n	200208fe <board_init_psram+0x1e>
20020926:	2004      	movs	r0, #4
20020928:	e7fa      	b.n	20020920 <board_init_psram+0x40>
2002092a:	2001      	movs	r0, #1
2002092c:	e7f8      	b.n	20020920 <board_init_psram+0x40>
2002092e:	f7ff fdf8 	bl	20020522 <board_pinmux_psram_func0>
20020932:	e7e4      	b.n	200208fe <board_init_psram+0x1e>
20020934:	bd10      	pop	{r4, pc}
20020936:	bf00      	nop
20020938:	5000b000 	.word	0x5000b000

2002093c <erase_nor>:
2002093c:	4b15      	ldr	r3, [pc, #84]	@ (20020994 <erase_nor+0x58>)
2002093e:	b570      	push	{r4, r5, r6, lr}
20020940:	f103 0644 	add.w	r6, r3, #68	@ 0x44
20020944:	f1b0 5f90 	cmp.w	r0, #301989888	@ 0x12000000
20020948:	bf38      	it	cc
2002094a:	461e      	movcc	r6, r3
2002094c:	6933      	ldr	r3, [r6, #16]
2002094e:	460c      	mov	r4, r1
20020950:	4283      	cmp	r3, r0
20020952:	d901      	bls.n	20020958 <erase_nor+0x1c>
20020954:	2001      	movs	r0, #1
20020956:	bd70      	pop	{r4, r5, r6, pc}
20020958:	6972      	ldr	r2, [r6, #20]
2002095a:	441a      	add	r2, r3
2002095c:	4282      	cmp	r2, r0
2002095e:	d3f9      	bcc.n	20020954 <erase_nor+0x18>
20020960:	1ac0      	subs	r0, r0, r3
20020962:	f3c0 030b 	ubfx	r3, r0, #0, #12
20020966:	b97b      	cbnz	r3, 20020988 <erase_nor+0x4c>
20020968:	f3c1 030b 	ubfx	r3, r1, #0, #12
2002096c:	b97b      	cbnz	r3, 2002098e <erase_nor+0x52>
2002096e:	1845      	adds	r5, r0, r1
20020970:	1b29      	subs	r1, r5, r4
20020972:	b90c      	cbnz	r4, 20020978 <erase_nor+0x3c>
20020974:	4620      	mov	r0, r4
20020976:	e7ee      	b.n	20020956 <erase_nor+0x1a>
20020978:	4630      	mov	r0, r6
2002097a:	f003 f953 	bl	20023c24 <HAL_QSPIEX_SECT_ERASE>
2002097e:	2800      	cmp	r0, #0
20020980:	d1e8      	bne.n	20020954 <erase_nor+0x18>
20020982:	f5a4 5480 	sub.w	r4, r4, #4096	@ 0x1000
20020986:	e7f3      	b.n	20020970 <erase_nor+0x34>
20020988:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
2002098c:	e7e3      	b.n	20020956 <erase_nor+0x1a>
2002098e:	f06f 0001 	mvn.w	r0, #1
20020992:	e7e0      	b.n	20020956 <erase_nor+0x1a>
20020994:	20046f20 	.word	0x20046f20

20020998 <write_nor>:
20020998:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
2002099c:	4b20      	ldr	r3, [pc, #128]	@ (20020a20 <write_nor+0x88>)
2002099e:	460f      	mov	r7, r1
200209a0:	f103 0844 	add.w	r8, r3, #68	@ 0x44
200209a4:	f1b0 5f90 	cmp.w	r0, #301989888	@ 0x12000000
200209a8:	bf38      	it	cc
200209aa:	4698      	movcc	r8, r3
200209ac:	f8d8 5010 	ldr.w	r5, [r8, #16]
200209b0:	4616      	mov	r6, r2
200209b2:	4285      	cmp	r5, r0
200209b4:	d902      	bls.n	200209bc <write_nor+0x24>
200209b6:	2000      	movs	r0, #0
200209b8:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
200209bc:	f8d8 2014 	ldr.w	r2, [r8, #20]
200209c0:	442a      	add	r2, r5
200209c2:	4282      	cmp	r2, r0
200209c4:	d3f7      	bcc.n	200209b6 <write_nor+0x1e>
200209c6:	1b45      	subs	r5, r0, r5
200209c8:	f015 04ff 	ands.w	r4, r5, #255	@ 0xff
200209cc:	d012      	beq.n	200209f4 <write_nor+0x5c>
200209ce:	f5c4 7480 	rsb	r4, r4, #256	@ 0x100
200209d2:	42b4      	cmp	r4, r6
200209d4:	bf28      	it	cs
200209d6:	4634      	movcs	r4, r6
200209d8:	460a      	mov	r2, r1
200209da:	4623      	mov	r3, r4
200209dc:	4629      	mov	r1, r5
200209de:	4640      	mov	r0, r8
200209e0:	f003 f83b 	bl	20023a5a <HAL_QSPIEX_WRITE_PAGE>
200209e4:	4284      	cmp	r4, r0
200209e6:	d1e6      	bne.n	200209b6 <write_nor+0x1e>
200209e8:	4425      	add	r5, r4
200209ea:	4427      	add	r7, r4
200209ec:	1b34      	subs	r4, r6, r4
200209ee:	b91c      	cbnz	r4, 200209f8 <write_nor+0x60>
200209f0:	4630      	mov	r0, r6
200209f2:	e7e1      	b.n	200209b8 <write_nor+0x20>
200209f4:	4634      	mov	r4, r6
200209f6:	e7fa      	b.n	200209ee <write_nor+0x56>
200209f8:	f5b4 7f80 	cmp.w	r4, #256	@ 0x100
200209fc:	46a1      	mov	r9, r4
200209fe:	bf28      	it	cs
20020a00:	f44f 7980 	movcs.w	r9, #256	@ 0x100
20020a04:	463a      	mov	r2, r7
20020a06:	464b      	mov	r3, r9
20020a08:	4629      	mov	r1, r5
20020a0a:	4640      	mov	r0, r8
20020a0c:	f003 f825 	bl	20023a5a <HAL_QSPIEX_WRITE_PAGE>
20020a10:	4581      	cmp	r9, r0
20020a12:	d1d0      	bne.n	200209b6 <write_nor+0x1e>
20020a14:	444d      	add	r5, r9
20020a16:	444f      	add	r7, r9
20020a18:	eba4 0409 	sub.w	r4, r4, r9
20020a1c:	e7e7      	b.n	200209ee <write_nor+0x56>
20020a1e:	bf00      	nop
20020a20:	20046f20 	.word	0x20046f20

20020a24 <read_nor>:
20020a24:	460b      	mov	r3, r1
20020a26:	b510      	push	{r4, lr}
20020a28:	4614      	mov	r4, r2
20020a2a:	4601      	mov	r1, r0
20020a2c:	4618      	mov	r0, r3
20020a2e:	f009 ff23 	bl	2002a878 <memcpy>
20020a32:	4620      	mov	r0, r4
20020a34:	bd10      	pop	{r4, pc}
	...

20020a38 <read_nand>:
20020a38:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20020a3c:	2600      	movs	r6, #0
20020a3e:	460f      	mov	r7, r1
20020a40:	4615      	mov	r5, r2
20020a42:	46b0      	mov	r8, r6
20020a44:	4b19      	ldr	r3, [pc, #100]	@ (20020aac <read_nand+0x74>)
20020a46:	f8df a068 	ldr.w	sl, [pc, #104]	@ 20020ab0 <read_nand+0x78>
20020a4a:	681b      	ldr	r3, [r3, #0]
20020a4c:	f8df b064 	ldr.w	fp, [pc, #100]	@ 20020ab4 <read_nand+0x7c>
20020a50:	691b      	ldr	r3, [r3, #16]
20020a52:	4604      	mov	r4, r0
20020a54:	4283      	cmp	r3, r0
20020a56:	b085      	sub	sp, #20
20020a58:	bf98      	it	ls
20020a5a:	1ac4      	subls	r4, r0, r3
20020a5c:	b91d      	cbnz	r5, 20020a66 <read_nand+0x2e>
20020a5e:	4630      	mov	r0, r6
20020a60:	b005      	add	sp, #20
20020a62:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
20020a66:	f8da 1000 	ldr.w	r1, [sl]
20020a6a:	f8db 0000 	ldr.w	r0, [fp]
20020a6e:	42a9      	cmp	r1, r5
20020a70:	fbb0 fcf1 	udiv	ip, r0, r1
20020a74:	4689      	mov	r9, r1
20020a76:	f101 32ff 	add.w	r2, r1, #4294967295	@ 0xffffffff
20020a7a:	bf28      	it	cs
20020a7c:	46a9      	movcs	r9, r5
20020a7e:	fbb4 f1f1 	udiv	r1, r4, r1
20020a82:	f10c 3cff 	add.w	ip, ip, #4294967295	@ 0xffffffff
20020a86:	fbb4 f0f0 	udiv	r0, r4, r0
20020a8a:	e9cd 8801 	strd	r8, r8, [sp, #4]
20020a8e:	f8cd 9000 	str.w	r9, [sp]
20020a92:	19bb      	adds	r3, r7, r6
20020a94:	4022      	ands	r2, r4
20020a96:	ea0c 0101 	and.w	r1, ip, r1
20020a9a:	f004 fe63 	bl	20025764 <bbm_read_page>
20020a9e:	4548      	cmp	r0, r9
20020aa0:	d1dd      	bne.n	20020a5e <read_nand+0x26>
20020aa2:	4406      	add	r6, r0
20020aa4:	1a2d      	subs	r5, r5, r0
20020aa6:	4404      	add	r4, r0
20020aa8:	e7d8      	b.n	20020a5c <read_nand+0x24>
20020aaa:	bf00      	nop
20020aac:	20046d08 	.word	0x20046d08
20020ab0:	20042c04 	.word	0x20042c04
20020ab4:	20042c00 	.word	0x20042c00

20020ab8 <read_sdnand>:
20020ab8:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
20020abc:	f100 461e 	add.w	r6, r0, #2650800128	@ 0x9e000000
20020ac0:	460d      	mov	r5, r1
20020ac2:	4614      	mov	r4, r2
20020ac4:	4617      	mov	r7, r2
20020ac6:	46b0      	mov	r8, r6
20020ac8:	eb02 0901 	add.w	r9, r2, r1
20020acc:	f5b7 7f00 	cmp.w	r7, #512	@ 0x200
20020ad0:	eba9 0107 	sub.w	r1, r9, r7
20020ad4:	d218      	bcs.n	20020b08 <read_sdnand+0x50>
20020ad6:	f3c4 0708 	ubfx	r7, r4, #0, #9
20020ada:	b197      	cbz	r7, 20020b02 <read_sdnand+0x4a>
20020adc:	f424 70ff 	bic.w	r0, r4, #510	@ 0x1fe
20020ae0:	f020 0001 	bic.w	r0, r0, #1
20020ae4:	f44f 7200 	mov.w	r2, #512	@ 0x200
20020ae8:	490c      	ldr	r1, [pc, #48]	@ (20020b1c <read_sdnand+0x64>)
20020aea:	4430      	add	r0, r6
20020aec:	f001 f8b8 	bl	20021c60 <sd_read_data>
20020af0:	f424 70ff 	bic.w	r0, r4, #510	@ 0x1fe
20020af4:	f020 0001 	bic.w	r0, r0, #1
20020af8:	463a      	mov	r2, r7
20020afa:	4908      	ldr	r1, [pc, #32]	@ (20020b1c <read_sdnand+0x64>)
20020afc:	4428      	add	r0, r5
20020afe:	f009 febb 	bl	2002a878 <memcpy>
20020b02:	4620      	mov	r0, r4
20020b04:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
20020b08:	4640      	mov	r0, r8
20020b0a:	f44f 7200 	mov.w	r2, #512	@ 0x200
20020b0e:	f001 f8a7 	bl	20021c60 <sd_read_data>
20020b12:	f5a7 7700 	sub.w	r7, r7, #512	@ 0x200
20020b16:	f508 7800 	add.w	r8, r8, #512	@ 0x200
20020b1a:	e7d7      	b.n	20020acc <read_sdnand+0x14>
20020b1c:	20046b04 	.word	0x20046b04

20020b20 <read_sdemmc>:
20020b20:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
20020b24:	f100 461e 	add.w	r6, r0, #2650800128	@ 0x9e000000
20020b28:	460d      	mov	r5, r1
20020b2a:	4614      	mov	r4, r2
20020b2c:	4617      	mov	r7, r2
20020b2e:	46b0      	mov	r8, r6
20020b30:	eb02 0901 	add.w	r9, r2, r1
20020b34:	f5b7 7f00 	cmp.w	r7, #512	@ 0x200
20020b38:	eba9 0107 	sub.w	r1, r9, r7
20020b3c:	d218      	bcs.n	20020b70 <read_sdemmc+0x50>
20020b3e:	f3c4 0708 	ubfx	r7, r4, #0, #9
20020b42:	b197      	cbz	r7, 20020b6a <read_sdemmc+0x4a>
20020b44:	f424 70ff 	bic.w	r0, r4, #510	@ 0x1fe
20020b48:	f020 0001 	bic.w	r0, r0, #1
20020b4c:	f44f 7200 	mov.w	r2, #512	@ 0x200
20020b50:	490c      	ldr	r1, [pc, #48]	@ (20020b84 <read_sdemmc+0x64>)
20020b52:	4430      	add	r0, r6
20020b54:	f000 fe6e 	bl	20021834 <emmc_read_data>
20020b58:	f424 70ff 	bic.w	r0, r4, #510	@ 0x1fe
20020b5c:	f020 0001 	bic.w	r0, r0, #1
20020b60:	463a      	mov	r2, r7
20020b62:	4908      	ldr	r1, [pc, #32]	@ (20020b84 <read_sdemmc+0x64>)
20020b64:	4428      	add	r0, r5
20020b66:	f009 fe87 	bl	2002a878 <memcpy>
20020b6a:	4620      	mov	r0, r4
20020b6c:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
20020b70:	4640      	mov	r0, r8
20020b72:	f44f 7200 	mov.w	r2, #512	@ 0x200
20020b76:	f000 fe5d 	bl	20021834 <emmc_read_data>
20020b7a:	f5a7 7700 	sub.w	r7, r7, #512	@ 0x200
20020b7e:	f508 7800 	add.w	r8, r8, #512	@ 0x200
20020b82:	e7d7      	b.n	20020b34 <read_sdemmc+0x14>
20020b84:	20046b04 	.word	0x20046b04

20020b88 <port_read_page>:
20020b88:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
20020b8c:	4615      	mov	r5, r2
20020b8e:	460e      	mov	r6, r1
20020b90:	4928      	ldr	r1, [pc, #160]	@ (20020c34 <port_read_page+0xac>)
20020b92:	461a      	mov	r2, r3
20020b94:	e9dd 3c08 	ldrd	r3, ip, [sp, #32]
20020b98:	680f      	ldr	r7, [r1, #0]
20020b9a:	18e9      	adds	r1, r5, r3
20020b9c:	428f      	cmp	r7, r1
20020b9e:	f8dd e028 	ldr.w	lr, [sp, #40]	@ 0x28
20020ba2:	d200      	bcs.n	20020ba6 <port_read_page+0x1e>
20020ba4:	e7fe      	b.n	20020ba4 <port_read_page+0x1c>
20020ba6:	4924      	ldr	r1, [pc, #144]	@ (20020c38 <port_read_page+0xb0>)
20020ba8:	f107 0980 	add.w	r9, r7, #128	@ 0x80
20020bac:	f1b9 0f00 	cmp.w	r9, #0
20020bb0:	6809      	ldr	r1, [r1, #0]
20020bb2:	dd15      	ble.n	20020be0 <port_read_page+0x58>
20020bb4:	4c21      	ldr	r4, [pc, #132]	@ (20020c3c <port_read_page+0xb4>)
20020bb6:	6d64      	ldr	r4, [r4, #84]	@ 0x54
20020bb8:	f004 081f 	and.w	r8, r4, #31
20020bbc:	44c8      	add	r8, r9
20020bbe:	f3bf 8f4f 	dsb	sy
20020bc2:	f8df a080 	ldr.w	sl, [pc, #128]	@ 20020c44 <port_read_page+0xbc>
20020bc6:	44a0      	add	r8, r4
20020bc8:	f8ca 425c 	str.w	r4, [sl, #604]	@ 0x25c
20020bcc:	3420      	adds	r4, #32
20020bce:	eba8 0904 	sub.w	r9, r8, r4
20020bd2:	f1b9 0f00 	cmp.w	r9, #0
20020bd6:	dcf7      	bgt.n	20020bc8 <port_read_page+0x40>
20020bd8:	f3bf 8f4f 	dsb	sy
20020bdc:	f3bf 8f6f 	isb	sy
20020be0:	07c4      	lsls	r4, r0, #31
20020be2:	d51b      	bpl.n	20020c1c <port_read_page+0x94>
20020be4:	4c15      	ldr	r4, [pc, #84]	@ (20020c3c <port_read_page+0xb4>)
20020be6:	f894 806b 	ldrb.w	r8, [r4, #107]	@ 0x6b
20020bea:	f1b8 0f00 	cmp.w	r8, #0
20020bee:	d015      	beq.n	20020c1c <port_read_page+0x94>
20020bf0:	6d64      	ldr	r4, [r4, #84]	@ 0x54
20020bf2:	f504 5880 	add.w	r8, r4, #4096	@ 0x1000
20020bf6:	f004 041f 	and.w	r4, r4, #31
20020bfa:	f504 6408 	add.w	r4, r4, #2176	@ 0x880
20020bfe:	f3bf 8f4f 	dsb	sy
20020c02:	f8df 9040 	ldr.w	r9, [pc, #64]	@ 20020c44 <port_read_page+0xbc>
20020c06:	3c20      	subs	r4, #32
20020c08:	2c00      	cmp	r4, #0
20020c0a:	f8c9 825c 	str.w	r8, [r9, #604]	@ 0x25c
20020c0e:	f108 0820 	add.w	r8, r8, #32
20020c12:	dcf8      	bgt.n	20020c06 <port_read_page+0x7e>
20020c14:	f3bf 8f4f 	dsb	sy
20020c18:	f3bf 8f6f 	isb	sy
20020c1c:	fb07 5506 	mla	r5, r7, r6, r5
20020c20:	e9cd ce08 	strd	ip, lr, [sp, #32]
20020c24:	fb01 5100 	mla	r1, r1, r0, r5
20020c28:	e8bd 47f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
20020c2c:	4804      	ldr	r0, [pc, #16]	@ (20020c40 <port_read_page+0xb8>)
20020c2e:	f002 be32 	b.w	20023896 <HAL_NAND_READ_WITHOOB>
20020c32:	bf00      	nop
20020c34:	20042c04 	.word	0x20042c04
20020c38:	20042c00 	.word	0x20042c00
20020c3c:	20046f20 	.word	0x20046f20
20020c40:	20046f64 	.word	0x20046f64
20020c44:	e000ed00 	.word	0xe000ed00

20020c48 <bbm_get_bb>:
20020c48:	b410      	push	{r4}
20020c4a:	4b1c      	ldr	r3, [pc, #112]	@ (20020cbc <bbm_get_bb+0x74>)
20020c4c:	4601      	mov	r1, r0
20020c4e:	6818      	ldr	r0, [r3, #0]
20020c50:	3080      	adds	r0, #128	@ 0x80
20020c52:	2800      	cmp	r0, #0
20020c54:	dd12      	ble.n	20020c7c <bbm_get_bb+0x34>
20020c56:	4b1a      	ldr	r3, [pc, #104]	@ (20020cc0 <bbm_get_bb+0x78>)
20020c58:	6d5b      	ldr	r3, [r3, #84]	@ 0x54
20020c5a:	f003 021f 	and.w	r2, r3, #31
20020c5e:	4402      	add	r2, r0
20020c60:	f3bf 8f4f 	dsb	sy
20020c64:	4c17      	ldr	r4, [pc, #92]	@ (20020cc4 <bbm_get_bb+0x7c>)
20020c66:	441a      	add	r2, r3
20020c68:	f8c4 325c 	str.w	r3, [r4, #604]	@ 0x25c
20020c6c:	3320      	adds	r3, #32
20020c6e:	1ad0      	subs	r0, r2, r3
20020c70:	2800      	cmp	r0, #0
20020c72:	dcf9      	bgt.n	20020c68 <bbm_get_bb+0x20>
20020c74:	f3bf 8f4f 	dsb	sy
20020c78:	f3bf 8f6f 	isb	sy
20020c7c:	07cb      	lsls	r3, r1, #31
20020c7e:	d518      	bpl.n	20020cb2 <bbm_get_bb+0x6a>
20020c80:	4b0f      	ldr	r3, [pc, #60]	@ (20020cc0 <bbm_get_bb+0x78>)
20020c82:	f893 206b 	ldrb.w	r2, [r3, #107]	@ 0x6b
20020c86:	b1a2      	cbz	r2, 20020cb2 <bbm_get_bb+0x6a>
20020c88:	6d5b      	ldr	r3, [r3, #84]	@ 0x54
20020c8a:	f503 5280 	add.w	r2, r3, #4096	@ 0x1000
20020c8e:	f003 031f 	and.w	r3, r3, #31
20020c92:	f503 6308 	add.w	r3, r3, #2176	@ 0x880
20020c96:	f3bf 8f4f 	dsb	sy
20020c9a:	480a      	ldr	r0, [pc, #40]	@ (20020cc4 <bbm_get_bb+0x7c>)
20020c9c:	3b20      	subs	r3, #32
20020c9e:	2b00      	cmp	r3, #0
20020ca0:	f8c0 225c 	str.w	r2, [r0, #604]	@ 0x25c
20020ca4:	f102 0220 	add.w	r2, r2, #32
20020ca8:	dcf8      	bgt.n	20020c9c <bbm_get_bb+0x54>
20020caa:	f3bf 8f4f 	dsb	sy
20020cae:	f3bf 8f6f 	isb	sy
20020cb2:	4805      	ldr	r0, [pc, #20]	@ (20020cc8 <bbm_get_bb+0x80>)
20020cb4:	f85d 4b04 	ldr.w	r4, [sp], #4
20020cb8:	f002 beae 	b.w	20023a18 <HAL_NAND_GET_BADBLK>
20020cbc:	20042c04 	.word	0x20042c04
20020cc0:	20046f20 	.word	0x20046f20
20020cc4:	e000ed00 	.word	0xe000ed00
20020cc8:	20046f64 	.word	0x20046f64

20020ccc <dfu_flash_init>:
20020ccc:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
20020cd0:	b08c      	sub	sp, #48	@ 0x30
20020cd2:	f001 fe83 	bl	200229dc <HAL_HPAON_EnableXT48>
20020cd6:	2101      	movs	r1, #1
20020cd8:	2000      	movs	r0, #0
20020cda:	f004 f92d 	bl	20024f38 <HAL_RCC_HCPU_ClockSelect>
20020cde:	2101      	movs	r1, #1
20020ce0:	200c      	movs	r0, #12
20020ce2:	f004 f929 	bl	20024f38 <HAL_RCC_HCPU_ClockSelect>
20020ce6:	2001      	movs	r0, #1
20020ce8:	f004 f824 	bl	20024d34 <HAL_PMU_EnableDLL>
20020cec:	4f9c      	ldr	r7, [pc, #624]	@ (20020f60 <dfu_flash_init+0x294>)
20020cee:	2090      	movs	r0, #144	@ 0x90
20020cf0:	f004 fa84 	bl	200251fc <HAL_RCC_HCPU_ConfigHCLK>
20020cf4:	2000      	movs	r0, #0
20020cf6:	f001 f936 	bl	20021f66 <HAL_Delay_us>
20020cfa:	683b      	ldr	r3, [r7, #0]
20020cfc:	4d99      	ldr	r5, [pc, #612]	@ (20020f64 <dfu_flash_init+0x298>)
20020cfe:	3b01      	subs	r3, #1
20020d00:	2b05      	cmp	r3, #5
20020d02:	f200 811d 	bhi.w	20020f40 <dfu_flash_init+0x274>
20020d06:	e8df f013 	tbh	[pc, r3, lsl #1]
20020d0a:	0006      	.short	0x0006
20020d0c:	00780006 	.word	0x00780006
20020d10:	00f80078 	.word	0x00f80078
20020d14:	010c      	.short	0x010c
20020d16:	4894      	ldr	r0, [pc, #592]	@ (20020f68 <dfu_flash_init+0x29c>)
20020d18:	f004 f8d6 	bl	20024ec8 <HAL_RCC_HCPU_EnableDLL2>
20020d1c:	4c93      	ldr	r4, [pc, #588]	@ (20020f6c <dfu_flash_init+0x2a0>)
20020d1e:	2006      	movs	r0, #6
20020d20:	f009 fae2 	bl	2002a2e8 <BSP_SetFlash1DIV>
20020d24:	ae07      	add	r6, sp, #28
20020d26:	2102      	movs	r1, #2
20020d28:	2004      	movs	r0, #4
20020d2a:	f004 f905 	bl	20024f38 <HAL_RCC_HCPU_ClockSelect>
20020d2e:	cc0f      	ldmia	r4!, {r0, r1, r2, r3}
20020d30:	c60f      	stmia	r6!, {r0, r1, r2, r3}
20020d32:	f854 3b04 	ldr.w	r3, [r4], #4
20020d36:	6033      	str	r3, [r6, #0]
20020d38:	ae03      	add	r6, sp, #12
20020d3a:	e894 000f 	ldmia.w	r4, {r0, r1, r2, r3}
20020d3e:	e886 000f 	stmia.w	r6, {r0, r1, r2, r3}
20020d42:	2301      	movs	r3, #1
20020d44:	4c8a      	ldr	r4, [pc, #552]	@ (20020f70 <dfu_flash_init+0x2a4>)
20020d46:	f884 3035 	strb.w	r3, [r4, #53]	@ 0x35
20020d4a:	2300      	movs	r3, #0
20020d4c:	9308      	str	r3, [sp, #32]
20020d4e:	683b      	ldr	r3, [r7, #0]
20020d50:	2b01      	cmp	r3, #1
20020d52:	d14d      	bne.n	20020df0 <dfu_flash_init+0x124>
20020d54:	f7ff fadc 	bl	20020310 <board_pinmux_mpi1_puya_base>
20020d58:	f009 faba 	bl	2002a2d0 <BSP_GetFlash1DIV>
20020d5c:	4633      	mov	r3, r6
20020d5e:	9000      	str	r0, [sp, #0]
20020d60:	4a84      	ldr	r2, [pc, #528]	@ (20020f74 <dfu_flash_init+0x2a8>)
20020d62:	4883      	ldr	r0, [pc, #524]	@ (20020f70 <dfu_flash_init+0x2a4>)
20020d64:	a907      	add	r1, sp, #28
20020d66:	f003 f82f 	bl	20023dc8 <HAL_FLASH_Init>
20020d6a:	683e      	ldr	r6, [r7, #0]
20020d6c:	2e01      	cmp	r6, #1
20020d6e:	d10d      	bne.n	20020d8c <dfu_flash_init+0xc0>
20020d70:	6b20      	ldr	r0, [r4, #48]	@ 0x30
20020d72:	4b81      	ldr	r3, [pc, #516]	@ (20020f78 <dfu_flash_init+0x2ac>)
20020d74:	1ac3      	subs	r3, r0, r3
20020d76:	4258      	negs	r0, r3
20020d78:	4158      	adcs	r0, r3
20020d7a:	f7ff faea 	bl	20020352 <board_pinmux_mpi1_puya_ext>
20020d7e:	4631      	mov	r1, r6
20020d80:	487b      	ldr	r0, [pc, #492]	@ (20020f70 <dfu_flash_init+0x2a4>)
20020d82:	f002 fa96 	bl	200232b2 <HAL_FLASH_SET_QUAL_SPI>
20020d86:	2302      	movs	r3, #2
20020d88:	f884 3020 	strb.w	r3, [r4, #32]
20020d8c:	4b7b      	ldr	r3, [pc, #492]	@ (20020f7c <dfu_flash_init+0x2b0>)
20020d8e:	4a7c      	ldr	r2, [pc, #496]	@ (20020f80 <dfu_flash_init+0x2b4>)
20020d90:	602b      	str	r3, [r5, #0]
20020d92:	4b7c      	ldr	r3, [pc, #496]	@ (20020f84 <dfu_flash_init+0x2b8>)
20020d94:	601a      	str	r2, [r3, #0]
20020d96:	4b7c      	ldr	r3, [pc, #496]	@ (20020f88 <dfu_flash_init+0x2bc>)
20020d98:	4a7c      	ldr	r2, [pc, #496]	@ (20020f8c <dfu_flash_init+0x2c0>)
20020d9a:	601a      	str	r2, [r3, #0]
20020d9c:	4b7c      	ldr	r3, [pc, #496]	@ (20020f90 <dfu_flash_init+0x2c4>)
20020d9e:	6ba2      	ldr	r2, [r4, #56]	@ 0x38
20020da0:	601a      	str	r2, [r3, #0]
20020da2:	4b7c      	ldr	r3, [pc, #496]	@ (20020f94 <dfu_flash_init+0x2c8>)
20020da4:	601c      	str	r4, [r3, #0]
20020da6:	2405      	movs	r4, #5
20020da8:	f8df 81ec 	ldr.w	r8, [pc, #492]	@ 20020f98 <dfu_flash_init+0x2cc>
20020dac:	4e78      	ldr	r6, [pc, #480]	@ (20020f90 <dfu_flash_init+0x2c4>)
20020dae:	f8df 921c 	ldr.w	r9, [pc, #540]	@ 20020fcc <dfu_flash_init+0x300>
20020db2:	682b      	ldr	r3, [r5, #0]
20020db4:	f642 4210 	movw	r2, #11280	@ 0x2c10
20020db8:	4977      	ldr	r1, [pc, #476]	@ (20020f98 <dfu_flash_init+0x2cc>)
20020dba:	6830      	ldr	r0, [r6, #0]
20020dbc:	4798      	blx	r3
20020dbe:	f8d8 3000 	ldr.w	r3, [r8]
20020dc2:	454b      	cmp	r3, r9
20020dc4:	f040 80c0 	bne.w	20020f48 <dfu_flash_init+0x27c>
20020dc8:	683b      	ldr	r3, [r7, #0]
20020dca:	2b04      	cmp	r3, #4
20020dcc:	f040 8085 	bne.w	20020eda <dfu_flash_init+0x20e>
20020dd0:	f8d8 30a4 	ldr.w	r3, [r8, #164]	@ 0xa4
20020dd4:	1e5a      	subs	r2, r3, #1
20020dd6:	3203      	adds	r2, #3
20020dd8:	d87f      	bhi.n	20020eda <dfu_flash_init+0x20e>
20020dda:	4a70      	ldr	r2, [pc, #448]	@ (20020f9c <dfu_flash_init+0x2d0>)
20020ddc:	496e      	ldr	r1, [pc, #440]	@ (20020f98 <dfu_flash_init+0x2cc>)
20020dde:	6013      	str	r3, [r2, #0]
20020de0:	f642 4210 	movw	r2, #11280	@ 0x2c10
20020de4:	682b      	ldr	r3, [r5, #0]
20020de6:	6830      	ldr	r0, [r6, #0]
20020de8:	b00c      	add	sp, #48	@ 0x30
20020dea:	e8bd 47f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
20020dee:	4718      	bx	r3
20020df0:	f7ff fade 	bl	200203b0 <board_pinmux_mpi1_gd>
20020df4:	2302      	movs	r3, #2
20020df6:	9308      	str	r3, [sp, #32]
20020df8:	e7ae      	b.n	20020d58 <dfu_flash_init+0x8c>
20020dfa:	485b      	ldr	r0, [pc, #364]	@ (20020f68 <dfu_flash_init+0x29c>)
20020dfc:	f004 f864 	bl	20024ec8 <HAL_RCC_HCPU_EnableDLL2>
20020e00:	4c67      	ldr	r4, [pc, #412]	@ (20020fa0 <dfu_flash_init+0x2d4>)
20020e02:	2006      	movs	r0, #6
20020e04:	f009 fa76 	bl	2002a2f4 <BSP_SetFlash2DIV>
20020e08:	ae07      	add	r6, sp, #28
20020e0a:	2102      	movs	r1, #2
20020e0c:	2006      	movs	r0, #6
20020e0e:	f004 f893 	bl	20024f38 <HAL_RCC_HCPU_ClockSelect>
20020e12:	cc0f      	ldmia	r4!, {r0, r1, r2, r3}
20020e14:	c60f      	stmia	r6!, {r0, r1, r2, r3}
20020e16:	f854 3b04 	ldr.w	r3, [r4], #4
20020e1a:	f8d7 8000 	ldr.w	r8, [r7]
20020e1e:	6033      	str	r3, [r6, #0]
20020e20:	ae03      	add	r6, sp, #12
20020e22:	e894 000f 	ldmia.w	r4, {r0, r1, r2, r3}
20020e26:	f1b8 0903 	subs.w	r9, r8, #3
20020e2a:	e886 000f 	stmia.w	r6, {r0, r1, r2, r3}
20020e2e:	bf18      	it	ne
20020e30:	f04f 0901 	movne.w	r9, #1
20020e34:	f7ff faff 	bl	20020436 <board_pinmux_mpi2>
20020e38:	2302      	movs	r3, #2
20020e3a:	f1b8 0f03 	cmp.w	r8, #3
20020e3e:	4c4c      	ldr	r4, [pc, #304]	@ (20020f70 <dfu_flash_init+0x2a4>)
20020e40:	9308      	str	r3, [sp, #32]
20020e42:	d04d      	beq.n	20020ee0 <dfu_flash_init+0x214>
20020e44:	4b57      	ldr	r3, [pc, #348]	@ (20020fa4 <dfu_flash_init+0x2d8>)
20020e46:	602b      	str	r3, [r5, #0]
20020e48:	9b09      	ldr	r3, [sp, #36]	@ 0x24
20020e4a:	f103 43a0 	add.w	r3, r3, #1342177280	@ 0x50000000
20020e4e:	9309      	str	r3, [sp, #36]	@ 0x24
20020e50:	2301      	movs	r3, #1
20020e52:	930b      	str	r3, [sp, #44]	@ 0x2c
20020e54:	4b54      	ldr	r3, [pc, #336]	@ (20020fa8 <dfu_flash_init+0x2dc>)
20020e56:	6623      	str	r3, [r4, #96]	@ 0x60
20020e58:	f04f 0a01 	mov.w	sl, #1
20020e5c:	2000      	movs	r0, #0
20020e5e:	f001 f882 	bl	20021f66 <HAL_Delay_us>
20020e62:	f884 a079 	strb.w	sl, [r4, #121]	@ 0x79
20020e66:	f884 9078 	strb.w	r9, [r4, #120]	@ 0x78
20020e6a:	f009 fa37 	bl	2002a2dc <BSP_GetFlash2DIV>
20020e6e:	4633      	mov	r3, r6
20020e70:	9000      	str	r0, [sp, #0]
20020e72:	4a4e      	ldr	r2, [pc, #312]	@ (20020fac <dfu_flash_init+0x2e0>)
20020e74:	484e      	ldr	r0, [pc, #312]	@ (20020fb0 <dfu_flash_init+0x2e4>)
20020e76:	a907      	add	r1, sp, #28
20020e78:	f002 ffa6 	bl	20023dc8 <HAL_FLASH_Init>
20020e7c:	4e4c      	ldr	r6, [pc, #304]	@ (20020fb0 <dfu_flash_init+0x2e4>)
20020e7e:	bb90      	cbnz	r0, 20020ee6 <dfu_flash_init+0x21a>
20020e80:	f1b8 0f03 	cmp.w	r8, #3
20020e84:	d032      	beq.n	20020eec <dfu_flash_init+0x220>
20020e86:	4630      	mov	r0, r6
20020e88:	f002 fcfa 	bl	20023880 <HAL_NAND_PAGE_SIZE>
20020e8c:	f8df 910c 	ldr.w	r9, [pc, #268]	@ 20020f9c <dfu_flash_init+0x2d0>
20020e90:	f8df 813c 	ldr.w	r8, [pc, #316]	@ 20020fd0 <dfu_flash_init+0x304>
20020e94:	f8c9 0000 	str.w	r0, [r9]
20020e98:	4630      	mov	r0, r6
20020e9a:	f002 fdb1 	bl	20023a00 <HAL_NAND_BLOCK_SIZE>
20020e9e:	4651      	mov	r1, sl
20020ea0:	f8c8 0000 	str.w	r0, [r8]
20020ea4:	4630      	mov	r0, r6
20020ea6:	f884 a06a 	strb.w	sl, [r4, #106]	@ 0x6a
20020eaa:	f002 fbc2 	bl	20023632 <HAL_NAND_CONF_ECC>
20020eae:	f8d9 0000 	ldr.w	r0, [r9]
20020eb2:	f004 ff3f 	bl	20025d34 <bbm_set_page_size>
20020eb6:	f8d8 0000 	ldr.w	r0, [r8]
20020eba:	f004 ff41 	bl	20025d40 <bbm_set_blk_size>
20020ebe:	493d      	ldr	r1, [pc, #244]	@ (20020fb4 <dfu_flash_init+0x2e8>)
20020ec0:	f8d4 0080 	ldr.w	r0, [r4, #128]	@ 0x80
20020ec4:	f004 fdd8 	bl	20025a78 <sif_bbm_init>
20020ec8:	4b31      	ldr	r3, [pc, #196]	@ (20020f90 <dfu_flash_init+0x2c4>)
20020eca:	6fe2      	ldr	r2, [r4, #124]	@ 0x7c
20020ecc:	601a      	str	r2, [r3, #0]
20020ece:	4b31      	ldr	r3, [pc, #196]	@ (20020f94 <dfu_flash_init+0x2c8>)
20020ed0:	601e      	str	r6, [r3, #0]
20020ed2:	682b      	ldr	r3, [r5, #0]
20020ed4:	2b00      	cmp	r3, #0
20020ed6:	f47f af66 	bne.w	20020da6 <dfu_flash_init+0xda>
20020eda:	b00c      	add	sp, #48	@ 0x30
20020edc:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
20020ee0:	4b26      	ldr	r3, [pc, #152]	@ (20020f7c <dfu_flash_init+0x2b0>)
20020ee2:	602b      	str	r3, [r5, #0]
20020ee4:	e7b8      	b.n	20020e58 <dfu_flash_init+0x18c>
20020ee6:	f1b8 0f03 	cmp.w	r8, #3
20020eea:	d1ed      	bne.n	20020ec8 <dfu_flash_init+0x1fc>
20020eec:	4b25      	ldr	r3, [pc, #148]	@ (20020f84 <dfu_flash_init+0x2b8>)
20020eee:	4a24      	ldr	r2, [pc, #144]	@ (20020f80 <dfu_flash_init+0x2b4>)
20020ef0:	601a      	str	r2, [r3, #0]
20020ef2:	4b25      	ldr	r3, [pc, #148]	@ (20020f88 <dfu_flash_init+0x2bc>)
20020ef4:	4a25      	ldr	r2, [pc, #148]	@ (20020f8c <dfu_flash_init+0x2c0>)
20020ef6:	601a      	str	r2, [r3, #0]
20020ef8:	e7e6      	b.n	20020ec8 <dfu_flash_init+0x1fc>
20020efa:	481b      	ldr	r0, [pc, #108]	@ (20020f68 <dfu_flash_init+0x29c>)
20020efc:	f003 ffe4 	bl	20024ec8 <HAL_RCC_HCPU_EnableDLL2>
20020f00:	f7ff fac0 	bl	20020484 <board_pinmux_sd>
20020f04:	f000 fd80 	bl	20021a08 <sdmmc1_sdnand>
20020f08:	2801      	cmp	r0, #1
20020f0a:	d001      	beq.n	20020f10 <dfu_flash_init+0x244>
20020f0c:	f7ff f9d0 	bl	200202b0 <boot_error>
20020f10:	4b29      	ldr	r3, [pc, #164]	@ (20020fb8 <dfu_flash_init+0x2ec>)
20020f12:	4a2a      	ldr	r2, [pc, #168]	@ (20020fbc <dfu_flash_init+0x2f0>)
20020f14:	602b      	str	r3, [r5, #0]
20020f16:	4b1e      	ldr	r3, [pc, #120]	@ (20020f90 <dfu_flash_init+0x2c4>)
20020f18:	601a      	str	r2, [r3, #0]
20020f1a:	2200      	movs	r2, #0
20020f1c:	4b1d      	ldr	r3, [pc, #116]	@ (20020f94 <dfu_flash_init+0x2c8>)
20020f1e:	601a      	str	r2, [r3, #0]
20020f20:	e741      	b.n	20020da6 <dfu_flash_init+0xda>
20020f22:	4811      	ldr	r0, [pc, #68]	@ (20020f68 <dfu_flash_init+0x29c>)
20020f24:	f003 ffd0 	bl	20024ec8 <HAL_RCC_HCPU_EnableDLL2>
20020f28:	f7ff faac 	bl	20020484 <board_pinmux_sd>
20020f2c:	f000 fb5c 	bl	200215e8 <sdio_emmc_init>
20020f30:	4b23      	ldr	r3, [pc, #140]	@ (20020fc0 <dfu_flash_init+0x2f4>)
20020f32:	6018      	str	r0, [r3, #0]
20020f34:	b110      	cbz	r0, 20020f3c <dfu_flash_init+0x270>
20020f36:	b2c0      	uxtb	r0, r0
20020f38:	f7ff f9ba 	bl	200202b0 <boot_error>
20020f3c:	4b21      	ldr	r3, [pc, #132]	@ (20020fc4 <dfu_flash_init+0x2f8>)
20020f3e:	e7e8      	b.n	20020f12 <dfu_flash_init+0x246>
20020f40:	2053      	movs	r0, #83	@ 0x53
20020f42:	f7ff f9b5 	bl	200202b0 <boot_error>
20020f46:	e7c4      	b.n	20020ed2 <dfu_flash_init+0x206>
20020f48:	481f      	ldr	r0, [pc, #124]	@ (20020fc8 <dfu_flash_init+0x2fc>)
20020f4a:	f001 f80c 	bl	20021f66 <HAL_Delay_us>
20020f4e:	3c01      	subs	r4, #1
20020f50:	f47f af2f 	bne.w	20020db2 <dfu_flash_init+0xe6>
20020f54:	2043      	movs	r0, #67	@ 0x43
20020f56:	b00c      	add	sp, #48	@ 0x30
20020f58:	e8bd 47f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
20020f5c:	f7ff b9a8 	b.w	200202b0 <boot_error>
20020f60:	20049f24 	.word	0x20049f24
20020f64:	20046d14 	.word	0x20046d14
20020f68:	112a8800 	.word	0x112a8800
20020f6c:	2002a948 	.word	0x2002a948
20020f70:	20046f20 	.word	0x20046f20
20020f74:	20046d18 	.word	0x20046d18
20020f78:	00176085 	.word	0x00176085
20020f7c:	20020a25 	.word	0x20020a25
20020f80:	20020999 	.word	0x20020999
20020f84:	20046d10 	.word	0x20046d10
20020f88:	20046d0c 	.word	0x20046d0c
20020f8c:	2002093d 	.word	0x2002093d
20020f90:	20046d04 	.word	0x20046d04
20020f94:	20046d08 	.word	0x20046d08
20020f98:	20047314 	.word	0x20047314
20020f9c:	20042c04 	.word	0x20042c04
20020fa0:	2002a96c 	.word	0x2002a96c
20020fa4:	20020a39 	.word	0x20020a39
20020fa8:	20045a84 	.word	0x20045a84
20020fac:	20046d80 	.word	0x20046d80
20020fb0:	20046f64 	.word	0x20046f64
20020fb4:	20044a04 	.word	0x20044a04
20020fb8:	20020ab9 	.word	0x20020ab9
20020fbc:	62001000 	.word	0x62001000
20020fc0:	20044a00 	.word	0x20044a00
20020fc4:	20020b21 	.word	0x20020b21
20020fc8:	000f4240 	.word	0x000f4240
20020fcc:	53454346 	.word	0x53454346
20020fd0:	20042c00 	.word	0x20042c00

20020fd4 <sifli_hw_efuse_read_bank>:
20020fd4:	2803      	cmp	r0, #3
20020fd6:	b508      	push	{r3, lr}
20020fd8:	d80c      	bhi.n	20020ff4 <sifli_hw_efuse_read_bank+0x20>
20020fda:	0200      	lsls	r0, r0, #8
20020fdc:	2220      	movs	r2, #32
20020fde:	4907      	ldr	r1, [pc, #28]	@ (20020ffc <sifli_hw_efuse_read_bank+0x28>)
20020fe0:	f400 407f 	and.w	r0, r0, #65280	@ 0xff00
20020fe4:	f001 fc66 	bl	200228b4 <HAL_EFUSE_Read>
20020fe8:	2800      	cmp	r0, #0
20020fea:	bf0c      	ite	eq
20020fec:	f06f 0001 	mvneq.w	r0, #1
20020ff0:	2000      	movne	r0, #0
20020ff2:	bd08      	pop	{r3, pc}
20020ff4:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
20020ff8:	e7fb      	b.n	20020ff2 <sifli_hw_efuse_read_bank+0x1e>
20020ffa:	bf00      	nop
20020ffc:	20047294 	.word	0x20047294

20021000 <sifli_hw_efuse_read>:
20021000:	b513      	push	{r0, r1, r4, lr}
20021002:	3801      	subs	r0, #1
20021004:	460c      	mov	r4, r1
20021006:	2803      	cmp	r0, #3
20021008:	d81e      	bhi.n	20021048 <sifli_hw_efuse_read+0x48>
2002100a:	e8df f000 	tbb	[pc, r0]
2002100e:	0c02      	.short	0x0c02
20021010:	1009      	.short	0x1009
20021012:	2210      	movs	r2, #16
20021014:	2000      	movs	r0, #0
20021016:	b002      	add	sp, #8
20021018:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
2002101c:	f001 bc4a 	b.w	200228b4 <HAL_EFUSE_Read>
20021020:	2208      	movs	r2, #8
20021022:	2080      	movs	r0, #128	@ 0x80
20021024:	e7f7      	b.n	20021016 <sifli_hw_efuse_read+0x16>
20021026:	2220      	movs	r2, #32
20021028:	f44f 7040 	mov.w	r0, #768	@ 0x300
2002102c:	e7f3      	b.n	20021016 <sifli_hw_efuse_read+0x16>
2002102e:	2204      	movs	r2, #4
20021030:	20c0      	movs	r0, #192	@ 0xc0
20021032:	eb0d 0102 	add.w	r1, sp, r2
20021036:	f001 fc3d 	bl	200228b4 <HAL_EFUSE_Read>
2002103a:	2804      	cmp	r0, #4
2002103c:	d104      	bne.n	20021048 <sifli_hw_efuse_read+0x48>
2002103e:	2001      	movs	r0, #1
20021040:	9b01      	ldr	r3, [sp, #4]
20021042:	7023      	strb	r3, [r4, #0]
20021044:	b002      	add	sp, #8
20021046:	bd10      	pop	{r4, pc}
20021048:	2000      	movs	r0, #0
2002104a:	e7fb      	b.n	20021044 <sifli_hw_efuse_read+0x44>

2002104c <sifli_hw_init_xip_key>:
2002104c:	b538      	push	{r3, r4, r5, lr}
2002104e:	4605      	mov	r5, r0
20021050:	4c0f      	ldr	r4, [pc, #60]	@ (20021090 <sifli_hw_init_xip_key+0x44>)
20021052:	2210      	movs	r2, #16
20021054:	68e3      	ldr	r3, [r4, #12]
20021056:	490f      	ldr	r1, [pc, #60]	@ (20021094 <sifli_hw_init_xip_key+0x48>)
20021058:	f043 0301 	orr.w	r3, r3, #1
2002105c:	60e3      	str	r3, [r4, #12]
2002105e:	2001      	movs	r0, #1
20021060:	f7ff ffce 	bl	20021000 <sifli_hw_efuse_read>
20021064:	2220      	movs	r2, #32
20021066:	2100      	movs	r1, #0
20021068:	480b      	ldr	r0, [pc, #44]	@ (20021098 <sifli_hw_init_xip_key+0x4c>)
2002106a:	f009 fbeb 	bl	2002a844 <memset>
2002106e:	2302      	movs	r3, #2
20021070:	2120      	movs	r1, #32
20021072:	4a08      	ldr	r2, [pc, #32]	@ (20021094 <sifli_hw_init_xip_key+0x48>)
20021074:	2000      	movs	r0, #0
20021076:	f000 ffef 	bl	20022058 <HAL_AES_init>
2002107a:	2320      	movs	r3, #32
2002107c:	4629      	mov	r1, r5
2002107e:	2000      	movs	r0, #0
20021080:	4a05      	ldr	r2, [pc, #20]	@ (20021098 <sifli_hw_init_xip_key+0x4c>)
20021082:	f001 f82d 	bl	200220e0 <HAL_AES_run>
20021086:	68e3      	ldr	r3, [r4, #12]
20021088:	f023 0301 	bic.w	r3, r3, #1
2002108c:	60e3      	str	r3, [r4, #12]
2002108e:	bd38      	pop	{r3, r4, r5, pc}
20021090:	5000b000 	.word	0x5000b000
20021094:	200472c4 	.word	0x200472c4
20021098:	20047274 	.word	0x20047274

2002109c <sifli_hw_dec_key>:
2002109c:	b538      	push	{r3, r4, r5, lr}
2002109e:	4604      	mov	r4, r0
200210a0:	460d      	mov	r5, r1
200210a2:	2210      	movs	r2, #16
200210a4:	4908      	ldr	r1, [pc, #32]	@ (200210c8 <sifli_hw_dec_key+0x2c>)
200210a6:	2001      	movs	r0, #1
200210a8:	f7ff ffaa 	bl	20021000 <sifli_hw_efuse_read>
200210ac:	2302      	movs	r3, #2
200210ae:	2120      	movs	r1, #32
200210b0:	4a05      	ldr	r2, [pc, #20]	@ (200210c8 <sifli_hw_dec_key+0x2c>)
200210b2:	2000      	movs	r0, #0
200210b4:	f000 ffd0 	bl	20022058 <HAL_AES_init>
200210b8:	2320      	movs	r3, #32
200210ba:	462a      	mov	r2, r5
200210bc:	4621      	mov	r1, r4
200210be:	2000      	movs	r0, #0
200210c0:	f001 f80e 	bl	200220e0 <HAL_AES_run>
200210c4:	2000      	movs	r0, #0
200210c6:	bd38      	pop	{r3, r4, r5, pc}
200210c8:	200472c4 	.word	0x200472c4

200210cc <dfu_get_counter>:
200210cc:	b538      	push	{r3, r4, r5, lr}
200210ce:	4d0a      	ldr	r5, [pc, #40]	@ (200210f8 <dfu_get_counter+0x2c>)
200210d0:	4604      	mov	r4, r0
200210d2:	2208      	movs	r2, #8
200210d4:	4629      	mov	r1, r5
200210d6:	2003      	movs	r0, #3
200210d8:	f7ff ff92 	bl	20021000 <sifli_hw_efuse_read>
200210dc:	2300      	movs	r3, #0
200210de:	e9c5 3302 	strd	r3, r3, [r5, #8]
200210e2:	230f      	movs	r3, #15
200210e4:	0924      	lsrs	r4, r4, #4
200210e6:	b12c      	cbz	r4, 200210f4 <dfu_get_counter+0x28>
200210e8:	54ec      	strb	r4, [r5, r3]
200210ea:	3b01      	subs	r3, #1
200210ec:	2b0b      	cmp	r3, #11
200210ee:	ea4f 2414 	mov.w	r4, r4, lsr #8
200210f2:	d1f8      	bne.n	200210e6 <dfu_get_counter+0x1a>
200210f4:	4800      	ldr	r0, [pc, #0]	@ (200210f8 <dfu_get_counter+0x2c>)
200210f6:	bd38      	pop	{r3, r4, r5, pc}
200210f8:	200472b4 	.word	0x200472b4

200210fc <sifli_hw_dec>:
200210fc:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
20021100:	4680      	mov	r8, r0
20021102:	4689      	mov	r9, r1
20021104:	4692      	mov	sl, r2
20021106:	2100      	movs	r1, #0
20021108:	f44f 7200 	mov.w	r2, #512	@ 0x200
2002110c:	4814      	ldr	r0, [pc, #80]	@ (20021160 <sifli_hw_dec+0x64>)
2002110e:	461e      	mov	r6, r3
20021110:	9f08      	ldr	r7, [sp, #32]
20021112:	2400      	movs	r4, #0
20021114:	f009 fb96 	bl	2002a844 <memset>
20021118:	42a6      	cmp	r6, r4
2002111a:	d802      	bhi.n	20021122 <sifli_hw_dec+0x26>
2002111c:	4620      	mov	r0, r4
2002111e:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
20021122:	1b35      	subs	r5, r6, r4
20021124:	f5b5 7f00 	cmp.w	r5, #512	@ 0x200
20021128:	bf28      	it	cs
2002112a:	f44f 7500 	movcs.w	r5, #512	@ 0x200
2002112e:	eb09 0104 	add.w	r1, r9, r4
20021132:	462a      	mov	r2, r5
20021134:	480a      	ldr	r0, [pc, #40]	@ (20021160 <sifli_hw_dec+0x64>)
20021136:	f009 fb9f 	bl	2002a878 <memcpy>
2002113a:	19e0      	adds	r0, r4, r7
2002113c:	f7ff ffc6 	bl	200210cc <dfu_get_counter>
20021140:	2301      	movs	r3, #1
20021142:	4602      	mov	r2, r0
20021144:	2120      	movs	r1, #32
20021146:	4640      	mov	r0, r8
20021148:	f000 ff86 	bl	20022058 <HAL_AES_init>
2002114c:	eb0a 0204 	add.w	r2, sl, r4
20021150:	462b      	mov	r3, r5
20021152:	2000      	movs	r0, #0
20021154:	4902      	ldr	r1, [pc, #8]	@ (20021160 <sifli_hw_dec+0x64>)
20021156:	f000 ffc3 	bl	200220e0 <HAL_AES_run>
2002115a:	442c      	add	r4, r5
2002115c:	e7dc      	b.n	20021118 <sifli_hw_dec+0x1c>
2002115e:	bf00      	nop
20021160:	20047074 	.word	0x20047074

20021164 <update_sec_flash>:
20021164:	b510      	push	{r4, lr}
20021166:	4604      	mov	r4, r0
20021168:	4b08      	ldr	r3, [pc, #32]	@ (2002118c <update_sec_flash+0x28>)
2002116a:	f44f 5140 	mov.w	r1, #12288	@ 0x3000
2002116e:	681b      	ldr	r3, [r3, #0]
20021170:	f04f 5090 	mov.w	r0, #301989888	@ 0x12000000
20021174:	4798      	blx	r3
20021176:	4b06      	ldr	r3, [pc, #24]	@ (20021190 <update_sec_flash+0x2c>)
20021178:	4621      	mov	r1, r4
2002117a:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
2002117e:	f642 4210 	movw	r2, #11280	@ 0x2c10
20021182:	f04f 5090 	mov.w	r0, #301989888	@ 0x12000000
20021186:	681b      	ldr	r3, [r3, #0]
20021188:	4718      	bx	r3
2002118a:	bf00      	nop
2002118c:	20046d0c 	.word	0x20046d0c
20021190:	20046d14 	.word	0x20046d14

20021194 <is_ota_program_valid>:
20021194:	2300      	movs	r3, #0
20021196:	b537      	push	{r0, r1, r2, r4, r5, lr}
20021198:	4d0b      	ldr	r5, [pc, #44]	@ (200211c8 <is_ota_program_valid+0x34>)
2002119a:	4669      	mov	r1, sp
2002119c:	e9cd 3300 	strd	r3, r3, [sp]
200211a0:	2204      	movs	r2, #4
200211a2:	682b      	ldr	r3, [r5, #0]
200211a4:	4604      	mov	r4, r0
200211a6:	4798      	blx	r3
200211a8:	2204      	movs	r2, #4
200211aa:	682b      	ldr	r3, [r5, #0]
200211ac:	eb0d 0102 	add.w	r1, sp, r2
200211b0:	18a0      	adds	r0, r4, r2
200211b2:	4798      	blx	r3
200211b4:	9800      	ldr	r0, [sp, #0]
200211b6:	f36f 000f 	bfc	r0, #0, #16
200211ba:	f100 4360 	add.w	r3, r0, #3758096384	@ 0xe0000000
200211be:	4258      	negs	r0, r3
200211c0:	4158      	adcs	r0, r3
200211c2:	b003      	add	sp, #12
200211c4:	bd30      	pop	{r4, r5, pc}
200211c6:	bf00      	nop
200211c8:	20046d14 	.word	0x20046d14

200211cc <boot_ram>:
200211cc:	4b05      	ldr	r3, [pc, #20]	@ (200211e4 <boot_ram+0x18>)
200211ce:	b082      	sub	sp, #8
200211d0:	6b9b      	ldr	r3, [r3, #56]	@ 0x38
200211d2:	9301      	str	r3, [sp, #4]
200211d4:	9b01      	ldr	r3, [sp, #4]
200211d6:	b113      	cbz	r3, 200211de <boot_ram+0x12>
200211d8:	9b01      	ldr	r3, [sp, #4]
200211da:	b002      	add	sp, #8
200211dc:	4718      	bx	r3
200211de:	b002      	add	sp, #8
200211e0:	4770      	bx	lr
200211e2:	bf00      	nop
200211e4:	500c0000 	.word	0x500c0000

200211e8 <is_addr_in_nor>:
200211e8:	4b09      	ldr	r3, [pc, #36]	@ (20021210 <is_addr_in_nor+0x28>)
200211ea:	4602      	mov	r2, r0
200211ec:	681b      	ldr	r3, [r3, #0]
200211ee:	b163      	cbz	r3, 2002120a <is_addr_in_nor+0x22>
200211f0:	f893 0023 	ldrb.w	r0, [r3, #35]	@ 0x23
200211f4:	b948      	cbnz	r0, 2002120a <is_addr_in_nor+0x22>
200211f6:	6919      	ldr	r1, [r3, #16]
200211f8:	4291      	cmp	r1, r2
200211fa:	d807      	bhi.n	2002120c <is_addr_in_nor+0x24>
200211fc:	695b      	ldr	r3, [r3, #20]
200211fe:	4419      	add	r1, r3
20021200:	4291      	cmp	r1, r2
20021202:	bf94      	ite	ls
20021204:	2000      	movls	r0, #0
20021206:	2001      	movhi	r0, #1
20021208:	4770      	bx	lr
2002120a:	2000      	movs	r0, #0
2002120c:	4770      	bx	lr
2002120e:	bf00      	nop
20021210:	20046d08 	.word	0x20046d08

20021214 <dfu_boot_img_in_flash>:
20021214:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20021218:	4f5e      	ldr	r7, [pc, #376]	@ (20021394 <dfu_boot_img_in_flash+0x180>)
2002121a:	1e84      	subs	r4, r0, #2
2002121c:	eb07 1300 	add.w	r3, r7, r0, lsl #4
20021220:	eb07 2040 	add.w	r0, r7, r0, lsl #9
20021224:	f8d3 8004 	ldr.w	r8, [r3, #4]
20021228:	68dd      	ldr	r5, [r3, #12]
2002122a:	f8b0 3c06 	ldrh.w	r3, [r0, #3078]	@ 0xc06
2002122e:	b085      	sub	sp, #20
20021230:	07db      	lsls	r3, r3, #31
20021232:	f140 8095 	bpl.w	20021360 <dfu_boot_img_in_flash+0x14c>
20021236:	f44f 7193 	mov.w	r1, #294	@ 0x126
2002123a:	f507 7082 	add.w	r0, r7, #260	@ 0x104
2002123e:	f000 fdc4 	bl	20021dca <sifli_sigkey_pub_verify>
20021242:	b110      	cbz	r0, 2002124a <dfu_boot_img_in_flash+0x36>
20021244:	2001      	movs	r0, #1
20021246:	f000 fe0d 	bl	20021e64 <sifli_secboot_exception>
2002124a:	2c07      	cmp	r4, #7
2002124c:	f300 8093 	bgt.w	20021376 <dfu_boot_img_in_flash+0x162>
20021250:	2003      	movs	r0, #3
20021252:	f7ff febf 	bl	20020fd4 <sifli_hw_efuse_read_bank>
20021256:	4262      	negs	r2, r4
20021258:	f002 0203 	and.w	r2, r2, #3
2002125c:	f004 0303 	and.w	r3, r4, #3
20021260:	bf58      	it	pl
20021262:	4253      	negpl	r3, r2
20021264:	2b02      	cmp	r3, #2
20021266:	f200 8086 	bhi.w	20021376 <dfu_boot_img_in_flash+0x162>
2002126a:	4628      	mov	r0, r5
2002126c:	f7ff ffbc 	bl	200211e8 <is_addr_in_nor>
20021270:	f241 0308 	movw	r3, #4104	@ 0x1008
20021274:	4682      	mov	sl, r0
20021276:	ea4f 2944 	mov.w	r9, r4, lsl #9
2002127a:	f8df c12c 	ldr.w	ip, [pc, #300]	@ 200213a8 <dfu_boot_img_in_flash+0x194>
2002127e:	eb07 0609 	add.w	r6, r7, r9
20021282:	441e      	add	r6, r3
20021284:	ce0f      	ldmia	r6!, {r0, r1, r2, r3}
20021286:	e8ac 000f 	stmia.w	ip!, {r0, r1, r2, r3}
2002128a:	e896 000f 	ldmia.w	r6, {r0, r1, r2, r3}
2002128e:	e88c 000f 	stmia.w	ip, {r0, r1, r2, r3}
20021292:	f1ba 0f00 	cmp.w	sl, #0
20021296:	d04b      	beq.n	20021330 <dfu_boot_img_in_flash+0x11c>
20021298:	f104 0608 	add.w	r6, r4, #8
2002129c:	f1ac 0010 	sub.w	r0, ip, #16
200212a0:	0276      	lsls	r6, r6, #9
200212a2:	f7ff fed3 	bl	2002104c <sifli_hw_init_xip_key>
200212a6:	59ba      	ldr	r2, [r7, r6]
200212a8:	f8df a0f0 	ldr.w	sl, [pc, #240]	@ 2002139c <dfu_boot_img_in_flash+0x188>
200212ac:	442a      	add	r2, r5
200212ae:	2000      	movs	r0, #0
200212b0:	f8da b000 	ldr.w	fp, [sl]
200212b4:	9203      	str	r2, [sp, #12]
200212b6:	f7ff ff09 	bl	200210cc <dfu_get_counter>
200212ba:	4629      	mov	r1, r5
200212bc:	4603      	mov	r3, r0
200212be:	9a03      	ldr	r2, [sp, #12]
200212c0:	4658      	mov	r0, fp
200212c2:	f002 f964 	bl	2002358e <HAL_FLASH_NONCE_CFG>
200212c6:	4629      	mov	r1, r5
200212c8:	f8da 0000 	ldr.w	r0, [sl]
200212cc:	59ba      	ldr	r2, [r7, r6]
200212ce:	eba8 0305 	sub.w	r3, r8, r5
200212d2:	f002 f94b 	bl	2002356c <HAL_FLASH_ALIAS_CFG>
200212d6:	2101      	movs	r1, #1
200212d8:	f8da 0000 	ldr.w	r0, [sl]
200212dc:	f002 f96f 	bl	200235be <HAL_FLASH_AES_CFG>
200212e0:	f104 0308 	add.w	r3, r4, #8
200212e4:	f509 5081 	add.w	r0, r9, #4128	@ 0x1020
200212e8:	025b      	lsls	r3, r3, #9
200212ea:	3008      	adds	r0, #8
200212ec:	462a      	mov	r2, r5
200212ee:	58fb      	ldr	r3, [r7, r3]
200212f0:	4929      	ldr	r1, [pc, #164]	@ (20021398 <dfu_boot_img_in_flash+0x184>)
200212f2:	4438      	add	r0, r7
200212f4:	f000 fd81 	bl	20021dfa <sifli_img_sig_hash_verify>
200212f8:	b110      	cbz	r0, 20021300 <dfu_boot_img_in_flash+0xec>
200212fa:	2002      	movs	r0, #2
200212fc:	f000 fdb2 	bl	20021e64 <sifli_secboot_exception>
20021300:	f8d5 d000 	ldr.w	sp, [r5]
20021304:	f8d5 f004 	ldr.w	pc, [r5, #4]
20021308:	4628      	mov	r0, r5
2002130a:	f7ff ff6d 	bl	200211e8 <is_addr_in_nor>
2002130e:	2800      	cmp	r0, #0
20021310:	d034      	beq.n	2002137c <dfu_boot_img_in_flash+0x168>
20021312:	4822      	ldr	r0, [pc, #136]	@ (2002139c <dfu_boot_img_in_flash+0x188>)
20021314:	3408      	adds	r4, #8
20021316:	0264      	lsls	r4, r4, #9
20021318:	4629      	mov	r1, r5
2002131a:	593a      	ldr	r2, [r7, r4]
2002131c:	6800      	ldr	r0, [r0, #0]
2002131e:	eba8 0305 	sub.w	r3, r8, r5
20021322:	f002 f923 	bl	2002356c <HAL_FLASH_ALIAS_CFG>
20021326:	f8d5 d000 	ldr.w	sp, [r5]
2002132a:	f8d5 f004 	ldr.w	pc, [r5, #4]
2002132e:	e022      	b.n	20021376 <dfu_boot_img_in_flash+0x162>
20021330:	f1ac 0010 	sub.w	r0, ip, #16
20021334:	2220      	movs	r2, #32
20021336:	491a      	ldr	r1, [pc, #104]	@ (200213a0 <dfu_boot_img_in_flash+0x18c>)
20021338:	f7ff feb0 	bl	2002109c <sifli_hw_dec_key>
2002133c:	f104 0608 	add.w	r6, r4, #8
20021340:	4b18      	ldr	r3, [pc, #96]	@ (200213a4 <dfu_boot_img_in_flash+0x190>)
20021342:	0276      	lsls	r6, r6, #9
20021344:	4629      	mov	r1, r5
20021346:	59ba      	ldr	r2, [r7, r6]
20021348:	4640      	mov	r0, r8
2002134a:	681b      	ldr	r3, [r3, #0]
2002134c:	4798      	blx	r3
2002134e:	f8cd a000 	str.w	sl, [sp]
20021352:	462a      	mov	r2, r5
20021354:	4629      	mov	r1, r5
20021356:	59bb      	ldr	r3, [r7, r6]
20021358:	4811      	ldr	r0, [pc, #68]	@ (200213a0 <dfu_boot_img_in_flash+0x18c>)
2002135a:	f7ff fecf 	bl	200210fc <sifli_hw_dec>
2002135e:	e7bf      	b.n	200212e0 <dfu_boot_img_in_flash+0xcc>
20021360:	2c07      	cmp	r4, #7
20021362:	dc08      	bgt.n	20021376 <dfu_boot_img_in_flash+0x162>
20021364:	4262      	negs	r2, r4
20021366:	f002 0203 	and.w	r2, r2, #3
2002136a:	f004 0303 	and.w	r3, r4, #3
2002136e:	bf58      	it	pl
20021370:	4253      	negpl	r3, r2
20021372:	2b02      	cmp	r3, #2
20021374:	d9c8      	bls.n	20021308 <dfu_boot_img_in_flash+0xf4>
20021376:	b005      	add	sp, #20
20021378:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
2002137c:	45a8      	cmp	r8, r5
2002137e:	d0d2      	beq.n	20021326 <dfu_boot_img_in_flash+0x112>
20021380:	4b08      	ldr	r3, [pc, #32]	@ (200213a4 <dfu_boot_img_in_flash+0x190>)
20021382:	3408      	adds	r4, #8
20021384:	0264      	lsls	r4, r4, #9
20021386:	4629      	mov	r1, r5
20021388:	4640      	mov	r0, r8
2002138a:	681b      	ldr	r3, [r3, #0]
2002138c:	593a      	ldr	r2, [r7, r4]
2002138e:	4798      	blx	r3
20021390:	e7c9      	b.n	20021326 <dfu_boot_img_in_flash+0x112>
20021392:	bf00      	nop
20021394:	20047314 	.word	0x20047314
20021398:	20047418 	.word	0x20047418
2002139c:	20046d08 	.word	0x20046d08
200213a0:	200472d4 	.word	0x200472d4
200213a4:	20046d14 	.word	0x20046d14
200213a8:	200472f4 	.word	0x200472f4

200213ac <boot_images_help>:
200213ac:	e92d 43f7 	stmdb	sp!, {r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
200213b0:	4b56      	ldr	r3, [pc, #344]	@ (2002150c <boot_images_help+0x160>)
200213b2:	681a      	ldr	r2, [r3, #0]
200213b4:	4b56      	ldr	r3, [pc, #344]	@ (20021510 <boot_images_help+0x164>)
200213b6:	429a      	cmp	r2, r3
200213b8:	f040 80a4 	bne.w	20021504 <boot_images_help+0x158>
200213bc:	4c55      	ldr	r4, [pc, #340]	@ (20021514 <boot_images_help+0x168>)
200213be:	4f56      	ldr	r7, [pc, #344]	@ (20021518 <boot_images_help+0x16c>)
200213c0:	4e56      	ldr	r6, [pc, #344]	@ (2002151c <boot_images_help+0x170>)
200213c2:	2500      	movs	r5, #0
200213c4:	2204      	movs	r2, #4
200213c6:	4669      	mov	r1, sp
200213c8:	4620      	mov	r0, r4
200213ca:	683b      	ldr	r3, [r7, #0]
200213cc:	9500      	str	r5, [sp, #0]
200213ce:	4798      	blx	r3
200213d0:	2804      	cmp	r0, #4
200213d2:	4602      	mov	r2, r0
200213d4:	d146      	bne.n	20021464 <boot_images_help+0xb8>
200213d6:	4b52      	ldr	r3, [pc, #328]	@ (20021520 <boot_images_help+0x174>)
200213d8:	9900      	ldr	r1, [sp, #0]
200213da:	4299      	cmp	r1, r3
200213dc:	d142      	bne.n	20021464 <boot_images_help+0xb8>
200213de:	683b      	ldr	r3, [r7, #0]
200213e0:	9501      	str	r5, [sp, #4]
200213e2:	a901      	add	r1, sp, #4
200213e4:	1f20      	subs	r0, r4, #4
200213e6:	4798      	blx	r3
200213e8:	2804      	cmp	r0, #4
200213ea:	d13b      	bne.n	20021464 <boot_images_help+0xb8>
200213ec:	9b01      	ldr	r3, [sp, #4]
200213ee:	2b00      	cmp	r3, #0
200213f0:	d038      	beq.n	20021464 <boot_images_help+0xb8>
200213f2:	4c4c      	ldr	r4, [pc, #304]	@ (20021524 <boot_images_help+0x178>)
200213f4:	4620      	mov	r0, r4
200213f6:	f7ff fecd 	bl	20021194 <is_ota_program_valid>
200213fa:	2800      	cmp	r0, #0
200213fc:	d137      	bne.n	2002146e <boot_images_help+0xc2>
200213fe:	2008      	movs	r0, #8
20021400:	f00a ff6c 	bl	2002c2dc <HAL_Get_backup>
20021404:	4605      	mov	r5, r0
20021406:	2005      	movs	r0, #5
20021408:	f00a ff68 	bl	2002c2dc <HAL_Get_backup>
2002140c:	f8df 812c 	ldr.w	r8, [pc, #300]	@ 2002153c <boot_images_help+0x190>
20021410:	4945      	ldr	r1, [pc, #276]	@ (20021528 <boot_images_help+0x17c>)
20021412:	683b      	ldr	r3, [r7, #0]
20021414:	4f45      	ldr	r7, [pc, #276]	@ (2002152c <boot_images_help+0x180>)
20021416:	4606      	mov	r6, r0
20021418:	f642 4210 	movw	r2, #11280	@ 0x2c10
2002141c:	f04f 5090 	mov.w	r0, #301989888	@ 0x12000000
20021420:	f8c8 1000 	str.w	r1, [r8]
20021424:	4798      	blx	r3
20021426:	4c42      	ldr	r4, [pc, #264]	@ (20021530 <boot_images_help+0x184>)
20021428:	f8d7 9c08 	ldr.w	r9, [r7, #3080]	@ 0xc08
2002142c:	45a1      	cmp	r9, r4
2002142e:	d148      	bne.n	200214c2 <boot_images_help+0x116>
20021430:	b2eb      	uxtb	r3, r5
20021432:	2b04      	cmp	r3, #4
20021434:	d020      	beq.n	20021478 <boot_images_help+0xcc>
20021436:	2b06      	cmp	r3, #6
20021438:	d033      	beq.n	200214a2 <boot_images_help+0xf6>
2002143a:	2b01      	cmp	r3, #1
2002143c:	d13c      	bne.n	200214b8 <boot_images_help+0x10c>
2002143e:	f8d7 3c08 	ldr.w	r3, [r7, #3080]	@ 0xc08
20021442:	1c5a      	adds	r2, r3, #1
20021444:	d05e      	beq.n	20021504 <boot_images_help+0x158>
20021446:	4a3b      	ldr	r2, [pc, #236]	@ (20021534 <boot_images_help+0x188>)
20021448:	6814      	ldr	r4, [r2, #0]
2002144a:	1b1c      	subs	r4, r3, r4
2002144c:	f5a4 5480 	sub.w	r4, r4, #4096	@ 0x1000
20021450:	0a64      	lsrs	r4, r4, #9
20021452:	3402      	adds	r4, #2
20021454:	f7ff fa44 	bl	200208e0 <board_init_psram>
20021458:	4620      	mov	r0, r4
2002145a:	b003      	add	sp, #12
2002145c:	e8bd 43f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, lr}
20021460:	f7ff bed8 	b.w	20021214 <dfu_boot_img_in_flash>
20021464:	f504 74a6 	add.w	r4, r4, #332	@ 0x14c
20021468:	42b4      	cmp	r4, r6
2002146a:	d1aa      	bne.n	200213c2 <boot_images_help+0x16>
2002146c:	e7c7      	b.n	200213fe <boot_images_help+0x52>
2002146e:	f8d4 d000 	ldr.w	sp, [r4]
20021472:	f8d4 f004 	ldr.w	pc, [r4, #4]
20021476:	e7c2      	b.n	200213fe <boot_images_help+0x52>
20021478:	4c2f      	ldr	r4, [pc, #188]	@ (20021538 <boot_images_help+0x18c>)
2002147a:	2008      	movs	r0, #8
2002147c:	2106      	movs	r1, #6
2002147e:	f8c7 4c08 	str.w	r4, [r7, #3080]	@ 0xc08
20021482:	f00a ff25 	bl	2002c2d0 <HAL_Set_backup>
20021486:	f8d8 0000 	ldr.w	r0, [r8]
2002148a:	f500 5300 	add.w	r3, r0, #8192	@ 0x2000
2002148e:	f8c3 4c08 	str.w	r4, [r3, #3080]	@ 0xc08
20021492:	b11e      	cbz	r6, 2002149c <boot_images_help+0xf0>
20021494:	f500 5380 	add.w	r3, r0, #4096	@ 0x1000
20021498:	f8c3 6c00 	str.w	r6, [r3, #3072]	@ 0xc00
2002149c:	f7ff fe62 	bl	20021164 <update_sec_flash>
200214a0:	e7cd      	b.n	2002143e <boot_images_help+0x92>
200214a2:	2101      	movs	r1, #1
200214a4:	2008      	movs	r0, #8
200214a6:	f00a ff13 	bl	2002c2d0 <HAL_Set_backup>
200214aa:	f8d8 0000 	ldr.w	r0, [r8]
200214ae:	f500 5300 	add.w	r3, r0, #8192	@ 0x2000
200214b2:	f8c3 9c08 	str.w	r9, [r3, #3080]	@ 0xc08
200214b6:	e7f1      	b.n	2002149c <boot_images_help+0xf0>
200214b8:	2101      	movs	r1, #1
200214ba:	2008      	movs	r0, #8
200214bc:	f00a ff08 	bl	2002c2d0 <HAL_Set_backup>
200214c0:	e7bd      	b.n	2002143e <boot_images_help+0x92>
200214c2:	4b1d      	ldr	r3, [pc, #116]	@ (20021538 <boot_images_help+0x18c>)
200214c4:	4599      	cmp	r9, r3
200214c6:	d1ba      	bne.n	2002143e <boot_images_help+0x92>
200214c8:	b2eb      	uxtb	r3, r5
200214ca:	2b03      	cmp	r3, #3
200214cc:	d005      	beq.n	200214da <boot_images_help+0x12e>
200214ce:	2b05      	cmp	r3, #5
200214d0:	d016      	beq.n	20021500 <boot_images_help+0x154>
200214d2:	2b02      	cmp	r3, #2
200214d4:	d0b3      	beq.n	2002143e <boot_images_help+0x92>
200214d6:	2102      	movs	r1, #2
200214d8:	e7ef      	b.n	200214ba <boot_images_help+0x10e>
200214da:	2008      	movs	r0, #8
200214dc:	2105      	movs	r1, #5
200214de:	f8c7 4c08 	str.w	r4, [r7, #3080]	@ 0xc08
200214e2:	f00a fef5 	bl	2002c2d0 <HAL_Set_backup>
200214e6:	f8d8 0000 	ldr.w	r0, [r8]
200214ea:	f500 5300 	add.w	r3, r0, #8192	@ 0x2000
200214ee:	f8c3 4c08 	str.w	r4, [r3, #3080]	@ 0xc08
200214f2:	2e00      	cmp	r6, #0
200214f4:	d0d2      	beq.n	2002149c <boot_images_help+0xf0>
200214f6:	f500 5380 	add.w	r3, r0, #4096	@ 0x1000
200214fa:	f8c3 6400 	str.w	r6, [r3, #1024]	@ 0x400
200214fe:	e7cd      	b.n	2002149c <boot_images_help+0xf0>
20021500:	2102      	movs	r1, #2
20021502:	e7cf      	b.n	200214a4 <boot_images_help+0xf8>
20021504:	b003      	add	sp, #12
20021506:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
2002150a:	bf00      	nop
2002150c:	20047314 	.word	0x20047314
20021510:	53454346 	.word	0x53454346
20021514:	12207148 	.word	0x12207148
20021518:	20046d14 	.word	0x20046d14
2002151c:	1220752c 	.word	0x1220752c
20021520:	75006e00 	.word	0x75006e00
20021524:	12008000 	.word	0x12008000
20021528:	20049f2c 	.word	0x20049f2c
2002152c:	20049314 	.word	0x20049314
20021530:	12001400 	.word	0x12001400
20021534:	20046d04 	.word	0x20046d04
20021538:	12001c00 	.word	0x12001c00
2002153c:	20049f28 	.word	0x20049f28

20021540 <hw_preinit0>:
20021540:	b508      	push	{r3, lr}
20021542:	4b0e      	ldr	r3, [pc, #56]	@ (2002157c <hw_preinit0+0x3c>)
20021544:	685b      	ldr	r3, [r3, #4]
20021546:	b2db      	uxtb	r3, r3
20021548:	2b06      	cmp	r3, #6
2002154a:	d80a      	bhi.n	20021562 <hw_preinit0+0x22>
2002154c:	4a0c      	ldr	r2, [pc, #48]	@ (20021580 <hw_preinit0+0x40>)
2002154e:	6a93      	ldr	r3, [r2, #40]	@ 0x28
20021550:	f023 037f 	bic.w	r3, r3, #127	@ 0x7f
20021554:	f043 0306 	orr.w	r3, r3, #6
20021558:	6293      	str	r3, [r2, #40]	@ 0x28
2002155a:	6853      	ldr	r3, [r2, #4]
2002155c:	f043 0380 	orr.w	r3, r3, #128	@ 0x80
20021560:	6053      	str	r3, [r2, #4]
20021562:	2000      	movs	r0, #0
20021564:	f000 fcff 	bl	20021f66 <HAL_Delay_us>
20021568:	4b06      	ldr	r3, [pc, #24]	@ (20021584 <hw_preinit0+0x44>)
2002156a:	4a07      	ldr	r2, [pc, #28]	@ (20021588 <hw_preinit0+0x48>)
2002156c:	2000      	movs	r0, #0
2002156e:	605a      	str	r2, [r3, #4]
20021570:	f7ff fd30 	bl	20020fd4 <sifli_hw_efuse_read_bank>
20021574:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
20021578:	f7ff be28 	b.w	200211cc <boot_ram>
2002157c:	5000b000 	.word	0x5000b000
20021580:	500ca000 	.word	0x500ca000
20021584:	5000c000 	.word	0x5000c000
20021588:	0002d08f 	.word	0x0002d08f

2002158c <entry>:
2002158c:	4c14      	ldr	r4, [pc, #80]	@ (200215e0 <entry+0x54>)
2002158e:	b508      	push	{r3, lr}
20021590:	2000      	movs	r0, #0
20021592:	f000 fce8 	bl	20021f66 <HAL_Delay_us>
20021596:	6863      	ldr	r3, [r4, #4]
20021598:	4d12      	ldr	r5, [pc, #72]	@ (200215e4 <entry+0x58>)
2002159a:	b2db      	uxtb	r3, r3
2002159c:	2b06      	cmp	r3, #6
2002159e:	d90f      	bls.n	200215c0 <entry+0x34>
200215a0:	f7fe ffbe 	bl	20020520 <board_flash_power_on>
200215a4:	f7fe feac 	bl	20020300 <HAL_MspInit>
200215a8:	f7fe ff9c 	bl	200204e4 <board_boot_from>
200215ac:	6028      	str	r0, [r5, #0]
200215ae:	68e3      	ldr	r3, [r4, #12]
200215b0:	f023 0301 	bic.w	r3, r3, #1
200215b4:	60e3      	str	r3, [r4, #12]
200215b6:	f7ff fb89 	bl	20020ccc <dfu_flash_init>
200215ba:	f7ff fef7 	bl	200213ac <boot_images_help>
200215be:	e7fe      	b.n	200215be <entry+0x32>
200215c0:	f7fe ff90 	bl	200204e4 <board_boot_from>
200215c4:	6028      	str	r0, [r5, #0]
200215c6:	f7fe ffab 	bl	20020520 <board_flash_power_on>
200215ca:	f7fe fe99 	bl	20020300 <HAL_MspInit>
200215ce:	68e3      	ldr	r3, [r4, #12]
200215d0:	f023 0301 	bic.w	r3, r3, #1
200215d4:	60e3      	str	r3, [r4, #12]
200215d6:	f7ff fb79 	bl	20020ccc <dfu_flash_init>
200215da:	f7ff fee7 	bl	200213ac <boot_images_help>
200215de:	e7ee      	b.n	200215be <entry+0x32>
200215e0:	5000b000 	.word	0x5000b000
200215e4:	20049f24 	.word	0x20049f24

200215e8 <sdio_emmc_init>:
200215e8:	b570      	push	{r4, r5, r6, lr}
200215ea:	b08c      	sub	sp, #48	@ 0x30
200215ec:	f000 f968 	bl	200218c0 <sd1_init>
200215f0:	4c8d      	ldr	r4, [pc, #564]	@ (20021828 <sdio_emmc_init+0x240>)
200215f2:	4b8e      	ldr	r3, [pc, #568]	@ (2002182c <sdio_emmc_init+0x244>)
200215f4:	2500      	movs	r5, #0
200215f6:	6323      	str	r3, [r4, #48]	@ 0x30
200215f8:	6b23      	ldr	r3, [r4, #48]	@ 0x30
200215fa:	f44f 70fa 	mov.w	r0, #500	@ 0x1f4
200215fe:	f043 0302 	orr.w	r3, r3, #2
20021602:	6323      	str	r3, [r4, #48]	@ 0x30
20021604:	f04f 7300 	mov.w	r3, #33554432	@ 0x2000000
20021608:	62e5      	str	r5, [r4, #44]	@ 0x2c
2002160a:	6223      	str	r3, [r4, #32]
2002160c:	f000 fcab 	bl	20021f66 <HAL_Delay_us>
20021610:	4629      	mov	r1, r5
20021612:	4628      	mov	r0, r5
20021614:	f000 f986 	bl	20021924 <sd1_send_cmd>
20021618:	2301      	movs	r3, #1
2002161a:	65e3      	str	r3, [r4, #92]	@ 0x5c
2002161c:	6de3      	ldr	r3, [r4, #92]	@ 0x5c
2002161e:	079d      	lsls	r5, r3, #30
20021620:	d5fc      	bpl.n	2002161c <sdio_emmc_init+0x34>
20021622:	6be3      	ldr	r3, [r4, #60]	@ 0x3c
20021624:	f043 0320 	orr.w	r3, r3, #32
20021628:	63e3      	str	r3, [r4, #60]	@ 0x3c
2002162a:	4981      	ldr	r1, [pc, #516]	@ (20021830 <sdio_emmc_init+0x248>)
2002162c:	2001      	movs	r0, #1
2002162e:	ad07      	add	r5, sp, #28
20021630:	f000 f978 	bl	20021924 <sd1_send_cmd>
20021634:	ab06      	add	r3, sp, #24
20021636:	aa05      	add	r2, sp, #20
20021638:	a904      	add	r1, sp, #16
2002163a:	f10d 000f 	add.w	r0, sp, #15
2002163e:	9500      	str	r5, [sp, #0]
20021640:	f000 f9ae 	bl	200219a0 <sd1_get_rsp>
20021644:	2014      	movs	r0, #20
20021646:	f000 fc8e 	bl	20021f66 <HAL_Delay_us>
2002164a:	9b04      	ldr	r3, [sp, #16]
2002164c:	2b00      	cmp	r3, #0
2002164e:	daec      	bge.n	2002162a <sdio_emmc_init+0x42>
20021650:	2014      	movs	r0, #20
20021652:	f000 fc88 	bl	20021f66 <HAL_Delay_us>
20021656:	2100      	movs	r1, #0
20021658:	2002      	movs	r0, #2
2002165a:	f000 f963 	bl	20021924 <sd1_send_cmd>
2002165e:	2801      	cmp	r0, #1
20021660:	f000 8081 	beq.w	20021766 <sdio_emmc_init+0x17e>
20021664:	2802      	cmp	r0, #2
20021666:	d07e      	beq.n	20021766 <sdio_emmc_init+0x17e>
20021668:	ab08      	add	r3, sp, #32
2002166a:	aa0a      	add	r2, sp, #40	@ 0x28
2002166c:	a90b      	add	r1, sp, #44	@ 0x2c
2002166e:	9300      	str	r3, [sp, #0]
20021670:	f10d 000f 	add.w	r0, sp, #15
20021674:	ab09      	add	r3, sp, #36	@ 0x24
20021676:	f000 f993 	bl	200219a0 <sd1_get_rsp>
2002167a:	2014      	movs	r0, #20
2002167c:	f000 fc73 	bl	20021f66 <HAL_Delay_us>
20021680:	f44f 3180 	mov.w	r1, #65536	@ 0x10000
20021684:	2003      	movs	r0, #3
20021686:	f000 f94d 	bl	20021924 <sd1_send_cmd>
2002168a:	2801      	cmp	r0, #1
2002168c:	f000 80ab 	beq.w	200217e6 <sdio_emmc_init+0x1fe>
20021690:	2802      	cmp	r0, #2
20021692:	f000 80aa 	beq.w	200217ea <sdio_emmc_init+0x202>
20021696:	ab06      	add	r3, sp, #24
20021698:	9500      	str	r5, [sp, #0]
2002169a:	aa05      	add	r2, sp, #20
2002169c:	a904      	add	r1, sp, #16
2002169e:	f10d 000f 	add.w	r0, sp, #15
200216a2:	f000 f97d 	bl	200219a0 <sd1_get_rsp>
200216a6:	f89d 300f 	ldrb.w	r3, [sp, #15]
200216aa:	2b03      	cmp	r3, #3
200216ac:	f040 809f 	bne.w	200217ee <sdio_emmc_init+0x206>
200216b0:	4c5d      	ldr	r4, [pc, #372]	@ (20021828 <sdio_emmc_init+0x240>)
200216b2:	2014      	movs	r0, #20
200216b4:	6be3      	ldr	r3, [r4, #60]	@ 0x3c
200216b6:	f023 0320 	bic.w	r3, r3, #32
200216ba:	63e3      	str	r3, [r4, #60]	@ 0x3c
200216bc:	f000 fc53 	bl	20021f66 <HAL_Delay_us>
200216c0:	f44f 3180 	mov.w	r1, #65536	@ 0x10000
200216c4:	2009      	movs	r0, #9
200216c6:	f000 f92d 	bl	20021924 <sd1_send_cmd>
200216ca:	2801      	cmp	r0, #1
200216cc:	f000 8091 	beq.w	200217f2 <sdio_emmc_init+0x20a>
200216d0:	2802      	cmp	r0, #2
200216d2:	f000 8090 	beq.w	200217f6 <sdio_emmc_init+0x20e>
200216d6:	aa05      	add	r2, sp, #20
200216d8:	a904      	add	r1, sp, #16
200216da:	ab06      	add	r3, sp, #24
200216dc:	f10d 000f 	add.w	r0, sp, #15
200216e0:	9500      	str	r5, [sp, #0]
200216e2:	f000 f95d 	bl	200219a0 <sd1_get_rsp>
200216e6:	f44f 53b8 	mov.w	r3, #5888	@ 0x1700
200216ea:	6323      	str	r3, [r4, #48]	@ 0x30
200216ec:	6b23      	ldr	r3, [r4, #48]	@ 0x30
200216ee:	2014      	movs	r0, #20
200216f0:	f043 0302 	orr.w	r3, r3, #2
200216f4:	6323      	str	r3, [r4, #48]	@ 0x30
200216f6:	f04f 7300 	mov.w	r3, #33554432	@ 0x2000000
200216fa:	6223      	str	r3, [r4, #32]
200216fc:	2302      	movs	r3, #2
200216fe:	63e3      	str	r3, [r4, #60]	@ 0x3c
20021700:	f000 fc31 	bl	20021f66 <HAL_Delay_us>
20021704:	f44f 3180 	mov.w	r1, #65536	@ 0x10000
20021708:	2007      	movs	r0, #7
2002170a:	f000 f90b 	bl	20021924 <sd1_send_cmd>
2002170e:	2801      	cmp	r0, #1
20021710:	d073      	beq.n	200217fa <sdio_emmc_init+0x212>
20021712:	2802      	cmp	r0, #2
20021714:	d073      	beq.n	200217fe <sdio_emmc_init+0x216>
20021716:	ab06      	add	r3, sp, #24
20021718:	9500      	str	r5, [sp, #0]
2002171a:	aa05      	add	r2, sp, #20
2002171c:	a904      	add	r1, sp, #16
2002171e:	f10d 000f 	add.w	r0, sp, #15
20021722:	f000 f93d 	bl	200219a0 <sd1_get_rsp>
20021726:	f89d 300f 	ldrb.w	r3, [sp, #15]
2002172a:	2b07      	cmp	r3, #7
2002172c:	d169      	bne.n	20021802 <sdio_emmc_init+0x21a>
2002172e:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
20021732:	2101      	movs	r1, #1
20021734:	2000      	movs	r0, #0
20021736:	6023      	str	r3, [r4, #0]
20021738:	f000 f942 	bl	200219c0 <sd1_read>
2002173c:	2100      	movs	r1, #0
2002173e:	2008      	movs	r0, #8
20021740:	f000 f8f0 	bl	20021924 <sd1_send_cmd>
20021744:	2801      	cmp	r0, #1
20021746:	d05e      	beq.n	20021806 <sdio_emmc_init+0x21e>
20021748:	2802      	cmp	r0, #2
2002174a:	d05e      	beq.n	2002180a <sdio_emmc_init+0x222>
2002174c:	ab06      	add	r3, sp, #24
2002174e:	9500      	str	r5, [sp, #0]
20021750:	aa05      	add	r2, sp, #20
20021752:	a904      	add	r1, sp, #16
20021754:	f10d 000f 	add.w	r0, sp, #15
20021758:	f000 f922 	bl	200219a0 <sd1_get_rsp>
2002175c:	f89d 300f 	ldrb.w	r3, [sp, #15]
20021760:	2b08      	cmp	r3, #8
20021762:	d002      	beq.n	2002176a <sdio_emmc_init+0x182>
20021764:	200d      	movs	r0, #13
20021766:	b00c      	add	sp, #48	@ 0x30
20021768:	bd70      	pop	{r4, r5, r6, pc}
2002176a:	2320      	movs	r3, #32
2002176c:	62e3      	str	r3, [r4, #44]	@ 0x2c
2002176e:	f000 f937 	bl	200219e0 <sd1_wait_read>
20021772:	6823      	ldr	r3, [r4, #0]
20021774:	0618      	lsls	r0, r3, #24
20021776:	d4f5      	bmi.n	20021764 <sdio_emmc_init+0x17c>
20021778:	6823      	ldr	r3, [r4, #0]
2002177a:	0659      	lsls	r1, r3, #25
2002177c:	d447      	bmi.n	2002180e <sdio_emmc_init+0x226>
2002177e:	2680      	movs	r6, #128	@ 0x80
20021780:	3e01      	subs	r6, #1
20021782:	f8d4 3200 	ldr.w	r3, [r4, #512]	@ 0x200
20021786:	d1fb      	bne.n	20021780 <sdio_emmc_init+0x198>
20021788:	2101      	movs	r1, #1
2002178a:	4630      	mov	r0, r6
2002178c:	f000 f918 	bl	200219c0 <sd1_read>
20021790:	2014      	movs	r0, #20
20021792:	f000 fbe8 	bl	20021f66 <HAL_Delay_us>
20021796:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
2002179a:	4631      	mov	r1, r6
2002179c:	2011      	movs	r0, #17
2002179e:	6023      	str	r3, [r4, #0]
200217a0:	f000 f8c0 	bl	20021924 <sd1_send_cmd>
200217a4:	2801      	cmp	r0, #1
200217a6:	d034      	beq.n	20021812 <sdio_emmc_init+0x22a>
200217a8:	2802      	cmp	r0, #2
200217aa:	d034      	beq.n	20021816 <sdio_emmc_init+0x22e>
200217ac:	ab06      	add	r3, sp, #24
200217ae:	9500      	str	r5, [sp, #0]
200217b0:	aa05      	add	r2, sp, #20
200217b2:	a904      	add	r1, sp, #16
200217b4:	f10d 000f 	add.w	r0, sp, #15
200217b8:	f000 f8f2 	bl	200219a0 <sd1_get_rsp>
200217bc:	f89d 300f 	ldrb.w	r3, [sp, #15]
200217c0:	2b11      	cmp	r3, #17
200217c2:	d12a      	bne.n	2002181a <sdio_emmc_init+0x232>
200217c4:	2320      	movs	r3, #32
200217c6:	62e3      	str	r3, [r4, #44]	@ 0x2c
200217c8:	f000 f90a 	bl	200219e0 <sd1_wait_read>
200217cc:	6823      	ldr	r3, [r4, #0]
200217ce:	061a      	lsls	r2, r3, #24
200217d0:	d425      	bmi.n	2002181e <sdio_emmc_init+0x236>
200217d2:	6823      	ldr	r3, [r4, #0]
200217d4:	065b      	lsls	r3, r3, #25
200217d6:	d424      	bmi.n	20021822 <sdio_emmc_init+0x23a>
200217d8:	2080      	movs	r0, #128	@ 0x80
200217da:	4b13      	ldr	r3, [pc, #76]	@ (20021828 <sdio_emmc_init+0x240>)
200217dc:	3801      	subs	r0, #1
200217de:	f8d3 2200 	ldr.w	r2, [r3, #512]	@ 0x200
200217e2:	d1fb      	bne.n	200217dc <sdio_emmc_init+0x1f4>
200217e4:	e7bf      	b.n	20021766 <sdio_emmc_init+0x17e>
200217e6:	2003      	movs	r0, #3
200217e8:	e7bd      	b.n	20021766 <sdio_emmc_init+0x17e>
200217ea:	2004      	movs	r0, #4
200217ec:	e7bb      	b.n	20021766 <sdio_emmc_init+0x17e>
200217ee:	2005      	movs	r0, #5
200217f0:	e7b9      	b.n	20021766 <sdio_emmc_init+0x17e>
200217f2:	2006      	movs	r0, #6
200217f4:	e7b7      	b.n	20021766 <sdio_emmc_init+0x17e>
200217f6:	2007      	movs	r0, #7
200217f8:	e7b5      	b.n	20021766 <sdio_emmc_init+0x17e>
200217fa:	2008      	movs	r0, #8
200217fc:	e7b3      	b.n	20021766 <sdio_emmc_init+0x17e>
200217fe:	2009      	movs	r0, #9
20021800:	e7b1      	b.n	20021766 <sdio_emmc_init+0x17e>
20021802:	200a      	movs	r0, #10
20021804:	e7af      	b.n	20021766 <sdio_emmc_init+0x17e>
20021806:	200b      	movs	r0, #11
20021808:	e7ad      	b.n	20021766 <sdio_emmc_init+0x17e>
2002180a:	200c      	movs	r0, #12
2002180c:	e7ab      	b.n	20021766 <sdio_emmc_init+0x17e>
2002180e:	200e      	movs	r0, #14
20021810:	e7a9      	b.n	20021766 <sdio_emmc_init+0x17e>
20021812:	2011      	movs	r0, #17
20021814:	e7a7      	b.n	20021766 <sdio_emmc_init+0x17e>
20021816:	2012      	movs	r0, #18
20021818:	e7a5      	b.n	20021766 <sdio_emmc_init+0x17e>
2002181a:	2013      	movs	r0, #19
2002181c:	e7a3      	b.n	20021766 <sdio_emmc_init+0x17e>
2002181e:	2014      	movs	r0, #20
20021820:	e7a1      	b.n	20021766 <sdio_emmc_init+0x17e>
20021822:	2015      	movs	r0, #21
20021824:	e79f      	b.n	20021766 <sdio_emmc_init+0x17e>
20021826:	bf00      	nop
20021828:	50045000 	.word	0x50045000
2002182c:	00016700 	.word	0x00016700
20021830:	40000080 	.word	0x40000080

20021834 <emmc_read_data>:
20021834:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
20021838:	4607      	mov	r7, r0
2002183a:	f04f 38ff 	mov.w	r8, #4294967295	@ 0xffffffff
2002183e:	b088      	sub	sp, #32
20021840:	2000      	movs	r0, #0
20021842:	460d      	mov	r5, r1
20021844:	4e1d      	ldr	r6, [pc, #116]	@ (200218bc <emmc_read_data+0x88>)
20021846:	2101      	movs	r1, #1
20021848:	4614      	mov	r4, r2
2002184a:	f000 f8b9 	bl	200219c0 <sd1_read>
2002184e:	2014      	movs	r0, #20
20021850:	f000 fb89 	bl	20021f66 <HAL_Delay_us>
20021854:	2011      	movs	r0, #17
20021856:	f8c6 8000 	str.w	r8, [r6]
2002185a:	0a79      	lsrs	r1, r7, #9
2002185c:	f000 f862 	bl	20021924 <sd1_send_cmd>
20021860:	4440      	add	r0, r8
20021862:	b2c0      	uxtb	r0, r0
20021864:	2801      	cmp	r0, #1
20021866:	d803      	bhi.n	20021870 <emmc_read_data+0x3c>
20021868:	2000      	movs	r0, #0
2002186a:	b008      	add	sp, #32
2002186c:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
20021870:	ab07      	add	r3, sp, #28
20021872:	9300      	str	r3, [sp, #0]
20021874:	aa05      	add	r2, sp, #20
20021876:	ab06      	add	r3, sp, #24
20021878:	a904      	add	r1, sp, #16
2002187a:	f10d 000f 	add.w	r0, sp, #15
2002187e:	f000 f88f 	bl	200219a0 <sd1_get_rsp>
20021882:	f89d 300f 	ldrb.w	r3, [sp, #15]
20021886:	2b11      	cmp	r3, #17
20021888:	d1ee      	bne.n	20021868 <emmc_read_data+0x34>
2002188a:	2320      	movs	r3, #32
2002188c:	f8c6 8000 	str.w	r8, [r6]
20021890:	62f3      	str	r3, [r6, #44]	@ 0x2c
20021892:	f000 f8a5 	bl	200219e0 <sd1_wait_read>
20021896:	6833      	ldr	r3, [r6, #0]
20021898:	061a      	lsls	r2, r3, #24
2002189a:	d4e5      	bmi.n	20021868 <emmc_read_data+0x34>
2002189c:	6833      	ldr	r3, [r6, #0]
2002189e:	065b      	lsls	r3, r3, #25
200218a0:	d4e2      	bmi.n	20021868 <emmc_read_data+0x34>
200218a2:	f024 0303 	bic.w	r3, r4, #3
200218a6:	442b      	add	r3, r5
200218a8:	429d      	cmp	r5, r3
200218aa:	d101      	bne.n	200218b0 <emmc_read_data+0x7c>
200218ac:	4620      	mov	r0, r4
200218ae:	e7dc      	b.n	2002186a <emmc_read_data+0x36>
200218b0:	f8d6 2200 	ldr.w	r2, [r6, #512]	@ 0x200
200218b4:	f845 2b04 	str.w	r2, [r5], #4
200218b8:	e7f6      	b.n	200218a8 <emmc_read_data+0x74>
200218ba:	bf00      	nop
200218bc:	50045000 	.word	0x50045000

200218c0 <sd1_init>:
200218c0:	b510      	push	{r4, lr}
200218c2:	f04f 44a0 	mov.w	r4, #1342177280	@ 0x50000000
200218c6:	68e3      	ldr	r3, [r4, #12]
200218c8:	2064      	movs	r0, #100	@ 0x64
200218ca:	f023 0310 	bic.w	r3, r3, #16
200218ce:	60e3      	str	r3, [r4, #12]
200218d0:	f000 fb49 	bl	20021f66 <HAL_Delay_us>
200218d4:	68e3      	ldr	r3, [r4, #12]
200218d6:	4a07      	ldr	r2, [pc, #28]	@ (200218f4 <sd1_init+0x34>)
200218d8:	f043 0310 	orr.w	r3, r3, #16
200218dc:	60e3      	str	r3, [r4, #12]
200218de:	6913      	ldr	r3, [r2, #16]
200218e0:	f043 0302 	orr.w	r3, r3, #2
200218e4:	6113      	str	r3, [r2, #16]
200218e6:	f44f 7280 	mov.w	r2, #256	@ 0x100
200218ea:	4b03      	ldr	r3, [pc, #12]	@ (200218f8 <sd1_init+0x38>)
200218ec:	631a      	str	r2, [r3, #48]	@ 0x30
200218ee:	2200      	movs	r2, #0
200218f0:	63da      	str	r2, [r3, #60]	@ 0x3c
200218f2:	bd10      	pop	{r4, pc}
200218f4:	5000b000 	.word	0x5000b000
200218f8:	50045000 	.word	0x50045000

200218fc <sd1_wait_cmd>:
200218fc:	4b08      	ldr	r3, [pc, #32]	@ (20021920 <sd1_wait_cmd+0x24>)
200218fe:	681a      	ldr	r2, [r3, #0]
20021900:	f012 0f0a 	tst.w	r2, #10
20021904:	d0fb      	beq.n	200218fe <sd1_wait_cmd+0x2>
20021906:	2202      	movs	r2, #2
20021908:	601a      	str	r2, [r3, #0]
2002190a:	681a      	ldr	r2, [r3, #0]
2002190c:	0712      	lsls	r2, r2, #28
2002190e:	bf5f      	itttt	pl
20021910:	6818      	ldrpl	r0, [r3, #0]
20021912:	f3c0 0080 	ubfxpl	r0, r0, #2, #1
20021916:	0040      	lslpl	r0, r0, #1
20021918:	b2c0      	uxtbpl	r0, r0
2002191a:	bf48      	it	mi
2002191c:	2001      	movmi	r0, #1
2002191e:	4770      	bx	lr
20021920:	50045000 	.word	0x50045000

20021924 <sd1_send_cmd>:
20021924:	4b0e      	ldr	r3, [pc, #56]	@ (20021960 <sd1_send_cmd+0x3c>)
20021926:	280f      	cmp	r0, #15
20021928:	6099      	str	r1, [r3, #8]
2002192a:	ea4f 4380 	mov.w	r3, r0, lsl #18
2002192e:	d813      	bhi.n	20021958 <sd1_send_cmd+0x34>
20021930:	2201      	movs	r2, #1
20021932:	f248 0111 	movw	r1, #32785	@ 0x8011
20021936:	4082      	lsls	r2, r0
20021938:	420a      	tst	r2, r1
2002193a:	d105      	bne.n	20021948 <sd1_send_cmd+0x24>
2002193c:	f240 6104 	movw	r1, #1540	@ 0x604
20021940:	420a      	tst	r2, r1
20021942:	d009      	beq.n	20021958 <sd1_send_cmd+0x34>
20021944:	f443 3340 	orr.w	r3, r3, #196608	@ 0x30000
20021948:	4a05      	ldr	r2, [pc, #20]	@ (20021960 <sd1_send_cmd+0x3c>)
2002194a:	f443 7380 	orr.w	r3, r3, #256	@ 0x100
2002194e:	f043 0301 	orr.w	r3, r3, #1
20021952:	6053      	str	r3, [r2, #4]
20021954:	f7ff bfd2 	b.w	200218fc <sd1_wait_cmd>
20021958:	f443 3380 	orr.w	r3, r3, #65536	@ 0x10000
2002195c:	e7f4      	b.n	20021948 <sd1_send_cmd+0x24>
2002195e:	bf00      	nop
20021960:	50045000 	.word	0x50045000

20021964 <sd1_send_acmd>:
20021964:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
20021966:	4605      	mov	r5, r0
20021968:	460f      	mov	r7, r1
2002196a:	2037      	movs	r0, #55	@ 0x37
2002196c:	0411      	lsls	r1, r2, #16
2002196e:	f7ff ffd9 	bl	20021924 <sd1_send_cmd>
20021972:	4604      	mov	r4, r0
20021974:	b968      	cbnz	r0, 20021992 <sd1_send_acmd+0x2e>
20021976:	4b08      	ldr	r3, [pc, #32]	@ (20021998 <sd1_send_acmd+0x34>)
20021978:	4e08      	ldr	r6, [pc, #32]	@ (2002199c <sd1_send_acmd+0x38>)
2002197a:	ea43 4385 	orr.w	r3, r3, r5, lsl #18
2002197e:	60b7      	str	r7, [r6, #8]
20021980:	6073      	str	r3, [r6, #4]
20021982:	f7ff ffbb 	bl	200218fc <sd1_wait_cmd>
20021986:	2802      	cmp	r0, #2
20021988:	d104      	bne.n	20021994 <sd1_send_acmd+0x30>
2002198a:	2d29      	cmp	r5, #41	@ 0x29
2002198c:	d102      	bne.n	20021994 <sd1_send_acmd+0x30>
2002198e:	2304      	movs	r3, #4
20021990:	6033      	str	r3, [r6, #0]
20021992:	4620      	mov	r0, r4
20021994:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
20021996:	bf00      	nop
20021998:	00010101 	.word	0x00010101
2002199c:	50045000 	.word	0x50045000

200219a0 <sd1_get_rsp>:
200219a0:	b530      	push	{r4, r5, lr}
200219a2:	4c06      	ldr	r4, [pc, #24]	@ (200219bc <sd1_get_rsp+0x1c>)
200219a4:	68e5      	ldr	r5, [r4, #12]
200219a6:	7005      	strb	r5, [r0, #0]
200219a8:	6920      	ldr	r0, [r4, #16]
200219aa:	6008      	str	r0, [r1, #0]
200219ac:	6961      	ldr	r1, [r4, #20]
200219ae:	6011      	str	r1, [r2, #0]
200219b0:	69a2      	ldr	r2, [r4, #24]
200219b2:	601a      	str	r2, [r3, #0]
200219b4:	69e2      	ldr	r2, [r4, #28]
200219b6:	9b03      	ldr	r3, [sp, #12]
200219b8:	601a      	str	r2, [r3, #0]
200219ba:	bd30      	pop	{r4, r5, pc}
200219bc:	50045000 	.word	0x50045000

200219c0 <sd1_read>:
200219c0:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
200219c4:	4a04      	ldr	r2, [pc, #16]	@ (200219d8 <sd1_read+0x18>)
200219c6:	eb03 2341 	add.w	r3, r3, r1, lsl #9
200219ca:	6293      	str	r3, [r2, #40]	@ 0x28
200219cc:	4b03      	ldr	r3, [pc, #12]	@ (200219dc <sd1_read+0x1c>)
200219ce:	ea43 23c0 	orr.w	r3, r3, r0, lsl #11
200219d2:	6253      	str	r3, [r2, #36]	@ 0x24
200219d4:	4770      	bx	lr
200219d6:	bf00      	nop
200219d8:	50045000 	.word	0x50045000
200219dc:	01ff0301 	.word	0x01ff0301

200219e0 <sd1_wait_read>:
200219e0:	4b08      	ldr	r3, [pc, #32]	@ (20021a04 <sd1_wait_read+0x24>)
200219e2:	681a      	ldr	r2, [r3, #0]
200219e4:	f012 0fe0 	tst.w	r2, #224	@ 0xe0
200219e8:	d0fb      	beq.n	200219e2 <sd1_wait_read+0x2>
200219ea:	2220      	movs	r2, #32
200219ec:	601a      	str	r2, [r3, #0]
200219ee:	681a      	ldr	r2, [r3, #0]
200219f0:	0612      	lsls	r2, r2, #24
200219f2:	bf5f      	itttt	pl
200219f4:	6818      	ldrpl	r0, [r3, #0]
200219f6:	f3c0 1080 	ubfxpl	r0, r0, #6, #1
200219fa:	0040      	lslpl	r0, r0, #1
200219fc:	b2c0      	uxtbpl	r0, r0
200219fe:	bf48      	it	mi
20021a00:	2001      	movmi	r0, #1
20021a02:	4770      	bx	lr
20021a04:	50045000 	.word	0x50045000

20021a08 <sdmmc1_sdnand>:
20021a08:	b5f0      	push	{r4, r5, r6, r7, lr}
20021a0a:	b08d      	sub	sp, #52	@ 0x34
20021a0c:	f7ff ff58 	bl	200218c0 <sd1_init>
20021a10:	4c8f      	ldr	r4, [pc, #572]	@ (20021c50 <sdmmc1_sdnand+0x248>)
20021a12:	4b90      	ldr	r3, [pc, #576]	@ (20021c54 <sdmmc1_sdnand+0x24c>)
20021a14:	2500      	movs	r5, #0
20021a16:	6323      	str	r3, [r4, #48]	@ 0x30
20021a18:	6b23      	ldr	r3, [r4, #48]	@ 0x30
20021a1a:	f44f 70fa 	mov.w	r0, #500	@ 0x1f4
20021a1e:	f043 0302 	orr.w	r3, r3, #2
20021a22:	6323      	str	r3, [r4, #48]	@ 0x30
20021a24:	f44f 1380 	mov.w	r3, #1048576	@ 0x100000
20021a28:	62e5      	str	r5, [r4, #44]	@ 0x2c
20021a2a:	6223      	str	r3, [r4, #32]
20021a2c:	f000 fa9b 	bl	20021f66 <HAL_Delay_us>
20021a30:	4629      	mov	r1, r5
20021a32:	4628      	mov	r0, r5
20021a34:	f7ff ff76 	bl	20021924 <sd1_send_cmd>
20021a38:	2301      	movs	r3, #1
20021a3a:	65e3      	str	r3, [r4, #92]	@ 0x5c
20021a3c:	6de3      	ldr	r3, [r4, #92]	@ 0x5c
20021a3e:	079a      	lsls	r2, r3, #30
20021a40:	d5fc      	bpl.n	20021a3c <sdmmc1_sdnand+0x34>
20021a42:	2014      	movs	r0, #20
20021a44:	f000 fa8f 	bl	20021f66 <HAL_Delay_us>
20021a48:	f44f 71d5 	mov.w	r1, #426	@ 0x1aa
20021a4c:	2008      	movs	r0, #8
20021a4e:	f7ff ff69 	bl	20021924 <sd1_send_cmd>
20021a52:	3801      	subs	r0, #1
20021a54:	b2c0      	uxtb	r0, r0
20021a56:	2801      	cmp	r0, #1
20021a58:	d802      	bhi.n	20021a60 <sdmmc1_sdnand+0x58>
20021a5a:	2038      	movs	r0, #56	@ 0x38
20021a5c:	b00d      	add	sp, #52	@ 0x34
20021a5e:	bdf0      	pop	{r4, r5, r6, r7, pc}
20021a60:	ac07      	add	r4, sp, #28
20021a62:	ab06      	add	r3, sp, #24
20021a64:	9400      	str	r4, [sp, #0]
20021a66:	aa05      	add	r2, sp, #20
20021a68:	a904      	add	r1, sp, #16
20021a6a:	f10d 000f 	add.w	r0, sp, #15
20021a6e:	f7ff ff97 	bl	200219a0 <sd1_get_rsp>
20021a72:	f89d 300f 	ldrb.w	r3, [sp, #15]
20021a76:	2b08      	cmp	r3, #8
20021a78:	d1ef      	bne.n	20021a5a <sdmmc1_sdnand+0x52>
20021a7a:	9b04      	ldr	r3, [sp, #16]
20021a7c:	f5b3 7fd5 	cmp.w	r3, #426	@ 0x1aa
20021a80:	d1eb      	bne.n	20021a5a <sdmmc1_sdnand+0x52>
20021a82:	2014      	movs	r0, #20
20021a84:	f000 fa6f 	bl	20021f66 <HAL_Delay_us>
20021a88:	2200      	movs	r2, #0
20021a8a:	2029      	movs	r0, #41	@ 0x29
20021a8c:	4972      	ldr	r1, [pc, #456]	@ (20021c58 <sdmmc1_sdnand+0x250>)
20021a8e:	f7ff ff69 	bl	20021964 <sd1_send_acmd>
20021a92:	2801      	cmp	r0, #1
20021a94:	f000 80d0 	beq.w	20021c38 <sdmmc1_sdnand+0x230>
20021a98:	ab06      	add	r3, sp, #24
20021a9a:	9400      	str	r4, [sp, #0]
20021a9c:	aa05      	add	r2, sp, #20
20021a9e:	a904      	add	r1, sp, #16
20021aa0:	f10d 000f 	add.w	r0, sp, #15
20021aa4:	f7ff ff7c 	bl	200219a0 <sd1_get_rsp>
20021aa8:	9b04      	ldr	r3, [sp, #16]
20021aaa:	2b00      	cmp	r3, #0
20021aac:	db03      	blt.n	20021ab6 <sdmmc1_sdnand+0xae>
20021aae:	2002      	movs	r0, #2
20021ab0:	f000 fa59 	bl	20021f66 <HAL_Delay_us>
20021ab4:	e7e5      	b.n	20021a82 <sdmmc1_sdnand+0x7a>
20021ab6:	2014      	movs	r0, #20
20021ab8:	f000 fa55 	bl	20021f66 <HAL_Delay_us>
20021abc:	2100      	movs	r1, #0
20021abe:	2002      	movs	r0, #2
20021ac0:	f7ff ff30 	bl	20021924 <sd1_send_cmd>
20021ac4:	3801      	subs	r0, #1
20021ac6:	b2c0      	uxtb	r0, r0
20021ac8:	2801      	cmp	r0, #1
20021aca:	f240 80b7 	bls.w	20021c3c <sdmmc1_sdnand+0x234>
20021ace:	ab08      	add	r3, sp, #32
20021ad0:	aa0a      	add	r2, sp, #40	@ 0x28
20021ad2:	a90b      	add	r1, sp, #44	@ 0x2c
20021ad4:	9300      	str	r3, [sp, #0]
20021ad6:	f10d 000f 	add.w	r0, sp, #15
20021ada:	ab09      	add	r3, sp, #36	@ 0x24
20021adc:	f7ff ff60 	bl	200219a0 <sd1_get_rsp>
20021ae0:	2014      	movs	r0, #20
20021ae2:	f000 fa40 	bl	20021f66 <HAL_Delay_us>
20021ae6:	2100      	movs	r1, #0
20021ae8:	2003      	movs	r0, #3
20021aea:	f7ff ff1b 	bl	20021924 <sd1_send_cmd>
20021aee:	3801      	subs	r0, #1
20021af0:	b2c0      	uxtb	r0, r0
20021af2:	2801      	cmp	r0, #1
20021af4:	d801      	bhi.n	20021afa <sdmmc1_sdnand+0xf2>
20021af6:	2033      	movs	r0, #51	@ 0x33
20021af8:	e7b0      	b.n	20021a5c <sdmmc1_sdnand+0x54>
20021afa:	ab06      	add	r3, sp, #24
20021afc:	9400      	str	r4, [sp, #0]
20021afe:	aa05      	add	r2, sp, #20
20021b00:	a904      	add	r1, sp, #16
20021b02:	f10d 000f 	add.w	r0, sp, #15
20021b06:	f7ff ff4b 	bl	200219a0 <sd1_get_rsp>
20021b0a:	f89d 300f 	ldrb.w	r3, [sp, #15]
20021b0e:	2b03      	cmp	r3, #3
20021b10:	d1f1      	bne.n	20021af6 <sdmmc1_sdnand+0xee>
20021b12:	9e04      	ldr	r6, [sp, #16]
20021b14:	2014      	movs	r0, #20
20021b16:	0c35      	lsrs	r5, r6, #16
20021b18:	042d      	lsls	r5, r5, #16
20021b1a:	f000 fa24 	bl	20021f66 <HAL_Delay_us>
20021b1e:	4629      	mov	r1, r5
20021b20:	2009      	movs	r0, #9
20021b22:	f7ff feff 	bl	20021924 <sd1_send_cmd>
20021b26:	3801      	subs	r0, #1
20021b28:	b2c0      	uxtb	r0, r0
20021b2a:	2801      	cmp	r0, #1
20021b2c:	f240 8088 	bls.w	20021c40 <sdmmc1_sdnand+0x238>
20021b30:	9400      	str	r4, [sp, #0]
20021b32:	ab06      	add	r3, sp, #24
20021b34:	aa05      	add	r2, sp, #20
20021b36:	a904      	add	r1, sp, #16
20021b38:	f10d 000f 	add.w	r0, sp, #15
20021b3c:	f7ff ff30 	bl	200219a0 <sd1_get_rsp>
20021b40:	e9dd 2004 	ldrd	r2, r0, [sp, #16]
20021b44:	9c06      	ldr	r4, [sp, #24]
20021b46:	9907      	ldr	r1, [sp, #28]
20021b48:	0e23      	lsrs	r3, r4, #24
20021b4a:	ea43 2301 	orr.w	r3, r3, r1, lsl #8
20021b4e:	0e01      	lsrs	r1, r0, #24
20021b50:	ea41 2104 	orr.w	r1, r1, r4, lsl #8
20021b54:	9105      	str	r1, [sp, #20]
20021b56:	0e11      	lsrs	r1, r2, #24
20021b58:	9304      	str	r3, [sp, #16]
20021b5a:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
20021b5e:	0212      	lsls	r2, r2, #8
20021b60:	0f9b      	lsrs	r3, r3, #30
20021b62:	9106      	str	r1, [sp, #24]
20021b64:	9207      	str	r2, [sp, #28]
20021b66:	d01e      	beq.n	20021ba6 <sdmmc1_sdnand+0x19e>
20021b68:	2b01      	cmp	r3, #1
20021b6a:	d16b      	bne.n	20021c44 <sdmmc1_sdnand+0x23c>
20021b6c:	2300      	movs	r3, #0
20021b6e:	4a3b      	ldr	r2, [pc, #236]	@ (20021c5c <sdmmc1_sdnand+0x254>)
20021b70:	4c37      	ldr	r4, [pc, #220]	@ (20021c50 <sdmmc1_sdnand+0x248>)
20021b72:	7013      	strb	r3, [r2, #0]
20021b74:	f44f 63a0 	mov.w	r3, #1280	@ 0x500
20021b78:	6323      	str	r3, [r4, #48]	@ 0x30
20021b7a:	6b23      	ldr	r3, [r4, #48]	@ 0x30
20021b7c:	2702      	movs	r7, #2
20021b7e:	f043 0302 	orr.w	r3, r3, #2
20021b82:	6323      	str	r3, [r4, #48]	@ 0x30
20021b84:	f04f 7300 	mov.w	r3, #33554432	@ 0x2000000
20021b88:	2014      	movs	r0, #20
20021b8a:	6223      	str	r3, [r4, #32]
20021b8c:	63e7      	str	r7, [r4, #60]	@ 0x3c
20021b8e:	f000 f9ea 	bl	20021f66 <HAL_Delay_us>
20021b92:	4629      	mov	r1, r5
20021b94:	2007      	movs	r0, #7
20021b96:	f7ff fec5 	bl	20021924 <sd1_send_cmd>
20021b9a:	3801      	subs	r0, #1
20021b9c:	b2c0      	uxtb	r0, r0
20021b9e:	2801      	cmp	r0, #1
20021ba0:	d803      	bhi.n	20021baa <sdmmc1_sdnand+0x1a2>
20021ba2:	2037      	movs	r0, #55	@ 0x37
20021ba4:	e75a      	b.n	20021a5c <sdmmc1_sdnand+0x54>
20021ba6:	2301      	movs	r3, #1
20021ba8:	e7e1      	b.n	20021b6e <sdmmc1_sdnand+0x166>
20021baa:	ad07      	add	r5, sp, #28
20021bac:	ab06      	add	r3, sp, #24
20021bae:	9500      	str	r5, [sp, #0]
20021bb0:	aa05      	add	r2, sp, #20
20021bb2:	a904      	add	r1, sp, #16
20021bb4:	f10d 000f 	add.w	r0, sp, #15
20021bb8:	f7ff fef2 	bl	200219a0 <sd1_get_rsp>
20021bbc:	f89d 300f 	ldrb.w	r3, [sp, #15]
20021bc0:	2b07      	cmp	r3, #7
20021bc2:	d1ee      	bne.n	20021ba2 <sdmmc1_sdnand+0x19a>
20021bc4:	2014      	movs	r0, #20
20021bc6:	f000 f9ce 	bl	20021f66 <HAL_Delay_us>
20021bca:	4639      	mov	r1, r7
20021bcc:	2006      	movs	r0, #6
20021bce:	0c32      	lsrs	r2, r6, #16
20021bd0:	f7ff fec8 	bl	20021964 <sd1_send_acmd>
20021bd4:	3801      	subs	r0, #1
20021bd6:	b2c0      	uxtb	r0, r0
20021bd8:	2801      	cmp	r0, #1
20021bda:	d935      	bls.n	20021c48 <sdmmc1_sdnand+0x240>
20021bdc:	2101      	movs	r1, #1
20021bde:	4608      	mov	r0, r1
20021be0:	f7ff feee 	bl	200219c0 <sd1_read>
20021be4:	2014      	movs	r0, #20
20021be6:	f000 f9be 	bl	20021f66 <HAL_Delay_us>
20021bea:	2100      	movs	r1, #0
20021bec:	2011      	movs	r0, #17
20021bee:	f7ff fe99 	bl	20021924 <sd1_send_cmd>
20021bf2:	3801      	subs	r0, #1
20021bf4:	b2c0      	uxtb	r0, r0
20021bf6:	2801      	cmp	r0, #1
20021bf8:	d801      	bhi.n	20021bfe <sdmmc1_sdnand+0x1f6>
20021bfa:	2052      	movs	r0, #82	@ 0x52
20021bfc:	e72e      	b.n	20021a5c <sdmmc1_sdnand+0x54>
20021bfe:	ab06      	add	r3, sp, #24
20021c00:	9500      	str	r5, [sp, #0]
20021c02:	aa05      	add	r2, sp, #20
20021c04:	a904      	add	r1, sp, #16
20021c06:	f10d 000f 	add.w	r0, sp, #15
20021c0a:	f7ff fec9 	bl	200219a0 <sd1_get_rsp>
20021c0e:	f89d 300f 	ldrb.w	r3, [sp, #15]
20021c12:	2b11      	cmp	r3, #17
20021c14:	d1f1      	bne.n	20021bfa <sdmmc1_sdnand+0x1f2>
20021c16:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
20021c1a:	6023      	str	r3, [r4, #0]
20021c1c:	2320      	movs	r3, #32
20021c1e:	62e3      	str	r3, [r4, #44]	@ 0x2c
20021c20:	f7ff fede 	bl	200219e0 <sd1_wait_read>
20021c24:	6823      	ldr	r3, [r4, #0]
20021c26:	061b      	lsls	r3, r3, #24
20021c28:	d410      	bmi.n	20021c4c <sdmmc1_sdnand+0x244>
20021c2a:	6823      	ldr	r3, [r4, #0]
20021c2c:	f013 0f40 	tst.w	r3, #64	@ 0x40
20021c30:	bf14      	ite	ne
20021c32:	2044      	movne	r0, #68	@ 0x44
20021c34:	2001      	moveq	r0, #1
20021c36:	e711      	b.n	20021a5c <sdmmc1_sdnand+0x54>
20021c38:	2034      	movs	r0, #52	@ 0x34
20021c3a:	e70f      	b.n	20021a5c <sdmmc1_sdnand+0x54>
20021c3c:	2032      	movs	r0, #50	@ 0x32
20021c3e:	e70d      	b.n	20021a5c <sdmmc1_sdnand+0x54>
20021c40:	2039      	movs	r0, #57	@ 0x39
20021c42:	e70b      	b.n	20021a5c <sdmmc1_sdnand+0x54>
20021c44:	2054      	movs	r0, #84	@ 0x54
20021c46:	e709      	b.n	20021a5c <sdmmc1_sdnand+0x54>
20021c48:	2036      	movs	r0, #54	@ 0x36
20021c4a:	e707      	b.n	20021a5c <sdmmc1_sdnand+0x54>
20021c4c:	204f      	movs	r0, #79	@ 0x4f
20021c4e:	e705      	b.n	20021a5c <sdmmc1_sdnand+0x54>
20021c50:	50045000 	.word	0x50045000
20021c54:	00016700 	.word	0x00016700
20021c58:	40ff8000 	.word	0x40ff8000
20021c5c:	20042c08 	.word	0x20042c08

20021c60 <sd_read_data>:
20021c60:	b570      	push	{r4, r5, r6, lr}
20021c62:	460d      	mov	r5, r1
20021c64:	2101      	movs	r1, #1
20021c66:	b088      	sub	sp, #32
20021c68:	4606      	mov	r6, r0
20021c6a:	4608      	mov	r0, r1
20021c6c:	4614      	mov	r4, r2
20021c6e:	f7ff fea7 	bl	200219c0 <sd1_read>
20021c72:	2014      	movs	r0, #20
20021c74:	f000 f977 	bl	20021f66 <HAL_Delay_us>
20021c78:	4b1a      	ldr	r3, [pc, #104]	@ (20021ce4 <sd_read_data+0x84>)
20021c7a:	781b      	ldrb	r3, [r3, #0]
20021c7c:	b903      	cbnz	r3, 20021c80 <sd_read_data+0x20>
20021c7e:	0a76      	lsrs	r6, r6, #9
20021c80:	4631      	mov	r1, r6
20021c82:	2011      	movs	r0, #17
20021c84:	f7ff fe4e 	bl	20021924 <sd1_send_cmd>
20021c88:	3801      	subs	r0, #1
20021c8a:	b2c0      	uxtb	r0, r0
20021c8c:	2801      	cmp	r0, #1
20021c8e:	d802      	bhi.n	20021c96 <sd_read_data+0x36>
20021c90:	2000      	movs	r0, #0
20021c92:	b008      	add	sp, #32
20021c94:	bd70      	pop	{r4, r5, r6, pc}
20021c96:	ab07      	add	r3, sp, #28
20021c98:	9300      	str	r3, [sp, #0]
20021c9a:	aa05      	add	r2, sp, #20
20021c9c:	ab06      	add	r3, sp, #24
20021c9e:	a904      	add	r1, sp, #16
20021ca0:	f10d 000f 	add.w	r0, sp, #15
20021ca4:	f7ff fe7c 	bl	200219a0 <sd1_get_rsp>
20021ca8:	f89d 300f 	ldrb.w	r3, [sp, #15]
20021cac:	2b11      	cmp	r3, #17
20021cae:	d1ef      	bne.n	20021c90 <sd_read_data+0x30>
20021cb0:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
20021cb4:	4e0c      	ldr	r6, [pc, #48]	@ (20021ce8 <sd_read_data+0x88>)
20021cb6:	6033      	str	r3, [r6, #0]
20021cb8:	2320      	movs	r3, #32
20021cba:	62f3      	str	r3, [r6, #44]	@ 0x2c
20021cbc:	f7ff fe90 	bl	200219e0 <sd1_wait_read>
20021cc0:	6833      	ldr	r3, [r6, #0]
20021cc2:	061a      	lsls	r2, r3, #24
20021cc4:	d4e4      	bmi.n	20021c90 <sd_read_data+0x30>
20021cc6:	6833      	ldr	r3, [r6, #0]
20021cc8:	065b      	lsls	r3, r3, #25
20021cca:	d4e1      	bmi.n	20021c90 <sd_read_data+0x30>
20021ccc:	f024 0303 	bic.w	r3, r4, #3
20021cd0:	442b      	add	r3, r5
20021cd2:	429d      	cmp	r5, r3
20021cd4:	d101      	bne.n	20021cda <sd_read_data+0x7a>
20021cd6:	4620      	mov	r0, r4
20021cd8:	e7db      	b.n	20021c92 <sd_read_data+0x32>
20021cda:	f8d6 2200 	ldr.w	r2, [r6, #512]	@ 0x200
20021cde:	f845 2b04 	str.w	r2, [r5], #4
20021ce2:	e7f6      	b.n	20021cd2 <sd_read_data+0x72>
20021ce4:	20042c08 	.word	0x20042c08
20021ce8:	50045000 	.word	0x50045000

20021cec <sifli_hash_calculate>:
20021cec:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
20021cf0:	460c      	mov	r4, r1
20021cf2:	4615      	mov	r5, r2
20021cf4:	4699      	mov	r9, r3
20021cf6:	4680      	mov	r8, r0
20021cf8:	2800      	cmp	r0, #0
20021cfa:	d03f      	beq.n	20021d7c <sifli_hash_calculate+0x90>
20021cfc:	2900      	cmp	r1, #0
20021cfe:	d03d      	beq.n	20021d7c <sifli_hash_calculate+0x90>
20021d00:	2a00      	cmp	r2, #0
20021d02:	d03b      	beq.n	20021d7c <sifli_hash_calculate+0x90>
20021d04:	2b03      	cmp	r3, #3
20021d06:	d839      	bhi.n	20021d7c <sifli_hash_calculate+0x90>
20021d08:	f000 fa40 	bl	2002218c <HAL_HASH_reset>
20021d0c:	2200      	movs	r2, #0
20021d0e:	4649      	mov	r1, r9
20021d10:	4610      	mov	r0, r2
20021d12:	f000 fa43 	bl	2002219c <HAL_HASH_init>
20021d16:	f5b4 7f80 	cmp.w	r4, #256	@ 0x100
20021d1a:	d929      	bls.n	20021d70 <sifli_hash_calculate+0x84>
20021d1c:	2600      	movs	r6, #0
20021d1e:	4637      	mov	r7, r6
20021d20:	f506 7680 	add.w	r6, r6, #256	@ 0x100
20021d24:	42a6      	cmp	r6, r4
20021d26:	bf34      	ite	cc
20021d28:	f04f 0a00 	movcc.w	sl, #0
20021d2c:	f04f 0a01 	movcs.w	sl, #1
20021d30:	b14f      	cbz	r7, 20021d46 <sifli_hash_calculate+0x5a>
20021d32:	f000 fa2b 	bl	2002218c <HAL_HASH_reset>
20021d36:	42a6      	cmp	r6, r4
20021d38:	bf2c      	ite	cs
20021d3a:	463a      	movcs	r2, r7
20021d3c:	2200      	movcc	r2, #0
20021d3e:	4649      	mov	r1, r9
20021d40:	4628      	mov	r0, r5
20021d42:	f000 fa2b 	bl	2002219c <HAL_HASH_init>
20021d46:	42a6      	cmp	r6, r4
20021d48:	bf34      	ite	cc
20021d4a:	f44f 7180 	movcc.w	r1, #256	@ 0x100
20021d4e:	1be1      	subcs	r1, r4, r7
20021d50:	4652      	mov	r2, sl
20021d52:	eb08 0007 	add.w	r0, r8, r7
20021d56:	f000 f9fb 	bl	20022150 <HAL_HASH_run>
20021d5a:	4628      	mov	r0, r5
20021d5c:	f000 fa4c 	bl	200221f8 <HAL_HASH_result>
20021d60:	42a6      	cmp	r6, r4
20021d62:	d3dc      	bcc.n	20021d1e <sifli_hash_calculate+0x32>
20021d64:	4628      	mov	r0, r5
20021d66:	f000 fa47 	bl	200221f8 <HAL_HASH_result>
20021d6a:	2000      	movs	r0, #0
20021d6c:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
20021d70:	2201      	movs	r2, #1
20021d72:	4621      	mov	r1, r4
20021d74:	4640      	mov	r0, r8
20021d76:	f000 f9eb 	bl	20022150 <HAL_HASH_run>
20021d7a:	e7f3      	b.n	20021d64 <sifli_hash_calculate+0x78>
20021d7c:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
20021d80:	e7f4      	b.n	20021d6c <sifli_hash_calculate+0x80>

20021d82 <sifli_hash_verify>:
20021d82:	b5f0      	push	{r4, r5, r6, r7, lr}
20021d84:	4605      	mov	r5, r0
20021d86:	b089      	sub	sp, #36	@ 0x24
20021d88:	460f      	mov	r7, r1
20021d8a:	4614      	mov	r4, r2
20021d8c:	2100      	movs	r1, #0
20021d8e:	2220      	movs	r2, #32
20021d90:	4668      	mov	r0, sp
20021d92:	461e      	mov	r6, r3
20021d94:	f008 fd56 	bl	2002a844 <memset>
20021d98:	b91d      	cbnz	r5, 20021da2 <sifli_hash_verify+0x20>
20021d9a:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
20021d9e:	b009      	add	sp, #36	@ 0x24
20021da0:	bdf0      	pop	{r4, r5, r6, r7, pc}
20021da2:	2c00      	cmp	r4, #0
20021da4:	d0f9      	beq.n	20021d9a <sifli_hash_verify+0x18>
20021da6:	2302      	movs	r3, #2
20021da8:	466a      	mov	r2, sp
20021daa:	4639      	mov	r1, r7
20021dac:	4628      	mov	r0, r5
20021dae:	f7ff ff9d 	bl	20021cec <sifli_hash_calculate>
20021db2:	2800      	cmp	r0, #0
20021db4:	d1f1      	bne.n	20021d9a <sifli_hash_verify+0x18>
20021db6:	4632      	mov	r2, r6
20021db8:	4621      	mov	r1, r4
20021dba:	4668      	mov	r0, sp
20021dbc:	f008 fd32 	bl	2002a824 <memcmp>
20021dc0:	3800      	subs	r0, #0
20021dc2:	bf18      	it	ne
20021dc4:	2001      	movne	r0, #1
20021dc6:	4240      	negs	r0, r0
20021dc8:	e7e9      	b.n	20021d9e <sifli_hash_verify+0x1c>

20021dca <sifli_sigkey_pub_verify>:
20021dca:	2300      	movs	r3, #0
20021dcc:	b537      	push	{r0, r1, r2, r4, r5, lr}
20021dce:	4604      	mov	r4, r0
20021dd0:	460d      	mov	r5, r1
20021dd2:	2208      	movs	r2, #8
20021dd4:	4669      	mov	r1, sp
20021dd6:	2003      	movs	r0, #3
20021dd8:	e9cd 3300 	strd	r3, r3, [sp]
20021ddc:	f7ff f910 	bl	20021000 <sifli_hw_efuse_read>
20021de0:	2808      	cmp	r0, #8
20021de2:	4603      	mov	r3, r0
20021de4:	d106      	bne.n	20021df4 <sifli_sigkey_pub_verify+0x2a>
20021de6:	466a      	mov	r2, sp
20021de8:	4629      	mov	r1, r5
20021dea:	4620      	mov	r0, r4
20021dec:	f7ff ffc9 	bl	20021d82 <sifli_hash_verify>
20021df0:	b003      	add	sp, #12
20021df2:	bd30      	pop	{r4, r5, pc}
20021df4:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
20021df8:	e7fa      	b.n	20021df0 <sifli_sigkey_pub_verify+0x26>

20021dfa <sifli_img_sig_hash_verify>:
20021dfa:	b5f0      	push	{r4, r5, r6, r7, lr}
20021dfc:	461f      	mov	r7, r3
20021dfe:	4616      	mov	r6, r2
20021e00:	b08d      	sub	sp, #52	@ 0x34
20021e02:	2220      	movs	r2, #32
20021e04:	4604      	mov	r4, r0
20021e06:	460d      	mov	r5, r1
20021e08:	a804      	add	r0, sp, #16
20021e0a:	2100      	movs	r1, #0
20021e0c:	f008 fd1a 	bl	2002a844 <memset>
20021e10:	2302      	movs	r3, #2
20021e12:	4639      	mov	r1, r7
20021e14:	4630      	mov	r0, r6
20021e16:	aa04      	add	r2, sp, #16
20021e18:	f7ff ff68 	bl	20021cec <sifli_hash_calculate>
20021e1c:	b118      	cbz	r0, 20021e26 <sifli_img_sig_hash_verify+0x2c>
20021e1e:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
20021e22:	b00d      	add	sp, #52	@ 0x34
20021e24:	bdf0      	pop	{r4, r5, r6, r7, pc}
20021e26:	a802      	add	r0, sp, #8
20021e28:	f007 fa68 	bl	200292fc <mbedtls_pk_init>
20021e2c:	4629      	mov	r1, r5
20021e2e:	f44f 7293 	mov.w	r2, #294	@ 0x126
20021e32:	a802      	add	r0, sp, #8
20021e34:	f007 fb6e 	bl	20029514 <mbedtls_pk_parse_public_key>
20021e38:	4601      	mov	r1, r0
20021e3a:	2800      	cmp	r0, #0
20021e3c:	d1ef      	bne.n	20021e1e <sifli_img_sig_hash_verify+0x24>
20021e3e:	2206      	movs	r2, #6
20021e40:	9803      	ldr	r0, [sp, #12]
20021e42:	f007 fc0e 	bl	20029662 <mbedtls_rsa_set_padding>
20021e46:	f44f 7380 	mov.w	r3, #256	@ 0x100
20021e4a:	2106      	movs	r1, #6
20021e4c:	e9cd 4300 	strd	r4, r3, [sp]
20021e50:	aa04      	add	r2, sp, #16
20021e52:	2320      	movs	r3, #32
20021e54:	a802      	add	r0, sp, #8
20021e56:	f007 fa85 	bl	20029364 <mbedtls_pk_verify>
20021e5a:	3800      	subs	r0, #0
20021e5c:	bf18      	it	ne
20021e5e:	2001      	movne	r0, #1
20021e60:	4240      	negs	r0, r0
20021e62:	e7de      	b.n	20021e22 <sifli_img_sig_hash_verify+0x28>

20021e64 <sifli_secboot_exception>:
20021e64:	2801      	cmp	r0, #1
20021e66:	b508      	push	{r3, lr}
20021e68:	d004      	beq.n	20021e74 <sifli_secboot_exception+0x10>
20021e6a:	2802      	cmp	r0, #2
20021e6c:	d009      	beq.n	20021e82 <sifli_secboot_exception+0x1e>
20021e6e:	2213      	movs	r2, #19
20021e70:	4905      	ldr	r1, [pc, #20]	@ (20021e88 <sifli_secboot_exception+0x24>)
20021e72:	e001      	b.n	20021e78 <sifli_secboot_exception+0x14>
20021e74:	2217      	movs	r2, #23
20021e76:	4905      	ldr	r1, [pc, #20]	@ (20021e8c <sifli_secboot_exception+0x28>)
20021e78:	4805      	ldr	r0, [pc, #20]	@ (20021e90 <sifli_secboot_exception+0x2c>)
20021e7a:	f7fe fa0d 	bl	20020298 <boot_uart_tx>
20021e7e:	e7fe      	b.n	20021e7e <sifli_secboot_exception+0x1a>
20021e80:	bd08      	pop	{r3, pc}
20021e82:	2219      	movs	r2, #25
20021e84:	4903      	ldr	r1, [pc, #12]	@ (20021e94 <sifli_secboot_exception+0x30>)
20021e86:	e7f7      	b.n	20021e78 <sifli_secboot_exception+0x14>
20021e88:	2002a9c2 	.word	0x2002a9c2
20021e8c:	2002a990 	.word	0x2002a990
20021e90:	50084000 	.word	0x50084000
20021e94:	2002a9a8 	.word	0x2002a9a8

20021e98 <__aeabi_unwind_cpp_pr0>:
20021e98:	2000      	movs	r0, #0
20021e9a:	4770      	bx	lr

20021e9c <HAL_GetTick>:
20021e9c:	4b01      	ldr	r3, [pc, #4]	@ (20021ea4 <HAL_GetTick+0x8>)
20021e9e:	6818      	ldr	r0, [r3, #0]
20021ea0:	4770      	bx	lr
20021ea2:	bf00      	nop
20021ea4:	2004cb40 	.word	0x2004cb40

20021ea8 <HAL_Delay_us_>:
20021ea8:	b513      	push	{r0, r1, r4, lr}
20021eaa:	9001      	str	r0, [sp, #4]
20021eac:	9b01      	ldr	r3, [sp, #4]
20021eae:	4c1a      	ldr	r4, [pc, #104]	@ (20021f18 <HAL_Delay_us_+0x70>)
20021eb0:	b133      	cbz	r3, 20021ec0 <HAL_Delay_us_+0x18>
20021eb2:	6823      	ldr	r3, [r4, #0]
20021eb4:	b123      	cbz	r3, 20021ec0 <HAL_Delay_us_+0x18>
20021eb6:	9b01      	ldr	r3, [sp, #4]
20021eb8:	f1b3 7f80 	cmp.w	r3, #16777216	@ 0x1000000
20021ebc:	d90c      	bls.n	20021ed8 <HAL_Delay_us_+0x30>
20021ebe:	e7fe      	b.n	20021ebe <HAL_Delay_us_+0x16>
20021ec0:	2000      	movs	r0, #0
20021ec2:	f003 f81d 	bl	20024f00 <HAL_RCC_GetHCLKFreq>
20021ec6:	4b15      	ldr	r3, [pc, #84]	@ (20021f1c <HAL_Delay_us_+0x74>)
20021ec8:	fbb0 f0f3 	udiv	r0, r0, r3
20021ecc:	9b01      	ldr	r3, [sp, #4]
20021ece:	6020      	str	r0, [r4, #0]
20021ed0:	2b00      	cmp	r3, #0
20021ed2:	d1f0      	bne.n	20021eb6 <HAL_Delay_us_+0xe>
20021ed4:	b002      	add	sp, #8
20021ed6:	bd10      	pop	{r4, pc}
20021ed8:	9b01      	ldr	r3, [sp, #4]
20021eda:	2b00      	cmp	r3, #0
20021edc:	d0fa      	beq.n	20021ed4 <HAL_Delay_us_+0x2c>
20021ede:	4a10      	ldr	r2, [pc, #64]	@ (20021f20 <HAL_Delay_us_+0x78>)
20021ee0:	6813      	ldr	r3, [r2, #0]
20021ee2:	f013 0301 	ands.w	r3, r3, #1
20021ee6:	d10d      	bne.n	20021f04 <HAL_Delay_us_+0x5c>
20021ee8:	480e      	ldr	r0, [pc, #56]	@ (20021f24 <HAL_Delay_us_+0x7c>)
20021eea:	f8d0 10fc 	ldr.w	r1, [r0, #252]	@ 0xfc
20021eee:	f041 7180 	orr.w	r1, r1, #16777216	@ 0x1000000
20021ef2:	f8c0 10fc 	str.w	r1, [r0, #252]	@ 0xfc
20021ef6:	6053      	str	r3, [r2, #4]
20021ef8:	6813      	ldr	r3, [r2, #0]
20021efa:	f443 3300 	orr.w	r3, r3, #131072	@ 0x20000
20021efe:	f043 0301 	orr.w	r3, r3, #1
20021f02:	6013      	str	r3, [r2, #0]
20021f04:	9b01      	ldr	r3, [sp, #4]
20021f06:	6822      	ldr	r2, [r4, #0]
20021f08:	4905      	ldr	r1, [pc, #20]	@ (20021f20 <HAL_Delay_us_+0x78>)
20021f0a:	4353      	muls	r3, r2
20021f0c:	6848      	ldr	r0, [r1, #4]
20021f0e:	684a      	ldr	r2, [r1, #4]
20021f10:	1a12      	subs	r2, r2, r0
20021f12:	429a      	cmp	r2, r3
20021f14:	d3fb      	bcc.n	20021f0e <HAL_Delay_us_+0x66>
20021f16:	e7dd      	b.n	20021ed4 <HAL_Delay_us_+0x2c>
20021f18:	2004cb3c 	.word	0x2004cb3c
20021f1c:	000f4240 	.word	0x000f4240
20021f20:	e0001000 	.word	0xe0001000
20021f24:	e000ed00 	.word	0xe000ed00

20021f28 <HAL_Delay_us2_>:
20021f28:	b537      	push	{r0, r1, r2, r4, r5, lr}
20021f2a:	9001      	str	r0, [sp, #4]
20021f2c:	f04f 20e0 	mov.w	r0, #3758153728	@ 0xe000e000
20021f30:	f44f 727a 	mov.w	r2, #1000	@ 0x3e8
20021f34:	6944      	ldr	r4, [r0, #20]
20021f36:	9b01      	ldr	r3, [sp, #4]
20021f38:	4363      	muls	r3, r4
20021f3a:	fbb3 f3f2 	udiv	r3, r3, r2
20021f3e:	9301      	str	r3, [sp, #4]
20021f40:	2300      	movs	r3, #0
20021f42:	6981      	ldr	r1, [r0, #24]
20021f44:	6982      	ldr	r2, [r0, #24]
20021f46:	428a      	cmp	r2, r1
20021f48:	d0fc      	beq.n	20021f44 <HAL_Delay_us2_+0x1c>
20021f4a:	bf25      	ittet	cs
20021f4c:	1aa5      	subcs	r5, r4, r2
20021f4e:	195b      	addcs	r3, r3, r5
20021f50:	185b      	addcc	r3, r3, r1
20021f52:	185b      	addcs	r3, r3, r1
20021f54:	9901      	ldr	r1, [sp, #4]
20021f56:	bf38      	it	cc
20021f58:	1a9b      	subcc	r3, r3, r2
20021f5a:	4299      	cmp	r1, r3
20021f5c:	d801      	bhi.n	20021f62 <HAL_Delay_us2_+0x3a>
20021f5e:	b003      	add	sp, #12
20021f60:	bd30      	pop	{r4, r5, pc}
20021f62:	4611      	mov	r1, r2
20021f64:	e7ee      	b.n	20021f44 <HAL_Delay_us2_+0x1c>

20021f66 <HAL_Delay_us>:
20021f66:	4603      	mov	r3, r0
20021f68:	b570      	push	{r4, r5, r6, lr}
20021f6a:	b1b8      	cbz	r0, 20021f9c <HAL_Delay_us+0x36>
20021f6c:	f242 7510 	movw	r5, #10000	@ 0x2710
20021f70:	f04f 26e0 	mov.w	r6, #3758153728	@ 0xe000e000
20021f74:	42ab      	cmp	r3, r5
20021f76:	bf84      	itt	hi
20021f78:	f5a3 541c 	subhi.w	r4, r3, #9984	@ 0x2700
20021f7c:	f242 7310 	movwhi	r3, #10000	@ 0x2710
20021f80:	6932      	ldr	r2, [r6, #16]
20021f82:	bf98      	it	ls
20021f84:	2400      	movls	r4, #0
20021f86:	4618      	mov	r0, r3
20021f88:	bf88      	it	hi
20021f8a:	3c10      	subhi	r4, #16
20021f8c:	07d3      	lsls	r3, r2, #31
20021f8e:	d408      	bmi.n	20021fa2 <HAL_Delay_us+0x3c>
20021f90:	f7ff ff8a 	bl	20021ea8 <HAL_Delay_us_>
20021f94:	4623      	mov	r3, r4
20021f96:	2c00      	cmp	r4, #0
20021f98:	d1ec      	bne.n	20021f74 <HAL_Delay_us+0xe>
20021f9a:	e001      	b.n	20021fa0 <HAL_Delay_us+0x3a>
20021f9c:	f7ff ff84 	bl	20021ea8 <HAL_Delay_us_>
20021fa0:	bd70      	pop	{r4, r5, r6, pc}
20021fa2:	f7ff ffc1 	bl	20021f28 <HAL_Delay_us2_>
20021fa6:	e7f5      	b.n	20021f94 <HAL_Delay_us+0x2e>

20021fa8 <WDT_IRQHandler>:
20021fa8:	4770      	bx	lr

20021faa <DBG_Trigger_IRQHandler>:
20021faa:	4770      	bx	lr

20021fac <NMI_Handler>:
20021fac:	b508      	push	{r3, lr}
20021fae:	4b05      	ldr	r3, [pc, #20]	@ (20021fc4 <NMI_Handler+0x18>)
20021fb0:	6a1b      	ldr	r3, [r3, #32]
20021fb2:	005b      	lsls	r3, r3, #1
20021fb4:	d502      	bpl.n	20021fbc <NMI_Handler+0x10>
20021fb6:	f7ff fff8 	bl	20021faa <DBG_Trigger_IRQHandler>
20021fba:	bd08      	pop	{r3, pc}
20021fbc:	f7ff fff4 	bl	20021fa8 <WDT_IRQHandler>
20021fc0:	e7fb      	b.n	20021fba <NMI_Handler+0xe>
20021fc2:	bf00      	nop
20021fc4:	5000b000 	.word	0x5000b000

20021fc8 <HAL_AES_run_help>:
20021fc8:	b510      	push	{r4, lr}
20021fca:	f101 4470 	add.w	r4, r1, #4026531840	@ 0xf0000000
20021fce:	f1b4 5f80 	cmp.w	r4, #268435456	@ 0x10000000
20021fd2:	4c0e      	ldr	r4, [pc, #56]	@ (2002200c <HAL_AES_run_help+0x44>)
20021fd4:	bf38      	it	cc
20021fd6:	f101 41a0 	addcc.w	r1, r1, #1342177280	@ 0x50000000
20021fda:	6161      	str	r1, [r4, #20]
20021fdc:	f102 4170 	add.w	r1, r2, #4026531840	@ 0xf0000000
20021fe0:	f1b1 5f80 	cmp.w	r1, #268435456	@ 0x10000000
20021fe4:	f103 030f 	add.w	r3, r3, #15
20021fe8:	ea4f 1323 	mov.w	r3, r3, asr #4
20021fec:	bf38      	it	cc
20021fee:	f102 42a0 	addcc.w	r2, r2, #1342177280	@ 0x50000000
20021ff2:	61a2      	str	r2, [r4, #24]
20021ff4:	61e3      	str	r3, [r4, #28]
20021ff6:	6923      	ldr	r3, [r4, #16]
20021ff8:	b108      	cbz	r0, 20021ffe <HAL_AES_run_help+0x36>
20021ffa:	ea43 13c0 	orr.w	r3, r3, r0, lsl #7
20021ffe:	4a03      	ldr	r2, [pc, #12]	@ (2002200c <HAL_AES_run_help+0x44>)
20022000:	6123      	str	r3, [r4, #16]
20022002:	6813      	ldr	r3, [r2, #0]
20022004:	f043 0301 	orr.w	r3, r3, #1
20022008:	6013      	str	r3, [r2, #0]
2002200a:	bd10      	pop	{r4, pc}
2002200c:	5000d000 	.word	0x5000d000

20022010 <HAL_HASH_run_help.isra.0>:
20022010:	f100 4370 	add.w	r3, r0, #4026531840	@ 0xf0000000
20022014:	b510      	push	{r4, lr}
20022016:	f1b3 5f80 	cmp.w	r3, #268435456	@ 0x10000000
2002201a:	4c09      	ldr	r4, [pc, #36]	@ (20022040 <HAL_HASH_run_help.isra.0+0x30>)
2002201c:	bf38      	it	cc
2002201e:	f100 40a0 	addcc.w	r0, r0, #1342177280	@ 0x50000000
20022022:	6560      	str	r0, [r4, #84]	@ 0x54
20022024:	65a1      	str	r1, [r4, #88]	@ 0x58
20022026:	b11a      	cbz	r2, 20022030 <HAL_HASH_run_help.isra.0+0x20>
20022028:	6d23      	ldr	r3, [r4, #80]	@ 0x50
2002202a:	f043 0308 	orr.w	r3, r3, #8
2002202e:	6523      	str	r3, [r4, #80]	@ 0x50
20022030:	6d21      	ldr	r1, [r4, #80]	@ 0x50
20022032:	4804      	ldr	r0, [pc, #16]	@ (20022044 <HAL_HASH_run_help.isra.0+0x34>)
20022034:	f000 fca4 	bl	20022980 <HAL_DBG_printf>
20022038:	2304      	movs	r3, #4
2002203a:	6023      	str	r3, [r4, #0]
2002203c:	bd10      	pop	{r4, pc}
2002203e:	bf00      	nop
20022040:	5000d000 	.word	0x5000d000
20022044:	2002a9d6 	.word	0x2002a9d6

20022048 <HAL_AES_reset>:
20022048:	2202      	movs	r2, #2
2002204a:	2000      	movs	r0, #0
2002204c:	4b01      	ldr	r3, [pc, #4]	@ (20022054 <HAL_AES_reset+0xc>)
2002204e:	601a      	str	r2, [r3, #0]
20022050:	6018      	str	r0, [r3, #0]
20022052:	4770      	bx	lr
20022054:	5000d000 	.word	0x5000d000

20022058 <HAL_AES_init>:
20022058:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
2002205a:	461f      	mov	r7, r3
2002205c:	4b1e      	ldr	r3, [pc, #120]	@ (200220d8 <HAL_AES_init+0x80>)
2002205e:	4604      	mov	r4, r0
20022060:	685b      	ldr	r3, [r3, #4]
20022062:	4616      	mov	r6, r2
20022064:	07db      	lsls	r3, r3, #31
20022066:	d501      	bpl.n	2002206c <HAL_AES_init+0x14>
20022068:	f7ff ffee 	bl	20022048 <HAL_AES_reset>
2002206c:	fab4 f084 	clz	r0, r4
20022070:	2918      	cmp	r1, #24
20022072:	ea4f 1050 	mov.w	r0, r0, lsr #5
20022076:	ea4f 1540 	mov.w	r5, r0, lsl #5
2002207a:	d01c      	beq.n	200220b6 <HAL_AES_init+0x5e>
2002207c:	2920      	cmp	r1, #32
2002207e:	d01c      	beq.n	200220ba <HAL_AES_init+0x62>
20022080:	2910      	cmp	r1, #16
20022082:	d125      	bne.n	200220d0 <HAL_AES_init+0x78>
20022084:	2300      	movs	r3, #0
20022086:	b164      	cbz	r4, 200220a2 <HAL_AES_init+0x4a>
20022088:	4620      	mov	r0, r4
2002208a:	4a14      	ldr	r2, [pc, #80]	@ (200220dc <HAL_AES_init+0x84>)
2002208c:	f021 0103 	bic.w	r1, r1, #3
20022090:	4421      	add	r1, r4
20022092:	1b12      	subs	r2, r2, r4
20022094:	1814      	adds	r4, r2, r0
20022096:	f850 cb04 	ldr.w	ip, [r0], #4
2002209a:	4281      	cmp	r1, r0
2002209c:	f8c4 c000 	str.w	ip, [r4]
200220a0:	d1f8      	bne.n	20022094 <HAL_AES_init+0x3c>
200220a2:	ea47 0005 	orr.w	r0, r7, r5
200220a6:	ea40 00c3 	orr.w	r0, r0, r3, lsl #3
200220aa:	4b0b      	ldr	r3, [pc, #44]	@ (200220d8 <HAL_AES_init+0x80>)
200220ac:	6118      	str	r0, [r3, #16]
200220ae:	b107      	cbz	r7, 200220b2 <HAL_AES_init+0x5a>
200220b0:	b92e      	cbnz	r6, 200220be <HAL_AES_init+0x66>
200220b2:	2000      	movs	r0, #0
200220b4:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
200220b6:	2301      	movs	r3, #1
200220b8:	e7e5      	b.n	20022086 <HAL_AES_init+0x2e>
200220ba:	2302      	movs	r3, #2
200220bc:	e7e3      	b.n	20022086 <HAL_AES_init+0x2e>
200220be:	6832      	ldr	r2, [r6, #0]
200220c0:	621a      	str	r2, [r3, #32]
200220c2:	6872      	ldr	r2, [r6, #4]
200220c4:	625a      	str	r2, [r3, #36]	@ 0x24
200220c6:	68b2      	ldr	r2, [r6, #8]
200220c8:	629a      	str	r2, [r3, #40]	@ 0x28
200220ca:	68f2      	ldr	r2, [r6, #12]
200220cc:	62da      	str	r2, [r3, #44]	@ 0x2c
200220ce:	e7f0      	b.n	200220b2 <HAL_AES_init+0x5a>
200220d0:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
200220d4:	e7ee      	b.n	200220b4 <HAL_AES_init+0x5c>
200220d6:	bf00      	nop
200220d8:	5000d000 	.word	0x5000d000
200220dc:	5000d030 	.word	0x5000d030

200220e0 <HAL_AES_run>:
200220e0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
200220e2:	2708      	movs	r7, #8
200220e4:	4e17      	ldr	r6, [pc, #92]	@ (20022144 <HAL_AES_run+0x64>)
200220e6:	4614      	mov	r4, r2
200220e8:	461d      	mov	r5, r3
200220ea:	f8c6 7088 	str.w	r7, [r6, #136]	@ 0x88
200220ee:	f3bf 8f4f 	dsb	sy
200220f2:	f3bf 8f6f 	isb	sy
200220f6:	2700      	movs	r7, #0
200220f8:	4e13      	ldr	r6, [pc, #76]	@ (20022148 <HAL_AES_run+0x68>)
200220fa:	60f7      	str	r7, [r6, #12]
200220fc:	f7ff ff64 	bl	20021fc8 <HAL_AES_run_help>
20022100:	6873      	ldr	r3, [r6, #4]
20022102:	07db      	lsls	r3, r3, #31
20022104:	d4fc      	bmi.n	20022100 <HAL_AES_run+0x20>
20022106:	68b0      	ldr	r0, [r6, #8]
20022108:	f000 0006 	and.w	r0, r0, #6
2002210c:	3800      	subs	r0, #0
2002210e:	bf18      	it	ne
20022110:	2001      	movne	r0, #1
20022112:	f1b4 4fc0 	cmp.w	r4, #1610612736	@ 0x60000000
20022116:	d313      	bcc.n	20022140 <HAL_AES_run+0x60>
20022118:	2d00      	cmp	r5, #0
2002211a:	dd11      	ble.n	20022140 <HAL_AES_run+0x60>
2002211c:	f004 031f 	and.w	r3, r4, #31
20022120:	442b      	add	r3, r5
20022122:	f3bf 8f4f 	dsb	sy
20022126:	4622      	mov	r2, r4
20022128:	4c08      	ldr	r4, [pc, #32]	@ (2002214c <HAL_AES_run+0x6c>)
2002212a:	4413      	add	r3, r2
2002212c:	f8c4 225c 	str.w	r2, [r4, #604]	@ 0x25c
20022130:	3220      	adds	r2, #32
20022132:	1a99      	subs	r1, r3, r2
20022134:	2900      	cmp	r1, #0
20022136:	dcf9      	bgt.n	2002212c <HAL_AES_run+0x4c>
20022138:	f3bf 8f4f 	dsb	sy
2002213c:	f3bf 8f6f 	isb	sy
20022140:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
20022142:	bf00      	nop
20022144:	e000e100 	.word	0xe000e100
20022148:	5000d000 	.word	0x5000d000
2002214c:	e000ed00 	.word	0xe000ed00

20022150 <HAL_HASH_run>:
20022150:	b510      	push	{r4, lr}
20022152:	2408      	movs	r4, #8
20022154:	4b0b      	ldr	r3, [pc, #44]	@ (20022184 <HAL_HASH_run+0x34>)
20022156:	f8c3 4088 	str.w	r4, [r3, #136]	@ 0x88
2002215a:	f3bf 8f4f 	dsb	sy
2002215e:	f3bf 8f6f 	isb	sy
20022162:	f7ff ff55 	bl	20022010 <HAL_HASH_run_help.isra.0>
20022166:	4b08      	ldr	r3, [pc, #32]	@ (20022188 <HAL_HASH_run+0x38>)
20022168:	685a      	ldr	r2, [r3, #4]
2002216a:	0752      	lsls	r2, r2, #29
2002216c:	d4fc      	bmi.n	20022168 <HAL_HASH_run+0x18>
2002216e:	689a      	ldr	r2, [r3, #8]
20022170:	f002 0238 	and.w	r2, r2, #56	@ 0x38
20022174:	609a      	str	r2, [r3, #8]
20022176:	6898      	ldr	r0, [r3, #8]
20022178:	f000 0030 	and.w	r0, r0, #48	@ 0x30
2002217c:	3800      	subs	r0, #0
2002217e:	bf18      	it	ne
20022180:	2001      	movne	r0, #1
20022182:	bd10      	pop	{r4, pc}
20022184:	e000e100 	.word	0xe000e100
20022188:	5000d000 	.word	0x5000d000

2002218c <HAL_HASH_reset>:
2002218c:	2208      	movs	r2, #8
2002218e:	2000      	movs	r0, #0
20022190:	4b01      	ldr	r3, [pc, #4]	@ (20022198 <HAL_HASH_reset+0xc>)
20022192:	601a      	str	r2, [r3, #0]
20022194:	6018      	str	r0, [r3, #0]
20022196:	4770      	bx	lr
20022198:	5000d000 	.word	0x5000d000

2002219c <HAL_HASH_init>:
2002219c:	0693      	lsls	r3, r2, #26
2002219e:	b570      	push	{r4, r5, r6, lr}
200221a0:	4606      	mov	r6, r0
200221a2:	460c      	mov	r4, r1
200221a4:	4615      	mov	r5, r2
200221a6:	d11c      	bne.n	200221e2 <HAL_HASH_init+0x46>
200221a8:	2903      	cmp	r1, #3
200221aa:	d81a      	bhi.n	200221e2 <HAL_HASH_init+0x46>
200221ac:	f7ff ffee 	bl	2002218c <HAL_HASH_reset>
200221b0:	b13e      	cbz	r6, 200221c2 <HAL_HASH_init+0x26>
200221b2:	4b0d      	ldr	r3, [pc, #52]	@ (200221e8 <HAL_HASH_init+0x4c>)
200221b4:	480d      	ldr	r0, [pc, #52]	@ (200221ec <HAL_HASH_init+0x50>)
200221b6:	5c5a      	ldrb	r2, [r3, r1]
200221b8:	4631      	mov	r1, r6
200221ba:	f008 fb5d 	bl	2002a878 <memcpy>
200221be:	f044 0420 	orr.w	r4, r4, #32
200221c2:	4b0b      	ldr	r3, [pc, #44]	@ (200221f0 <HAL_HASH_init+0x54>)
200221c4:	f044 0180 	orr.w	r1, r4, #128	@ 0x80
200221c8:	6519      	str	r1, [r3, #80]	@ 0x50
200221ca:	b11d      	cbz	r5, 200221d4 <HAL_HASH_init+0x38>
200221cc:	f8c3 509c 	str.w	r5, [r3, #156]	@ 0x9c
200221d0:	f444 71c0 	orr.w	r1, r4, #384	@ 0x180
200221d4:	4807      	ldr	r0, [pc, #28]	@ (200221f4 <HAL_HASH_init+0x58>)
200221d6:	462a      	mov	r2, r5
200221d8:	6519      	str	r1, [r3, #80]	@ 0x50
200221da:	f000 fbd1 	bl	20022980 <HAL_DBG_printf>
200221de:	2000      	movs	r0, #0
200221e0:	bd70      	pop	{r4, r5, r6, pc}
200221e2:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
200221e6:	e7fb      	b.n	200221e0 <HAL_HASH_init+0x44>
200221e8:	2002b06c 	.word	0x2002b06c
200221ec:	5000d05c 	.word	0x5000d05c
200221f0:	5000d000 	.word	0x5000d000
200221f4:	2002a9e9 	.word	0x2002a9e9

200221f8 <HAL_HASH_result>:
200221f8:	b510      	push	{r4, lr}
200221fa:	4c08      	ldr	r4, [pc, #32]	@ (2002221c <HAL_HASH_result+0x24>)
200221fc:	4a08      	ldr	r2, [pc, #32]	@ (20022220 <HAL_HASH_result+0x28>)
200221fe:	6d23      	ldr	r3, [r4, #80]	@ 0x50
20022200:	f104 017c 	add.w	r1, r4, #124	@ 0x7c
20022204:	f003 0307 	and.w	r3, r3, #7
20022208:	5cd2      	ldrb	r2, [r2, r3]
2002220a:	f008 fb35 	bl	2002a878 <memcpy>
2002220e:	f8d4 10a4 	ldr.w	r1, [r4, #164]	@ 0xa4
20022212:	4804      	ldr	r0, [pc, #16]	@ (20022224 <HAL_HASH_result+0x2c>)
20022214:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
20022218:	f000 bbb2 	b.w	20022980 <HAL_DBG_printf>
2002221c:	5000d000 	.word	0x5000d000
20022220:	2002b06c 	.word	0x2002b06c
20022224:	2002aa1d 	.word	0x2002aa1d

20022228 <HAL_NVIC_EnableIRQ>:
20022228:	2800      	cmp	r0, #0
2002222a:	da00      	bge.n	2002222e <HAL_NVIC_EnableIRQ+0x6>
2002222c:	e7fe      	b.n	2002222c <HAL_NVIC_EnableIRQ+0x4>
2002222e:	2301      	movs	r3, #1
20022230:	0941      	lsrs	r1, r0, #5
20022232:	4a03      	ldr	r2, [pc, #12]	@ (20022240 <HAL_NVIC_EnableIRQ+0x18>)
20022234:	f000 001f 	and.w	r0, r0, #31
20022238:	4083      	lsls	r3, r0
2002223a:	f842 3021 	str.w	r3, [r2, r1, lsl #2]
2002223e:	4770      	bx	lr
20022240:	e000e100 	.word	0xe000e100

20022244 <HAL_NVIC_DisableIRQ>:
20022244:	2800      	cmp	r0, #0
20022246:	da00      	bge.n	2002224a <HAL_NVIC_DisableIRQ+0x6>
20022248:	e7fe      	b.n	20022248 <HAL_NVIC_DisableIRQ+0x4>
2002224a:	2201      	movs	r2, #1
2002224c:	4906      	ldr	r1, [pc, #24]	@ (20022268 <HAL_NVIC_DisableIRQ+0x24>)
2002224e:	0943      	lsrs	r3, r0, #5
20022250:	f000 001f 	and.w	r0, r0, #31
20022254:	4082      	lsls	r2, r0
20022256:	3320      	adds	r3, #32
20022258:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
2002225c:	f3bf 8f4f 	dsb	sy
20022260:	f3bf 8f6f 	isb	sy
20022264:	4770      	bx	lr
20022266:	bf00      	nop
20022268:	e000e100 	.word	0xe000e100

2002226c <DMA_Init>:
2002226c:	2302      	movs	r3, #2
2002226e:	b530      	push	{r4, r5, lr}
20022270:	6a42      	ldr	r2, [r0, #36]	@ 0x24
20022272:	f880 302d 	strb.w	r3, [r0, #45]	@ 0x2d
20022276:	6803      	ldr	r3, [r0, #0]
20022278:	611a      	str	r2, [r3, #16]
2002227a:	e9d0 3402 	ldrd	r3, r4, [r0, #8]
2002227e:	4323      	orrs	r3, r4
20022280:	6904      	ldr	r4, [r0, #16]
20022282:	6801      	ldr	r1, [r0, #0]
20022284:	4323      	orrs	r3, r4
20022286:	6944      	ldr	r4, [r0, #20]
20022288:	680a      	ldr	r2, [r1, #0]
2002228a:	4323      	orrs	r3, r4
2002228c:	6984      	ldr	r4, [r0, #24]
2002228e:	f36f 120e 	bfc	r2, #4, #11
20022292:	4323      	orrs	r3, r4
20022294:	69c4      	ldr	r4, [r0, #28]
20022296:	4323      	orrs	r3, r4
20022298:	6a04      	ldr	r4, [r0, #32]
2002229a:	4323      	orrs	r3, r4
2002229c:	4313      	orrs	r3, r2
2002229e:	600b      	str	r3, [r1, #0]
200222a0:	6883      	ldr	r3, [r0, #8]
200222a2:	f5b3 4f80 	cmp.w	r3, #16384	@ 0x4000
200222a6:	d018      	beq.n	200222da <DMA_Init+0x6e>
200222a8:	6cc1      	ldr	r1, [r0, #76]	@ 0x4c
200222aa:	6c82      	ldr	r2, [r0, #72]	@ 0x48
200222ac:	f3c1 0387 	ubfx	r3, r1, #2, #8
200222b0:	06c9      	lsls	r1, r1, #27
200222b2:	d41b      	bmi.n	200222ec <DMA_Init+0x80>
200222b4:	243f      	movs	r4, #63	@ 0x3f
200222b6:	f003 0307 	and.w	r3, r3, #7
200222ba:	f8d2 10a8 	ldr.w	r1, [r2, #168]	@ 0xa8
200222be:	00db      	lsls	r3, r3, #3
200222c0:	409c      	lsls	r4, r3
200222c2:	ea21 0104 	bic.w	r1, r1, r4
200222c6:	f8c2 10a8 	str.w	r1, [r2, #168]	@ 0xa8
200222ca:	6c81      	ldr	r1, [r0, #72]	@ 0x48
200222cc:	6842      	ldr	r2, [r0, #4]
200222ce:	f8d1 40a8 	ldr.w	r4, [r1, #168]	@ 0xa8
200222d2:	409a      	lsls	r2, r3
200222d4:	4322      	orrs	r2, r4
200222d6:	f8c1 20a8 	str.w	r2, [r1, #168]	@ 0xa8
200222da:	6982      	ldr	r2, [r0, #24]
200222dc:	f5b2 6f80 	cmp.w	r2, #1024	@ 0x400
200222e0:	d018      	beq.n	20022314 <DMA_Init+0xa8>
200222e2:	f5b2 6f00 	cmp.w	r2, #2048	@ 0x800
200222e6:	d01f      	beq.n	20022328 <DMA_Init+0xbc>
200222e8:	b1aa      	cbz	r2, 20022316 <DMA_Init+0xaa>
200222ea:	e7fe      	b.n	200222ea <DMA_Init+0x7e>
200222ec:	243f      	movs	r4, #63	@ 0x3f
200222ee:	f003 0303 	and.w	r3, r3, #3
200222f2:	f8d2 10ac 	ldr.w	r1, [r2, #172]	@ 0xac
200222f6:	00db      	lsls	r3, r3, #3
200222f8:	409c      	lsls	r4, r3
200222fa:	ea21 0104 	bic.w	r1, r1, r4
200222fe:	f8c2 10ac 	str.w	r1, [r2, #172]	@ 0xac
20022302:	6c81      	ldr	r1, [r0, #72]	@ 0x48
20022304:	6842      	ldr	r2, [r0, #4]
20022306:	f8d1 40ac 	ldr.w	r4, [r1, #172]	@ 0xac
2002230a:	409a      	lsls	r2, r3
2002230c:	4322      	orrs	r2, r4
2002230e:	f8c1 20ac 	str.w	r2, [r1, #172]	@ 0xac
20022312:	e7e2      	b.n	200222da <DMA_Init+0x6e>
20022314:	2201      	movs	r2, #1
20022316:	6943      	ldr	r3, [r0, #20]
20022318:	f5b3 7f80 	cmp.w	r3, #256	@ 0x100
2002231c:	d006      	beq.n	2002232c <DMA_Init+0xc0>
2002231e:	f5b3 7f00 	cmp.w	r3, #512	@ 0x200
20022322:	d02b      	beq.n	2002237c <DMA_Init+0x110>
20022324:	b11b      	cbz	r3, 2002232e <DMA_Init+0xc2>
20022326:	e7fe      	b.n	20022326 <DMA_Init+0xba>
20022328:	2202      	movs	r2, #2
2002232a:	e7f4      	b.n	20022316 <DMA_Init+0xaa>
2002232c:	2301      	movs	r3, #1
2002232e:	6901      	ldr	r1, [r0, #16]
20022330:	f1a1 0480 	sub.w	r4, r1, #128	@ 0x80
20022334:	4261      	negs	r1, r4
20022336:	4161      	adcs	r1, r4
20022338:	68c4      	ldr	r4, [r0, #12]
2002233a:	f1a4 0540 	sub.w	r5, r4, #64	@ 0x40
2002233e:	426c      	negs	r4, r5
20022340:	416c      	adcs	r4, r5
20022342:	6885      	ldr	r5, [r0, #8]
20022344:	2d10      	cmp	r5, #16
20022346:	bf1f      	itttt	ne
20022348:	f880 1065 	strbne.w	r1, [r0, #101]	@ 0x65
2002234c:	4619      	movne	r1, r3
2002234e:	4613      	movne	r3, r2
20022350:	460a      	movne	r2, r1
20022352:	f880 3067 	strb.w	r3, [r0, #103]	@ 0x67
20022356:	f880 2066 	strb.w	r2, [r0, #102]	@ 0x66
2002235a:	f04f 0300 	mov.w	r3, #0
2002235e:	f04f 0201 	mov.w	r2, #1
20022362:	6443      	str	r3, [r0, #68]	@ 0x44
20022364:	bf06      	itte	eq
20022366:	f880 4065 	strbeq.w	r4, [r0, #101]	@ 0x65
2002236a:	f880 1064 	strbeq.w	r1, [r0, #100]	@ 0x64
2002236e:	f880 4064 	strbne.w	r4, [r0, #100]	@ 0x64
20022372:	f880 202d 	strb.w	r2, [r0, #45]	@ 0x2d
20022376:	f880 302c 	strb.w	r3, [r0, #44]	@ 0x2c
2002237a:	bd30      	pop	{r4, r5, pc}
2002237c:	2302      	movs	r3, #2
2002237e:	e7d6      	b.n	2002232e <DMA_Init+0xc2>

20022380 <DMA_AllocChannel>:
20022380:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
20022382:	4b2e      	ldr	r3, [pc, #184]	@ (2002243c <DMA_AllocChannel+0xbc>)
20022384:	6802      	ldr	r2, [r0, #0]
20022386:	4413      	add	r3, r2
20022388:	2ba0      	cmp	r3, #160	@ 0xa0
2002238a:	d904      	bls.n	20022396 <DMA_AllocChannel+0x16>
2002238c:	4b2c      	ldr	r3, [pc, #176]	@ (20022440 <DMA_AllocChannel+0xc0>)
2002238e:	4413      	add	r3, r2
20022390:	2ba0      	cmp	r3, #160	@ 0xa0
20022392:	d90f      	bls.n	200223b4 <DMA_AllocChannel+0x34>
20022394:	e7fe      	b.n	20022394 <DMA_AllocChannel+0x14>
20022396:	2632      	movs	r6, #50	@ 0x32
20022398:	f8df c0b0 	ldr.w	ip, [pc, #176]	@ 2002244c <DMA_AllocChannel+0xcc>
2002239c:	4b29      	ldr	r3, [pc, #164]	@ (20022444 <DMA_AllocChannel+0xc4>)
2002239e:	f3ef 8710 	mrs	r7, PRIMASK
200223a2:	2201      	movs	r2, #1
200223a4:	f382 8810 	msr	PRIMASK, r2
200223a8:	6cc5      	ldr	r5, [r0, #76]	@ 0x4c
200223aa:	2d1f      	cmp	r5, #31
200223ac:	ea4f 0495 	mov.w	r4, r5, lsr #2
200223b0:	d905      	bls.n	200223be <DMA_AllocChannel+0x3e>
200223b2:	e7fe      	b.n	200223b2 <DMA_AllocChannel+0x32>
200223b4:	2602      	movs	r6, #2
200223b6:	f8df c098 	ldr.w	ip, [pc, #152]	@ 20022450 <DMA_AllocChannel+0xd0>
200223ba:	4b23      	ldr	r3, [pc, #140]	@ (20022448 <DMA_AllocChannel+0xc8>)
200223bc:	e7ef      	b.n	2002239e <DMA_AllocChannel+0x1e>
200223be:	eb03 05c4 	add.w	r5, r3, r4, lsl #3
200223c2:	f895 e004 	ldrb.w	lr, [r5, #4]
200223c6:	f1be 0f00 	cmp.w	lr, #0
200223ca:	d032      	beq.n	20022432 <DMA_AllocChannel+0xb2>
200223cc:	f853 2034 	ldr.w	r2, [r3, r4, lsl #3]
200223d0:	4282      	cmp	r2, r0
200223d2:	d103      	bne.n	200223dc <DMA_AllocChannel+0x5c>
200223d4:	f387 8810 	msr	PRIMASK, r7
200223d8:	2002      	movs	r0, #2
200223da:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
200223dc:	2200      	movs	r2, #0
200223de:	791c      	ldrb	r4, [r3, #4]
200223e0:	461d      	mov	r5, r3
200223e2:	bb04      	cbnz	r4, 20022426 <DMA_AllocChannel+0xa6>
200223e4:	2301      	movs	r3, #1
200223e6:	712b      	strb	r3, [r5, #4]
200223e8:	2314      	movs	r3, #20
200223ea:	fb03 c302 	mla	r3, r3, r2, ip
200223ee:	4416      	add	r6, r2
200223f0:	0092      	lsls	r2, r2, #2
200223f2:	b274      	sxtb	r4, r6
200223f4:	6003      	str	r3, [r0, #0]
200223f6:	64c2      	str	r2, [r0, #76]	@ 0x4c
200223f8:	f387 8810 	msr	PRIMASK, r7
200223fc:	b121      	cbz	r1, 20022408 <DMA_AllocChannel+0x88>
200223fe:	682b      	ldr	r3, [r5, #0]
20022400:	4283      	cmp	r3, r0
20022402:	d001      	beq.n	20022408 <DMA_AllocChannel+0x88>
20022404:	f7ff ff32 	bl	2002226c <DMA_Init>
20022408:	6028      	str	r0, [r5, #0]
2002240a:	6a83      	ldr	r3, [r0, #40]	@ 0x28
2002240c:	f104 4260 	add.w	r2, r4, #3758096384	@ 0xe0000000
20022410:	015b      	lsls	r3, r3, #5
20022412:	b2db      	uxtb	r3, r3
20022414:	f502 4261 	add.w	r2, r2, #57600	@ 0xe100
20022418:	4620      	mov	r0, r4
2002241a:	f882 3300 	strb.w	r3, [r2, #768]	@ 0x300
2002241e:	f7ff ff03 	bl	20022228 <HAL_NVIC_EnableIRQ>
20022422:	2000      	movs	r0, #0
20022424:	e7d9      	b.n	200223da <DMA_AllocChannel+0x5a>
20022426:	3201      	adds	r2, #1
20022428:	2a08      	cmp	r2, #8
2002242a:	f103 0308 	add.w	r3, r3, #8
2002242e:	d1d6      	bne.n	200223de <DMA_AllocChannel+0x5e>
20022430:	e7d0      	b.n	200223d4 <DMA_AllocChannel+0x54>
20022432:	4434      	add	r4, r6
20022434:	712a      	strb	r2, [r5, #4]
20022436:	b264      	sxtb	r4, r4
20022438:	e7de      	b.n	200223f8 <DMA_AllocChannel+0x78>
2002243a:	bf00      	nop
2002243c:	aff7eff8 	.word	0xaff7eff8
20022440:	bfffeff8 	.word	0xbfffeff8
20022444:	2004cb84 	.word	0x2004cb84
20022448:	2004cb44 	.word	0x2004cb44
2002244c:	50081008 	.word	0x50081008
20022450:	40001008 	.word	0x40001008

20022454 <DMA_FreeChannel.isra.0>:
20022454:	b538      	push	{r3, r4, r5, lr}
20022456:	4a13      	ldr	r2, [pc, #76]	@ (200224a4 <DMA_FreeChannel.isra.0+0x50>)
20022458:	6c83      	ldr	r3, [r0, #72]	@ 0x48
2002245a:	4293      	cmp	r3, r2
2002245c:	d003      	beq.n	20022466 <DMA_FreeChannel.isra.0+0x12>
2002245e:	4a12      	ldr	r2, [pc, #72]	@ (200224a8 <DMA_FreeChannel.isra.0+0x54>)
20022460:	4293      	cmp	r3, r2
20022462:	d008      	beq.n	20022476 <DMA_FreeChannel.isra.0+0x22>
20022464:	e7fe      	b.n	20022464 <DMA_FreeChannel.isra.0+0x10>
20022466:	2132      	movs	r1, #50	@ 0x32
20022468:	4a10      	ldr	r2, [pc, #64]	@ (200224ac <DMA_FreeChannel.isra.0+0x58>)
2002246a:	6cc4      	ldr	r4, [r0, #76]	@ 0x4c
2002246c:	2c1f      	cmp	r4, #31
2002246e:	ea4f 0394 	mov.w	r3, r4, lsr #2
20022472:	d903      	bls.n	2002247c <DMA_FreeChannel.isra.0+0x28>
20022474:	e7fe      	b.n	20022474 <DMA_FreeChannel.isra.0+0x20>
20022476:	2102      	movs	r1, #2
20022478:	4a0d      	ldr	r2, [pc, #52]	@ (200224b0 <DMA_FreeChannel.isra.0+0x5c>)
2002247a:	e7f6      	b.n	2002246a <DMA_FreeChannel.isra.0+0x16>
2002247c:	f3ef 8410 	mrs	r4, PRIMASK
20022480:	2501      	movs	r5, #1
20022482:	f385 8810 	msr	PRIMASK, r5
20022486:	eb02 05c3 	add.w	r5, r2, r3, lsl #3
2002248a:	f852 2033 	ldr.w	r2, [r2, r3, lsl #3]
2002248e:	4290      	cmp	r0, r2
20022490:	d105      	bne.n	2002249e <DMA_FreeChannel.isra.0+0x4a>
20022492:	1858      	adds	r0, r3, r1
20022494:	b240      	sxtb	r0, r0
20022496:	f7ff fed5 	bl	20022244 <HAL_NVIC_DisableIRQ>
2002249a:	2300      	movs	r3, #0
2002249c:	712b      	strb	r3, [r5, #4]
2002249e:	f384 8810 	msr	PRIMASK, r4
200224a2:	bd38      	pop	{r3, r4, r5, pc}
200224a4:	50081000 	.word	0x50081000
200224a8:	40001000 	.word	0x40001000
200224ac:	2004cb84 	.word	0x2004cb84
200224b0:	2004cb44 	.word	0x2004cb44

200224b4 <HAL_DMA_Init>:
200224b4:	b538      	push	{r3, r4, r5, lr}
200224b6:	4604      	mov	r4, r0
200224b8:	2800      	cmp	r0, #0
200224ba:	d053      	beq.n	20022564 <HAL_DMA_Init+0xb0>
200224bc:	6883      	ldr	r3, [r0, #8]
200224be:	f033 0210 	bics.w	r2, r3, #16
200224c2:	d003      	beq.n	200224cc <HAL_DMA_Init+0x18>
200224c4:	f5b3 4f80 	cmp.w	r3, #16384	@ 0x4000
200224c8:	d000      	beq.n	200224cc <HAL_DMA_Init+0x18>
200224ca:	e7fe      	b.n	200224ca <HAL_DMA_Init+0x16>
200224cc:	68e3      	ldr	r3, [r4, #12]
200224ce:	f033 0340 	bics.w	r3, r3, #64	@ 0x40
200224d2:	d000      	beq.n	200224d6 <HAL_DMA_Init+0x22>
200224d4:	e7fe      	b.n	200224d4 <HAL_DMA_Init+0x20>
200224d6:	6923      	ldr	r3, [r4, #16]
200224d8:	f033 0380 	bics.w	r3, r3, #128	@ 0x80
200224dc:	d000      	beq.n	200224e0 <HAL_DMA_Init+0x2c>
200224de:	e7fe      	b.n	200224de <HAL_DMA_Init+0x2a>
200224e0:	6963      	ldr	r3, [r4, #20]
200224e2:	f433 7280 	bics.w	r2, r3, #256	@ 0x100
200224e6:	d003      	beq.n	200224f0 <HAL_DMA_Init+0x3c>
200224e8:	f5b3 7f00 	cmp.w	r3, #512	@ 0x200
200224ec:	d000      	beq.n	200224f0 <HAL_DMA_Init+0x3c>
200224ee:	e7fe      	b.n	200224ee <HAL_DMA_Init+0x3a>
200224f0:	69a3      	ldr	r3, [r4, #24]
200224f2:	f433 6280 	bics.w	r2, r3, #1024	@ 0x400
200224f6:	d003      	beq.n	20022500 <HAL_DMA_Init+0x4c>
200224f8:	f5b3 6f00 	cmp.w	r3, #2048	@ 0x800
200224fc:	d000      	beq.n	20022500 <HAL_DMA_Init+0x4c>
200224fe:	e7fe      	b.n	200224fe <HAL_DMA_Init+0x4a>
20022500:	69e3      	ldr	r3, [r4, #28]
20022502:	f033 0320 	bics.w	r3, r3, #32
20022506:	d000      	beq.n	2002250a <HAL_DMA_Init+0x56>
20022508:	e7fe      	b.n	20022508 <HAL_DMA_Init+0x54>
2002250a:	6a23      	ldr	r3, [r4, #32]
2002250c:	f433 5340 	bics.w	r3, r3, #12288	@ 0x3000
20022510:	d000      	beq.n	20022514 <HAL_DMA_Init+0x60>
20022512:	e7fe      	b.n	20022512 <HAL_DMA_Init+0x5e>
20022514:	6863      	ldr	r3, [r4, #4]
20022516:	2b3f      	cmp	r3, #63	@ 0x3f
20022518:	d900      	bls.n	2002251c <HAL_DMA_Init+0x68>
2002251a:	e7fe      	b.n	2002251a <HAL_DMA_Init+0x66>
2002251c:	6822      	ldr	r2, [r4, #0]
2002251e:	4b13      	ldr	r3, [pc, #76]	@ (2002256c <HAL_DMA_Init+0xb8>)
20022520:	4413      	add	r3, r2
20022522:	2b8c      	cmp	r3, #140	@ 0x8c
20022524:	d813      	bhi.n	2002254e <HAL_DMA_Init+0x9a>
20022526:	2214      	movs	r2, #20
20022528:	fbb3 f3f2 	udiv	r3, r3, r2
2002252c:	009b      	lsls	r3, r3, #2
2002252e:	64e3      	str	r3, [r4, #76]	@ 0x4c
20022530:	4b0f      	ldr	r3, [pc, #60]	@ (20022570 <HAL_DMA_Init+0xbc>)
20022532:	64a3      	str	r3, [r4, #72]	@ 0x48
20022534:	2100      	movs	r1, #0
20022536:	4620      	mov	r0, r4
20022538:	f7ff ff22 	bl	20022380 <DMA_AllocChannel>
2002253c:	4605      	mov	r5, r0
2002253e:	b998      	cbnz	r0, 20022568 <HAL_DMA_Init+0xb4>
20022540:	4620      	mov	r0, r4
20022542:	f7ff fe93 	bl	2002226c <DMA_Init>
20022546:	f7ff ff85 	bl	20022454 <DMA_FreeChannel.isra.0>
2002254a:	4628      	mov	r0, r5
2002254c:	bd38      	pop	{r3, r4, r5, pc}
2002254e:	4b09      	ldr	r3, [pc, #36]	@ (20022574 <HAL_DMA_Init+0xc0>)
20022550:	4413      	add	r3, r2
20022552:	2b8c      	cmp	r3, #140	@ 0x8c
20022554:	d8ee      	bhi.n	20022534 <HAL_DMA_Init+0x80>
20022556:	2214      	movs	r2, #20
20022558:	fbb3 f3f2 	udiv	r3, r3, r2
2002255c:	009b      	lsls	r3, r3, #2
2002255e:	64e3      	str	r3, [r4, #76]	@ 0x4c
20022560:	4b05      	ldr	r3, [pc, #20]	@ (20022578 <HAL_DMA_Init+0xc4>)
20022562:	e7e6      	b.n	20022532 <HAL_DMA_Init+0x7e>
20022564:	2501      	movs	r5, #1
20022566:	e7f0      	b.n	2002254a <HAL_DMA_Init+0x96>
20022568:	2502      	movs	r5, #2
2002256a:	e7ee      	b.n	2002254a <HAL_DMA_Init+0x96>
2002256c:	aff7eff8 	.word	0xaff7eff8
20022570:	50081000 	.word	0x50081000
20022574:	bfffeff8 	.word	0xbfffeff8
20022578:	40001000 	.word	0x40001000

2002257c <HAL_DMA_DeInit>:
2002257c:	b510      	push	{r4, lr}
2002257e:	4604      	mov	r4, r0
20022580:	2800      	cmp	r0, #0
20022582:	d051      	beq.n	20022628 <HAL_DMA_DeInit+0xac>
20022584:	6802      	ldr	r2, [r0, #0]
20022586:	6813      	ldr	r3, [r2, #0]
20022588:	f023 0301 	bic.w	r3, r3, #1
2002258c:	6013      	str	r3, [r2, #0]
2002258e:	6802      	ldr	r2, [r0, #0]
20022590:	4b26      	ldr	r3, [pc, #152]	@ (2002262c <HAL_DMA_DeInit+0xb0>)
20022592:	4413      	add	r3, r2
20022594:	2b8c      	cmp	r3, #140	@ 0x8c
20022596:	d82f      	bhi.n	200225f8 <HAL_DMA_DeInit+0x7c>
20022598:	2114      	movs	r1, #20
2002259a:	fbb3 f3f1 	udiv	r3, r3, r1
2002259e:	009b      	lsls	r3, r3, #2
200225a0:	64c3      	str	r3, [r0, #76]	@ 0x4c
200225a2:	4b23      	ldr	r3, [pc, #140]	@ (20022630 <HAL_DMA_DeInit+0xb4>)
200225a4:	64a3      	str	r3, [r4, #72]	@ 0x48
200225a6:	2300      	movs	r3, #0
200225a8:	6013      	str	r3, [r2, #0]
200225aa:	e9d4 1312 	ldrd	r1, r3, [r4, #72]	@ 0x48
200225ae:	f003 021c 	and.w	r2, r3, #28
200225b2:	2301      	movs	r3, #1
200225b4:	4093      	lsls	r3, r2
200225b6:	604b      	str	r3, [r1, #4]
200225b8:	6ce3      	ldr	r3, [r4, #76]	@ 0x4c
200225ba:	6ca1      	ldr	r1, [r4, #72]	@ 0x48
200225bc:	2b0f      	cmp	r3, #15
200225be:	ea4f 0293 	mov.w	r2, r3, lsr #2
200225c2:	d824      	bhi.n	2002260e <HAL_DMA_DeInit+0x92>
200225c4:	203f      	movs	r0, #63	@ 0x3f
200225c6:	005b      	lsls	r3, r3, #1
200225c8:	f8d1 20a8 	ldr.w	r2, [r1, #168]	@ 0xa8
200225cc:	f003 0338 	and.w	r3, r3, #56	@ 0x38
200225d0:	fa00 f303 	lsl.w	r3, r0, r3
200225d4:	ea22 0303 	bic.w	r3, r2, r3
200225d8:	f8c1 30a8 	str.w	r3, [r1, #168]	@ 0xa8
200225dc:	4620      	mov	r0, r4
200225de:	f7ff ff39 	bl	20022454 <DMA_FreeChannel.isra.0>
200225e2:	2000      	movs	r0, #0
200225e4:	e9c4 000d 	strd	r0, r0, [r4, #52]	@ 0x34
200225e8:	e9c4 000f 	strd	r0, r0, [r4, #60]	@ 0x3c
200225ec:	6460      	str	r0, [r4, #68]	@ 0x44
200225ee:	f884 002c 	strb.w	r0, [r4, #44]	@ 0x2c
200225f2:	f884 002d 	strb.w	r0, [r4, #45]	@ 0x2d
200225f6:	bd10      	pop	{r4, pc}
200225f8:	4b0e      	ldr	r3, [pc, #56]	@ (20022634 <HAL_DMA_DeInit+0xb8>)
200225fa:	4413      	add	r3, r2
200225fc:	2b8c      	cmp	r3, #140	@ 0x8c
200225fe:	d8d2      	bhi.n	200225a6 <HAL_DMA_DeInit+0x2a>
20022600:	2114      	movs	r1, #20
20022602:	fbb3 f3f1 	udiv	r3, r3, r1
20022606:	009b      	lsls	r3, r3, #2
20022608:	64c3      	str	r3, [r0, #76]	@ 0x4c
2002260a:	4b0b      	ldr	r3, [pc, #44]	@ (20022638 <HAL_DMA_DeInit+0xbc>)
2002260c:	e7ca      	b.n	200225a4 <HAL_DMA_DeInit+0x28>
2002260e:	f002 0303 	and.w	r3, r2, #3
20022612:	223f      	movs	r2, #63	@ 0x3f
20022614:	f8d1 00ac 	ldr.w	r0, [r1, #172]	@ 0xac
20022618:	00db      	lsls	r3, r3, #3
2002261a:	fa02 f303 	lsl.w	r3, r2, r3
2002261e:	ea20 0303 	bic.w	r3, r0, r3
20022622:	f8c1 30ac 	str.w	r3, [r1, #172]	@ 0xac
20022626:	e7d9      	b.n	200225dc <HAL_DMA_DeInit+0x60>
20022628:	2001      	movs	r0, #1
2002262a:	e7e4      	b.n	200225f6 <HAL_DMA_DeInit+0x7a>
2002262c:	aff7eff8 	.word	0xaff7eff8
20022630:	50081000 	.word	0x50081000
20022634:	bfffeff8 	.word	0xbfffeff8
20022638:	40001000 	.word	0x40001000

2002263c <HAL_DMA_PollForTransfer>:
2002263c:	e92d 4ff8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
20022640:	f890 302d 	ldrb.w	r3, [r0, #45]	@ 0x2d
20022644:	4617      	mov	r7, r2
20022646:	2b02      	cmp	r3, #2
20022648:	4604      	mov	r4, r0
2002264a:	4688      	mov	r8, r1
2002264c:	b2da      	uxtb	r2, r3
2002264e:	d005      	beq.n	2002265c <HAL_DMA_PollForTransfer+0x20>
20022650:	2304      	movs	r3, #4
20022652:	6443      	str	r3, [r0, #68]	@ 0x44
20022654:	2300      	movs	r3, #0
20022656:	f884 302c 	strb.w	r3, [r4, #44]	@ 0x2c
2002265a:	e006      	b.n	2002266a <HAL_DMA_PollForTransfer+0x2e>
2002265c:	6803      	ldr	r3, [r0, #0]
2002265e:	681b      	ldr	r3, [r3, #0]
20022660:	0699      	lsls	r1, r3, #26
20022662:	d505      	bpl.n	20022670 <HAL_DMA_PollForTransfer+0x34>
20022664:	f44f 7380 	mov.w	r3, #256	@ 0x100
20022668:	6443      	str	r3, [r0, #68]	@ 0x44
2002266a:	2001      	movs	r0, #1
2002266c:	e8bd 8ff8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
20022670:	6cc5      	ldr	r5, [r0, #76]	@ 0x4c
20022672:	f005 051c 	and.w	r5, r5, #28
20022676:	f1b8 0f00 	cmp.w	r8, #0
2002267a:	d123      	bne.n	200226c4 <HAL_DMA_PollForTransfer+0x88>
2002267c:	fa02 f505 	lsl.w	r5, r2, r5
20022680:	f7ff fc0c 	bl	20021e9c <HAL_GetTick>
20022684:	f04f 0a08 	mov.w	sl, #8
20022688:	4681      	mov	r9, r0
2002268a:	e9d4 6312 	ldrd	r6, r3, [r4, #72]	@ 0x48
2002268e:	f003 031c 	and.w	r3, r3, #28
20022692:	fa0a f103 	lsl.w	r1, sl, r3
20022696:	6832      	ldr	r2, [r6, #0]
20022698:	ea12 0b05 	ands.w	fp, r2, r5
2002269c:	d016      	beq.n	200226cc <HAL_DMA_PollForTransfer+0x90>
2002269e:	f1b8 0f00 	cmp.w	r8, #0
200226a2:	d136      	bne.n	20022712 <HAL_DMA_PollForTransfer+0xd6>
200226a4:	2202      	movs	r2, #2
200226a6:	fa02 f303 	lsl.w	r3, r2, r3
200226aa:	6073      	str	r3, [r6, #4]
200226ac:	6d23      	ldr	r3, [r4, #80]	@ 0x50
200226ae:	b92b      	cbnz	r3, 200226bc <HAL_DMA_PollForTransfer+0x80>
200226b0:	4620      	mov	r0, r4
200226b2:	f7ff fecf 	bl	20022454 <DMA_FreeChannel.isra.0>
200226b6:	2301      	movs	r3, #1
200226b8:	f884 302d 	strb.w	r3, [r4, #45]	@ 0x2d
200226bc:	2000      	movs	r0, #0
200226be:	f884 002c 	strb.w	r0, [r4, #44]	@ 0x2c
200226c2:	e7d3      	b.n	2002266c <HAL_DMA_PollForTransfer+0x30>
200226c4:	2304      	movs	r3, #4
200226c6:	fa03 f505 	lsl.w	r5, r3, r5
200226ca:	e7d9      	b.n	20022680 <HAL_DMA_PollForTransfer+0x44>
200226cc:	6832      	ldr	r2, [r6, #0]
200226ce:	4211      	tst	r1, r2
200226d0:	d00c      	beq.n	200226ec <HAL_DMA_PollForTransfer+0xb0>
200226d2:	2501      	movs	r5, #1
200226d4:	fa05 f303 	lsl.w	r3, r5, r3
200226d8:	6073      	str	r3, [r6, #4]
200226da:	4620      	mov	r0, r4
200226dc:	6465      	str	r5, [r4, #68]	@ 0x44
200226de:	f7ff feb9 	bl	20022454 <DMA_FreeChannel.isra.0>
200226e2:	f884 502d 	strb.w	r5, [r4, #45]	@ 0x2d
200226e6:	f884 b02c 	strb.w	fp, [r4, #44]	@ 0x2c
200226ea:	e7be      	b.n	2002266a <HAL_DMA_PollForTransfer+0x2e>
200226ec:	1c7a      	adds	r2, r7, #1
200226ee:	d0d2      	beq.n	20022696 <HAL_DMA_PollForTransfer+0x5a>
200226f0:	f7ff fbd4 	bl	20021e9c <HAL_GetTick>
200226f4:	eba0 0009 	sub.w	r0, r0, r9
200226f8:	42b8      	cmp	r0, r7
200226fa:	d801      	bhi.n	20022700 <HAL_DMA_PollForTransfer+0xc4>
200226fc:	2f00      	cmp	r7, #0
200226fe:	d1c4      	bne.n	2002268a <HAL_DMA_PollForTransfer+0x4e>
20022700:	2320      	movs	r3, #32
20022702:	4620      	mov	r0, r4
20022704:	6463      	str	r3, [r4, #68]	@ 0x44
20022706:	f7ff fea5 	bl	20022454 <DMA_FreeChannel.isra.0>
2002270a:	2301      	movs	r3, #1
2002270c:	f884 302d 	strb.w	r3, [r4, #45]	@ 0x2d
20022710:	e7a0      	b.n	20022654 <HAL_DMA_PollForTransfer+0x18>
20022712:	2204      	movs	r2, #4
20022714:	fa02 f303 	lsl.w	r3, r2, r3
20022718:	6073      	str	r3, [r6, #4]
2002271a:	e7cf      	b.n	200226bc <HAL_DMA_PollForTransfer+0x80>

2002271c <DMA_Remap>:
2002271c:	b530      	push	{r4, r5, lr}
2002271e:	4b15      	ldr	r3, [pc, #84]	@ (20022774 <DMA_Remap+0x58>)
20022720:	6c84      	ldr	r4, [r0, #72]	@ 0x48
20022722:	429c      	cmp	r4, r3
20022724:	d11b      	bne.n	2002275e <DMA_Remap+0x42>
20022726:	6883      	ldr	r3, [r0, #8]
20022728:	2b10      	cmp	r3, #16
2002272a:	d002      	beq.n	20022732 <DMA_Remap+0x16>
2002272c:	f5b3 4f80 	cmp.w	r3, #16384	@ 0x4000
20022730:	d108      	bne.n	20022744 <DMA_Remap+0x28>
20022732:	680b      	ldr	r3, [r1, #0]
20022734:	4c10      	ldr	r4, [pc, #64]	@ (20022778 <DMA_Remap+0x5c>)
20022736:	f103 4560 	add.w	r5, r3, #3758096384	@ 0xe0000000
2002273a:	42a5      	cmp	r5, r4
2002273c:	bf98      	it	ls
2002273e:	f103 6320 	addls.w	r3, r3, #167772160	@ 0xa000000
20022742:	600b      	str	r3, [r1, #0]
20022744:	6883      	ldr	r3, [r0, #8]
20022746:	f433 4380 	bics.w	r3, r3, #16384	@ 0x4000
2002274a:	d108      	bne.n	2002275e <DMA_Remap+0x42>
2002274c:	6813      	ldr	r3, [r2, #0]
2002274e:	480a      	ldr	r0, [pc, #40]	@ (20022778 <DMA_Remap+0x5c>)
20022750:	f103 4460 	add.w	r4, r3, #3758096384	@ 0xe0000000
20022754:	4284      	cmp	r4, r0
20022756:	bf98      	it	ls
20022758:	f103 6320 	addls.w	r3, r3, #167772160	@ 0xa000000
2002275c:	6013      	str	r3, [r2, #0]
2002275e:	680b      	ldr	r3, [r1, #0]
20022760:	f103 4270 	add.w	r2, r3, #4026531840	@ 0xf0000000
20022764:	f1b2 5f80 	cmp.w	r2, #268435456	@ 0x10000000
20022768:	bf3c      	itt	cc
2002276a:	f103 43a0 	addcc.w	r3, r3, #1342177280	@ 0x50000000
2002276e:	600b      	strcc	r3, [r1, #0]
20022770:	bd30      	pop	{r4, r5, pc}
20022772:	bf00      	nop
20022774:	40001000 	.word	0x40001000
20022778:	0007fffe 	.word	0x0007fffe

2002277c <DMA_Start>:
2002277c:	e92d 41f3 	stmdb	sp!, {r0, r1, r4, r5, r6, r7, r8, lr}
20022780:	f64f 75ff 	movw	r5, #65535	@ 0xffff
20022784:	6d03      	ldr	r3, [r0, #80]	@ 0x50
20022786:	6802      	ldr	r2, [r0, #0]
20022788:	429d      	cmp	r5, r3
2002278a:	bf28      	it	cs
2002278c:	461d      	movcs	r5, r3
2002278e:	1b5b      	subs	r3, r3, r5
20022790:	6503      	str	r3, [r0, #80]	@ 0x50
20022792:	6585      	str	r5, [r0, #88]	@ 0x58
20022794:	6813      	ldr	r3, [r2, #0]
20022796:	f890 7066 	ldrb.w	r7, [r0, #102]	@ 0x66
2002279a:	f023 0301 	bic.w	r3, r3, #1
2002279e:	f890 8067 	ldrb.w	r8, [r0, #103]	@ 0x67
200227a2:	6013      	str	r3, [r2, #0]
200227a4:	e9d0 2317 	ldrd	r2, r3, [r0, #92]	@ 0x5c
200227a8:	460e      	mov	r6, r1
200227aa:	e9cd 2300 	strd	r2, r3, [sp]
200227ae:	e9d0 2312 	ldrd	r2, r3, [r0, #72]	@ 0x48
200227b2:	f003 011c 	and.w	r1, r3, #28
200227b6:	2301      	movs	r3, #1
200227b8:	4604      	mov	r4, r0
200227ba:	408b      	lsls	r3, r1
200227bc:	6053      	str	r3, [r2, #4]
200227be:	6803      	ldr	r3, [r0, #0]
200227c0:	4669      	mov	r1, sp
200227c2:	605d      	str	r5, [r3, #4]
200227c4:	aa01      	add	r2, sp, #4
200227c6:	f7ff ffa9 	bl	2002271c <DMA_Remap>
200227ca:	e9dd 0300 	ldrd	r0, r3, [sp]
200227ce:	68a1      	ldr	r1, [r4, #8]
200227d0:	6822      	ldr	r2, [r4, #0]
200227d2:	2910      	cmp	r1, #16
200227d4:	bf0b      	itete	eq
200227d6:	6093      	streq	r3, [r2, #8]
200227d8:	6090      	strne	r0, [r2, #8]
200227da:	6823      	ldreq	r3, [r4, #0]
200227dc:	6822      	ldrne	r2, [r4, #0]
200227de:	bf0c      	ite	eq
200227e0:	60d8      	streq	r0, [r3, #12]
200227e2:	60d3      	strne	r3, [r2, #12]
200227e4:	f894 3064 	ldrb.w	r3, [r4, #100]	@ 0x64
200227e8:	b123      	cbz	r3, 200227f4 <DMA_Start+0x78>
200227ea:	6de3      	ldr	r3, [r4, #92]	@ 0x5c
200227ec:	fa05 f707 	lsl.w	r7, r5, r7
200227f0:	443b      	add	r3, r7
200227f2:	65e3      	str	r3, [r4, #92]	@ 0x5c
200227f4:	f894 3065 	ldrb.w	r3, [r4, #101]	@ 0x65
200227f8:	b123      	cbz	r3, 20022804 <DMA_Start+0x88>
200227fa:	6e23      	ldr	r3, [r4, #96]	@ 0x60
200227fc:	fa05 f508 	lsl.w	r5, r5, r8
20022800:	442b      	add	r3, r5
20022802:	6623      	str	r3, [r4, #96]	@ 0x60
20022804:	b136      	cbz	r6, 20022814 <DMA_Start+0x98>
20022806:	6ba2      	ldr	r2, [r4, #56]	@ 0x38
20022808:	6823      	ldr	r3, [r4, #0]
2002280a:	b15a      	cbz	r2, 20022824 <DMA_Start+0xa8>
2002280c:	681a      	ldr	r2, [r3, #0]
2002280e:	f042 020e 	orr.w	r2, r2, #14
20022812:	601a      	str	r2, [r3, #0]
20022814:	6822      	ldr	r2, [r4, #0]
20022816:	6813      	ldr	r3, [r2, #0]
20022818:	f043 0301 	orr.w	r3, r3, #1
2002281c:	6013      	str	r3, [r2, #0]
2002281e:	b002      	add	sp, #8
20022820:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
20022824:	681a      	ldr	r2, [r3, #0]
20022826:	f022 0204 	bic.w	r2, r2, #4
2002282a:	601a      	str	r2, [r3, #0]
2002282c:	6822      	ldr	r2, [r4, #0]
2002282e:	6813      	ldr	r3, [r2, #0]
20022830:	f043 030a 	orr.w	r3, r3, #10
20022834:	6013      	str	r3, [r2, #0]
20022836:	e7ed      	b.n	20022814 <DMA_Start+0x98>

20022838 <HAL_DMA_Start>:
20022838:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
2002283a:	461d      	mov	r5, r3
2002283c:	69c3      	ldr	r3, [r0, #28]
2002283e:	4604      	mov	r4, r0
20022840:	2b20      	cmp	r3, #32
20022842:	460f      	mov	r7, r1
20022844:	4616      	mov	r6, r2
20022846:	d105      	bne.n	20022854 <HAL_DMA_Start+0x1c>
20022848:	f64f 73fe 	movw	r3, #65534	@ 0xfffe
2002284c:	1e6a      	subs	r2, r5, #1
2002284e:	429a      	cmp	r2, r3
20022850:	d900      	bls.n	20022854 <HAL_DMA_Start+0x1c>
20022852:	e7fe      	b.n	20022852 <HAL_DMA_Start+0x1a>
20022854:	f894 302c 	ldrb.w	r3, [r4, #44]	@ 0x2c
20022858:	2b01      	cmp	r3, #1
2002285a:	d00e      	beq.n	2002287a <HAL_DMA_Start+0x42>
2002285c:	2301      	movs	r3, #1
2002285e:	f884 302c 	strb.w	r3, [r4, #44]	@ 0x2c
20022862:	f894 302d 	ldrb.w	r3, [r4, #45]	@ 0x2d
20022866:	2b01      	cmp	r3, #1
20022868:	b2d9      	uxtb	r1, r3
2002286a:	d103      	bne.n	20022874 <HAL_DMA_Start+0x3c>
2002286c:	4620      	mov	r0, r4
2002286e:	f7ff fd87 	bl	20022380 <DMA_AllocChannel>
20022872:	b120      	cbz	r0, 2002287e <HAL_DMA_Start+0x46>
20022874:	2300      	movs	r3, #0
20022876:	f884 302c 	strb.w	r3, [r4, #44]	@ 0x2c
2002287a:	2002      	movs	r0, #2
2002287c:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
2002287e:	2302      	movs	r3, #2
20022880:	e9c4 5514 	strd	r5, r5, [r4, #80]	@ 0x50
20022884:	e9c4 7617 	strd	r7, r6, [r4, #92]	@ 0x5c
20022888:	f884 302d 	strb.w	r3, [r4, #45]	@ 0x2d
2002288c:	6460      	str	r0, [r4, #68]	@ 0x44
2002288e:	6d20      	ldr	r0, [r4, #80]	@ 0x50
20022890:	2800      	cmp	r0, #0
20022892:	d0f3      	beq.n	2002287c <HAL_DMA_Start+0x44>
20022894:	2100      	movs	r1, #0
20022896:	4620      	mov	r0, r4
20022898:	f7ff ff70 	bl	2002277c <DMA_Start>
2002289c:	6d23      	ldr	r3, [r4, #80]	@ 0x50
2002289e:	2b00      	cmp	r3, #0
200228a0:	d0f5      	beq.n	2002288e <HAL_DMA_Start+0x56>
200228a2:	f44f 727a 	mov.w	r2, #1000	@ 0x3e8
200228a6:	2100      	movs	r1, #0
200228a8:	4620      	mov	r0, r4
200228aa:	f7ff fec7 	bl	2002263c <HAL_DMA_PollForTransfer>
200228ae:	2800      	cmp	r0, #0
200228b0:	d0ed      	beq.n	2002288e <HAL_DMA_Start+0x56>
200228b2:	e7e3      	b.n	2002287c <HAL_DMA_Start+0x44>

200228b4 <HAL_EFUSE_Read>:
200228b4:	2a20      	cmp	r2, #32
200228b6:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
200228ba:	4606      	mov	r6, r0
200228bc:	460c      	mov	r4, r1
200228be:	4615      	mov	r5, r2
200228c0:	dc30      	bgt.n	20022924 <HAL_EFUSE_Read+0x70>
200228c2:	f3c0 08c4 	ubfx	r8, r0, #3, #5
200228c6:	eb08 0302 	add.w	r3, r8, r2
200228ca:	2b20      	cmp	r3, #32
200228cc:	dc2a      	bgt.n	20022924 <HAL_EFUSE_Read+0x70>
200228ce:	0797      	lsls	r7, r2, #30
200228d0:	d128      	bne.n	20022924 <HAL_EFUSE_Read+0x70>
200228d2:	f010 091f 	ands.w	r9, r0, #31
200228d6:	d125      	bne.n	20022924 <HAL_EFUSE_Read+0x70>
200228d8:	4a25      	ldr	r2, [pc, #148]	@ (20022970 <HAL_EFUSE_Read+0xbc>)
200228da:	2014      	movs	r0, #20
200228dc:	f8d2 7094 	ldr.w	r7, [r2, #148]	@ 0x94
200228e0:	0a36      	lsrs	r6, r6, #8
200228e2:	1cfb      	adds	r3, r7, #3
200228e4:	2b0e      	cmp	r3, #14
200228e6:	bf38      	it	cc
200228e8:	230e      	movcc	r3, #14
200228ea:	2b0f      	cmp	r3, #15
200228ec:	bf28      	it	cs
200228ee:	230f      	movcs	r3, #15
200228f0:	f8c2 3094 	str.w	r3, [r2, #148]	@ 0x94
200228f4:	f7ff fb37 	bl	20021f66 <HAL_Delay_us>
200228f8:	4a1e      	ldr	r2, [pc, #120]	@ (20022974 <HAL_EFUSE_Read+0xc0>)
200228fa:	00b3      	lsls	r3, r6, #2
200228fc:	6013      	str	r3, [r2, #0]
200228fe:	6813      	ldr	r3, [r2, #0]
20022900:	491d      	ldr	r1, [pc, #116]	@ (20022978 <HAL_EFUSE_Read+0xc4>)
20022902:	f043 0301 	orr.w	r3, r3, #1
20022906:	6013      	str	r3, [r2, #0]
20022908:	464b      	mov	r3, r9
2002290a:	4369      	muls	r1, r5
2002290c:	6890      	ldr	r0, [r2, #8]
2002290e:	07c0      	lsls	r0, r0, #31
20022910:	d50c      	bpl.n	2002292c <HAL_EFUSE_Read+0x78>
20022912:	6890      	ldr	r0, [r2, #8]
20022914:	428b      	cmp	r3, r1
20022916:	f040 0001 	orr.w	r0, r0, #1
2002291a:	6090      	str	r0, [r2, #8]
2002291c:	d30a      	bcc.n	20022934 <HAL_EFUSE_Read+0x80>
2002291e:	4b14      	ldr	r3, [pc, #80]	@ (20022970 <HAL_EFUSE_Read+0xbc>)
20022920:	f8c3 7094 	str.w	r7, [r3, #148]	@ 0x94
20022924:	2500      	movs	r5, #0
20022926:	4628      	mov	r0, r5
20022928:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
2002292c:	428b      	cmp	r3, r1
2002292e:	d2f0      	bcs.n	20022912 <HAL_EFUSE_Read+0x5e>
20022930:	3301      	adds	r3, #1
20022932:	e7eb      	b.n	2002290c <HAL_EFUSE_Read+0x58>
20022934:	4a11      	ldr	r2, [pc, #68]	@ (2002297c <HAL_EFUSE_Read+0xc8>)
20022936:	f008 001c 	and.w	r0, r8, #28
2002293a:	eb00 1046 	add.w	r0, r0, r6, lsl #5
2002293e:	f025 0103 	bic.w	r1, r5, #3
20022942:	4402      	add	r2, r0
20022944:	4421      	add	r1, r4
20022946:	428c      	cmp	r4, r1
20022948:	d103      	bne.n	20022952 <HAL_EFUSE_Read+0x9e>
2002294a:	4b09      	ldr	r3, [pc, #36]	@ (20022970 <HAL_EFUSE_Read+0xbc>)
2002294c:	f8c3 7094 	str.w	r7, [r3, #148]	@ 0x94
20022950:	e7e9      	b.n	20022926 <HAL_EFUSE_Read+0x72>
20022952:	f852 3b04 	ldr.w	r3, [r2], #4
20022956:	3404      	adds	r4, #4
20022958:	0a18      	lsrs	r0, r3, #8
2002295a:	f804 3c04 	strb.w	r3, [r4, #-4]
2002295e:	f804 0c03 	strb.w	r0, [r4, #-3]
20022962:	0c18      	lsrs	r0, r3, #16
20022964:	0e1b      	lsrs	r3, r3, #24
20022966:	f804 0c02 	strb.w	r0, [r4, #-2]
2002296a:	f804 3c01 	strb.w	r3, [r4, #-1]
2002296e:	e7ea      	b.n	20022946 <HAL_EFUSE_Read+0x92>
20022970:	500ca000 	.word	0x500ca000
20022974:	5000c000 	.word	0x5000c000
20022978:	0005dc00 	.word	0x0005dc00
2002297c:	5000c030 	.word	0x5000c030

20022980 <HAL_DBG_printf>:
20022980:	b40f      	push	{r0, r1, r2, r3}
20022982:	b004      	add	sp, #16
20022984:	4770      	bx	lr
	...

20022988 <HAL_HPAON_WakeCore>:
20022988:	2802      	cmp	r0, #2
2002298a:	b510      	push	{r4, lr}
2002298c:	d120      	bne.n	200229d0 <HAL_HPAON_WakeCore+0x48>
2002298e:	4c11      	ldr	r4, [pc, #68]	@ (200229d4 <HAL_HPAON_WakeCore+0x4c>)
20022990:	20e6      	movs	r0, #230	@ 0xe6
20022992:	6ae3      	ldr	r3, [r4, #44]	@ 0x2c
20022994:	f043 0301 	orr.w	r3, r3, #1
20022998:	62e3      	str	r3, [r4, #44]	@ 0x2c
2002299a:	f7ff fae4 	bl	20021f66 <HAL_Delay_us>
2002299e:	6ae3      	ldr	r3, [r4, #44]	@ 0x2c
200229a0:	069a      	lsls	r2, r3, #26
200229a2:	d5fc      	bpl.n	2002299e <HAL_HPAON_WakeCore+0x16>
200229a4:	201e      	movs	r0, #30
200229a6:	f7ff fade 	bl	20021f66 <HAL_Delay_us>
200229aa:	6ae3      	ldr	r3, [r4, #44]	@ 0x2c
200229ac:	069b      	lsls	r3, r3, #26
200229ae:	d5fc      	bpl.n	200229aa <HAL_HPAON_WakeCore+0x22>
200229b0:	f3ef 8110 	mrs	r1, PRIMASK
200229b4:	2301      	movs	r3, #1
200229b6:	f383 8810 	msr	PRIMASK, r3
200229ba:	4a07      	ldr	r2, [pc, #28]	@ (200229d8 <HAL_HPAON_WakeCore+0x50>)
200229bc:	7813      	ldrb	r3, [r2, #0]
200229be:	2b13      	cmp	r3, #19
200229c0:	d900      	bls.n	200229c4 <HAL_HPAON_WakeCore+0x3c>
200229c2:	e7fe      	b.n	200229c2 <HAL_HPAON_WakeCore+0x3a>
200229c4:	3301      	adds	r3, #1
200229c6:	7013      	strb	r3, [r2, #0]
200229c8:	f381 8810 	msr	PRIMASK, r1
200229cc:	2000      	movs	r0, #0
200229ce:	bd10      	pop	{r4, pc}
200229d0:	2001      	movs	r0, #1
200229d2:	e7fc      	b.n	200229ce <HAL_HPAON_WakeCore+0x46>
200229d4:	500c0000 	.word	0x500c0000
200229d8:	2004cbc4 	.word	0x2004cbc4

200229dc <HAL_HPAON_EnableXT48>:
200229dc:	4b04      	ldr	r3, [pc, #16]	@ (200229f0 <HAL_HPAON_EnableXT48+0x14>)
200229de:	691a      	ldr	r2, [r3, #16]
200229e0:	f042 0202 	orr.w	r2, r2, #2
200229e4:	611a      	str	r2, [r3, #16]
200229e6:	691a      	ldr	r2, [r3, #16]
200229e8:	2a00      	cmp	r2, #0
200229ea:	dafc      	bge.n	200229e6 <HAL_HPAON_EnableXT48+0xa>
200229ec:	4770      	bx	lr
200229ee:	bf00      	nop
200229f0:	500c0000 	.word	0x500c0000

200229f4 <HAL_HPAON_DisableXT48>:
200229f4:	4a02      	ldr	r2, [pc, #8]	@ (20022a00 <HAL_HPAON_DisableXT48+0xc>)
200229f6:	6913      	ldr	r3, [r2, #16]
200229f8:	f023 0302 	bic.w	r3, r3, #2
200229fc:	6113      	str	r3, [r2, #16]
200229fe:	4770      	bx	lr
20022a00:	500c0000 	.word	0x500c0000

20022a04 <HAL_QSPI_Init>:
20022a04:	b510      	push	{r4, lr}
20022a06:	b1e0      	cbz	r0, 20022a42 <HAL_QSPI_Init+0x3e>
20022a08:	b1d9      	cbz	r1, 20022a42 <HAL_QSPI_Init+0x3e>
20022a0a:	2300      	movs	r3, #0
20022a0c:	2201      	movs	r2, #1
20022a0e:	6043      	str	r3, [r0, #4]
20022a10:	f880 2022 	strb.w	r2, [r0, #34]	@ 0x22
20022a14:	680c      	ldr	r4, [r1, #0]
20022a16:	6004      	str	r4, [r0, #0]
20022a18:	684a      	ldr	r2, [r1, #4]
20022a1a:	f880 2020 	strb.w	r2, [r0, #32]
20022a1e:	688a      	ldr	r2, [r1, #8]
20022a20:	6102      	str	r2, [r0, #16]
20022a22:	68ca      	ldr	r2, [r1, #12]
20022a24:	0512      	lsls	r2, r2, #20
20022a26:	6142      	str	r2, [r0, #20]
20022a28:	22ff      	movs	r2, #255	@ 0xff
20022a2a:	f8c4 2084 	str.w	r2, [r4, #132]	@ 0x84
20022a2e:	f04f 2450 	mov.w	r4, #1342197760	@ 0x50005000
20022a32:	6801      	ldr	r1, [r0, #0]
20022a34:	678c      	str	r4, [r1, #120]	@ 0x78
20022a36:	6801      	ldr	r1, [r0, #0]
20022a38:	620a      	str	r2, [r1, #32]
20022a3a:	6801      	ldr	r1, [r0, #0]
20022a3c:	4618      	mov	r0, r3
20022a3e:	644a      	str	r2, [r1, #68]	@ 0x44
20022a40:	bd10      	pop	{r4, pc}
20022a42:	2001      	movs	r0, #1
20022a44:	e7fc      	b.n	20022a40 <HAL_QSPI_Init+0x3c>

20022a46 <HAL_FLASH_SET_AHB_RCMD>:
20022a46:	b138      	cbz	r0, 20022a58 <HAL_FLASH_SET_AHB_RCMD+0x12>
20022a48:	6802      	ldr	r2, [r0, #0]
20022a4a:	2000      	movs	r0, #0
20022a4c:	6c13      	ldr	r3, [r2, #64]	@ 0x40
20022a4e:	f023 03ff 	bic.w	r3, r3, #255	@ 0xff
20022a52:	4319      	orrs	r1, r3
20022a54:	6411      	str	r1, [r2, #64]	@ 0x40
20022a56:	4770      	bx	lr
20022a58:	2001      	movs	r0, #1
20022a5a:	4770      	bx	lr

20022a5c <HAL_FLASH_CFG_AHB_RCMD>:
20022a5c:	b570      	push	{r4, r5, r6, lr}
20022a5e:	b1c8      	cbz	r0, 20022a94 <HAL_FLASH_CFG_AHB_RCMD+0x38>
20022a60:	6805      	ldr	r5, [r0, #0]
20022a62:	f99d 6018 	ldrsb.w	r6, [sp, #24]
20022a66:	f99d 001c 	ldrsb.w	r0, [sp, #28]
20022a6a:	6cac      	ldr	r4, [r5, #72]	@ 0x48
20022a6c:	ea40 00c6 	orr.w	r0, r0, r6, lsl #3
20022a70:	ea40 23c3 	orr.w	r3, r0, r3, lsl #11
20022a74:	f99d 0010 	ldrsb.w	r0, [sp, #16]
20022a78:	f36f 0414 	bfc	r4, #0, #21
20022a7c:	ea43 2300 	orr.w	r3, r3, r0, lsl #8
20022a80:	f99d 0014 	ldrsb.w	r0, [sp, #20]
20022a84:	ea43 1380 	orr.w	r3, r3, r0, lsl #6
20022a88:	ea43 3242 	orr.w	r2, r3, r2, lsl #13
20022a8c:	ea42 4181 	orr.w	r1, r2, r1, lsl #18
20022a90:	4321      	orrs	r1, r4
20022a92:	64a9      	str	r1, [r5, #72]	@ 0x48
20022a94:	bd70      	pop	{r4, r5, r6, pc}

20022a96 <HAL_FLASH_SET_AHB_WCMD>:
20022a96:	b140      	cbz	r0, 20022aaa <HAL_FLASH_SET_AHB_WCMD+0x14>
20022a98:	6802      	ldr	r2, [r0, #0]
20022a9a:	2000      	movs	r0, #0
20022a9c:	6c13      	ldr	r3, [r2, #64]	@ 0x40
20022a9e:	f423 437f 	bic.w	r3, r3, #65280	@ 0xff00
20022aa2:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
20022aa6:	6411      	str	r1, [r2, #64]	@ 0x40
20022aa8:	4770      	bx	lr
20022aaa:	2001      	movs	r0, #1
20022aac:	4770      	bx	lr

20022aae <HAL_FLASH_CFG_AHB_WCMD>:
20022aae:	b570      	push	{r4, r5, r6, lr}
20022ab0:	b1c8      	cbz	r0, 20022ae6 <HAL_FLASH_CFG_AHB_WCMD+0x38>
20022ab2:	6805      	ldr	r5, [r0, #0]
20022ab4:	f99d 6018 	ldrsb.w	r6, [sp, #24]
20022ab8:	f99d 001c 	ldrsb.w	r0, [sp, #28]
20022abc:	6d2c      	ldr	r4, [r5, #80]	@ 0x50
20022abe:	ea40 00c6 	orr.w	r0, r0, r6, lsl #3
20022ac2:	ea40 23c3 	orr.w	r3, r0, r3, lsl #11
20022ac6:	f99d 0010 	ldrsb.w	r0, [sp, #16]
20022aca:	f36f 0414 	bfc	r4, #0, #21
20022ace:	ea43 2300 	orr.w	r3, r3, r0, lsl #8
20022ad2:	f99d 0014 	ldrsb.w	r0, [sp, #20]
20022ad6:	ea43 1380 	orr.w	r3, r3, r0, lsl #6
20022ada:	ea43 3242 	orr.w	r2, r3, r2, lsl #13
20022ade:	ea42 4181 	orr.w	r1, r2, r1, lsl #18
20022ae2:	4321      	orrs	r1, r4
20022ae4:	6529      	str	r1, [r5, #80]	@ 0x50
20022ae6:	bd70      	pop	{r4, r5, r6, pc}

20022ae8 <HAL_FLASH_WRITE_WORD>:
20022ae8:	b118      	cbz	r0, 20022af2 <HAL_FLASH_WRITE_WORD+0xa>
20022aea:	6803      	ldr	r3, [r0, #0]
20022aec:	2000      	movs	r0, #0
20022aee:	6059      	str	r1, [r3, #4]
20022af0:	4770      	bx	lr
20022af2:	2001      	movs	r0, #1
20022af4:	4770      	bx	lr

20022af6 <HAL_FLASH_WRITE_DLEN>:
20022af6:	b130      	cbz	r0, 20022b06 <HAL_FLASH_WRITE_DLEN+0x10>
20022af8:	6803      	ldr	r3, [r0, #0]
20022afa:	3901      	subs	r1, #1
20022afc:	f3c1 0113 	ubfx	r1, r1, #0, #20
20022b00:	2000      	movs	r0, #0
20022b02:	6259      	str	r1, [r3, #36]	@ 0x24
20022b04:	4770      	bx	lr
20022b06:	2001      	movs	r0, #1
20022b08:	4770      	bx	lr

20022b0a <HAL_FLASH_WRITE_DLEN2>:
20022b0a:	b130      	cbz	r0, 20022b1a <HAL_FLASH_WRITE_DLEN2+0x10>
20022b0c:	6803      	ldr	r3, [r0, #0]
20022b0e:	3901      	subs	r1, #1
20022b10:	f3c1 0113 	ubfx	r1, r1, #0, #20
20022b14:	2000      	movs	r0, #0
20022b16:	6399      	str	r1, [r3, #56]	@ 0x38
20022b18:	4770      	bx	lr
20022b1a:	2001      	movs	r0, #1
20022b1c:	4770      	bx	lr

20022b1e <HAL_FLASH_WRITE_ABYTE>:
20022b1e:	b108      	cbz	r0, 20022b24 <HAL_FLASH_WRITE_ABYTE+0x6>
20022b20:	6803      	ldr	r3, [r0, #0]
20022b22:	6219      	str	r1, [r3, #32]
20022b24:	4770      	bx	lr

20022b26 <HAL_FLASH_IS_CMD_DONE>:
20022b26:	b118      	cbz	r0, 20022b30 <HAL_FLASH_IS_CMD_DONE+0xa>
20022b28:	6803      	ldr	r3, [r0, #0]
20022b2a:	6918      	ldr	r0, [r3, #16]
20022b2c:	f000 0001 	and.w	r0, r0, #1
20022b30:	4770      	bx	lr

20022b32 <HAL_FLASH_CLR_CMD_DONE>:
20022b32:	b120      	cbz	r0, 20022b3e <HAL_FLASH_CLR_CMD_DONE+0xc>
20022b34:	6802      	ldr	r2, [r0, #0]
20022b36:	6953      	ldr	r3, [r2, #20]
20022b38:	f043 0301 	orr.w	r3, r3, #1
20022b3c:	6153      	str	r3, [r2, #20]
20022b3e:	4770      	bx	lr

20022b40 <HAL_FLASH_SET_CMD>:
20022b40:	b538      	push	{r3, r4, r5, lr}
20022b42:	460d      	mov	r5, r1
20022b44:	4604      	mov	r4, r0
20022b46:	b1a8      	cbz	r0, 20022b74 <HAL_FLASH_SET_CMD+0x34>
20022b48:	6803      	ldr	r3, [r0, #0]
20022b4a:	61da      	str	r2, [r3, #28]
20022b4c:	6ac3      	ldr	r3, [r0, #44]	@ 0x2c
20022b4e:	b10b      	cbz	r3, 20022b54 <HAL_FLASH_SET_CMD+0x14>
20022b50:	2001      	movs	r0, #1
20022b52:	4798      	blx	r3
20022b54:	6823      	ldr	r3, [r4, #0]
20022b56:	619d      	str	r5, [r3, #24]
20022b58:	4620      	mov	r0, r4
20022b5a:	f7ff ffe4 	bl	20022b26 <HAL_FLASH_IS_CMD_DONE>
20022b5e:	2800      	cmp	r0, #0
20022b60:	d0fa      	beq.n	20022b58 <HAL_FLASH_SET_CMD+0x18>
20022b62:	4620      	mov	r0, r4
20022b64:	f7ff ffe5 	bl	20022b32 <HAL_FLASH_CLR_CMD_DONE>
20022b68:	6ae3      	ldr	r3, [r4, #44]	@ 0x2c
20022b6a:	b10b      	cbz	r3, 20022b70 <HAL_FLASH_SET_CMD+0x30>
20022b6c:	2000      	movs	r0, #0
20022b6e:	4798      	blx	r3
20022b70:	2000      	movs	r0, #0
20022b72:	bd38      	pop	{r3, r4, r5, pc}
20022b74:	2001      	movs	r0, #1
20022b76:	e7fc      	b.n	20022b72 <HAL_FLASH_SET_CMD+0x32>

20022b78 <HAL_FLASH_CLR_STATUS>:
20022b78:	b118      	cbz	r0, 20022b82 <HAL_FLASH_CLR_STATUS+0xa>
20022b7a:	6802      	ldr	r2, [r0, #0]
20022b7c:	6953      	ldr	r3, [r2, #20]
20022b7e:	4319      	orrs	r1, r3
20022b80:	6151      	str	r1, [r2, #20]
20022b82:	4770      	bx	lr

20022b84 <HAL_FLASH_STATUS_MATCH>:
20022b84:	b118      	cbz	r0, 20022b8e <HAL_FLASH_STATUS_MATCH+0xa>
20022b86:	6803      	ldr	r3, [r0, #0]
20022b88:	6918      	ldr	r0, [r3, #16]
20022b8a:	f3c0 00c0 	ubfx	r0, r0, #3, #1
20022b8e:	4770      	bx	lr

20022b90 <HAL_FLASH_IS_PROG_DONE>:
20022b90:	b128      	cbz	r0, 20022b9e <HAL_FLASH_IS_PROG_DONE+0xe>
20022b92:	6803      	ldr	r3, [r0, #0]
20022b94:	6858      	ldr	r0, [r3, #4]
20022b96:	43c0      	mvns	r0, r0
20022b98:	f000 0001 	and.w	r0, r0, #1
20022b9c:	4770      	bx	lr
20022b9e:	2001      	movs	r0, #1
20022ba0:	4770      	bx	lr

20022ba2 <HAL_FLASH_READ32>:
20022ba2:	b108      	cbz	r0, 20022ba8 <HAL_FLASH_READ32+0x6>
20022ba4:	6803      	ldr	r3, [r0, #0]
20022ba6:	6858      	ldr	r0, [r3, #4]
20022ba8:	4770      	bx	lr

20022baa <HAL_FLASH_SET_TXSLOT>:
20022baa:	b120      	cbz	r0, 20022bb6 <HAL_FLASH_SET_TXSLOT+0xc>
20022bac:	6802      	ldr	r2, [r0, #0]
20022bae:	6d53      	ldr	r3, [r2, #84]	@ 0x54
20022bb0:	f361 238e 	bfi	r3, r1, #10, #5
20022bb4:	6553      	str	r3, [r2, #84]	@ 0x54
20022bb6:	4770      	bx	lr

20022bb8 <HAL_FLASH_SET_CLK_rom>:
20022bb8:	b108      	cbz	r0, 20022bbe <HAL_FLASH_SET_CLK_rom+0x6>
20022bba:	6803      	ldr	r3, [r0, #0]
20022bbc:	60d9      	str	r1, [r3, #12]
20022bbe:	4770      	bx	lr

20022bc0 <HAL_FLASH_GET_DIV>:
20022bc0:	b110      	cbz	r0, 20022bc8 <HAL_FLASH_GET_DIV+0x8>
20022bc2:	6803      	ldr	r3, [r0, #0]
20022bc4:	68d8      	ldr	r0, [r3, #12]
20022bc6:	b2c0      	uxtb	r0, r0
20022bc8:	4770      	bx	lr

20022bca <HAL_FLASH_MANUAL_CMD>:
20022bca:	b570      	push	{r4, r5, r6, lr}
20022bcc:	b1e8      	cbz	r0, 20022c0a <HAL_FLASH_MANUAL_CMD+0x40>
20022bce:	6805      	ldr	r5, [r0, #0]
20022bd0:	f99d 601c 	ldrsb.w	r6, [sp, #28]
20022bd4:	f99d 0020 	ldrsb.w	r0, [sp, #32]
20022bd8:	6aac      	ldr	r4, [r5, #40]	@ 0x28
20022bda:	ea40 00c6 	orr.w	r0, r0, r6, lsl #3
20022bde:	f99d 6010 	ldrsb.w	r6, [sp, #16]
20022be2:	f36f 0415 	bfc	r4, #0, #22
20022be6:	ea40 20c6 	orr.w	r0, r0, r6, lsl #11
20022bea:	f99d 6014 	ldrsb.w	r6, [sp, #20]
20022bee:	ea40 2006 	orr.w	r0, r0, r6, lsl #8
20022bf2:	f99d 6018 	ldrsb.w	r6, [sp, #24]
20022bf6:	ea40 1086 	orr.w	r0, r0, r6, lsl #6
20022bfa:	ea40 3343 	orr.w	r3, r0, r3, lsl #13
20022bfe:	ea43 4282 	orr.w	r2, r3, r2, lsl #18
20022c02:	ea42 5141 	orr.w	r1, r2, r1, lsl #21
20022c06:	4321      	orrs	r1, r4
20022c08:	62a9      	str	r1, [r5, #40]	@ 0x28
20022c0a:	bd70      	pop	{r4, r5, r6, pc}

20022c0c <HAL_FLASH_MANUAL_CMD2>:
20022c0c:	b570      	push	{r4, r5, r6, lr}
20022c0e:	b1e8      	cbz	r0, 20022c4c <HAL_FLASH_MANUAL_CMD2+0x40>
20022c10:	6805      	ldr	r5, [r0, #0]
20022c12:	f99d 601c 	ldrsb.w	r6, [sp, #28]
20022c16:	f99d 0020 	ldrsb.w	r0, [sp, #32]
20022c1a:	6bec      	ldr	r4, [r5, #60]	@ 0x3c
20022c1c:	ea40 00c6 	orr.w	r0, r0, r6, lsl #3
20022c20:	f99d 6010 	ldrsb.w	r6, [sp, #16]
20022c24:	f36f 0415 	bfc	r4, #0, #22
20022c28:	ea40 20c6 	orr.w	r0, r0, r6, lsl #11
20022c2c:	f99d 6014 	ldrsb.w	r6, [sp, #20]
20022c30:	ea40 2006 	orr.w	r0, r0, r6, lsl #8
20022c34:	f99d 6018 	ldrsb.w	r6, [sp, #24]
20022c38:	ea40 1086 	orr.w	r0, r0, r6, lsl #6
20022c3c:	ea40 3343 	orr.w	r3, r0, r3, lsl #13
20022c40:	ea43 4282 	orr.w	r2, r3, r2, lsl #18
20022c44:	ea42 5141 	orr.w	r1, r2, r1, lsl #21
20022c48:	4321      	orrs	r1, r4
20022c4a:	63e9      	str	r1, [r5, #60]	@ 0x3c
20022c4c:	bd70      	pop	{r4, r5, r6, pc}
	...

20022c50 <HAL_FLASH_SET_ALIAS_RANGE>:
20022c50:	b510      	push	{r4, lr}
20022c52:	b158      	cbz	r0, 20022c6c <HAL_FLASH_SET_ALIAS_RANGE+0x1c>
20022c54:	4b06      	ldr	r3, [pc, #24]	@ (20022c70 <HAL_FLASH_SET_ALIAS_RANGE+0x20>)
20022c56:	6804      	ldr	r4, [r0, #0]
20022c58:	f202 32ff 	addw	r2, r2, #1023	@ 0x3ff
20022c5c:	440a      	add	r2, r1
20022c5e:	4019      	ands	r1, r3
20022c60:	66e1      	str	r1, [r4, #108]	@ 0x6c
20022c62:	401a      	ands	r2, r3
20022c64:	6803      	ldr	r3, [r0, #0]
20022c66:	2000      	movs	r0, #0
20022c68:	671a      	str	r2, [r3, #112]	@ 0x70
20022c6a:	bd10      	pop	{r4, pc}
20022c6c:	2001      	movs	r0, #1
20022c6e:	e7fc      	b.n	20022c6a <HAL_FLASH_SET_ALIAS_RANGE+0x1a>
20022c70:	fffffc00 	.word	0xfffffc00

20022c74 <HAL_FLASH_SET_ALIAS_OFFSET>:
20022c74:	b128      	cbz	r0, 20022c82 <HAL_FLASH_SET_ALIAS_OFFSET+0xe>
20022c76:	6803      	ldr	r3, [r0, #0]
20022c78:	f36f 0109 	bfc	r1, #0, #10
20022c7c:	2000      	movs	r0, #0
20022c7e:	6759      	str	r1, [r3, #116]	@ 0x74
20022c80:	4770      	bx	lr
20022c82:	2001      	movs	r0, #1
20022c84:	4770      	bx	lr
	...

20022c88 <HAL_FLASH_SET_CTR>:
20022c88:	b510      	push	{r4, lr}
20022c8a:	b150      	cbz	r0, 20022ca2 <HAL_FLASH_SET_CTR+0x1a>
20022c8c:	4b06      	ldr	r3, [pc, #24]	@ (20022ca8 <HAL_FLASH_SET_CTR+0x20>)
20022c8e:	6804      	ldr	r4, [r0, #0]
20022c90:	4019      	ands	r1, r3
20022c92:	65e1      	str	r1, [r4, #92]	@ 0x5c
20022c94:	6801      	ldr	r1, [r0, #0]
20022c96:	2000      	movs	r0, #0
20022c98:	f202 32ff 	addw	r2, r2, #1023	@ 0x3ff
20022c9c:	401a      	ands	r2, r3
20022c9e:	660a      	str	r2, [r1, #96]	@ 0x60
20022ca0:	bd10      	pop	{r4, pc}
20022ca2:	2001      	movs	r0, #1
20022ca4:	e7fc      	b.n	20022ca0 <HAL_FLASH_SET_CTR+0x18>
20022ca6:	bf00      	nop
20022ca8:	fffffc00 	.word	0xfffffc00

20022cac <HAL_FLASH_SET_NONCE>:
20022cac:	b150      	cbz	r0, 20022cc4 <HAL_FLASH_SET_NONCE+0x18>
20022cae:	b149      	cbz	r1, 20022cc4 <HAL_FLASH_SET_NONCE+0x18>
20022cb0:	680b      	ldr	r3, [r1, #0]
20022cb2:	6802      	ldr	r2, [r0, #0]
20022cb4:	ba1b      	rev	r3, r3
20022cb6:	6653      	str	r3, [r2, #100]	@ 0x64
20022cb8:	684b      	ldr	r3, [r1, #4]
20022cba:	6802      	ldr	r2, [r0, #0]
20022cbc:	ba1b      	rev	r3, r3
20022cbe:	2000      	movs	r0, #0
20022cc0:	6693      	str	r3, [r2, #104]	@ 0x68
20022cc2:	4770      	bx	lr
20022cc4:	2001      	movs	r0, #1
20022cc6:	4770      	bx	lr

20022cc8 <HAL_FLASH_SET_AES>:
20022cc8:	b158      	cbz	r0, 20022ce2 <HAL_FLASH_SET_AES+0x1a>
20022cca:	6803      	ldr	r3, [r0, #0]
20022ccc:	2901      	cmp	r1, #1
20022cce:	681a      	ldr	r2, [r3, #0]
20022cd0:	d104      	bne.n	20022cdc <HAL_FLASH_SET_AES+0x14>
20022cd2:	f042 0280 	orr.w	r2, r2, #128	@ 0x80
20022cd6:	2000      	movs	r0, #0
20022cd8:	601a      	str	r2, [r3, #0]
20022cda:	4770      	bx	lr
20022cdc:	f022 0280 	bic.w	r2, r2, #128	@ 0x80
20022ce0:	e7f9      	b.n	20022cd6 <HAL_FLASH_SET_AES+0xe>
20022ce2:	2001      	movs	r0, #1
20022ce4:	4770      	bx	lr

20022ce6 <HAL_FLASH_ENABLE_AES>:
20022ce6:	b150      	cbz	r0, 20022cfe <HAL_FLASH_ENABLE_AES+0x18>
20022ce8:	6803      	ldr	r3, [r0, #0]
20022cea:	681a      	ldr	r2, [r3, #0]
20022cec:	b121      	cbz	r1, 20022cf8 <HAL_FLASH_ENABLE_AES+0x12>
20022cee:	f042 0240 	orr.w	r2, r2, #64	@ 0x40
20022cf2:	2000      	movs	r0, #0
20022cf4:	601a      	str	r2, [r3, #0]
20022cf6:	4770      	bx	lr
20022cf8:	f022 0240 	bic.w	r2, r2, #64	@ 0x40
20022cfc:	e7f9      	b.n	20022cf2 <HAL_FLASH_ENABLE_AES+0xc>
20022cfe:	2001      	movs	r0, #1
20022d00:	4770      	bx	lr

20022d02 <HAL_FLASH_ENABLE_QSPI>:
20022d02:	b150      	cbz	r0, 20022d1a <HAL_FLASH_ENABLE_QSPI+0x18>
20022d04:	6803      	ldr	r3, [r0, #0]
20022d06:	681a      	ldr	r2, [r3, #0]
20022d08:	b121      	cbz	r1, 20022d14 <HAL_FLASH_ENABLE_QSPI+0x12>
20022d0a:	f042 0201 	orr.w	r2, r2, #1
20022d0e:	2000      	movs	r0, #0
20022d10:	601a      	str	r2, [r3, #0]
20022d12:	4770      	bx	lr
20022d14:	f022 0201 	bic.w	r2, r2, #1
20022d18:	e7f9      	b.n	20022d0e <HAL_FLASH_ENABLE_QSPI+0xc>
20022d1a:	2001      	movs	r0, #1
20022d1c:	4770      	bx	lr

20022d1e <HAL_FLASH_ENABLE_OPI>:
20022d1e:	b150      	cbz	r0, 20022d36 <HAL_FLASH_ENABLE_OPI+0x18>
20022d20:	6803      	ldr	r3, [r0, #0]
20022d22:	681a      	ldr	r2, [r3, #0]
20022d24:	b121      	cbz	r1, 20022d30 <HAL_FLASH_ENABLE_OPI+0x12>
20022d26:	f442 1200 	orr.w	r2, r2, #2097152	@ 0x200000
20022d2a:	2000      	movs	r0, #0
20022d2c:	601a      	str	r2, [r3, #0]
20022d2e:	4770      	bx	lr
20022d30:	f422 1200 	bic.w	r2, r2, #2097152	@ 0x200000
20022d34:	e7f9      	b.n	20022d2a <HAL_FLASH_ENABLE_OPI+0xc>
20022d36:	2001      	movs	r0, #1
20022d38:	4770      	bx	lr

20022d3a <HAL_FLASH_ENABLE_HYPER>:
20022d3a:	b150      	cbz	r0, 20022d52 <HAL_FLASH_ENABLE_HYPER+0x18>
20022d3c:	6803      	ldr	r3, [r0, #0]
20022d3e:	689a      	ldr	r2, [r3, #8]
20022d40:	b121      	cbz	r1, 20022d4c <HAL_FLASH_ENABLE_HYPER+0x12>
20022d42:	f042 0210 	orr.w	r2, r2, #16
20022d46:	2000      	movs	r0, #0
20022d48:	609a      	str	r2, [r3, #8]
20022d4a:	4770      	bx	lr
20022d4c:	f022 0210 	bic.w	r2, r2, #16
20022d50:	e7f9      	b.n	20022d46 <HAL_FLASH_ENABLE_HYPER+0xc>
20022d52:	2001      	movs	r0, #1
20022d54:	4770      	bx	lr

20022d56 <HAL_FLASH_ENABLE_CMD2>:
20022d56:	b150      	cbz	r0, 20022d6e <HAL_FLASH_ENABLE_CMD2+0x18>
20022d58:	6803      	ldr	r3, [r0, #0]
20022d5a:	681a      	ldr	r2, [r3, #0]
20022d5c:	b121      	cbz	r1, 20022d68 <HAL_FLASH_ENABLE_CMD2+0x12>
20022d5e:	f442 3280 	orr.w	r2, r2, #65536	@ 0x10000
20022d62:	2000      	movs	r0, #0
20022d64:	601a      	str	r2, [r3, #0]
20022d66:	4770      	bx	lr
20022d68:	f422 3280 	bic.w	r2, r2, #65536	@ 0x10000
20022d6c:	e7f9      	b.n	20022d62 <HAL_FLASH_ENABLE_CMD2+0xc>
20022d6e:	2001      	movs	r0, #1
20022d70:	4770      	bx	lr

20022d72 <HAL_FLASH_STAUS_MATCH_CMD2>:
20022d72:	b150      	cbz	r0, 20022d8a <HAL_FLASH_STAUS_MATCH_CMD2+0x18>
20022d74:	6803      	ldr	r3, [r0, #0]
20022d76:	681a      	ldr	r2, [r3, #0]
20022d78:	b121      	cbz	r1, 20022d84 <HAL_FLASH_STAUS_MATCH_CMD2+0x12>
20022d7a:	f442 2280 	orr.w	r2, r2, #262144	@ 0x40000
20022d7e:	2000      	movs	r0, #0
20022d80:	601a      	str	r2, [r3, #0]
20022d82:	4770      	bx	lr
20022d84:	f422 2280 	bic.w	r2, r2, #262144	@ 0x40000
20022d88:	e7f9      	b.n	20022d7e <HAL_FLASH_STAUS_MATCH_CMD2+0xc>
20022d8a:	2001      	movs	r0, #1
20022d8c:	4770      	bx	lr

20022d8e <HAL_FLASH_SET_CS_TIME>:
20022d8e:	b530      	push	{r4, r5, lr}
20022d90:	b180      	cbz	r0, 20022db4 <HAL_FLASH_SET_CS_TIME+0x26>
20022d92:	6805      	ldr	r5, [r0, #0]
20022d94:	f8bd 000c 	ldrh.w	r0, [sp, #12]
20022d98:	68ac      	ldr	r4, [r5, #8]
20022d9a:	0680      	lsls	r0, r0, #26
20022d9c:	ea40 5383 	orr.w	r3, r0, r3, lsl #22
20022da0:	2000      	movs	r0, #0
20022da2:	ea43 4181 	orr.w	r1, r3, r1, lsl #18
20022da6:	f36f 149e 	bfc	r4, #6, #25
20022daa:	ea41 1282 	orr.w	r2, r1, r2, lsl #6
20022dae:	4322      	orrs	r2, r4
20022db0:	60aa      	str	r2, [r5, #8]
20022db2:	bd30      	pop	{r4, r5, pc}
20022db4:	2001      	movs	r0, #1
20022db6:	e7fc      	b.n	20022db2 <HAL_FLASH_SET_CS_TIME+0x24>

20022db8 <HAL_FLASH_SET_ROW_BOUNDARY>:
20022db8:	b130      	cbz	r0, 20022dc8 <HAL_FLASH_SET_ROW_BOUNDARY+0x10>
20022dba:	6802      	ldr	r2, [r0, #0]
20022dbc:	2000      	movs	r0, #0
20022dbe:	6893      	ldr	r3, [r2, #8]
20022dc0:	f361 0302 	bfi	r3, r1, #0, #3
20022dc4:	6093      	str	r3, [r2, #8]
20022dc6:	4770      	bx	lr
20022dc8:	2001      	movs	r0, #1
20022dca:	4770      	bx	lr

20022dcc <HAL_FLASH_SET_LEGACY>:
20022dcc:	b150      	cbz	r0, 20022de4 <HAL_FLASH_SET_LEGACY+0x18>
20022dce:	6803      	ldr	r3, [r0, #0]
20022dd0:	689a      	ldr	r2, [r3, #8]
20022dd2:	b121      	cbz	r1, 20022dde <HAL_FLASH_SET_LEGACY+0x12>
20022dd4:	f042 0220 	orr.w	r2, r2, #32
20022dd8:	2000      	movs	r0, #0
20022dda:	609a      	str	r2, [r3, #8]
20022ddc:	4770      	bx	lr
20022dde:	f022 0220 	bic.w	r2, r2, #32
20022de2:	e7f9      	b.n	20022dd8 <HAL_FLASH_SET_LEGACY+0xc>
20022de4:	2001      	movs	r0, #1
20022de6:	4770      	bx	lr

20022de8 <HAL_FLASH_SET_DUAL_MODE>:
20022de8:	b150      	cbz	r0, 20022e00 <HAL_FLASH_SET_DUAL_MODE+0x18>
20022dea:	6803      	ldr	r3, [r0, #0]
20022dec:	681a      	ldr	r2, [r3, #0]
20022dee:	b121      	cbz	r1, 20022dfa <HAL_FLASH_SET_DUAL_MODE+0x12>
20022df0:	f042 7280 	orr.w	r2, r2, #16777216	@ 0x1000000
20022df4:	2000      	movs	r0, #0
20022df6:	601a      	str	r2, [r3, #0]
20022df8:	4770      	bx	lr
20022dfa:	f022 7280 	bic.w	r2, r2, #16777216	@ 0x1000000
20022dfe:	e7f9      	b.n	20022df4 <HAL_FLASH_SET_DUAL_MODE+0xc>
20022e00:	2001      	movs	r0, #1
20022e02:	4770      	bx	lr

20022e04 <HAL_MPI_EN_FIXLAT>:
20022e04:	b150      	cbz	r0, 20022e1c <HAL_MPI_EN_FIXLAT+0x18>
20022e06:	6803      	ldr	r3, [r0, #0]
20022e08:	689a      	ldr	r2, [r3, #8]
20022e0a:	b121      	cbz	r1, 20022e16 <HAL_MPI_EN_FIXLAT+0x12>
20022e0c:	f042 4200 	orr.w	r2, r2, #2147483648	@ 0x80000000
20022e10:	2000      	movs	r0, #0
20022e12:	609a      	str	r2, [r3, #8]
20022e14:	4770      	bx	lr
20022e16:	f022 4200 	bic.w	r2, r2, #2147483648	@ 0x80000000
20022e1a:	e7f9      	b.n	20022e10 <HAL_MPI_EN_FIXLAT+0xc>
20022e1c:	2001      	movs	r0, #1
20022e1e:	4770      	bx	lr

20022e20 <HAL_MPI_ENABLE_DQS>:
20022e20:	b150      	cbz	r0, 20022e38 <HAL_MPI_ENABLE_DQS+0x18>
20022e22:	6803      	ldr	r3, [r0, #0]
20022e24:	689a      	ldr	r2, [r3, #8]
20022e26:	b121      	cbz	r1, 20022e32 <HAL_MPI_ENABLE_DQS+0x12>
20022e28:	f042 0208 	orr.w	r2, r2, #8
20022e2c:	2000      	movs	r0, #0
20022e2e:	609a      	str	r2, [r3, #8]
20022e30:	4770      	bx	lr
20022e32:	f022 0208 	bic.w	r2, r2, #8
20022e36:	e7f9      	b.n	20022e2c <HAL_MPI_ENABLE_DQS+0xc>
20022e38:	2001      	movs	r0, #1
20022e3a:	4770      	bx	lr

20022e3c <HAL_MPI_SET_DQS_DELAY>:
20022e3c:	b140      	cbz	r0, 20022e50 <HAL_MPI_SET_DQS_DELAY+0x14>
20022e3e:	6802      	ldr	r2, [r0, #0]
20022e40:	2000      	movs	r0, #0
20022e42:	6d93      	ldr	r3, [r2, #88]	@ 0x58
20022e44:	f423 037f 	bic.w	r3, r3, #16711680	@ 0xff0000
20022e48:	ea43 4101 	orr.w	r1, r3, r1, lsl #16
20022e4c:	6591      	str	r1, [r2, #88]	@ 0x58
20022e4e:	4770      	bx	lr
20022e50:	2001      	movs	r0, #1
20022e52:	4770      	bx	lr

20022e54 <HAL_MPI_SET_SCK>:
20022e54:	b160      	cbz	r0, 20022e70 <HAL_MPI_SET_SCK+0x1c>
20022e56:	6800      	ldr	r0, [r0, #0]
20022e58:	0652      	lsls	r2, r2, #25
20022e5a:	6d83      	ldr	r3, [r0, #88]	@ 0x58
20022e5c:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
20022e60:	f023 7300 	bic.w	r3, r3, #33554432	@ 0x2000000
20022e64:	f423 437f 	bic.w	r3, r3, #65280	@ 0xff00
20022e68:	4319      	orrs	r1, r3
20022e6a:	6581      	str	r1, [r0, #88]	@ 0x58
20022e6c:	2000      	movs	r0, #0
20022e6e:	4770      	bx	lr
20022e70:	2001      	movs	r0, #1
20022e72:	4770      	bx	lr

20022e74 <HAL_MPI_CFG_DTR>:
20022e74:	b510      	push	{r4, lr}
20022e76:	b1f0      	cbz	r0, 20022eb6 <HAL_MPI_CFG_DTR+0x42>
20022e78:	6804      	ldr	r4, [r0, #0]
20022e7a:	6da0      	ldr	r0, [r4, #88]	@ 0x58
20022e7c:	b1b1      	cbz	r1, 20022eac <HAL_MPI_CFG_DTR+0x38>
20022e7e:	2a02      	cmp	r2, #2
20022e80:	bf84      	itt	hi
20022e82:	3a02      	subhi	r2, #2
20022e84:	b2d2      	uxtbhi	r2, r2
20022e86:	0213      	lsls	r3, r2, #8
20022e88:	f36f 000f 	bfc	r0, #0, #16
20022e8c:	f403 43fe 	and.w	r3, r3, #32512	@ 0x7f00
20022e90:	4303      	orrs	r3, r0
20022e92:	0612      	lsls	r2, r2, #24
20022e94:	bf54      	ite	pl
20022e96:	f043 6380 	orrpl.w	r3, r3, #67108864	@ 0x4000000
20022e9a:	f043 63a0 	orrmi.w	r3, r3, #83886080	@ 0x5000000
20022e9e:	f043 030a 	orr.w	r3, r3, #10
20022ea2:	f023 7300 	bic.w	r3, r3, #33554432	@ 0x2000000
20022ea6:	2000      	movs	r0, #0
20022ea8:	65a3      	str	r3, [r4, #88]	@ 0x58
20022eaa:	bd10      	pop	{r4, pc}
20022eac:	4b03      	ldr	r3, [pc, #12]	@ (20022ebc <HAL_MPI_CFG_DTR+0x48>)
20022eae:	4003      	ands	r3, r0
20022eb0:	f043 7300 	orr.w	r3, r3, #33554432	@ 0x2000000
20022eb4:	e7f7      	b.n	20022ea6 <HAL_MPI_CFG_DTR+0x32>
20022eb6:	2001      	movs	r0, #1
20022eb8:	e7f7      	b.n	20022eaa <HAL_MPI_CFG_DTR+0x36>
20022eba:	bf00      	nop
20022ebc:	faff0000 	.word	0xfaff0000

20022ec0 <HAL_MPI_MODIFY_RCMD_DELAY>:
20022ec0:	b130      	cbz	r0, 20022ed0 <HAL_MPI_MODIFY_RCMD_DELAY+0x10>
20022ec2:	6802      	ldr	r2, [r0, #0]
20022ec4:	6c93      	ldr	r3, [r2, #72]	@ 0x48
20022ec6:	f423 3378 	bic.w	r3, r3, #253952	@ 0x3e000
20022eca:	ea43 3141 	orr.w	r1, r3, r1, lsl #13
20022ece:	6491      	str	r1, [r2, #72]	@ 0x48
20022ed0:	4770      	bx	lr

20022ed2 <HAL_MPI_MODIFY_WCMD_DELAY>:
20022ed2:	b130      	cbz	r0, 20022ee2 <HAL_MPI_MODIFY_WCMD_DELAY+0x10>
20022ed4:	6802      	ldr	r2, [r0, #0]
20022ed6:	6d13      	ldr	r3, [r2, #80]	@ 0x50
20022ed8:	f423 3378 	bic.w	r3, r3, #253952	@ 0x3e000
20022edc:	ea43 3141 	orr.w	r1, r3, r1, lsl #13
20022ee0:	6511      	str	r1, [r2, #80]	@ 0x50
20022ee2:	4770      	bx	lr

20022ee4 <HAL_FLASH_CONFIG_AHB_READ>:
20022ee4:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
20022ee6:	4605      	mov	r5, r0
20022ee8:	2800      	cmp	r0, #0
20022eea:	d03d      	beq.n	20022f68 <HAL_FLASH_CONFIG_AHB_READ+0x84>
20022eec:	68c4      	ldr	r4, [r0, #12]
20022eee:	b301      	cbz	r1, 20022f32 <HAL_FLASH_CONFIG_AHB_READ+0x4e>
20022ef0:	f894 306a 	ldrb.w	r3, [r4, #106]	@ 0x6a
20022ef4:	2b00      	cmp	r3, #0
20022ef6:	d037      	beq.n	20022f68 <HAL_FLASH_CONFIG_AHB_READ+0x84>
20022ef8:	f994 6072 	ldrsb.w	r6, [r4, #114]	@ 0x72
20022efc:	f994 306e 	ldrsb.w	r3, [r4, #110]	@ 0x6e
20022f00:	f994 106c 	ldrsb.w	r1, [r4, #108]	@ 0x6c
20022f04:	f994 206d 	ldrsb.w	r2, [r4, #109]	@ 0x6d
20022f08:	9603      	str	r6, [sp, #12]
20022f0a:	f994 6071 	ldrsb.w	r6, [r4, #113]	@ 0x71
20022f0e:	9602      	str	r6, [sp, #8]
20022f10:	f994 6070 	ldrsb.w	r6, [r4, #112]	@ 0x70
20022f14:	9601      	str	r6, [sp, #4]
20022f16:	f994 406f 	ldrsb.w	r4, [r4, #111]	@ 0x6f
20022f1a:	9400      	str	r4, [sp, #0]
20022f1c:	f7ff fd9e 	bl	20022a5c <HAL_FLASH_CFG_AHB_RCMD>
20022f20:	68eb      	ldr	r3, [r5, #12]
20022f22:	f893 106a 	ldrb.w	r1, [r3, #106]	@ 0x6a
20022f26:	4628      	mov	r0, r5
20022f28:	f7ff fd8d 	bl	20022a46 <HAL_FLASH_SET_AHB_RCMD>
20022f2c:	2000      	movs	r0, #0
20022f2e:	b004      	add	sp, #16
20022f30:	bd70      	pop	{r4, r5, r6, pc}
20022f32:	f894 3046 	ldrb.w	r3, [r4, #70]	@ 0x46
20022f36:	b1bb      	cbz	r3, 20022f68 <HAL_FLASH_CONFIG_AHB_READ+0x84>
20022f38:	f994 604e 	ldrsb.w	r6, [r4, #78]	@ 0x4e
20022f3c:	f994 304a 	ldrsb.w	r3, [r4, #74]	@ 0x4a
20022f40:	f994 1048 	ldrsb.w	r1, [r4, #72]	@ 0x48
20022f44:	f994 2049 	ldrsb.w	r2, [r4, #73]	@ 0x49
20022f48:	9603      	str	r6, [sp, #12]
20022f4a:	f994 604d 	ldrsb.w	r6, [r4, #77]	@ 0x4d
20022f4e:	9602      	str	r6, [sp, #8]
20022f50:	f994 604c 	ldrsb.w	r6, [r4, #76]	@ 0x4c
20022f54:	9601      	str	r6, [sp, #4]
20022f56:	f994 404b 	ldrsb.w	r4, [r4, #75]	@ 0x4b
20022f5a:	9400      	str	r4, [sp, #0]
20022f5c:	f7ff fd7e 	bl	20022a5c <HAL_FLASH_CFG_AHB_RCMD>
20022f60:	68eb      	ldr	r3, [r5, #12]
20022f62:	f893 1046 	ldrb.w	r1, [r3, #70]	@ 0x46
20022f66:	e7de      	b.n	20022f26 <HAL_FLASH_CONFIG_AHB_READ+0x42>
20022f68:	2001      	movs	r0, #1
20022f6a:	e7e0      	b.n	20022f2e <HAL_FLASH_CONFIG_AHB_READ+0x4a>

20022f6c <HAL_FLASH_CONFIG_FULL_AHB_READ>:
20022f6c:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
20022f6e:	4605      	mov	r5, r0
20022f70:	2800      	cmp	r0, #0
20022f72:	d036      	beq.n	20022fe2 <HAL_FLASH_CONFIG_FULL_AHB_READ+0x76>
20022f74:	68c4      	ldr	r4, [r0, #12]
20022f76:	b1e1      	cbz	r1, 20022fb2 <HAL_FLASH_CONFIG_FULL_AHB_READ+0x46>
20022f78:	f994 616e 	ldrsb.w	r6, [r4, #366]	@ 0x16e
20022f7c:	f994 316a 	ldrsb.w	r3, [r4, #362]	@ 0x16a
20022f80:	f994 1168 	ldrsb.w	r1, [r4, #360]	@ 0x168
20022f84:	f994 2169 	ldrsb.w	r2, [r4, #361]	@ 0x169
20022f88:	9603      	str	r6, [sp, #12]
20022f8a:	f994 616d 	ldrsb.w	r6, [r4, #365]	@ 0x16d
20022f8e:	9602      	str	r6, [sp, #8]
20022f90:	f994 616c 	ldrsb.w	r6, [r4, #364]	@ 0x16c
20022f94:	9601      	str	r6, [sp, #4]
20022f96:	f994 416b 	ldrsb.w	r4, [r4, #363]	@ 0x16b
20022f9a:	9400      	str	r4, [sp, #0]
20022f9c:	f7ff fd5e 	bl	20022a5c <HAL_FLASH_CFG_AHB_RCMD>
20022fa0:	68eb      	ldr	r3, [r5, #12]
20022fa2:	f893 1166 	ldrb.w	r1, [r3, #358]	@ 0x166
20022fa6:	4628      	mov	r0, r5
20022fa8:	f7ff fd4d 	bl	20022a46 <HAL_FLASH_SET_AHB_RCMD>
20022fac:	2000      	movs	r0, #0
20022fae:	b004      	add	sp, #16
20022fb0:	bd70      	pop	{r4, r5, r6, pc}
20022fb2:	f994 615c 	ldrsb.w	r6, [r4, #348]	@ 0x15c
20022fb6:	f994 3158 	ldrsb.w	r3, [r4, #344]	@ 0x158
20022fba:	f994 1156 	ldrsb.w	r1, [r4, #342]	@ 0x156
20022fbe:	f994 2157 	ldrsb.w	r2, [r4, #343]	@ 0x157
20022fc2:	9603      	str	r6, [sp, #12]
20022fc4:	f994 615b 	ldrsb.w	r6, [r4, #347]	@ 0x15b
20022fc8:	9602      	str	r6, [sp, #8]
20022fca:	f994 615a 	ldrsb.w	r6, [r4, #346]	@ 0x15a
20022fce:	9601      	str	r6, [sp, #4]
20022fd0:	f994 4159 	ldrsb.w	r4, [r4, #345]	@ 0x159
20022fd4:	9400      	str	r4, [sp, #0]
20022fd6:	f7ff fd41 	bl	20022a5c <HAL_FLASH_CFG_AHB_RCMD>
20022fda:	68eb      	ldr	r3, [r5, #12]
20022fdc:	f893 1154 	ldrb.w	r1, [r3, #340]	@ 0x154
20022fe0:	e7e1      	b.n	20022fa6 <HAL_FLASH_CONFIG_FULL_AHB_READ+0x3a>
20022fe2:	2001      	movs	r0, #1
20022fe4:	e7e3      	b.n	20022fae <HAL_FLASH_CONFIG_FULL_AHB_READ+0x42>

20022fe6 <HAL_FLASH_PRE_CMD>:
20022fe6:	b530      	push	{r4, r5, lr}
20022fe8:	68c4      	ldr	r4, [r0, #12]
20022fea:	b087      	sub	sp, #28
20022fec:	b304      	cbz	r4, 20023030 <HAL_FLASH_PRE_CMD+0x4a>
20022fee:	2938      	cmp	r1, #56	@ 0x38
20022ff0:	d81e      	bhi.n	20023030 <HAL_FLASH_PRE_CMD+0x4a>
20022ff2:	eb01 01c1 	add.w	r1, r1, r1, lsl #3
20022ff6:	440c      	add	r4, r1
20022ff8:	7c23      	ldrb	r3, [r4, #16]
20022ffa:	b1cb      	cbz	r3, 20023030 <HAL_FLASH_PRE_CMD+0x4a>
20022ffc:	f994 5018 	ldrsb.w	r5, [r4, #24]
20023000:	f994 3013 	ldrsb.w	r3, [r4, #19]
20023004:	f994 2012 	ldrsb.w	r2, [r4, #18]
20023008:	f994 1011 	ldrsb.w	r1, [r4, #17]
2002300c:	9504      	str	r5, [sp, #16]
2002300e:	f994 5017 	ldrsb.w	r5, [r4, #23]
20023012:	9503      	str	r5, [sp, #12]
20023014:	f994 5016 	ldrsb.w	r5, [r4, #22]
20023018:	9502      	str	r5, [sp, #8]
2002301a:	f994 5015 	ldrsb.w	r5, [r4, #21]
2002301e:	9501      	str	r5, [sp, #4]
20023020:	f994 4014 	ldrsb.w	r4, [r4, #20]
20023024:	9400      	str	r4, [sp, #0]
20023026:	f7ff fdd0 	bl	20022bca <HAL_FLASH_MANUAL_CMD>
2002302a:	2000      	movs	r0, #0
2002302c:	b007      	add	sp, #28
2002302e:	bd30      	pop	{r4, r5, pc}
20023030:	2001      	movs	r0, #1
20023032:	e7fb      	b.n	2002302c <HAL_FLASH_PRE_CMD+0x46>

20023034 <HAL_FLASH_ISSUE_CMD>:
20023034:	b5f0      	push	{r4, r5, r6, r7, lr}
20023036:	68c4      	ldr	r4, [r0, #12]
20023038:	4606      	mov	r6, r0
2002303a:	4617      	mov	r7, r2
2002303c:	b087      	sub	sp, #28
2002303e:	b354      	cbz	r4, 20023096 <HAL_FLASH_ISSUE_CMD+0x62>
20023040:	2938      	cmp	r1, #56	@ 0x38
20023042:	d828      	bhi.n	20023096 <HAL_FLASH_ISSUE_CMD+0x62>
20023044:	eb01 05c1 	add.w	r5, r1, r1, lsl #3
20023048:	442c      	add	r4, r5
2002304a:	7c23      	ldrb	r3, [r4, #16]
2002304c:	b31b      	cbz	r3, 20023096 <HAL_FLASH_ISSUE_CMD+0x62>
2002304e:	f994 c018 	ldrsb.w	ip, [r4, #24]
20023052:	f994 3013 	ldrsb.w	r3, [r4, #19]
20023056:	f994 2012 	ldrsb.w	r2, [r4, #18]
2002305a:	f994 1011 	ldrsb.w	r1, [r4, #17]
2002305e:	f8cd c010 	str.w	ip, [sp, #16]
20023062:	f994 c017 	ldrsb.w	ip, [r4, #23]
20023066:	f8cd c00c 	str.w	ip, [sp, #12]
2002306a:	f994 c016 	ldrsb.w	ip, [r4, #22]
2002306e:	f8cd c008 	str.w	ip, [sp, #8]
20023072:	f994 c015 	ldrsb.w	ip, [r4, #21]
20023076:	f8cd c004 	str.w	ip, [sp, #4]
2002307a:	f994 4014 	ldrsb.w	r4, [r4, #20]
2002307e:	9400      	str	r4, [sp, #0]
20023080:	f7ff fda3 	bl	20022bca <HAL_FLASH_MANUAL_CMD>
20023084:	68f3      	ldr	r3, [r6, #12]
20023086:	463a      	mov	r2, r7
20023088:	442b      	add	r3, r5
2002308a:	4630      	mov	r0, r6
2002308c:	7c19      	ldrb	r1, [r3, #16]
2002308e:	f7ff fd57 	bl	20022b40 <HAL_FLASH_SET_CMD>
20023092:	b007      	add	sp, #28
20023094:	bdf0      	pop	{r4, r5, r6, r7, pc}
20023096:	2001      	movs	r0, #1
20023098:	e7fb      	b.n	20023092 <HAL_FLASH_ISSUE_CMD+0x5e>

2002309a <HAL_FLASH_ISSUE_CMD_SEQ>:
2002309a:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
2002309e:	4690      	mov	r8, r2
200230a0:	68c2      	ldr	r2, [r0, #12]
200230a2:	4604      	mov	r4, r0
200230a4:	b086      	sub	sp, #24
200230a6:	2a00      	cmp	r2, #0
200230a8:	d072      	beq.n	20023190 <HAL_FLASH_ISSUE_CMD_SEQ+0xf6>
200230aa:	2938      	cmp	r1, #56	@ 0x38
200230ac:	d870      	bhi.n	20023190 <HAL_FLASH_ISSUE_CMD_SEQ+0xf6>
200230ae:	eb01 07c1 	add.w	r7, r1, r1, lsl #3
200230b2:	19d6      	adds	r6, r2, r7
200230b4:	7c31      	ldrb	r1, [r6, #16]
200230b6:	2900      	cmp	r1, #0
200230b8:	d06a      	beq.n	20023190 <HAL_FLASH_ISSUE_CMD_SEQ+0xf6>
200230ba:	2b38      	cmp	r3, #56	@ 0x38
200230bc:	d868      	bhi.n	20023190 <HAL_FLASH_ISSUE_CMD_SEQ+0xf6>
200230be:	eb03 05c3 	add.w	r5, r3, r3, lsl #3
200230c2:	442a      	add	r2, r5
200230c4:	7c13      	ldrb	r3, [r2, #16]
200230c6:	2b00      	cmp	r3, #0
200230c8:	d062      	beq.n	20023190 <HAL_FLASH_ISSUE_CMD_SEQ+0xf6>
200230ca:	f996 c018 	ldrsb.w	ip, [r6, #24]
200230ce:	f996 3013 	ldrsb.w	r3, [r6, #19]
200230d2:	f996 2012 	ldrsb.w	r2, [r6, #18]
200230d6:	f996 1011 	ldrsb.w	r1, [r6, #17]
200230da:	f8cd c010 	str.w	ip, [sp, #16]
200230de:	f996 c017 	ldrsb.w	ip, [r6, #23]
200230e2:	f8cd c00c 	str.w	ip, [sp, #12]
200230e6:	f996 c016 	ldrsb.w	ip, [r6, #22]
200230ea:	f8cd c008 	str.w	ip, [sp, #8]
200230ee:	f996 c015 	ldrsb.w	ip, [r6, #21]
200230f2:	f8cd c004 	str.w	ip, [sp, #4]
200230f6:	f996 6014 	ldrsb.w	r6, [r6, #20]
200230fa:	9600      	str	r6, [sp, #0]
200230fc:	f7ff fd65 	bl	20022bca <HAL_FLASH_MANUAL_CMD>
20023100:	68e0      	ldr	r0, [r4, #12]
20023102:	4428      	add	r0, r5
20023104:	f990 6018 	ldrsb.w	r6, [r0, #24]
20023108:	f990 3013 	ldrsb.w	r3, [r0, #19]
2002310c:	f990 2012 	ldrsb.w	r2, [r0, #18]
20023110:	f990 1011 	ldrsb.w	r1, [r0, #17]
20023114:	9604      	str	r6, [sp, #16]
20023116:	f990 6017 	ldrsb.w	r6, [r0, #23]
2002311a:	9603      	str	r6, [sp, #12]
2002311c:	f990 6016 	ldrsb.w	r6, [r0, #22]
20023120:	9602      	str	r6, [sp, #8]
20023122:	f990 6015 	ldrsb.w	r6, [r0, #21]
20023126:	9601      	str	r6, [sp, #4]
20023128:	f990 0014 	ldrsb.w	r0, [r0, #20]
2002312c:	9000      	str	r0, [sp, #0]
2002312e:	4620      	mov	r0, r4
20023130:	f7ff fd6c 	bl	20022c0c <HAL_FLASH_MANUAL_CMD2>
20023134:	2200      	movs	r2, #0
20023136:	6823      	ldr	r3, [r4, #0]
20023138:	2101      	movs	r1, #1
2002313a:	67da      	str	r2, [r3, #124]	@ 0x7c
2002313c:	68e3      	ldr	r3, [r4, #12]
2002313e:	6822      	ldr	r2, [r4, #0]
20023140:	442b      	add	r3, r5
20023142:	7c1b      	ldrb	r3, [r3, #16]
20023144:	4620      	mov	r0, r4
20023146:	62d3      	str	r3, [r2, #44]	@ 0x2c
20023148:	6823      	ldr	r3, [r4, #0]
2002314a:	9a0c      	ldr	r2, [sp, #48]	@ 0x30
2002314c:	f8c3 2080 	str.w	r2, [r3, #128]	@ 0x80
20023150:	f7ff fe01 	bl	20022d56 <HAL_FLASH_ENABLE_CMD2>
20023154:	4620      	mov	r0, r4
20023156:	f7ff fe0c 	bl	20022d72 <HAL_FLASH_STAUS_MATCH_CMD2>
2002315a:	6823      	ldr	r3, [r4, #0]
2002315c:	f8c3 801c 	str.w	r8, [r3, #28]
20023160:	68e3      	ldr	r3, [r4, #12]
20023162:	6822      	ldr	r2, [r4, #0]
20023164:	443b      	add	r3, r7
20023166:	7c1b      	ldrb	r3, [r3, #16]
20023168:	6193      	str	r3, [r2, #24]
2002316a:	4620      	mov	r0, r4
2002316c:	f7ff fd0a 	bl	20022b84 <HAL_FLASH_STATUS_MATCH>
20023170:	2800      	cmp	r0, #0
20023172:	d0fa      	beq.n	2002316a <HAL_FLASH_ISSUE_CMD_SEQ+0xd0>
20023174:	2109      	movs	r1, #9
20023176:	4620      	mov	r0, r4
20023178:	f7ff fcfe 	bl	20022b78 <HAL_FLASH_CLR_STATUS>
2002317c:	2100      	movs	r1, #0
2002317e:	f7ff fdea 	bl	20022d56 <HAL_FLASH_ENABLE_CMD2>
20023182:	4620      	mov	r0, r4
20023184:	f7ff fdf5 	bl	20022d72 <HAL_FLASH_STAUS_MATCH_CMD2>
20023188:	4608      	mov	r0, r1
2002318a:	b006      	add	sp, #24
2002318c:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
20023190:	2001      	movs	r0, #1
20023192:	e7fa      	b.n	2002318a <HAL_FLASH_ISSUE_CMD_SEQ+0xf0>

20023194 <nor_qspi_switch>:
20023194:	b570      	push	{r4, r5, r6, lr}
20023196:	4604      	mov	r4, r0
20023198:	b3e0      	cbz	r0, 20023214 <nor_qspi_switch+0x80>
2002319a:	68c3      	ldr	r3, [r0, #12]
2002319c:	b3d3      	cbz	r3, 20023214 <nor_qspi_switch+0x80>
2002319e:	b3c9      	cbz	r1, 20023214 <nor_qspi_switch+0x80>
200231a0:	f893 5193 	ldrb.w	r5, [r3, #403]	@ 0x193
200231a4:	2101      	movs	r1, #1
200231a6:	b3b5      	cbz	r5, 20023216 <nor_qspi_switch+0x82>
200231a8:	f7ff fca5 	bl	20022af6 <HAL_FLASH_WRITE_DLEN>
200231ac:	2200      	movs	r2, #0
200231ae:	2114      	movs	r1, #20
200231b0:	4620      	mov	r0, r4
200231b2:	f7ff ff3f 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
200231b6:	4620      	mov	r0, r4
200231b8:	f7ff fcf3 	bl	20022ba2 <HAL_FLASH_READ32>
200231bc:	f010 0501 	ands.w	r5, r0, #1
200231c0:	d000      	beq.n	200231c4 <nor_qspi_switch+0x30>
200231c2:	e7fe      	b.n	200231c2 <nor_qspi_switch+0x2e>
200231c4:	462a      	mov	r2, r5
200231c6:	2115      	movs	r1, #21
200231c8:	4620      	mov	r0, r4
200231ca:	f7ff ff33 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
200231ce:	4606      	mov	r6, r0
200231d0:	b120      	cbz	r0, 200231dc <nor_qspi_switch+0x48>
200231d2:	462a      	mov	r2, r5
200231d4:	4629      	mov	r1, r5
200231d6:	4620      	mov	r0, r4
200231d8:	f7ff ff2c 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
200231dc:	2102      	movs	r1, #2
200231de:	4620      	mov	r0, r4
200231e0:	f7ff fc82 	bl	20022ae8 <HAL_FLASH_WRITE_WORD>
200231e4:	2101      	movs	r1, #1
200231e6:	4620      	mov	r0, r4
200231e8:	f7ff fc85 	bl	20022af6 <HAL_FLASH_WRITE_DLEN>
200231ec:	2200      	movs	r2, #0
200231ee:	212b      	movs	r1, #43	@ 0x2b
200231f0:	4620      	mov	r0, r4
200231f2:	f7ff ff1f 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
200231f6:	b16e      	cbz	r6, 20023214 <nor_qspi_switch+0x80>
200231f8:	2101      	movs	r1, #1
200231fa:	4620      	mov	r0, r4
200231fc:	f7ff fc7b 	bl	20022af6 <HAL_FLASH_WRITE_DLEN>
20023200:	2200      	movs	r2, #0
20023202:	2102      	movs	r1, #2
20023204:	4620      	mov	r0, r4
20023206:	f7ff ff15 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
2002320a:	4620      	mov	r0, r4
2002320c:	f7ff fcc0 	bl	20022b90 <HAL_FLASH_IS_PROG_DONE>
20023210:	2800      	cmp	r0, #0
20023212:	d0f5      	beq.n	20023200 <nor_qspi_switch+0x6c>
20023214:	bd70      	pop	{r4, r5, r6, pc}
20023216:	f7ff fc6e 	bl	20022af6 <HAL_FLASH_WRITE_DLEN>
2002321a:	462a      	mov	r2, r5
2002321c:	2102      	movs	r1, #2
2002321e:	4620      	mov	r0, r4
20023220:	f7ff ff08 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
20023224:	4620      	mov	r0, r4
20023226:	f7ff fcbc 	bl	20022ba2 <HAL_FLASH_READ32>
2002322a:	462a      	mov	r2, r5
2002322c:	2114      	movs	r1, #20
2002322e:	4620      	mov	r0, r4
20023230:	f7ff ff00 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
20023234:	b910      	cbnz	r0, 2002323c <nor_qspi_switch+0xa8>
20023236:	4620      	mov	r0, r4
20023238:	f7ff fcb3 	bl	20022ba2 <HAL_FLASH_READ32>
2002323c:	68e3      	ldr	r3, [r4, #12]
2002323e:	7a1b      	ldrb	r3, [r3, #8]
20023240:	b3ab      	cbz	r3, 200232ae <nor_qspi_switch+0x11a>
20023242:	2101      	movs	r1, #1
20023244:	f003 050f 	and.w	r5, r3, #15
20023248:	091b      	lsrs	r3, r3, #4
2002324a:	fa01 f303 	lsl.w	r3, r1, r3
2002324e:	b2db      	uxtb	r3, r3
20023250:	b10d      	cbz	r5, 20023256 <nor_qspi_switch+0xc2>
20023252:	461d      	mov	r5, r3
20023254:	2300      	movs	r3, #0
20023256:	2200      	movs	r2, #0
20023258:	2115      	movs	r1, #21
2002325a:	4620      	mov	r0, r4
2002325c:	ea43 2505 	orr.w	r5, r3, r5, lsl #8
20023260:	f7ff fee8 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
20023264:	4606      	mov	r6, r0
20023266:	b120      	cbz	r0, 20023272 <nor_qspi_switch+0xde>
20023268:	2200      	movs	r2, #0
2002326a:	4620      	mov	r0, r4
2002326c:	4611      	mov	r1, r2
2002326e:	f7ff fee1 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
20023272:	4629      	mov	r1, r5
20023274:	4620      	mov	r0, r4
20023276:	f7ff fc37 	bl	20022ae8 <HAL_FLASH_WRITE_WORD>
2002327a:	2102      	movs	r1, #2
2002327c:	4620      	mov	r0, r4
2002327e:	f7ff fc3a 	bl	20022af6 <HAL_FLASH_WRITE_DLEN>
20023282:	2200      	movs	r2, #0
20023284:	2103      	movs	r1, #3
20023286:	4620      	mov	r0, r4
20023288:	f7ff fed4 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
2002328c:	2e00      	cmp	r6, #0
2002328e:	d0c1      	beq.n	20023214 <nor_qspi_switch+0x80>
20023290:	2101      	movs	r1, #1
20023292:	4620      	mov	r0, r4
20023294:	f7ff fc2f 	bl	20022af6 <HAL_FLASH_WRITE_DLEN>
20023298:	2200      	movs	r2, #0
2002329a:	2102      	movs	r1, #2
2002329c:	4620      	mov	r0, r4
2002329e:	f7ff fec9 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
200232a2:	4620      	mov	r0, r4
200232a4:	f7ff fc74 	bl	20022b90 <HAL_FLASH_IS_PROG_DONE>
200232a8:	2800      	cmp	r0, #0
200232aa:	d0f5      	beq.n	20023298 <nor_qspi_switch+0x104>
200232ac:	e7b2      	b.n	20023214 <nor_qspi_switch+0x80>
200232ae:	2502      	movs	r5, #2
200232b0:	e7d1      	b.n	20023256 <nor_qspi_switch+0xc2>

200232b2 <HAL_FLASH_SET_QUAL_SPI>:
200232b2:	b538      	push	{r3, r4, r5, lr}
200232b4:	4604      	mov	r4, r0
200232b6:	460d      	mov	r5, r1
200232b8:	f7ff ff6c 	bl	20023194 <nor_qspi_switch>
200232bc:	4629      	mov	r1, r5
200232be:	4620      	mov	r0, r4
200232c0:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
200232c4:	f7ff be0e 	b.w	20022ee4 <HAL_FLASH_CONFIG_AHB_READ>

200232c8 <HAL_FLASH_FADDR_SET_QSPI>:
200232c8:	b538      	push	{r3, r4, r5, lr}
200232ca:	4604      	mov	r4, r0
200232cc:	460d      	mov	r5, r1
200232ce:	f7ff ff61 	bl	20023194 <nor_qspi_switch>
200232d2:	4629      	mov	r1, r5
200232d4:	4620      	mov	r0, r4
200232d6:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
200232da:	f7ff be47 	b.w	20022f6c <HAL_FLASH_CONFIG_FULL_AHB_READ>

200232de <HAL_FLASH_GET_NOR_ID>:
200232de:	b510      	push	{r4, lr}
200232e0:	4604      	mov	r4, r0
200232e2:	b140      	cbz	r0, 200232f6 <HAL_FLASH_GET_NOR_ID+0x18>
200232e4:	6802      	ldr	r2, [r0, #0]
200232e6:	6a93      	ldr	r3, [r2, #40]	@ 0x28
200232e8:	f36f 0315 	bfc	r3, #0, #22
200232ec:	f443 2380 	orr.w	r3, r3, #262144	@ 0x40000
200232f0:	f043 0301 	orr.w	r3, r3, #1
200232f4:	6293      	str	r3, [r2, #40]	@ 0x28
200232f6:	2103      	movs	r1, #3
200232f8:	4620      	mov	r0, r4
200232fa:	f7ff fbfc 	bl	20022af6 <HAL_FLASH_WRITE_DLEN>
200232fe:	2200      	movs	r2, #0
20023300:	219f      	movs	r1, #159	@ 0x9f
20023302:	4620      	mov	r0, r4
20023304:	f7ff fc1c 	bl	20022b40 <HAL_FLASH_SET_CMD>
20023308:	4620      	mov	r0, r4
2002330a:	f7ff fc4a 	bl	20022ba2 <HAL_FLASH_READ32>
2002330e:	f020 407f 	bic.w	r0, r0, #4278190080	@ 0xff000000
20023312:	bd10      	pop	{r4, pc}

20023314 <HAL_FLASH_CLR_PROTECT>:
20023314:	b570      	push	{r4, r5, r6, lr}
20023316:	4604      	mov	r4, r0
20023318:	2800      	cmp	r0, #0
2002331a:	d03e      	beq.n	2002339a <HAL_FLASH_CLR_PROTECT+0x86>
2002331c:	68c3      	ldr	r3, [r0, #12]
2002331e:	2101      	movs	r1, #1
20023320:	f893 5193 	ldrb.w	r5, [r3, #403]	@ 0x193
20023324:	2d00      	cmp	r5, #0
20023326:	d03b      	beq.n	200233a0 <HAL_FLASH_CLR_PROTECT+0x8c>
20023328:	f7ff fbe5 	bl	20022af6 <HAL_FLASH_WRITE_DLEN>
2002332c:	2200      	movs	r2, #0
2002332e:	2102      	movs	r1, #2
20023330:	4620      	mov	r0, r4
20023332:	f7ff fe7f 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
20023336:	bb88      	cbnz	r0, 2002339c <HAL_FLASH_CLR_PROTECT+0x88>
20023338:	4620      	mov	r0, r4
2002333a:	f7ff fc32 	bl	20022ba2 <HAL_FLASH_READ32>
2002333e:	b2c0      	uxtb	r0, r0
20023340:	68e3      	ldr	r3, [r4, #12]
20023342:	79dd      	ldrb	r5, [r3, #7]
20023344:	b10d      	cbz	r5, 2002334a <HAL_FLASH_CLR_PROTECT+0x36>
20023346:	ea20 0505 	bic.w	r5, r0, r5
2002334a:	2200      	movs	r2, #0
2002334c:	2115      	movs	r1, #21
2002334e:	4620      	mov	r0, r4
20023350:	f7ff fe70 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
20023354:	4606      	mov	r6, r0
20023356:	b120      	cbz	r0, 20023362 <HAL_FLASH_CLR_PROTECT+0x4e>
20023358:	2200      	movs	r2, #0
2002335a:	4620      	mov	r0, r4
2002335c:	4611      	mov	r1, r2
2002335e:	f7ff fe69 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
20023362:	4629      	mov	r1, r5
20023364:	4620      	mov	r0, r4
20023366:	f7ff fbbf 	bl	20022ae8 <HAL_FLASH_WRITE_WORD>
2002336a:	2101      	movs	r1, #1
2002336c:	4620      	mov	r0, r4
2002336e:	f7ff fbc2 	bl	20022af6 <HAL_FLASH_WRITE_DLEN>
20023372:	2200      	movs	r2, #0
20023374:	2103      	movs	r1, #3
20023376:	4620      	mov	r0, r4
20023378:	f7ff fe5c 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
2002337c:	b16e      	cbz	r6, 2002339a <HAL_FLASH_CLR_PROTECT+0x86>
2002337e:	2101      	movs	r1, #1
20023380:	4620      	mov	r0, r4
20023382:	f7ff fbb8 	bl	20022af6 <HAL_FLASH_WRITE_DLEN>
20023386:	2200      	movs	r2, #0
20023388:	2102      	movs	r1, #2
2002338a:	4620      	mov	r0, r4
2002338c:	f7ff fe52 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
20023390:	4620      	mov	r0, r4
20023392:	f7ff fbfd 	bl	20022b90 <HAL_FLASH_IS_PROG_DONE>
20023396:	2800      	cmp	r0, #0
20023398:	d0f5      	beq.n	20023386 <HAL_FLASH_CLR_PROTECT+0x72>
2002339a:	bd70      	pop	{r4, r5, r6, pc}
2002339c:	2000      	movs	r0, #0
2002339e:	e7cf      	b.n	20023340 <HAL_FLASH_CLR_PROTECT+0x2c>
200233a0:	f7ff fba9 	bl	20022af6 <HAL_FLASH_WRITE_DLEN>
200233a4:	462a      	mov	r2, r5
200233a6:	2102      	movs	r1, #2
200233a8:	4620      	mov	r0, r4
200233aa:	f7ff fe43 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
200233ae:	2800      	cmp	r0, #0
200233b0:	d13e      	bne.n	20023430 <HAL_FLASH_CLR_PROTECT+0x11c>
200233b2:	4620      	mov	r0, r4
200233b4:	f7ff fbf5 	bl	20022ba2 <HAL_FLASH_READ32>
200233b8:	b2c6      	uxtb	r6, r0
200233ba:	2200      	movs	r2, #0
200233bc:	2114      	movs	r1, #20
200233be:	4620      	mov	r0, r4
200233c0:	f7ff fe38 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
200233c4:	b918      	cbnz	r0, 200233ce <HAL_FLASH_CLR_PROTECT+0xba>
200233c6:	4620      	mov	r0, r4
200233c8:	f7ff fbeb 	bl	20022ba2 <HAL_FLASH_READ32>
200233cc:	b2c5      	uxtb	r5, r0
200233ce:	68e3      	ldr	r3, [r4, #12]
200233d0:	79d9      	ldrb	r1, [r3, #7]
200233d2:	b109      	cbz	r1, 200233d8 <HAL_FLASH_CLR_PROTECT+0xc4>
200233d4:	ea26 0101 	bic.w	r1, r6, r1
200233d8:	2200      	movs	r2, #0
200233da:	4620      	mov	r0, r4
200233dc:	ea41 2505 	orr.w	r5, r1, r5, lsl #8
200233e0:	2115      	movs	r1, #21
200233e2:	f7ff fe27 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
200233e6:	4606      	mov	r6, r0
200233e8:	b120      	cbz	r0, 200233f4 <HAL_FLASH_CLR_PROTECT+0xe0>
200233ea:	2200      	movs	r2, #0
200233ec:	4620      	mov	r0, r4
200233ee:	4611      	mov	r1, r2
200233f0:	f7ff fe20 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
200233f4:	4629      	mov	r1, r5
200233f6:	4620      	mov	r0, r4
200233f8:	f7ff fb76 	bl	20022ae8 <HAL_FLASH_WRITE_WORD>
200233fc:	2102      	movs	r1, #2
200233fe:	4620      	mov	r0, r4
20023400:	f7ff fb79 	bl	20022af6 <HAL_FLASH_WRITE_DLEN>
20023404:	2200      	movs	r2, #0
20023406:	2103      	movs	r1, #3
20023408:	4620      	mov	r0, r4
2002340a:	f7ff fe13 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
2002340e:	2e00      	cmp	r6, #0
20023410:	d0c3      	beq.n	2002339a <HAL_FLASH_CLR_PROTECT+0x86>
20023412:	2101      	movs	r1, #1
20023414:	4620      	mov	r0, r4
20023416:	f7ff fb6e 	bl	20022af6 <HAL_FLASH_WRITE_DLEN>
2002341a:	2200      	movs	r2, #0
2002341c:	2102      	movs	r1, #2
2002341e:	4620      	mov	r0, r4
20023420:	f7ff fe08 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
20023424:	4620      	mov	r0, r4
20023426:	f7ff fbb3 	bl	20022b90 <HAL_FLASH_IS_PROG_DONE>
2002342a:	2800      	cmp	r0, #0
2002342c:	d0f5      	beq.n	2002341a <HAL_FLASH_CLR_PROTECT+0x106>
2002342e:	e7b4      	b.n	2002339a <HAL_FLASH_CLR_PROTECT+0x86>
20023430:	462e      	mov	r6, r5
20023432:	e7c2      	b.n	200233ba <HAL_FLASH_CLR_PROTECT+0xa6>

20023434 <HAL_QSPI_SET_CLK_INV>:
20023434:	b160      	cbz	r0, 20023450 <HAL_QSPI_SET_CLK_INV+0x1c>
20023436:	6800      	ldr	r0, [r0, #0]
20023438:	b150      	cbz	r0, 20023450 <HAL_QSPI_SET_CLK_INV+0x1c>
2002343a:	6d83      	ldr	r3, [r0, #88]	@ 0x58
2002343c:	0609      	lsls	r1, r1, #24
2002343e:	f023 7380 	bic.w	r3, r3, #16777216	@ 0x1000000
20023442:	f001 7180 	and.w	r1, r1, #16777216	@ 0x1000000
20023446:	f023 03ff 	bic.w	r3, r3, #255	@ 0xff
2002344a:	4311      	orrs	r1, r2
2002344c:	4319      	orrs	r1, r3
2002344e:	6581      	str	r1, [r0, #88]	@ 0x58
20023450:	4770      	bx	lr

20023452 <HAL_FLASH_RELEASE_DPD>:
20023452:	b538      	push	{r3, r4, r5, lr}
20023454:	4604      	mov	r4, r0
20023456:	b1d0      	cbz	r0, 2002348e <HAL_FLASH_RELEASE_DPD+0x3c>
20023458:	6803      	ldr	r3, [r0, #0]
2002345a:	21ab      	movs	r1, #171	@ 0xab
2002345c:	681d      	ldr	r5, [r3, #0]
2002345e:	f015 0501 	ands.w	r5, r5, #1
20023462:	bf02      	ittt	eq
20023464:	681a      	ldreq	r2, [r3, #0]
20023466:	f042 0201 	orreq.w	r2, r2, #1
2002346a:	601a      	streq	r2, [r3, #0]
2002346c:	6802      	ldr	r2, [r0, #0]
2002346e:	6a93      	ldr	r3, [r2, #40]	@ 0x28
20023470:	f36f 0315 	bfc	r3, #0, #22
20023474:	f043 0301 	orr.w	r3, r3, #1
20023478:	6293      	str	r3, [r2, #40]	@ 0x28
2002347a:	2200      	movs	r2, #0
2002347c:	f7ff fb60 	bl	20022b40 <HAL_FLASH_SET_CMD>
20023480:	b925      	cbnz	r5, 2002348c <HAL_FLASH_RELEASE_DPD+0x3a>
20023482:	6822      	ldr	r2, [r4, #0]
20023484:	6813      	ldr	r3, [r2, #0]
20023486:	f023 0301 	bic.w	r3, r3, #1
2002348a:	6013      	str	r3, [r2, #0]
2002348c:	bd38      	pop	{r3, r4, r5, pc}
2002348e:	2001      	movs	r0, #1
20023490:	e7fc      	b.n	2002348c <HAL_FLASH_RELEASE_DPD+0x3a>

20023492 <flash_handle_valid>:
20023492:	b118      	cbz	r0, 2002349c <flash_handle_valid+0xa>
20023494:	68c0      	ldr	r0, [r0, #12]
20023496:	3800      	subs	r0, #0
20023498:	bf18      	it	ne
2002349a:	2001      	movne	r0, #1
2002349c:	4770      	bx	lr

2002349e <HAL_GET_FLASH_MID>:
2002349e:	2000      	movs	r0, #0
200234a0:	4770      	bx	lr

200234a2 <HAL_FLASH_DMA_START>:
200234a2:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
200234a6:	4688      	mov	r8, r1
200234a8:	4699      	mov	r9, r3
200234aa:	4604      	mov	r4, r0
200234ac:	2800      	cmp	r0, #0
200234ae:	d045      	beq.n	2002353c <HAL_FLASH_DMA_START+0x9a>
200234b0:	6883      	ldr	r3, [r0, #8]
200234b2:	2b00      	cmp	r3, #0
200234b4:	d042      	beq.n	2002353c <HAL_FLASH_DMA_START+0x9a>
200234b6:	f1b9 0f00 	cmp.w	r9, #0
200234ba:	d03f      	beq.n	2002353c <HAL_FLASH_DMA_START+0x9a>
200234bc:	6801      	ldr	r1, [r0, #0]
200234be:	680f      	ldr	r7, [r1, #0]
200234c0:	b332      	cbz	r2, 20023510 <HAL_FLASH_DMA_START+0x6e>
200234c2:	2210      	movs	r2, #16
200234c4:	609a      	str	r2, [r3, #8]
200234c6:	2300      	movs	r3, #0
200234c8:	6882      	ldr	r2, [r0, #8]
200234ca:	464e      	mov	r6, r9
200234cc:	6153      	str	r3, [r2, #20]
200234ce:	6882      	ldr	r2, [r0, #8]
200234d0:	6193      	str	r3, [r2, #24]
200234d2:	6882      	ldr	r2, [r0, #8]
200234d4:	60d3      	str	r3, [r2, #12]
200234d6:	2280      	movs	r2, #128	@ 0x80
200234d8:	6883      	ldr	r3, [r0, #8]
200234da:	611a      	str	r2, [r3, #16]
200234dc:	6805      	ldr	r5, [r0, #0]
200234de:	3504      	adds	r5, #4
200234e0:	68a0      	ldr	r0, [r4, #8]
200234e2:	f7ff f84b 	bl	2002257c <HAL_DMA_DeInit>
200234e6:	bb50      	cbnz	r0, 2002353e <HAL_FLASH_DMA_START+0x9c>
200234e8:	68a0      	ldr	r0, [r4, #8]
200234ea:	f7fe ffe3 	bl	200224b4 <HAL_DMA_Init>
200234ee:	bb30      	cbnz	r0, 2002353e <HAL_FLASH_DMA_START+0x9c>
200234f0:	6823      	ldr	r3, [r4, #0]
200234f2:	f047 0720 	orr.w	r7, r7, #32
200234f6:	601f      	str	r7, [r3, #0]
200234f8:	6822      	ldr	r2, [r4, #0]
200234fa:	f109 33ff 	add.w	r3, r9, #4294967295	@ 0xffffffff
200234fe:	6253      	str	r3, [r2, #36]	@ 0x24
20023500:	4641      	mov	r1, r8
20023502:	4633      	mov	r3, r6
20023504:	462a      	mov	r2, r5
20023506:	68a0      	ldr	r0, [r4, #8]
20023508:	e8bd 47f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
2002350c:	f7ff b994 	b.w	20022838 <HAL_DMA_Start>
20023510:	f44f 7100 	mov.w	r1, #512	@ 0x200
20023514:	609a      	str	r2, [r3, #8]
20023516:	6883      	ldr	r3, [r0, #8]
20023518:	f109 0603 	add.w	r6, r9, #3
2002351c:	6159      	str	r1, [r3, #20]
2002351e:	f44f 6100 	mov.w	r1, #2048	@ 0x800
20023522:	6883      	ldr	r3, [r0, #8]
20023524:	4645      	mov	r5, r8
20023526:	6199      	str	r1, [r3, #24]
20023528:	6883      	ldr	r3, [r0, #8]
2002352a:	08b6      	lsrs	r6, r6, #2
2002352c:	60da      	str	r2, [r3, #12]
2002352e:	2280      	movs	r2, #128	@ 0x80
20023530:	6883      	ldr	r3, [r0, #8]
20023532:	611a      	str	r2, [r3, #16]
20023534:	6803      	ldr	r3, [r0, #0]
20023536:	f103 0804 	add.w	r8, r3, #4
2002353a:	e7d1      	b.n	200234e0 <HAL_FLASH_DMA_START+0x3e>
2002353c:	2001      	movs	r0, #1
2002353e:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}

20023542 <HAL_FLASH_DMA_WAIT_DONE>:
20023542:	b510      	push	{r4, lr}
20023544:	460a      	mov	r2, r1
20023546:	4604      	mov	r4, r0
20023548:	b170      	cbz	r0, 20023568 <HAL_FLASH_DMA_WAIT_DONE+0x26>
2002354a:	6880      	ldr	r0, [r0, #8]
2002354c:	b160      	cbz	r0, 20023568 <HAL_FLASH_DMA_WAIT_DONE+0x26>
2002354e:	6ae1      	ldr	r1, [r4, #44]	@ 0x2c
20023550:	b111      	cbz	r1, 20023558 <HAL_FLASH_DMA_WAIT_DONE+0x16>
20023552:	f04f 32ff 	mov.w	r2, #4294967295	@ 0xffffffff
20023556:	2100      	movs	r1, #0
20023558:	f7ff f870 	bl	2002263c <HAL_DMA_PollForTransfer>
2002355c:	6822      	ldr	r2, [r4, #0]
2002355e:	6813      	ldr	r3, [r2, #0]
20023560:	f023 0320 	bic.w	r3, r3, #32
20023564:	6013      	str	r3, [r2, #0]
20023566:	bd10      	pop	{r4, pc}
20023568:	2001      	movs	r0, #1
2002356a:	e7fc      	b.n	20023566 <HAL_FLASH_DMA_WAIT_DONE+0x24>

2002356c <HAL_FLASH_ALIAS_CFG>:
2002356c:	b538      	push	{r3, r4, r5, lr}
2002356e:	461d      	mov	r5, r3
20023570:	4604      	mov	r4, r0
20023572:	b158      	cbz	r0, 2002358c <HAL_FLASH_ALIAS_CFG+0x20>
20023574:	6903      	ldr	r3, [r0, #16]
20023576:	428b      	cmp	r3, r1
20023578:	bf98      	it	ls
2002357a:	1ac9      	subls	r1, r1, r3
2002357c:	f7ff fb68 	bl	20022c50 <HAL_FLASH_SET_ALIAS_RANGE>
20023580:	4629      	mov	r1, r5
20023582:	4620      	mov	r0, r4
20023584:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
20023588:	f7ff bb74 	b.w	20022c74 <HAL_FLASH_SET_ALIAS_OFFSET>
2002358c:	bd38      	pop	{r3, r4, r5, pc}

2002358e <HAL_FLASH_NONCE_CFG>:
2002358e:	b570      	push	{r4, r5, r6, lr}
20023590:	460c      	mov	r4, r1
20023592:	4615      	mov	r5, r2
20023594:	4619      	mov	r1, r3
20023596:	4606      	mov	r6, r0
20023598:	b180      	cbz	r0, 200235bc <HAL_FLASH_NONCE_CFG+0x2e>
2002359a:	b17b      	cbz	r3, 200235bc <HAL_FLASH_NONCE_CFG+0x2e>
2002359c:	f7ff fb86 	bl	20022cac <HAL_FLASH_SET_NONCE>
200235a0:	6933      	ldr	r3, [r6, #16]
200235a2:	4630      	mov	r0, r6
200235a4:	42a3      	cmp	r3, r4
200235a6:	bf98      	it	ls
200235a8:	1ae4      	subls	r4, r4, r3
200235aa:	42ab      	cmp	r3, r5
200235ac:	bf98      	it	ls
200235ae:	1aed      	subls	r5, r5, r3
200235b0:	462a      	mov	r2, r5
200235b2:	4621      	mov	r1, r4
200235b4:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
200235b8:	f7ff bb66 	b.w	20022c88 <HAL_FLASH_SET_CTR>
200235bc:	bd70      	pop	{r4, r5, r6, pc}

200235be <HAL_FLASH_AES_CFG>:
200235be:	b510      	push	{r4, lr}
200235c0:	4604      	mov	r4, r0
200235c2:	b148      	cbz	r0, 200235d8 <HAL_FLASH_AES_CFG+0x1a>
200235c4:	b101      	cbz	r1, 200235c8 <HAL_FLASH_AES_CFG+0xa>
200235c6:	2101      	movs	r1, #1
200235c8:	f7ff fb7e 	bl	20022cc8 <HAL_FLASH_SET_AES>
200235cc:	4620      	mov	r0, r4
200235ce:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
200235d2:	2101      	movs	r1, #1
200235d4:	f7ff bb87 	b.w	20022ce6 <HAL_FLASH_ENABLE_AES>
200235d8:	bd10      	pop	{r4, pc}

200235da <nand_read_id>:
200235da:	b510      	push	{r4, lr}
200235dc:	460b      	mov	r3, r1
200235de:	4604      	mov	r4, r0
200235e0:	b086      	sub	sp, #24
200235e2:	b320      	cbz	r0, 2002362e <nand_read_id+0x54>
200235e4:	2908      	cmp	r1, #8
200235e6:	f04f 0100 	mov.w	r1, #0
200235ea:	f04f 0201 	mov.w	r2, #1
200235ee:	bf83      	ittte	hi
200235f0:	460b      	movhi	r3, r1
200235f2:	e9cd 1202 	strdhi	r1, r2, [sp, #8]
200235f6:	e9cd 1100 	strdhi	r1, r1, [sp]
200235fa:	e9cd 1102 	strdls	r1, r1, [sp, #8]
200235fe:	bf8e      	itee	hi
20023600:	4619      	movhi	r1, r3
20023602:	e9cd 1100 	strdls	r1, r1, [sp]
20023606:	b25b      	sxtbls	r3, r3
20023608:	9204      	str	r2, [sp, #16]
2002360a:	f7ff fade 	bl	20022bca <HAL_FLASH_MANUAL_CMD>
2002360e:	2103      	movs	r1, #3
20023610:	4620      	mov	r0, r4
20023612:	f7ff fa70 	bl	20022af6 <HAL_FLASH_WRITE_DLEN>
20023616:	2200      	movs	r2, #0
20023618:	219f      	movs	r1, #159	@ 0x9f
2002361a:	4620      	mov	r0, r4
2002361c:	f7ff fa90 	bl	20022b40 <HAL_FLASH_SET_CMD>
20023620:	4620      	mov	r0, r4
20023622:	f7ff fabe 	bl	20022ba2 <HAL_FLASH_READ32>
20023626:	f020 407f 	bic.w	r0, r0, #4278190080	@ 0xff000000
2002362a:	b006      	add	sp, #24
2002362c:	bd10      	pop	{r4, pc}
2002362e:	20ff      	movs	r0, #255	@ 0xff
20023630:	e7fb      	b.n	2002362a <nand_read_id+0x50>

20023632 <HAL_NAND_CONF_ECC>:
20023632:	b538      	push	{r3, r4, r5, lr}
20023634:	460d      	mov	r5, r1
20023636:	4604      	mov	r4, r0
20023638:	b398      	cbz	r0, 200236a2 <HAL_NAND_CONF_ECC+0x70>
2002363a:	68c3      	ldr	r3, [r0, #12]
2002363c:	b38b      	cbz	r3, 200236a2 <HAL_NAND_CONF_ECC+0x70>
2002363e:	799a      	ldrb	r2, [r3, #6]
20023640:	b392      	cbz	r2, 200236a8 <HAL_NAND_CONF_ECC+0x76>
20023642:	7a9b      	ldrb	r3, [r3, #10]
20023644:	b383      	cbz	r3, 200236a8 <HAL_NAND_CONF_ECC+0x76>
20023646:	2101      	movs	r1, #1
20023648:	f7ff fa55 	bl	20022af6 <HAL_FLASH_WRITE_DLEN>
2002364c:	68e3      	ldr	r3, [r4, #12]
2002364e:	2102      	movs	r1, #2
20023650:	799a      	ldrb	r2, [r3, #6]
20023652:	4620      	mov	r0, r4
20023654:	f7ff fcee 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
20023658:	4620      	mov	r0, r4
2002365a:	f7ff faa2 	bl	20022ba2 <HAL_FLASH_READ32>
2002365e:	68e3      	ldr	r3, [r4, #12]
20023660:	7a9b      	ldrb	r3, [r3, #10]
20023662:	b1dd      	cbz	r5, 2002369c <HAL_NAND_CONF_ECC+0x6a>
20023664:	ea43 0100 	orr.w	r1, r3, r0
20023668:	4620      	mov	r0, r4
2002366a:	f7ff fa3d 	bl	20022ae8 <HAL_FLASH_WRITE_WORD>
2002366e:	2101      	movs	r1, #1
20023670:	4620      	mov	r0, r4
20023672:	f7ff fa40 	bl	20022af6 <HAL_FLASH_WRITE_DLEN>
20023676:	68e3      	ldr	r3, [r4, #12]
20023678:	2103      	movs	r1, #3
2002367a:	799a      	ldrb	r2, [r3, #6]
2002367c:	4620      	mov	r0, r4
2002367e:	f7ff fcd9 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
20023682:	68e3      	ldr	r3, [r4, #12]
20023684:	f884 5025 	strb.w	r5, [r4, #37]	@ 0x25
20023688:	2102      	movs	r1, #2
2002368a:	799a      	ldrb	r2, [r3, #6]
2002368c:	4620      	mov	r0, r4
2002368e:	f7ff fcd1 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
20023692:	4620      	mov	r0, r4
20023694:	f7ff fa85 	bl	20022ba2 <HAL_FLASH_READ32>
20023698:	2000      	movs	r0, #0
2002369a:	bd38      	pop	{r3, r4, r5, pc}
2002369c:	ea20 0103 	bic.w	r1, r0, r3
200236a0:	e7e2      	b.n	20023668 <HAL_NAND_CONF_ECC+0x36>
200236a2:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
200236a6:	e7f8      	b.n	2002369a <HAL_NAND_CONF_ECC+0x68>
200236a8:	f06f 0001 	mvn.w	r0, #1
200236ac:	e7f5      	b.n	2002369a <HAL_NAND_CONF_ECC+0x68>

200236ae <HAL_NAND_GET_ECC_STATUS>:
200236ae:	b510      	push	{r4, lr}
200236b0:	4604      	mov	r4, r0
200236b2:	b320      	cbz	r0, 200236fe <HAL_NAND_GET_ECC_STATUS+0x50>
200236b4:	68c2      	ldr	r2, [r0, #12]
200236b6:	b31a      	cbz	r2, 20023700 <HAL_NAND_GET_ECC_STATUS+0x52>
200236b8:	7913      	ldrb	r3, [r2, #4]
200236ba:	b31b      	cbz	r3, 20023704 <HAL_NAND_GET_ECC_STATUS+0x56>
200236bc:	79d3      	ldrb	r3, [r2, #7]
200236be:	b30b      	cbz	r3, 20023704 <HAL_NAND_GET_ECC_STATUS+0x56>
200236c0:	2101      	movs	r1, #1
200236c2:	f7ff fa18 	bl	20022af6 <HAL_FLASH_WRITE_DLEN>
200236c6:	68e3      	ldr	r3, [r4, #12]
200236c8:	2102      	movs	r1, #2
200236ca:	791a      	ldrb	r2, [r3, #4]
200236cc:	4620      	mov	r0, r4
200236ce:	f7ff fcb1 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
200236d2:	4620      	mov	r0, r4
200236d4:	f7ff fa65 	bl	20022ba2 <HAL_FLASH_READ32>
200236d8:	f894 2024 	ldrb.w	r2, [r4, #36]	@ 0x24
200236dc:	2a3f      	cmp	r2, #63	@ 0x3f
200236de:	ea4f 1312 	mov.w	r3, r2, lsr #4
200236e2:	d804      	bhi.n	200236ee <HAL_NAND_GET_ECC_STATUS+0x40>
200236e4:	2b01      	cmp	r3, #1
200236e6:	d808      	bhi.n	200236fa <HAL_NAND_GET_ECC_STATUS+0x4c>
200236e8:	f000 0030 	and.w	r0, r0, #48	@ 0x30
200236ec:	e007      	b.n	200236fe <HAL_NAND_GET_ECC_STATUS+0x50>
200236ee:	3b04      	subs	r3, #4
200236f0:	2b01      	cmp	r3, #1
200236f2:	d8f9      	bhi.n	200236e8 <HAL_NAND_GET_ECC_STATUS+0x3a>
200236f4:	f000 00f0 	and.w	r0, r0, #240	@ 0xf0
200236f8:	e001      	b.n	200236fe <HAL_NAND_GET_ECC_STATUS+0x50>
200236fa:	f000 0070 	and.w	r0, r0, #112	@ 0x70
200236fe:	bd10      	pop	{r4, pc}
20023700:	4610      	mov	r0, r2
20023702:	e7fc      	b.n	200236fe <HAL_NAND_GET_ECC_STATUS+0x50>
20023704:	4618      	mov	r0, r3
20023706:	e7fa      	b.n	200236fe <HAL_NAND_GET_ECC_STATUS+0x50>

20023708 <HAL_NAND_CHECK_ECC>:
20023708:	4603      	mov	r3, r0
2002370a:	1108      	asrs	r0, r1, #4
2002370c:	b172      	cbz	r2, 2002372c <HAL_NAND_CHECK_ECC+0x24>
2002370e:	2b07      	cmp	r3, #7
20023710:	d80c      	bhi.n	2002372c <HAL_NAND_CHECK_ECC+0x24>
20023712:	e8df f003 	tbb	[pc, r3]
20023716:	0d04      	.short	0x0d04
20023718:	3f352e18 	.word	0x3f352e18
2002371c:	4c47      	.short	0x4c47
2002371e:	b128      	cbz	r0, 2002372c <HAL_NAND_CHECK_ECC+0x24>
20023720:	2801      	cmp	r0, #1
20023722:	6813      	ldr	r3, [r2, #0]
20023724:	d10a      	bne.n	2002373c <HAL_NAND_CHECK_ECC+0x34>
20023726:	f043 0301 	orr.w	r3, r3, #1
2002372a:	6013      	str	r3, [r2, #0]
2002372c:	2000      	movs	r0, #0
2002372e:	4770      	bx	lr
20023730:	f020 0302 	bic.w	r3, r0, #2
20023734:	2b01      	cmp	r3, #1
20023736:	d003      	beq.n	20023740 <HAL_NAND_CHECK_ECC+0x38>
20023738:	b1d0      	cbz	r0, 20023770 <HAL_NAND_CHECK_ECC+0x68>
2002373a:	6813      	ldr	r3, [r2, #0]
2002373c:	4303      	orrs	r3, r0
2002373e:	e016      	b.n	2002376e <HAL_NAND_CHECK_ECC+0x66>
20023740:	6813      	ldr	r3, [r2, #0]
20023742:	4303      	orrs	r3, r0
20023744:	e7f1      	b.n	2002372a <HAL_NAND_CHECK_ECC+0x22>
20023746:	2805      	cmp	r0, #5
20023748:	d8f7      	bhi.n	2002373a <HAL_NAND_CHECK_ECC+0x32>
2002374a:	a301      	add	r3, pc, #4	@ (adr r3, 20023750 <HAL_NAND_CHECK_ECC+0x48>)
2002374c:	f853 f020 	ldr.w	pc, [r3, r0, lsl #2]
20023750:	2002372d 	.word	0x2002372d
20023754:	20023741 	.word	0x20023741
20023758:	20023769 	.word	0x20023769
2002375c:	20023741 	.word	0x20023741
20023760:	2002373b 	.word	0x2002373b
20023764:	20023741 	.word	0x20023741
20023768:	6813      	ldr	r3, [r2, #0]
2002376a:	f043 0302 	orr.w	r3, r3, #2
2002376e:	6013      	str	r3, [r2, #0]
20023770:	4770      	bx	lr
20023772:	2800      	cmp	r0, #0
20023774:	d0da      	beq.n	2002372c <HAL_NAND_CHECK_ECC+0x24>
20023776:	1e43      	subs	r3, r0, #1
20023778:	2b05      	cmp	r3, #5
2002377a:	6813      	ldr	r3, [r2, #0]
2002377c:	d9e1      	bls.n	20023742 <HAL_NAND_CHECK_ECC+0x3a>
2002377e:	e7dd      	b.n	2002373c <HAL_NAND_CHECK_ECC+0x34>
20023780:	07c3      	lsls	r3, r0, #31
20023782:	f000 0103 	and.w	r1, r0, #3
20023786:	d402      	bmi.n	2002378e <HAL_NAND_CHECK_ECC+0x86>
20023788:	2900      	cmp	r1, #0
2002378a:	d0cf      	beq.n	2002372c <HAL_NAND_CHECK_ECC+0x24>
2002378c:	e7d5      	b.n	2002373a <HAL_NAND_CHECK_ECC+0x32>
2002378e:	6813      	ldr	r3, [r2, #0]
20023790:	430b      	orrs	r3, r1
20023792:	e7ca      	b.n	2002372a <HAL_NAND_CHECK_ECC+0x22>
20023794:	2800      	cmp	r0, #0
20023796:	d0c9      	beq.n	2002372c <HAL_NAND_CHECK_ECC+0x24>
20023798:	6813      	ldr	r3, [r2, #0]
2002379a:	2808      	cmp	r0, #8
2002379c:	ea43 0300 	orr.w	r3, r3, r0
200237a0:	dce5      	bgt.n	2002376e <HAL_NAND_CHECK_ECC+0x66>
200237a2:	e7c2      	b.n	2002372a <HAL_NAND_CHECK_ECC+0x22>
200237a4:	2800      	cmp	r0, #0
200237a6:	d0c1      	beq.n	2002372c <HAL_NAND_CHECK_ECC+0x24>
200237a8:	1e43      	subs	r3, r0, #1
200237aa:	2b01      	cmp	r3, #1
200237ac:	e7e5      	b.n	2002377a <HAL_NAND_CHECK_ECC+0x72>
200237ae:	2800      	cmp	r0, #0
200237b0:	d0bc      	beq.n	2002372c <HAL_NAND_CHECK_ECC+0x24>
200237b2:	1e43      	subs	r3, r0, #1
200237b4:	2b02      	cmp	r3, #2
200237b6:	e7e0      	b.n	2002377a <HAL_NAND_CHECK_ECC+0x72>

200237b8 <HAL_NAND_GET_ECC_RESULT>:
200237b8:	b510      	push	{r4, lr}
200237ba:	f890 3025 	ldrb.w	r3, [r0, #37]	@ 0x25
200237be:	4604      	mov	r4, r0
200237c0:	b183      	cbz	r3, 200237e4 <HAL_NAND_GET_ECC_RESULT+0x2c>
200237c2:	f7ff ff74 	bl	200236ae <HAL_NAND_GET_ECC_STATUS>
200237c6:	4601      	mov	r1, r0
200237c8:	b160      	cbz	r0, 200237e4 <HAL_NAND_GET_ECC_RESULT+0x2c>
200237ca:	4622      	mov	r2, r4
200237cc:	6863      	ldr	r3, [r4, #4]
200237ce:	f443 4300 	orr.w	r3, r3, #32768	@ 0x8000
200237d2:	f842 3f04 	str.w	r3, [r2, #4]!
200237d6:	f894 0024 	ldrb.w	r0, [r4, #36]	@ 0x24
200237da:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
200237de:	0900      	lsrs	r0, r0, #4
200237e0:	f7ff bf92 	b.w	20023708 <HAL_NAND_CHECK_ECC>
200237e4:	2000      	movs	r0, #0
200237e6:	bd10      	pop	{r4, pc}

200237e8 <HAL_NAND_EN_QUAL>:
200237e8:	b538      	push	{r3, r4, r5, lr}
200237ea:	460d      	mov	r5, r1
200237ec:	4604      	mov	r4, r0
200237ee:	b348      	cbz	r0, 20023844 <HAL_NAND_EN_QUAL+0x5c>
200237f0:	68c3      	ldr	r3, [r0, #12]
200237f2:	b33b      	cbz	r3, 20023844 <HAL_NAND_EN_QUAL+0x5c>
200237f4:	799a      	ldrb	r2, [r3, #6]
200237f6:	b10a      	cbz	r2, 200237fc <HAL_NAND_EN_QUAL+0x14>
200237f8:	7a1b      	ldrb	r3, [r3, #8]
200237fa:	b90b      	cbnz	r3, 20023800 <HAL_NAND_EN_QUAL+0x18>
200237fc:	2000      	movs	r0, #0
200237fe:	bd38      	pop	{r3, r4, r5, pc}
20023800:	2101      	movs	r1, #1
20023802:	f7ff f978 	bl	20022af6 <HAL_FLASH_WRITE_DLEN>
20023806:	68e3      	ldr	r3, [r4, #12]
20023808:	2102      	movs	r1, #2
2002380a:	799a      	ldrb	r2, [r3, #6]
2002380c:	4620      	mov	r0, r4
2002380e:	f7ff fc11 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
20023812:	4620      	mov	r0, r4
20023814:	f7ff f9c5 	bl	20022ba2 <HAL_FLASH_READ32>
20023818:	68e3      	ldr	r3, [r4, #12]
2002381a:	7a1b      	ldrb	r3, [r3, #8]
2002381c:	b17d      	cbz	r5, 2002383e <HAL_NAND_EN_QUAL+0x56>
2002381e:	ea43 0100 	orr.w	r1, r3, r0
20023822:	4620      	mov	r0, r4
20023824:	f7ff f960 	bl	20022ae8 <HAL_FLASH_WRITE_WORD>
20023828:	2101      	movs	r1, #1
2002382a:	4620      	mov	r0, r4
2002382c:	f7ff f963 	bl	20022af6 <HAL_FLASH_WRITE_DLEN>
20023830:	68e3      	ldr	r3, [r4, #12]
20023832:	2103      	movs	r1, #3
20023834:	4620      	mov	r0, r4
20023836:	799a      	ldrb	r2, [r3, #6]
20023838:	f7ff fbfc 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
2002383c:	e7de      	b.n	200237fc <HAL_NAND_EN_QUAL+0x14>
2002383e:	ea20 0103 	bic.w	r1, r0, r3
20023842:	e7ee      	b.n	20023822 <HAL_NAND_EN_QUAL+0x3a>
20023844:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
20023848:	e7d9      	b.n	200237fe <HAL_NAND_EN_QUAL+0x16>

2002384a <nand_clear_status>:
2002384a:	b510      	push	{r4, lr}
2002384c:	4604      	mov	r4, r0
2002384e:	2101      	movs	r1, #1
20023850:	f7ff f951 	bl	20022af6 <HAL_FLASH_WRITE_DLEN>
20023854:	2102      	movs	r1, #2
20023856:	4620      	mov	r0, r4
20023858:	f7ff f946 	bl	20022ae8 <HAL_FLASH_WRITE_WORD>
2002385c:	68e3      	ldr	r3, [r4, #12]
2002385e:	2103      	movs	r1, #3
20023860:	795a      	ldrb	r2, [r3, #5]
20023862:	4620      	mov	r0, r4
20023864:	f7ff fbe6 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
20023868:	2100      	movs	r1, #0
2002386a:	4620      	mov	r0, r4
2002386c:	f7ff f93c 	bl	20022ae8 <HAL_FLASH_WRITE_WORD>
20023870:	68e3      	ldr	r3, [r4, #12]
20023872:	2103      	movs	r1, #3
20023874:	4620      	mov	r0, r4
20023876:	795a      	ldrb	r2, [r3, #5]
20023878:	f7ff fbdc 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
2002387c:	2000      	movs	r0, #0
2002387e:	bd10      	pop	{r4, pc}

20023880 <HAL_NAND_PAGE_SIZE>:
20023880:	b140      	cbz	r0, 20023894 <HAL_NAND_PAGE_SIZE+0x14>
20023882:	f890 3024 	ldrb.w	r3, [r0, #36]	@ 0x24
20023886:	f013 0f01 	tst.w	r3, #1
2002388a:	bf14      	ite	ne
2002388c:	f44f 5080 	movne.w	r0, #4096	@ 0x1000
20023890:	f44f 6000 	moveq.w	r0, #2048	@ 0x800
20023894:	4770      	bx	lr

20023896 <HAL_NAND_READ_WITHOOB>:
20023896:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
2002389a:	b085      	sub	sp, #20
2002389c:	460e      	mov	r6, r1
2002389e:	4691      	mov	r9, r2
200238a0:	461d      	mov	r5, r3
200238a2:	4604      	mov	r4, r0
200238a4:	9f0f      	ldr	r7, [sp, #60]	@ 0x3c
200238a6:	b1b0      	cbz	r0, 200238d6 <HAL_NAND_READ_WITHOOB+0x40>
200238a8:	68c3      	ldr	r3, [r0, #12]
200238aa:	b1a3      	cbz	r3, 200238d6 <HAL_NAND_READ_WITHOOB+0x40>
200238ac:	69c3      	ldr	r3, [r0, #28]
200238ae:	b193      	cbz	r3, 200238d6 <HAL_NAND_READ_WITHOOB+0x40>
200238b0:	2f80      	cmp	r7, #128	@ 0x80
200238b2:	d810      	bhi.n	200238d6 <HAL_NAND_READ_WITHOOB+0x40>
200238b4:	f7ff ffe4 	bl	20023880 <HAL_NAND_PAGE_SIZE>
200238b8:	f100 3aff 	add.w	sl, r0, #4294967295	@ 0xffffffff
200238bc:	ea0a 0a01 	and.w	sl, sl, r1
200238c0:	eb0a 0305 	add.w	r3, sl, r5
200238c4:	4283      	cmp	r3, r0
200238c6:	4680      	mov	r8, r0
200238c8:	d907      	bls.n	200238da <HAL_NAND_READ_WITHOOB+0x44>
200238ca:	2002      	movs	r0, #2
200238cc:	6060      	str	r0, [r4, #4]
200238ce:	2000      	movs	r0, #0
200238d0:	b005      	add	sp, #20
200238d2:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
200238d6:	2001      	movs	r0, #1
200238d8:	e7f8      	b.n	200238cc <HAL_NAND_READ_WITHOOB+0x36>
200238da:	2300      	movs	r3, #0
200238dc:	6063      	str	r3, [r4, #4]
200238de:	6923      	ldr	r3, [r4, #16]
200238e0:	f04f 0b00 	mov.w	fp, #0
200238e4:	428b      	cmp	r3, r1
200238e6:	bf98      	it	ls
200238e8:	1ace      	subls	r6, r1, r3
200238ea:	fbb6 f2f0 	udiv	r2, r6, r0
200238ee:	2104      	movs	r1, #4
200238f0:	4620      	mov	r0, r4
200238f2:	f7ff fb9f 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
200238f6:	2014      	movs	r0, #20
200238f8:	f7fe fad6 	bl	20021ea8 <HAL_Delay_us_>
200238fc:	2101      	movs	r1, #1
200238fe:	4620      	mov	r0, r4
20023900:	f7ff f8f9 	bl	20022af6 <HAL_FLASH_WRITE_DLEN>
20023904:	2005      	movs	r0, #5
20023906:	f7fe facf 	bl	20021ea8 <HAL_Delay_us_>
2002390a:	68e2      	ldr	r2, [r4, #12]
2002390c:	2102      	movs	r1, #2
2002390e:	7912      	ldrb	r2, [r2, #4]
20023910:	4620      	mov	r0, r4
20023912:	f7ff fb8f 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
20023916:	4620      	mov	r0, r4
20023918:	f7ff f943 	bl	20022ba2 <HAL_FLASH_READ32>
2002391c:	07c1      	lsls	r1, r0, #31
2002391e:	d4f1      	bmi.n	20023904 <HAL_NAND_READ_WITHOOB+0x6e>
20023920:	f1bb 0f00 	cmp.w	fp, #0
20023924:	d102      	bne.n	2002392c <HAL_NAND_READ_WITHOOB+0x96>
20023926:	f04f 0b01 	mov.w	fp, #1
2002392a:	e7eb      	b.n	20023904 <HAL_NAND_READ_WITHOOB+0x6e>
2002392c:	4620      	mov	r0, r4
2002392e:	f7ff ff43 	bl	200237b8 <HAL_NAND_GET_ECC_RESULT>
20023932:	b110      	cbz	r0, 2002393a <HAL_NAND_READ_WITHOOB+0xa4>
20023934:	f440 4000 	orr.w	r0, r0, #32768	@ 0x8000
20023938:	e7c8      	b.n	200238cc <HAL_NAND_READ_WITHOOB+0x36>
2002393a:	f894 2020 	ldrb.w	r2, [r4, #32]
2002393e:	68e3      	ldr	r3, [r4, #12]
20023940:	bbb2      	cbnz	r2, 200239b0 <HAL_NAND_READ_WITHOOB+0x11a>
20023942:	f893 1046 	ldrb.w	r1, [r3, #70]	@ 0x46
20023946:	4620      	mov	r0, r4
20023948:	f7ff f87d 	bl	20022a46 <HAL_FLASH_SET_AHB_RCMD>
2002394c:	68e0      	ldr	r0, [r4, #12]
2002394e:	f990 c04e 	ldrsb.w	ip, [r0, #78]	@ 0x4e
20023952:	f990 304a 	ldrsb.w	r3, [r0, #74]	@ 0x4a
20023956:	f990 2049 	ldrsb.w	r2, [r0, #73]	@ 0x49
2002395a:	f990 1048 	ldrsb.w	r1, [r0, #72]	@ 0x48
2002395e:	f8cd c00c 	str.w	ip, [sp, #12]
20023962:	f990 c04d 	ldrsb.w	ip, [r0, #77]	@ 0x4d
20023966:	f8cd c008 	str.w	ip, [sp, #8]
2002396a:	f990 c04c 	ldrsb.w	ip, [r0, #76]	@ 0x4c
2002396e:	f8cd c004 	str.w	ip, [sp, #4]
20023972:	f990 004b 	ldrsb.w	r0, [r0, #75]	@ 0x4b
20023976:	9000      	str	r0, [sp, #0]
20023978:	4620      	mov	r0, r4
2002397a:	f7ff f86f 	bl	20022a5c <HAL_FLASH_CFG_AHB_RCMD>
2002397e:	03b2      	lsls	r2, r6, #14
20023980:	f8d4 b010 	ldr.w	fp, [r4, #16]
20023984:	d504      	bpl.n	20023990 <HAL_NAND_READ_WITHOOB+0xfa>
20023986:	f894 2027 	ldrb.w	r2, [r4, #39]	@ 0x27
2002398a:	b10a      	cbz	r2, 20023990 <HAL_NAND_READ_WITHOOB+0xfa>
2002398c:	f44b 5b80 	orr.w	fp, fp, #4096	@ 0x1000
20023990:	ea49 0205 	orr.w	r2, r9, r5
20023994:	ea42 020a 	orr.w	r2, r2, sl
20023998:	0793      	lsls	r3, r2, #30
2002399a:	d102      	bne.n	200239a2 <HAL_NAND_READ_WITHOOB+0x10c>
2002399c:	1e6a      	subs	r2, r5, #1
2002399e:	2afe      	cmp	r2, #254	@ 0xfe
200239a0:	d821      	bhi.n	200239e6 <HAL_NAND_READ_WITHOOB+0x150>
200239a2:	462a      	mov	r2, r5
200239a4:	4648      	mov	r0, r9
200239a6:	eb0b 010a 	add.w	r1, fp, sl
200239aa:	f006 ff65 	bl	2002a878 <memcpy>
200239ae:	e01d      	b.n	200239ec <HAL_NAND_READ_WITHOOB+0x156>
200239b0:	f893 106a 	ldrb.w	r1, [r3, #106]	@ 0x6a
200239b4:	4620      	mov	r0, r4
200239b6:	f7ff f846 	bl	20022a46 <HAL_FLASH_SET_AHB_RCMD>
200239ba:	68e0      	ldr	r0, [r4, #12]
200239bc:	f990 c072 	ldrsb.w	ip, [r0, #114]	@ 0x72
200239c0:	f990 306e 	ldrsb.w	r3, [r0, #110]	@ 0x6e
200239c4:	f990 206d 	ldrsb.w	r2, [r0, #109]	@ 0x6d
200239c8:	f990 106c 	ldrsb.w	r1, [r0, #108]	@ 0x6c
200239cc:	f8cd c00c 	str.w	ip, [sp, #12]
200239d0:	f990 c071 	ldrsb.w	ip, [r0, #113]	@ 0x71
200239d4:	f8cd c008 	str.w	ip, [sp, #8]
200239d8:	f990 c070 	ldrsb.w	ip, [r0, #112]	@ 0x70
200239dc:	f8cd c004 	str.w	ip, [sp, #4]
200239e0:	f990 006f 	ldrsb.w	r0, [r0, #111]	@ 0x6f
200239e4:	e7c7      	b.n	20023976 <HAL_NAND_READ_WITHOOB+0xe0>
200239e6:	f1b9 0f00 	cmp.w	r9, #0
200239ea:	d1da      	bne.n	200239a2 <HAL_NAND_READ_WITHOOB+0x10c>
200239ec:	9b0e      	ldr	r3, [sp, #56]	@ 0x38
200239ee:	b12b      	cbz	r3, 200239fc <HAL_NAND_READ_WITHOOB+0x166>
200239f0:	463a      	mov	r2, r7
200239f2:	4618      	mov	r0, r3
200239f4:	eb0b 0108 	add.w	r1, fp, r8
200239f8:	f006 ff3e 	bl	2002a878 <memcpy>
200239fc:	1978      	adds	r0, r7, r5
200239fe:	e767      	b.n	200238d0 <HAL_NAND_READ_WITHOOB+0x3a>

20023a00 <HAL_NAND_BLOCK_SIZE>:
20023a00:	b508      	push	{r3, lr}
20023a02:	4602      	mov	r2, r0
20023a04:	f7ff ff3c 	bl	20023880 <HAL_NAND_PAGE_SIZE>
20023a08:	b128      	cbz	r0, 20023a16 <HAL_NAND_BLOCK_SIZE+0x16>
20023a0a:	f892 3024 	ldrb.w	r3, [r2, #36]	@ 0x24
20023a0e:	079b      	lsls	r3, r3, #30
20023a10:	bf4c      	ite	mi
20023a12:	01c0      	lslmi	r0, r0, #7
20023a14:	0180      	lslpl	r0, r0, #6
20023a16:	bd08      	pop	{r3, pc}

20023a18 <HAL_NAND_GET_BADBLK>:
20023a18:	b51f      	push	{r0, r1, r2, r3, r4, lr}
20023a1a:	4604      	mov	r4, r0
20023a1c:	b910      	cbnz	r0, 20023a24 <HAL_NAND_GET_BADBLK+0xc>
20023a1e:	2000      	movs	r0, #0
20023a20:	b004      	add	sp, #16
20023a22:	bd10      	pop	{r4, pc}
20023a24:	69c3      	ldr	r3, [r0, #28]
20023a26:	2b00      	cmp	r3, #0
20023a28:	d0f9      	beq.n	20023a1e <HAL_NAND_GET_BADBLK+0x6>
20023a2a:	f7ff ffe9 	bl	20023a00 <HAL_NAND_BLOCK_SIZE>
20023a2e:	2304      	movs	r3, #4
20023a30:	9301      	str	r3, [sp, #4]
20023a32:	ab03      	add	r3, sp, #12
20023a34:	9300      	str	r3, [sp, #0]
20023a36:	2300      	movs	r3, #0
20023a38:	4341      	muls	r1, r0
20023a3a:	461a      	mov	r2, r3
20023a3c:	4620      	mov	r0, r4
20023a3e:	f7ff ff2a 	bl	20023896 <HAL_NAND_READ_WITHOOB>
20023a42:	b140      	cbz	r0, 20023a56 <HAL_NAND_GET_BADBLK+0x3e>
20023a44:	f89d 300c 	ldrb.w	r3, [sp, #12]
20023a48:	2bff      	cmp	r3, #255	@ 0xff
20023a4a:	d0e8      	beq.n	20023a1e <HAL_NAND_GET_BADBLK+0x6>
20023a4c:	9803      	ldr	r0, [sp, #12]
20023a4e:	2800      	cmp	r0, #0
20023a50:	bf08      	it	eq
20023a52:	2001      	moveq	r0, #1
20023a54:	e7e4      	b.n	20023a20 <HAL_NAND_GET_BADBLK+0x8>
20023a56:	2001      	movs	r0, #1
20023a58:	e7e2      	b.n	20023a20 <HAL_NAND_GET_BADBLK+0x8>

20023a5a <HAL_QSPIEX_WRITE_PAGE>:
20023a5a:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20023a5e:	b099      	sub	sp, #100	@ 0x64
20023a60:	4604      	mov	r4, r0
20023a62:	460e      	mov	r6, r1
20023a64:	4691      	mov	r9, r2
20023a66:	f7ff fd14 	bl	20023492 <flash_handle_valid>
20023a6a:	b318      	cbz	r0, 20023ab4 <HAL_QSPIEX_WRITE_PAGE+0x5a>
20023a6c:	2b00      	cmp	r3, #0
20023a6e:	f000 80d7 	beq.w	20023c20 <HAL_QSPIEX_WRITE_PAGE+0x1c6>
20023a72:	f5b3 7f80 	cmp.w	r3, #256	@ 0x100
20023a76:	bf28      	it	cs
20023a78:	f44f 7380 	movcs.w	r3, #256	@ 0x100
20023a7c:	68a1      	ldr	r1, [r4, #8]
20023a7e:	461d      	mov	r5, r3
20023a80:	6962      	ldr	r2, [r4, #20]
20023a82:	f894 3020 	ldrb.w	r3, [r4, #32]
20023a86:	2900      	cmp	r1, #0
20023a88:	d03b      	beq.n	20023b02 <HAL_QSPIEX_WRITE_PAGE+0xa8>
20023a8a:	f1b2 7f80 	cmp.w	r2, #16777216	@ 0x1000000
20023a8e:	d914      	bls.n	20023aba <HAL_QSPIEX_WRITE_PAGE+0x60>
20023a90:	2b02      	cmp	r3, #2
20023a92:	bf14      	ite	ne
20023a94:	2727      	movne	r7, #39	@ 0x27
20023a96:	2728      	moveq	r7, #40	@ 0x28
20023a98:	4639      	mov	r1, r7
20023a9a:	4620      	mov	r0, r4
20023a9c:	f7ff faa3 	bl	20022fe6 <HAL_FLASH_PRE_CMD>
20023aa0:	4649      	mov	r1, r9
20023aa2:	462b      	mov	r3, r5
20023aa4:	2201      	movs	r2, #1
20023aa6:	4620      	mov	r0, r4
20023aa8:	f7ff fcfb 	bl	200234a2 <HAL_FLASH_DMA_START>
20023aac:	4601      	mov	r1, r0
20023aae:	b148      	cbz	r0, 20023ac4 <HAL_QSPIEX_WRITE_PAGE+0x6a>
20023ab0:	2500      	movs	r5, #0
20023ab2:	4628      	mov	r0, r5
20023ab4:	b019      	add	sp, #100	@ 0x64
20023ab6:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
20023aba:	2b02      	cmp	r3, #2
20023abc:	bf14      	ite	ne
20023abe:	2716      	movne	r7, #22
20023ac0:	2717      	moveq	r7, #23
20023ac2:	e7e9      	b.n	20023a98 <HAL_QSPIEX_WRITE_PAGE+0x3e>
20023ac4:	4632      	mov	r2, r6
20023ac6:	4620      	mov	r0, r4
20023ac8:	f7ff fab4 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
20023acc:	2101      	movs	r1, #1
20023ace:	4620      	mov	r0, r4
20023ad0:	f7ff f81b 	bl	20022b0a <HAL_FLASH_WRITE_DLEN2>
20023ad4:	2301      	movs	r3, #1
20023ad6:	4632      	mov	r2, r6
20023ad8:	9300      	str	r3, [sp, #0]
20023ada:	4639      	mov	r1, r7
20023adc:	2302      	movs	r3, #2
20023ade:	4620      	mov	r0, r4
20023ae0:	f7ff fadb 	bl	2002309a <HAL_FLASH_ISSUE_CMD_SEQ>
20023ae4:	2800      	cmp	r0, #0
20023ae6:	d1e3      	bne.n	20023ab0 <HAL_QSPIEX_WRITE_PAGE+0x56>
20023ae8:	f44f 717a 	mov.w	r1, #1000	@ 0x3e8
20023aec:	4620      	mov	r0, r4
20023aee:	f7ff fd28 	bl	20023542 <HAL_FLASH_DMA_WAIT_DONE>
20023af2:	2800      	cmp	r0, #0
20023af4:	d1dc      	bne.n	20023ab0 <HAL_QSPIEX_WRITE_PAGE+0x56>
20023af6:	6822      	ldr	r2, [r4, #0]
20023af8:	6813      	ldr	r3, [r2, #0]
20023afa:	f023 0320 	bic.w	r3, r3, #32
20023afe:	6013      	str	r3, [r2, #0]
20023b00:	e7d7      	b.n	20023ab2 <HAL_QSPIEX_WRITE_PAGE+0x58>
20023b02:	f1b2 7f80 	cmp.w	r2, #16777216	@ 0x1000000
20023b06:	f240 8082 	bls.w	20023c0e <HAL_QSPIEX_WRITE_PAGE+0x1b4>
20023b0a:	2b02      	cmp	r3, #2
20023b0c:	bf14      	ite	ne
20023b0e:	2327      	movne	r3, #39	@ 0x27
20023b10:	2328      	moveq	r3, #40	@ 0x28
20023b12:	462f      	mov	r7, r5
20023b14:	f04f 0800 	mov.w	r8, #0
20023b18:	9303      	str	r3, [sp, #12]
20023b1a:	f64f 7afc 	movw	sl, #65532	@ 0xfffc
20023b1e:	2f40      	cmp	r7, #64	@ 0x40
20023b20:	bfd4      	ite	le
20023b22:	ea0a 0a07 	andle.w	sl, sl, r7
20023b26:	f00a 0a40 	andgt.w	sl, sl, #64	@ 0x40
20023b2a:	f1ba 0f00 	cmp.w	sl, #0
20023b2e:	d03f      	beq.n	20023bb0 <HAL_QSPIEX_WRITE_PAGE+0x156>
20023b30:	2200      	movs	r2, #0
20023b32:	4620      	mov	r0, r4
20023b34:	4611      	mov	r1, r2
20023b36:	f7ff fa7d 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
20023b3a:	eb09 0308 	add.w	r3, r9, r8
20023b3e:	f10d 0c20 	add.w	ip, sp, #32
20023b42:	f103 0e40 	add.w	lr, r3, #64	@ 0x40
20023b46:	4662      	mov	r2, ip
20023b48:	6818      	ldr	r0, [r3, #0]
20023b4a:	6859      	ldr	r1, [r3, #4]
20023b4c:	3308      	adds	r3, #8
20023b4e:	c203      	stmia	r2!, {r0, r1}
20023b50:	4573      	cmp	r3, lr
20023b52:	4694      	mov	ip, r2
20023b54:	d1f7      	bne.n	20023b46 <HAL_QSPIEX_WRITE_PAGE+0xec>
20023b56:	f04f 0b00 	mov.w	fp, #0
20023b5a:	ea4f 02aa 	mov.w	r2, sl, asr #2
20023b5e:	ab08      	add	r3, sp, #32
20023b60:	f853 1b04 	ldr.w	r1, [r3], #4
20023b64:	4620      	mov	r0, r4
20023b66:	9205      	str	r2, [sp, #20]
20023b68:	9304      	str	r3, [sp, #16]
20023b6a:	f7fe ffbd 	bl	20022ae8 <HAL_FLASH_WRITE_WORD>
20023b6e:	9a05      	ldr	r2, [sp, #20]
20023b70:	f10b 0b01 	add.w	fp, fp, #1
20023b74:	4593      	cmp	fp, r2
20023b76:	9b04      	ldr	r3, [sp, #16]
20023b78:	d1f2      	bne.n	20023b60 <HAL_QSPIEX_WRITE_PAGE+0x106>
20023b7a:	4651      	mov	r1, sl
20023b7c:	4620      	mov	r0, r4
20023b7e:	f7fe ffba 	bl	20022af6 <HAL_FLASH_WRITE_DLEN>
20023b82:	4620      	mov	r0, r4
20023b84:	9903      	ldr	r1, [sp, #12]
20023b86:	eb06 0208 	add.w	r2, r6, r8
20023b8a:	f7ff fa53 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
20023b8e:	2101      	movs	r1, #1
20023b90:	4620      	mov	r0, r4
20023b92:	f7fe ffb0 	bl	20022af6 <HAL_FLASH_WRITE_DLEN>
20023b96:	2200      	movs	r2, #0
20023b98:	2102      	movs	r1, #2
20023b9a:	4620      	mov	r0, r4
20023b9c:	f7ff fa4a 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
20023ba0:	4620      	mov	r0, r4
20023ba2:	f7fe fff5 	bl	20022b90 <HAL_FLASH_IS_PROG_DONE>
20023ba6:	2800      	cmp	r0, #0
20023ba8:	d0f1      	beq.n	20023b8e <HAL_QSPIEX_WRITE_PAGE+0x134>
20023baa:	eba7 070a 	sub.w	r7, r7, sl
20023bae:	44d0      	add	r8, sl
20023bb0:	1e7b      	subs	r3, r7, #1
20023bb2:	2b02      	cmp	r3, #2
20023bb4:	d830      	bhi.n	20023c18 <HAL_QSPIEX_WRITE_PAGE+0x1be>
20023bb6:	6923      	ldr	r3, [r4, #16]
20023bb8:	4446      	add	r6, r8
20023bba:	4333      	orrs	r3, r6
20023bbc:	681b      	ldr	r3, [r3, #0]
20023bbe:	463a      	mov	r2, r7
20023bc0:	eb09 0108 	add.w	r1, r9, r8
20023bc4:	a807      	add	r0, sp, #28
20023bc6:	9307      	str	r3, [sp, #28]
20023bc8:	f006 fe56 	bl	2002a878 <memcpy>
20023bcc:	2200      	movs	r2, #0
20023bce:	4620      	mov	r0, r4
20023bd0:	4611      	mov	r1, r2
20023bd2:	f7ff fa2f 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
20023bd6:	9907      	ldr	r1, [sp, #28]
20023bd8:	4620      	mov	r0, r4
20023bda:	f7fe ff85 	bl	20022ae8 <HAL_FLASH_WRITE_WORD>
20023bde:	2104      	movs	r1, #4
20023be0:	4620      	mov	r0, r4
20023be2:	f7fe ff88 	bl	20022af6 <HAL_FLASH_WRITE_DLEN>
20023be6:	4632      	mov	r2, r6
20023be8:	4620      	mov	r0, r4
20023bea:	9903      	ldr	r1, [sp, #12]
20023bec:	f7ff fa22 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
20023bf0:	2101      	movs	r1, #1
20023bf2:	4620      	mov	r0, r4
20023bf4:	f7fe ff7f 	bl	20022af6 <HAL_FLASH_WRITE_DLEN>
20023bf8:	2200      	movs	r2, #0
20023bfa:	2102      	movs	r1, #2
20023bfc:	4620      	mov	r0, r4
20023bfe:	f7ff fa19 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
20023c02:	4620      	mov	r0, r4
20023c04:	f7fe ffc4 	bl	20022b90 <HAL_FLASH_IS_PROG_DONE>
20023c08:	2800      	cmp	r0, #0
20023c0a:	d0f1      	beq.n	20023bf0 <HAL_QSPIEX_WRITE_PAGE+0x196>
20023c0c:	e751      	b.n	20023ab2 <HAL_QSPIEX_WRITE_PAGE+0x58>
20023c0e:	2b02      	cmp	r3, #2
20023c10:	bf14      	ite	ne
20023c12:	2316      	movne	r3, #22
20023c14:	2317      	moveq	r3, #23
20023c16:	e77c      	b.n	20023b12 <HAL_QSPIEX_WRITE_PAGE+0xb8>
20023c18:	2f00      	cmp	r7, #0
20023c1a:	f73f af7e 	bgt.w	20023b1a <HAL_QSPIEX_WRITE_PAGE+0xc0>
20023c1e:	e748      	b.n	20023ab2 <HAL_QSPIEX_WRITE_PAGE+0x58>
20023c20:	4618      	mov	r0, r3
20023c22:	e747      	b.n	20023ab4 <HAL_QSPIEX_WRITE_PAGE+0x5a>

20023c24 <HAL_QSPIEX_SECT_ERASE>:
20023c24:	b573      	push	{r0, r1, r4, r5, r6, lr}
20023c26:	4604      	mov	r4, r0
20023c28:	460d      	mov	r5, r1
20023c2a:	f7ff fc32 	bl	20023492 <flash_handle_valid>
20023c2e:	b1e8      	cbz	r0, 20023c6c <HAL_QSPIEX_SECT_ERASE+0x48>
20023c30:	6963      	ldr	r3, [r4, #20]
20023c32:	460a      	mov	r2, r1
20023c34:	f1b3 7f80 	cmp.w	r3, #16777216	@ 0x1000000
20023c38:	f04f 0100 	mov.w	r1, #0
20023c3c:	4620      	mov	r0, r4
20023c3e:	bf94      	ite	ls
20023c40:	261b      	movls	r6, #27
20023c42:	2629      	movhi	r6, #41	@ 0x29
20023c44:	f7ff f9f6 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
20023c48:	2101      	movs	r1, #1
20023c4a:	4620      	mov	r0, r4
20023c4c:	f7fe ff5d 	bl	20022b0a <HAL_FLASH_WRITE_DLEN2>
20023c50:	2301      	movs	r3, #1
20023c52:	462a      	mov	r2, r5
20023c54:	9300      	str	r3, [sp, #0]
20023c56:	4631      	mov	r1, r6
20023c58:	2302      	movs	r3, #2
20023c5a:	4620      	mov	r0, r4
20023c5c:	f7ff fa1d 	bl	2002309a <HAL_FLASH_ISSUE_CMD_SEQ>
20023c60:	3800      	subs	r0, #0
20023c62:	bf18      	it	ne
20023c64:	2001      	movne	r0, #1
20023c66:	4240      	negs	r0, r0
20023c68:	b002      	add	sp, #8
20023c6a:	bd70      	pop	{r4, r5, r6, pc}
20023c6c:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
20023c70:	e7fa      	b.n	20023c68 <HAL_QSPIEX_SECT_ERASE+0x44>
	...

20023c74 <HAL_QSPI_GET_SRC_CLK>:
20023c74:	b508      	push	{r3, lr}
20023c76:	b1e8      	cbz	r0, 20023cb4 <HAL_QSPI_GET_SRC_CLK+0x40>
20023c78:	6803      	ldr	r3, [r0, #0]
20023c7a:	4a0f      	ldr	r2, [pc, #60]	@ (20023cb8 <HAL_QSPI_GET_SRC_CLK+0x44>)
20023c7c:	4293      	cmp	r3, r2
20023c7e:	d00c      	beq.n	20023c9a <HAL_QSPI_GET_SRC_CLK+0x26>
20023c80:	f502 5280 	add.w	r2, r2, #4096	@ 0x1000
20023c84:	4293      	cmp	r3, r2
20023c86:	d115      	bne.n	20023cb4 <HAL_QSPI_GET_SRC_CLK+0x40>
20023c88:	2006      	movs	r0, #6
20023c8a:	f001 f88d 	bl	20024da8 <HAL_RCC_HCPU_GetClockSrc>
20023c8e:	2802      	cmp	r0, #2
20023c90:	d105      	bne.n	20023c9e <HAL_QSPI_GET_SRC_CLK+0x2a>
20023c92:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
20023c96:	f001 b8bc 	b.w	20024e12 <HAL_RCC_HCPU_GetDLL2Freq>
20023c9a:	2004      	movs	r0, #4
20023c9c:	e7f5      	b.n	20023c8a <HAL_QSPI_GET_SRC_CLK+0x16>
20023c9e:	2803      	cmp	r0, #3
20023ca0:	d103      	bne.n	20023caa <HAL_QSPI_GET_SRC_CLK+0x36>
20023ca2:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
20023ca6:	f001 b8b7 	b.w	20024e18 <HAL_RCC_HCPU_GetDLL3Freq>
20023caa:	2001      	movs	r0, #1
20023cac:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
20023cb0:	f001 b916 	b.w	20024ee0 <HAL_RCC_GetSysCLKFreq>
20023cb4:	2000      	movs	r0, #0
20023cb6:	bd08      	pop	{r3, pc}
20023cb8:	50041000 	.word	0x50041000

20023cbc <HAL_QSPI_GET_CLK>:
20023cbc:	b538      	push	{r3, r4, r5, lr}
20023cbe:	4605      	mov	r5, r0
20023cc0:	b908      	cbnz	r0, 20023cc6 <HAL_QSPI_GET_CLK+0xa>
20023cc2:	2000      	movs	r0, #0
20023cc4:	bd38      	pop	{r3, r4, r5, pc}
20023cc6:	f7fe ff7b 	bl	20022bc0 <HAL_FLASH_GET_DIV>
20023cca:	4604      	mov	r4, r0
20023ccc:	2800      	cmp	r0, #0
20023cce:	d0f8      	beq.n	20023cc2 <HAL_QSPI_GET_CLK+0x6>
20023cd0:	4628      	mov	r0, r5
20023cd2:	f7ff ffcf 	bl	20023c74 <HAL_QSPI_GET_SRC_CLK>
20023cd6:	fbb0 f0f4 	udiv	r0, r0, r4
20023cda:	e7f3      	b.n	20023cc4 <HAL_QSPI_GET_CLK+0x8>

20023cdc <HAL_QSPI_READ_ID>:
20023cdc:	b138      	cbz	r0, 20023cee <HAL_QSPI_READ_ID+0x12>
20023cde:	f890 3023 	ldrb.w	r3, [r0, #35]	@ 0x23
20023ce2:	b113      	cbz	r3, 20023cea <HAL_QSPI_READ_ID+0xe>
20023ce4:	2100      	movs	r1, #0
20023ce6:	f7ff bc78 	b.w	200235da <nand_read_id>
20023cea:	f7ff baf8 	b.w	200232de <HAL_FLASH_GET_NOR_ID>
20023cee:	20ff      	movs	r0, #255	@ 0xff
20023cf0:	4770      	bx	lr

20023cf2 <HAL_NOR_CFG_DTR>:
20023cf2:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
20023cf4:	4604      	mov	r4, r0
20023cf6:	460a      	mov	r2, r1
20023cf8:	b351      	cbz	r1, 20023d50 <HAL_NOR_CFG_DTR+0x5e>
20023cfa:	68c5      	ldr	r5, [r0, #12]
20023cfc:	f895 31ff 	ldrb.w	r3, [r5, #511]	@ 0x1ff
20023d00:	2b00      	cmp	r3, #0
20023d02:	d03b      	beq.n	20023d7c <HAL_NOR_CFG_DTR+0x8a>
20023d04:	f890 3020 	ldrb.w	r3, [r0, #32]
20023d08:	b3c3      	cbz	r3, 20023d7c <HAL_NOR_CFG_DTR+0x8a>
20023d0a:	f995 6207 	ldrsb.w	r6, [r5, #519]	@ 0x207
20023d0e:	f995 2202 	ldrsb.w	r2, [r5, #514]	@ 0x202
20023d12:	f995 3203 	ldrsb.w	r3, [r5, #515]	@ 0x203
20023d16:	f995 1201 	ldrsb.w	r1, [r5, #513]	@ 0x201
20023d1a:	9603      	str	r6, [sp, #12]
20023d1c:	f995 6206 	ldrsb.w	r6, [r5, #518]	@ 0x206
20023d20:	9602      	str	r6, [sp, #8]
20023d22:	f995 6205 	ldrsb.w	r6, [r5, #517]	@ 0x205
20023d26:	9601      	str	r6, [sp, #4]
20023d28:	f995 5204 	ldrsb.w	r5, [r5, #516]	@ 0x204
20023d2c:	9500      	str	r5, [sp, #0]
20023d2e:	f7fe fe95 	bl	20022a5c <HAL_FLASH_CFG_AHB_RCMD>
20023d32:	68e3      	ldr	r3, [r4, #12]
20023d34:	4620      	mov	r0, r4
20023d36:	f893 11ff 	ldrb.w	r1, [r3, #511]	@ 0x1ff
20023d3a:	f7fe fe84 	bl	20022a46 <HAL_FLASH_SET_AHB_RCMD>
20023d3e:	2101      	movs	r1, #1
20023d40:	4620      	mov	r0, r4
20023d42:	f894 2025 	ldrb.w	r2, [r4, #37]	@ 0x25
20023d46:	f7ff f895 	bl	20022e74 <HAL_MPI_CFG_DTR>
20023d4a:	2000      	movs	r0, #0
20023d4c:	b004      	add	sp, #16
20023d4e:	bd70      	pop	{r4, r5, r6, pc}
20023d50:	f7ff f890 	bl	20022e74 <HAL_MPI_CFG_DTR>
20023d54:	6963      	ldr	r3, [r4, #20]
20023d56:	f894 1020 	ldrb.w	r1, [r4, #32]
20023d5a:	f1b3 7f80 	cmp.w	r3, #16777216	@ 0x1000000
20023d5e:	d906      	bls.n	20023d6e <HAL_NOR_CFG_DTR+0x7c>
20023d60:	b919      	cbnz	r1, 20023d6a <HAL_NOR_CFG_DTR+0x78>
20023d62:	4620      	mov	r0, r4
20023d64:	f7ff f902 	bl	20022f6c <HAL_FLASH_CONFIG_FULL_AHB_READ>
20023d68:	e7ef      	b.n	20023d4a <HAL_NOR_CFG_DTR+0x58>
20023d6a:	2101      	movs	r1, #1
20023d6c:	e7f9      	b.n	20023d62 <HAL_NOR_CFG_DTR+0x70>
20023d6e:	b919      	cbnz	r1, 20023d78 <HAL_NOR_CFG_DTR+0x86>
20023d70:	4620      	mov	r0, r4
20023d72:	f7ff f8b7 	bl	20022ee4 <HAL_FLASH_CONFIG_AHB_READ>
20023d76:	e7e8      	b.n	20023d4a <HAL_NOR_CFG_DTR+0x58>
20023d78:	2101      	movs	r1, #1
20023d7a:	e7f9      	b.n	20023d70 <HAL_NOR_CFG_DTR+0x7e>
20023d7c:	2001      	movs	r0, #1
20023d7e:	e7e5      	b.n	20023d4c <HAL_NOR_CFG_DTR+0x5a>

20023d80 <HAL_NOR_DTR_CAL>:
20023d80:	b510      	push	{r4, lr}
20023d82:	4604      	mov	r4, r0
20023d84:	b1f0      	cbz	r0, 20023dc4 <HAL_NOR_DTR_CAL+0x44>
20023d86:	6802      	ldr	r2, [r0, #0]
20023d88:	2014      	movs	r0, #20
20023d8a:	f8d2 3094 	ldr.w	r3, [r2, #148]	@ 0x94
20023d8e:	f043 4300 	orr.w	r3, r3, #2147483648	@ 0x80000000
20023d92:	f8c2 3094 	str.w	r3, [r2, #148]	@ 0x94
20023d96:	f7fe f8e6 	bl	20021f66 <HAL_Delay_us>
20023d9a:	6823      	ldr	r3, [r4, #0]
20023d9c:	f8d3 2094 	ldr.w	r2, [r3, #148]	@ 0x94
20023da0:	05d2      	lsls	r2, r2, #23
20023da2:	d5fb      	bpl.n	20023d9c <HAL_NOR_DTR_CAL+0x1c>
20023da4:	f8d3 0094 	ldr.w	r0, [r3, #148]	@ 0x94
20023da8:	f8d3 2094 	ldr.w	r2, [r3, #148]	@ 0x94
20023dac:	b2c0      	uxtb	r0, r0
20023dae:	f022 4200 	bic.w	r2, r2, #2147483648	@ 0x80000000
20023db2:	f8c3 2094 	str.w	r2, [r3, #148]	@ 0x94
20023db6:	f894 3025 	ldrb.w	r3, [r4, #37]	@ 0x25
20023dba:	f023 037f 	bic.w	r3, r3, #127	@ 0x7f
20023dbe:	4303      	orrs	r3, r0
20023dc0:	f884 3025 	strb.w	r3, [r4, #37]	@ 0x25
20023dc4:	bd10      	pop	{r4, pc}
	...

20023dc8 <HAL_FLASH_Init>:
20023dc8:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
20023dcc:	460e      	mov	r6, r1
20023dce:	4690      	mov	r8, r2
20023dd0:	461f      	mov	r7, r3
20023dd2:	4604      	mov	r4, r0
20023dd4:	b087      	sub	sp, #28
20023dd6:	2800      	cmp	r0, #0
20023dd8:	f000 80e5 	beq.w	20023fa6 <HAL_FLASH_Init+0x1de>
20023ddc:	2900      	cmp	r1, #0
20023dde:	f000 80e2 	beq.w	20023fa6 <HAL_FLASH_Init+0x1de>
20023de2:	f7fe fe0f 	bl	20022a04 <HAL_QSPI_Init>
20023de6:	6820      	ldr	r0, [r4, #0]
20023de8:	f7ff fb59 	bl	2002349e <HAL_GET_FLASH_MID>
20023dec:	6933      	ldr	r3, [r6, #16]
20023dee:	2100      	movs	r1, #0
20023df0:	f884 3034 	strb.w	r3, [r4, #52]	@ 0x34
20023df4:	68b3      	ldr	r3, [r6, #8]
20023df6:	4605      	mov	r5, r0
20023df8:	63a3      	str	r3, [r4, #56]	@ 0x38
20023dfa:	68f3      	ldr	r3, [r6, #12]
20023dfc:	f884 1024 	strb.w	r1, [r4, #36]	@ 0x24
20023e00:	051b      	lsls	r3, r3, #20
20023e02:	63e3      	str	r3, [r4, #60]	@ 0x3c
20023e04:	2302      	movs	r3, #2
20023e06:	f884 3036 	strb.w	r3, [r4, #54]	@ 0x36
20023e0a:	6933      	ldr	r3, [r6, #16]
20023e0c:	f8c4 8008 	str.w	r8, [r4, #8]
20023e10:	1e5a      	subs	r2, r3, #1
20023e12:	4253      	negs	r3, r2
20023e14:	4153      	adcs	r3, r2
20023e16:	f884 3023 	strb.w	r3, [r4, #35]	@ 0x23
20023e1a:	f1b8 0f00 	cmp.w	r8, #0
20023e1e:	d058      	beq.n	20023ed2 <HAL_FLASH_Init+0x10a>
20023e20:	2f00      	cmp	r7, #0
20023e22:	d056      	beq.n	20023ed2 <HAL_FLASH_Init+0x10a>
20023e24:	683b      	ldr	r3, [r7, #0]
20023e26:	f8c8 3000 	str.w	r3, [r8]
20023e2a:	68a3      	ldr	r3, [r4, #8]
20023e2c:	68fa      	ldr	r2, [r7, #12]
20023e2e:	605a      	str	r2, [r3, #4]
20023e30:	2210      	movs	r2, #16
20023e32:	68a3      	ldr	r3, [r4, #8]
20023e34:	609a      	str	r2, [r3, #8]
20023e36:	2280      	movs	r2, #128	@ 0x80
20023e38:	68a3      	ldr	r3, [r4, #8]
20023e3a:	60d9      	str	r1, [r3, #12]
20023e3c:	68a3      	ldr	r3, [r4, #8]
20023e3e:	611a      	str	r2, [r3, #16]
20023e40:	f44f 5280 	mov.w	r2, #4096	@ 0x1000
20023e44:	68a3      	ldr	r3, [r4, #8]
20023e46:	6159      	str	r1, [r3, #20]
20023e48:	68a3      	ldr	r3, [r4, #8]
20023e4a:	6199      	str	r1, [r3, #24]
20023e4c:	68a3      	ldr	r3, [r4, #8]
20023e4e:	61d9      	str	r1, [r3, #28]
20023e50:	68a3      	ldr	r3, [r4, #8]
20023e52:	621a      	str	r2, [r3, #32]
20023e54:	68a3      	ldr	r3, [r4, #8]
20023e56:	6259      	str	r1, [r3, #36]	@ 0x24
20023e58:	b1c0      	cbz	r0, 20023e8c <HAL_FLASH_Init+0xc4>
20023e5a:	f06f 437f 	mvn.w	r3, #4278190080	@ 0xff000000
20023e5e:	4298      	cmp	r0, r3
20023e60:	d014      	beq.n	20023e8c <HAL_FLASH_Init+0xc4>
20023e62:	2601      	movs	r6, #1
20023e64:	f894 3023 	ldrb.w	r3, [r4, #35]	@ 0x23
20023e68:	2b00      	cmp	r3, #0
20023e6a:	d13d      	bne.n	20023ee8 <HAL_FLASH_Init+0x120>
20023e6c:	2e00      	cmp	r6, #0
20023e6e:	d15a      	bne.n	20023f26 <HAL_FLASH_Init+0x15e>
20023e70:	4620      	mov	r0, r4
20023e72:	f7ff faee 	bl	20023452 <HAL_FLASH_RELEASE_DPD>
20023e76:	4630      	mov	r0, r6
20023e78:	f7fe f875 	bl	20021f66 <HAL_Delay_us>
20023e7c:	2032      	movs	r0, #50	@ 0x32
20023e7e:	f7fe f872 	bl	20021f66 <HAL_Delay_us>
20023e82:	4620      	mov	r0, r4
20023e84:	f7ff ff2a 	bl	20023cdc <HAL_QSPI_READ_ID>
20023e88:	4605      	mov	r5, r0
20023e8a:	e04c      	b.n	20023f26 <HAL_FLASH_Init+0x15e>
20023e8c:	2101      	movs	r1, #1
20023e8e:	4620      	mov	r0, r4
20023e90:	f7fe fe8b 	bl	20022baa <HAL_FLASH_SET_TXSLOT>
20023e94:	4ba7      	ldr	r3, [pc, #668]	@ (20024134 <HAL_FLASH_Init+0x36c>)
20023e96:	69a2      	ldr	r2, [r4, #24]
20023e98:	4620      	mov	r0, r4
20023e9a:	429a      	cmp	r2, r3
20023e9c:	f04f 0200 	mov.w	r2, #0
20023ea0:	bf8c      	ite	hi
20023ea2:	2101      	movhi	r1, #1
20023ea4:	4611      	movls	r1, r2
20023ea6:	f7ff fac5 	bl	20023434 <HAL_QSPI_SET_CLK_INV>
20023eaa:	4620      	mov	r0, r4
20023eac:	f89d 1038 	ldrb.w	r1, [sp, #56]	@ 0x38
20023eb0:	f7fe fe82 	bl	20022bb8 <HAL_FLASH_SET_CLK_rom>
20023eb4:	f894 3035 	ldrb.w	r3, [r4, #53]	@ 0x35
20023eb8:	b12b      	cbz	r3, 20023ec6 <HAL_FLASH_Init+0xfe>
20023eba:	2b01      	cmp	r3, #1
20023ebc:	d110      	bne.n	20023ee0 <HAL_FLASH_Init+0x118>
20023ebe:	2100      	movs	r1, #0
20023ec0:	4620      	mov	r0, r4
20023ec2:	f7fe ff91 	bl	20022de8 <HAL_FLASH_SET_DUAL_MODE>
20023ec6:	2101      	movs	r1, #1
20023ec8:	4620      	mov	r0, r4
20023eca:	f7fe ff1a 	bl	20022d02 <HAL_FLASH_ENABLE_QSPI>
20023ece:	2600      	movs	r6, #0
20023ed0:	e7c8      	b.n	20023e64 <HAL_FLASH_Init+0x9c>
20023ed2:	2d00      	cmp	r5, #0
20023ed4:	d0de      	beq.n	20023e94 <HAL_FLASH_Init+0xcc>
20023ed6:	f06f 437f 	mvn.w	r3, #4278190080	@ 0xff000000
20023eda:	429d      	cmp	r5, r3
20023edc:	d1c1      	bne.n	20023e62 <HAL_FLASH_Init+0x9a>
20023ede:	e7d9      	b.n	20023e94 <HAL_FLASH_Init+0xcc>
20023ee0:	2b02      	cmp	r3, #2
20023ee2:	d1f0      	bne.n	20023ec6 <HAL_FLASH_Init+0xfe>
20023ee4:	2101      	movs	r1, #1
20023ee6:	e7eb      	b.n	20023ec0 <HAL_FLASH_Init+0xf8>
20023ee8:	6822      	ldr	r2, [r4, #0]
20023eea:	2700      	movs	r7, #0
20023eec:	6893      	ldr	r3, [r2, #8]
20023eee:	4639      	mov	r1, r7
20023ef0:	f043 7370 	orr.w	r3, r3, #62914560	@ 0x3c00000
20023ef4:	6093      	str	r3, [r2, #8]
20023ef6:	2301      	movs	r3, #1
20023ef8:	463a      	mov	r2, r7
20023efa:	4620      	mov	r0, r4
20023efc:	e9cd 7303 	strd	r7, r3, [sp, #12]
20023f00:	e9cd 7701 	strd	r7, r7, [sp, #4]
20023f04:	463b      	mov	r3, r7
20023f06:	9700      	str	r7, [sp, #0]
20023f08:	f7fe fe5f 	bl	20022bca <HAL_FLASH_MANUAL_CMD>
20023f0c:	463a      	mov	r2, r7
20023f0e:	21ff      	movs	r1, #255	@ 0xff
20023f10:	4620      	mov	r0, r4
20023f12:	f7fe fe15 	bl	20022b40 <HAL_FLASH_SET_CMD>
20023f16:	4638      	mov	r0, r7
20023f18:	f7fe f825 	bl	20021f66 <HAL_Delay_us>
20023f1c:	20c8      	movs	r0, #200	@ 0xc8
20023f1e:	f7fe f822 	bl	20021f66 <HAL_Delay_us>
20023f22:	2e00      	cmp	r6, #0
20023f24:	d0ad      	beq.n	20023e82 <HAL_FLASH_Init+0xba>
20023f26:	f894 3023 	ldrb.w	r3, [r4, #35]	@ 0x23
20023f2a:	b2ef      	uxtb	r7, r5
20023f2c:	f3c5 2807 	ubfx	r8, r5, #8, #8
20023f30:	6325      	str	r5, [r4, #48]	@ 0x30
20023f32:	f3c5 4507 	ubfx	r5, r5, #16, #8
20023f36:	4642      	mov	r2, r8
20023f38:	4629      	mov	r1, r5
20023f3a:	4638      	mov	r0, r7
20023f3c:	b3ab      	cbz	r3, 20023faa <HAL_FLASH_Init+0x1e2>
20023f3e:	f001 f9d7 	bl	200252f0 <spi_nand_get_cmd_by_id>
20023f42:	60e0      	str	r0, [r4, #12]
20023f44:	bba0      	cbnz	r0, 20023fb0 <HAL_FLASH_Init+0x1e8>
20023f46:	f894 3023 	ldrb.w	r3, [r4, #35]	@ 0x23
20023f4a:	b32b      	cbz	r3, 20023f98 <HAL_FLASH_Init+0x1d0>
20023f4c:	2108      	movs	r1, #8
20023f4e:	4620      	mov	r0, r4
20023f50:	f7ff fb43 	bl	200235da <nand_read_id>
20023f54:	f3c0 2807 	ubfx	r8, r0, #8, #8
20023f58:	f3c0 4507 	ubfx	r5, r0, #16, #8
20023f5c:	b2c7      	uxtb	r7, r0
20023f5e:	6320      	str	r0, [r4, #48]	@ 0x30
20023f60:	4642      	mov	r2, r8
20023f62:	4629      	mov	r1, r5
20023f64:	4638      	mov	r0, r7
20023f66:	f001 f9c3 	bl	200252f0 <spi_nand_get_cmd_by_id>
20023f6a:	60e0      	str	r0, [r4, #12]
20023f6c:	bb00      	cbnz	r0, 20023fb0 <HAL_FLASH_Init+0x1e8>
20023f6e:	210f      	movs	r1, #15
20023f70:	4620      	mov	r0, r4
20023f72:	f7ff fb32 	bl	200235da <nand_read_id>
20023f76:	f3c0 2807 	ubfx	r8, r0, #8, #8
20023f7a:	f3c0 4507 	ubfx	r5, r0, #16, #8
20023f7e:	b2c7      	uxtb	r7, r0
20023f80:	6320      	str	r0, [r4, #48]	@ 0x30
20023f82:	4642      	mov	r2, r8
20023f84:	4629      	mov	r1, r5
20023f86:	4638      	mov	r0, r7
20023f88:	f001 f9b2 	bl	200252f0 <spi_nand_get_cmd_by_id>
20023f8c:	60e0      	str	r0, [r4, #12]
20023f8e:	b978      	cbnz	r0, 20023fb0 <HAL_FLASH_Init+0x1e8>
20023f90:	f001 f9c4 	bl	2002531c <spi_nand_get_default_ctable>
20023f94:	60e0      	str	r0, [r4, #12]
20023f96:	b958      	cbnz	r0, 20023fb0 <HAL_FLASH_Init+0x1e8>
20023f98:	2100      	movs	r1, #0
20023f9a:	4620      	mov	r0, r4
20023f9c:	f7fe feb1 	bl	20022d02 <HAL_FLASH_ENABLE_QSPI>
20023fa0:	2300      	movs	r3, #0
20023fa2:	e9c4 330e 	strd	r3, r3, [r4, #56]	@ 0x38
20023fa6:	2001      	movs	r0, #1
20023fa8:	e04c      	b.n	20024044 <HAL_FLASH_Init+0x27c>
20023faa:	f001 f959 	bl	20025260 <spi_flash_get_cmd_by_id>
20023fae:	e7c8      	b.n	20023f42 <HAL_FLASH_Init+0x17a>
20023fb0:	f894 3023 	ldrb.w	r3, [r4, #35]	@ 0x23
20023fb4:	4642      	mov	r2, r8
20023fb6:	4629      	mov	r1, r5
20023fb8:	4638      	mov	r0, r7
20023fba:	2b00      	cmp	r3, #0
20023fbc:	d045      	beq.n	2002404a <HAL_FLASH_Init+0x282>
20023fbe:	f001 f9bb 	bl	20025338 <spi_nand_get_size_by_id>
20023fc2:	4642      	mov	r2, r8
20023fc4:	4629      	mov	r1, r5
20023fc6:	4681      	mov	r9, r0
20023fc8:	4638      	mov	r0, r7
20023fca:	f001 f9bf 	bl	2002534c <spi_nand_get_plane_select_flag>
20023fce:	4642      	mov	r2, r8
20023fd0:	4629      	mov	r1, r5
20023fd2:	f884 0027 	strb.w	r0, [r4, #39]	@ 0x27
20023fd6:	4638      	mov	r0, r7
20023fd8:	f001 f9c1 	bl	2002535e <spi_nand_get_big_page_flag>
20023fdc:	4642      	mov	r2, r8
20023fde:	f884 0024 	strb.w	r0, [r4, #36]	@ 0x24
20023fe2:	4629      	mov	r1, r5
20023fe4:	4638      	mov	r0, r7
20023fe6:	f001 f9c3 	bl	20025370 <spi_nand_get_ecc_mode>
20023fea:	f894 3024 	ldrb.w	r3, [r4, #36]	@ 0x24
20023fee:	ea43 1300 	orr.w	r3, r3, r0, lsl #4
20023ff2:	f884 3024 	strb.w	r3, [r4, #36]	@ 0x24
20023ff6:	f1b9 0f00 	cmp.w	r9, #0
20023ffa:	d003      	beq.n	20024004 <HAL_FLASH_Init+0x23c>
20023ffc:	f8c4 903c 	str.w	r9, [r4, #60]	@ 0x3c
20024000:	f8c4 9014 	str.w	r9, [r4, #20]
20024004:	f894 3023 	ldrb.w	r3, [r4, #35]	@ 0x23
20024008:	2b00      	cmp	r3, #0
2002400a:	d173      	bne.n	200240f4 <HAL_FLASH_Init+0x32c>
2002400c:	2e00      	cmp	r6, #0
2002400e:	d16e      	bne.n	200240ee <HAL_FLASH_Init+0x326>
20024010:	4620      	mov	r0, r4
20024012:	f7ff f97f 	bl	20023314 <HAL_FLASH_CLR_PROTECT>
20024016:	6963      	ldr	r3, [r4, #20]
20024018:	f1b3 7f80 	cmp.w	r3, #16777216	@ 0x1000000
2002401c:	d938      	bls.n	20024090 <HAL_FLASH_Init+0x2c8>
2002401e:	4632      	mov	r2, r6
20024020:	2121      	movs	r1, #33	@ 0x21
20024022:	4620      	mov	r0, r4
20024024:	f7ff f806 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
20024028:	f894 3020 	ldrb.w	r3, [r4, #32]
2002402c:	b98b      	cbnz	r3, 20024052 <HAL_FLASH_Init+0x28a>
2002402e:	4631      	mov	r1, r6
20024030:	4620      	mov	r0, r4
20024032:	f884 6026 	strb.w	r6, [r4, #38]	@ 0x26
20024036:	f7ff f947 	bl	200232c8 <HAL_FLASH_FADDR_SET_QSPI>
2002403a:	2107      	movs	r1, #7
2002403c:	4620      	mov	r0, r4
2002403e:	f7fe febb 	bl	20022db8 <HAL_FLASH_SET_ROW_BOUNDARY>
20024042:	2000      	movs	r0, #0
20024044:	b007      	add	sp, #28
20024046:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
2002404a:	f001 f91d 	bl	20025288 <spi_flash_get_size_by_id>
2002404e:	4681      	mov	r9, r0
20024050:	e7d1      	b.n	20023ff6 <HAL_FLASH_Init+0x22e>
20024052:	2101      	movs	r1, #1
20024054:	4620      	mov	r0, r4
20024056:	f7ff f937 	bl	200232c8 <HAL_FLASH_FADDR_SET_QSPI>
2002405a:	f894 9026 	ldrb.w	r9, [r4, #38]	@ 0x26
2002405e:	f1b9 0f01 	cmp.w	r9, #1
20024062:	d1ea      	bne.n	2002403a <HAL_FLASH_Init+0x272>
20024064:	4642      	mov	r2, r8
20024066:	4629      	mov	r1, r5
20024068:	4638      	mov	r0, r7
2002406a:	f001 f917 	bl	2002529c <spi_flash_is_support_dtr>
2002406e:	b138      	cbz	r0, 20024080 <HAL_FLASH_Init+0x2b8>
20024070:	4620      	mov	r0, r4
20024072:	f7ff fe85 	bl	20023d80 <HAL_NOR_DTR_CAL>
20024076:	4649      	mov	r1, r9
20024078:	4620      	mov	r0, r4
2002407a:	f7ff fe3a 	bl	20023cf2 <HAL_NOR_CFG_DTR>
2002407e:	e7dc      	b.n	2002403a <HAL_FLASH_Init+0x272>
20024080:	4632      	mov	r2, r6
20024082:	4631      	mov	r1, r6
20024084:	4620      	mov	r0, r4
20024086:	f7fe fef5 	bl	20022e74 <HAL_MPI_CFG_DTR>
2002408a:	f884 6026 	strb.w	r6, [r4, #38]	@ 0x26
2002408e:	e7d4      	b.n	2002403a <HAL_FLASH_Init+0x272>
20024090:	f894 3020 	ldrb.w	r3, [r4, #32]
20024094:	b933      	cbnz	r3, 200240a4 <HAL_FLASH_Init+0x2dc>
20024096:	4631      	mov	r1, r6
20024098:	4620      	mov	r0, r4
2002409a:	f884 6026 	strb.w	r6, [r4, #38]	@ 0x26
2002409e:	f7ff f908 	bl	200232b2 <HAL_FLASH_SET_QUAL_SPI>
200240a2:	e7ce      	b.n	20024042 <HAL_FLASH_Init+0x27a>
200240a4:	2101      	movs	r1, #1
200240a6:	4620      	mov	r0, r4
200240a8:	f7ff f903 	bl	200232b2 <HAL_FLASH_SET_QUAL_SPI>
200240ac:	f894 9026 	ldrb.w	r9, [r4, #38]	@ 0x26
200240b0:	f1b9 0f01 	cmp.w	r9, #1
200240b4:	d115      	bne.n	200240e2 <HAL_FLASH_Init+0x31a>
200240b6:	4642      	mov	r2, r8
200240b8:	4629      	mov	r1, r5
200240ba:	4638      	mov	r0, r7
200240bc:	f001 f8ee 	bl	2002529c <spi_flash_is_support_dtr>
200240c0:	b138      	cbz	r0, 200240d2 <HAL_FLASH_Init+0x30a>
200240c2:	4620      	mov	r0, r4
200240c4:	f7ff fe5c 	bl	20023d80 <HAL_NOR_DTR_CAL>
200240c8:	4649      	mov	r1, r9
200240ca:	4620      	mov	r0, r4
200240cc:	f7ff fe11 	bl	20023cf2 <HAL_NOR_CFG_DTR>
200240d0:	e7b7      	b.n	20024042 <HAL_FLASH_Init+0x27a>
200240d2:	4632      	mov	r2, r6
200240d4:	4631      	mov	r1, r6
200240d6:	4620      	mov	r0, r4
200240d8:	f7fe fecc 	bl	20022e74 <HAL_MPI_CFG_DTR>
200240dc:	f884 6026 	strb.w	r6, [r4, #38]	@ 0x26
200240e0:	e7af      	b.n	20024042 <HAL_FLASH_Init+0x27a>
200240e2:	4632      	mov	r2, r6
200240e4:	4631      	mov	r1, r6
200240e6:	4620      	mov	r0, r4
200240e8:	f7fe fec4 	bl	20022e74 <HAL_MPI_CFG_DTR>
200240ec:	e7a9      	b.n	20024042 <HAL_FLASH_Init+0x27a>
200240ee:	f884 3026 	strb.w	r3, [r4, #38]	@ 0x26
200240f2:	e7a6      	b.n	20024042 <HAL_FLASH_Init+0x27a>
200240f4:	2101      	movs	r1, #1
200240f6:	4620      	mov	r0, r4
200240f8:	f7fe fcfd 	bl	20022af6 <HAL_FLASH_WRITE_DLEN>
200240fc:	68e3      	ldr	r3, [r4, #12]
200240fe:	2102      	movs	r1, #2
20024100:	791a      	ldrb	r2, [r3, #4]
20024102:	4620      	mov	r0, r4
20024104:	f7fe ff96 	bl	20023034 <HAL_FLASH_ISSUE_CMD>
20024108:	4620      	mov	r0, r4
2002410a:	f7fe fd4a 	bl	20022ba2 <HAL_FLASH_READ32>
2002410e:	4605      	mov	r5, r0
20024110:	200a      	movs	r0, #10
20024112:	f7fd ff28 	bl	20021f66 <HAL_Delay_us>
20024116:	07eb      	lsls	r3, r5, #31
20024118:	d4ec      	bmi.n	200240f4 <HAL_FLASH_Init+0x32c>
2002411a:	4620      	mov	r0, r4
2002411c:	f7ff fb95 	bl	2002384a <nand_clear_status>
20024120:	f894 3020 	ldrb.w	r3, [r4, #32]
20024124:	2b02      	cmp	r3, #2
20024126:	d18c      	bne.n	20024042 <HAL_FLASH_Init+0x27a>
20024128:	2101      	movs	r1, #1
2002412a:	4620      	mov	r0, r4
2002412c:	f7ff fb5c 	bl	200237e8 <HAL_NAND_EN_QUAL>
20024130:	e787      	b.n	20024042 <HAL_FLASH_Init+0x27a>
20024132:	bf00      	nop
20024134:	05f5e100 	.word	0x05f5e100

20024138 <HAL_Delay_us_psram>:
20024138:	b51f      	push	{r0, r1, r2, r3, r4, lr}
2002413a:	9001      	str	r0, [sp, #4]
2002413c:	9b01      	ldr	r3, [sp, #4]
2002413e:	4c11      	ldr	r4, [pc, #68]	@ (20024184 <HAL_Delay_us_psram+0x4c>)
20024140:	b10b      	cbz	r3, 20024146 <HAL_Delay_us_psram+0xe>
20024142:	6820      	ldr	r0, [r4, #0]
20024144:	b940      	cbnz	r0, 20024158 <HAL_Delay_us_psram+0x20>
20024146:	2000      	movs	r0, #0
20024148:	f000 feda 	bl	20024f00 <HAL_RCC_GetHCLKFreq>
2002414c:	4b0e      	ldr	r3, [pc, #56]	@ (20024188 <HAL_Delay_us_psram+0x50>)
2002414e:	fbb0 f0f3 	udiv	r0, r0, r3
20024152:	9b01      	ldr	r3, [sp, #4]
20024154:	6020      	str	r0, [r4, #0]
20024156:	b19b      	cbz	r3, 20024180 <HAL_Delay_us_psram+0x48>
20024158:	2830      	cmp	r0, #48	@ 0x30
2002415a:	bf82      	ittt	hi
2002415c:	9b01      	ldrhi	r3, [sp, #4]
2002415e:	f103 33ff 	addhi.w	r3, r3, #4294967295	@ 0xffffffff
20024162:	9301      	strhi	r3, [sp, #4]
20024164:	9b01      	ldr	r3, [sp, #4]
20024166:	b15b      	cbz	r3, 20024180 <HAL_Delay_us_psram+0x48>
20024168:	2205      	movs	r2, #5
2002416a:	9b01      	ldr	r3, [sp, #4]
2002416c:	3b01      	subs	r3, #1
2002416e:	4343      	muls	r3, r0
20024170:	fbb3 f3f2 	udiv	r3, r3, r2
20024174:	9303      	str	r3, [sp, #12]
20024176:	9b03      	ldr	r3, [sp, #12]
20024178:	1e5a      	subs	r2, r3, #1
2002417a:	9203      	str	r2, [sp, #12]
2002417c:	2b00      	cmp	r3, #0
2002417e:	d1fa      	bne.n	20024176 <HAL_Delay_us_psram+0x3e>
20024180:	b004      	add	sp, #16
20024182:	bd10      	pop	{r4, pc}
20024184:	2004cbc8 	.word	0x2004cbc8
20024188:	000f4240 	.word	0x000f4240

2002418c <HAL_MPI_OPSRAM_CAL_DELAY>:
2002418c:	b570      	push	{r4, r5, r6, lr}
2002418e:	460e      	mov	r6, r1
20024190:	4615      	mov	r5, r2
20024192:	4604      	mov	r4, r0
20024194:	b358      	cbz	r0, 200241ee <HAL_MPI_OPSRAM_CAL_DELAY+0x62>
20024196:	2202      	movs	r2, #2
20024198:	6803      	ldr	r3, [r0, #0]
2002419a:	60da      	str	r2, [r3, #12]
2002419c:	6802      	ldr	r2, [r0, #0]
2002419e:	6d93      	ldr	r3, [r2, #88]	@ 0x58
200241a0:	f023 7300 	bic.w	r3, r3, #33554432	@ 0x2000000
200241a4:	6593      	str	r3, [r2, #88]	@ 0x58
200241a6:	6802      	ldr	r2, [r0, #0]
200241a8:	2000      	movs	r0, #0
200241aa:	f8d2 3094 	ldr.w	r3, [r2, #148]	@ 0x94
200241ae:	f043 4300 	orr.w	r3, r3, #2147483648	@ 0x80000000
200241b2:	f8c2 3094 	str.w	r3, [r2, #148]	@ 0x94
200241b6:	f7ff ffbf 	bl	20024138 <HAL_Delay_us_psram>
200241ba:	2014      	movs	r0, #20
200241bc:	f7ff ffbc 	bl	20024138 <HAL_Delay_us_psram>
200241c0:	6820      	ldr	r0, [r4, #0]
200241c2:	f8d0 3094 	ldr.w	r3, [r0, #148]	@ 0x94
200241c6:	05db      	lsls	r3, r3, #23
200241c8:	d5fb      	bpl.n	200241c2 <HAL_MPI_OPSRAM_CAL_DELAY+0x36>
200241ca:	f8d0 3094 	ldr.w	r3, [r0, #148]	@ 0x94
200241ce:	f8d0 2094 	ldr.w	r2, [r0, #148]	@ 0x94
200241d2:	b2db      	uxtb	r3, r3
200241d4:	f022 4200 	bic.w	r2, r2, #2147483648	@ 0x80000000
200241d8:	f8c0 2094 	str.w	r2, [r0, #148]	@ 0x94
200241dc:	1e5a      	subs	r2, r3, #1
200241de:	7032      	strb	r2, [r6, #0]
200241e0:	2201      	movs	r2, #1
200241e2:	2000      	movs	r0, #0
200241e4:	3b04      	subs	r3, #4
200241e6:	702b      	strb	r3, [r5, #0]
200241e8:	6823      	ldr	r3, [r4, #0]
200241ea:	60da      	str	r2, [r3, #12]
200241ec:	bd70      	pop	{r4, r5, r6, pc}
200241ee:	2001      	movs	r0, #1
200241f0:	e7fc      	b.n	200241ec <HAL_MPI_OPSRAM_CAL_DELAY+0x60>
	...

200241f4 <HAL_SPI_PSRAM_Init>:
200241f4:	b537      	push	{r0, r1, r2, r4, r5, lr}
200241f6:	4614      	mov	r4, r2
200241f8:	4605      	mov	r5, r0
200241fa:	2800      	cmp	r0, #0
200241fc:	d043      	beq.n	20024286 <HAL_SPI_PSRAM_Init+0x92>
200241fe:	2900      	cmp	r1, #0
20024200:	d041      	beq.n	20024286 <HAL_SPI_PSRAM_Init+0x92>
20024202:	f7fe fbff 	bl	20022a04 <HAL_QSPI_Init>
20024206:	4628      	mov	r0, r5
20024208:	b2e1      	uxtb	r1, r4
2002420a:	f7fe fcd5 	bl	20022bb8 <HAL_FLASH_SET_CLK_rom>
2002420e:	4628      	mov	r0, r5
20024210:	f7ff fd54 	bl	20023cbc <HAL_QSPI_GET_CLK>
20024214:	4b1d      	ldr	r3, [pc, #116]	@ (2002428c <HAL_SPI_PSRAM_Init+0x98>)
20024216:	4298      	cmp	r0, r3
20024218:	d930      	bls.n	2002427c <HAL_SPI_PSRAM_Init+0x88>
2002421a:	4b1d      	ldr	r3, [pc, #116]	@ (20024290 <HAL_SPI_PSRAM_Init+0x9c>)
2002421c:	4298      	cmp	r0, r3
2002421e:	d92f      	bls.n	20024280 <HAL_SPI_PSRAM_Init+0x8c>
20024220:	4b1c      	ldr	r3, [pc, #112]	@ (20024294 <HAL_SPI_PSRAM_Init+0xa0>)
20024222:	4298      	cmp	r0, r3
20024224:	d922      	bls.n	2002426c <HAL_SPI_PSRAM_Init+0x78>
20024226:	f240 34b6 	movw	r4, #950	@ 0x3b6
2002422a:	f240 4374 	movw	r3, #1140	@ 0x474
2002422e:	4a1a      	ldr	r2, [pc, #104]	@ (20024298 <HAL_SPI_PSRAM_Init+0xa4>)
20024230:	4290      	cmp	r0, r2
20024232:	bf88      	it	hi
20024234:	461c      	movhi	r4, r3
20024236:	2200      	movs	r2, #0
20024238:	2101      	movs	r1, #1
2002423a:	4628      	mov	r0, r5
2002423c:	f7ff f8fa 	bl	20023434 <HAL_QSPI_SET_CLK_INV>
20024240:	2100      	movs	r1, #0
20024242:	4622      	mov	r2, r4
20024244:	2302      	movs	r3, #2
20024246:	4628      	mov	r0, r5
20024248:	9100      	str	r1, [sp, #0]
2002424a:	f7fe fda0 	bl	20022d8e <HAL_FLASH_SET_CS_TIME>
2002424e:	4604      	mov	r4, r0
20024250:	b948      	cbnz	r0, 20024266 <HAL_SPI_PSRAM_Init+0x72>
20024252:	2106      	movs	r1, #6
20024254:	4628      	mov	r0, r5
20024256:	f7fe fdaf 	bl	20022db8 <HAL_FLASH_SET_ROW_BOUNDARY>
2002425a:	4604      	mov	r4, r0
2002425c:	b918      	cbnz	r0, 20024266 <HAL_SPI_PSRAM_Init+0x72>
2002425e:	2101      	movs	r1, #1
20024260:	4628      	mov	r0, r5
20024262:	f7fe fd4e 	bl	20022d02 <HAL_FLASH_ENABLE_QSPI>
20024266:	4620      	mov	r0, r4
20024268:	b003      	add	sp, #12
2002426a:	bd30      	pop	{r4, r5, pc}
2002426c:	4b0b      	ldr	r3, [pc, #44]	@ (2002429c <HAL_SPI_PSRAM_Init+0xa8>)
2002426e:	f44f 743e 	mov.w	r4, #760	@ 0x2f8
20024272:	4298      	cmp	r0, r3
20024274:	d8df      	bhi.n	20024236 <HAL_SPI_PSRAM_Init+0x42>
20024276:	2200      	movs	r2, #0
20024278:	4611      	mov	r1, r2
2002427a:	e7de      	b.n	2002423a <HAL_SPI_PSRAM_Init+0x46>
2002427c:	24b4      	movs	r4, #180	@ 0xb4
2002427e:	e7fa      	b.n	20024276 <HAL_SPI_PSRAM_Init+0x82>
20024280:	f44f 74be 	mov.w	r4, #380	@ 0x17c
20024284:	e7f7      	b.n	20024276 <HAL_SPI_PSRAM_Init+0x82>
20024286:	2401      	movs	r4, #1
20024288:	e7ed      	b.n	20024266 <HAL_SPI_PSRAM_Init+0x72>
2002428a:	bf00      	nop
2002428c:	016e3600 	.word	0x016e3600
20024290:	02dc6c00 	.word	0x02dc6c00
20024294:	05b8d800 	.word	0x05b8d800
20024298:	07270e00 	.word	0x07270e00
2002429c:	03938700 	.word	0x03938700

200242a0 <HAL_MPI_MR_WRITE>:
200242a0:	b5f0      	push	{r4, r5, r6, r7, lr}
200242a2:	460e      	mov	r6, r1
200242a4:	4617      	mov	r7, r2
200242a6:	4605      	mov	r5, r0
200242a8:	b087      	sub	sp, #28
200242aa:	b1d8      	cbz	r0, 200242e4 <HAL_MPI_MR_WRITE+0x44>
200242ac:	2207      	movs	r2, #7
200242ae:	2400      	movs	r4, #0
200242b0:	2303      	movs	r3, #3
200242b2:	e9cd 2203 	strd	r2, r2, [sp, #12]
200242b6:	2101      	movs	r1, #1
200242b8:	e9cd 4301 	strd	r4, r3, [sp, #4]
200242bc:	9400      	str	r4, [sp, #0]
200242be:	4623      	mov	r3, r4
200242c0:	f7fe fc83 	bl	20022bca <HAL_FLASH_MANUAL_CMD>
200242c4:	2102      	movs	r1, #2
200242c6:	4628      	mov	r0, r5
200242c8:	f7fe fc15 	bl	20022af6 <HAL_FLASH_WRITE_DLEN>
200242cc:	4639      	mov	r1, r7
200242ce:	4628      	mov	r0, r5
200242d0:	f7fe fc0a 	bl	20022ae8 <HAL_FLASH_WRITE_WORD>
200242d4:	4632      	mov	r2, r6
200242d6:	21c0      	movs	r1, #192	@ 0xc0
200242d8:	4628      	mov	r0, r5
200242da:	f7fe fc31 	bl	20022b40 <HAL_FLASH_SET_CMD>
200242de:	4620      	mov	r0, r4
200242e0:	b007      	add	sp, #28
200242e2:	bdf0      	pop	{r4, r5, r6, r7, pc}
200242e4:	2001      	movs	r0, #1
200242e6:	e7fb      	b.n	200242e0 <HAL_MPI_MR_WRITE+0x40>

200242e8 <HAL_MPI_SET_FIXLAT>:
200242e8:	e92d 41ff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
200242ec:	460c      	mov	r4, r1
200242ee:	4616      	mov	r6, r2
200242f0:	461f      	mov	r7, r3
200242f2:	4605      	mov	r5, r0
200242f4:	2800      	cmp	r0, #0
200242f6:	d040      	beq.n	2002437a <HAL_MPI_SET_FIXLAT+0x92>
200242f8:	466b      	mov	r3, sp
200242fa:	4a21      	ldr	r2, [pc, #132]	@ (20024380 <HAL_MPI_SET_FIXLAT+0x98>)
200242fc:	6810      	ldr	r0, [r2, #0]
200242fe:	6851      	ldr	r1, [r2, #4]
20024300:	c303      	stmia	r3!, {r0, r1}
20024302:	6890      	ldr	r0, [r2, #8]
20024304:	68d1      	ldr	r1, [r2, #12]
20024306:	c303      	stmia	r3!, {r0, r1}
20024308:	4628      	mov	r0, r5
2002430a:	b2e1      	uxtb	r1, r4
2002430c:	f7fe fd7a 	bl	20022e04 <HAL_MPI_EN_FIXLAT>
20024310:	f107 0310 	add.w	r3, r7, #16
20024314:	446b      	add	r3, sp
20024316:	f813 8c08 	ldrb.w	r8, [r3, #-8]
2002431a:	ea4f 1848 	mov.w	r8, r8, lsl #5
2002431e:	fa5f f888 	uxtb.w	r8, r8
20024322:	b30c      	cbz	r4, 20024368 <HAL_MPI_SET_FIXLAT+0x80>
20024324:	ab04      	add	r3, sp, #16
20024326:	eb03 0356 	add.w	r3, r3, r6, lsr #1
2002432a:	f813 4c10 	ldrb.w	r4, [r3, #-16]
2002432e:	00a4      	lsls	r4, r4, #2
20024330:	f044 0421 	orr.w	r4, r4, #33	@ 0x21
20024334:	b264      	sxtb	r4, r4
20024336:	f004 02fd 	and.w	r2, r4, #253	@ 0xfd
2002433a:	2100      	movs	r1, #0
2002433c:	4628      	mov	r0, r5
2002433e:	f7ff ffaf 	bl	200242a0 <HAL_MPI_MR_WRITE>
20024342:	1e71      	subs	r1, r6, #1
20024344:	4628      	mov	r0, r5
20024346:	b249      	sxtb	r1, r1
20024348:	f7fe fdba 	bl	20022ec0 <HAL_MPI_MODIFY_RCMD_DELAY>
2002434c:	4642      	mov	r2, r8
2002434e:	2104      	movs	r1, #4
20024350:	4628      	mov	r0, r5
20024352:	f7ff ffa5 	bl	200242a0 <HAL_MPI_MR_WRITE>
20024356:	1e79      	subs	r1, r7, #1
20024358:	4628      	mov	r0, r5
2002435a:	b249      	sxtb	r1, r1
2002435c:	f7fe fdb9 	bl	20022ed2 <HAL_MPI_MODIFY_WCMD_DELAY>
20024360:	2000      	movs	r0, #0
20024362:	b004      	add	sp, #16
20024364:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
20024368:	f106 0310 	add.w	r3, r6, #16
2002436c:	446b      	add	r3, sp
2002436e:	f813 4c10 	ldrb.w	r4, [r3, #-16]
20024372:	00a4      	lsls	r4, r4, #2
20024374:	f044 0401 	orr.w	r4, r4, #1
20024378:	e7dc      	b.n	20024334 <HAL_MPI_SET_FIXLAT+0x4c>
2002437a:	2001      	movs	r0, #1
2002437c:	e7f1      	b.n	20024362 <HAL_MPI_SET_FIXLAT+0x7a>
2002437e:	bf00      	nop
20024380:	2002b070 	.word	0x2002b070

20024384 <HAL_LEGACY_MR_WRITE>:
20024384:	b5f0      	push	{r4, r5, r6, r7, lr}
20024386:	460e      	mov	r6, r1
20024388:	4617      	mov	r7, r2
2002438a:	4605      	mov	r5, r0
2002438c:	b087      	sub	sp, #28
2002438e:	b1d8      	cbz	r0, 200243c8 <HAL_LEGACY_MR_WRITE+0x44>
20024390:	2207      	movs	r2, #7
20024392:	2400      	movs	r4, #0
20024394:	2302      	movs	r3, #2
20024396:	e9cd 2203 	strd	r2, r2, [sp, #12]
2002439a:	2101      	movs	r1, #1
2002439c:	e9cd 4301 	strd	r4, r3, [sp, #4]
200243a0:	9400      	str	r4, [sp, #0]
200243a2:	4623      	mov	r3, r4
200243a4:	f7fe fc11 	bl	20022bca <HAL_FLASH_MANUAL_CMD>
200243a8:	2104      	movs	r1, #4
200243aa:	4628      	mov	r0, r5
200243ac:	f7fe fba3 	bl	20022af6 <HAL_FLASH_WRITE_DLEN>
200243b0:	4639      	mov	r1, r7
200243b2:	4628      	mov	r0, r5
200243b4:	f7fe fb98 	bl	20022ae8 <HAL_FLASH_WRITE_WORD>
200243b8:	4632      	mov	r2, r6
200243ba:	21c0      	movs	r1, #192	@ 0xc0
200243bc:	4628      	mov	r0, r5
200243be:	f7fe fbbf 	bl	20022b40 <HAL_FLASH_SET_CMD>
200243c2:	4620      	mov	r0, r4
200243c4:	b007      	add	sp, #28
200243c6:	bdf0      	pop	{r4, r5, r6, r7, pc}
200243c8:	2001      	movs	r0, #1
200243ca:	e7fb      	b.n	200243c4 <HAL_LEGACY_MR_WRITE+0x40>

200243cc <HAL_LEGACY_CFG_READ>:
200243cc:	b530      	push	{r4, r5, lr}
200243ce:	4605      	mov	r5, r0
200243d0:	b085      	sub	sp, #20
200243d2:	b1a0      	cbz	r0, 200243fe <HAL_LEGACY_CFG_READ+0x32>
200243d4:	2400      	movs	r4, #0
200243d6:	2107      	movs	r1, #7
200243d8:	2302      	movs	r3, #2
200243da:	f890 2025 	ldrb.w	r2, [r0, #37]	@ 0x25
200243de:	e9cd 1102 	strd	r1, r1, [sp, #8]
200243e2:	0052      	lsls	r2, r2, #1
200243e4:	e9cd 4300 	strd	r4, r3, [sp]
200243e8:	b252      	sxtb	r2, r2
200243ea:	4623      	mov	r3, r4
200243ec:	f7fe fb36 	bl	20022a5c <HAL_FLASH_CFG_AHB_RCMD>
200243f0:	4621      	mov	r1, r4
200243f2:	4628      	mov	r0, r5
200243f4:	f7fe fb27 	bl	20022a46 <HAL_FLASH_SET_AHB_RCMD>
200243f8:	4620      	mov	r0, r4
200243fa:	b005      	add	sp, #20
200243fc:	bd30      	pop	{r4, r5, pc}
200243fe:	2001      	movs	r0, #1
20024400:	e7fb      	b.n	200243fa <HAL_LEGACY_CFG_READ+0x2e>

20024402 <HAL_LEGACY_CFG_WRITE>:
20024402:	b530      	push	{r4, r5, lr}
20024404:	4605      	mov	r5, r0
20024406:	b085      	sub	sp, #20
20024408:	b190      	cbz	r0, 20024430 <HAL_LEGACY_CFG_WRITE+0x2e>
2002440a:	2107      	movs	r1, #7
2002440c:	2400      	movs	r4, #0
2002440e:	2302      	movs	r3, #2
20024410:	e9cd 1102 	strd	r1, r1, [sp, #8]
20024414:	e9cd 4300 	strd	r4, r3, [sp]
20024418:	4623      	mov	r3, r4
2002441a:	f990 2026 	ldrsb.w	r2, [r0, #38]	@ 0x26
2002441e:	f7fe fb46 	bl	20022aae <HAL_FLASH_CFG_AHB_WCMD>
20024422:	2180      	movs	r1, #128	@ 0x80
20024424:	4628      	mov	r0, r5
20024426:	f7fe fb36 	bl	20022a96 <HAL_FLASH_SET_AHB_WCMD>
2002442a:	4620      	mov	r0, r4
2002442c:	b005      	add	sp, #20
2002442e:	bd30      	pop	{r4, r5, pc}
20024430:	2001      	movs	r0, #1
20024432:	e7fb      	b.n	2002442c <HAL_LEGACY_CFG_WRITE+0x2a>

20024434 <HAL_PSRAM_RESET>:
20024434:	b5f0      	push	{r4, r5, r6, r7, lr}
20024436:	4604      	mov	r4, r0
20024438:	b087      	sub	sp, #28
2002443a:	2800      	cmp	r0, #0
2002443c:	d03b      	beq.n	200244b6 <HAL_PSRAM_RESET+0x82>
2002443e:	f890 3023 	ldrb.w	r3, [r0, #35]	@ 0x23
20024442:	2b05      	cmp	r3, #5
20024444:	d034      	beq.n	200244b0 <HAL_PSRAM_RESET+0x7c>
20024446:	3b03      	subs	r3, #3
20024448:	2b01      	cmp	r3, #1
2002444a:	d82e      	bhi.n	200244aa <HAL_PSRAM_RESET+0x76>
2002444c:	2601      	movs	r6, #1
2002444e:	2703      	movs	r7, #3
20024450:	2300      	movs	r3, #0
20024452:	2507      	movs	r5, #7
20024454:	b276      	sxtb	r6, r6
20024456:	b27f      	sxtb	r7, r7
20024458:	461a      	mov	r2, r3
2002445a:	2101      	movs	r1, #1
2002445c:	4620      	mov	r0, r4
2002445e:	e9cd 5503 	strd	r5, r5, [sp, #12]
20024462:	e9cd 5701 	strd	r5, r7, [sp, #4]
20024466:	9600      	str	r6, [sp, #0]
20024468:	f7fe fbaf 	bl	20022bca <HAL_FLASH_MANUAL_CMD>
2002446c:	2200      	movs	r2, #0
2002446e:	21ff      	movs	r1, #255	@ 0xff
20024470:	4620      	mov	r0, r4
20024472:	f7fe fb65 	bl	20022b40 <HAL_FLASH_SET_CMD>
20024476:	f894 3023 	ldrb.w	r3, [r4, #35]	@ 0x23
2002447a:	2b05      	cmp	r3, #5
2002447c:	d10f      	bne.n	2002449e <HAL_PSRAM_RESET+0x6a>
2002447e:	2300      	movs	r3, #0
20024480:	2101      	movs	r1, #1
20024482:	461a      	mov	r2, r3
20024484:	4620      	mov	r0, r4
20024486:	e9cd 5503 	strd	r5, r5, [sp, #12]
2002448a:	e9cd 5701 	strd	r5, r7, [sp, #4]
2002448e:	9600      	str	r6, [sp, #0]
20024490:	f7fe fb9b 	bl	20022bca <HAL_FLASH_MANUAL_CMD>
20024494:	2200      	movs	r2, #0
20024496:	21ff      	movs	r1, #255	@ 0xff
20024498:	4620      	mov	r0, r4
2002449a:	f7fe fb51 	bl	20022b40 <HAL_FLASH_SET_CMD>
2002449e:	2000      	movs	r0, #0
200244a0:	f7fd fd61 	bl	20021f66 <HAL_Delay_us>
200244a4:	2003      	movs	r0, #3
200244a6:	f7fd fd5e 	bl	20021f66 <HAL_Delay_us>
200244aa:	2000      	movs	r0, #0
200244ac:	b007      	add	sp, #28
200244ae:	bdf0      	pop	{r4, r5, r6, r7, pc}
200244b0:	2603      	movs	r6, #3
200244b2:	2702      	movs	r7, #2
200244b4:	e7cc      	b.n	20024450 <HAL_PSRAM_RESET+0x1c>
200244b6:	2001      	movs	r0, #1
200244b8:	e7f8      	b.n	200244ac <HAL_PSRAM_RESET+0x78>
	...

200244bc <HAL_OPI_PSRAM_Init>:
200244bc:	b530      	push	{r4, r5, lr}
200244be:	4604      	mov	r4, r0
200244c0:	b085      	sub	sp, #20
200244c2:	2800      	cmp	r0, #0
200244c4:	d06e      	beq.n	200245a4 <HAL_OPI_PSRAM_Init+0xe8>
200244c6:	2900      	cmp	r1, #0
200244c8:	d06c      	beq.n	200245a4 <HAL_OPI_PSRAM_Init+0xe8>
200244ca:	f7fe fa9b 	bl	20022a04 <HAL_QSPI_Init>
200244ce:	6823      	ldr	r3, [r4, #0]
200244d0:	f10d 020e 	add.w	r2, sp, #14
200244d4:	f10d 010f 	add.w	r1, sp, #15
200244d8:	4620      	mov	r0, r4
200244da:	681d      	ldr	r5, [r3, #0]
200244dc:	f7ff fe56 	bl	2002418c <HAL_MPI_OPSRAM_CAL_DELAY>
200244e0:	2101      	movs	r1, #1
200244e2:	4620      	mov	r0, r4
200244e4:	f7fe fb68 	bl	20022bb8 <HAL_FLASH_SET_CLK_rom>
200244e8:	4620      	mov	r0, r4
200244ea:	f7ff fbe7 	bl	20023cbc <HAL_QSPI_GET_CLK>
200244ee:	4b2e      	ldr	r3, [pc, #184]	@ (200245a8 <HAL_OPI_PSRAM_Init+0xec>)
200244f0:	f005 0501 	and.w	r5, r5, #1
200244f4:	4298      	cmp	r0, r3
200244f6:	d836      	bhi.n	20024566 <HAL_OPI_PSRAM_Init+0xaa>
200244f8:	2314      	movs	r3, #20
200244fa:	2103      	movs	r1, #3
200244fc:	f88d 300e 	strb.w	r3, [sp, #14]
20024500:	f88d 300f 	strb.w	r3, [sp, #15]
20024504:	4608      	mov	r0, r1
20024506:	2300      	movs	r3, #0
20024508:	22b4      	movs	r2, #180	@ 0xb4
2002450a:	f884 1025 	strb.w	r1, [r4, #37]	@ 0x25
2002450e:	f884 1026 	strb.w	r1, [r4, #38]	@ 0x26
20024512:	2106      	movs	r1, #6
20024514:	9000      	str	r0, [sp, #0]
20024516:	4620      	mov	r0, r4
20024518:	f7fe fc39 	bl	20022d8e <HAL_FLASH_SET_CS_TIME>
2002451c:	2107      	movs	r1, #7
2002451e:	4620      	mov	r0, r4
20024520:	f7fe fc4a 	bl	20022db8 <HAL_FLASH_SET_ROW_BOUNDARY>
20024524:	2101      	movs	r1, #1
20024526:	4620      	mov	r0, r4
20024528:	f7fe fc7a 	bl	20022e20 <HAL_MPI_ENABLE_DQS>
2002452c:	f89d 100e 	ldrb.w	r1, [sp, #14]
20024530:	4620      	mov	r0, r4
20024532:	f7fe fc83 	bl	20022e3c <HAL_MPI_SET_DQS_DELAY>
20024536:	2200      	movs	r2, #0
20024538:	f89d 100f 	ldrb.w	r1, [sp, #15]
2002453c:	4620      	mov	r0, r4
2002453e:	f7fe fc89 	bl	20022e54 <HAL_MPI_SET_SCK>
20024542:	2101      	movs	r1, #1
20024544:	4620      	mov	r0, r4
20024546:	f7fe fbdc 	bl	20022d02 <HAL_FLASH_ENABLE_QSPI>
2002454a:	2101      	movs	r1, #1
2002454c:	4620      	mov	r0, r4
2002454e:	f7fe fbe6 	bl	20022d1e <HAL_FLASH_ENABLE_OPI>
20024552:	b92d      	cbnz	r5, 20024560 <HAL_OPI_PSRAM_Init+0xa4>
20024554:	4b15      	ldr	r3, [pc, #84]	@ (200245ac <HAL_OPI_PSRAM_Init+0xf0>)
20024556:	681b      	ldr	r3, [r3, #0]
20024558:	f003 0303 	and.w	r3, r3, #3
2002455c:	2b03      	cmp	r3, #3
2002455e:	d11d      	bne.n	2002459c <HAL_OPI_PSRAM_Init+0xe0>
20024560:	2000      	movs	r0, #0
20024562:	b005      	add	sp, #20
20024564:	bd30      	pop	{r4, r5, pc}
20024566:	4b12      	ldr	r3, [pc, #72]	@ (200245b0 <HAL_OPI_PSRAM_Init+0xf4>)
20024568:	4298      	cmp	r0, r3
2002456a:	d90b      	bls.n	20024584 <HAL_OPI_PSRAM_Init+0xc8>
2002456c:	f103 7337 	add.w	r3, r3, #47972352	@ 0x2dc0000
20024570:	f503 43d8 	add.w	r3, r3, #27648	@ 0x6c00
20024574:	4298      	cmp	r0, r3
20024576:	d90b      	bls.n	20024590 <HAL_OPI_PSRAM_Init+0xd4>
20024578:	2107      	movs	r1, #7
2002457a:	2014      	movs	r0, #20
2002457c:	2308      	movs	r3, #8
2002457e:	f240 5232 	movw	r2, #1330	@ 0x532
20024582:	e7c2      	b.n	2002450a <HAL_OPI_PSRAM_Init+0x4e>
20024584:	2105      	movs	r1, #5
20024586:	200e      	movs	r0, #14
20024588:	2303      	movs	r3, #3
2002458a:	f240 32b6 	movw	r2, #950	@ 0x3b6
2002458e:	e7bc      	b.n	2002450a <HAL_OPI_PSRAM_Init+0x4e>
20024590:	2106      	movs	r1, #6
20024592:	2011      	movs	r0, #17
20024594:	2305      	movs	r3, #5
20024596:	f240 4274 	movw	r2, #1140	@ 0x474
2002459a:	e7b6      	b.n	2002450a <HAL_OPI_PSRAM_Init+0x4e>
2002459c:	4620      	mov	r0, r4
2002459e:	f7ff ff49 	bl	20024434 <HAL_PSRAM_RESET>
200245a2:	e7dd      	b.n	20024560 <HAL_OPI_PSRAM_Init+0xa4>
200245a4:	2001      	movs	r0, #1
200245a6:	e7dc      	b.n	20024562 <HAL_OPI_PSRAM_Init+0xa6>
200245a8:	02dc6c01 	.word	0x02dc6c01
200245ac:	500c0000 	.word	0x500c0000
200245b0:	0e4e1c01 	.word	0x0e4e1c01

200245b4 <HAL_LEGACY_PSRAM_Init>:
200245b4:	b5f0      	push	{r4, r5, r6, r7, lr}
200245b6:	4604      	mov	r4, r0
200245b8:	b085      	sub	sp, #20
200245ba:	2800      	cmp	r0, #0
200245bc:	f000 8096 	beq.w	200246ec <HAL_LEGACY_PSRAM_Init+0x138>
200245c0:	2900      	cmp	r1, #0
200245c2:	f000 8093 	beq.w	200246ec <HAL_LEGACY_PSRAM_Init+0x138>
200245c6:	f7fe fa1d 	bl	20022a04 <HAL_QSPI_Init>
200245ca:	6823      	ldr	r3, [r4, #0]
200245cc:	f10d 020e 	add.w	r2, sp, #14
200245d0:	f10d 010f 	add.w	r1, sp, #15
200245d4:	4620      	mov	r0, r4
200245d6:	681e      	ldr	r6, [r3, #0]
200245d8:	f7ff fdd8 	bl	2002418c <HAL_MPI_OPSRAM_CAL_DELAY>
200245dc:	2101      	movs	r1, #1
200245de:	4620      	mov	r0, r4
200245e0:	f7fe faea 	bl	20022bb8 <HAL_FLASH_SET_CLK_rom>
200245e4:	4620      	mov	r0, r4
200245e6:	f7ff fb69 	bl	20023cbc <HAL_QSPI_GET_CLK>
200245ea:	4b41      	ldr	r3, [pc, #260]	@ (200246f0 <HAL_LEGACY_PSRAM_Init+0x13c>)
200245ec:	4605      	mov	r5, r0
200245ee:	4298      	cmp	r0, r3
200245f0:	4f40      	ldr	r7, [pc, #256]	@ (200246f4 <HAL_LEGACY_PSRAM_Init+0x140>)
200245f2:	f006 0601 	and.w	r6, r6, #1
200245f6:	d850      	bhi.n	2002469a <HAL_LEGACY_PSRAM_Init+0xe6>
200245f8:	2314      	movs	r3, #20
200245fa:	2103      	movs	r1, #3
200245fc:	f88d 300e 	strb.w	r3, [sp, #14]
20024600:	f88d 300f 	strb.w	r3, [sp, #15]
20024604:	22b4      	movs	r2, #180	@ 0xb4
20024606:	2300      	movs	r3, #0
20024608:	9100      	str	r1, [sp, #0]
2002460a:	4620      	mov	r0, r4
2002460c:	2106      	movs	r1, #6
2002460e:	f7fe fbbe 	bl	20022d8e <HAL_FLASH_SET_CS_TIME>
20024612:	2107      	movs	r1, #7
20024614:	4620      	mov	r0, r4
20024616:	f7fe fbcf 	bl	20022db8 <HAL_FLASH_SET_ROW_BOUNDARY>
2002461a:	2101      	movs	r1, #1
2002461c:	4620      	mov	r0, r4
2002461e:	f7fe fbff 	bl	20022e20 <HAL_MPI_ENABLE_DQS>
20024622:	f89d 100e 	ldrb.w	r1, [sp, #14]
20024626:	4620      	mov	r0, r4
20024628:	f7fe fc08 	bl	20022e3c <HAL_MPI_SET_DQS_DELAY>
2002462c:	2200      	movs	r2, #0
2002462e:	f89d 100f 	ldrb.w	r1, [sp, #15]
20024632:	4620      	mov	r0, r4
20024634:	f7fe fc0e 	bl	20022e54 <HAL_MPI_SET_SCK>
20024638:	2101      	movs	r1, #1
2002463a:	4620      	mov	r0, r4
2002463c:	f7fe fbc6 	bl	20022dcc <HAL_FLASH_SET_LEGACY>
20024640:	2101      	movs	r1, #1
20024642:	4620      	mov	r0, r4
20024644:	f7fe fb5d 	bl	20022d02 <HAL_FLASH_ENABLE_QSPI>
20024648:	2101      	movs	r1, #1
2002464a:	4620      	mov	r0, r4
2002464c:	f7fe fb67 	bl	20022d1e <HAL_FLASH_ENABLE_OPI>
20024650:	b92e      	cbnz	r6, 2002465e <HAL_LEGACY_PSRAM_Init+0xaa>
20024652:	f894 3027 	ldrb.w	r3, [r4, #39]	@ 0x27
20024656:	b913      	cbnz	r3, 2002465e <HAL_LEGACY_PSRAM_Init+0xaa>
20024658:	4620      	mov	r0, r4
2002465a:	f7ff feeb 	bl	20024434 <HAL_PSRAM_RESET>
2002465e:	42bd      	cmp	r5, r7
20024660:	d93a      	bls.n	200246d8 <HAL_LEGACY_PSRAM_Init+0x124>
20024662:	4b25      	ldr	r3, [pc, #148]	@ (200246f8 <HAL_LEGACY_PSRAM_Init+0x144>)
20024664:	429d      	cmp	r5, r3
20024666:	d93c      	bls.n	200246e2 <HAL_LEGACY_PSRAM_Init+0x12e>
20024668:	2206      	movs	r2, #6
2002466a:	2302      	movs	r3, #2
2002466c:	2588      	movs	r5, #136	@ 0x88
2002466e:	263b      	movs	r6, #59	@ 0x3b
20024670:	f884 3026 	strb.w	r3, [r4, #38]	@ 0x26
20024674:	2101      	movs	r1, #1
20024676:	f884 2025 	strb.w	r2, [r4, #37]	@ 0x25
2002467a:	4620      	mov	r0, r4
2002467c:	f7fe fbc2 	bl	20022e04 <HAL_MPI_EN_FIXLAT>
20024680:	4632      	mov	r2, r6
20024682:	2100      	movs	r1, #0
20024684:	4620      	mov	r0, r4
20024686:	f7ff fe7d 	bl	20024384 <HAL_LEGACY_MR_WRITE>
2002468a:	462a      	mov	r2, r5
2002468c:	2104      	movs	r1, #4
2002468e:	4620      	mov	r0, r4
20024690:	f7ff fe78 	bl	20024384 <HAL_LEGACY_MR_WRITE>
20024694:	2000      	movs	r0, #0
20024696:	b005      	add	sp, #20
20024698:	bdf0      	pop	{r4, r5, r6, r7, pc}
2002469a:	42b8      	cmp	r0, r7
2002469c:	d90d      	bls.n	200246ba <HAL_LEGACY_PSRAM_Init+0x106>
2002469e:	4b16      	ldr	r3, [pc, #88]	@ (200246f8 <HAL_LEGACY_PSRAM_Init+0x144>)
200246a0:	4298      	cmp	r0, r3
200246a2:	d90f      	bls.n	200246c4 <HAL_LEGACY_PSRAM_Init+0x110>
200246a4:	f103 7337 	add.w	r3, r3, #47972352	@ 0x2dc0000
200246a8:	f503 43d8 	add.w	r3, r3, #27648	@ 0x6c00
200246ac:	4298      	cmp	r0, r3
200246ae:	d80e      	bhi.n	200246ce <HAL_LEGACY_PSRAM_Init+0x11a>
200246b0:	2114      	movs	r1, #20
200246b2:	2308      	movs	r3, #8
200246b4:	f240 5232 	movw	r2, #1330	@ 0x532
200246b8:	e7a6      	b.n	20024608 <HAL_LEGACY_PSRAM_Init+0x54>
200246ba:	210e      	movs	r1, #14
200246bc:	2303      	movs	r3, #3
200246be:	f240 32b6 	movw	r2, #950	@ 0x3b6
200246c2:	e7a1      	b.n	20024608 <HAL_LEGACY_PSRAM_Init+0x54>
200246c4:	2111      	movs	r1, #17
200246c6:	2305      	movs	r3, #5
200246c8:	f240 4274 	movw	r2, #1140	@ 0x474
200246cc:	e79c      	b.n	20024608 <HAL_LEGACY_PSRAM_Init+0x54>
200246ce:	2117      	movs	r1, #23
200246d0:	2309      	movs	r3, #9
200246d2:	f44f 62be 	mov.w	r2, #1520	@ 0x5f0
200246d6:	e797      	b.n	20024608 <HAL_LEGACY_PSRAM_Init+0x54>
200246d8:	2204      	movs	r2, #4
200246da:	2300      	movs	r3, #0
200246dc:	2508      	movs	r5, #8
200246de:	2633      	movs	r6, #51	@ 0x33
200246e0:	e7c6      	b.n	20024670 <HAL_LEGACY_PSRAM_Init+0xbc>
200246e2:	2205      	movs	r2, #5
200246e4:	2300      	movs	r3, #0
200246e6:	2508      	movs	r5, #8
200246e8:	2637      	movs	r6, #55	@ 0x37
200246ea:	e7c1      	b.n	20024670 <HAL_LEGACY_PSRAM_Init+0xbc>
200246ec:	2001      	movs	r0, #1
200246ee:	e7d2      	b.n	20024696 <HAL_LEGACY_PSRAM_Init+0xe2>
200246f0:	02dc6c01 	.word	0x02dc6c01
200246f4:	0e4e1c01 	.word	0x0e4e1c01
200246f8:	112a8801 	.word	0x112a8801

200246fc <HAL_HYPER_PSRAM_WriteCR>:
200246fc:	b570      	push	{r4, r5, r6, lr}
200246fe:	460e      	mov	r6, r1
20024700:	4615      	mov	r5, r2
20024702:	4604      	mov	r4, r0
20024704:	b086      	sub	sp, #24
20024706:	b1f8      	cbz	r0, 20024748 <HAL_HYPER_PSRAM_WriteCR+0x4c>
20024708:	2207      	movs	r2, #7
2002470a:	2303      	movs	r3, #3
2002470c:	e9cd 2301 	strd	r2, r3, [sp, #4]
20024710:	2300      	movs	r3, #0
20024712:	e9cd 2203 	strd	r2, r2, [sp, #12]
20024716:	9300      	str	r3, [sp, #0]
20024718:	2101      	movs	r1, #1
2002471a:	f7fe fa56 	bl	20022bca <HAL_FLASH_MANUAL_CMD>
2002471e:	4631      	mov	r1, r6
20024720:	4620      	mov	r0, r4
20024722:	f7fe f9fc 	bl	20022b1e <HAL_FLASH_WRITE_ABYTE>
20024726:	2102      	movs	r1, #2
20024728:	4620      	mov	r0, r4
2002472a:	f7fe f9e4 	bl	20022af6 <HAL_FLASH_WRITE_DLEN>
2002472e:	4629      	mov	r1, r5
20024730:	4620      	mov	r0, r4
20024732:	f7fe f9d9 	bl	20022ae8 <HAL_FLASH_WRITE_WORD>
20024736:	f44f 3280 	mov.w	r2, #65536	@ 0x10000
2002473a:	2160      	movs	r1, #96	@ 0x60
2002473c:	4620      	mov	r0, r4
2002473e:	b006      	add	sp, #24
20024740:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
20024744:	f7fe b9fc 	b.w	20022b40 <HAL_FLASH_SET_CMD>
20024748:	b006      	add	sp, #24
2002474a:	bd70      	pop	{r4, r5, r6, pc}

2002474c <HAL_HYPER_PSRAM_Init>:
2002474c:	b538      	push	{r3, r4, r5, lr}
2002474e:	4604      	mov	r4, r0
20024750:	2201      	movs	r2, #1
20024752:	f7ff feb3 	bl	200244bc <HAL_OPI_PSRAM_Init>
20024756:	4620      	mov	r0, r4
20024758:	f7ff fab0 	bl	20023cbc <HAL_QSPI_GET_CLK>
2002475c:	4b15      	ldr	r3, [pc, #84]	@ (200247b4 <HAL_HYPER_PSRAM_Init+0x68>)
2002475e:	4298      	cmp	r0, r3
20024760:	d91f      	bls.n	200247a2 <HAL_HYPER_PSRAM_Init+0x56>
20024762:	4b15      	ldr	r3, [pc, #84]	@ (200247b8 <HAL_HYPER_PSRAM_Init+0x6c>)
20024764:	4298      	cmp	r0, r3
20024766:	d91f      	bls.n	200247a8 <HAL_HYPER_PSRAM_Init+0x5c>
20024768:	f103 73f4 	add.w	r3, r3, #31981568	@ 0x1e80000
2002476c:	f503 4390 	add.w	r3, r3, #18432	@ 0x4800
20024770:	4298      	cmp	r0, r3
20024772:	d91c      	bls.n	200247ae <HAL_HYPER_PSRAM_Init+0x62>
20024774:	f242 758f 	movw	r5, #10127	@ 0x278f
20024778:	f241 738f 	movw	r3, #6031	@ 0x178f
2002477c:	4a0f      	ldr	r2, [pc, #60]	@ (200247bc <HAL_HYPER_PSRAM_Init+0x70>)
2002477e:	4290      	cmp	r0, r2
20024780:	bf98      	it	ls
20024782:	461d      	movls	r5, r3
20024784:	2101      	movs	r1, #1
20024786:	4620      	mov	r0, r4
20024788:	f7fe fad7 	bl	20022d3a <HAL_FLASH_ENABLE_HYPER>
2002478c:	462a      	mov	r2, r5
2002478e:	4620      	mov	r0, r4
20024790:	2100      	movs	r1, #0
20024792:	f7ff ffb3 	bl	200246fc <HAL_HYPER_PSRAM_WriteCR>
20024796:	2101      	movs	r1, #1
20024798:	4620      	mov	r0, r4
2002479a:	f7fe fb33 	bl	20022e04 <HAL_MPI_EN_FIXLAT>
2002479e:	2000      	movs	r0, #0
200247a0:	bd38      	pop	{r3, r4, r5, pc}
200247a2:	f24e 758f 	movw	r5, #59279	@ 0xe78f
200247a6:	e7ed      	b.n	20024784 <HAL_HYPER_PSRAM_Init+0x38>
200247a8:	f24f 758f 	movw	r5, #63375	@ 0xf78f
200247ac:	e7ea      	b.n	20024784 <HAL_HYPER_PSRAM_Init+0x38>
200247ae:	f240 758f 	movw	r5, #1935	@ 0x78f
200247b2:	e7e7      	b.n	20024784 <HAL_HYPER_PSRAM_Init+0x38>
200247b4:	0a21fe81 	.word	0x0a21fe81
200247b8:	0c65d401 	.word	0x0c65d401
200247bc:	112a8801 	.word	0x112a8801

200247c0 <HAL_HYPER_CFG_READ>:
200247c0:	b51f      	push	{r0, r1, r2, r3, r4, lr}
200247c2:	b160      	cbz	r0, 200247de <HAL_HYPER_CFG_READ+0x1e>
200247c4:	2107      	movs	r1, #7
200247c6:	2303      	movs	r3, #3
200247c8:	f890 2025 	ldrb.w	r2, [r0, #37]	@ 0x25
200247cc:	e9cd 1300 	strd	r1, r3, [sp]
200247d0:	3a01      	subs	r2, #1
200247d2:	2300      	movs	r3, #0
200247d4:	e9cd 1102 	strd	r1, r1, [sp, #8]
200247d8:	b252      	sxtb	r2, r2
200247da:	f7fe f93f 	bl	20022a5c <HAL_FLASH_CFG_AHB_RCMD>
200247de:	b005      	add	sp, #20
200247e0:	f85d fb04 	ldr.w	pc, [sp], #4

200247e4 <HAL_HYPER_CFG_WRITE>:
200247e4:	b51f      	push	{r0, r1, r2, r3, r4, lr}
200247e6:	b160      	cbz	r0, 20024802 <HAL_HYPER_CFG_WRITE+0x1e>
200247e8:	2107      	movs	r1, #7
200247ea:	2303      	movs	r3, #3
200247ec:	f890 2026 	ldrb.w	r2, [r0, #38]	@ 0x26
200247f0:	e9cd 1300 	strd	r1, r3, [sp]
200247f4:	3a01      	subs	r2, #1
200247f6:	2300      	movs	r3, #0
200247f8:	e9cd 1102 	strd	r1, r1, [sp, #8]
200247fc:	b252      	sxtb	r2, r2
200247fe:	f7fe f956 	bl	20022aae <HAL_FLASH_CFG_AHB_WCMD>
20024802:	b005      	add	sp, #20
20024804:	f85d fb04 	ldr.w	pc, [sp], #4

20024808 <HAL_PIN_SetUartFunc.part.0>:
20024808:	108b      	asrs	r3, r1, #2
2002480a:	f1a3 0248 	sub.w	r2, r3, #72	@ 0x48
2002480e:	b5f0      	push	{r4, r5, r6, r7, lr}
20024810:	b2d6      	uxtb	r6, r2
20024812:	2e04      	cmp	r6, #4
20024814:	d849      	bhi.n	200248aa <HAL_PIN_SetUartFunc.part.0+0xa2>
20024816:	2e02      	cmp	r6, #2
20024818:	d810      	bhi.n	2002483c <HAL_PIN_SetUartFunc.part.0+0x34>
2002481a:	4d25      	ldr	r5, [pc, #148]	@ (200248b0 <HAL_PIN_SetUartFunc.part.0+0xa8>)
2002481c:	240e      	movs	r4, #14
2002481e:	eb05 0582 	add.w	r5, r5, r2, lsl #2
20024822:	f240 22b2 	movw	r2, #690	@ 0x2b2
20024826:	eba1 0386 	sub.w	r3, r1, r6, lsl #2
2002482a:	b29b      	uxth	r3, r3
2002482c:	f5a3 7390 	sub.w	r3, r3, #288	@ 0x120
20024830:	2b03      	cmp	r3, #3
20024832:	d83a      	bhi.n	200248aa <HAL_PIN_SetUartFunc.part.0+0xa2>
20024834:	e8df f003 	tbb	[pc, r3]
20024838:	20271a09 	.word	0x20271a09
2002483c:	4d1d      	ldr	r5, [pc, #116]	@ (200248b4 <HAL_PIN_SetUartFunc.part.0+0xac>)
2002483e:	009b      	lsls	r3, r3, #2
20024840:	243d      	movs	r4, #61	@ 0x3d
20024842:	f240 3221 	movw	r2, #801	@ 0x321
20024846:	441d      	add	r5, r3
20024848:	e7ed      	b.n	20024826 <HAL_PIN_SetUartFunc.part.0+0x1e>
2002484a:	2c0e      	cmp	r4, #14
2002484c:	f04f 0608 	mov.w	r6, #8
20024850:	d120      	bne.n	20024894 <HAL_PIN_SetUartFunc.part.0+0x8c>
20024852:	f44f 517c 	mov.w	r1, #16128	@ 0x3f00
20024856:	682f      	ldr	r7, [r5, #0]
20024858:	1b03      	subs	r3, r0, r4
2002485a:	40b3      	lsls	r3, r6
2002485c:	407b      	eors	r3, r7
2002485e:	400b      	ands	r3, r1
20024860:	4410      	add	r0, r2
20024862:	407b      	eors	r3, r7
20024864:	1b00      	subs	r0, r0, r4
20024866:	602b      	str	r3, [r5, #0]
20024868:	b280      	uxth	r0, r0
2002486a:	bdf0      	pop	{r4, r5, r6, r7, pc}
2002486c:	2c0e      	cmp	r4, #14
2002486e:	f04f 0600 	mov.w	r6, #0
20024872:	d112      	bne.n	2002489a <HAL_PIN_SetUartFunc.part.0+0x92>
20024874:	213f      	movs	r1, #63	@ 0x3f
20024876:	e7ee      	b.n	20024856 <HAL_PIN_SetUartFunc.part.0+0x4e>
20024878:	2c0e      	cmp	r4, #14
2002487a:	f04f 0610 	mov.w	r6, #16
2002487e:	d10e      	bne.n	2002489e <HAL_PIN_SetUartFunc.part.0+0x96>
20024880:	f44f 117c 	mov.w	r1, #4128768	@ 0x3f0000
20024884:	e7e7      	b.n	20024856 <HAL_PIN_SetUartFunc.part.0+0x4e>
20024886:	2c0e      	cmp	r4, #14
20024888:	f04f 0618 	mov.w	r6, #24
2002488c:	d10a      	bne.n	200248a4 <HAL_PIN_SetUartFunc.part.0+0x9c>
2002488e:	f04f 517c 	mov.w	r1, #1056964608	@ 0x3f000000
20024892:	e7e0      	b.n	20024856 <HAL_PIN_SetUartFunc.part.0+0x4e>
20024894:	f44f 61e0 	mov.w	r1, #1792	@ 0x700
20024898:	e7dd      	b.n	20024856 <HAL_PIN_SetUartFunc.part.0+0x4e>
2002489a:	2107      	movs	r1, #7
2002489c:	e7db      	b.n	20024856 <HAL_PIN_SetUartFunc.part.0+0x4e>
2002489e:	f44f 21e0 	mov.w	r1, #458752	@ 0x70000
200248a2:	e7d8      	b.n	20024856 <HAL_PIN_SetUartFunc.part.0+0x4e>
200248a4:	f04f 61e0 	mov.w	r1, #117440512	@ 0x7000000
200248a8:	e7d5      	b.n	20024856 <HAL_PIN_SetUartFunc.part.0+0x4e>
200248aa:	2000      	movs	r0, #0
200248ac:	e7dd      	b.n	2002486a <HAL_PIN_SetUartFunc.part.0+0x62>
200248ae:	bf00      	nop
200248b0:	5000b058 	.word	0x5000b058
200248b4:	4000ef0c 	.word	0x4000ef0c

200248b8 <HAL_PIN_SetAonPE>:
200248b8:	2a00      	cmp	r2, #0
200248ba:	d031      	beq.n	20024920 <HAL_PIN_SetAonPE+0x68>
200248bc:	282f      	cmp	r0, #47	@ 0x2f
200248be:	dd16      	ble.n	200248ee <HAL_PIN_SetAonPE+0x36>
200248c0:	283a      	cmp	r0, #58	@ 0x3a
200248c2:	dc2d      	bgt.n	20024920 <HAL_PIN_SetAonPE+0x68>
200248c4:	2301      	movs	r3, #1
200248c6:	4a17      	ldr	r2, [pc, #92]	@ (20024924 <HAL_PIN_SetAonPE+0x6c>)
200248c8:	382a      	subs	r0, #42	@ 0x2a
200248ca:	4083      	lsls	r3, r0
200248cc:	6f10      	ldr	r0, [r2, #112]	@ 0x70
200248ce:	f011 0f20 	tst.w	r1, #32
200248d2:	bf14      	ite	ne
200248d4:	4318      	orrne	r0, r3
200248d6:	4398      	biceq	r0, r3
200248d8:	6710      	str	r0, [r2, #112]	@ 0x70
200248da:	4a12      	ldr	r2, [pc, #72]	@ (20024924 <HAL_PIN_SetAonPE+0x6c>)
200248dc:	f011 0f10 	tst.w	r1, #16
200248e0:	6ed1      	ldr	r1, [r2, #108]	@ 0x6c
200248e2:	bf14      	ite	ne
200248e4:	430b      	orrne	r3, r1
200248e6:	ea21 0303 	biceq.w	r3, r1, r3
200248ea:	66d3      	str	r3, [r2, #108]	@ 0x6c
200248ec:	4770      	bx	lr
200248ee:	3826      	subs	r0, #38	@ 0x26
200248f0:	2803      	cmp	r0, #3
200248f2:	d815      	bhi.n	20024920 <HAL_PIN_SetAonPE+0x68>
200248f4:	4b0c      	ldr	r3, [pc, #48]	@ (20024928 <HAL_PIN_SetAonPE+0x70>)
200248f6:	f011 0f20 	tst.w	r1, #32
200248fa:	f853 2020 	ldr.w	r2, [r3, r0, lsl #2]
200248fe:	bf14      	ite	ne
20024900:	f042 0210 	orrne.w	r2, r2, #16
20024904:	f022 0210 	biceq.w	r2, r2, #16
20024908:	f843 2020 	str.w	r2, [r3, r0, lsl #2]
2002490c:	f853 2020 	ldr.w	r2, [r3, r0, lsl #2]
20024910:	06c9      	lsls	r1, r1, #27
20024912:	bf4c      	ite	mi
20024914:	f042 0208 	orrmi.w	r2, r2, #8
20024918:	f022 0208 	bicpl.w	r2, r2, #8
2002491c:	f843 2020 	str.w	r2, [r3, r0, lsl #2]
20024920:	4770      	bx	lr
20024922:	bf00      	nop
20024924:	500cb000 	.word	0x500cb000
20024928:	500cb05c 	.word	0x500cb05c

2002492c <HAL_PIN_Get_Base>:
2002492c:	b138      	cbz	r0, 2002493e <HAL_PIN_Get_Base+0x12>
2002492e:	f04f 42a0 	mov.w	r2, #1342177280	@ 0x50000000
20024932:	6893      	ldr	r3, [r2, #8]
20024934:	4806      	ldr	r0, [pc, #24]	@ (20024950 <HAL_PIN_Get_Base+0x24>)
20024936:	f043 0304 	orr.w	r3, r3, #4
2002493a:	6093      	str	r3, [r2, #8]
2002493c:	4770      	bx	lr
2002493e:	f04f 4280 	mov.w	r2, #1073741824	@ 0x40000000
20024942:	6853      	ldr	r3, [r2, #4]
20024944:	4803      	ldr	r0, [pc, #12]	@ (20024954 <HAL_PIN_Get_Base+0x28>)
20024946:	f043 0308 	orr.w	r3, r3, #8
2002494a:	6053      	str	r3, [r2, #4]
2002494c:	4770      	bx	lr
2002494e:	bf00      	nop
20024950:	50003000 	.word	0x50003000
20024954:	40003000 	.word	0x40003000

20024958 <HAL_PIN_Func2Idx>:
20024958:	283b      	cmp	r0, #59	@ 0x3b
2002495a:	bfc8      	it	gt
2002495c:	383c      	subgt	r0, #60	@ 0x3c
2002495e:	0143      	lsls	r3, r0, #5
20024960:	b152      	cbz	r2, 20024978 <HAL_PIN_Func2Idx+0x20>
20024962:	4a06      	ldr	r2, [pc, #24]	@ (2002497c <HAL_PIN_Func2Idx+0x24>)
20024964:	2000      	movs	r0, #0
20024966:	4413      	add	r3, r2
20024968:	f833 2010 	ldrh.w	r2, [r3, r0, lsl #1]
2002496c:	428a      	cmp	r2, r1
2002496e:	d002      	beq.n	20024976 <HAL_PIN_Func2Idx+0x1e>
20024970:	3001      	adds	r0, #1
20024972:	2810      	cmp	r0, #16
20024974:	d1f8      	bne.n	20024968 <HAL_PIN_Func2Idx+0x10>
20024976:	4770      	bx	lr
20024978:	4a01      	ldr	r2, [pc, #4]	@ (20024980 <HAL_PIN_Func2Idx+0x28>)
2002497a:	e7f3      	b.n	20024964 <HAL_PIN_Func2Idx+0xc>
2002497c:	2002b55c 	.word	0x2002b55c
20024980:	2002b4bc 	.word	0x2002b4bc

20024984 <HAL_PIN_Set>:
20024984:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
20024988:	4615      	mov	r5, r2
2002498a:	4604      	mov	r4, r0
2002498c:	b918      	cbnz	r0, 20024996 <HAL_PIN_Set+0x12>
2002498e:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
20024992:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
20024996:	283a      	cmp	r0, #58	@ 0x3a
20024998:	bfcd      	iteet	gt
2002499a:	2700      	movgt	r7, #0
2002499c:	2701      	movle	r7, #1
2002499e:	4606      	movle	r6, r0
200249a0:	f1a0 063c 	subgt.w	r6, r0, #60	@ 0x3c
200249a4:	4638      	mov	r0, r7
200249a6:	f7ff ffc1 	bl	2002492c <HAL_PIN_Get_Base>
200249aa:	4680      	mov	r8, r0
200249ac:	2f00      	cmp	r7, #0
200249ae:	f000 815e 	beq.w	20024c6e <HAL_PIN_Set+0x2ea>
200249b2:	f1a4 0026 	sub.w	r0, r4, #38	@ 0x26
200249b6:	2803      	cmp	r0, #3
200249b8:	d80a      	bhi.n	200249d0 <HAL_PIN_Set+0x4c>
200249ba:	f8df c30c 	ldr.w	ip, [pc, #780]	@ 20024cc8 <HAL_PIN_Set+0x344>
200249be:	f104 4380 	add.w	r3, r4, #1073741824	@ 0x40000000
200249c2:	3b26      	subs	r3, #38	@ 0x26
200249c4:	f85c 2023 	ldr.w	r2, [ip, r3, lsl #2]
200249c8:	f022 0202 	bic.w	r2, r2, #2
200249cc:	f84c 2023 	str.w	r2, [ip, r3, lsl #2]
200249d0:	f5a1 7390 	sub.w	r3, r1, #288	@ 0x120
200249d4:	b29b      	uxth	r3, r3
200249d6:	2b0b      	cmp	r3, #11
200249d8:	d804      	bhi.n	200249e4 <HAL_PIN_Set+0x60>
200249da:	4620      	mov	r0, r4
200249dc:	f7ff ff14 	bl	20024808 <HAL_PIN_SetUartFunc.part.0>
200249e0:	4601      	mov	r1, r0
200249e2:	e025      	b.n	20024a30 <HAL_PIN_Set+0xac>
200249e4:	f5a1 739c 	sub.w	r3, r1, #312	@ 0x138
200249e8:	b29b      	uxth	r3, r3
200249ea:	2b07      	cmp	r3, #7
200249ec:	d850      	bhi.n	20024a90 <HAL_PIN_Set+0x10c>
200249ee:	104a      	asrs	r2, r1, #1
200249f0:	3a9c      	subs	r2, #156	@ 0x9c
200249f2:	eba1 0142 	sub.w	r1, r1, r2, lsl #1
200249f6:	b289      	uxth	r1, r1
200249f8:	f5b1 7f9c 	cmp.w	r1, #312	@ 0x138
200249fc:	d043      	beq.n	20024a86 <HAL_PIN_Set+0x102>
200249fe:	f240 1339 	movw	r3, #313	@ 0x139
20024a02:	4299      	cmp	r1, r3
20024a04:	f040 813a 	bne.w	20024c7c <HAL_PIN_Set+0x2f8>
20024a08:	f04f 0e08 	mov.w	lr, #8
20024a0c:	f44f 5c7c 	mov.w	ip, #16128	@ 0x3f00
20024a10:	49a5      	ldr	r1, [pc, #660]	@ (20024ca8 <HAL_PIN_Set+0x324>)
20024a12:	f1a4 030e 	sub.w	r3, r4, #14
20024a16:	f851 0022 	ldr.w	r0, [r1, r2, lsl #2]
20024a1a:	fa03 f30e 	lsl.w	r3, r3, lr
20024a1e:	4043      	eors	r3, r0
20024a20:	ea03 030c 	and.w	r3, r3, ip
20024a24:	4043      	eors	r3, r0
20024a26:	f841 3022 	str.w	r3, [r1, r2, lsl #2]
20024a2a:	f504 7129 	add.w	r1, r4, #676	@ 0x2a4
20024a2e:	b289      	uxth	r1, r1
20024a30:	463a      	mov	r2, r7
20024a32:	4620      	mov	r0, r4
20024a34:	f7ff ff90 	bl	20024958 <HAL_PIN_Func2Idx>
20024a38:	280f      	cmp	r0, #15
20024a3a:	4681      	mov	r9, r0
20024a3c:	dca7      	bgt.n	2002498e <HAL_PIN_Set+0xa>
20024a3e:	463a      	mov	r2, r7
20024a40:	4629      	mov	r1, r5
20024a42:	4620      	mov	r0, r4
20024a44:	f7ff ff38 	bl	200248b8 <HAL_PIN_SetAonPE>
20024a48:	2f00      	cmp	r7, #0
20024a4a:	f040 8119 	bne.w	20024c80 <HAL_PIN_Set+0x2fc>
20024a4e:	2c40      	cmp	r4, #64	@ 0x40
20024a50:	f340 8116 	ble.w	20024c80 <HAL_PIN_Set+0x2fc>
20024a54:	4a95      	ldr	r2, [pc, #596]	@ (20024cac <HAL_PIN_Set+0x328>)
20024a56:	06e8      	lsls	r0, r5, #27
20024a58:	f852 3024 	ldr.w	r3, [r2, r4, lsl #2]
20024a5c:	ea4f 3909 	mov.w	r9, r9, lsl #12
20024a60:	f423 43e0 	bic.w	r3, r3, #28672	@ 0x7000
20024a64:	f023 0318 	bic.w	r3, r3, #24
20024a68:	bf48      	it	mi
20024a6a:	f043 0308 	orrmi.w	r3, r3, #8
20024a6e:	06a9      	lsls	r1, r5, #26
20024a70:	bf48      	it	mi
20024a72:	f043 0310 	orrmi.w	r3, r3, #16
20024a76:	f409 49e0 	and.w	r9, r9, #28672	@ 0x7000
20024a7a:	ea49 0303 	orr.w	r3, r9, r3
20024a7e:	f842 3024 	str.w	r3, [r2, r4, lsl #2]
20024a82:	2000      	movs	r0, #0
20024a84:	e785      	b.n	20024992 <HAL_PIN_Set+0xe>
20024a86:	f04f 0e00 	mov.w	lr, #0
20024a8a:	f04f 0c3f 	mov.w	ip, #63	@ 0x3f
20024a8e:	e7bf      	b.n	20024a10 <HAL_PIN_Set+0x8c>
20024a90:	f5a1 73ec 	sub.w	r3, r1, #472	@ 0x1d8
20024a94:	b29a      	uxth	r2, r3
20024a96:	2a09      	cmp	r2, #9
20024a98:	d837      	bhi.n	20024b0a <HAL_PIN_Set+0x186>
20024a9a:	2205      	movs	r2, #5
20024a9c:	fbb3 f3f2 	udiv	r3, r3, r2
20024aa0:	ebc3 3283 	rsb	r2, r3, r3, lsl #14
20024aa4:	ebc3 0282 	rsb	r2, r3, r2, lsl #2
20024aa8:	440a      	add	r2, r1
20024aaa:	b292      	uxth	r2, r2
20024aac:	f5a2 71ec 	sub.w	r1, r2, #472	@ 0x1d8
20024ab0:	b288      	uxth	r0, r1
20024ab2:	2803      	cmp	r0, #3
20024ab4:	d814      	bhi.n	20024ae0 <HAL_PIN_Set+0x15c>
20024ab6:	f04f 0e3f 	mov.w	lr, #63	@ 0x3f
20024aba:	487d      	ldr	r0, [pc, #500]	@ (20024cb0 <HAL_PIN_Set+0x32c>)
20024abc:	00c9      	lsls	r1, r1, #3
20024abe:	f850 c023 	ldr.w	ip, [r0, r3, lsl #2]
20024ac2:	f1a4 020e 	sub.w	r2, r4, #14
20024ac6:	408a      	lsls	r2, r1
20024ac8:	ea82 020c 	eor.w	r2, r2, ip
20024acc:	fa0e f101 	lsl.w	r1, lr, r1
20024ad0:	400a      	ands	r2, r1
20024ad2:	ea82 020c 	eor.w	r2, r2, ip
20024ad6:	f840 2023 	str.w	r2, [r0, r3, lsl #2]
20024ada:	f204 2155 	addw	r1, r4, #597	@ 0x255
20024ade:	e7a6      	b.n	20024a2e <HAL_PIN_Set+0xaa>
20024ae0:	f5b2 7fee 	cmp.w	r2, #476	@ 0x1dc
20024ae4:	f040 80ca 	bne.w	20024c7c <HAL_PIN_Set+0x2f8>
20024ae8:	213f      	movs	r1, #63	@ 0x3f
20024aea:	4872      	ldr	r0, [pc, #456]	@ (20024cb4 <HAL_PIN_Set+0x330>)
20024aec:	00da      	lsls	r2, r3, #3
20024aee:	f8d0 c06c 	ldr.w	ip, [r0, #108]	@ 0x6c
20024af2:	f1a4 030e 	sub.w	r3, r4, #14
20024af6:	4093      	lsls	r3, r2
20024af8:	ea83 030c 	eor.w	r3, r3, ip
20024afc:	fa01 f202 	lsl.w	r2, r1, r2
20024b00:	4013      	ands	r3, r2
20024b02:	ea83 030c 	eor.w	r3, r3, ip
20024b06:	66c3      	str	r3, [r0, #108]	@ 0x6c
20024b08:	e7e7      	b.n	20024ada <HAL_PIN_Set+0x156>
20024b0a:	f46f 7a01 	mvn.w	sl, #516	@ 0x204
20024b0e:	eb01 020a 	add.w	r2, r1, sl
20024b12:	b293      	uxth	r3, r2
20024b14:	2b05      	cmp	r3, #5
20024b16:	d828      	bhi.n	20024b6a <HAL_PIN_Set+0x1e6>
20024b18:	2303      	movs	r3, #3
20024b1a:	fbb2 f2f3 	udiv	r2, r2, r3
20024b1e:	f46f 7901 	mvn.w	r9, #516	@ 0x204
20024b22:	ebc2 3382 	rsb	r3, r2, r2, lsl #14
20024b26:	eb02 0383 	add.w	r3, r2, r3, lsl #2
20024b2a:	440b      	add	r3, r1
20024b2c:	b29b      	uxth	r3, r3
20024b2e:	eb03 0c09 	add.w	ip, r3, r9
20024b32:	fa1f fc8c 	uxth.w	ip, ip
20024b36:	f1bc 0f02 	cmp.w	ip, #2
20024b3a:	f200 809f 	bhi.w	20024c7c <HAL_PIN_Set+0x2f8>
20024b3e:	00db      	lsls	r3, r3, #3
20024b40:	f5a3 5381 	sub.w	r3, r3, #4128	@ 0x1020
20024b44:	495c      	ldr	r1, [pc, #368]	@ (20024cb8 <HAL_PIN_Set+0x334>)
20024b46:	f1a4 0e0e 	sub.w	lr, r4, #14
20024b4a:	3b08      	subs	r3, #8
20024b4c:	fa0e f303 	lsl.w	r3, lr, r3
20024b50:	f8df e178 	ldr.w	lr, [pc, #376]	@ 20024ccc <HAL_PIN_Set+0x348>
20024b54:	f851 0022 	ldr.w	r0, [r1, r2, lsl #2]
20024b58:	f85e c02c 	ldr.w	ip, [lr, ip, lsl #2]
20024b5c:	4043      	eors	r3, r0
20024b5e:	ea03 030c 	and.w	r3, r3, ip
20024b62:	4043      	eors	r3, r0
20024b64:	f841 3022 	str.w	r3, [r1, r2, lsl #2]
20024b68:	e7b7      	b.n	20024ada <HAL_PIN_Set+0x156>
20024b6a:	f46f 7ef8 	mvn.w	lr, #496	@ 0x1f0
20024b6e:	eb01 030e 	add.w	r3, r1, lr
20024b72:	b29a      	uxth	r2, r3
20024b74:	2a09      	cmp	r2, #9
20024b76:	d82a      	bhi.n	20024bce <HAL_PIN_Set+0x24a>
20024b78:	f5b1 7ffc 	cmp.w	r1, #504	@ 0x1f8
20024b7c:	d216      	bcs.n	20024bac <HAL_PIN_Set+0x228>
20024b7e:	0859      	lsrs	r1, r3, #1
20024b80:	f013 0f01 	tst.w	r3, #1
20024b84:	4b4d      	ldr	r3, [pc, #308]	@ (20024cbc <HAL_PIN_Set+0x338>)
20024b86:	f04f 003f 	mov.w	r0, #63	@ 0x3f
20024b8a:	4a4d      	ldr	r2, [pc, #308]	@ (20024cc0 <HAL_PIN_Set+0x33c>)
20024b8c:	bf18      	it	ne
20024b8e:	461a      	movne	r2, r3
20024b90:	00c9      	lsls	r1, r1, #3
20024b92:	4088      	lsls	r0, r1
20024b94:	f8d2 c000 	ldr.w	ip, [r2]
20024b98:	f1a4 030e 	sub.w	r3, r4, #14
20024b9c:	408b      	lsls	r3, r1
20024b9e:	ea83 030c 	eor.w	r3, r3, ip
20024ba2:	4003      	ands	r3, r0
20024ba4:	ea83 030c 	eor.w	r3, r3, ip
20024ba8:	6013      	str	r3, [r2, #0]
20024baa:	e796      	b.n	20024ada <HAL_PIN_Set+0x156>
20024bac:	d007      	beq.n	20024bbe <HAL_PIN_Set+0x23a>
20024bae:	f240 13f9 	movw	r3, #505	@ 0x1f9
20024bb2:	4299      	cmp	r1, r3
20024bb4:	d107      	bne.n	20024bc6 <HAL_PIN_Set+0x242>
20024bb6:	2100      	movs	r1, #0
20024bb8:	203f      	movs	r0, #63	@ 0x3f
20024bba:	4a42      	ldr	r2, [pc, #264]	@ (20024cc4 <HAL_PIN_Set+0x340>)
20024bbc:	e7ea      	b.n	20024b94 <HAL_PIN_Set+0x210>
20024bbe:	2110      	movs	r1, #16
20024bc0:	f44f 107c 	mov.w	r0, #4128768	@ 0x3f0000
20024bc4:	e7f9      	b.n	20024bba <HAL_PIN_Set+0x236>
20024bc6:	2108      	movs	r1, #8
20024bc8:	f44f 507c 	mov.w	r0, #16128	@ 0x3f00
20024bcc:	e7f5      	b.n	20024bba <HAL_PIN_Set+0x236>
20024bce:	f46f 7c58 	mvn.w	ip, #864	@ 0x360
20024bd2:	eb01 030c 	add.w	r3, r1, ip
20024bd6:	b29b      	uxth	r3, r3
20024bd8:	2b05      	cmp	r3, #5
20024bda:	f63f af29 	bhi.w	20024a30 <HAL_PIN_Set+0xac>
20024bde:	2803      	cmp	r0, #3
20024be0:	d84c      	bhi.n	20024c7c <HAL_PIN_Set+0x2f8>
20024be2:	f104 4380 	add.w	r3, r4, #1073741824	@ 0x40000000
20024be6:	f2a1 3262 	subw	r2, r1, #866	@ 0x362
20024bea:	f8df c0dc 	ldr.w	ip, [pc, #220]	@ 20024cc8 <HAL_PIN_Set+0x344>
20024bee:	3b26      	subs	r3, #38	@ 0x26
20024bf0:	2a04      	cmp	r2, #4
20024bf2:	d815      	bhi.n	20024c20 <HAL_PIN_Set+0x29c>
20024bf4:	e8df f002 	tbb	[pc, r2]
20024bf8:	31032a38 	.word	0x31032a38
20024bfc:	23          	.byte	0x23
20024bfd:	00          	.byte	0x00
20024bfe:	f44f 5240 	mov.w	r2, #12288	@ 0x3000
20024c02:	f04f 4ae0 	mov.w	sl, #1879048192	@ 0x70000000
20024c06:	f04f 5e00 	mov.w	lr, #536870912	@ 0x20000000
20024c0a:	f8df 90c4 	ldr.w	r9, [pc, #196]	@ 20024cd0 <HAL_PIN_Set+0x34c>
20024c0e:	f8d9 0004 	ldr.w	r0, [r9, #4]
20024c12:	ea20 000a 	bic.w	r0, r0, sl
20024c16:	ea40 000e 	orr.w	r0, r0, lr
20024c1a:	f8c9 0004 	str.w	r0, [r9, #4]
20024c1e:	e000      	b.n	20024c22 <HAL_PIN_Set+0x29e>
20024c20:	2200      	movs	r2, #0
20024c22:	f85c 0023 	ldr.w	r0, [ip, r3, lsl #2]
20024c26:	f420 40e0 	bic.w	r0, r0, #28672	@ 0x7000
20024c2a:	4302      	orrs	r2, r0
20024c2c:	f84c 2023 	str.w	r2, [ip, r3, lsl #2]
20024c30:	f85c 2023 	ldr.w	r2, [ip, r3, lsl #2]
20024c34:	f042 0202 	orr.w	r2, r2, #2
20024c38:	f84c 2023 	str.w	r2, [ip, r3, lsl #2]
20024c3c:	e6f8      	b.n	20024a30 <HAL_PIN_Set+0xac>
20024c3e:	f44f 5240 	mov.w	r2, #12288	@ 0x3000
20024c42:	f04f 4ae0 	mov.w	sl, #1879048192	@ 0x70000000
20024c46:	f04f 5e40 	mov.w	lr, #805306368	@ 0x30000000
20024c4a:	e7de      	b.n	20024c0a <HAL_PIN_Set+0x286>
20024c4c:	f44f 5200 	mov.w	r2, #8192	@ 0x2000
20024c50:	f04f 6a60 	mov.w	sl, #234881024	@ 0xe000000
20024c54:	f04f 6e80 	mov.w	lr, #67108864	@ 0x4000000
20024c58:	e7d7      	b.n	20024c0a <HAL_PIN_Set+0x286>
20024c5a:	f44f 5200 	mov.w	r2, #8192	@ 0x2000
20024c5e:	f04f 6a60 	mov.w	sl, #234881024	@ 0xe000000
20024c62:	f04f 6ec0 	mov.w	lr, #100663296	@ 0x6000000
20024c66:	e7d0      	b.n	20024c0a <HAL_PIN_Set+0x286>
20024c68:	f44f 5280 	mov.w	r2, #4096	@ 0x1000
20024c6c:	e7d9      	b.n	20024c22 <HAL_PIN_Set+0x29e>
20024c6e:	f5a1 7396 	sub.w	r3, r1, #300	@ 0x12c
20024c72:	b29b      	uxth	r3, r3
20024c74:	2b07      	cmp	r3, #7
20024c76:	f63f aedb 	bhi.w	20024a30 <HAL_PIN_Set+0xac>
20024c7a:	e6ae      	b.n	200249da <HAL_PIN_Set+0x56>
20024c7c:	2100      	movs	r1, #0
20024c7e:	e6d7      	b.n	20024a30 <HAL_PIN_Set+0xac>
20024c80:	f106 4680 	add.w	r6, r6, #1073741824	@ 0x40000000
20024c84:	3e01      	subs	r6, #1
20024c86:	f858 3026 	ldr.w	r3, [r8, r6, lsl #2]
20024c8a:	f005 0530 	and.w	r5, r5, #48	@ 0x30
20024c8e:	f009 090f 	and.w	r9, r9, #15
20024c92:	ea45 0509 	orr.w	r5, r5, r9
20024c96:	f023 033f 	bic.w	r3, r3, #63	@ 0x3f
20024c9a:	431d      	orrs	r5, r3
20024c9c:	f045 0540 	orr.w	r5, r5, #64	@ 0x40
20024ca0:	f848 5026 	str.w	r5, [r8, r6, lsl #2]
20024ca4:	e6ed      	b.n	20024a82 <HAL_PIN_Set+0xfe>
20024ca6:	bf00      	nop
20024ca8:	5000b048 	.word	0x5000b048
20024cac:	500caf58 	.word	0x500caf58
20024cb0:	5000b064 	.word	0x5000b064
20024cb4:	5000b000 	.word	0x5000b000
20024cb8:	5000b070 	.word	0x5000b070
20024cbc:	5000b07c 	.word	0x5000b07c
20024cc0:	5000b078 	.word	0x5000b078
20024cc4:	5000b080 	.word	0x5000b080
20024cc8:	500cb05c 	.word	0x500cb05c
20024ccc:	2002b080 	.word	0x2002b080
20024cd0:	500c0000 	.word	0x500c0000

20024cd4 <HAL_PIN_Set_Analog>:
20024cd4:	283a      	cmp	r0, #58	@ 0x3a
20024cd6:	b538      	push	{r3, r4, r5, lr}
20024cd8:	4604      	mov	r4, r0
20024cda:	dd25      	ble.n	20024d28 <HAL_PIN_Set_Analog+0x54>
20024cdc:	2840      	cmp	r0, #64	@ 0x40
20024cde:	dc16      	bgt.n	20024d0e <HAL_PIN_Set_Analog+0x3a>
20024ce0:	2500      	movs	r5, #0
20024ce2:	f1a0 013c 	sub.w	r1, r0, #60	@ 0x3c
20024ce6:	4628      	mov	r0, r5
20024ce8:	f7ff fe20 	bl	2002492c <HAL_PIN_Get_Base>
20024cec:	f101 4380 	add.w	r3, r1, #1073741824	@ 0x40000000
20024cf0:	3b01      	subs	r3, #1
20024cf2:	f850 1023 	ldr.w	r1, [r0, r3, lsl #2]
20024cf6:	462a      	mov	r2, r5
20024cf8:	f021 015f 	bic.w	r1, r1, #95	@ 0x5f
20024cfc:	f041 010f 	orr.w	r1, r1, #15
20024d00:	f840 1023 	str.w	r1, [r0, r3, lsl #2]
20024d04:	2100      	movs	r1, #0
20024d06:	4620      	mov	r0, r4
20024d08:	f7ff fdd6 	bl	200248b8 <HAL_PIN_SetAonPE>
20024d0c:	e00a      	b.n	20024d24 <HAL_PIN_Set_Analog+0x50>
20024d0e:	4a08      	ldr	r2, [pc, #32]	@ (20024d30 <HAL_PIN_Set_Analog+0x5c>)
20024d10:	f852 3020 	ldr.w	r3, [r2, r0, lsl #2]
20024d14:	f423 43e0 	bic.w	r3, r3, #28672	@ 0x7000
20024d18:	f023 030e 	bic.w	r3, r3, #14
20024d1c:	f443 43e0 	orr.w	r3, r3, #28672	@ 0x7000
20024d20:	f842 3020 	str.w	r3, [r2, r0, lsl #2]
20024d24:	2000      	movs	r0, #0
20024d26:	bd38      	pop	{r3, r4, r5, pc}
20024d28:	4601      	mov	r1, r0
20024d2a:	2501      	movs	r5, #1
20024d2c:	e7db      	b.n	20024ce6 <HAL_PIN_Set_Analog+0x12>
20024d2e:	bf00      	nop
20024d30:	500caf58 	.word	0x500caf58

20024d34 <HAL_PMU_EnableDLL>:
20024d34:	4b05      	ldr	r3, [pc, #20]	@ (20024d4c <HAL_PMU_EnableDLL+0x18>)
20024d36:	6e9a      	ldr	r2, [r3, #104]	@ 0x68
20024d38:	b120      	cbz	r0, 20024d44 <HAL_PMU_EnableDLL+0x10>
20024d3a:	f042 0220 	orr.w	r2, r2, #32
20024d3e:	2000      	movs	r0, #0
20024d40:	669a      	str	r2, [r3, #104]	@ 0x68
20024d42:	4770      	bx	lr
20024d44:	f022 0220 	bic.w	r2, r2, #32
20024d48:	e7f9      	b.n	20024d3e <HAL_PMU_EnableDLL+0xa>
20024d4a:	bf00      	nop
20024d4c:	500ca000 	.word	0x500ca000

20024d50 <HAL_RCC_HCPU_ConfigSxModeVolt>:
20024d50:	b507      	push	{r0, r1, r2, lr}
20024d52:	4a13      	ldr	r2, [pc, #76]	@ (20024da0 <HAL_RCC_HCPU_ConfigSxModeVolt+0x50>)
20024d54:	4913      	ldr	r1, [pc, #76]	@ (20024da4 <HAL_RCC_HCPU_ConfigSxModeVolt+0x54>)
20024d56:	eb02 02c0 	add.w	r2, r2, r0, lsl #3
20024d5a:	f8d1 309c 	ldr.w	r3, [r1, #156]	@ 0x9c
20024d5e:	7892      	ldrb	r2, [r2, #2]
20024d60:	2802      	cmp	r0, #2
20024d62:	f362 0303 	bfi	r3, r2, #0, #4
20024d66:	f8c1 309c 	str.w	r3, [r1, #156]	@ 0x9c
20024d6a:	f10d 0007 	add.w	r0, sp, #7
20024d6e:	d111      	bne.n	20024d94 <HAL_RCC_HCPU_ConfigSxModeVolt+0x44>
20024d70:	f007 fb3c 	bl	2002c3ec <HAL_PMU_GetHpsysVoutRef>
20024d74:	b110      	cbz	r0, 20024d7c <HAL_RCC_HCPU_ConfigSxModeVolt+0x2c>
20024d76:	230b      	movs	r3, #11
20024d78:	f88d 3007 	strb.w	r3, [sp, #7]
20024d7c:	4a09      	ldr	r2, [pc, #36]	@ (20024da4 <HAL_RCC_HCPU_ConfigSxModeVolt+0x54>)
20024d7e:	f89d 1007 	ldrb.w	r1, [sp, #7]
20024d82:	f8d2 3094 	ldr.w	r3, [r2, #148]	@ 0x94
20024d86:	f361 0303 	bfi	r3, r1, #0, #4
20024d8a:	f8c2 3094 	str.w	r3, [r2, #148]	@ 0x94
20024d8e:	b003      	add	sp, #12
20024d90:	f85d fb04 	ldr.w	pc, [sp], #4
20024d94:	f007 fb36 	bl	2002c404 <HAL_PMU_GetHpsysVoutRef2>
20024d98:	2800      	cmp	r0, #0
20024d9a:	d0ef      	beq.n	20024d7c <HAL_RCC_HCPU_ConfigSxModeVolt+0x2c>
20024d9c:	230d      	movs	r3, #13
20024d9e:	e7eb      	b.n	20024d78 <HAL_RCC_HCPU_ConfigSxModeVolt+0x28>
20024da0:	2002b09c 	.word	0x2002b09c
20024da4:	500ca000 	.word	0x500ca000

20024da8 <HAL_RCC_HCPU_GetClockSrc>:
20024da8:	f04f 43a0 	mov.w	r3, #1342177280	@ 0x50000000
20024dac:	280d      	cmp	r0, #13
20024dae:	6a1a      	ldr	r2, [r3, #32]
20024db0:	d80d      	bhi.n	20024dce <HAL_RCC_HCPU_GetClockSrc+0x26>
20024db2:	f642 73f1 	movw	r3, #12273	@ 0x2ff1
20024db6:	40c3      	lsrs	r3, r0
20024db8:	f013 0f01 	tst.w	r3, #1
20024dbc:	bf0c      	ite	eq
20024dbe:	2301      	moveq	r3, #1
20024dc0:	2303      	movne	r3, #3
20024dc2:	4083      	lsls	r3, r0
20024dc4:	4013      	ands	r3, r2
20024dc6:	fa23 f000 	lsr.w	r0, r3, r0
20024dca:	b2c0      	uxtb	r0, r0
20024dcc:	4770      	bx	lr
20024dce:	2301      	movs	r3, #1
20024dd0:	e7f7      	b.n	20024dc2 <HAL_RCC_HCPU_GetClockSrc+0x1a>
	...

20024dd4 <HAL_RCC_HCPU_GetDLLFreq>:
20024dd4:	2801      	cmp	r0, #1
20024dd6:	d003      	beq.n	20024de0 <HAL_RCC_HCPU_GetDLLFreq+0xc>
20024dd8:	2802      	cmp	r0, #2
20024dda:	d00e      	beq.n	20024dfa <HAL_RCC_HCPU_GetDLLFreq+0x26>
20024ddc:	2000      	movs	r0, #0
20024dde:	4770      	bx	lr
20024de0:	f04f 43a0 	mov.w	r3, #1342177280	@ 0x50000000
20024de4:	6adb      	ldr	r3, [r3, #44]	@ 0x2c
20024de6:	b163      	cbz	r3, 20024e02 <HAL_RCC_HCPU_GetDLLFreq+0x2e>
20024de8:	f013 0001 	ands.w	r0, r3, #1
20024dec:	d00a      	beq.n	20024e04 <HAL_RCC_HCPU_GetDLLFreq+0x30>
20024dee:	4806      	ldr	r0, [pc, #24]	@ (20024e08 <HAL_RCC_HCPU_GetDLLFreq+0x34>)
20024df0:	f3c3 0383 	ubfx	r3, r3, #2, #4
20024df4:	fb03 0000 	mla	r0, r3, r0, r0
20024df8:	4770      	bx	lr
20024dfa:	f04f 43a0 	mov.w	r3, #1342177280	@ 0x50000000
20024dfe:	6b1b      	ldr	r3, [r3, #48]	@ 0x30
20024e00:	e7f1      	b.n	20024de6 <HAL_RCC_HCPU_GetDLLFreq+0x12>
20024e02:	4618      	mov	r0, r3
20024e04:	4770      	bx	lr
20024e06:	bf00      	nop
20024e08:	016e3600 	.word	0x016e3600

20024e0c <HAL_RCC_HCPU_GetDLL1Freq>:
20024e0c:	2001      	movs	r0, #1
20024e0e:	f7ff bfe1 	b.w	20024dd4 <HAL_RCC_HCPU_GetDLLFreq>

20024e12 <HAL_RCC_HCPU_GetDLL2Freq>:
20024e12:	2002      	movs	r0, #2
20024e14:	f7ff bfde 	b.w	20024dd4 <HAL_RCC_HCPU_GetDLLFreq>

20024e18 <HAL_RCC_HCPU_GetDLL3Freq>:
20024e18:	2000      	movs	r0, #0
20024e1a:	4770      	bx	lr

20024e1c <HAL_RCC_HCPU_EnableDLL>:
20024e1c:	4b23      	ldr	r3, [pc, #140]	@ (20024eac <HAL_RCC_HCPU_EnableDLL+0x90>)
20024e1e:	f1a1 71b7 	sub.w	r1, r1, #23986176	@ 0x16e0000
20024e22:	f5a1 5158 	sub.w	r1, r1, #13824	@ 0x3600
20024e26:	4299      	cmp	r1, r3
20024e28:	b510      	push	{r4, lr}
20024e2a:	d83c      	bhi.n	20024ea6 <HAL_RCC_HCPU_EnableDLL+0x8a>
20024e2c:	2801      	cmp	r0, #1
20024e2e:	d002      	beq.n	20024e36 <HAL_RCC_HCPU_EnableDLL+0x1a>
20024e30:	2802      	cmp	r0, #2
20024e32:	d036      	beq.n	20024ea2 <HAL_RCC_HCPU_EnableDLL+0x86>
20024e34:	e7fe      	b.n	20024e34 <HAL_RCC_HCPU_EnableDLL+0x18>
20024e36:	4c1e      	ldr	r4, [pc, #120]	@ (20024eb0 <HAL_RCC_HCPU_EnableDLL+0x94>)
20024e38:	4b1e      	ldr	r3, [pc, #120]	@ (20024eb4 <HAL_RCC_HCPU_EnableDLL+0x98>)
20024e3a:	f8d3 2094 	ldr.w	r2, [r3, #148]	@ 0x94
20024e3e:	0790      	lsls	r0, r2, #30
20024e40:	bf58      	it	pl
20024e42:	f8d3 2094 	ldrpl.w	r2, [r3, #148]	@ 0x94
20024e46:	f04f 0000 	mov.w	r0, #0
20024e4a:	bf5c      	itt	pl
20024e4c:	f042 0202 	orrpl.w	r2, r2, #2
20024e50:	f8c3 2094 	strpl.w	r2, [r3, #148]	@ 0x94
20024e54:	f8d3 2094 	ldr.w	r2, [r3, #148]	@ 0x94
20024e58:	07d2      	lsls	r2, r2, #31
20024e5a:	bf5e      	ittt	pl
20024e5c:	f8d3 2094 	ldrpl.w	r2, [r3, #148]	@ 0x94
20024e60:	f042 0201 	orrpl.w	r2, r2, #1
20024e64:	f8c3 2094 	strpl.w	r2, [r3, #148]	@ 0x94
20024e68:	4a13      	ldr	r2, [pc, #76]	@ (20024eb8 <HAL_RCC_HCPU_EnableDLL+0x9c>)
20024e6a:	6823      	ldr	r3, [r4, #0]
20024e6c:	fbb1 f1f2 	udiv	r1, r1, r2
20024e70:	f023 0301 	bic.w	r3, r3, #1
20024e74:	6023      	str	r3, [r4, #0]
20024e76:	6823      	ldr	r3, [r4, #0]
20024e78:	f423 5300 	bic.w	r3, r3, #8192	@ 0x2000
20024e7c:	f023 033c 	bic.w	r3, r3, #60	@ 0x3c
20024e80:	ea43 0381 	orr.w	r3, r3, r1, lsl #2
20024e84:	f443 5380 	orr.w	r3, r3, #4096	@ 0x1000
20024e88:	f043 0301 	orr.w	r3, r3, #1
20024e8c:	6023      	str	r3, [r4, #0]
20024e8e:	f7fd f86a 	bl	20021f66 <HAL_Delay_us>
20024e92:	200a      	movs	r0, #10
20024e94:	f7fd f867 	bl	20021f66 <HAL_Delay_us>
20024e98:	6823      	ldr	r3, [r4, #0]
20024e9a:	2b00      	cmp	r3, #0
20024e9c:	dafc      	bge.n	20024e98 <HAL_RCC_HCPU_EnableDLL+0x7c>
20024e9e:	2000      	movs	r0, #0
20024ea0:	bd10      	pop	{r4, pc}
20024ea2:	4c06      	ldr	r4, [pc, #24]	@ (20024ebc <HAL_RCC_HCPU_EnableDLL+0xa0>)
20024ea4:	e7c8      	b.n	20024e38 <HAL_RCC_HCPU_EnableDLL+0x1c>
20024ea6:	2001      	movs	r0, #1
20024ea8:	e7fa      	b.n	20024ea0 <HAL_RCC_HCPU_EnableDLL+0x84>
20024eaa:	bf00      	nop
20024eac:	15752a00 	.word	0x15752a00
20024eb0:	5000002c 	.word	0x5000002c
20024eb4:	5000b000 	.word	0x5000b000
20024eb8:	016e3600 	.word	0x016e3600
20024ebc:	50000030 	.word	0x50000030

20024ec0 <HAL_RCC_HCPU_EnableDLL1>:
20024ec0:	4601      	mov	r1, r0
20024ec2:	2001      	movs	r0, #1
20024ec4:	f7ff bfaa 	b.w	20024e1c <HAL_RCC_HCPU_EnableDLL>

20024ec8 <HAL_RCC_HCPU_EnableDLL2>:
20024ec8:	4601      	mov	r1, r0
20024eca:	2002      	movs	r0, #2
20024ecc:	f7ff bfa6 	b.w	20024e1c <HAL_RCC_HCPU_EnableDLL>

20024ed0 <HAL_RCC_HCPU_DisableDLL1>:
20024ed0:	f04f 42a0 	mov.w	r2, #1342177280	@ 0x50000000
20024ed4:	6ad3      	ldr	r3, [r2, #44]	@ 0x2c
20024ed6:	2000      	movs	r0, #0
20024ed8:	f023 0301 	bic.w	r3, r3, #1
20024edc:	62d3      	str	r3, [r2, #44]	@ 0x2c
20024ede:	4770      	bx	lr

20024ee0 <HAL_RCC_GetSysCLKFreq>:
20024ee0:	2801      	cmp	r0, #1
20024ee2:	d108      	bne.n	20024ef6 <HAL_RCC_GetSysCLKFreq+0x16>
20024ee4:	f04f 43a0 	mov.w	r3, #1342177280	@ 0x50000000
20024ee8:	6a1b      	ldr	r3, [r3, #32]
20024eea:	f003 0303 	and.w	r3, r3, #3
20024eee:	2b03      	cmp	r3, #3
20024ef0:	d101      	bne.n	20024ef6 <HAL_RCC_GetSysCLKFreq+0x16>
20024ef2:	f7ff bf8b 	b.w	20024e0c <HAL_RCC_HCPU_GetDLL1Freq>
20024ef6:	4801      	ldr	r0, [pc, #4]	@ (20024efc <HAL_RCC_GetSysCLKFreq+0x1c>)
20024ef8:	4770      	bx	lr
20024efa:	bf00      	nop
20024efc:	02dc6c00 	.word	0x02dc6c00

20024f00 <HAL_RCC_GetHCLKFreq>:
20024f00:	1e02      	subs	r2, r0, #0
20024f02:	bf08      	it	eq
20024f04:	2201      	moveq	r2, #1
20024f06:	b508      	push	{r3, lr}
20024f08:	4610      	mov	r0, r2
20024f0a:	f7ff ffe9 	bl	20024ee0 <HAL_RCC_GetSysCLKFreq>
20024f0e:	2a01      	cmp	r2, #1
20024f10:	d002      	beq.n	20024f18 <HAL_RCC_GetHCLKFreq+0x18>
20024f12:	2a02      	cmp	r2, #2
20024f14:	d00a      	beq.n	20024f2c <HAL_RCC_GetHCLKFreq+0x2c>
20024f16:	e7fe      	b.n	20024f16 <HAL_RCC_GetHCLKFreq+0x16>
20024f18:	f04f 43a0 	mov.w	r3, #1342177280	@ 0x50000000
20024f1c:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
20024f1e:	b2db      	uxtb	r3, r3
20024f20:	2b01      	cmp	r3, #1
20024f22:	bfb8      	it	lt
20024f24:	2301      	movlt	r3, #1
20024f26:	fbb0 f0f3 	udiv	r0, r0, r3
20024f2a:	bd08      	pop	{r3, pc}
20024f2c:	f04f 4380 	mov.w	r3, #1073741824	@ 0x40000000
20024f30:	695b      	ldr	r3, [r3, #20]
20024f32:	f003 033f 	and.w	r3, r3, #63	@ 0x3f
20024f36:	e7f3      	b.n	20024f20 <HAL_RCC_GetHCLKFreq+0x20>

20024f38 <HAL_RCC_HCPU_ClockSelect>:
20024f38:	f04f 43a0 	mov.w	r3, #1342177280	@ 0x50000000
20024f3c:	b510      	push	{r4, lr}
20024f3e:	280d      	cmp	r0, #13
20024f40:	6a1b      	ldr	r3, [r3, #32]
20024f42:	d818      	bhi.n	20024f76 <HAL_RCC_HCPU_ClockSelect+0x3e>
20024f44:	f642 72f1 	movw	r2, #12273	@ 0x2ff1
20024f48:	40c2      	lsrs	r2, r0
20024f4a:	f012 0f01 	tst.w	r2, #1
20024f4e:	bf0c      	ite	eq
20024f50:	2201      	moveq	r2, #1
20024f52:	2203      	movne	r2, #3
20024f54:	fa02 f400 	lsl.w	r4, r2, r0
20024f58:	4011      	ands	r1, r2
20024f5a:	f04f 42a0 	mov.w	r2, #1342177280	@ 0x50000000
20024f5e:	ea23 0304 	bic.w	r3, r3, r4
20024f62:	4081      	lsls	r1, r0
20024f64:	430b      	orrs	r3, r1
20024f66:	6213      	str	r3, [r2, #32]
20024f68:	b920      	cbnz	r0, 20024f74 <HAL_RCC_HCPU_ClockSelect+0x3c>
20024f6a:	2001      	movs	r0, #1
20024f6c:	f7ff ffc8 	bl	20024f00 <HAL_RCC_GetHCLKFreq>
20024f70:	4b02      	ldr	r3, [pc, #8]	@ (20024f7c <HAL_RCC_HCPU_ClockSelect+0x44>)
20024f72:	6018      	str	r0, [r3, #0]
20024f74:	bd10      	pop	{r4, pc}
20024f76:	2201      	movs	r2, #1
20024f78:	e7ec      	b.n	20024f54 <HAL_RCC_HCPU_ClockSelect+0x1c>
20024f7a:	bf00      	nop
20024f7c:	20044954 	.word	0x20044954

20024f80 <HAL_RCC_HCPU_SetDiv>:
20024f80:	2800      	cmp	r0, #0
20024f82:	bfd8      	it	le
20024f84:	2000      	movle	r0, #0
20024f86:	b508      	push	{r3, lr}
20024f88:	bfcc      	ite	gt
20024f8a:	23ff      	movgt	r3, #255	@ 0xff
20024f8c:	4603      	movle	r3, r0
20024f8e:	2900      	cmp	r1, #0
20024f90:	db12      	blt.n	20024fb8 <HAL_RCC_HCPU_SetDiv+0x38>
20024f92:	2a00      	cmp	r2, #0
20024f94:	f443 63e0 	orr.w	r3, r3, #1792	@ 0x700
20024f98:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
20024f9c:	da0e      	bge.n	20024fbc <HAL_RCC_HCPU_SetDiv+0x3c>
20024f9e:	f04f 41a0 	mov.w	r1, #1342177280	@ 0x50000000
20024fa2:	6a4a      	ldr	r2, [r1, #36]	@ 0x24
20024fa4:	ea22 0303 	bic.w	r3, r2, r3
20024fa8:	4303      	orrs	r3, r0
20024faa:	624b      	str	r3, [r1, #36]	@ 0x24
20024fac:	2001      	movs	r0, #1
20024fae:	f7ff ffa7 	bl	20024f00 <HAL_RCC_GetHCLKFreq>
20024fb2:	4b07      	ldr	r3, [pc, #28]	@ (20024fd0 <HAL_RCC_HCPU_SetDiv+0x50>)
20024fb4:	6018      	str	r0, [r3, #0]
20024fb6:	bd08      	pop	{r3, pc}
20024fb8:	2a00      	cmp	r2, #0
20024fba:	db04      	blt.n	20024fc6 <HAL_RCC_HCPU_SetDiv+0x46>
20024fbc:	f443 43e0 	orr.w	r3, r3, #28672	@ 0x7000
20024fc0:	ea40 3002 	orr.w	r0, r0, r2, lsl #12
20024fc4:	e7eb      	b.n	20024f9e <HAL_RCC_HCPU_SetDiv+0x1e>
20024fc6:	2b00      	cmp	r3, #0
20024fc8:	d0f0      	beq.n	20024fac <HAL_RCC_HCPU_SetDiv+0x2c>
20024fca:	23ff      	movs	r3, #255	@ 0xff
20024fcc:	e7e7      	b.n	20024f9e <HAL_RCC_HCPU_SetDiv+0x1e>
20024fce:	bf00      	nop
20024fd0:	20044954 	.word	0x20044954

20024fd4 <HAL_RCC_HCPU_SwitchDvfsD2S>:
20024fd4:	b570      	push	{r4, r5, r6, lr}
20024fd6:	460c      	mov	r4, r1
20024fd8:	4d19      	ldr	r5, [pc, #100]	@ (20025040 <HAL_RCC_HCPU_SwitchDvfsD2S+0x6c>)
20024fda:	4606      	mov	r6, r0
20024fdc:	f7ff feb8 	bl	20024d50 <HAL_RCC_HCPU_ConfigSxModeVolt>
20024fe0:	692b      	ldr	r3, [r5, #16]
20024fe2:	20fa      	movs	r0, #250	@ 0xfa
20024fe4:	f023 0304 	bic.w	r3, r3, #4
20024fe8:	612b      	str	r3, [r5, #16]
20024fea:	f7fc ffbc 	bl	20021f66 <HAL_Delay_us>
20024fee:	2c30      	cmp	r4, #48	@ 0x30
20024ff0:	d80d      	bhi.n	2002500e <HAL_RCC_HCPU_SwitchDvfsD2S+0x3a>
20024ff2:	2100      	movs	r1, #0
20024ff4:	4608      	mov	r0, r1
20024ff6:	f7ff ff9f 	bl	20024f38 <HAL_RCC_HCPU_ClockSelect>
20024ffa:	2030      	movs	r0, #48	@ 0x30
20024ffc:	2204      	movs	r2, #4
20024ffe:	2100      	movs	r1, #0
20025000:	fbb0 f0f4 	udiv	r0, r0, r4
20025004:	f7ff ffbc 	bl	20024f80 <HAL_RCC_HCPU_SetDiv>
20025008:	2400      	movs	r4, #0
2002500a:	4620      	mov	r0, r4
2002500c:	bd70      	pop	{r4, r5, r6, pc}
2002500e:	f7fd fce5 	bl	200229dc <HAL_HPAON_EnableXT48>
20025012:	480c      	ldr	r0, [pc, #48]	@ (20025044 <HAL_RCC_HCPU_SwitchDvfsD2S+0x70>)
20025014:	eb00 00c6 	add.w	r0, r0, r6, lsl #3
20025018:	6843      	ldr	r3, [r0, #4]
2002501a:	480b      	ldr	r0, [pc, #44]	@ (20025048 <HAL_RCC_HCPU_SwitchDvfsD2S+0x74>)
2002501c:	61eb      	str	r3, [r5, #28]
2002501e:	4360      	muls	r0, r4
20025020:	f7ff ff4e 	bl	20024ec0 <HAL_RCC_HCPU_EnableDLL1>
20025024:	4604      	mov	r4, r0
20025026:	2800      	cmp	r0, #0
20025028:	d1ef      	bne.n	2002500a <HAL_RCC_HCPU_SwitchDvfsD2S+0x36>
2002502a:	2101      	movs	r1, #1
2002502c:	2206      	movs	r2, #6
2002502e:	4608      	mov	r0, r1
20025030:	f7ff ffa6 	bl	20024f80 <HAL_RCC_HCPU_SetDiv>
20025034:	2103      	movs	r1, #3
20025036:	4620      	mov	r0, r4
20025038:	f7ff ff7e 	bl	20024f38 <HAL_RCC_HCPU_ClockSelect>
2002503c:	e7e4      	b.n	20025008 <HAL_RCC_HCPU_SwitchDvfsD2S+0x34>
2002503e:	bf00      	nop
20025040:	5000b000 	.word	0x5000b000
20025044:	2002b09c 	.word	0x2002b09c
20025048:	000f4240 	.word	0x000f4240

2002504c <HAL_RCC_HCPU_SwitchDvfsS2D.isra.0>:
2002504c:	e92d 41f3 	stmdb	sp!, {r0, r1, r4, r5, r6, r7, r8, lr}
20025050:	4c1d      	ldr	r4, [pc, #116]	@ (200250c8 <HAL_RCC_HCPU_SwitchDvfsS2D.isra.0+0x7c>)
20025052:	4f1e      	ldr	r7, [pc, #120]	@ (200250cc <HAL_RCC_HCPU_SwitchDvfsS2D.isra.0+0x80>)
20025054:	eb04 02c0 	add.w	r2, r4, r0, lsl #3
20025058:	6b3b      	ldr	r3, [r7, #48]	@ 0x30
2002505a:	7892      	ldrb	r2, [r2, #2]
2002505c:	4605      	mov	r5, r0
2002505e:	f362 5317 	bfi	r3, r2, #20, #4
20025062:	ea4f 08c0 	mov.w	r8, r0, lsl #3
20025066:	633b      	str	r3, [r7, #48]	@ 0x30
20025068:	f10d 0007 	add.w	r0, sp, #7
2002506c:	460e      	mov	r6, r1
2002506e:	f007 f9bd 	bl	2002c3ec <HAL_PMU_GetHpsysVoutRef>
20025072:	b110      	cbz	r0, 2002507a <HAL_RCC_HCPU_SwitchDvfsS2D.isra.0+0x2e>
20025074:	230b      	movs	r3, #11
20025076:	f88d 3007 	strb.w	r3, [sp, #7]
2002507a:	f89d 1007 	ldrb.w	r1, [sp, #7]
2002507e:	f914 2035 	ldrsb.w	r2, [r4, r5, lsl #3]
20025082:	6cfb      	ldr	r3, [r7, #76]	@ 0x4c
20025084:	440a      	add	r2, r1
20025086:	2100      	movs	r1, #0
20025088:	f362 0385 	bfi	r3, r2, #2, #4
2002508c:	4608      	mov	r0, r1
2002508e:	64fb      	str	r3, [r7, #76]	@ 0x4c
20025090:	f7ff ff52 	bl	20024f38 <HAL_RCC_HCPU_ClockSelect>
20025094:	2e30      	cmp	r6, #48	@ 0x30
20025096:	d900      	bls.n	2002509a <HAL_RCC_HCPU_SwitchDvfsS2D.isra.0+0x4e>
20025098:	e7fe      	b.n	20025098 <HAL_RCC_HCPU_SwitchDvfsS2D.isra.0+0x4c>
2002509a:	2030      	movs	r0, #48	@ 0x30
2002509c:	2204      	movs	r2, #4
2002509e:	2100      	movs	r1, #0
200250a0:	fbb0 f0f6 	udiv	r0, r0, r6
200250a4:	f7ff ff6c 	bl	20024f80 <HAL_RCC_HCPU_SetDiv>
200250a8:	f7ff ff12 	bl	20024ed0 <HAL_RCC_HCPU_DisableDLL1>
200250ac:	f7fd fca2 	bl	200229f4 <HAL_HPAON_DisableXT48>
200250b0:	4444      	add	r4, r8
200250b2:	4b07      	ldr	r3, [pc, #28]	@ (200250d0 <HAL_RCC_HCPU_SwitchDvfsS2D.isra.0+0x84>)
200250b4:	6862      	ldr	r2, [r4, #4]
200250b6:	61da      	str	r2, [r3, #28]
200250b8:	691a      	ldr	r2, [r3, #16]
200250ba:	f042 0204 	orr.w	r2, r2, #4
200250be:	611a      	str	r2, [r3, #16]
200250c0:	b002      	add	sp, #8
200250c2:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
200250c6:	bf00      	nop
200250c8:	2002b09c 	.word	0x2002b09c
200250cc:	500ca000 	.word	0x500ca000
200250d0:	5000b000 	.word	0x5000b000

200250d4 <HAL_RCC_HCPU_ConfigDvfs>:
200250d4:	b570      	push	{r4, r5, r6, lr}
200250d6:	4e31      	ldr	r6, [pc, #196]	@ (2002519c <HAL_RCC_HCPU_ConfigDvfs+0xc8>)
200250d8:	4605      	mov	r5, r0
200250da:	7833      	ldrb	r3, [r6, #0]
200250dc:	460c      	mov	r4, r1
200250de:	2b01      	cmp	r3, #1
200250e0:	d943      	bls.n	2002516a <HAL_RCC_HCPU_ConfigDvfs+0x96>
200250e2:	3b02      	subs	r3, #2
200250e4:	2b01      	cmp	r3, #1
200250e6:	d902      	bls.n	200250ee <HAL_RCC_HCPU_ConfigDvfs+0x1a>
200250e8:	2501      	movs	r5, #1
200250ea:	4628      	mov	r0, r5
200250ec:	bd70      	pop	{r4, r5, r6, pc}
200250ee:	4b2c      	ldr	r3, [pc, #176]	@ (200251a0 <HAL_RCC_HCPU_ConfigDvfs+0xcc>)
200250f0:	f853 2021 	ldr.w	r2, [r3, r1, lsl #2]
200250f4:	f7ff fe8d 	bl	20024e12 <HAL_RCC_HCPU_GetDLL2Freq>
200250f8:	4290      	cmp	r0, r2
200250fa:	d8f5      	bhi.n	200250e8 <HAL_RCC_HCPU_ConfigDvfs+0x14>
200250fc:	2901      	cmp	r1, #1
200250fe:	d805      	bhi.n	2002510c <HAL_RCC_HCPU_ConfigDvfs+0x38>
20025100:	4629      	mov	r1, r5
20025102:	4620      	mov	r0, r4
20025104:	f7ff ffa2 	bl	2002504c <HAL_RCC_HCPU_SwitchDvfsS2D.isra.0>
20025108:	2500      	movs	r5, #0
2002510a:	e035      	b.n	20025178 <HAL_RCC_HCPU_ConfigDvfs+0xa4>
2002510c:	2100      	movs	r1, #0
2002510e:	4608      	mov	r0, r1
20025110:	f7ff ff12 	bl	20024f38 <HAL_RCC_HCPU_ClockSelect>
20025114:	4620      	mov	r0, r4
20025116:	f7ff fe1b 	bl	20024d50 <HAL_RCC_HCPU_ConfigSxModeVolt>
2002511a:	20fa      	movs	r0, #250	@ 0xfa
2002511c:	f7fc ff23 	bl	20021f66 <HAL_Delay_us>
20025120:	f7ff fed6 	bl	20024ed0 <HAL_RCC_HCPU_DisableDLL1>
20025124:	2d30      	cmp	r5, #48	@ 0x30
20025126:	d80d      	bhi.n	20025144 <HAL_RCC_HCPU_ConfigDvfs+0x70>
20025128:	f7fd fc64 	bl	200229f4 <HAL_HPAON_DisableXT48>
2002512c:	2100      	movs	r1, #0
2002512e:	4608      	mov	r0, r1
20025130:	f7ff ff02 	bl	20024f38 <HAL_RCC_HCPU_ClockSelect>
20025134:	2204      	movs	r2, #4
20025136:	2100      	movs	r1, #0
20025138:	2030      	movs	r0, #48	@ 0x30
2002513a:	fbb0 f0f5 	udiv	r0, r0, r5
2002513e:	f7ff ff1f 	bl	20024f80 <HAL_RCC_HCPU_SetDiv>
20025142:	e7e1      	b.n	20025108 <HAL_RCC_HCPU_ConfigDvfs+0x34>
20025144:	f7fd fc4a 	bl	200229dc <HAL_HPAON_EnableXT48>
20025148:	4816      	ldr	r0, [pc, #88]	@ (200251a4 <HAL_RCC_HCPU_ConfigDvfs+0xd0>)
2002514a:	4368      	muls	r0, r5
2002514c:	f7ff feb8 	bl	20024ec0 <HAL_RCC_HCPU_EnableDLL1>
20025150:	4605      	mov	r5, r0
20025152:	2800      	cmp	r0, #0
20025154:	d1c8      	bne.n	200250e8 <HAL_RCC_HCPU_ConfigDvfs+0x14>
20025156:	2101      	movs	r1, #1
20025158:	2206      	movs	r2, #6
2002515a:	4608      	mov	r0, r1
2002515c:	f7ff ff10 	bl	20024f80 <HAL_RCC_HCPU_SetDiv>
20025160:	2103      	movs	r1, #3
20025162:	4628      	mov	r0, r5
20025164:	f7ff fee8 	bl	20024f38 <HAL_RCC_HCPU_ClockSelect>
20025168:	e7ce      	b.n	20025108 <HAL_RCC_HCPU_ConfigDvfs+0x34>
2002516a:	2901      	cmp	r1, #1
2002516c:	d909      	bls.n	20025182 <HAL_RCC_HCPU_ConfigDvfs+0xae>
2002516e:	4601      	mov	r1, r0
20025170:	4620      	mov	r0, r4
20025172:	f7ff ff2f 	bl	20024fd4 <HAL_RCC_HCPU_SwitchDvfsD2S>
20025176:	4605      	mov	r5, r0
20025178:	2000      	movs	r0, #0
2002517a:	7034      	strb	r4, [r6, #0]
2002517c:	f7fc fef3 	bl	20021f66 <HAL_Delay_us>
20025180:	e7b3      	b.n	200250ea <HAL_RCC_HCPU_ConfigDvfs+0x16>
20025182:	428b      	cmp	r3, r1
20025184:	d103      	bne.n	2002518e <HAL_RCC_HCPU_ConfigDvfs+0xba>
20025186:	f04f 32ff 	mov.w	r2, #4294967295	@ 0xffffffff
2002518a:	4611      	mov	r1, r2
2002518c:	e7d4      	b.n	20025138 <HAL_RCC_HCPU_ConfigDvfs+0x64>
2002518e:	2190      	movs	r1, #144	@ 0x90
20025190:	2002      	movs	r0, #2
20025192:	f7ff ff1f 	bl	20024fd4 <HAL_RCC_HCPU_SwitchDvfsD2S>
20025196:	2800      	cmp	r0, #0
20025198:	d1a6      	bne.n	200250e8 <HAL_RCC_HCPU_ConfigDvfs+0x14>
2002519a:	e7b1      	b.n	20025100 <HAL_RCC_HCPU_ConfigDvfs+0x2c>
2002519c:	20042c09 	.word	0x20042c09
200251a0:	2002b08c 	.word	0x2002b08c
200251a4:	000f4240 	.word	0x000f4240

200251a8 <HAL_RCC_Reset_and_Halt_LCPU>:
200251a8:	4a13      	ldr	r2, [pc, #76]	@ (200251f8 <HAL_RCC_Reset_and_Halt_LCPU+0x50>)
200251aa:	6813      	ldr	r3, [r2, #0]
200251ac:	0759      	lsls	r1, r3, #29
200251ae:	d421      	bmi.n	200251f4 <HAL_RCC_Reset_and_Halt_LCPU+0x4c>
200251b0:	6811      	ldr	r1, [r2, #0]
200251b2:	2800      	cmp	r0, #0
200251b4:	bf0c      	ite	eq
200251b6:	2301      	moveq	r3, #1
200251b8:	f04f 33ff 	movne.w	r3, #4294967295	@ 0xffffffff
200251bc:	f041 0104 	orr.w	r1, r1, #4
200251c0:	6011      	str	r1, [r2, #0]
200251c2:	f04f 4280 	mov.w	r2, #1073741824	@ 0x40000000
200251c6:	f443 1380 	orr.w	r3, r3, #1048576	@ 0x100000
200251ca:	6013      	str	r3, [r2, #0]
200251cc:	6811      	ldr	r1, [r2, #0]
200251ce:	2900      	cmp	r1, #0
200251d0:	d0fc      	beq.n	200251cc <HAL_RCC_Reset_and_Halt_LCPU+0x24>
200251d2:	4a09      	ldr	r2, [pc, #36]	@ (200251f8 <HAL_RCC_Reset_and_Halt_LCPU+0x50>)
200251d4:	6c11      	ldr	r1, [r2, #64]	@ 0x40
200251d6:	06c8      	lsls	r0, r1, #27
200251d8:	d506      	bpl.n	200251e8 <HAL_RCC_Reset_and_Halt_LCPU+0x40>
200251da:	6c11      	ldr	r1, [r2, #64]	@ 0x40
200251dc:	f041 0102 	orr.w	r1, r1, #2
200251e0:	6411      	str	r1, [r2, #64]	@ 0x40
200251e2:	6c11      	ldr	r1, [r2, #64]	@ 0x40
200251e4:	06c9      	lsls	r1, r1, #27
200251e6:	d4fc      	bmi.n	200251e2 <HAL_RCC_Reset_and_Halt_LCPU+0x3a>
200251e8:	f04f 4180 	mov.w	r1, #1073741824	@ 0x40000000
200251ec:	680a      	ldr	r2, [r1, #0]
200251ee:	ea22 0303 	bic.w	r3, r2, r3
200251f2:	600b      	str	r3, [r1, #0]
200251f4:	4770      	bx	lr
200251f6:	bf00      	nop
200251f8:	40040000 	.word	0x40040000

200251fc <HAL_RCC_HCPU_ConfigHCLK>:
200251fc:	28f0      	cmp	r0, #240	@ 0xf0
200251fe:	d80d      	bhi.n	2002521c <HAL_RCC_HCPU_ConfigHCLK+0x20>
20025200:	2890      	cmp	r0, #144	@ 0x90
20025202:	d807      	bhi.n	20025214 <HAL_RCC_HCPU_ConfigHCLK+0x18>
20025204:	2830      	cmp	r0, #48	@ 0x30
20025206:	d807      	bhi.n	20025218 <HAL_RCC_HCPU_ConfigHCLK+0x1c>
20025208:	2818      	cmp	r0, #24
2002520a:	bf94      	ite	ls
2002520c:	2100      	movls	r1, #0
2002520e:	2101      	movhi	r1, #1
20025210:	f7ff bf60 	b.w	200250d4 <HAL_RCC_HCPU_ConfigDvfs>
20025214:	2103      	movs	r1, #3
20025216:	e7fb      	b.n	20025210 <HAL_RCC_HCPU_ConfigHCLK+0x14>
20025218:	2102      	movs	r1, #2
2002521a:	e7f9      	b.n	20025210 <HAL_RCC_HCPU_ConfigHCLK+0x14>
2002521c:	2001      	movs	r0, #1
2002521e:	4770      	bx	lr

20025220 <spi_flash_get_rdid>:
20025220:	b5f0      	push	{r4, r5, r6, r7, lr}
20025222:	4605      	mov	r5, r0
20025224:	3801      	subs	r0, #1
20025226:	b2c0      	uxtb	r0, r0
20025228:	28fd      	cmp	r0, #253	@ 0xfd
2002522a:	d808      	bhi.n	2002523e <spi_flash_get_rdid+0x1e>
2002522c:	2400      	movs	r4, #0
2002522e:	4f0b      	ldr	r7, [pc, #44]	@ (2002525c <spi_flash_get_rdid+0x3c>)
20025230:	f857 0b04 	ldr.w	r0, [r7], #4
20025234:	7806      	ldrb	r6, [r0, #0]
20025236:	b926      	cbnz	r6, 20025242 <spi_flash_get_rdid+0x22>
20025238:	3401      	adds	r4, #1
2002523a:	2c06      	cmp	r4, #6
2002523c:	d1f8      	bne.n	20025230 <spi_flash_get_rdid+0x10>
2002523e:	2000      	movs	r0, #0
20025240:	e00b      	b.n	2002525a <spi_flash_get_rdid+0x3a>
20025242:	42ae      	cmp	r6, r5
20025244:	d105      	bne.n	20025252 <spi_flash_get_rdid+0x32>
20025246:	7846      	ldrb	r6, [r0, #1]
20025248:	4296      	cmp	r6, r2
2002524a:	d102      	bne.n	20025252 <spi_flash_get_rdid+0x32>
2002524c:	7886      	ldrb	r6, [r0, #2]
2002524e:	428e      	cmp	r6, r1
20025250:	d001      	beq.n	20025256 <spi_flash_get_rdid+0x36>
20025252:	3008      	adds	r0, #8
20025254:	e7ee      	b.n	20025234 <spi_flash_get_rdid+0x14>
20025256:	b103      	cbz	r3, 2002525a <spi_flash_get_rdid+0x3a>
20025258:	701c      	strb	r4, [r3, #0]
2002525a:	bdf0      	pop	{r4, r5, r6, r7, pc}
2002525c:	20042c0c 	.word	0x20042c0c

20025260 <spi_flash_get_cmd_by_id>:
20025260:	b507      	push	{r0, r1, r2, lr}
20025262:	f10d 0307 	add.w	r3, sp, #7
20025266:	f7ff ffdb 	bl	20025220 <spi_flash_get_rdid>
2002526a:	4b06      	ldr	r3, [pc, #24]	@ (20025284 <spi_flash_get_cmd_by_id+0x24>)
2002526c:	b140      	cbz	r0, 20025280 <spi_flash_get_cmd_by_id+0x20>
2002526e:	f44f 7105 	mov.w	r1, #532	@ 0x214
20025272:	f89d 2007 	ldrb.w	r2, [sp, #7]
20025276:	fb01 3002 	mla	r0, r1, r2, r3
2002527a:	b003      	add	sp, #12
2002527c:	f85d fb04 	ldr.w	pc, [sp], #4
20025280:	4618      	mov	r0, r3
20025282:	e7fa      	b.n	2002527a <spi_flash_get_cmd_by_id+0x1a>
20025284:	20042e44 	.word	0x20042e44

20025288 <spi_flash_get_size_by_id>:
20025288:	b508      	push	{r3, lr}
2002528a:	2300      	movs	r3, #0
2002528c:	f7ff ffc8 	bl	20025220 <spi_flash_get_rdid>
20025290:	b108      	cbz	r0, 20025296 <spi_flash_get_size_by_id+0xe>
20025292:	6840      	ldr	r0, [r0, #4]
20025294:	bd08      	pop	{r3, pc}
20025296:	f44f 2000 	mov.w	r0, #524288	@ 0x80000
2002529a:	e7fb      	b.n	20025294 <spi_flash_get_size_by_id+0xc>

2002529c <spi_flash_is_support_dtr>:
2002529c:	b508      	push	{r3, lr}
2002529e:	2300      	movs	r3, #0
200252a0:	f7ff ffbe 	bl	20025220 <spi_flash_get_rdid>
200252a4:	b110      	cbz	r0, 200252ac <spi_flash_is_support_dtr+0x10>
200252a6:	78c0      	ldrb	r0, [r0, #3]
200252a8:	f000 0001 	and.w	r0, r0, #1
200252ac:	bd08      	pop	{r3, pc}
	...

200252b0 <spi_nand_get_rdid>:
200252b0:	b5f0      	push	{r4, r5, r6, r7, lr}
200252b2:	4605      	mov	r5, r0
200252b4:	3801      	subs	r0, #1
200252b6:	b2c0      	uxtb	r0, r0
200252b8:	28fd      	cmp	r0, #253	@ 0xfd
200252ba:	d808      	bhi.n	200252ce <spi_nand_get_rdid+0x1e>
200252bc:	2400      	movs	r4, #0
200252be:	4f0b      	ldr	r7, [pc, #44]	@ (200252ec <spi_nand_get_rdid+0x3c>)
200252c0:	f857 0b04 	ldr.w	r0, [r7], #4
200252c4:	7806      	ldrb	r6, [r0, #0]
200252c6:	b926      	cbnz	r6, 200252d2 <spi_nand_get_rdid+0x22>
200252c8:	3401      	adds	r4, #1
200252ca:	2c06      	cmp	r4, #6
200252cc:	d1f8      	bne.n	200252c0 <spi_nand_get_rdid+0x10>
200252ce:	2000      	movs	r0, #0
200252d0:	e00b      	b.n	200252ea <spi_nand_get_rdid+0x3a>
200252d2:	42ae      	cmp	r6, r5
200252d4:	d105      	bne.n	200252e2 <spi_nand_get_rdid+0x32>
200252d6:	7846      	ldrb	r6, [r0, #1]
200252d8:	4296      	cmp	r6, r2
200252da:	d102      	bne.n	200252e2 <spi_nand_get_rdid+0x32>
200252dc:	7886      	ldrb	r6, [r0, #2]
200252de:	428e      	cmp	r6, r1
200252e0:	d001      	beq.n	200252e6 <spi_nand_get_rdid+0x36>
200252e2:	3008      	adds	r0, #8
200252e4:	e7ee      	b.n	200252c4 <spi_nand_get_rdid+0x14>
200252e6:	b103      	cbz	r3, 200252ea <spi_nand_get_rdid+0x3a>
200252e8:	701c      	strb	r4, [r3, #0]
200252ea:	bdf0      	pop	{r4, r5, r6, r7, pc}
200252ec:	20043abc 	.word	0x20043abc

200252f0 <spi_nand_get_cmd_by_id>:
200252f0:	b507      	push	{r0, r1, r2, lr}
200252f2:	f10d 0307 	add.w	r3, sp, #7
200252f6:	f7ff ffdb 	bl	200252b0 <spi_nand_get_rdid>
200252fa:	b130      	cbz	r0, 2002530a <spi_nand_get_cmd_by_id+0x1a>
200252fc:	f44f 7205 	mov.w	r2, #532	@ 0x214
20025300:	f89d 3007 	ldrb.w	r3, [sp, #7]
20025304:	4802      	ldr	r0, [pc, #8]	@ (20025310 <spi_nand_get_cmd_by_id+0x20>)
20025306:	fb02 0003 	mla	r0, r2, r3, r0
2002530a:	b003      	add	sp, #12
2002530c:	f85d fb04 	ldr.w	pc, [sp], #4
20025310:	20043cd4 	.word	0x20043cd4

20025314 <HAL_GET_FLASH_DEFAUT_INX>:
20025314:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
20025318:	4770      	bx	lr
	...

2002531c <spi_nand_get_default_ctable>:
2002531c:	b508      	push	{r3, lr}
2002531e:	f7ff fff9 	bl	20025314 <HAL_GET_FLASH_DEFAUT_INX>
20025322:	1e03      	subs	r3, r0, #0
20025324:	bfa5      	ittet	ge
20025326:	f44f 7205 	movge.w	r2, #532	@ 0x214
2002532a:	4802      	ldrge	r0, [pc, #8]	@ (20025334 <spi_nand_get_default_ctable+0x18>)
2002532c:	2000      	movlt	r0, #0
2002532e:	fb02 0003 	mlage	r0, r2, r3, r0
20025332:	bd08      	pop	{r3, pc}
20025334:	20043cd4 	.word	0x20043cd4

20025338 <spi_nand_get_size_by_id>:
20025338:	b508      	push	{r3, lr}
2002533a:	2300      	movs	r3, #0
2002533c:	f7ff ffb8 	bl	200252b0 <spi_nand_get_rdid>
20025340:	b108      	cbz	r0, 20025346 <spi_nand_get_size_by_id+0xe>
20025342:	6840      	ldr	r0, [r0, #4]
20025344:	bd08      	pop	{r3, pc}
20025346:	f04f 6080 	mov.w	r0, #67108864	@ 0x4000000
2002534a:	e7fb      	b.n	20025344 <spi_nand_get_size_by_id+0xc>

2002534c <spi_nand_get_plane_select_flag>:
2002534c:	b508      	push	{r3, lr}
2002534e:	2300      	movs	r3, #0
20025350:	f7ff ffae 	bl	200252b0 <spi_nand_get_rdid>
20025354:	b110      	cbz	r0, 2002535c <spi_nand_get_plane_select_flag+0x10>
20025356:	78c0      	ldrb	r0, [r0, #3]
20025358:	f3c0 0040 	ubfx	r0, r0, #1, #1
2002535c:	bd08      	pop	{r3, pc}

2002535e <spi_nand_get_big_page_flag>:
2002535e:	b508      	push	{r3, lr}
20025360:	2300      	movs	r3, #0
20025362:	f7ff ffa5 	bl	200252b0 <spi_nand_get_rdid>
20025366:	b110      	cbz	r0, 2002536e <spi_nand_get_big_page_flag+0x10>
20025368:	78c0      	ldrb	r0, [r0, #3]
2002536a:	f3c0 0081 	ubfx	r0, r0, #2, #2
2002536e:	bd08      	pop	{r3, pc}

20025370 <spi_nand_get_ecc_mode>:
20025370:	b508      	push	{r3, lr}
20025372:	2300      	movs	r3, #0
20025374:	f7ff ff9c 	bl	200252b0 <spi_nand_get_rdid>
20025378:	b108      	cbz	r0, 2002537e <spi_nand_get_ecc_mode+0xe>
2002537a:	78c0      	ldrb	r0, [r0, #3]
2002537c:	0900      	lsrs	r0, r0, #4
2002537e:	bd08      	pop	{r3, pc}

20025380 <bbm_map_check.part.0>:
20025380:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
20025382:	4b21      	ldr	r3, [pc, #132]	@ (20025408 <bbm_map_check.part.0+0x88>)
20025384:	4606      	mov	r6, r0
20025386:	681d      	ldr	r5, [r3, #0]
20025388:	4b20      	ldr	r3, [pc, #128]	@ (2002540c <bbm_map_check.part.0+0x8c>)
2002538a:	3d04      	subs	r5, #4
2002538c:	681f      	ldr	r7, [r3, #0]
2002538e:	2300      	movs	r3, #0
20025390:	f100 0e1a 	add.w	lr, r0, #26
20025394:	42ab      	cmp	r3, r5
20025396:	db02      	blt.n	2002539e <bbm_map_check.part.0+0x1e>
20025398:	2000      	movs	r0, #0
2002539a:	b003      	add	sp, #12
2002539c:	bdf0      	pop	{r4, r5, r6, r7, pc}
2002539e:	8b31      	ldrh	r1, [r6, #24]
200253a0:	b321      	cbz	r1, 200253ec <bbm_map_check.part.0+0x6c>
200253a2:	8b72      	ldrh	r2, [r6, #26]
200253a4:	b33a      	cbz	r2, 200253f6 <bbm_map_check.part.0+0x76>
200253a6:	42b9      	cmp	r1, r7
200253a8:	d201      	bcs.n	200253ae <bbm_map_check.part.0+0x2e>
200253aa:	4297      	cmp	r7, r2
200253ac:	d905      	bls.n	200253ba <bbm_map_check.part.0+0x3a>
200253ae:	4b18      	ldr	r3, [pc, #96]	@ (20025410 <bbm_map_check.part.0+0x90>)
200253b0:	681b      	ldr	r3, [r3, #0]
200253b2:	b10b      	cbz	r3, 200253b8 <bbm_map_check.part.0+0x38>
200253b4:	4817      	ldr	r0, [pc, #92]	@ (20025414 <bbm_map_check.part.0+0x94>)
200253b6:	4798      	blx	r3
200253b8:	e7fe      	b.n	200253b8 <bbm_map_check.part.0+0x38>
200253ba:	3301      	adds	r3, #1
200253bc:	461c      	mov	r4, r3
200253be:	42ac      	cmp	r4, r5
200253c0:	db01      	blt.n	200253c6 <bbm_map_check.part.0+0x46>
200253c2:	3604      	adds	r6, #4
200253c4:	e7e6      	b.n	20025394 <bbm_map_check.part.0+0x14>
200253c6:	f83e c024 	ldrh.w	ip, [lr, r4, lsl #2]
200253ca:	f1bc 0f00 	cmp.w	ip, #0
200253ce:	d0f8      	beq.n	200253c2 <bbm_map_check.part.0+0x42>
200253d0:	4562      	cmp	r2, ip
200253d2:	d109      	bne.n	200253e8 <bbm_map_check.part.0+0x68>
200253d4:	4b0e      	ldr	r3, [pc, #56]	@ (20025410 <bbm_map_check.part.0+0x90>)
200253d6:	681d      	ldr	r5, [r3, #0]
200253d8:	b12d      	cbz	r5, 200253e6 <bbm_map_check.part.0+0x66>
200253da:	3406      	adds	r4, #6
200253dc:	f830 3024 	ldrh.w	r3, [r0, r4, lsl #2]
200253e0:	480d      	ldr	r0, [pc, #52]	@ (20025418 <bbm_map_check.part.0+0x98>)
200253e2:	9200      	str	r2, [sp, #0]
200253e4:	47a8      	blx	r5
200253e6:	e7fe      	b.n	200253e6 <bbm_map_check.part.0+0x66>
200253e8:	3401      	adds	r4, #1
200253ea:	e7e8      	b.n	200253be <bbm_map_check.part.0+0x3e>
200253ec:	eb00 0283 	add.w	r2, r0, r3, lsl #2
200253f0:	8b52      	ldrh	r2, [r2, #26]
200253f2:	2a00      	cmp	r2, #0
200253f4:	d0d0      	beq.n	20025398 <bbm_map_check.part.0+0x18>
200253f6:	4a06      	ldr	r2, [pc, #24]	@ (20025410 <bbm_map_check.part.0+0x90>)
200253f8:	6814      	ldr	r4, [r2, #0]
200253fa:	b124      	cbz	r4, 20025406 <bbm_map_check.part.0+0x86>
200253fc:	eb00 0383 	add.w	r3, r0, r3, lsl #2
20025400:	8b5a      	ldrh	r2, [r3, #26]
20025402:	4806      	ldr	r0, [pc, #24]	@ (2002541c <bbm_map_check.part.0+0x9c>)
20025404:	47a0      	blx	r4
20025406:	e7fe      	b.n	20025406 <bbm_map_check.part.0+0x86>
20025408:	2004cbec 	.word	0x2004cbec
2002540c:	2004cbf0 	.word	0x2004cbf0
20025410:	2004cbdc 	.word	0x2004cbdc
20025414:	2002aa2c 	.word	0x2002aa2c
20025418:	2002aa49 	.word	0x2002aa49
2002541c:	2002aa96 	.word	0x2002aa96

20025420 <bbm_crc_check>:
20025420:	f04f 32ff 	mov.w	r2, #4294967295	@ 0xffffffff
20025424:	b510      	push	{r4, lr}
20025426:	4c07      	ldr	r4, [pc, #28]	@ (20025444 <bbm_crc_check+0x24>)
20025428:	4401      	add	r1, r0
2002542a:	4288      	cmp	r0, r1
2002542c:	d101      	bne.n	20025432 <bbm_crc_check+0x12>
2002542e:	43d0      	mvns	r0, r2
20025430:	bd10      	pop	{r4, pc}
20025432:	f810 3b01 	ldrb.w	r3, [r0], #1
20025436:	4053      	eors	r3, r2
20025438:	b2db      	uxtb	r3, r3
2002543a:	f854 3023 	ldr.w	r3, [r4, r3, lsl #2]
2002543e:	ea83 2212 	eor.w	r2, r3, r2, lsr #8
20025442:	e7f2      	b.n	2002542a <bbm_crc_check+0xa>
20025444:	2002b0bc 	.word	0x2002b0bc

20025448 <bbm_get_phy_blk>:
20025448:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
2002544a:	4b14      	ldr	r3, [pc, #80]	@ (2002549c <bbm_get_phy_blk+0x54>)
2002544c:	4601      	mov	r1, r0
2002544e:	681e      	ldr	r6, [r3, #0]
20025450:	42b0      	cmp	r0, r6
20025452:	d21e      	bcs.n	20025492 <bbm_get_phy_blk+0x4a>
20025454:	b138      	cbz	r0, 20025466 <bbm_get_phy_blk+0x1e>
20025456:	4b12      	ldr	r3, [pc, #72]	@ (200254a0 <bbm_get_phy_blk+0x58>)
20025458:	2200      	movs	r2, #0
2002545a:	681c      	ldr	r4, [r3, #0]
2002545c:	4b11      	ldr	r3, [pc, #68]	@ (200254a4 <bbm_get_phy_blk+0x5c>)
2002545e:	3c04      	subs	r4, #4
20025460:	461d      	mov	r5, r3
20025462:	4294      	cmp	r4, r2
20025464:	dc00      	bgt.n	20025468 <bbm_get_phy_blk+0x20>
20025466:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
20025468:	8b1f      	ldrh	r7, [r3, #24]
2002546a:	428f      	cmp	r7, r1
2002546c:	d10a      	bne.n	20025484 <bbm_get_phy_blk+0x3c>
2002546e:	eb05 0582 	add.w	r5, r5, r2, lsl #2
20025472:	8b6a      	ldrh	r2, [r5, #26]
20025474:	4296      	cmp	r6, r2
20025476:	dd0f      	ble.n	20025498 <bbm_get_phy_blk+0x50>
20025478:	4b0b      	ldr	r3, [pc, #44]	@ (200254a8 <bbm_get_phy_blk+0x60>)
2002547a:	681b      	ldr	r3, [r3, #0]
2002547c:	b10b      	cbz	r3, 20025482 <bbm_get_phy_blk+0x3a>
2002547e:	480b      	ldr	r0, [pc, #44]	@ (200254ac <bbm_get_phy_blk+0x64>)
20025480:	4798      	blx	r3
20025482:	e7fe      	b.n	20025482 <bbm_get_phy_blk+0x3a>
20025484:	b917      	cbnz	r7, 2002548c <bbm_get_phy_blk+0x44>
20025486:	8b5f      	ldrh	r7, [r3, #26]
20025488:	2f00      	cmp	r7, #0
2002548a:	d0ec      	beq.n	20025466 <bbm_get_phy_blk+0x1e>
2002548c:	3201      	adds	r2, #1
2002548e:	3304      	adds	r3, #4
20025490:	e7e7      	b.n	20025462 <bbm_get_phy_blk+0x1a>
20025492:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
20025496:	e7e6      	b.n	20025466 <bbm_get_phy_blk+0x1e>
20025498:	4610      	mov	r0, r2
2002549a:	e7e4      	b.n	20025466 <bbm_get_phy_blk+0x1e>
2002549c:	2004cbf0 	.word	0x2004cbf0
200254a0:	2004cbec 	.word	0x2004cbec
200254a4:	2004cbf4 	.word	0x2004cbf4
200254a8:	2004cbdc 	.word	0x2004cbdc
200254ac:	2002aab4 	.word	0x2002aab4

200254b0 <bbm_get_version_inblk>:
200254b0:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
200254b4:	4607      	mov	r7, r0
200254b6:	4688      	mov	r8, r1
200254b8:	b087      	sub	sp, #28
200254ba:	2900      	cmp	r1, #0
200254bc:	d14b      	bne.n	20025556 <bbm_get_version_inblk+0xa6>
200254be:	2500      	movs	r5, #0
200254c0:	4628      	mov	r0, r5
200254c2:	b007      	add	sp, #28
200254c4:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
200254c8:	2200      	movs	r2, #0
200254ca:	e9cd 2201 	strd	r2, r2, [sp, #4]
200254ce:	4e26      	ldr	r6, [pc, #152]	@ (20025568 <bbm_get_version_inblk+0xb8>)
200254d0:	9100      	str	r1, [sp, #0]
200254d2:	4638      	mov	r0, r7
200254d4:	4621      	mov	r1, r4
200254d6:	6833      	ldr	r3, [r6, #0]
200254d8:	f7fb fb56 	bl	20020b88 <port_read_page>
200254dc:	2800      	cmp	r0, #0
200254de:	dd32      	ble.n	20025546 <bbm_get_version_inblk+0x96>
200254e0:	6832      	ldr	r2, [r6, #0]
200254e2:	6813      	ldr	r3, [r2, #0]
200254e4:	455b      	cmp	r3, fp
200254e6:	d123      	bne.n	20025530 <bbm_get_version_inblk+0x80>
200254e8:	6856      	ldr	r6, [r2, #4]
200254ea:	f3c6 061e 	ubfx	r6, r6, #0, #31
200254ee:	42ae      	cmp	r6, r5
200254f0:	dd15      	ble.n	2002551e <bbm_get_version_inblk+0x6e>
200254f2:	4610      	mov	r0, r2
200254f4:	2110      	movs	r1, #16
200254f6:	9205      	str	r2, [sp, #20]
200254f8:	f7ff ff92 	bl	20025420 <bbm_crc_check>
200254fc:	9a05      	ldr	r2, [sp, #20]
200254fe:	6913      	ldr	r3, [r2, #16]
20025500:	4283      	cmp	r3, r0
20025502:	d113      	bne.n	2002552c <bbm_get_version_inblk+0x7c>
20025504:	f8c8 4000 	str.w	r4, [r8]
20025508:	4635      	mov	r5, r6
2002550a:	3401      	adds	r4, #1
2002550c:	f8da 1000 	ldr.w	r1, [sl]
20025510:	f8d9 3000 	ldr.w	r3, [r9]
20025514:	fbb3 f3f1 	udiv	r3, r3, r1
20025518:	42a3      	cmp	r3, r4
2002551a:	d8d5      	bhi.n	200254c8 <bbm_get_version_inblk+0x18>
2002551c:	e7d0      	b.n	200254c0 <bbm_get_version_inblk+0x10>
2002551e:	4b13      	ldr	r3, [pc, #76]	@ (2002556c <bbm_get_version_inblk+0xbc>)
20025520:	681b      	ldr	r3, [r3, #0]
20025522:	b11b      	cbz	r3, 2002552c <bbm_get_version_inblk+0x7c>
20025524:	4632      	mov	r2, r6
20025526:	4629      	mov	r1, r5
20025528:	4811      	ldr	r0, [pc, #68]	@ (20025570 <bbm_get_version_inblk+0xc0>)
2002552a:	4798      	blx	r3
2002552c:	462e      	mov	r6, r5
2002552e:	e7eb      	b.n	20025508 <bbm_get_version_inblk+0x58>
20025530:	1c5a      	adds	r2, r3, #1
20025532:	d0c5      	beq.n	200254c0 <bbm_get_version_inblk+0x10>
20025534:	4a0d      	ldr	r2, [pc, #52]	@ (2002556c <bbm_get_version_inblk+0xbc>)
20025536:	6815      	ldr	r5, [r2, #0]
20025538:	2d00      	cmp	r5, #0
2002553a:	d0c0      	beq.n	200254be <bbm_get_version_inblk+0xe>
2002553c:	4622      	mov	r2, r4
2002553e:	4639      	mov	r1, r7
20025540:	480c      	ldr	r0, [pc, #48]	@ (20025574 <bbm_get_version_inblk+0xc4>)
20025542:	47a8      	blx	r5
20025544:	e7bb      	b.n	200254be <bbm_get_version_inblk+0xe>
20025546:	4b09      	ldr	r3, [pc, #36]	@ (2002556c <bbm_get_version_inblk+0xbc>)
20025548:	681b      	ldr	r3, [r3, #0]
2002554a:	2b00      	cmp	r3, #0
2002554c:	d0ee      	beq.n	2002552c <bbm_get_version_inblk+0x7c>
2002554e:	4622      	mov	r2, r4
20025550:	4639      	mov	r1, r7
20025552:	4809      	ldr	r0, [pc, #36]	@ (20025578 <bbm_get_version_inblk+0xc8>)
20025554:	e7e9      	b.n	2002552a <bbm_get_version_inblk+0x7a>
20025556:	2400      	movs	r4, #0
20025558:	f8df a020 	ldr.w	sl, [pc, #32]	@ 2002557c <bbm_get_version_inblk+0xcc>
2002555c:	4625      	mov	r5, r4
2002555e:	f8df 9020 	ldr.w	r9, [pc, #32]	@ 20025580 <bbm_get_version_inblk+0xd0>
20025562:	f8df b020 	ldr.w	fp, [pc, #32]	@ 20025584 <bbm_get_version_inblk+0xd4>
20025566:	e7d1      	b.n	2002550c <bbm_get_version_inblk+0x5c>
20025568:	2004cbe0 	.word	0x2004cbe0
2002556c:	2004cbdc 	.word	0x2004cbdc
20025570:	2002aad3 	.word	0x2002aad3
20025574:	2002ab00 	.word	0x2002ab00
20025578:	2002ab31 	.word	0x2002ab31
2002557c:	2004494c 	.word	0x2004494c
20025580:	20044950 	.word	0x20044950
20025584:	5366424d 	.word	0x5366424d

20025588 <bbm_get_map_table>:
20025588:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
2002558c:	2801      	cmp	r0, #1
2002558e:	4607      	mov	r7, r0
20025590:	f8df b15c 	ldr.w	fp, [pc, #348]	@ 200256f0 <bbm_get_map_table+0x168>
20025594:	b087      	sub	sp, #28
20025596:	dd0a      	ble.n	200255ae <bbm_get_map_table+0x26>
20025598:	f8db 3000 	ldr.w	r3, [fp]
2002559c:	b91b      	cbnz	r3, 200255a6 <bbm_get_map_table+0x1e>
2002559e:	2000      	movs	r0, #0
200255a0:	b007      	add	sp, #28
200255a2:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
200255a6:	4601      	mov	r1, r0
200255a8:	4847      	ldr	r0, [pc, #284]	@ (200256c8 <bbm_get_map_table+0x140>)
200255aa:	4798      	blx	r3
200255ac:	e7f7      	b.n	2002559e <bbm_get_map_table+0x16>
200255ae:	f8df 8144 	ldr.w	r8, [pc, #324]	@ 200256f4 <bbm_get_map_table+0x16c>
200255b2:	2800      	cmp	r0, #0
200255b4:	d163      	bne.n	2002567e <bbm_get_map_table+0xf6>
200255b6:	f8b8 6000 	ldrh.w	r6, [r8]
200255ba:	f8b8 5002 	ldrh.w	r5, [r8, #2]
200255be:	2e00      	cmp	r6, #0
200255c0:	d062      	beq.n	20025688 <bbm_get_map_table+0x100>
200255c2:	4630      	mov	r0, r6
200255c4:	a904      	add	r1, sp, #16
200255c6:	f7ff ff73 	bl	200254b0 <bbm_get_version_inblk>
200255ca:	4681      	mov	r9, r0
200255cc:	2d00      	cmp	r5, #0
200255ce:	d05d      	beq.n	2002568c <bbm_get_map_table+0x104>
200255d0:	4628      	mov	r0, r5
200255d2:	a905      	add	r1, sp, #20
200255d4:	f7ff ff6c 	bl	200254b0 <bbm_get_version_inblk>
200255d8:	4604      	mov	r4, r0
200255da:	f8db a000 	ldr.w	sl, [fp]
200255de:	f1ba 0f00 	cmp.w	sl, #0
200255e2:	d005      	beq.n	200255f0 <bbm_get_map_table+0x68>
200255e4:	4623      	mov	r3, r4
200255e6:	4632      	mov	r2, r6
200255e8:	4649      	mov	r1, r9
200255ea:	4838      	ldr	r0, [pc, #224]	@ (200256cc <bbm_get_map_table+0x144>)
200255ec:	9500      	str	r5, [sp, #0]
200255ee:	47d0      	blx	sl
200255f0:	45a1      	cmp	r9, r4
200255f2:	d0d4      	beq.n	2002559e <bbm_get_map_table+0x16>
200255f4:	f04f 0200 	mov.w	r2, #0
200255f8:	bf98      	it	ls
200255fa:	462e      	movls	r6, r5
200255fc:	f107 0308 	add.w	r3, r7, #8
20025600:	bf94      	ite	ls
20025602:	f828 5013 	strhls.w	r5, [r8, r3, lsl #1]
20025606:	f828 6013 	strhhi.w	r6, [r8, r3, lsl #1]
2002560a:	e9cd 2201 	strd	r2, r2, [sp, #4]
2002560e:	4b30      	ldr	r3, [pc, #192]	@ (200256d0 <bbm_get_map_table+0x148>)
20025610:	bf88      	it	hi
20025612:	f8dd a010 	ldrhi.w	sl, [sp, #16]
20025616:	681b      	ldr	r3, [r3, #0]
20025618:	bf98      	it	ls
2002561a:	f8dd a014 	ldrls.w	sl, [sp, #20]
2002561e:	f8df 80d8 	ldr.w	r8, [pc, #216]	@ 200256f8 <bbm_get_map_table+0x170>
20025622:	9300      	str	r3, [sp, #0]
20025624:	4651      	mov	r1, sl
20025626:	4630      	mov	r0, r6
20025628:	f8d8 3000 	ldr.w	r3, [r8]
2002562c:	bf88      	it	hi
2002562e:	464c      	movhi	r4, r9
20025630:	f7fb faaa 	bl	20020b88 <port_read_page>
20025634:	2800      	cmp	r0, #0
20025636:	f8db 5000 	ldr.w	r5, [fp]
2002563a:	dd38      	ble.n	200256ae <bbm_get_map_table+0x126>
2002563c:	f8d8 8000 	ldr.w	r8, [r8]
20025640:	4b24      	ldr	r3, [pc, #144]	@ (200256d4 <bbm_get_map_table+0x14c>)
20025642:	f8d8 2000 	ldr.w	r2, [r8]
20025646:	429a      	cmp	r2, r3
20025648:	d12b      	bne.n	200256a2 <bbm_get_map_table+0x11a>
2002564a:	2110      	movs	r1, #16
2002564c:	4640      	mov	r0, r8
2002564e:	f7ff fee7 	bl	20025420 <bbm_crc_check>
20025652:	f8d8 2010 	ldr.w	r2, [r8, #16]
20025656:	4601      	mov	r1, r0
20025658:	4282      	cmp	r2, r0
2002565a:	d11e      	bne.n	2002569a <bbm_get_map_table+0x112>
2002565c:	f8d8 1004 	ldr.w	r1, [r8, #4]
20025660:	f3c1 011e 	ubfx	r1, r1, #0, #31
20025664:	42a1      	cmp	r1, r4
20025666:	d113      	bne.n	20025690 <bbm_get_map_table+0x108>
20025668:	f44f 7202 	mov.w	r2, #520	@ 0x208
2002566c:	481a      	ldr	r0, [pc, #104]	@ (200256d8 <bbm_get_map_table+0x150>)
2002566e:	4641      	mov	r1, r8
20025670:	fb02 0007 	mla	r0, r2, r7, r0
20025674:	f005 f900 	bl	2002a878 <memcpy>
20025678:	bb0d      	cbnz	r5, 200256be <bbm_get_map_table+0x136>
2002567a:	4620      	mov	r0, r4
2002567c:	e790      	b.n	200255a0 <bbm_get_map_table+0x18>
2002567e:	f8b8 6004 	ldrh.w	r6, [r8, #4]
20025682:	f8b8 5006 	ldrh.w	r5, [r8, #6]
20025686:	e79a      	b.n	200255be <bbm_get_map_table+0x36>
20025688:	46b1      	mov	r9, r6
2002568a:	e79f      	b.n	200255cc <bbm_get_map_table+0x44>
2002568c:	462c      	mov	r4, r5
2002568e:	e7a4      	b.n	200255da <bbm_get_map_table+0x52>
20025690:	b115      	cbz	r5, 20025698 <bbm_get_map_table+0x110>
20025692:	4622      	mov	r2, r4
20025694:	4811      	ldr	r0, [pc, #68]	@ (200256dc <bbm_get_map_table+0x154>)
20025696:	47a8      	blx	r5
20025698:	e7fe      	b.n	20025698 <bbm_get_map_table+0x110>
2002569a:	b10d      	cbz	r5, 200256a0 <bbm_get_map_table+0x118>
2002569c:	4810      	ldr	r0, [pc, #64]	@ (200256e0 <bbm_get_map_table+0x158>)
2002569e:	47a8      	blx	r5
200256a0:	e7fe      	b.n	200256a0 <bbm_get_map_table+0x118>
200256a2:	b11d      	cbz	r5, 200256ac <bbm_get_map_table+0x124>
200256a4:	4652      	mov	r2, sl
200256a6:	4631      	mov	r1, r6
200256a8:	480e      	ldr	r0, [pc, #56]	@ (200256e4 <bbm_get_map_table+0x15c>)
200256aa:	47a8      	blx	r5
200256ac:	e7fe      	b.n	200256ac <bbm_get_map_table+0x124>
200256ae:	2d00      	cmp	r5, #0
200256b0:	f43f af75 	beq.w	2002559e <bbm_get_map_table+0x16>
200256b4:	4652      	mov	r2, sl
200256b6:	4631      	mov	r1, r6
200256b8:	480b      	ldr	r0, [pc, #44]	@ (200256e8 <bbm_get_map_table+0x160>)
200256ba:	47a8      	blx	r5
200256bc:	e76f      	b.n	2002559e <bbm_get_map_table+0x16>
200256be:	4621      	mov	r1, r4
200256c0:	480a      	ldr	r0, [pc, #40]	@ (200256ec <bbm_get_map_table+0x164>)
200256c2:	47a8      	blx	r5
200256c4:	e7d9      	b.n	2002567a <bbm_get_map_table+0xf2>
200256c6:	bf00      	nop
200256c8:	2002ab4f 	.word	0x2002ab4f
200256cc:	2002ab63 	.word	0x2002ab63
200256d0:	2004494c 	.word	0x2004494c
200256d4:	5366424d 	.word	0x5366424d
200256d8:	2004cbf4 	.word	0x2004cbf4
200256dc:	2002ab89 	.word	0x2002ab89
200256e0:	2002abd3 	.word	0x2002abd3
200256e4:	2002abe5 	.word	0x2002abe5
200256e8:	2002ac1a 	.word	0x2002ac1a
200256ec:	2002ac46 	.word	0x2002ac46
200256f0:	2004cbdc 	.word	0x2004cbdc
200256f4:	2004d004 	.word	0x2004d004
200256f8:	2004cbe0 	.word	0x2004cbe0

200256fc <bbm_get_page_num>:
200256fc:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
20025700:	4605      	mov	r5, r0
20025702:	2400      	movs	r4, #0
20025704:	4f13      	ldr	r7, [pc, #76]	@ (20025754 <bbm_get_page_num+0x58>)
20025706:	4e14      	ldr	r6, [pc, #80]	@ (20025758 <bbm_get_page_num+0x5c>)
20025708:	f8df 8050 	ldr.w	r8, [pc, #80]	@ 2002575c <bbm_get_page_num+0x60>
2002570c:	b085      	sub	sp, #20
2002570e:	6839      	ldr	r1, [r7, #0]
20025710:	6833      	ldr	r3, [r6, #0]
20025712:	fbb3 f3f1 	udiv	r3, r3, r1
20025716:	42a3      	cmp	r3, r4
20025718:	d802      	bhi.n	20025720 <bbm_get_page_num+0x24>
2002571a:	f04f 34ff 	mov.w	r4, #4294967295	@ 0xffffffff
2002571e:	e015      	b.n	2002574c <bbm_get_page_num+0x50>
20025720:	2200      	movs	r2, #0
20025722:	e9cd 2201 	strd	r2, r2, [sp, #4]
20025726:	f8df 9038 	ldr.w	r9, [pc, #56]	@ 20025760 <bbm_get_page_num+0x64>
2002572a:	9100      	str	r1, [sp, #0]
2002572c:	4628      	mov	r0, r5
2002572e:	4621      	mov	r1, r4
20025730:	f8d9 3000 	ldr.w	r3, [r9]
20025734:	f7fb fa28 	bl	20020b88 <port_read_page>
20025738:	b120      	cbz	r0, 20025744 <bbm_get_page_num+0x48>
2002573a:	f8d9 3000 	ldr.w	r3, [r9]
2002573e:	681b      	ldr	r3, [r3, #0]
20025740:	4543      	cmp	r3, r8
20025742:	d101      	bne.n	20025748 <bbm_get_page_num+0x4c>
20025744:	3401      	adds	r4, #1
20025746:	e7e2      	b.n	2002570e <bbm_get_page_num+0x12>
20025748:	3301      	adds	r3, #1
2002574a:	d1fb      	bne.n	20025744 <bbm_get_page_num+0x48>
2002574c:	4620      	mov	r0, r4
2002574e:	b005      	add	sp, #20
20025750:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
20025754:	2004494c 	.word	0x2004494c
20025758:	20044950 	.word	0x20044950
2002575c:	5366424d 	.word	0x5366424d
20025760:	2004cbe0 	.word	0x2004cbe0

20025764 <bbm_read_page>:
20025764:	b5f0      	push	{r4, r5, r6, r7, lr}
20025766:	4604      	mov	r4, r0
20025768:	b085      	sub	sp, #20
2002576a:	b280      	uxth	r0, r0
2002576c:	461f      	mov	r7, r3
2002576e:	460d      	mov	r5, r1
20025770:	4616      	mov	r6, r2
20025772:	f7ff fe69 	bl	20025448 <bbm_get_phy_blk>
20025776:	1c43      	adds	r3, r0, #1
20025778:	d108      	bne.n	2002578c <bbm_read_page+0x28>
2002577a:	4b0a      	ldr	r3, [pc, #40]	@ (200257a4 <bbm_read_page+0x40>)
2002577c:	681b      	ldr	r3, [r3, #0]
2002577e:	b113      	cbz	r3, 20025786 <bbm_read_page+0x22>
20025780:	4621      	mov	r1, r4
20025782:	4809      	ldr	r0, [pc, #36]	@ (200257a8 <bbm_read_page+0x44>)
20025784:	4798      	blx	r3
20025786:	2000      	movs	r0, #0
20025788:	b005      	add	sp, #20
2002578a:	bdf0      	pop	{r4, r5, r6, r7, pc}
2002578c:	9b0c      	ldr	r3, [sp, #48]	@ 0x30
2002578e:	4632      	mov	r2, r6
20025790:	9302      	str	r3, [sp, #8]
20025792:	9b0b      	ldr	r3, [sp, #44]	@ 0x2c
20025794:	4629      	mov	r1, r5
20025796:	9301      	str	r3, [sp, #4]
20025798:	9b0a      	ldr	r3, [sp, #40]	@ 0x28
2002579a:	9300      	str	r3, [sp, #0]
2002579c:	463b      	mov	r3, r7
2002579e:	f7fb f9f3 	bl	20020b88 <port_read_page>
200257a2:	e7f1      	b.n	20025788 <bbm_read_page+0x24>
200257a4:	2004cbdc 	.word	0x2004cbdc
200257a8:	2002ac59 	.word	0x2002ac59

200257ac <port_write_page>:
200257ac:	4b01      	ldr	r3, [pc, #4]	@ (200257b4 <port_write_page+0x8>)
200257ae:	6818      	ldr	r0, [r3, #0]
200257b0:	4770      	bx	lr
200257b2:	bf00      	nop
200257b4:	2004494c 	.word	0x2004494c

200257b8 <bbm_write_talbe.isra.0>:
200257b8:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
200257ba:	4604      	mov	r4, r0
200257bc:	4608      	mov	r0, r1
200257be:	460e      	mov	r6, r1
200257c0:	f7ff ff9c 	bl	200256fc <bbm_get_page_num>
200257c4:	1e05      	subs	r5, r0, #0
200257c6:	db25      	blt.n	20025814 <bbm_write_talbe.isra.0+0x5c>
200257c8:	4b13      	ldr	r3, [pc, #76]	@ (20025818 <bbm_write_talbe.isra.0+0x60>)
200257ca:	681a      	ldr	r2, [r3, #0]
200257cc:	4b13      	ldr	r3, [pc, #76]	@ (2002581c <bbm_write_talbe.isra.0+0x64>)
200257ce:	681b      	ldr	r3, [r3, #0]
200257d0:	fbb3 f3f2 	udiv	r3, r3, r2
200257d4:	429d      	cmp	r5, r3
200257d6:	da1d      	bge.n	20025814 <bbm_write_talbe.isra.0+0x5c>
200257d8:	4f11      	ldr	r7, [pc, #68]	@ (20025820 <bbm_write_talbe.isra.0+0x68>)
200257da:	21ff      	movs	r1, #255	@ 0xff
200257dc:	6838      	ldr	r0, [r7, #0]
200257de:	f005 f831 	bl	2002a844 <memset>
200257e2:	4264      	negs	r4, r4
200257e4:	490f      	ldr	r1, [pc, #60]	@ (20025824 <bbm_write_talbe.isra.0+0x6c>)
200257e6:	f404 7402 	and.w	r4, r4, #520	@ 0x208
200257ea:	f44f 7202 	mov.w	r2, #520	@ 0x208
200257ee:	6838      	ldr	r0, [r7, #0]
200257f0:	4421      	add	r1, r4
200257f2:	f005 f841 	bl	2002a878 <memcpy>
200257f6:	6838      	ldr	r0, [r7, #0]
200257f8:	b160      	cbz	r0, 20025814 <bbm_write_talbe.isra.0+0x5c>
200257fa:	6802      	ldr	r2, [r0, #0]
200257fc:	4b0a      	ldr	r3, [pc, #40]	@ (20025828 <bbm_write_talbe.isra.0+0x70>)
200257fe:	429a      	cmp	r2, r3
20025800:	d108      	bne.n	20025814 <bbm_write_talbe.isra.0+0x5c>
20025802:	f7ff fdbd 	bl	20025380 <bbm_map_check.part.0>
20025806:	2300      	movs	r3, #0
20025808:	9300      	str	r3, [sp, #0]
2002580a:	4629      	mov	r1, r5
2002580c:	4630      	mov	r0, r6
2002580e:	683a      	ldr	r2, [r7, #0]
20025810:	f7ff ffcc 	bl	200257ac <port_write_page>
20025814:	b003      	add	sp, #12
20025816:	bdf0      	pop	{r4, r5, r6, r7, pc}
20025818:	2004494c 	.word	0x2004494c
2002581c:	20044950 	.word	0x20044950
20025820:	2004cbe0 	.word	0x2004cbe0
20025824:	2004cbf4 	.word	0x2004cbf4
20025828:	5366424d 	.word	0x5366424d

2002582c <port_erase_block>:
2002582c:	2000      	movs	r0, #0
2002582e:	4770      	bx	lr

20025830 <bbm_init_table>:
20025830:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20025834:	4c7d      	ldr	r4, [pc, #500]	@ (20025a2c <bbm_init_table+0x1fc>)
20025836:	4b7e      	ldr	r3, [pc, #504]	@ (20025a30 <bbm_init_table+0x200>)
20025838:	6822      	ldr	r2, [r4, #0]
2002583a:	b085      	sub	sp, #20
2002583c:	429a      	cmp	r2, r3
2002583e:	f000 80ef 	beq.w	20025a20 <bbm_init_table+0x1f0>
20025842:	f8d4 2208 	ldr.w	r2, [r4, #520]	@ 0x208
20025846:	429a      	cmp	r2, r3
20025848:	f000 80ea 	beq.w	20025a20 <bbm_init_table+0x1f0>
2002584c:	6023      	str	r3, [r4, #0]
2002584e:	2301      	movs	r3, #1
20025850:	6063      	str	r3, [r4, #4]
20025852:	2300      	movs	r3, #0
20025854:	f8df 9210 	ldr.w	r9, [pc, #528]	@ 20025a68 <bbm_init_table+0x238>
20025858:	8123      	strh	r3, [r4, #8]
2002585a:	f8d9 3000 	ldr.w	r3, [r9]
2002585e:	4f75      	ldr	r7, [pc, #468]	@ (20025a34 <bbm_init_table+0x204>)
20025860:	3b04      	subs	r3, #4
20025862:	f8df a208 	ldr.w	sl, [pc, #520]	@ 20025a6c <bbm_init_table+0x23c>
20025866:	8163      	strh	r3, [r4, #10]
20025868:	683b      	ldr	r3, [r7, #0]
2002586a:	f8da 5000 	ldr.w	r5, [sl]
2002586e:	3b01      	subs	r3, #1
20025870:	4e71      	ldr	r6, [pc, #452]	@ (20025a38 <bbm_init_table+0x208>)
20025872:	81a3      	strh	r3, [r4, #12]
20025874:	81e5      	strh	r5, [r4, #14]
20025876:	683b      	ldr	r3, [r7, #0]
20025878:	429d      	cmp	r5, r3
2002587a:	db10      	blt.n	2002589e <bbm_init_table+0x6e>
2002587c:	2500      	movs	r5, #0
2002587e:	46a8      	mov	r8, r5
20025880:	f8df b1b4 	ldr.w	fp, [pc, #436]	@ 20025a38 <bbm_init_table+0x208>
20025884:	f8da 6000 	ldr.w	r6, [sl]
20025888:	42b5      	cmp	r5, r6
2002588a:	db20      	blt.n	200258ce <bbm_init_table+0x9e>
2002588c:	8963      	ldrh	r3, [r4, #10]
2002588e:	2b00      	cmp	r3, #0
20025890:	d14d      	bne.n	2002592e <bbm_init_table+0xfe>
20025892:	4b69      	ldr	r3, [pc, #420]	@ (20025a38 <bbm_init_table+0x208>)
20025894:	681b      	ldr	r3, [r3, #0]
20025896:	b10b      	cbz	r3, 2002589c <bbm_init_table+0x6c>
20025898:	4868      	ldr	r0, [pc, #416]	@ (20025a3c <bbm_init_table+0x20c>)
2002589a:	4798      	blx	r3
2002589c:	e7fe      	b.n	2002589c <bbm_init_table+0x6c>
2002589e:	4628      	mov	r0, r5
200258a0:	f7fb f9d2 	bl	20020c48 <bbm_get_bb>
200258a4:	b968      	cbnz	r0, 200258c2 <bbm_init_table+0x92>
200258a6:	4628      	mov	r0, r5
200258a8:	f7ff ffc0 	bl	2002582c <port_erase_block>
200258ac:	b138      	cbz	r0, 200258be <bbm_init_table+0x8e>
200258ae:	6833      	ldr	r3, [r6, #0]
200258b0:	b113      	cbz	r3, 200258b8 <bbm_init_table+0x88>
200258b2:	4629      	mov	r1, r5
200258b4:	4862      	ldr	r0, [pc, #392]	@ (20025a40 <bbm_init_table+0x210>)
200258b6:	4798      	blx	r3
200258b8:	8963      	ldrh	r3, [r4, #10]
200258ba:	3b01      	subs	r3, #1
200258bc:	8163      	strh	r3, [r4, #10]
200258be:	3501      	adds	r5, #1
200258c0:	e7d9      	b.n	20025876 <bbm_init_table+0x46>
200258c2:	6833      	ldr	r3, [r6, #0]
200258c4:	2b00      	cmp	r3, #0
200258c6:	d0f7      	beq.n	200258b8 <bbm_init_table+0x88>
200258c8:	4629      	mov	r1, r5
200258ca:	485e      	ldr	r0, [pc, #376]	@ (20025a44 <bbm_init_table+0x214>)
200258cc:	e7f3      	b.n	200258b6 <bbm_init_table+0x86>
200258ce:	4628      	mov	r0, r5
200258d0:	f7fb f9ba 	bl	20020c48 <bbm_get_bb>
200258d4:	b348      	cbz	r0, 2002592a <bbm_init_table+0xfa>
200258d6:	f8db 3000 	ldr.w	r3, [fp]
200258da:	b113      	cbz	r3, 200258e2 <bbm_init_table+0xb2>
200258dc:	4629      	mov	r1, r5
200258de:	485a      	ldr	r0, [pc, #360]	@ (20025a48 <bbm_init_table+0x218>)
200258e0:	4798      	blx	r3
200258e2:	89a0      	ldrh	r0, [r4, #12]
200258e4:	f7fb f9b0 	bl	20020c48 <bbm_get_bb>
200258e8:	89a3      	ldrh	r3, [r4, #12]
200258ea:	4606      	mov	r6, r0
200258ec:	3b01      	subs	r3, #1
200258ee:	81a3      	strh	r3, [r4, #12]
200258f0:	8963      	ldrh	r3, [r4, #10]
200258f2:	3b01      	subs	r3, #1
200258f4:	b29b      	uxth	r3, r3
200258f6:	8163      	strh	r3, [r4, #10]
200258f8:	b108      	cbz	r0, 200258fe <bbm_init_table+0xce>
200258fa:	2b00      	cmp	r3, #0
200258fc:	d1f1      	bne.n	200258e2 <bbm_init_table+0xb2>
200258fe:	f8db 3000 	ldr.w	r3, [fp]
20025902:	b11b      	cbz	r3, 2002590c <bbm_init_table+0xdc>
20025904:	4642      	mov	r2, r8
20025906:	4629      	mov	r1, r5
20025908:	4850      	ldr	r0, [pc, #320]	@ (20025a4c <bbm_init_table+0x21c>)
2002590a:	4798      	blx	r3
2002590c:	b946      	cbnz	r6, 20025920 <bbm_init_table+0xf0>
2002590e:	89a2      	ldrh	r2, [r4, #12]
20025910:	f108 0306 	add.w	r3, r8, #6
20025914:	f824 5023 	strh.w	r5, [r4, r3, lsl #2]
20025918:	3201      	adds	r2, #1
2002591a:	eb04 0383 	add.w	r3, r4, r3, lsl #2
2002591e:	805a      	strh	r2, [r3, #2]
20025920:	8923      	ldrh	r3, [r4, #8]
20025922:	f108 0801 	add.w	r8, r8, #1
20025926:	3301      	adds	r3, #1
20025928:	8123      	strh	r3, [r4, #8]
2002592a:	3501      	adds	r5, #1
2002592c:	e7aa      	b.n	20025884 <bbm_init_table+0x54>
2002592e:	2110      	movs	r1, #16
20025930:	483e      	ldr	r0, [pc, #248]	@ (20025a2c <bbm_init_table+0x1fc>)
20025932:	f7ff fd75 	bl	20025420 <bbm_crc_check>
20025936:	f8d9 1000 	ldr.w	r1, [r9]
2002593a:	6120      	str	r0, [r4, #16]
2002593c:	3904      	subs	r1, #4
2002593e:	0089      	lsls	r1, r1, #2
20025940:	4843      	ldr	r0, [pc, #268]	@ (20025a50 <bbm_init_table+0x220>)
20025942:	f7ff fd6d 	bl	20025420 <bbm_crc_check>
20025946:	f44f 7202 	mov.w	r2, #520	@ 0x208
2002594a:	4938      	ldr	r1, [pc, #224]	@ (20025a2c <bbm_init_table+0x1fc>)
2002594c:	6160      	str	r0, [r4, #20]
2002594e:	1888      	adds	r0, r1, r2
20025950:	f004 ff92 	bl	2002a878 <memcpy>
20025954:	f894 320f 	ldrb.w	r3, [r4, #527]	@ 0x20f
20025958:	2110      	movs	r1, #16
2002595a:	f043 0380 	orr.w	r3, r3, #128	@ 0x80
2002595e:	f884 320f 	strb.w	r3, [r4, #527]	@ 0x20f
20025962:	483c      	ldr	r0, [pc, #240]	@ (20025a54 <bbm_init_table+0x224>)
20025964:	f7ff fd5c 	bl	20025420 <bbm_crc_check>
20025968:	f8c4 0218 	str.w	r0, [r4, #536]	@ 0x218
2002596c:	2400      	movs	r4, #0
2002596e:	f8df 9100 	ldr.w	r9, [pc, #256]	@ 20025a70 <bbm_init_table+0x240>
20025972:	f8df 8100 	ldr.w	r8, [pc, #256]	@ 20025a74 <bbm_init_table+0x244>
20025976:	683b      	ldr	r3, [r7, #0]
20025978:	429e      	cmp	r6, r3
2002597a:	db08      	blt.n	2002598e <bbm_init_table+0x15e>
2002597c:	2c03      	cmp	r4, #3
2002597e:	dc30      	bgt.n	200259e2 <bbm_init_table+0x1b2>
20025980:	4b2d      	ldr	r3, [pc, #180]	@ (20025a38 <bbm_init_table+0x208>)
20025982:	681b      	ldr	r3, [r3, #0]
20025984:	b113      	cbz	r3, 2002598c <bbm_init_table+0x15c>
20025986:	4621      	mov	r1, r4
20025988:	4833      	ldr	r0, [pc, #204]	@ (20025a58 <bbm_init_table+0x228>)
2002598a:	4798      	blx	r3
2002598c:	e7fe      	b.n	2002598c <bbm_init_table+0x15c>
2002598e:	4630      	mov	r0, r6
20025990:	f7fb f95a 	bl	20020c48 <bbm_get_bb>
20025994:	4605      	mov	r5, r0
20025996:	bb10      	cbnz	r0, 200259de <bbm_init_table+0x1ae>
20025998:	f8d9 a000 	ldr.w	sl, [r9]
2002599c:	21ff      	movs	r1, #255	@ 0xff
2002599e:	4652      	mov	r2, sl
200259a0:	f8d8 0000 	ldr.w	r0, [r8]
200259a4:	f004 ff4e 	bl	2002a844 <memset>
200259a8:	e9cd 5501 	strd	r5, r5, [sp, #4]
200259ac:	f8cd a000 	str.w	sl, [sp]
200259b0:	f8d8 3000 	ldr.w	r3, [r8]
200259b4:	462a      	mov	r2, r5
200259b6:	4629      	mov	r1, r5
200259b8:	4630      	mov	r0, r6
200259ba:	f7fb f8e5 	bl	20020b88 <port_read_page>
200259be:	f8d9 3000 	ldr.w	r3, [r9]
200259c2:	4298      	cmp	r0, r3
200259c4:	d109      	bne.n	200259da <bbm_init_table+0x1aa>
200259c6:	f8d8 3000 	ldr.w	r3, [r8]
200259ca:	681b      	ldr	r3, [r3, #0]
200259cc:	3301      	adds	r3, #1
200259ce:	bf01      	itttt	eq
200259d0:	4b22      	ldreq	r3, [pc, #136]	@ (20025a5c <bbm_init_table+0x22c>)
200259d2:	1d22      	addeq	r2, r4, #4
200259d4:	f823 6012 	strheq.w	r6, [r3, r2, lsl #1]
200259d8:	3401      	addeq	r4, #1
200259da:	2c03      	cmp	r4, #3
200259dc:	dc01      	bgt.n	200259e2 <bbm_init_table+0x1b2>
200259de:	3601      	adds	r6, #1
200259e0:	e7c9      	b.n	20025976 <bbm_init_table+0x146>
200259e2:	2500      	movs	r5, #0
200259e4:	4c1d      	ldr	r4, [pc, #116]	@ (20025a5c <bbm_init_table+0x22c>)
200259e6:	2000      	movs	r0, #0
200259e8:	8921      	ldrh	r1, [r4, #8]
200259ea:	f7ff fee5 	bl	200257b8 <bbm_write_talbe.isra.0>
200259ee:	8923      	ldrh	r3, [r4, #8]
200259f0:	2001      	movs	r0, #1
200259f2:	8961      	ldrh	r1, [r4, #10]
200259f4:	8023      	strh	r3, [r4, #0]
200259f6:	8223      	strh	r3, [r4, #16]
200259f8:	8125      	strh	r5, [r4, #8]
200259fa:	f7ff fedd 	bl	200257b8 <bbm_write_talbe.isra.0>
200259fe:	8963      	ldrh	r3, [r4, #10]
20025a00:	8165      	strh	r5, [r4, #10]
20025a02:	80a3      	strh	r3, [r4, #4]
20025a04:	8263      	strh	r3, [r4, #18]
20025a06:	89a3      	ldrh	r3, [r4, #12]
20025a08:	8063      	strh	r3, [r4, #2]
20025a0a:	89e3      	ldrh	r3, [r4, #14]
20025a0c:	80e3      	strh	r3, [r4, #6]
20025a0e:	4b0a      	ldr	r3, [pc, #40]	@ (20025a38 <bbm_init_table+0x208>)
20025a10:	681b      	ldr	r3, [r3, #0]
20025a12:	b10b      	cbz	r3, 20025a18 <bbm_init_table+0x1e8>
20025a14:	4812      	ldr	r0, [pc, #72]	@ (20025a60 <bbm_init_table+0x230>)
20025a16:	4798      	blx	r3
20025a18:	2000      	movs	r0, #0
20025a1a:	b005      	add	sp, #20
20025a1c:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
20025a20:	4b05      	ldr	r3, [pc, #20]	@ (20025a38 <bbm_init_table+0x208>)
20025a22:	681b      	ldr	r3, [r3, #0]
20025a24:	b10b      	cbz	r3, 20025a2a <bbm_init_table+0x1fa>
20025a26:	480f      	ldr	r0, [pc, #60]	@ (20025a64 <bbm_init_table+0x234>)
20025a28:	4798      	blx	r3
20025a2a:	e7fe      	b.n	20025a2a <bbm_init_table+0x1fa>
20025a2c:	2004cbf4 	.word	0x2004cbf4
20025a30:	5366424d 	.word	0x5366424d
20025a34:	2004cbe8 	.word	0x2004cbe8
20025a38:	2004cbdc 	.word	0x2004cbdc
20025a3c:	2002acee 	.word	0x2002acee
20025a40:	2002ac7c 	.word	0x2002ac7c
20025a44:	2002ac9e 	.word	0x2002ac9e
20025a48:	2002acbb 	.word	0x2002acbb
20025a4c:	2002acda 	.word	0x2002acda
20025a50:	2004cc0c 	.word	0x2004cc0c
20025a54:	2004cdfc 	.word	0x2004cdfc
20025a58:	2002ad08 	.word	0x2002ad08
20025a5c:	2004d004 	.word	0x2004d004
20025a60:	2002ad2f 	.word	0x2002ad2f
20025a64:	2002ad4b 	.word	0x2002ad4b
20025a68:	2004cbec 	.word	0x2004cbec
20025a6c:	2004cbf0 	.word	0x2004cbf0
20025a70:	2004494c 	.word	0x2004494c
20025a74:	2004cbe0 	.word	0x2004cbe0

20025a78 <sif_bbm_init>:
20025a78:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20025a7c:	b087      	sub	sp, #28
20025a7e:	2900      	cmp	r1, #0
20025a80:	f000 8129 	beq.w	20025cd6 <sif_bbm_init+0x25e>
20025a84:	4b95      	ldr	r3, [pc, #596]	@ (20025cdc <sif_bbm_init+0x264>)
20025a86:	681a      	ldr	r2, [r3, #0]
20025a88:	2a01      	cmp	r2, #1
20025a8a:	d108      	bne.n	20025a9e <sif_bbm_init+0x26>
20025a8c:	4b94      	ldr	r3, [pc, #592]	@ (20025ce0 <sif_bbm_init+0x268>)
20025a8e:	681b      	ldr	r3, [r3, #0]
20025a90:	b10b      	cbz	r3, 20025a96 <sif_bbm_init+0x1e>
20025a92:	4894      	ldr	r0, [pc, #592]	@ (20025ce4 <sif_bbm_init+0x26c>)
20025a94:	4798      	blx	r3
20025a96:	2000      	movs	r0, #0
20025a98:	b007      	add	sp, #28
20025a9a:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
20025a9e:	2201      	movs	r2, #1
20025aa0:	601a      	str	r2, [r3, #0]
20025aa2:	4b91      	ldr	r3, [pc, #580]	@ (20025ce8 <sif_bbm_init+0x270>)
20025aa4:	681c      	ldr	r4, [r3, #0]
20025aa6:	b904      	cbnz	r4, 20025aaa <sif_bbm_init+0x32>
20025aa8:	e7fe      	b.n	20025aa8 <sif_bbm_init+0x30>
20025aaa:	f8df a27c 	ldr.w	sl, [pc, #636]	@ 20025d28 <sif_bbm_init+0x2b0>
20025aae:	f8da 2000 	ldr.w	r2, [sl]
20025ab2:	b902      	cbnz	r2, 20025ab6 <sif_bbm_init+0x3e>
20025ab4:	e7fe      	b.n	20025ab4 <sif_bbm_init+0x3c>
20025ab6:	fbb0 f4f4 	udiv	r4, r0, r4
20025aba:	f04f 0800 	mov.w	r8, #0
20025abe:	4a8b      	ldr	r2, [pc, #556]	@ (20025cec <sif_bbm_init+0x274>)
20025ac0:	f8df b268 	ldr.w	fp, [pc, #616]	@ 20025d2c <sif_bbm_init+0x2b4>
20025ac4:	0963      	lsrs	r3, r4, #5
20025ac6:	f8df 9268 	ldr.w	r9, [pc, #616]	@ 20025d30 <sif_bbm_init+0x2b8>
20025aca:	6013      	str	r3, [r2, #0]
20025acc:	f8cb 4000 	str.w	r4, [fp]
20025ad0:	1ae4      	subs	r4, r4, r3
20025ad2:	4b87      	ldr	r3, [pc, #540]	@ (20025cf0 <sif_bbm_init+0x278>)
20025ad4:	2218      	movs	r2, #24
20025ad6:	f8c9 1000 	str.w	r1, [r9]
20025ada:	4886      	ldr	r0, [pc, #536]	@ (20025cf4 <sif_bbm_init+0x27c>)
20025adc:	2100      	movs	r1, #0
20025ade:	601c      	str	r4, [r3, #0]
20025ae0:	f004 feb0 	bl	2002a844 <memset>
20025ae4:	f44f 6282 	mov.w	r2, #1040	@ 0x410
20025ae8:	2100      	movs	r1, #0
20025aea:	4883      	ldr	r0, [pc, #524]	@ (20025cf8 <sif_bbm_init+0x280>)
20025aec:	f004 feaa 	bl	2002a844 <memset>
20025af0:	4647      	mov	r7, r8
20025af2:	4646      	mov	r6, r8
20025af4:	f8db 3000 	ldr.w	r3, [fp]
20025af8:	429c      	cmp	r4, r3
20025afa:	db02      	blt.n	20025b02 <sif_bbm_init+0x8a>
20025afc:	f04f 35ff 	mov.w	r5, #4294967295	@ 0xffffffff
20025b00:	e064      	b.n	20025bcc <sif_bbm_init+0x154>
20025b02:	4620      	mov	r0, r4
20025b04:	f7fb f8a0 	bl	20020c48 <bbm_get_bb>
20025b08:	4605      	mov	r5, r0
20025b0a:	b138      	cbz	r0, 20025b1c <sif_bbm_init+0xa4>
20025b0c:	4b74      	ldr	r3, [pc, #464]	@ (20025ce0 <sif_bbm_init+0x268>)
20025b0e:	681b      	ldr	r3, [r3, #0]
20025b10:	b113      	cbz	r3, 20025b18 <sif_bbm_init+0xa0>
20025b12:	487a      	ldr	r0, [pc, #488]	@ (20025cfc <sif_bbm_init+0x284>)
20025b14:	1c61      	adds	r1, r4, #1
20025b16:	4798      	blx	r3
20025b18:	3401      	adds	r4, #1
20025b1a:	e7eb      	b.n	20025af4 <sif_bbm_init+0x7c>
20025b1c:	f8da 2000 	ldr.w	r2, [sl]
20025b20:	21ff      	movs	r1, #255	@ 0xff
20025b22:	f8d9 0000 	ldr.w	r0, [r9]
20025b26:	9205      	str	r2, [sp, #20]
20025b28:	f004 fe8c 	bl	2002a844 <memset>
20025b2c:	9a05      	ldr	r2, [sp, #20]
20025b2e:	e9cd 5501 	strd	r5, r5, [sp, #4]
20025b32:	9200      	str	r2, [sp, #0]
20025b34:	f8d9 3000 	ldr.w	r3, [r9]
20025b38:	462a      	mov	r2, r5
20025b3a:	4629      	mov	r1, r5
20025b3c:	4620      	mov	r0, r4
20025b3e:	f7fb f823 	bl	20020b88 <port_read_page>
20025b42:	f8da 3000 	ldr.w	r3, [sl]
20025b46:	4298      	cmp	r0, r3
20025b48:	d12e      	bne.n	20025ba8 <sif_bbm_init+0x130>
20025b4a:	f8d9 1000 	ldr.w	r1, [r9]
20025b4e:	486c      	ldr	r0, [pc, #432]	@ (20025d00 <sif_bbm_init+0x288>)
20025b50:	680b      	ldr	r3, [r1, #0]
20025b52:	b2a2      	uxth	r2, r4
20025b54:	4283      	cmp	r3, r0
20025b56:	4b67      	ldr	r3, [pc, #412]	@ (20025cf4 <sif_bbm_init+0x27c>)
20025b58:	d11f      	bne.n	20025b9a <sif_bbm_init+0x122>
20025b5a:	f991 1007 	ldrsb.w	r1, [r1, #7]
20025b5e:	2900      	cmp	r1, #0
20025b60:	bfb5      	itete	lt
20025b62:	eb03 0147 	addlt.w	r1, r3, r7, lsl #1
20025b66:	f823 2016 	strhge.w	r2, [r3, r6, lsl #1]
20025b6a:	808a      	strhlt	r2, [r1, #4]
20025b6c:	3601      	addge	r6, #1
20025b6e:	bfb8      	it	lt
20025b70:	3701      	addlt	r7, #1
20025b72:	eb06 0208 	add.w	r2, r6, r8
20025b76:	443a      	add	r2, r7
20025b78:	2a03      	cmp	r2, #3
20025b7a:	ddcd      	ble.n	20025b18 <sif_bbm_init+0xa0>
20025b7c:	2e00      	cmp	r6, #0
20025b7e:	f000 8081 	beq.w	20025c84 <sif_bbm_init+0x20c>
20025b82:	2f00      	cmp	r7, #0
20025b84:	d07e      	beq.n	20025c84 <sif_bbm_init+0x20c>
20025b86:	2e01      	cmp	r6, #1
20025b88:	d001      	beq.n	20025b8e <sif_bbm_init+0x116>
20025b8a:	2f01      	cmp	r7, #1
20025b8c:	d11e      	bne.n	20025bcc <sif_bbm_init+0x154>
20025b8e:	8819      	ldrh	r1, [r3, #0]
20025b90:	891a      	ldrh	r2, [r3, #8]
20025b92:	b981      	cbnz	r1, 20025bb6 <sif_bbm_init+0x13e>
20025b94:	801a      	strh	r2, [r3, #0]
20025b96:	895a      	ldrh	r2, [r3, #10]
20025b98:	e013      	b.n	20025bc2 <sif_bbm_init+0x14a>
20025b9a:	f108 0104 	add.w	r1, r8, #4
20025b9e:	f823 2011 	strh.w	r2, [r3, r1, lsl #1]
20025ba2:	f108 0801 	add.w	r8, r8, #1
20025ba6:	e7e4      	b.n	20025b72 <sif_bbm_init+0xfa>
20025ba8:	4b4d      	ldr	r3, [pc, #308]	@ (20025ce0 <sif_bbm_init+0x268>)
20025baa:	681b      	ldr	r3, [r3, #0]
20025bac:	2b00      	cmp	r3, #0
20025bae:	d0b3      	beq.n	20025b18 <sif_bbm_init+0xa0>
20025bb0:	4854      	ldr	r0, [pc, #336]	@ (20025d04 <sif_bbm_init+0x28c>)
20025bb2:	1c61      	adds	r1, r4, #1
20025bb4:	e7af      	b.n	20025b16 <sif_bbm_init+0x9e>
20025bb6:	8859      	ldrh	r1, [r3, #2]
20025bb8:	b909      	cbnz	r1, 20025bbe <sif_bbm_init+0x146>
20025bba:	805a      	strh	r2, [r3, #2]
20025bbc:	e7eb      	b.n	20025b96 <sif_bbm_init+0x11e>
20025bbe:	2a00      	cmp	r2, #0
20025bc0:	d0e9      	beq.n	20025b96 <sif_bbm_init+0x11e>
20025bc2:	8899      	ldrh	r1, [r3, #4]
20025bc4:	2900      	cmp	r1, #0
20025bc6:	d158      	bne.n	20025c7a <sif_bbm_init+0x202>
20025bc8:	809a      	strh	r2, [r3, #4]
20025bca:	2502      	movs	r5, #2
20025bcc:	f8df 9110 	ldr.w	r9, [pc, #272]	@ 20025ce0 <sif_bbm_init+0x268>
20025bd0:	f8d9 4000 	ldr.w	r4, [r9]
20025bd4:	b124      	cbz	r4, 20025be0 <sif_bbm_init+0x168>
20025bd6:	4643      	mov	r3, r8
20025bd8:	463a      	mov	r2, r7
20025bda:	4631      	mov	r1, r6
20025bdc:	484a      	ldr	r0, [pc, #296]	@ (20025d08 <sif_bbm_init+0x290>)
20025bde:	47a0      	blx	r4
20025be0:	f8d9 3000 	ldr.w	r3, [r9]
20025be4:	b113      	cbz	r3, 20025bec <sif_bbm_init+0x174>
20025be6:	4629      	mov	r1, r5
20025be8:	4848      	ldr	r0, [pc, #288]	@ (20025d0c <sif_bbm_init+0x294>)
20025bea:	4798      	blx	r3
20025bec:	f035 0002 	bics.w	r0, r5, #2
20025bf0:	d164      	bne.n	20025cbc <sif_bbm_init+0x244>
20025bf2:	f7ff fcc9 	bl	20025588 <bbm_get_map_table>
20025bf6:	4605      	mov	r5, r0
20025bf8:	2001      	movs	r0, #1
20025bfa:	f7ff fcc5 	bl	20025588 <bbm_get_map_table>
20025bfe:	f8d9 6000 	ldr.w	r6, [r9]
20025c02:	4604      	mov	r4, r0
20025c04:	b13e      	cbz	r6, 20025c16 <sif_bbm_init+0x19e>
20025c06:	4a3b      	ldr	r2, [pc, #236]	@ (20025cf4 <sif_bbm_init+0x27c>)
20025c08:	4629      	mov	r1, r5
20025c0a:	8a53      	ldrh	r3, [r2, #18]
20025c0c:	9300      	str	r3, [sp, #0]
20025c0e:	8a12      	ldrh	r2, [r2, #16]
20025c10:	4603      	mov	r3, r0
20025c12:	483f      	ldr	r0, [pc, #252]	@ (20025d10 <sif_bbm_init+0x298>)
20025c14:	47b0      	blx	r6
20025c16:	42a5      	cmp	r5, r4
20025c18:	4c37      	ldr	r4, [pc, #220]	@ (20025cf8 <sif_bbm_init+0x280>)
20025c1a:	dd35      	ble.n	20025c88 <sif_bbm_init+0x210>
20025c1c:	f44f 7202 	mov.w	r2, #520	@ 0x208
20025c20:	4621      	mov	r1, r4
20025c22:	18a0      	adds	r0, r4, r2
20025c24:	f004 fe28 	bl	2002a878 <memcpy>
20025c28:	f894 320f 	ldrb.w	r3, [r4, #527]	@ 0x20f
20025c2c:	2110      	movs	r1, #16
20025c2e:	f043 0380 	orr.w	r3, r3, #128	@ 0x80
20025c32:	f884 320f 	strb.w	r3, [r4, #527]	@ 0x20f
20025c36:	f504 7002 	add.w	r0, r4, #520	@ 0x208
20025c3a:	f7ff fbf1 	bl	20025420 <bbm_crc_check>
20025c3e:	f8c4 0218 	str.w	r0, [r4, #536]	@ 0x218
20025c42:	2001      	movs	r0, #1
20025c44:	4b2b      	ldr	r3, [pc, #172]	@ (20025cf4 <sif_bbm_init+0x27c>)
20025c46:	8a59      	ldrh	r1, [r3, #18]
20025c48:	f7ff fdb6 	bl	200257b8 <bbm_write_talbe.isra.0>
20025c4c:	6822      	ldr	r2, [r4, #0]
20025c4e:	4b2c      	ldr	r3, [pc, #176]	@ (20025d00 <sif_bbm_init+0x288>)
20025c50:	429a      	cmp	r2, r3
20025c52:	d12d      	bne.n	20025cb0 <sif_bbm_init+0x238>
20025c54:	4828      	ldr	r0, [pc, #160]	@ (20025cf8 <sif_bbm_init+0x280>)
20025c56:	f7ff fb93 	bl	20025380 <bbm_map_check.part.0>
20025c5a:	f8d9 4000 	ldr.w	r4, [r9]
20025c5e:	b12c      	cbz	r4, 20025c6c <sif_bbm_init+0x1f4>
20025c60:	4b2c      	ldr	r3, [pc, #176]	@ (20025d14 <sif_bbm_init+0x29c>)
20025c62:	4924      	ldr	r1, [pc, #144]	@ (20025cf4 <sif_bbm_init+0x27c>)
20025c64:	482c      	ldr	r0, [pc, #176]	@ (20025d18 <sif_bbm_init+0x2a0>)
20025c66:	f5a3 7202 	sub.w	r2, r3, #520	@ 0x208
20025c6a:	47a0      	blx	r4
20025c6c:	f8d9 3000 	ldr.w	r3, [r9]
20025c70:	2b00      	cmp	r3, #0
20025c72:	f43f af10 	beq.w	20025a96 <sif_bbm_init+0x1e>
20025c76:	4829      	ldr	r0, [pc, #164]	@ (20025d1c <sif_bbm_init+0x2a4>)
20025c78:	e70c      	b.n	20025a94 <sif_bbm_init+0x1c>
20025c7a:	88d9      	ldrh	r1, [r3, #6]
20025c7c:	2900      	cmp	r1, #0
20025c7e:	d1a4      	bne.n	20025bca <sif_bbm_init+0x152>
20025c80:	80da      	strh	r2, [r3, #6]
20025c82:	e7a2      	b.n	20025bca <sif_bbm_init+0x152>
20025c84:	2501      	movs	r5, #1
20025c86:	e7a1      	b.n	20025bcc <sif_bbm_init+0x154>
20025c88:	dae0      	bge.n	20025c4c <sif_bbm_init+0x1d4>
20025c8a:	f44f 7202 	mov.w	r2, #520	@ 0x208
20025c8e:	4620      	mov	r0, r4
20025c90:	18a1      	adds	r1, r4, r2
20025c92:	f004 fdf1 	bl	2002a878 <memcpy>
20025c96:	79e3      	ldrb	r3, [r4, #7]
20025c98:	2110      	movs	r1, #16
20025c9a:	f023 0380 	bic.w	r3, r3, #128	@ 0x80
20025c9e:	71e3      	strb	r3, [r4, #7]
20025ca0:	4620      	mov	r0, r4
20025ca2:	f7ff fbbd 	bl	20025420 <bbm_crc_check>
20025ca6:	4b13      	ldr	r3, [pc, #76]	@ (20025cf4 <sif_bbm_init+0x27c>)
20025ca8:	6120      	str	r0, [r4, #16]
20025caa:	8a19      	ldrh	r1, [r3, #16]
20025cac:	2000      	movs	r0, #0
20025cae:	e7cb      	b.n	20025c48 <sif_bbm_init+0x1d0>
20025cb0:	f8d9 3000 	ldr.w	r3, [r9]
20025cb4:	b10b      	cbz	r3, 20025cba <sif_bbm_init+0x242>
20025cb6:	481a      	ldr	r0, [pc, #104]	@ (20025d20 <sif_bbm_init+0x2a8>)
20025cb8:	4798      	blx	r3
20025cba:	e7fe      	b.n	20025cba <sif_bbm_init+0x242>
20025cbc:	2d01      	cmp	r5, #1
20025cbe:	d102      	bne.n	20025cc6 <sif_bbm_init+0x24e>
20025cc0:	f7ff fdb6 	bl	20025830 <bbm_init_table>
20025cc4:	e7c9      	b.n	20025c5a <sif_bbm_init+0x1e2>
20025cc6:	f8d9 3000 	ldr.w	r3, [r9]
20025cca:	b11b      	cbz	r3, 20025cd4 <sif_bbm_init+0x25c>
20025ccc:	f04f 31ff 	mov.w	r1, #4294967295	@ 0xffffffff
20025cd0:	4814      	ldr	r0, [pc, #80]	@ (20025d24 <sif_bbm_init+0x2ac>)
20025cd2:	4798      	blx	r3
20025cd4:	e7fe      	b.n	20025cd4 <sif_bbm_init+0x25c>
20025cd6:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
20025cda:	e6dd      	b.n	20025a98 <sif_bbm_init+0x20>
20025cdc:	2004cbe4 	.word	0x2004cbe4
20025ce0:	2004cbdc 	.word	0x2004cbdc
20025ce4:	2002ad5f 	.word	0x2002ad5f
20025ce8:	20044950 	.word	0x20044950
20025cec:	2004cbec 	.word	0x2004cbec
20025cf0:	2004cbf0 	.word	0x2004cbf0
20025cf4:	2004d004 	.word	0x2004d004
20025cf8:	2004cbf4 	.word	0x2004cbf4
20025cfc:	2002ad8d 	.word	0x2002ad8d
20025d00:	5366424d 	.word	0x5366424d
20025d04:	2002ad99 	.word	0x2002ad99
20025d08:	2002adb8 	.word	0x2002adb8
20025d0c:	2002add7 	.word	0x2002add7
20025d10:	2002ade9 	.word	0x2002ade9
20025d14:	2004cdfc 	.word	0x2004cdfc
20025d18:	2002ae44 	.word	0x2002ae44
20025d1c:	2002ae68 	.word	0x2002ae68
20025d20:	2002ae0d 	.word	0x2002ae0d
20025d24:	2002ae23 	.word	0x2002ae23
20025d28:	2004494c 	.word	0x2004494c
20025d2c:	2004cbe8 	.word	0x2004cbe8
20025d30:	2004cbe0 	.word	0x2004cbe0

20025d34 <bbm_set_page_size>:
20025d34:	4b01      	ldr	r3, [pc, #4]	@ (20025d3c <bbm_set_page_size+0x8>)
20025d36:	6018      	str	r0, [r3, #0]
20025d38:	4770      	bx	lr
20025d3a:	bf00      	nop
20025d3c:	2004494c 	.word	0x2004494c

20025d40 <bbm_set_blk_size>:
20025d40:	4b01      	ldr	r3, [pc, #4]	@ (20025d48 <bbm_set_blk_size+0x8>)
20025d42:	6018      	str	r0, [r3, #0]
20025d44:	4770      	bx	lr
20025d46:	bf00      	nop
20025d48:	20044950 	.word	0x20044950

20025d4c <boot_images>:
20025d4c:	4770      	bx	lr

20025d4e <SystemPowerOnModeInit>:
20025d4e:	4770      	bx	lr

20025d50 <SystemInit>:
20025d50:	b508      	push	{r3, lr}
20025d52:	4a10      	ldr	r2, [pc, #64]	@ (20025d94 <SystemInit+0x44>)
20025d54:	4b10      	ldr	r3, [pc, #64]	@ (20025d98 <SystemInit+0x48>)
20025d56:	609a      	str	r2, [r3, #8]
20025d58:	f8d3 2088 	ldr.w	r2, [r3, #136]	@ 0x88
20025d5c:	f042 023f 	orr.w	r2, r2, #63	@ 0x3f
20025d60:	f8c3 2088 	str.w	r2, [r3, #136]	@ 0x88
20025d64:	f8d3 2088 	ldr.w	r2, [r3, #136]	@ 0x88
20025d68:	f442 0270 	orr.w	r2, r2, #15728640	@ 0xf00000
20025d6c:	f8c3 2088 	str.w	r2, [r3, #136]	@ 0x88
20025d70:	f7fb fbe6 	bl	20021540 <hw_preinit0>
20025d74:	f7fa faca 	bl	2002030c <mpu_config>
20025d78:	4b08      	ldr	r3, [pc, #32]	@ (20025d9c <SystemInit+0x4c>)
20025d7a:	681b      	ldr	r3, [r3, #0]
20025d7c:	07db      	lsls	r3, r3, #31
20025d7e:	d401      	bmi.n	20025d84 <SystemInit+0x34>
20025d80:	f7ff ffe4 	bl	20025d4c <boot_images>
20025d84:	f7fa fac3 	bl	2002030e <cache_enable>
20025d88:	f7ff ffe1 	bl	20025d4e <SystemPowerOnModeInit>
20025d8c:	4b04      	ldr	r3, [pc, #16]	@ (20025da0 <SystemInit+0x50>)
20025d8e:	4a05      	ldr	r2, [pc, #20]	@ (20025da4 <SystemInit+0x54>)
20025d90:	601a      	str	r2, [r3, #0]
20025d92:	bd08      	pop	{r3, pc}
20025d94:	20020000 	.word	0x20020000
20025d98:	e000ed00 	.word	0xe000ed00
20025d9c:	5000b000 	.word	0x5000b000
20025da0:	20044954 	.word	0x20044954
20025da4:	017d7840 	.word	0x017d7840

20025da8 <Reset_Handler>:
20025da8:	f8df d048 	ldr.w	sp, [pc, #72]	@ 20025df4 <AES_IRQHandler+0x2>
20025dac:	4812      	ldr	r0, [pc, #72]	@ (20025df8 <AES_IRQHandler+0x6>)
20025dae:	f380 880a 	msr	MSPLIM, r0
20025db2:	f7ff ffcd 	bl	20025d50 <SystemInit>
20025db6:	4c11      	ldr	r4, [pc, #68]	@ (20025dfc <AES_IRQHandler+0xa>)
20025db8:	4d11      	ldr	r5, [pc, #68]	@ (20025e00 <AES_IRQHandler+0xe>)
20025dba:	42ac      	cmp	r4, r5
20025dbc:	da09      	bge.n	20025dd2 <Reset_Handler+0x2a>
20025dbe:	6821      	ldr	r1, [r4, #0]
20025dc0:	6862      	ldr	r2, [r4, #4]
20025dc2:	68a3      	ldr	r3, [r4, #8]
20025dc4:	3b04      	subs	r3, #4
20025dc6:	bfa2      	ittt	ge
20025dc8:	58c8      	ldrge	r0, [r1, r3]
20025dca:	50d0      	strge	r0, [r2, r3]
20025dcc:	e7fa      	bge.n	20025dc4 <Reset_Handler+0x1c>
20025dce:	340c      	adds	r4, #12
20025dd0:	e7f3      	b.n	20025dba <Reset_Handler+0x12>
20025dd2:	4b0c      	ldr	r3, [pc, #48]	@ (20025e04 <AES_IRQHandler+0x12>)
20025dd4:	4c0c      	ldr	r4, [pc, #48]	@ (20025e08 <AES_IRQHandler+0x16>)
20025dd6:	42a3      	cmp	r3, r4
20025dd8:	da08      	bge.n	20025dec <Reset_Handler+0x44>
20025dda:	6819      	ldr	r1, [r3, #0]
20025ddc:	685a      	ldr	r2, [r3, #4]
20025dde:	2000      	movs	r0, #0
20025de0:	3a04      	subs	r2, #4
20025de2:	bfa4      	itt	ge
20025de4:	5088      	strge	r0, [r1, r2]
20025de6:	e7fb      	bge.n	20025de0 <Reset_Handler+0x38>
20025de8:	3308      	adds	r3, #8
20025dea:	e7f4      	b.n	20025dd6 <Reset_Handler+0x2e>
20025dec:	f7fb fbce 	bl	2002158c <entry>

20025df0 <HardFault_Handler>:
20025df0:	e7fe      	b.n	20025df0 <HardFault_Handler>

20025df2 <AES_IRQHandler>:
20025df2:	e7fe      	b.n	20025df2 <AES_IRQHandler>
20025df4:	20042000 	.word	0x20042000
20025df8:	20040000 	.word	0x20040000
20025dfc:	2002c42c 	.word	0x2002c42c
20025e00:	2002c438 	.word	0x2002c438
20025e04:	2002c438 	.word	0x2002c438
20025e08:	2002c440 	.word	0x2002c440

20025e0c <mbedtls_md_info_from_type>:
20025e0c:	3805      	subs	r0, #5
20025e0e:	b2c0      	uxtb	r0, r0
20025e10:	2803      	cmp	r0, #3
20025e12:	bf9a      	itte	ls
20025e14:	4b02      	ldrls	r3, [pc, #8]	@ (20025e20 <mbedtls_md_info_from_type+0x14>)
20025e16:	f853 0020 	ldrls.w	r0, [r3, r0, lsl #2]
20025e1a:	2000      	movhi	r0, #0
20025e1c:	4770      	bx	lr
20025e1e:	bf00      	nop
20025e20:	2002bcbc 	.word	0x2002bcbc

20025e24 <mbedtls_md_get_size>:
20025e24:	b100      	cbz	r0, 20025e28 <mbedtls_md_get_size+0x4>
20025e26:	7a00      	ldrb	r0, [r0, #8]
20025e28:	4770      	bx	lr

20025e2a <sha224_process_wrap>:
20025e2a:	f000 b8a9 	b.w	20025f80 <mbedtls_sha256_process>

20025e2e <sha224_clone_wrap>:
20025e2e:	f000 b85a 	b.w	20025ee6 <mbedtls_sha256_clone>

20025e32 <sha224_ctx_free>:
20025e32:	b510      	push	{r4, lr}
20025e34:	4604      	mov	r4, r0
20025e36:	f000 f84c 	bl	20025ed2 <mbedtls_sha256_free>
20025e3a:	4620      	mov	r0, r4
20025e3c:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
20025e40:	f004 bc3a 	b.w	2002a6b8 <free>

20025e44 <sha224_ctx_alloc>:
20025e44:	b510      	push	{r4, lr}
20025e46:	216c      	movs	r1, #108	@ 0x6c
20025e48:	2001      	movs	r0, #1
20025e4a:	f004 fc19 	bl	2002a680 <calloc>
20025e4e:	4604      	mov	r4, r0
20025e50:	b108      	cbz	r0, 20025e56 <sha224_ctx_alloc+0x12>
20025e52:	f000 f83a 	bl	20025eca <mbedtls_sha256_init>
20025e56:	4620      	mov	r0, r4
20025e58:	bd10      	pop	{r4, pc}

20025e5a <sha224_wrap>:
20025e5a:	2301      	movs	r3, #1
20025e5c:	f000 bc94 	b.w	20026788 <mbedtls_sha256>

20025e60 <sha256_wrap>:
20025e60:	2300      	movs	r3, #0
20025e62:	f000 bc91 	b.w	20026788 <mbedtls_sha256>

20025e66 <sha224_finish_wrap>:
20025e66:	f000 bc21 	b.w	200266ac <mbedtls_sha256_finish>

20025e6a <sha224_update_wrap>:
20025e6a:	f000 bc1b 	b.w	200266a4 <mbedtls_sha256_update>

20025e6e <sha224_starts_wrap>:
20025e6e:	2101      	movs	r1, #1
20025e70:	f000 b83e 	b.w	20025ef0 <mbedtls_sha256_starts>

20025e74 <sha256_starts_wrap>:
20025e74:	2100      	movs	r1, #0
20025e76:	f000 b83b 	b.w	20025ef0 <mbedtls_sha256_starts>

20025e7a <sha384_process_wrap>:
20025e7a:	f000 bd8d 	b.w	20026998 <mbedtls_sha512_process>

20025e7e <sha384_clone_wrap>:
20025e7e:	f000 bcf5 	b.w	2002686c <mbedtls_sha512_clone>

20025e82 <sha384_ctx_free>:
20025e82:	b510      	push	{r4, lr}
20025e84:	4604      	mov	r4, r0
20025e86:	f000 fce7 	bl	20026858 <mbedtls_sha512_free>
20025e8a:	4620      	mov	r0, r4
20025e8c:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
20025e90:	f004 bc12 	b.w	2002a6b8 <free>

20025e94 <sha384_ctx_alloc>:
20025e94:	b510      	push	{r4, lr}
20025e96:	21d8      	movs	r1, #216	@ 0xd8
20025e98:	2001      	movs	r0, #1
20025e9a:	f004 fbf1 	bl	2002a680 <calloc>
20025e9e:	4604      	mov	r4, r0
20025ea0:	b108      	cbz	r0, 20025ea6 <sha384_ctx_alloc+0x12>
20025ea2:	f000 fcd5 	bl	20026850 <mbedtls_sha512_init>
20025ea6:	4620      	mov	r0, r4
20025ea8:	bd10      	pop	{r4, pc}

20025eaa <sha384_wrap>:
20025eaa:	2301      	movs	r3, #1
20025eac:	f001 bbf8 	b.w	200276a0 <mbedtls_sha512>

20025eb0 <sha512_wrap>:
20025eb0:	2300      	movs	r3, #0
20025eb2:	f001 bbf5 	b.w	200276a0 <mbedtls_sha512>

20025eb6 <sha384_finish_wrap>:
20025eb6:	f001 baed 	b.w	20027494 <mbedtls_sha512_finish>

20025eba <sha384_update_wrap>:
20025eba:	f001 bae6 	b.w	2002748a <mbedtls_sha512_update>

20025ebe <sha384_starts_wrap>:
20025ebe:	2101      	movs	r1, #1
20025ec0:	f000 bcda 	b.w	20026878 <mbedtls_sha512_starts>

20025ec4 <sha512_starts_wrap>:
20025ec4:	2100      	movs	r1, #0
20025ec6:	f000 bcd7 	b.w	20026878 <mbedtls_sha512_starts>

20025eca <mbedtls_sha256_init>:
20025eca:	226c      	movs	r2, #108	@ 0x6c
20025ecc:	2100      	movs	r1, #0
20025ece:	f004 bcb9 	b.w	2002a844 <memset>

20025ed2 <mbedtls_sha256_free>:
20025ed2:	b138      	cbz	r0, 20025ee4 <mbedtls_sha256_free+0x12>
20025ed4:	2100      	movs	r1, #0
20025ed6:	f100 036c 	add.w	r3, r0, #108	@ 0x6c
20025eda:	4602      	mov	r2, r0
20025edc:	3001      	adds	r0, #1
20025ede:	4298      	cmp	r0, r3
20025ee0:	7011      	strb	r1, [r2, #0]
20025ee2:	d1fa      	bne.n	20025eda <mbedtls_sha256_free+0x8>
20025ee4:	4770      	bx	lr

20025ee6 <mbedtls_sha256_clone>:
20025ee6:	b508      	push	{r3, lr}
20025ee8:	226c      	movs	r2, #108	@ 0x6c
20025eea:	f004 fcc5 	bl	2002a878 <memcpy>
20025eee:	bd08      	pop	{r3, pc}

20025ef0 <mbedtls_sha256_starts>:
20025ef0:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
20025ef4:	b1c1      	cbz	r1, 20025f28 <mbedtls_sha256_starts+0x38>
20025ef6:	f8df e078 	ldr.w	lr, [pc, #120]	@ 20025f70 <mbedtls_sha256_starts+0x80>
20025efa:	f8df c078 	ldr.w	ip, [pc, #120]	@ 20025f74 <mbedtls_sha256_starts+0x84>
20025efe:	4f10      	ldr	r7, [pc, #64]	@ (20025f40 <mbedtls_sha256_starts+0x50>)
20025f00:	4e10      	ldr	r6, [pc, #64]	@ (20025f44 <mbedtls_sha256_starts+0x54>)
20025f02:	4d11      	ldr	r5, [pc, #68]	@ (20025f48 <mbedtls_sha256_starts+0x58>)
20025f04:	4c11      	ldr	r4, [pc, #68]	@ (20025f4c <mbedtls_sha256_starts+0x5c>)
20025f06:	4a12      	ldr	r2, [pc, #72]	@ (20025f50 <mbedtls_sha256_starts+0x60>)
20025f08:	4b12      	ldr	r3, [pc, #72]	@ (20025f54 <mbedtls_sha256_starts+0x64>)
20025f0a:	f04f 0800 	mov.w	r8, #0
20025f0e:	e9c0 ec02 	strd	lr, ip, [r0, #8]
20025f12:	e9c0 8800 	strd	r8, r8, [r0]
20025f16:	e9c0 7604 	strd	r7, r6, [r0, #16]
20025f1a:	e9c0 5406 	strd	r5, r4, [r0, #24]
20025f1e:	e9c0 2308 	strd	r2, r3, [r0, #32]
20025f22:	6681      	str	r1, [r0, #104]	@ 0x68
20025f24:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
20025f28:	f8df e04c 	ldr.w	lr, [pc, #76]	@ 20025f78 <mbedtls_sha256_starts+0x88>
20025f2c:	f8df c04c 	ldr.w	ip, [pc, #76]	@ 20025f7c <mbedtls_sha256_starts+0x8c>
20025f30:	4f09      	ldr	r7, [pc, #36]	@ (20025f58 <mbedtls_sha256_starts+0x68>)
20025f32:	4e0a      	ldr	r6, [pc, #40]	@ (20025f5c <mbedtls_sha256_starts+0x6c>)
20025f34:	4d0a      	ldr	r5, [pc, #40]	@ (20025f60 <mbedtls_sha256_starts+0x70>)
20025f36:	4c0b      	ldr	r4, [pc, #44]	@ (20025f64 <mbedtls_sha256_starts+0x74>)
20025f38:	4a0b      	ldr	r2, [pc, #44]	@ (20025f68 <mbedtls_sha256_starts+0x78>)
20025f3a:	4b0c      	ldr	r3, [pc, #48]	@ (20025f6c <mbedtls_sha256_starts+0x7c>)
20025f3c:	e7e5      	b.n	20025f0a <mbedtls_sha256_starts+0x1a>
20025f3e:	bf00      	nop
20025f40:	3070dd17 	.word	0x3070dd17
20025f44:	f70e5939 	.word	0xf70e5939
20025f48:	ffc00b31 	.word	0xffc00b31
20025f4c:	68581511 	.word	0x68581511
20025f50:	64f98fa7 	.word	0x64f98fa7
20025f54:	befa4fa4 	.word	0xbefa4fa4
20025f58:	3c6ef372 	.word	0x3c6ef372
20025f5c:	a54ff53a 	.word	0xa54ff53a
20025f60:	510e527f 	.word	0x510e527f
20025f64:	9b05688c 	.word	0x9b05688c
20025f68:	1f83d9ab 	.word	0x1f83d9ab
20025f6c:	5be0cd19 	.word	0x5be0cd19
20025f70:	c1059ed8 	.word	0xc1059ed8
20025f74:	367cd507 	.word	0x367cd507
20025f78:	6a09e667 	.word	0x6a09e667
20025f7c:	bb67ae85 	.word	0xbb67ae85

20025f80 <mbedtls_sha256_process>:
20025f80:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20025f84:	b0cf      	sub	sp, #316	@ 0x13c
20025f86:	aa06      	add	r2, sp, #24
20025f88:	460b      	mov	r3, r1
20025f8a:	4616      	mov	r6, r2
20025f8c:	9004      	str	r0, [sp, #16]
20025f8e:	f100 0408 	add.w	r4, r0, #8
20025f92:	f100 0728 	add.w	r7, r0, #40	@ 0x28
20025f96:	4635      	mov	r5, r6
20025f98:	6820      	ldr	r0, [r4, #0]
20025f9a:	6861      	ldr	r1, [r4, #4]
20025f9c:	3408      	adds	r4, #8
20025f9e:	c503      	stmia	r5!, {r0, r1}
20025fa0:	42bc      	cmp	r4, r7
20025fa2:	462e      	mov	r6, r5
20025fa4:	d1f7      	bne.n	20025f96 <mbedtls_sha256_process+0x16>
20025fa6:	f10d 0a38 	add.w	sl, sp, #56	@ 0x38
20025faa:	4619      	mov	r1, r3
20025fac:	4650      	mov	r0, sl
20025fae:	f103 0440 	add.w	r4, r3, #64	@ 0x40
20025fb2:	784b      	ldrb	r3, [r1, #1]
20025fb4:	780d      	ldrb	r5, [r1, #0]
20025fb6:	041b      	lsls	r3, r3, #16
20025fb8:	ea43 6305 	orr.w	r3, r3, r5, lsl #24
20025fbc:	78cd      	ldrb	r5, [r1, #3]
20025fbe:	3104      	adds	r1, #4
20025fc0:	432b      	orrs	r3, r5
20025fc2:	f811 5c02 	ldrb.w	r5, [r1, #-2]
20025fc6:	428c      	cmp	r4, r1
20025fc8:	ea43 2305 	orr.w	r3, r3, r5, lsl #8
20025fcc:	f840 3b04 	str.w	r3, [r0], #4
20025fd0:	d1ef      	bne.n	20025fb2 <mbedtls_sha256_process+0x32>
20025fd2:	4996      	ldr	r1, [pc, #600]	@ (2002622c <mbedtls_sha256_process+0x2ac>)
20025fd4:	46d4      	mov	ip, sl
20025fd6:	e9d2 e705 	ldrd	lr, r7, [r2, #20]
20025fda:	e9d2 9600 	ldrd	r9, r6, [r2]
20025fde:	460d      	mov	r5, r1
20025fe0:	9100      	str	r1, [sp, #0]
20025fe2:	f8d2 801c 	ldr.w	r8, [r2, #28]
20025fe6:	f8d2 b010 	ldr.w	fp, [r2, #16]
20025fea:	e9d2 3202 	ldrd	r3, r2, [r2, #8]
20025fee:	6829      	ldr	r1, [r5, #0]
20025ff0:	f8dc 0000 	ldr.w	r0, [ip]
20025ff4:	ea4f 24fb 	mov.w	r4, fp, ror #11
20025ff8:	ea84 14bb 	eor.w	r4, r4, fp, ror #6
20025ffc:	4401      	add	r1, r0
20025ffe:	ea87 000e 	eor.w	r0, r7, lr
20026002:	ea84 647b 	eor.w	r4, r4, fp, ror #25
20026006:	ea00 000b 	and.w	r0, r0, fp
2002600a:	4078      	eors	r0, r7
2002600c:	4421      	add	r1, r4
2002600e:	4401      	add	r1, r0
20026010:	4441      	add	r1, r8
20026012:	ea4f 3879 	mov.w	r8, r9, ror #13
20026016:	ea88 08b9 	eor.w	r8, r8, r9, ror #2
2002601a:	ea88 58b9 	eor.w	r8, r8, r9, ror #22
2002601e:	440a      	add	r2, r1
20026020:	4488      	add	r8, r1
20026022:	ea49 0106 	orr.w	r1, r9, r6
20026026:	ea09 0006 	and.w	r0, r9, r6
2002602a:	4019      	ands	r1, r3
2002602c:	4301      	orrs	r1, r0
2002602e:	4488      	add	r8, r1
20026030:	f8dc 0004 	ldr.w	r0, [ip, #4]
20026034:	6869      	ldr	r1, [r5, #4]
20026036:	ea4f 3478 	mov.w	r4, r8, ror #13
2002603a:	4401      	add	r1, r0
2002603c:	ea8b 000e 	eor.w	r0, fp, lr
20026040:	4010      	ands	r0, r2
20026042:	ea80 000e 	eor.w	r0, r0, lr
20026046:	4439      	add	r1, r7
20026048:	4401      	add	r1, r0
2002604a:	ea4f 20f2 	mov.w	r0, r2, ror #11
2002604e:	ea80 10b2 	eor.w	r0, r0, r2, ror #6
20026052:	ea80 6072 	eor.w	r0, r0, r2, ror #25
20026056:	ea84 04b8 	eor.w	r4, r4, r8, ror #2
2002605a:	4401      	add	r1, r0
2002605c:	ea84 54b8 	eor.w	r4, r4, r8, ror #22
20026060:	440b      	add	r3, r1
20026062:	440c      	add	r4, r1
20026064:	ea48 0109 	orr.w	r1, r8, r9
20026068:	ea08 0009 	and.w	r0, r8, r9
2002606c:	4031      	ands	r1, r6
2002606e:	4301      	orrs	r1, r0
20026070:	440c      	add	r4, r1
20026072:	f8dc 0008 	ldr.w	r0, [ip, #8]
20026076:	68a9      	ldr	r1, [r5, #8]
20026078:	ea82 0703 	eor.w	r7, r2, r3
2002607c:	4401      	add	r1, r0
2002607e:	ea82 000b 	eor.w	r0, r2, fp
20026082:	4018      	ands	r0, r3
20026084:	ea80 000b 	eor.w	r0, r0, fp
20026088:	4471      	add	r1, lr
2002608a:	4401      	add	r1, r0
2002608c:	ea4f 20f3 	mov.w	r0, r3, ror #11
20026090:	ea80 10b3 	eor.w	r0, r0, r3, ror #6
20026094:	ea80 6073 	eor.w	r0, r0, r3, ror #25
20026098:	4401      	add	r1, r0
2002609a:	ea4f 3074 	mov.w	r0, r4, ror #13
2002609e:	ea80 00b4 	eor.w	r0, r0, r4, ror #2
200260a2:	ea80 50b4 	eor.w	r0, r0, r4, ror #22
200260a6:	eb06 0e01 	add.w	lr, r6, r1
200260aa:	4408      	add	r0, r1
200260ac:	ea48 0104 	orr.w	r1, r8, r4
200260b0:	ea08 0604 	and.w	r6, r8, r4
200260b4:	ea01 0109 	and.w	r1, r1, r9
200260b8:	4331      	orrs	r1, r6
200260ba:	4408      	add	r0, r1
200260bc:	f8dc 600c 	ldr.w	r6, [ip, #12]
200260c0:	68e9      	ldr	r1, [r5, #12]
200260c2:	ea07 070e 	and.w	r7, r7, lr
200260c6:	440e      	add	r6, r1
200260c8:	ea4f 21fe 	mov.w	r1, lr, ror #11
200260cc:	4057      	eors	r7, r2
200260ce:	445e      	add	r6, fp
200260d0:	ea81 11be 	eor.w	r1, r1, lr, ror #6
200260d4:	ea81 617e 	eor.w	r1, r1, lr, ror #25
200260d8:	443e      	add	r6, r7
200260da:	440e      	add	r6, r1
200260dc:	ea4f 3170 	mov.w	r1, r0, ror #13
200260e0:	ea81 01b0 	eor.w	r1, r1, r0, ror #2
200260e4:	ea81 51b0 	eor.w	r1, r1, r0, ror #22
200260e8:	44b1      	add	r9, r6
200260ea:	4431      	add	r1, r6
200260ec:	ea44 0600 	orr.w	r6, r4, r0
200260f0:	ea04 0700 	and.w	r7, r4, r0
200260f4:	ea06 0608 	and.w	r6, r6, r8
200260f8:	433e      	orrs	r6, r7
200260fa:	4431      	add	r1, r6
200260fc:	f8dc 7010 	ldr.w	r7, [ip, #16]
20026100:	692e      	ldr	r6, [r5, #16]
20026102:	3520      	adds	r5, #32
20026104:	443e      	add	r6, r7
20026106:	4416      	add	r6, r2
20026108:	ea83 020e 	eor.w	r2, r3, lr
2002610c:	ea02 0209 	and.w	r2, r2, r9
20026110:	405a      	eors	r2, r3
20026112:	4416      	add	r6, r2
20026114:	ea4f 22f9 	mov.w	r2, r9, ror #11
20026118:	ea82 12b9 	eor.w	r2, r2, r9, ror #6
2002611c:	ea82 6279 	eor.w	r2, r2, r9, ror #25
20026120:	4416      	add	r6, r2
20026122:	ea4f 3271 	mov.w	r2, r1, ror #13
20026126:	ea82 02b1 	eor.w	r2, r2, r1, ror #2
2002612a:	ea82 52b1 	eor.w	r2, r2, r1, ror #22
2002612e:	44b0      	add	r8, r6
20026130:	4432      	add	r2, r6
20026132:	ea40 0601 	orr.w	r6, r0, r1
20026136:	ea00 0701 	and.w	r7, r0, r1
2002613a:	4026      	ands	r6, r4
2002613c:	433e      	orrs	r6, r7
2002613e:	4432      	add	r2, r6
20026140:	f8dc 7014 	ldr.w	r7, [ip, #20]
20026144:	f855 6c0c 	ldr.w	r6, [r5, #-12]
20026148:	f10c 0c20 	add.w	ip, ip, #32
2002614c:	443e      	add	r6, r7
2002614e:	441e      	add	r6, r3
20026150:	ea8e 0309 	eor.w	r3, lr, r9
20026154:	ea03 0308 	and.w	r3, r3, r8
20026158:	ea83 030e 	eor.w	r3, r3, lr
2002615c:	441e      	add	r6, r3
2002615e:	ea4f 23f8 	mov.w	r3, r8, ror #11
20026162:	ea83 13b8 	eor.w	r3, r3, r8, ror #6
20026166:	ea83 6378 	eor.w	r3, r3, r8, ror #25
2002616a:	441e      	add	r6, r3
2002616c:	ea4f 3372 	mov.w	r3, r2, ror #13
20026170:	ea83 03b2 	eor.w	r3, r3, r2, ror #2
20026174:	19a7      	adds	r7, r4, r6
20026176:	ea83 53b2 	eor.w	r3, r3, r2, ror #22
2002617a:	ea41 0402 	orr.w	r4, r1, r2
2002617e:	4433      	add	r3, r6
20026180:	4004      	ands	r4, r0
20026182:	ea01 0602 	and.w	r6, r1, r2
20026186:	4334      	orrs	r4, r6
20026188:	4423      	add	r3, r4
2002618a:	f85c 6c08 	ldr.w	r6, [ip, #-8]
2002618e:	f855 4c08 	ldr.w	r4, [r5, #-8]
20026192:	4434      	add	r4, r6
20026194:	ea89 0608 	eor.w	r6, r9, r8
20026198:	403e      	ands	r6, r7
2002619a:	ea86 0609 	eor.w	r6, r6, r9
2002619e:	4474      	add	r4, lr
200261a0:	4434      	add	r4, r6
200261a2:	ea4f 26f7 	mov.w	r6, r7, ror #11
200261a6:	ea86 16b7 	eor.w	r6, r6, r7, ror #6
200261aa:	ea86 6677 	eor.w	r6, r6, r7, ror #25
200261ae:	4434      	add	r4, r6
200261b0:	eb00 0e04 	add.w	lr, r0, r4
200261b4:	ea4f 3073 	mov.w	r0, r3, ror #13
200261b8:	ea80 00b3 	eor.w	r0, r0, r3, ror #2
200261bc:	ea80 50b3 	eor.w	r0, r0, r3, ror #22
200261c0:	4420      	add	r0, r4
200261c2:	ea42 0403 	orr.w	r4, r2, r3
200261c6:	400c      	ands	r4, r1
200261c8:	ea02 0603 	and.w	r6, r2, r3
200261cc:	4334      	orrs	r4, r6
200261ce:	1906      	adds	r6, r0, r4
200261d0:	f855 0c04 	ldr.w	r0, [r5, #-4]
200261d4:	f85c 4c04 	ldr.w	r4, [ip, #-4]
200261d8:	4420      	add	r0, r4
200261da:	ea88 0407 	eor.w	r4, r8, r7
200261de:	ea04 040e 	and.w	r4, r4, lr
200261e2:	4448      	add	r0, r9
200261e4:	ea84 0408 	eor.w	r4, r4, r8
200261e8:	4420      	add	r0, r4
200261ea:	ea4f 24fe 	mov.w	r4, lr, ror #11
200261ee:	ea84 14be 	eor.w	r4, r4, lr, ror #6
200261f2:	ea84 647e 	eor.w	r4, r4, lr, ror #25
200261f6:	4420      	add	r0, r4
200261f8:	eb01 0b00 	add.w	fp, r1, r0
200261fc:	ea4f 3176 	mov.w	r1, r6, ror #13
20026200:	ea81 01b6 	eor.w	r1, r1, r6, ror #2
20026204:	ea81 51b6 	eor.w	r1, r1, r6, ror #22
20026208:	4401      	add	r1, r0
2002620a:	ea43 0006 	orr.w	r0, r3, r6
2002620e:	4010      	ands	r0, r2
20026210:	ea03 0406 	and.w	r4, r3, r6
20026214:	4320      	orrs	r0, r4
20026216:	eb01 0900 	add.w	r9, r1, r0
2002621a:	4905      	ldr	r1, [pc, #20]	@ (20026230 <mbedtls_sha256_process+0x2b0>)
2002621c:	42a9      	cmp	r1, r5
2002621e:	f47f aee6 	bne.w	20025fee <mbedtls_sha256_process+0x6e>
20026222:	f10a 01c0 	add.w	r1, sl, #192	@ 0xc0
20026226:	9105      	str	r1, [sp, #20]
20026228:	e004      	b.n	20026234 <mbedtls_sha256_process+0x2b4>
2002622a:	bf00      	nop
2002622c:	2002bdcc 	.word	0x2002bdcc
20026230:	2002be0c 	.word	0x2002be0c
20026234:	f8da 1038 	ldr.w	r1, [sl, #56]	@ 0x38
20026238:	f8da 5004 	ldr.w	r5, [sl, #4]
2002623c:	ea4f 44f1 	mov.w	r4, r1, ror #19
20026240:	ea84 4471 	eor.w	r4, r4, r1, ror #17
20026244:	f8da 0000 	ldr.w	r0, [sl]
20026248:	ea84 2491 	eor.w	r4, r4, r1, lsr #10
2002624c:	f8da 1024 	ldr.w	r1, [sl, #36]	@ 0x24
20026250:	f10a 0a20 	add.w	sl, sl, #32
20026254:	4401      	add	r1, r0
20026256:	ea4f 40b5 	mov.w	r0, r5, ror #18
2002625a:	ea80 10f5 	eor.w	r0, r0, r5, ror #7
2002625e:	ea80 00d5 	eor.w	r0, r0, r5, lsr #3
20026262:	4421      	add	r1, r4
20026264:	4401      	add	r1, r0
20026266:	9103      	str	r1, [sp, #12]
20026268:	ea87 000e 	eor.w	r0, r7, lr
2002626c:	9900      	ldr	r1, [sp, #0]
2002626e:	ea4f 24fb 	mov.w	r4, fp, ror #11
20026272:	ea84 14bb 	eor.w	r4, r4, fp, ror #6
20026276:	ea00 000b 	and.w	r0, r0, fp
2002627a:	ea84 647b 	eor.w	r4, r4, fp, ror #25
2002627e:	6c09      	ldr	r1, [r1, #64]	@ 0x40
20026280:	4078      	eors	r0, r7
20026282:	4420      	add	r0, r4
20026284:	4401      	add	r1, r0
20026286:	9803      	ldr	r0, [sp, #12]
20026288:	ea4f 3479 	mov.w	r4, r9, ror #13
2002628c:	4401      	add	r1, r0
2002628e:	4441      	add	r1, r8
20026290:	eb02 0801 	add.w	r8, r2, r1
20026294:	ea49 0206 	orr.w	r2, r9, r6
20026298:	f8ca 0020 	str.w	r0, [sl, #32]
2002629c:	ea84 04b9 	eor.w	r4, r4, r9, ror #2
200262a0:	ea09 0006 	and.w	r0, r9, r6
200262a4:	401a      	ands	r2, r3
200262a6:	4302      	orrs	r2, r0
200262a8:	ea84 54b9 	eor.w	r4, r4, r9, ror #22
200262ac:	4414      	add	r4, r2
200262ae:	f8da 201c 	ldr.w	r2, [sl, #28]
200262b2:	440c      	add	r4, r1
200262b4:	ea4f 4cf2 	mov.w	ip, r2, ror #19
200262b8:	ea8c 4c72 	eor.w	ip, ip, r2, ror #17
200262bc:	f85a 1c18 	ldr.w	r1, [sl, #-24]
200262c0:	ea8c 2c92 	eor.w	ip, ip, r2, lsr #10
200262c4:	f8da 2008 	ldr.w	r2, [sl, #8]
200262c8:	18a8      	adds	r0, r5, r2
200262ca:	ea4f 42b1 	mov.w	r2, r1, ror #18
200262ce:	ea82 12f1 	eor.w	r2, r2, r1, ror #7
200262d2:	ea82 02d1 	eor.w	r2, r2, r1, lsr #3
200262d6:	4460      	add	r0, ip
200262d8:	4410      	add	r0, r2
200262da:	9a00      	ldr	r2, [sp, #0]
200262dc:	ea8b 050e 	eor.w	r5, fp, lr
200262e0:	6c52      	ldr	r2, [r2, #68]	@ 0x44
200262e2:	ea05 0508 	and.w	r5, r5, r8
200262e6:	443a      	add	r2, r7
200262e8:	4402      	add	r2, r0
200262ea:	ea85 050e 	eor.w	r5, r5, lr
200262ee:	4415      	add	r5, r2
200262f0:	ea4f 22f8 	mov.w	r2, r8, ror #11
200262f4:	ea82 12b8 	eor.w	r2, r2, r8, ror #6
200262f8:	ea82 6278 	eor.w	r2, r2, r8, ror #25
200262fc:	442a      	add	r2, r5
200262fe:	4413      	add	r3, r2
20026300:	9301      	str	r3, [sp, #4]
20026302:	ea49 0504 	orr.w	r5, r9, r4
20026306:	ea4f 3374 	mov.w	r3, r4, ror #13
2002630a:	ea09 0704 	and.w	r7, r9, r4
2002630e:	ea83 03b4 	eor.w	r3, r3, r4, ror #2
20026312:	4035      	ands	r5, r6
20026314:	433d      	orrs	r5, r7
20026316:	ea83 53b4 	eor.w	r3, r3, r4, ror #22
2002631a:	442b      	add	r3, r5
2002631c:	4413      	add	r3, r2
2002631e:	9a03      	ldr	r2, [sp, #12]
20026320:	f85a 5c14 	ldr.w	r5, [sl, #-20]
20026324:	ea4f 4cf2 	mov.w	ip, r2, ror #19
20026328:	ea8c 4c72 	eor.w	ip, ip, r2, ror #17
2002632c:	ea8c 2c92 	eor.w	ip, ip, r2, lsr #10
20026330:	f8da 200c 	ldr.w	r2, [sl, #12]
20026334:	f8ca 0024 	str.w	r0, [sl, #36]	@ 0x24
20026338:	188f      	adds	r7, r1, r2
2002633a:	ea4f 42b5 	mov.w	r2, r5, ror #18
2002633e:	ea82 12f5 	eor.w	r2, r2, r5, ror #7
20026342:	ea82 02d5 	eor.w	r2, r2, r5, lsr #3
20026346:	4467      	add	r7, ip
20026348:	4417      	add	r7, r2
2002634a:	9a01      	ldr	r2, [sp, #4]
2002634c:	ea8b 0108 	eor.w	r1, fp, r8
20026350:	4011      	ands	r1, r2
20026352:	9a00      	ldr	r2, [sp, #0]
20026354:	ea81 010b 	eor.w	r1, r1, fp
20026358:	6c92      	ldr	r2, [r2, #72]	@ 0x48
2002635a:	f8ca 7028 	str.w	r7, [sl, #40]	@ 0x28
2002635e:	4472      	add	r2, lr
20026360:	443a      	add	r2, r7
20026362:	eb01 0c02 	add.w	ip, r1, r2
20026366:	9a01      	ldr	r2, [sp, #4]
20026368:	9901      	ldr	r1, [sp, #4]
2002636a:	ea4f 22f2 	mov.w	r2, r2, ror #11
2002636e:	ea82 12b1 	eor.w	r2, r2, r1, ror #6
20026372:	ea82 6271 	eor.w	r2, r2, r1, ror #25
20026376:	4462      	add	r2, ip
20026378:	18b1      	adds	r1, r6, r2
2002637a:	9102      	str	r1, [sp, #8]
2002637c:	ea44 0603 	orr.w	r6, r4, r3
20026380:	ea4f 3173 	mov.w	r1, r3, ror #13
20026384:	ea04 0c03 	and.w	ip, r4, r3
20026388:	ea81 01b3 	eor.w	r1, r1, r3, ror #2
2002638c:	ea06 0609 	and.w	r6, r6, r9
20026390:	ea46 060c 	orr.w	r6, r6, ip
20026394:	ea81 51b3 	eor.w	r1, r1, r3, ror #22
20026398:	4431      	add	r1, r6
2002639a:	4411      	add	r1, r2
2002639c:	ea4f 42f0 	mov.w	r2, r0, ror #19
200263a0:	ea82 4270 	eor.w	r2, r2, r0, ror #17
200263a4:	f85a 6c10 	ldr.w	r6, [sl, #-16]
200263a8:	ea82 2090 	eor.w	r0, r2, r0, lsr #10
200263ac:	f8da 2010 	ldr.w	r2, [sl, #16]
200263b0:	ea03 0e01 	and.w	lr, r3, r1
200263b4:	4415      	add	r5, r2
200263b6:	ea4f 42b6 	mov.w	r2, r6, ror #18
200263ba:	ea82 12f6 	eor.w	r2, r2, r6, ror #7
200263be:	ea82 02d6 	eor.w	r2, r2, r6, lsr #3
200263c2:	4405      	add	r5, r0
200263c4:	4415      	add	r5, r2
200263c6:	9a01      	ldr	r2, [sp, #4]
200263c8:	ea88 0002 	eor.w	r0, r8, r2
200263cc:	9a02      	ldr	r2, [sp, #8]
200263ce:	4010      	ands	r0, r2
200263d0:	9a00      	ldr	r2, [sp, #0]
200263d2:	ea80 0008 	eor.w	r0, r0, r8
200263d6:	6cd2      	ldr	r2, [r2, #76]	@ 0x4c
200263d8:	f8ca 502c 	str.w	r5, [sl, #44]	@ 0x2c
200263dc:	445a      	add	r2, fp
200263de:	442a      	add	r2, r5
200263e0:	eb00 0c02 	add.w	ip, r0, r2
200263e4:	9a02      	ldr	r2, [sp, #8]
200263e6:	9802      	ldr	r0, [sp, #8]
200263e8:	ea4f 22f2 	mov.w	r2, r2, ror #11
200263ec:	ea82 12b0 	eor.w	r2, r2, r0, ror #6
200263f0:	ea82 6270 	eor.w	r2, r2, r0, ror #25
200263f4:	4462      	add	r2, ip
200263f6:	ea4f 3071 	mov.w	r0, r1, ror #13
200263fa:	ea43 0c01 	orr.w	ip, r3, r1
200263fe:	ea80 00b1 	eor.w	r0, r0, r1, ror #2
20026402:	ea0c 0c04 	and.w	ip, ip, r4
20026406:	ea4c 0c0e 	orr.w	ip, ip, lr
2002640a:	ea80 50b1 	eor.w	r0, r0, r1, ror #22
2002640e:	4460      	add	r0, ip
20026410:	4410      	add	r0, r2
20026412:	4491      	add	r9, r2
20026414:	ea4f 42f7 	mov.w	r2, r7, ror #19
20026418:	ea82 4277 	eor.w	r2, r2, r7, ror #17
2002641c:	f85a cc0c 	ldr.w	ip, [sl, #-12]
20026420:	ea82 2797 	eor.w	r7, r2, r7, lsr #10
20026424:	f8da 2014 	ldr.w	r2, [sl, #20]
20026428:	ea01 0e00 	and.w	lr, r1, r0
2002642c:	4416      	add	r6, r2
2002642e:	ea4f 42bc 	mov.w	r2, ip, ror #18
20026432:	ea82 12fc 	eor.w	r2, r2, ip, ror #7
20026436:	ea82 02dc 	eor.w	r2, r2, ip, lsr #3
2002643a:	443e      	add	r6, r7
2002643c:	4416      	add	r6, r2
2002643e:	e9dd 2701 	ldrd	r2, r7, [sp, #4]
20026442:	4057      	eors	r7, r2
20026444:	ea07 0709 	and.w	r7, r7, r9
20026448:	4057      	eors	r7, r2
2002644a:	9a00      	ldr	r2, [sp, #0]
2002644c:	f8ca 6030 	str.w	r6, [sl, #48]	@ 0x30
20026450:	6d12      	ldr	r2, [r2, #80]	@ 0x50
20026452:	4432      	add	r2, r6
20026454:	4442      	add	r2, r8
20026456:	443a      	add	r2, r7
20026458:	ea4f 27f9 	mov.w	r7, r9, ror #11
2002645c:	ea87 17b9 	eor.w	r7, r7, r9, ror #6
20026460:	ea87 6779 	eor.w	r7, r7, r9, ror #25
20026464:	4417      	add	r7, r2
20026466:	eb04 0807 	add.w	r8, r4, r7
2002646a:	ea4f 3270 	mov.w	r2, r0, ror #13
2002646e:	ea41 0400 	orr.w	r4, r1, r0
20026472:	ea82 02b0 	eor.w	r2, r2, r0, ror #2
20026476:	401c      	ands	r4, r3
20026478:	ea44 040e 	orr.w	r4, r4, lr
2002647c:	ea82 52b0 	eor.w	r2, r2, r0, ror #22
20026480:	4422      	add	r2, r4
20026482:	ea4f 44f5 	mov.w	r4, r5, ror #19
20026486:	ea84 4475 	eor.w	r4, r4, r5, ror #17
2002648a:	ea84 2495 	eor.w	r4, r4, r5, lsr #10
2002648e:	f8da 5018 	ldr.w	r5, [sl, #24]
20026492:	f85a ec08 	ldr.w	lr, [sl, #-8]
20026496:	4465      	add	r5, ip
20026498:	4425      	add	r5, r4
2002649a:	ea4f 44be 	mov.w	r4, lr, ror #18
2002649e:	ea84 14fe 	eor.w	r4, r4, lr, ror #7
200264a2:	ea84 04de 	eor.w	r4, r4, lr, lsr #3
200264a6:	4425      	add	r5, r4
200264a8:	9c02      	ldr	r4, [sp, #8]
200264aa:	443a      	add	r2, r7
200264ac:	ea84 0709 	eor.w	r7, r4, r9
200264b0:	ea07 0708 	and.w	r7, r7, r8
200264b4:	ea87 0c04 	eor.w	ip, r7, r4
200264b8:	9c00      	ldr	r4, [sp, #0]
200264ba:	9f01      	ldr	r7, [sp, #4]
200264bc:	6d64      	ldr	r4, [r4, #84]	@ 0x54
200264be:	ea00 0b02 	and.w	fp, r0, r2
200264c2:	442c      	add	r4, r5
200264c4:	443c      	add	r4, r7
200264c6:	eb0c 0704 	add.w	r7, ip, r4
200264ca:	ea4f 24f8 	mov.w	r4, r8, ror #11
200264ce:	ea84 14b8 	eor.w	r4, r4, r8, ror #6
200264d2:	ea84 6478 	eor.w	r4, r4, r8, ror #25
200264d6:	443c      	add	r4, r7
200264d8:	191f      	adds	r7, r3, r4
200264da:	ea40 0c02 	orr.w	ip, r0, r2
200264de:	ea4f 3372 	mov.w	r3, r2, ror #13
200264e2:	ea0c 0c01 	and.w	ip, ip, r1
200264e6:	ea83 03b2 	eor.w	r3, r3, r2, ror #2
200264ea:	ea4c 0c0b 	orr.w	ip, ip, fp
200264ee:	ea83 53b2 	eor.w	r3, r3, r2, ror #22
200264f2:	4463      	add	r3, ip
200264f4:	4423      	add	r3, r4
200264f6:	ea4f 44f6 	mov.w	r4, r6, ror #19
200264fa:	ea84 4476 	eor.w	r4, r4, r6, ror #17
200264fe:	ea84 2496 	eor.w	r4, r4, r6, lsr #10
20026502:	f8da 601c 	ldr.w	r6, [sl, #28]
20026506:	f85a cc04 	ldr.w	ip, [sl, #-4]
2002650a:	4476      	add	r6, lr
2002650c:	4426      	add	r6, r4
2002650e:	ea4f 44bc 	mov.w	r4, ip, ror #18
20026512:	ea84 14fc 	eor.w	r4, r4, ip, ror #7
20026516:	ea84 04dc 	eor.w	r4, r4, ip, lsr #3
2002651a:	eb06 0b04 	add.w	fp, r6, r4
2002651e:	9c00      	ldr	r4, [sp, #0]
20026520:	9e02      	ldr	r6, [sp, #8]
20026522:	6da4      	ldr	r4, [r4, #88]	@ 0x58
20026524:	ea89 0e08 	eor.w	lr, r9, r8
20026528:	445c      	add	r4, fp
2002652a:	4434      	add	r4, r6
2002652c:	ea0e 0e07 	and.w	lr, lr, r7
20026530:	ea4f 26f7 	mov.w	r6, r7, ror #11
20026534:	ea8e 0e09 	eor.w	lr, lr, r9
20026538:	ea86 16b7 	eor.w	r6, r6, r7, ror #6
2002653c:	4474      	add	r4, lr
2002653e:	ea86 6677 	eor.w	r6, r6, r7, ror #25
20026542:	4434      	add	r4, r6
20026544:	eb01 0e04 	add.w	lr, r1, r4
20026548:	ea42 0603 	orr.w	r6, r2, r3
2002654c:	ea4f 3173 	mov.w	r1, r3, ror #13
20026550:	f8ca b038 	str.w	fp, [sl, #56]	@ 0x38
20026554:	4006      	ands	r6, r0
20026556:	ea02 0b03 	and.w	fp, r2, r3
2002655a:	ea81 01b3 	eor.w	r1, r1, r3, ror #2
2002655e:	ea46 060b 	orr.w	r6, r6, fp
20026562:	ea81 51b3 	eor.w	r1, r1, r3, ror #22
20026566:	4431      	add	r1, r6
20026568:	190e      	adds	r6, r1, r4
2002656a:	ea4f 41f5 	mov.w	r1, r5, ror #19
2002656e:	ea81 4175 	eor.w	r1, r1, r5, ror #17
20026572:	f8ca 5034 	str.w	r5, [sl, #52]	@ 0x34
20026576:	ea81 2195 	eor.w	r1, r1, r5, lsr #10
2002657a:	9d03      	ldr	r5, [sp, #12]
2002657c:	f8da 4000 	ldr.w	r4, [sl]
20026580:	4465      	add	r5, ip
20026582:	4429      	add	r1, r5
20026584:	ea4f 45b4 	mov.w	r5, r4, ror #18
20026588:	ea85 15f4 	eor.w	r5, r5, r4, ror #7
2002658c:	ea85 05d4 	eor.w	r5, r5, r4, lsr #3
20026590:	194c      	adds	r4, r1, r5
20026592:	9900      	ldr	r1, [sp, #0]
20026594:	ea88 0507 	eor.w	r5, r8, r7
20026598:	6dc9      	ldr	r1, [r1, #92]	@ 0x5c
2002659a:	ea05 050e 	and.w	r5, r5, lr
2002659e:	4421      	add	r1, r4
200265a0:	4449      	add	r1, r9
200265a2:	ea85 0508 	eor.w	r5, r5, r8
200265a6:	440d      	add	r5, r1
200265a8:	ea4f 21fe 	mov.w	r1, lr, ror #11
200265ac:	ea81 11be 	eor.w	r1, r1, lr, ror #6
200265b0:	ea81 617e 	eor.w	r1, r1, lr, ror #25
200265b4:	4429      	add	r1, r5
200265b6:	f8ca 403c 	str.w	r4, [sl, #60]	@ 0x3c
200265ba:	eb00 0b01 	add.w	fp, r0, r1
200265be:	ea43 0406 	orr.w	r4, r3, r6
200265c2:	ea4f 3076 	mov.w	r0, r6, ror #13
200265c6:	ea80 00b6 	eor.w	r0, r0, r6, ror #2
200265ca:	4014      	ands	r4, r2
200265cc:	ea03 0506 	and.w	r5, r3, r6
200265d0:	ea80 50b6 	eor.w	r0, r0, r6, ror #22
200265d4:	432c      	orrs	r4, r5
200265d6:	4420      	add	r0, r4
200265d8:	eb00 0901 	add.w	r9, r0, r1
200265dc:	9900      	ldr	r1, [sp, #0]
200265de:	3120      	adds	r1, #32
200265e0:	9100      	str	r1, [sp, #0]
200265e2:	9905      	ldr	r1, [sp, #20]
200265e4:	4551      	cmp	r1, sl
200265e6:	f47f ae25 	bne.w	20026234 <mbedtls_sha256_process+0x2b4>
200265ea:	9308      	str	r3, [sp, #32]
200265ec:	9b04      	ldr	r3, [sp, #16]
200265ee:	a906      	add	r1, sp, #24
200265f0:	60ca      	str	r2, [r1, #12]
200265f2:	f8c1 801c 	str.w	r8, [r1, #28]
200265f6:	1d1a      	adds	r2, r3, #4
200265f8:	618f      	str	r7, [r1, #24]
200265fa:	3324      	adds	r3, #36	@ 0x24
200265fc:	f8c1 e014 	str.w	lr, [r1, #20]
20026600:	604e      	str	r6, [r1, #4]
20026602:	f8c1 b010 	str.w	fp, [r1, #16]
20026606:	f8c1 9000 	str.w	r9, [r1]
2002660a:	f852 0f04 	ldr.w	r0, [r2, #4]!
2002660e:	f851 4b04 	ldr.w	r4, [r1], #4
20026612:	4293      	cmp	r3, r2
20026614:	4420      	add	r0, r4
20026616:	6010      	str	r0, [r2, #0]
20026618:	d1f7      	bne.n	2002660a <mbedtls_sha256_process+0x68a>
2002661a:	b04f      	add	sp, #316	@ 0x13c
2002661c:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}

20026620 <mbedtls_sha256_update.part.0>:
20026620:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
20026624:	6803      	ldr	r3, [r0, #0]
20026626:	4605      	mov	r5, r0
20026628:	f003 073f 	and.w	r7, r3, #63	@ 0x3f
2002662c:	189b      	adds	r3, r3, r2
2002662e:	6003      	str	r3, [r0, #0]
20026630:	bf28      	it	cs
20026632:	6843      	ldrcs	r3, [r0, #4]
20026634:	460e      	mov	r6, r1
20026636:	bf28      	it	cs
20026638:	3301      	addcs	r3, #1
2002663a:	4614      	mov	r4, r2
2002663c:	bf28      	it	cs
2002663e:	6043      	strcs	r3, [r0, #4]
20026640:	b197      	cbz	r7, 20026668 <mbedtls_sha256_update.part.0+0x48>
20026642:	f1c7 0940 	rsb	r9, r7, #64	@ 0x40
20026646:	4591      	cmp	r9, r2
20026648:	d80e      	bhi.n	20026668 <mbedtls_sha256_update.part.0+0x48>
2002664a:	f100 0828 	add.w	r8, r0, #40	@ 0x28
2002664e:	464a      	mov	r2, r9
20026650:	eb08 0007 	add.w	r0, r8, r7
20026654:	f004 f910 	bl	2002a878 <memcpy>
20026658:	3c40      	subs	r4, #64	@ 0x40
2002665a:	4641      	mov	r1, r8
2002665c:	4628      	mov	r0, r5
2002665e:	443c      	add	r4, r7
20026660:	f7ff fc8e 	bl	20025f80 <mbedtls_sha256_process>
20026664:	2700      	movs	r7, #0
20026666:	444e      	add	r6, r9
20026668:	46a0      	mov	r8, r4
2002666a:	eb04 0906 	add.w	r9, r4, r6
2002666e:	e004      	b.n	2002667a <mbedtls_sha256_update.part.0+0x5a>
20026670:	4628      	mov	r0, r5
20026672:	f7ff fc85 	bl	20025f80 <mbedtls_sha256_process>
20026676:	f1a8 0840 	sub.w	r8, r8, #64	@ 0x40
2002667a:	f1b8 0f3f 	cmp.w	r8, #63	@ 0x3f
2002667e:	eba9 0108 	sub.w	r1, r9, r8
20026682:	d8f5      	bhi.n	20026670 <mbedtls_sha256_update.part.0+0x50>
20026684:	f06f 033f 	mvn.w	r3, #63	@ 0x3f
20026688:	09a1      	lsrs	r1, r4, #6
2002668a:	4359      	muls	r1, r3
2002668c:	1862      	adds	r2, r4, r1
2002668e:	d007      	beq.n	200266a0 <mbedtls_sha256_update.part.0+0x80>
20026690:	f105 0028 	add.w	r0, r5, #40	@ 0x28
20026694:	1a71      	subs	r1, r6, r1
20026696:	4438      	add	r0, r7
20026698:	e8bd 43f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
2002669c:	f004 b8ec 	b.w	2002a878 <memcpy>
200266a0:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}

200266a4 <mbedtls_sha256_update>:
200266a4:	b10a      	cbz	r2, 200266aa <mbedtls_sha256_update+0x6>
200266a6:	f7ff bfbb 	b.w	20026620 <mbedtls_sha256_update.part.0>
200266aa:	4770      	bx	lr

200266ac <mbedtls_sha256_finish>:
200266ac:	b537      	push	{r0, r1, r2, r4, r5, lr}
200266ae:	4604      	mov	r4, r0
200266b0:	460d      	mov	r5, r1
200266b2:	e9d0 2100 	ldrd	r2, r1, [r0]
200266b6:	0f53      	lsrs	r3, r2, #29
200266b8:	ea43 03c1 	orr.w	r3, r3, r1, lsl #3
200266bc:	ba1b      	rev	r3, r3
200266be:	9300      	str	r3, [sp, #0]
200266c0:	00d3      	lsls	r3, r2, #3
200266c2:	f002 023f 	and.w	r2, r2, #63	@ 0x3f
200266c6:	2a37      	cmp	r2, #55	@ 0x37
200266c8:	ba1b      	rev	r3, r3
200266ca:	bf94      	ite	ls
200266cc:	f1c2 0238 	rsbls	r2, r2, #56	@ 0x38
200266d0:	f1c2 0278 	rsbhi	r2, r2, #120	@ 0x78
200266d4:	492b      	ldr	r1, [pc, #172]	@ (20026784 <mbedtls_sha256_finish+0xd8>)
200266d6:	9301      	str	r3, [sp, #4]
200266d8:	f7ff ffe4 	bl	200266a4 <mbedtls_sha256_update>
200266dc:	2208      	movs	r2, #8
200266de:	4669      	mov	r1, sp
200266e0:	4620      	mov	r0, r4
200266e2:	f7ff ff9d 	bl	20026620 <mbedtls_sha256_update.part.0>
200266e6:	7ae3      	ldrb	r3, [r4, #11]
200266e8:	702b      	strb	r3, [r5, #0]
200266ea:	8963      	ldrh	r3, [r4, #10]
200266ec:	706b      	strb	r3, [r5, #1]
200266ee:	68a3      	ldr	r3, [r4, #8]
200266f0:	0a1b      	lsrs	r3, r3, #8
200266f2:	70ab      	strb	r3, [r5, #2]
200266f4:	68a3      	ldr	r3, [r4, #8]
200266f6:	70eb      	strb	r3, [r5, #3]
200266f8:	7be3      	ldrb	r3, [r4, #15]
200266fa:	712b      	strb	r3, [r5, #4]
200266fc:	89e3      	ldrh	r3, [r4, #14]
200266fe:	716b      	strb	r3, [r5, #5]
20026700:	68e3      	ldr	r3, [r4, #12]
20026702:	0a1b      	lsrs	r3, r3, #8
20026704:	71ab      	strb	r3, [r5, #6]
20026706:	68e3      	ldr	r3, [r4, #12]
20026708:	71eb      	strb	r3, [r5, #7]
2002670a:	7ce3      	ldrb	r3, [r4, #19]
2002670c:	722b      	strb	r3, [r5, #8]
2002670e:	8a63      	ldrh	r3, [r4, #18]
20026710:	726b      	strb	r3, [r5, #9]
20026712:	6923      	ldr	r3, [r4, #16]
20026714:	0a1b      	lsrs	r3, r3, #8
20026716:	72ab      	strb	r3, [r5, #10]
20026718:	6923      	ldr	r3, [r4, #16]
2002671a:	72eb      	strb	r3, [r5, #11]
2002671c:	7de3      	ldrb	r3, [r4, #23]
2002671e:	732b      	strb	r3, [r5, #12]
20026720:	8ae3      	ldrh	r3, [r4, #22]
20026722:	736b      	strb	r3, [r5, #13]
20026724:	6963      	ldr	r3, [r4, #20]
20026726:	0a1b      	lsrs	r3, r3, #8
20026728:	73ab      	strb	r3, [r5, #14]
2002672a:	6963      	ldr	r3, [r4, #20]
2002672c:	73eb      	strb	r3, [r5, #15]
2002672e:	7ee3      	ldrb	r3, [r4, #27]
20026730:	742b      	strb	r3, [r5, #16]
20026732:	8b63      	ldrh	r3, [r4, #26]
20026734:	746b      	strb	r3, [r5, #17]
20026736:	69a3      	ldr	r3, [r4, #24]
20026738:	0a1b      	lsrs	r3, r3, #8
2002673a:	74ab      	strb	r3, [r5, #18]
2002673c:	69a3      	ldr	r3, [r4, #24]
2002673e:	74eb      	strb	r3, [r5, #19]
20026740:	7fe3      	ldrb	r3, [r4, #31]
20026742:	752b      	strb	r3, [r5, #20]
20026744:	8be3      	ldrh	r3, [r4, #30]
20026746:	756b      	strb	r3, [r5, #21]
20026748:	69e3      	ldr	r3, [r4, #28]
2002674a:	0a1b      	lsrs	r3, r3, #8
2002674c:	75ab      	strb	r3, [r5, #22]
2002674e:	69e3      	ldr	r3, [r4, #28]
20026750:	75eb      	strb	r3, [r5, #23]
20026752:	f894 3023 	ldrb.w	r3, [r4, #35]	@ 0x23
20026756:	762b      	strb	r3, [r5, #24]
20026758:	8c63      	ldrh	r3, [r4, #34]	@ 0x22
2002675a:	766b      	strb	r3, [r5, #25]
2002675c:	6a23      	ldr	r3, [r4, #32]
2002675e:	0a1b      	lsrs	r3, r3, #8
20026760:	76ab      	strb	r3, [r5, #26]
20026762:	6a23      	ldr	r3, [r4, #32]
20026764:	76eb      	strb	r3, [r5, #27]
20026766:	6ea3      	ldr	r3, [r4, #104]	@ 0x68
20026768:	b94b      	cbnz	r3, 2002677e <mbedtls_sha256_finish+0xd2>
2002676a:	f894 3027 	ldrb.w	r3, [r4, #39]	@ 0x27
2002676e:	772b      	strb	r3, [r5, #28]
20026770:	8ce3      	ldrh	r3, [r4, #38]	@ 0x26
20026772:	776b      	strb	r3, [r5, #29]
20026774:	6a63      	ldr	r3, [r4, #36]	@ 0x24
20026776:	0a1b      	lsrs	r3, r3, #8
20026778:	77ab      	strb	r3, [r5, #30]
2002677a:	6a63      	ldr	r3, [r4, #36]	@ 0x24
2002677c:	77eb      	strb	r3, [r5, #31]
2002677e:	b003      	add	sp, #12
20026780:	bd30      	pop	{r4, r5, pc}
20026782:	bf00      	nop
20026784:	2002bd8c 	.word	0x2002bd8c

20026788 <mbedtls_sha256>:
20026788:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
2002678c:	461d      	mov	r5, r3
2002678e:	b09c      	sub	sp, #112	@ 0x70
20026790:	4607      	mov	r7, r0
20026792:	a801      	add	r0, sp, #4
20026794:	4688      	mov	r8, r1
20026796:	4616      	mov	r6, r2
20026798:	f7ff fb97 	bl	20025eca <mbedtls_sha256_init>
2002679c:	b355      	cbz	r5, 200267f4 <mbedtls_sha256+0x6c>
2002679e:	f8df a090 	ldr.w	sl, [pc, #144]	@ 20026830 <mbedtls_sha256+0xa8>
200267a2:	f8df 9090 	ldr.w	r9, [pc, #144]	@ 20026834 <mbedtls_sha256+0xac>
200267a6:	f8df e090 	ldr.w	lr, [pc, #144]	@ 20026838 <mbedtls_sha256+0xb0>
200267aa:	f8df c090 	ldr.w	ip, [pc, #144]	@ 2002683c <mbedtls_sha256+0xb4>
200267ae:	4818      	ldr	r0, [pc, #96]	@ (20026810 <mbedtls_sha256+0x88>)
200267b0:	4918      	ldr	r1, [pc, #96]	@ (20026814 <mbedtls_sha256+0x8c>)
200267b2:	4a19      	ldr	r2, [pc, #100]	@ (20026818 <mbedtls_sha256+0x90>)
200267b4:	4b19      	ldr	r3, [pc, #100]	@ (2002681c <mbedtls_sha256+0x94>)
200267b6:	2400      	movs	r4, #0
200267b8:	e9cd 2309 	strd	r2, r3, [sp, #36]	@ 0x24
200267bc:	e9cd 0107 	strd	r0, r1, [sp, #28]
200267c0:	4642      	mov	r2, r8
200267c2:	4639      	mov	r1, r7
200267c4:	a801      	add	r0, sp, #4
200267c6:	e9cd ec05 	strd	lr, ip, [sp, #20]
200267ca:	e9cd 4401 	strd	r4, r4, [sp, #4]
200267ce:	e9cd a903 	strd	sl, r9, [sp, #12]
200267d2:	951b      	str	r5, [sp, #108]	@ 0x6c
200267d4:	f7ff ff66 	bl	200266a4 <mbedtls_sha256_update>
200267d8:	4631      	mov	r1, r6
200267da:	a801      	add	r0, sp, #4
200267dc:	f7ff ff66 	bl	200266ac <mbedtls_sha256_finish>
200267e0:	4623      	mov	r3, r4
200267e2:	4622      	mov	r2, r4
200267e4:	a901      	add	r1, sp, #4
200267e6:	54ca      	strb	r2, [r1, r3]
200267e8:	3301      	adds	r3, #1
200267ea:	2b6c      	cmp	r3, #108	@ 0x6c
200267ec:	d1fa      	bne.n	200267e4 <mbedtls_sha256+0x5c>
200267ee:	b01c      	add	sp, #112	@ 0x70
200267f0:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
200267f4:	f8df a048 	ldr.w	sl, [pc, #72]	@ 20026840 <mbedtls_sha256+0xb8>
200267f8:	f8df 9048 	ldr.w	r9, [pc, #72]	@ 20026844 <mbedtls_sha256+0xbc>
200267fc:	f8df e048 	ldr.w	lr, [pc, #72]	@ 20026848 <mbedtls_sha256+0xc0>
20026800:	f8df c048 	ldr.w	ip, [pc, #72]	@ 2002684c <mbedtls_sha256+0xc4>
20026804:	4806      	ldr	r0, [pc, #24]	@ (20026820 <mbedtls_sha256+0x98>)
20026806:	4907      	ldr	r1, [pc, #28]	@ (20026824 <mbedtls_sha256+0x9c>)
20026808:	4a07      	ldr	r2, [pc, #28]	@ (20026828 <mbedtls_sha256+0xa0>)
2002680a:	4b08      	ldr	r3, [pc, #32]	@ (2002682c <mbedtls_sha256+0xa4>)
2002680c:	e7d3      	b.n	200267b6 <mbedtls_sha256+0x2e>
2002680e:	bf00      	nop
20026810:	ffc00b31 	.word	0xffc00b31
20026814:	68581511 	.word	0x68581511
20026818:	64f98fa7 	.word	0x64f98fa7
2002681c:	befa4fa4 	.word	0xbefa4fa4
20026820:	510e527f 	.word	0x510e527f
20026824:	9b05688c 	.word	0x9b05688c
20026828:	1f83d9ab 	.word	0x1f83d9ab
2002682c:	5be0cd19 	.word	0x5be0cd19
20026830:	c1059ed8 	.word	0xc1059ed8
20026834:	367cd507 	.word	0x367cd507
20026838:	3070dd17 	.word	0x3070dd17
2002683c:	f70e5939 	.word	0xf70e5939
20026840:	6a09e667 	.word	0x6a09e667
20026844:	bb67ae85 	.word	0xbb67ae85
20026848:	3c6ef372 	.word	0x3c6ef372
2002684c:	a54ff53a 	.word	0xa54ff53a

20026850 <mbedtls_sha512_init>:
20026850:	22d8      	movs	r2, #216	@ 0xd8
20026852:	2100      	movs	r1, #0
20026854:	f003 bff6 	b.w	2002a844 <memset>

20026858 <mbedtls_sha512_free>:
20026858:	b138      	cbz	r0, 2002686a <mbedtls_sha512_free+0x12>
2002685a:	2100      	movs	r1, #0
2002685c:	f100 03d8 	add.w	r3, r0, #216	@ 0xd8
20026860:	4602      	mov	r2, r0
20026862:	3001      	adds	r0, #1
20026864:	4298      	cmp	r0, r3
20026866:	7011      	strb	r1, [r2, #0]
20026868:	d1fa      	bne.n	20026860 <mbedtls_sha512_free+0x8>
2002686a:	4770      	bx	lr

2002686c <mbedtls_sha512_clone>:
2002686c:	b508      	push	{r3, lr}
2002686e:	22d8      	movs	r2, #216	@ 0xd8
20026870:	f004 f802 	bl	2002a878 <memcpy>
20026874:	bd08      	pop	{r3, pc}
	...

20026878 <mbedtls_sha512_starts>:
20026878:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
2002687c:	b381      	cbz	r1, 200268e0 <mbedtls_sha512_starts+0x68>
2002687e:	f20f 0bc8 	addw	fp, pc, #200	@ 0xc8
20026882:	e9db ab00 	ldrd	sl, fp, [fp]
20026886:	f20f 09c8 	addw	r9, pc, #200	@ 0xc8
2002688a:	e9d9 8900 	ldrd	r8, r9, [r9]
2002688e:	a732      	add	r7, pc, #200	@ (adr r7, 20026958 <mbedtls_sha512_starts+0xe0>)
20026890:	e9d7 6700 	ldrd	r6, r7, [r7]
20026894:	a532      	add	r5, pc, #200	@ (adr r5, 20026960 <mbedtls_sha512_starts+0xe8>)
20026896:	e9d5 4500 	ldrd	r4, r5, [r5]
2002689a:	a333      	add	r3, pc, #204	@ (adr r3, 20026968 <mbedtls_sha512_starts+0xf0>)
2002689c:	e9d3 2300 	ldrd	r2, r3, [r3]
200268a0:	ed9f 5b1b 	vldr	d5, [pc, #108]	@ 20026910 <mbedtls_sha512_starts+0x98>
200268a4:	ed9f 6b1c 	vldr	d6, [pc, #112]	@ 20026918 <mbedtls_sha512_starts+0xa0>
200268a8:	ed9f 7b1d 	vldr	d7, [pc, #116]	@ 20026920 <mbedtls_sha512_starts+0xa8>
200268ac:	ed9f 4b1e 	vldr	d4, [pc, #120]	@ 20026928 <mbedtls_sha512_starts+0xb0>
200268b0:	ed80 5b04 	vstr	d5, [r0, #16]
200268b4:	ed80 4b00 	vstr	d4, [r0]
200268b8:	ed80 4b02 	vstr	d4, [r0, #8]
200268bc:	ed80 6b06 	vstr	d6, [r0, #24]
200268c0:	ed80 7b08 	vstr	d7, [r0, #32]
200268c4:	e9c0 ab0a 	strd	sl, fp, [r0, #40]	@ 0x28
200268c8:	e9c0 890c 	strd	r8, r9, [r0, #48]	@ 0x30
200268cc:	e9c0 670e 	strd	r6, r7, [r0, #56]	@ 0x38
200268d0:	e9c0 4510 	strd	r4, r5, [r0, #64]	@ 0x40
200268d4:	e9c0 2312 	strd	r2, r3, [r0, #72]	@ 0x48
200268d8:	f8c0 10d0 	str.w	r1, [r0, #208]	@ 0xd0
200268dc:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
200268e0:	ed9f 5b13 	vldr	d5, [pc, #76]	@ 20026930 <mbedtls_sha512_starts+0xb8>
200268e4:	f20f 0b88 	addw	fp, pc, #136	@ 0x88
200268e8:	e9db ab00 	ldrd	sl, fp, [fp]
200268ec:	f20f 0988 	addw	r9, pc, #136	@ 0x88
200268f0:	e9d9 8900 	ldrd	r8, r9, [r9]
200268f4:	a722      	add	r7, pc, #136	@ (adr r7, 20026980 <mbedtls_sha512_starts+0x108>)
200268f6:	e9d7 6700 	ldrd	r6, r7, [r7]
200268fa:	a523      	add	r5, pc, #140	@ (adr r5, 20026988 <mbedtls_sha512_starts+0x110>)
200268fc:	e9d5 4500 	ldrd	r4, r5, [r5]
20026900:	a323      	add	r3, pc, #140	@ (adr r3, 20026990 <mbedtls_sha512_starts+0x118>)
20026902:	e9d3 2300 	ldrd	r2, r3, [r3]
20026906:	ed9f 6b0c 	vldr	d6, [pc, #48]	@ 20026938 <mbedtls_sha512_starts+0xc0>
2002690a:	ed9f 7b0d 	vldr	d7, [pc, #52]	@ 20026940 <mbedtls_sha512_starts+0xc8>
2002690e:	e7cd      	b.n	200268ac <mbedtls_sha512_starts+0x34>
20026910:	c1059ed8 	.word	0xc1059ed8
20026914:	cbbb9d5d 	.word	0xcbbb9d5d
20026918:	367cd507 	.word	0x367cd507
2002691c:	629a292a 	.word	0x629a292a
20026920:	3070dd17 	.word	0x3070dd17
20026924:	9159015a 	.word	0x9159015a
	...
20026930:	f3bcc908 	.word	0xf3bcc908
20026934:	6a09e667 	.word	0x6a09e667
20026938:	84caa73b 	.word	0x84caa73b
2002693c:	bb67ae85 	.word	0xbb67ae85
20026940:	fe94f82b 	.word	0xfe94f82b
20026944:	3c6ef372 	.word	0x3c6ef372
20026948:	f70e5939 	.word	0xf70e5939
2002694c:	152fecd8 	.word	0x152fecd8
20026950:	ffc00b31 	.word	0xffc00b31
20026954:	67332667 	.word	0x67332667
20026958:	68581511 	.word	0x68581511
2002695c:	8eb44a87 	.word	0x8eb44a87
20026960:	64f98fa7 	.word	0x64f98fa7
20026964:	db0c2e0d 	.word	0xdb0c2e0d
20026968:	befa4fa4 	.word	0xbefa4fa4
2002696c:	47b5481d 	.word	0x47b5481d
20026970:	5f1d36f1 	.word	0x5f1d36f1
20026974:	a54ff53a 	.word	0xa54ff53a
20026978:	ade682d1 	.word	0xade682d1
2002697c:	510e527f 	.word	0x510e527f
20026980:	2b3e6c1f 	.word	0x2b3e6c1f
20026984:	9b05688c 	.word	0x9b05688c
20026988:	fb41bd6b 	.word	0xfb41bd6b
2002698c:	1f83d9ab 	.word	0x1f83d9ab
20026990:	137e2179 	.word	0x137e2179
20026994:	5be0cd19 	.word	0x5be0cd19

20026998 <mbedtls_sha512_process>:
20026998:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
2002699c:	f5ad 7d3f 	sub.w	sp, sp, #764	@ 0x2fc
200269a0:	4682      	mov	sl, r0
200269a2:	a81e      	add	r0, sp, #120	@ 0x78
200269a4:	4604      	mov	r4, r0
200269a6:	f101 0580 	add.w	r5, r1, #128	@ 0x80
200269aa:	784b      	ldrb	r3, [r1, #1]
200269ac:	780a      	ldrb	r2, [r1, #0]
200269ae:	041b      	lsls	r3, r3, #16
200269b0:	790f      	ldrb	r7, [r1, #4]
200269b2:	ea43 6302 	orr.w	r3, r3, r2, lsl #24
200269b6:	79ca      	ldrb	r2, [r1, #7]
200269b8:	788e      	ldrb	r6, [r1, #2]
200269ba:	ea42 6207 	orr.w	r2, r2, r7, lsl #24
200269be:	794f      	ldrb	r7, [r1, #5]
200269c0:	ea43 2306 	orr.w	r3, r3, r6, lsl #8
200269c4:	ea42 4207 	orr.w	r2, r2, r7, lsl #16
200269c8:	78ce      	ldrb	r6, [r1, #3]
200269ca:	798f      	ldrb	r7, [r1, #6]
200269cc:	3108      	adds	r1, #8
200269ce:	ea42 2207 	orr.w	r2, r2, r7, lsl #8
200269d2:	4333      	orrs	r3, r6
200269d4:	428d      	cmp	r5, r1
200269d6:	e9c4 2300 	strd	r2, r3, [r4]
200269da:	f104 0408 	add.w	r4, r4, #8
200269de:	d1e4      	bne.n	200269aa <mbedtls_sha512_process+0x12>
200269e0:	4601      	mov	r1, r0
200269e2:	2610      	movs	r6, #16
200269e4:	e9d1 4c1c 	ldrd	r4, ip, [r1, #112]	@ 0x70
200269e8:	e9d1 2502 	ldrd	r2, r5, [r1, #8]
200269ec:	468e      	mov	lr, r1
200269ee:	0ce3      	lsrs	r3, r4, #19
200269f0:	ea4f 47dc 	mov.w	r7, ip, lsr #19
200269f4:	ea4f 09c4 	mov.w	r9, r4, lsl #3
200269f8:	ea4f 08cc 	mov.w	r8, ip, lsl #3
200269fc:	ea48 7854 	orr.w	r8, r8, r4, lsr #29
20026a00:	ea43 334c 	orr.w	r3, r3, ip, lsl #13
20026a04:	ea47 3744 	orr.w	r7, r7, r4, lsl #13
20026a08:	ea49 795c 	orr.w	r9, r9, ip, lsr #29
20026a0c:	09a4      	lsrs	r4, r4, #6
20026a0e:	ea87 0708 	eor.w	r7, r7, r8
20026a12:	ea44 648c 	orr.w	r4, r4, ip, lsl #26
20026a16:	ea83 0309 	eor.w	r3, r3, r9
20026a1a:	4063      	eors	r3, r4
20026a1c:	ea87 179c 	eor.w	r7, r7, ip, lsr #6
20026a20:	e9de 4c12 	ldrd	r4, ip, [lr, #72]	@ 0x48
20026a24:	e9de 8e00 	ldrd	r8, lr, [lr]
20026a28:	eb14 0408 	adds.w	r4, r4, r8
20026a2c:	eb4c 0c0e 	adc.w	ip, ip, lr
20026a30:	191b      	adds	r3, r3, r4
20026a32:	eb47 070c 	adc.w	r7, r7, ip
20026a36:	0854      	lsrs	r4, r2, #1
20026a38:	ea4f 2812 	mov.w	r8, r2, lsr #8
20026a3c:	ea4f 0c55 	mov.w	ip, r5, lsr #1
20026a40:	ea4f 2e15 	mov.w	lr, r5, lsr #8
20026a44:	ea4c 7cc2 	orr.w	ip, ip, r2, lsl #31
20026a48:	ea4e 6e02 	orr.w	lr, lr, r2, lsl #24
20026a4c:	ea44 74c5 	orr.w	r4, r4, r5, lsl #31
20026a50:	ea48 6805 	orr.w	r8, r8, r5, lsl #24
20026a54:	09d2      	lsrs	r2, r2, #7
20026a56:	ea84 0408 	eor.w	r4, r4, r8
20026a5a:	ea42 6245 	orr.w	r2, r2, r5, lsl #25
20026a5e:	4062      	eors	r2, r4
20026a60:	ea8c 0c0e 	eor.w	ip, ip, lr
20026a64:	189b      	adds	r3, r3, r2
20026a66:	ea8c 14d5 	eor.w	r4, ip, r5, lsr #7
20026a6a:	f106 0601 	add.w	r6, r6, #1
20026a6e:	eb47 0704 	adc.w	r7, r7, r4
20026a72:	3108      	adds	r1, #8
20026a74:	2e50      	cmp	r6, #80	@ 0x50
20026a76:	e9c1 371e 	strd	r3, r7, [r1, #120]	@ 0x78
20026a7a:	d1b3      	bne.n	200269e4 <mbedtls_sha512_process+0x4c>
20026a7c:	f8da 3010 	ldr.w	r3, [sl, #16]
20026a80:	930e      	str	r3, [sp, #56]	@ 0x38
20026a82:	f8da 3014 	ldr.w	r3, [sl, #20]
20026a86:	930f      	str	r3, [sp, #60]	@ 0x3c
20026a88:	f8da 3018 	ldr.w	r3, [sl, #24]
20026a8c:	9310      	str	r3, [sp, #64]	@ 0x40
20026a8e:	f8da 301c 	ldr.w	r3, [sl, #28]
20026a92:	9311      	str	r3, [sp, #68]	@ 0x44
20026a94:	f8da 3020 	ldr.w	r3, [sl, #32]
20026a98:	9312      	str	r3, [sp, #72]	@ 0x48
20026a9a:	f8da 3024 	ldr.w	r3, [sl, #36]	@ 0x24
20026a9e:	9313      	str	r3, [sp, #76]	@ 0x4c
20026aa0:	f8da 3028 	ldr.w	r3, [sl, #40]	@ 0x28
20026aa4:	9314      	str	r3, [sp, #80]	@ 0x50
20026aa6:	f8da 302c 	ldr.w	r3, [sl, #44]	@ 0x2c
20026aaa:	9315      	str	r3, [sp, #84]	@ 0x54
20026aac:	f8da 3030 	ldr.w	r3, [sl, #48]	@ 0x30
20026ab0:	9316      	str	r3, [sp, #88]	@ 0x58
20026ab2:	f8da 3034 	ldr.w	r3, [sl, #52]	@ 0x34
20026ab6:	9317      	str	r3, [sp, #92]	@ 0x5c
20026ab8:	f8da 3038 	ldr.w	r3, [sl, #56]	@ 0x38
20026abc:	9318      	str	r3, [sp, #96]	@ 0x60
20026abe:	f8da 303c 	ldr.w	r3, [sl, #60]	@ 0x3c
20026ac2:	9319      	str	r3, [sp, #100]	@ 0x64
20026ac4:	f8da 3040 	ldr.w	r3, [sl, #64]	@ 0x40
20026ac8:	931a      	str	r3, [sp, #104]	@ 0x68
20026aca:	f8da 3044 	ldr.w	r3, [sl, #68]	@ 0x44
20026ace:	931b      	str	r3, [sp, #108]	@ 0x6c
20026ad0:	f8da 3048 	ldr.w	r3, [sl, #72]	@ 0x48
20026ad4:	931c      	str	r3, [sp, #112]	@ 0x70
20026ad6:	f8da 304c 	ldr.w	r3, [sl, #76]	@ 0x4c
20026ada:	931d      	str	r3, [sp, #116]	@ 0x74
20026adc:	4b0f      	ldr	r3, [pc, #60]	@ (20026b1c <mbedtls_sha512_process+0x184>)
20026ade:	9300      	str	r3, [sp, #0]
20026ae0:	9b1c      	ldr	r3, [sp, #112]	@ 0x70
20026ae2:	f8dd b054 	ldr.w	fp, [sp, #84]	@ 0x54
20026ae6:	930a      	str	r3, [sp, #40]	@ 0x28
20026ae8:	9b1d      	ldr	r3, [sp, #116]	@ 0x74
20026aea:	e9dd ce10 	ldrd	ip, lr, [sp, #64]	@ 0x40
20026aee:	930b      	str	r3, [sp, #44]	@ 0x2c
20026af0:	9b1a      	ldr	r3, [sp, #104]	@ 0x68
20026af2:	9308      	str	r3, [sp, #32]
20026af4:	9b1b      	ldr	r3, [sp, #108]	@ 0x6c
20026af6:	9309      	str	r3, [sp, #36]	@ 0x24
20026af8:	9b18      	ldr	r3, [sp, #96]	@ 0x60
20026afa:	9306      	str	r3, [sp, #24]
20026afc:	9b19      	ldr	r3, [sp, #100]	@ 0x64
20026afe:	9307      	str	r3, [sp, #28]
20026b00:	9b16      	ldr	r3, [sp, #88]	@ 0x58
20026b02:	9304      	str	r3, [sp, #16]
20026b04:	9b17      	ldr	r3, [sp, #92]	@ 0x5c
20026b06:	9305      	str	r3, [sp, #20]
20026b08:	9b14      	ldr	r3, [sp, #80]	@ 0x50
20026b0a:	9303      	str	r3, [sp, #12]
20026b0c:	9b12      	ldr	r3, [sp, #72]	@ 0x48
20026b0e:	9301      	str	r3, [sp, #4]
20026b10:	9b13      	ldr	r3, [sp, #76]	@ 0x4c
20026b12:	9302      	str	r3, [sp, #8]
20026b14:	e9dd 320e 	ldrd	r3, r2, [sp, #56]	@ 0x38
20026b18:	e002      	b.n	20026b20 <mbedtls_sha512_process+0x188>
20026b1a:	bf00      	nop
20026b1c:	2002bf50 	.word	0x2002bf50
20026b20:	9c04      	ldr	r4, [sp, #16]
20026b22:	9e04      	ldr	r6, [sp, #16]
20026b24:	ea4f 3894 	mov.w	r8, r4, lsr #14
20026b28:	9c05      	ldr	r4, [sp, #20]
20026b2a:	9900      	ldr	r1, [sp, #0]
20026b2c:	ea48 4884 	orr.w	r8, r8, r4, lsl #18
20026b30:	ea4f 3994 	mov.w	r9, r4, lsr #14
20026b34:	9c04      	ldr	r4, [sp, #16]
20026b36:	ea49 4984 	orr.w	r9, r9, r4, lsl #18
20026b3a:	0ca5      	lsrs	r5, r4, #18
20026b3c:	9c05      	ldr	r4, [sp, #20]
20026b3e:	ea45 3584 	orr.w	r5, r5, r4, lsl #14
20026b42:	0ca4      	lsrs	r4, r4, #18
20026b44:	ea44 3486 	orr.w	r4, r4, r6, lsl #14
20026b48:	ea89 0904 	eor.w	r9, r9, r4
20026b4c:	9c05      	ldr	r4, [sp, #20]
20026b4e:	ea88 0805 	eor.w	r8, r8, r5
20026b52:	05f5      	lsls	r5, r6, #23
20026b54:	ea45 2554 	orr.w	r5, r5, r4, lsr #9
20026b58:	05e4      	lsls	r4, r4, #23
20026b5a:	ea44 2456 	orr.w	r4, r4, r6, lsr #9
20026b5e:	ea88 0805 	eor.w	r8, r8, r5
20026b62:	ea89 0904 	eor.w	r9, r9, r4
20026b66:	e9d1 5700 	ldrd	r5, r7, [r1]
20026b6a:	e9d0 6400 	ldrd	r6, r4, [r0]
20026b6e:	19ad      	adds	r5, r5, r6
20026b70:	eb47 0404 	adc.w	r4, r7, r4
20026b74:	9e06      	ldr	r6, [sp, #24]
20026b76:	9f08      	ldr	r7, [sp, #32]
20026b78:	9909      	ldr	r1, [sp, #36]	@ 0x24
20026b7a:	407e      	eors	r6, r7
20026b7c:	9f07      	ldr	r7, [sp, #28]
20026b7e:	eb18 0505 	adds.w	r5, r8, r5
20026b82:	ea87 0701 	eor.w	r7, r7, r1
20026b86:	9904      	ldr	r1, [sp, #16]
20026b88:	eb49 0404 	adc.w	r4, r9, r4
20026b8c:	400e      	ands	r6, r1
20026b8e:	9905      	ldr	r1, [sp, #20]
20026b90:	ea4f 7813 	mov.w	r8, r3, lsr #28
20026b94:	400f      	ands	r7, r1
20026b96:	9908      	ldr	r1, [sp, #32]
20026b98:	ea4f 7983 	mov.w	r9, r3, lsl #30
20026b9c:	404e      	eors	r6, r1
20026b9e:	9909      	ldr	r1, [sp, #36]	@ 0x24
20026ba0:	19ad      	adds	r5, r5, r6
20026ba2:	ea87 0701 	eor.w	r7, r7, r1
20026ba6:	990a      	ldr	r1, [sp, #40]	@ 0x28
20026ba8:	eb44 0407 	adc.w	r4, r4, r7
20026bac:	186d      	adds	r5, r5, r1
20026bae:	990b      	ldr	r1, [sp, #44]	@ 0x2c
20026bb0:	ea4f 7712 	mov.w	r7, r2, lsr #28
20026bb4:	eb41 0404 	adc.w	r4, r1, r4
20026bb8:	9903      	ldr	r1, [sp, #12]
20026bba:	0796      	lsls	r6, r2, #30
20026bbc:	1949      	adds	r1, r1, r5
20026bbe:	ea46 0693 	orr.w	r6, r6, r3, lsr #2
20026bc2:	ea47 1703 	orr.w	r7, r7, r3, lsl #4
20026bc6:	910a      	str	r1, [sp, #40]	@ 0x28
20026bc8:	ea87 0706 	eor.w	r7, r7, r6
20026bcc:	eb4b 0104 	adc.w	r1, fp, r4
20026bd0:	0656      	lsls	r6, r2, #25
20026bd2:	ea49 0992 	orr.w	r9, r9, r2, lsr #2
20026bd6:	ea46 16d3 	orr.w	r6, r6, r3, lsr #7
20026bda:	910b      	str	r1, [sp, #44]	@ 0x2c
20026bdc:	ea48 1802 	orr.w	r8, r8, r2, lsl #4
20026be0:	9901      	ldr	r1, [sp, #4]
20026be2:	ea88 0809 	eor.w	r8, r8, r9
20026be6:	4077      	eors	r7, r6
20026be8:	ea4f 6943 	mov.w	r9, r3, lsl #25
20026bec:	ea43 060c 	orr.w	r6, r3, ip
20026bf0:	ea49 19d2 	orr.w	r9, r9, r2, lsr #7
20026bf4:	400e      	ands	r6, r1
20026bf6:	9902      	ldr	r1, [sp, #8]
20026bf8:	ea03 0b0c 	and.w	fp, r3, ip
20026bfc:	ea88 0809 	eor.w	r8, r8, r9
20026c00:	ea42 090e 	orr.w	r9, r2, lr
20026c04:	ea09 0901 	and.w	r9, r9, r1
20026c08:	ea46 060b 	orr.w	r6, r6, fp
20026c0c:	ea02 010e 	and.w	r1, r2, lr
20026c10:	eb18 0606 	adds.w	r6, r8, r6
20026c14:	ea49 0901 	orr.w	r9, r9, r1
20026c18:	eb47 0709 	adc.w	r7, r7, r9
20026c1c:	1971      	adds	r1, r6, r5
20026c1e:	9103      	str	r1, [sp, #12]
20026c20:	9900      	ldr	r1, [sp, #0]
20026c22:	eb44 0b07 	adc.w	fp, r4, r7
20026c26:	e9d0 6702 	ldrd	r6, r7, [r0, #8]
20026c2a:	e9d1 4502 	ldrd	r4, r5, [r1, #8]
20026c2e:	9908      	ldr	r1, [sp, #32]
20026c30:	19a4      	adds	r4, r4, r6
20026c32:	eb45 0507 	adc.w	r5, r5, r7
20026c36:	1864      	adds	r4, r4, r1
20026c38:	9909      	ldr	r1, [sp, #36]	@ 0x24
20026c3a:	9e06      	ldr	r6, [sp, #24]
20026c3c:	eb41 0505 	adc.w	r5, r1, r5
20026c40:	9904      	ldr	r1, [sp, #16]
20026c42:	ea81 0706 	eor.w	r7, r1, r6
20026c46:	9905      	ldr	r1, [sp, #20]
20026c48:	9e07      	ldr	r6, [sp, #28]
20026c4a:	404e      	eors	r6, r1
20026c4c:	990a      	ldr	r1, [sp, #40]	@ 0x28
20026c4e:	400f      	ands	r7, r1
20026c50:	990b      	ldr	r1, [sp, #44]	@ 0x2c
20026c52:	400e      	ands	r6, r1
20026c54:	9906      	ldr	r1, [sp, #24]
20026c56:	404f      	eors	r7, r1
20026c58:	9907      	ldr	r1, [sp, #28]
20026c5a:	19e4      	adds	r4, r4, r7
20026c5c:	ea86 0601 	eor.w	r6, r6, r1
20026c60:	990a      	ldr	r1, [sp, #40]	@ 0x28
20026c62:	eb45 0506 	adc.w	r5, r5, r6
20026c66:	0b8f      	lsrs	r7, r1, #14
20026c68:	990b      	ldr	r1, [sp, #44]	@ 0x2c
20026c6a:	ea47 4781 	orr.w	r7, r7, r1, lsl #18
20026c6e:	ea4f 3891 	mov.w	r8, r1, lsr #14
20026c72:	990a      	ldr	r1, [sp, #40]	@ 0x28
20026c74:	ea48 4881 	orr.w	r8, r8, r1, lsl #18
20026c78:	ea4f 4991 	mov.w	r9, r1, lsr #18
20026c7c:	990b      	ldr	r1, [sp, #44]	@ 0x2c
20026c7e:	ea49 3981 	orr.w	r9, r9, r1, lsl #14
20026c82:	0c8e      	lsrs	r6, r1, #18
20026c84:	990a      	ldr	r1, [sp, #40]	@ 0x28
20026c86:	ea87 0709 	eor.w	r7, r7, r9
20026c8a:	ea46 3681 	orr.w	r6, r6, r1, lsl #14
20026c8e:	ea88 0806 	eor.w	r8, r8, r6
20026c92:	05ce      	lsls	r6, r1, #23
20026c94:	990b      	ldr	r1, [sp, #44]	@ 0x2c
20026c96:	ea46 2651 	orr.w	r6, r6, r1, lsr #9
20026c9a:	ea4f 59c1 	mov.w	r9, r1, lsl #23
20026c9e:	990a      	ldr	r1, [sp, #40]	@ 0x28
20026ca0:	407e      	eors	r6, r7
20026ca2:	ea49 2951 	orr.w	r9, r9, r1, lsr #9
20026ca6:	9901      	ldr	r1, [sp, #4]
20026ca8:	19a4      	adds	r4, r4, r6
20026caa:	ea88 0809 	eor.w	r8, r8, r9
20026cae:	eb45 0808 	adc.w	r8, r5, r8
20026cb2:	1909      	adds	r1, r1, r4
20026cb4:	9108      	str	r1, [sp, #32]
20026cb6:	9902      	ldr	r1, [sp, #8]
20026cb8:	ea4f 761b 	mov.w	r6, fp, lsr #28
20026cbc:	eb41 0108 	adc.w	r1, r1, r8
20026cc0:	9109      	str	r1, [sp, #36]	@ 0x24
20026cc2:	9903      	ldr	r1, [sp, #12]
20026cc4:	ea4f 758b 	mov.w	r5, fp, lsl #30
20026cc8:	ea45 0591 	orr.w	r5, r5, r1, lsr #2
20026ccc:	0f0f      	lsrs	r7, r1, #28
20026cce:	ea46 1601 	orr.w	r6, r6, r1, lsl #4
20026cd2:	ea4f 7981 	mov.w	r9, r1, lsl #30
20026cd6:	ea49 099b 	orr.w	r9, r9, fp, lsr #2
20026cda:	ea47 170b 	orr.w	r7, r7, fp, lsl #4
20026cde:	406e      	eors	r6, r5
20026ce0:	ea4f 654b 	mov.w	r5, fp, lsl #25
20026ce4:	ea45 15d1 	orr.w	r5, r5, r1, lsr #7
20026ce8:	ea87 0709 	eor.w	r7, r7, r9
20026cec:	ea4f 6941 	mov.w	r9, r1, lsl #25
20026cf0:	ea49 19db 	orr.w	r9, r9, fp, lsr #7
20026cf4:	406e      	eors	r6, r5
20026cf6:	ea43 0501 	orr.w	r5, r3, r1
20026cfa:	ea87 0709 	eor.w	r7, r7, r9
20026cfe:	4019      	ands	r1, r3
20026d00:	ea42 090b 	orr.w	r9, r2, fp
20026d04:	ea05 050c 	and.w	r5, r5, ip
20026d08:	ea09 090e 	and.w	r9, r9, lr
20026d0c:	430d      	orrs	r5, r1
20026d0e:	ea02 010b 	and.w	r1, r2, fp
20026d12:	197d      	adds	r5, r7, r5
20026d14:	ea49 0901 	orr.w	r9, r9, r1
20026d18:	eb46 0609 	adc.w	r6, r6, r9
20026d1c:	1929      	adds	r1, r5, r4
20026d1e:	9101      	str	r1, [sp, #4]
20026d20:	eb48 0106 	adc.w	r1, r8, r6
20026d24:	9102      	str	r1, [sp, #8]
20026d26:	9900      	ldr	r1, [sp, #0]
20026d28:	e9d0 6704 	ldrd	r6, r7, [r0, #16]
20026d2c:	e9d1 4504 	ldrd	r4, r5, [r1, #16]
20026d30:	9906      	ldr	r1, [sp, #24]
20026d32:	19a4      	adds	r4, r4, r6
20026d34:	eb45 0507 	adc.w	r5, r5, r7
20026d38:	1864      	adds	r4, r4, r1
20026d3a:	9907      	ldr	r1, [sp, #28]
20026d3c:	eb41 0505 	adc.w	r5, r1, r5
20026d40:	9904      	ldr	r1, [sp, #16]
20026d42:	9e0a      	ldr	r6, [sp, #40]	@ 0x28
20026d44:	ea81 0706 	eor.w	r7, r1, r6
20026d48:	9905      	ldr	r1, [sp, #20]
20026d4a:	9e0b      	ldr	r6, [sp, #44]	@ 0x2c
20026d4c:	404e      	eors	r6, r1
20026d4e:	9908      	ldr	r1, [sp, #32]
20026d50:	400f      	ands	r7, r1
20026d52:	9909      	ldr	r1, [sp, #36]	@ 0x24
20026d54:	400e      	ands	r6, r1
20026d56:	9904      	ldr	r1, [sp, #16]
20026d58:	404f      	eors	r7, r1
20026d5a:	9905      	ldr	r1, [sp, #20]
20026d5c:	19e4      	adds	r4, r4, r7
20026d5e:	ea86 0601 	eor.w	r6, r6, r1
20026d62:	9908      	ldr	r1, [sp, #32]
20026d64:	eb45 0506 	adc.w	r5, r5, r6
20026d68:	0b8f      	lsrs	r7, r1, #14
20026d6a:	9909      	ldr	r1, [sp, #36]	@ 0x24
20026d6c:	ea47 4781 	orr.w	r7, r7, r1, lsl #18
20026d70:	ea4f 3891 	mov.w	r8, r1, lsr #14
20026d74:	9908      	ldr	r1, [sp, #32]
20026d76:	ea48 4881 	orr.w	r8, r8, r1, lsl #18
20026d7a:	ea4f 4991 	mov.w	r9, r1, lsr #18
20026d7e:	9909      	ldr	r1, [sp, #36]	@ 0x24
20026d80:	ea49 3981 	orr.w	r9, r9, r1, lsl #14
20026d84:	0c8e      	lsrs	r6, r1, #18
20026d86:	9908      	ldr	r1, [sp, #32]
20026d88:	ea87 0709 	eor.w	r7, r7, r9
20026d8c:	ea46 3681 	orr.w	r6, r6, r1, lsl #14
20026d90:	ea88 0806 	eor.w	r8, r8, r6
20026d94:	05ce      	lsls	r6, r1, #23
20026d96:	9909      	ldr	r1, [sp, #36]	@ 0x24
20026d98:	ea46 2651 	orr.w	r6, r6, r1, lsr #9
20026d9c:	ea4f 59c1 	mov.w	r9, r1, lsl #23
20026da0:	9908      	ldr	r1, [sp, #32]
20026da2:	407e      	eors	r6, r7
20026da4:	ea49 2951 	orr.w	r9, r9, r1, lsr #9
20026da8:	19a4      	adds	r4, r4, r6
20026daa:	ea88 0809 	eor.w	r8, r8, r9
20026dae:	eb45 0808 	adc.w	r8, r5, r8
20026db2:	eb1c 0104 	adds.w	r1, ip, r4
20026db6:	9106      	str	r1, [sp, #24]
20026db8:	eb4e 0108 	adc.w	r1, lr, r8
20026dbc:	9107      	str	r1, [sp, #28]
20026dbe:	9901      	ldr	r1, [sp, #4]
20026dc0:	0f0f      	lsrs	r7, r1, #28
20026dc2:	9902      	ldr	r1, [sp, #8]
20026dc4:	ea47 1701 	orr.w	r7, r7, r1, lsl #4
20026dc8:	0f0e      	lsrs	r6, r1, #28
20026dca:	9901      	ldr	r1, [sp, #4]
20026dcc:	ea46 1601 	orr.w	r6, r6, r1, lsl #4
20026dd0:	ea4f 7c81 	mov.w	ip, r1, lsl #30
20026dd4:	9902      	ldr	r1, [sp, #8]
20026dd6:	ea4c 0c91 	orr.w	ip, ip, r1, lsr #2
20026dda:	078d      	lsls	r5, r1, #30
20026ddc:	9901      	ldr	r1, [sp, #4]
20026dde:	ea87 070c 	eor.w	r7, r7, ip
20026de2:	ea45 0591 	orr.w	r5, r5, r1, lsr #2
20026de6:	ea4f 6c41 	mov.w	ip, r1, lsl #25
20026dea:	9902      	ldr	r1, [sp, #8]
20026dec:	406e      	eors	r6, r5
20026dee:	ea4c 1cd1 	orr.w	ip, ip, r1, lsr #7
20026df2:	064d      	lsls	r5, r1, #25
20026df4:	9901      	ldr	r1, [sp, #4]
20026df6:	ea87 070c 	eor.w	r7, r7, ip
20026dfa:	ea45 15d1 	orr.w	r5, r5, r1, lsr #7
20026dfe:	406e      	eors	r6, r5
20026e00:	9903      	ldr	r1, [sp, #12]
20026e02:	9d01      	ldr	r5, [sp, #4]
20026e04:	430d      	orrs	r5, r1
20026e06:	9902      	ldr	r1, [sp, #8]
20026e08:	ea4b 0c01 	orr.w	ip, fp, r1
20026e0c:	ea05 0103 	and.w	r1, r5, r3
20026e10:	910c      	str	r1, [sp, #48]	@ 0x30
20026e12:	9d01      	ldr	r5, [sp, #4]
20026e14:	9903      	ldr	r1, [sp, #12]
20026e16:	ea0c 0c02 	and.w	ip, ip, r2
20026e1a:	ea01 0905 	and.w	r9, r1, r5
20026e1e:	9902      	ldr	r1, [sp, #8]
20026e20:	ea0b 0e01 	and.w	lr, fp, r1
20026e24:	990c      	ldr	r1, [sp, #48]	@ 0x30
20026e26:	ea4c 0c0e 	orr.w	ip, ip, lr
20026e2a:	ea41 0509 	orr.w	r5, r1, r9
20026e2e:	9900      	ldr	r1, [sp, #0]
20026e30:	197d      	adds	r5, r7, r5
20026e32:	eb46 060c 	adc.w	r6, r6, ip
20026e36:	eb15 0904 	adds.w	r9, r5, r4
20026e3a:	e9d1 4506 	ldrd	r4, r5, [r1, #24]
20026e3e:	9904      	ldr	r1, [sp, #16]
20026e40:	eb48 0806 	adc.w	r8, r8, r6
20026e44:	e9d0 6706 	ldrd	r6, r7, [r0, #24]
20026e48:	19a4      	adds	r4, r4, r6
20026e4a:	eb45 0507 	adc.w	r5, r5, r7
20026e4e:	1864      	adds	r4, r4, r1
20026e50:	9905      	ldr	r1, [sp, #20]
20026e52:	9e08      	ldr	r6, [sp, #32]
20026e54:	eb41 0505 	adc.w	r5, r1, r5
20026e58:	990a      	ldr	r1, [sp, #40]	@ 0x28
20026e5a:	ea81 0706 	eor.w	r7, r1, r6
20026e5e:	990b      	ldr	r1, [sp, #44]	@ 0x2c
20026e60:	9e09      	ldr	r6, [sp, #36]	@ 0x24
20026e62:	404e      	eors	r6, r1
20026e64:	9906      	ldr	r1, [sp, #24]
20026e66:	400f      	ands	r7, r1
20026e68:	9907      	ldr	r1, [sp, #28]
20026e6a:	400e      	ands	r6, r1
20026e6c:	990a      	ldr	r1, [sp, #40]	@ 0x28
20026e6e:	404f      	eors	r7, r1
20026e70:	990b      	ldr	r1, [sp, #44]	@ 0x2c
20026e72:	19e4      	adds	r4, r4, r7
20026e74:	ea86 0601 	eor.w	r6, r6, r1
20026e78:	9906      	ldr	r1, [sp, #24]
20026e7a:	eb45 0506 	adc.w	r5, r5, r6
20026e7e:	ea4f 3c91 	mov.w	ip, r1, lsr #14
20026e82:	9907      	ldr	r1, [sp, #28]
20026e84:	ea4c 4c81 	orr.w	ip, ip, r1, lsl #18
20026e88:	0b8e      	lsrs	r6, r1, #14
20026e8a:	9906      	ldr	r1, [sp, #24]
20026e8c:	ea46 4681 	orr.w	r6, r6, r1, lsl #18
20026e90:	ea4f 4e91 	mov.w	lr, r1, lsr #18
20026e94:	9907      	ldr	r1, [sp, #28]
20026e96:	ea4e 3e81 	orr.w	lr, lr, r1, lsl #14
20026e9a:	0c8f      	lsrs	r7, r1, #18
20026e9c:	9906      	ldr	r1, [sp, #24]
20026e9e:	ea8c 0c0e 	eor.w	ip, ip, lr
20026ea2:	ea47 3781 	orr.w	r7, r7, r1, lsl #14
20026ea6:	407e      	eors	r6, r7
20026ea8:	05cf      	lsls	r7, r1, #23
20026eaa:	9907      	ldr	r1, [sp, #28]
20026eac:	ea47 2751 	orr.w	r7, r7, r1, lsr #9
20026eb0:	ea4f 5ec1 	mov.w	lr, r1, lsl #23
20026eb4:	9906      	ldr	r1, [sp, #24]
20026eb6:	ea8c 0707 	eor.w	r7, ip, r7
20026eba:	ea4e 2e51 	orr.w	lr, lr, r1, lsr #9
20026ebe:	19e4      	adds	r4, r4, r7
20026ec0:	ea86 060e 	eor.w	r6, r6, lr
20026ec4:	eb45 0606 	adc.w	r6, r5, r6
20026ec8:	191b      	adds	r3, r3, r4
20026eca:	930c      	str	r3, [sp, #48]	@ 0x30
20026ecc:	eb42 0306 	adc.w	r3, r2, r6
20026ed0:	930d      	str	r3, [sp, #52]	@ 0x34
20026ed2:	ea4f 7218 	mov.w	r2, r8, lsr #28
20026ed6:	ea4f 7388 	mov.w	r3, r8, lsl #30
20026eda:	ea43 0399 	orr.w	r3, r3, r9, lsr #2
20026ede:	ea4f 7519 	mov.w	r5, r9, lsr #28
20026ee2:	ea42 1209 	orr.w	r2, r2, r9, lsl #4
20026ee6:	ea4f 7789 	mov.w	r7, r9, lsl #30
20026eea:	ea47 0798 	orr.w	r7, r7, r8, lsr #2
20026eee:	ea45 1508 	orr.w	r5, r5, r8, lsl #4
20026ef2:	405a      	eors	r2, r3
20026ef4:	ea4f 6348 	mov.w	r3, r8, lsl #25
20026ef8:	9902      	ldr	r1, [sp, #8]
20026efa:	ea43 13d9 	orr.w	r3, r3, r9, lsr #7
20026efe:	407d      	eors	r5, r7
20026f00:	ea4f 6749 	mov.w	r7, r9, lsl #25
20026f04:	ea47 17d8 	orr.w	r7, r7, r8, lsr #7
20026f08:	405a      	eors	r2, r3
20026f0a:	9b01      	ldr	r3, [sp, #4]
20026f0c:	407d      	eors	r5, r7
20026f0e:	ea41 0708 	orr.w	r7, r1, r8
20026f12:	9903      	ldr	r1, [sp, #12]
20026f14:	ea43 0309 	orr.w	r3, r3, r9
20026f18:	400b      	ands	r3, r1
20026f1a:	9901      	ldr	r1, [sp, #4]
20026f1c:	ea07 070b 	and.w	r7, r7, fp
20026f20:	ea01 0e09 	and.w	lr, r1, r9
20026f24:	9902      	ldr	r1, [sp, #8]
20026f26:	ea43 030e 	orr.w	r3, r3, lr
20026f2a:	ea01 0c08 	and.w	ip, r1, r8
20026f2e:	ea47 070c 	orr.w	r7, r7, ip
20026f32:	18eb      	adds	r3, r5, r3
20026f34:	eb42 0207 	adc.w	r2, r2, r7
20026f38:	191b      	adds	r3, r3, r4
20026f3a:	9304      	str	r3, [sp, #16]
20026f3c:	eb46 0302 	adc.w	r3, r6, r2
20026f40:	9305      	str	r3, [sp, #20]
20026f42:	9b00      	ldr	r3, [sp, #0]
20026f44:	6a1b      	ldr	r3, [r3, #32]
20026f46:	9a00      	ldr	r2, [sp, #0]
20026f48:	990a      	ldr	r1, [sp, #40]	@ 0x28
20026f4a:	6a52      	ldr	r2, [r2, #36]	@ 0x24
20026f4c:	e9d0 4508 	ldrd	r4, r5, [r0, #32]
20026f50:	191b      	adds	r3, r3, r4
20026f52:	eb42 0205 	adc.w	r2, r2, r5
20026f56:	185b      	adds	r3, r3, r1
20026f58:	990b      	ldr	r1, [sp, #44]	@ 0x2c
20026f5a:	9c06      	ldr	r4, [sp, #24]
20026f5c:	eb41 0202 	adc.w	r2, r1, r2
20026f60:	9908      	ldr	r1, [sp, #32]
20026f62:	ea81 0504 	eor.w	r5, r1, r4
20026f66:	9909      	ldr	r1, [sp, #36]	@ 0x24
20026f68:	9c07      	ldr	r4, [sp, #28]
20026f6a:	404c      	eors	r4, r1
20026f6c:	990c      	ldr	r1, [sp, #48]	@ 0x30
20026f6e:	400d      	ands	r5, r1
20026f70:	990d      	ldr	r1, [sp, #52]	@ 0x34
20026f72:	400c      	ands	r4, r1
20026f74:	9908      	ldr	r1, [sp, #32]
20026f76:	404d      	eors	r5, r1
20026f78:	9909      	ldr	r1, [sp, #36]	@ 0x24
20026f7a:	195b      	adds	r3, r3, r5
20026f7c:	ea84 0401 	eor.w	r4, r4, r1
20026f80:	990c      	ldr	r1, [sp, #48]	@ 0x30
20026f82:	eb42 0204 	adc.w	r2, r2, r4
20026f86:	0b8e      	lsrs	r6, r1, #14
20026f88:	990d      	ldr	r1, [sp, #52]	@ 0x34
20026f8a:	ea46 4681 	orr.w	r6, r6, r1, lsl #18
20026f8e:	0b8c      	lsrs	r4, r1, #14
20026f90:	990c      	ldr	r1, [sp, #48]	@ 0x30
20026f92:	ea44 4481 	orr.w	r4, r4, r1, lsl #18
20026f96:	0c8f      	lsrs	r7, r1, #18
20026f98:	990d      	ldr	r1, [sp, #52]	@ 0x34
20026f9a:	ea47 3781 	orr.w	r7, r7, r1, lsl #14
20026f9e:	0c8d      	lsrs	r5, r1, #18
20026fa0:	990c      	ldr	r1, [sp, #48]	@ 0x30
20026fa2:	407e      	eors	r6, r7
20026fa4:	ea45 3581 	orr.w	r5, r5, r1, lsl #14
20026fa8:	406c      	eors	r4, r5
20026faa:	05cd      	lsls	r5, r1, #23
20026fac:	990d      	ldr	r1, [sp, #52]	@ 0x34
20026fae:	ea45 2551 	orr.w	r5, r5, r1, lsr #9
20026fb2:	05cf      	lsls	r7, r1, #23
20026fb4:	990c      	ldr	r1, [sp, #48]	@ 0x30
20026fb6:	4075      	eors	r5, r6
20026fb8:	ea47 2751 	orr.w	r7, r7, r1, lsr #9
20026fbc:	9903      	ldr	r1, [sp, #12]
20026fbe:	195b      	adds	r3, r3, r5
20026fc0:	ea84 0407 	eor.w	r4, r4, r7
20026fc4:	eb42 0204 	adc.w	r2, r2, r4
20026fc8:	18c9      	adds	r1, r1, r3
20026fca:	910a      	str	r1, [sp, #40]	@ 0x28
20026fcc:	eb4b 0102 	adc.w	r1, fp, r2
20026fd0:	910b      	str	r1, [sp, #44]	@ 0x2c
20026fd2:	9904      	ldr	r1, [sp, #16]
20026fd4:	0f0e      	lsrs	r6, r1, #28
20026fd6:	9905      	ldr	r1, [sp, #20]
20026fd8:	ea46 1601 	orr.w	r6, r6, r1, lsl #4
20026fdc:	0f0d      	lsrs	r5, r1, #28
20026fde:	9904      	ldr	r1, [sp, #16]
20026fe0:	ea45 1501 	orr.w	r5, r5, r1, lsl #4
20026fe4:	078f      	lsls	r7, r1, #30
20026fe6:	9905      	ldr	r1, [sp, #20]
20026fe8:	ea47 0791 	orr.w	r7, r7, r1, lsr #2
20026fec:	078c      	lsls	r4, r1, #30
20026fee:	9904      	ldr	r1, [sp, #16]
20026ff0:	407e      	eors	r6, r7
20026ff2:	ea44 0491 	orr.w	r4, r4, r1, lsr #2
20026ff6:	064f      	lsls	r7, r1, #25
20026ff8:	9905      	ldr	r1, [sp, #20]
20026ffa:	4065      	eors	r5, r4
20026ffc:	ea47 17d1 	orr.w	r7, r7, r1, lsr #7
20027000:	064c      	lsls	r4, r1, #25
20027002:	9904      	ldr	r1, [sp, #16]
20027004:	407e      	eors	r6, r7
20027006:	ea44 14d1 	orr.w	r4, r4, r1, lsr #7
2002700a:	4065      	eors	r5, r4
2002700c:	ea49 0401 	orr.w	r4, r9, r1
20027010:	9905      	ldr	r1, [sp, #20]
20027012:	ea48 0701 	orr.w	r7, r8, r1
20027016:	9901      	ldr	r1, [sp, #4]
20027018:	400c      	ands	r4, r1
2002701a:	9902      	ldr	r1, [sp, #8]
2002701c:	400f      	ands	r7, r1
2002701e:	9904      	ldr	r1, [sp, #16]
20027020:	ea09 0e01 	and.w	lr, r9, r1
20027024:	9905      	ldr	r1, [sp, #20]
20027026:	ea44 040e 	orr.w	r4, r4, lr
2002702a:	ea08 0c01 	and.w	ip, r8, r1
2002702e:	1934      	adds	r4, r6, r4
20027030:	ea47 070c 	orr.w	r7, r7, ip
20027034:	eb45 0507 	adc.w	r5, r5, r7
20027038:	18e3      	adds	r3, r4, r3
2002703a:	9303      	str	r3, [sp, #12]
2002703c:	9b00      	ldr	r3, [sp, #0]
2002703e:	eb42 0b05 	adc.w	fp, r2, r5
20027042:	9a00      	ldr	r2, [sp, #0]
20027044:	6a9b      	ldr	r3, [r3, #40]	@ 0x28
20027046:	9908      	ldr	r1, [sp, #32]
20027048:	6ad2      	ldr	r2, [r2, #44]	@ 0x2c
2002704a:	e9d0 450a 	ldrd	r4, r5, [r0, #40]	@ 0x28
2002704e:	191b      	adds	r3, r3, r4
20027050:	eb42 0205 	adc.w	r2, r2, r5
20027054:	185b      	adds	r3, r3, r1
20027056:	9909      	ldr	r1, [sp, #36]	@ 0x24
20027058:	9c0c      	ldr	r4, [sp, #48]	@ 0x30
2002705a:	eb41 0202 	adc.w	r2, r1, r2
2002705e:	9906      	ldr	r1, [sp, #24]
20027060:	ea81 0504 	eor.w	r5, r1, r4
20027064:	9907      	ldr	r1, [sp, #28]
20027066:	9c0d      	ldr	r4, [sp, #52]	@ 0x34
20027068:	404c      	eors	r4, r1
2002706a:	990a      	ldr	r1, [sp, #40]	@ 0x28
2002706c:	400d      	ands	r5, r1
2002706e:	990b      	ldr	r1, [sp, #44]	@ 0x2c
20027070:	400c      	ands	r4, r1
20027072:	9906      	ldr	r1, [sp, #24]
20027074:	404d      	eors	r5, r1
20027076:	9907      	ldr	r1, [sp, #28]
20027078:	195b      	adds	r3, r3, r5
2002707a:	ea84 0401 	eor.w	r4, r4, r1
2002707e:	990a      	ldr	r1, [sp, #40]	@ 0x28
20027080:	eb42 0204 	adc.w	r2, r2, r4
20027084:	0b8e      	lsrs	r6, r1, #14
20027086:	990b      	ldr	r1, [sp, #44]	@ 0x2c
20027088:	ea46 4681 	orr.w	r6, r6, r1, lsl #18
2002708c:	0b8c      	lsrs	r4, r1, #14
2002708e:	990a      	ldr	r1, [sp, #40]	@ 0x28
20027090:	ea44 4481 	orr.w	r4, r4, r1, lsl #18
20027094:	0c8f      	lsrs	r7, r1, #18
20027096:	990b      	ldr	r1, [sp, #44]	@ 0x2c
20027098:	ea47 3781 	orr.w	r7, r7, r1, lsl #14
2002709c:	0c8d      	lsrs	r5, r1, #18
2002709e:	990a      	ldr	r1, [sp, #40]	@ 0x28
200270a0:	407e      	eors	r6, r7
200270a2:	ea45 3581 	orr.w	r5, r5, r1, lsl #14
200270a6:	406c      	eors	r4, r5
200270a8:	05cd      	lsls	r5, r1, #23
200270aa:	990b      	ldr	r1, [sp, #44]	@ 0x2c
200270ac:	ea45 2551 	orr.w	r5, r5, r1, lsr #9
200270b0:	05cf      	lsls	r7, r1, #23
200270b2:	990a      	ldr	r1, [sp, #40]	@ 0x28
200270b4:	4075      	eors	r5, r6
200270b6:	ea47 2751 	orr.w	r7, r7, r1, lsr #9
200270ba:	9901      	ldr	r1, [sp, #4]
200270bc:	195b      	adds	r3, r3, r5
200270be:	ea84 0407 	eor.w	r4, r4, r7
200270c2:	eb42 0204 	adc.w	r2, r2, r4
200270c6:	18c9      	adds	r1, r1, r3
200270c8:	9108      	str	r1, [sp, #32]
200270ca:	9902      	ldr	r1, [sp, #8]
200270cc:	ea4f 751b 	mov.w	r5, fp, lsr #28
200270d0:	eb41 0102 	adc.w	r1, r1, r2
200270d4:	9109      	str	r1, [sp, #36]	@ 0x24
200270d6:	9903      	ldr	r1, [sp, #12]
200270d8:	ea4f 748b 	mov.w	r4, fp, lsl #30
200270dc:	ea44 0491 	orr.w	r4, r4, r1, lsr #2
200270e0:	ea45 1501 	orr.w	r5, r5, r1, lsl #4
200270e4:	0f0e      	lsrs	r6, r1, #28
200270e6:	078f      	lsls	r7, r1, #30
200270e8:	4065      	eors	r5, r4
200270ea:	ea4f 644b 	mov.w	r4, fp, lsl #25
200270ee:	ea47 079b 	orr.w	r7, r7, fp, lsr #2
200270f2:	ea44 14d1 	orr.w	r4, r4, r1, lsr #7
200270f6:	ea46 160b 	orr.w	r6, r6, fp, lsl #4
200270fa:	407e      	eors	r6, r7
200270fc:	4065      	eors	r5, r4
200270fe:	064f      	lsls	r7, r1, #25
20027100:	e9dd 4103 	ldrd	r4, r1, [sp, #12]
20027104:	430c      	orrs	r4, r1
20027106:	9905      	ldr	r1, [sp, #20]
20027108:	ea47 17db 	orr.w	r7, r7, fp, lsr #7
2002710c:	407e      	eors	r6, r7
2002710e:	ea41 070b 	orr.w	r7, r1, fp
20027112:	ea04 0109 	and.w	r1, r4, r9
20027116:	9101      	str	r1, [sp, #4]
20027118:	e9dd 4103 	ldrd	r4, r1, [sp, #12]
2002711c:	ea01 0e04 	and.w	lr, r1, r4
20027120:	9905      	ldr	r1, [sp, #20]
20027122:	ea07 0708 	and.w	r7, r7, r8
20027126:	ea01 0c0b 	and.w	ip, r1, fp
2002712a:	9901      	ldr	r1, [sp, #4]
2002712c:	ea47 070c 	orr.w	r7, r7, ip
20027130:	ea41 040e 	orr.w	r4, r1, lr
20027134:	1934      	adds	r4, r6, r4
20027136:	eb45 0507 	adc.w	r5, r5, r7
2002713a:	18e3      	adds	r3, r4, r3
2002713c:	9301      	str	r3, [sp, #4]
2002713e:	eb42 0305 	adc.w	r3, r2, r5
20027142:	9302      	str	r3, [sp, #8]
20027144:	9b00      	ldr	r3, [sp, #0]
20027146:	9a00      	ldr	r2, [sp, #0]
20027148:	6b1b      	ldr	r3, [r3, #48]	@ 0x30
2002714a:	9906      	ldr	r1, [sp, #24]
2002714c:	6b52      	ldr	r2, [r2, #52]	@ 0x34
2002714e:	e9d0 450c 	ldrd	r4, r5, [r0, #48]	@ 0x30
20027152:	191b      	adds	r3, r3, r4
20027154:	eb42 0205 	adc.w	r2, r2, r5
20027158:	185b      	adds	r3, r3, r1
2002715a:	9907      	ldr	r1, [sp, #28]
2002715c:	9c0a      	ldr	r4, [sp, #40]	@ 0x28
2002715e:	eb41 0202 	adc.w	r2, r1, r2
20027162:	990c      	ldr	r1, [sp, #48]	@ 0x30
20027164:	ea81 0504 	eor.w	r5, r1, r4
20027168:	990d      	ldr	r1, [sp, #52]	@ 0x34
2002716a:	9c0b      	ldr	r4, [sp, #44]	@ 0x2c
2002716c:	404c      	eors	r4, r1
2002716e:	9908      	ldr	r1, [sp, #32]
20027170:	400d      	ands	r5, r1
20027172:	9909      	ldr	r1, [sp, #36]	@ 0x24
20027174:	400c      	ands	r4, r1
20027176:	990c      	ldr	r1, [sp, #48]	@ 0x30
20027178:	404d      	eors	r5, r1
2002717a:	990d      	ldr	r1, [sp, #52]	@ 0x34
2002717c:	195b      	adds	r3, r3, r5
2002717e:	ea84 0401 	eor.w	r4, r4, r1
20027182:	9908      	ldr	r1, [sp, #32]
20027184:	eb42 0204 	adc.w	r2, r2, r4
20027188:	0b8e      	lsrs	r6, r1, #14
2002718a:	9909      	ldr	r1, [sp, #36]	@ 0x24
2002718c:	ea46 4681 	orr.w	r6, r6, r1, lsl #18
20027190:	0b8c      	lsrs	r4, r1, #14
20027192:	9908      	ldr	r1, [sp, #32]
20027194:	ea44 4481 	orr.w	r4, r4, r1, lsl #18
20027198:	0c8f      	lsrs	r7, r1, #18
2002719a:	9909      	ldr	r1, [sp, #36]	@ 0x24
2002719c:	ea47 3781 	orr.w	r7, r7, r1, lsl #14
200271a0:	0c8d      	lsrs	r5, r1, #18
200271a2:	9908      	ldr	r1, [sp, #32]
200271a4:	407e      	eors	r6, r7
200271a6:	ea45 3581 	orr.w	r5, r5, r1, lsl #14
200271aa:	406c      	eors	r4, r5
200271ac:	05cd      	lsls	r5, r1, #23
200271ae:	9909      	ldr	r1, [sp, #36]	@ 0x24
200271b0:	ea45 2551 	orr.w	r5, r5, r1, lsr #9
200271b4:	05cf      	lsls	r7, r1, #23
200271b6:	9908      	ldr	r1, [sp, #32]
200271b8:	4075      	eors	r5, r6
200271ba:	ea47 2751 	orr.w	r7, r7, r1, lsr #9
200271be:	195b      	adds	r3, r3, r5
200271c0:	ea84 0407 	eor.w	r4, r4, r7
200271c4:	eb42 0204 	adc.w	r2, r2, r4
200271c8:	eb19 0103 	adds.w	r1, r9, r3
200271cc:	9106      	str	r1, [sp, #24]
200271ce:	eb48 0102 	adc.w	r1, r8, r2
200271d2:	9107      	str	r1, [sp, #28]
200271d4:	9901      	ldr	r1, [sp, #4]
200271d6:	0f0e      	lsrs	r6, r1, #28
200271d8:	9902      	ldr	r1, [sp, #8]
200271da:	ea46 1601 	orr.w	r6, r6, r1, lsl #4
200271de:	0f0d      	lsrs	r5, r1, #28
200271e0:	9901      	ldr	r1, [sp, #4]
200271e2:	ea45 1501 	orr.w	r5, r5, r1, lsl #4
200271e6:	078f      	lsls	r7, r1, #30
200271e8:	9902      	ldr	r1, [sp, #8]
200271ea:	ea47 0791 	orr.w	r7, r7, r1, lsr #2
200271ee:	078c      	lsls	r4, r1, #30
200271f0:	9901      	ldr	r1, [sp, #4]
200271f2:	407e      	eors	r6, r7
200271f4:	ea44 0491 	orr.w	r4, r4, r1, lsr #2
200271f8:	064f      	lsls	r7, r1, #25
200271fa:	9902      	ldr	r1, [sp, #8]
200271fc:	4065      	eors	r5, r4
200271fe:	ea47 17d1 	orr.w	r7, r7, r1, lsr #7
20027202:	064c      	lsls	r4, r1, #25
20027204:	9901      	ldr	r1, [sp, #4]
20027206:	407e      	eors	r6, r7
20027208:	ea44 14d1 	orr.w	r4, r4, r1, lsr #7
2002720c:	4065      	eors	r5, r4
2002720e:	9903      	ldr	r1, [sp, #12]
20027210:	9c01      	ldr	r4, [sp, #4]
20027212:	430c      	orrs	r4, r1
20027214:	9902      	ldr	r1, [sp, #8]
20027216:	ea4b 0701 	orr.w	r7, fp, r1
2002721a:	9904      	ldr	r1, [sp, #16]
2002721c:	ea04 0801 	and.w	r8, r4, r1
20027220:	9905      	ldr	r1, [sp, #20]
20027222:	9c01      	ldr	r4, [sp, #4]
20027224:	400f      	ands	r7, r1
20027226:	9903      	ldr	r1, [sp, #12]
20027228:	ea01 0e04 	and.w	lr, r1, r4
2002722c:	9902      	ldr	r1, [sp, #8]
2002722e:	ea48 040e 	orr.w	r4, r8, lr
20027232:	ea0b 0c01 	and.w	ip, fp, r1
20027236:	1934      	adds	r4, r6, r4
20027238:	ea47 070c 	orr.w	r7, r7, ip
2002723c:	eb45 0507 	adc.w	r5, r5, r7
20027240:	eb14 0c03 	adds.w	ip, r4, r3
20027244:	9b00      	ldr	r3, [sp, #0]
20027246:	eb42 0e05 	adc.w	lr, r2, r5
2002724a:	6b9b      	ldr	r3, [r3, #56]	@ 0x38
2002724c:	9a00      	ldr	r2, [sp, #0]
2002724e:	e9d0 450e 	ldrd	r4, r5, [r0, #56]	@ 0x38
20027252:	6bd2      	ldr	r2, [r2, #60]	@ 0x3c
20027254:	191c      	adds	r4, r3, r4
20027256:	9b0c      	ldr	r3, [sp, #48]	@ 0x30
20027258:	eb42 0205 	adc.w	r2, r2, r5
2002725c:	18e4      	adds	r4, r4, r3
2002725e:	9b0d      	ldr	r3, [sp, #52]	@ 0x34
20027260:	9908      	ldr	r1, [sp, #32]
20027262:	eb43 0202 	adc.w	r2, r3, r2
20027266:	9b0a      	ldr	r3, [sp, #40]	@ 0x28
20027268:	3040      	adds	r0, #64	@ 0x40
2002726a:	ea83 0501 	eor.w	r5, r3, r1
2002726e:	9909      	ldr	r1, [sp, #36]	@ 0x24
20027270:	9b0b      	ldr	r3, [sp, #44]	@ 0x2c
20027272:	404b      	eors	r3, r1
20027274:	9906      	ldr	r1, [sp, #24]
20027276:	400d      	ands	r5, r1
20027278:	9907      	ldr	r1, [sp, #28]
2002727a:	400b      	ands	r3, r1
2002727c:	990a      	ldr	r1, [sp, #40]	@ 0x28
2002727e:	404d      	eors	r5, r1
20027280:	990b      	ldr	r1, [sp, #44]	@ 0x2c
20027282:	1964      	adds	r4, r4, r5
20027284:	ea83 0301 	eor.w	r3, r3, r1
20027288:	eb42 0203 	adc.w	r2, r2, r3
2002728c:	9b06      	ldr	r3, [sp, #24]
2002728e:	9906      	ldr	r1, [sp, #24]
20027290:	0b9e      	lsrs	r6, r3, #14
20027292:	9b07      	ldr	r3, [sp, #28]
20027294:	0c8f      	lsrs	r7, r1, #18
20027296:	ea46 4683 	orr.w	r6, r6, r3, lsl #18
2002729a:	0b9b      	lsrs	r3, r3, #14
2002729c:	ea43 4381 	orr.w	r3, r3, r1, lsl #18
200272a0:	9907      	ldr	r1, [sp, #28]
200272a2:	ea47 3781 	orr.w	r7, r7, r1, lsl #14
200272a6:	0c8d      	lsrs	r5, r1, #18
200272a8:	9906      	ldr	r1, [sp, #24]
200272aa:	407e      	eors	r6, r7
200272ac:	ea45 3581 	orr.w	r5, r5, r1, lsl #14
200272b0:	406b      	eors	r3, r5
200272b2:	05cd      	lsls	r5, r1, #23
200272b4:	9907      	ldr	r1, [sp, #28]
200272b6:	ea45 2551 	orr.w	r5, r5, r1, lsr #9
200272ba:	05cf      	lsls	r7, r1, #23
200272bc:	9906      	ldr	r1, [sp, #24]
200272be:	4075      	eors	r5, r6
200272c0:	ea47 2751 	orr.w	r7, r7, r1, lsr #9
200272c4:	1964      	adds	r4, r4, r5
200272c6:	ea83 0307 	eor.w	r3, r3, r7
200272ca:	eb42 0203 	adc.w	r2, r2, r3
200272ce:	9b04      	ldr	r3, [sp, #16]
200272d0:	ea4f 751e 	mov.w	r5, lr, lsr #28
200272d4:	191b      	adds	r3, r3, r4
200272d6:	9304      	str	r3, [sp, #16]
200272d8:	9b05      	ldr	r3, [sp, #20]
200272da:	ea4f 761c 	mov.w	r6, ip, lsr #28
200272de:	eb43 0302 	adc.w	r3, r3, r2
200272e2:	9305      	str	r3, [sp, #20]
200272e4:	ea4f 738e 	mov.w	r3, lr, lsl #30
200272e8:	ea43 039c 	orr.w	r3, r3, ip, lsr #2
200272ec:	ea45 150c 	orr.w	r5, r5, ip, lsl #4
200272f0:	ea4f 778c 	mov.w	r7, ip, lsl #30
200272f4:	ea47 079e 	orr.w	r7, r7, lr, lsr #2
200272f8:	405d      	eors	r5, r3
200272fa:	ea46 160e 	orr.w	r6, r6, lr, lsl #4
200272fe:	ea4f 634e 	mov.w	r3, lr, lsl #25
20027302:	9902      	ldr	r1, [sp, #8]
20027304:	407e      	eors	r6, r7
20027306:	ea43 13dc 	orr.w	r3, r3, ip, lsr #7
2002730a:	ea4f 674c 	mov.w	r7, ip, lsl #25
2002730e:	ea47 17de 	orr.w	r7, r7, lr, lsr #7
20027312:	405d      	eors	r5, r3
20027314:	9b01      	ldr	r3, [sp, #4]
20027316:	407e      	eors	r6, r7
20027318:	ea41 070e 	orr.w	r7, r1, lr
2002731c:	9903      	ldr	r1, [sp, #12]
2002731e:	ea43 030c 	orr.w	r3, r3, ip
20027322:	400b      	ands	r3, r1
20027324:	9901      	ldr	r1, [sp, #4]
20027326:	ea07 070b 	and.w	r7, r7, fp
2002732a:	ea01 090c 	and.w	r9, r1, ip
2002732e:	9902      	ldr	r1, [sp, #8]
20027330:	ea43 0309 	orr.w	r3, r3, r9
20027334:	ea01 080e 	and.w	r8, r1, lr
20027338:	9900      	ldr	r1, [sp, #0]
2002733a:	18f3      	adds	r3, r6, r3
2002733c:	f101 0140 	add.w	r1, r1, #64	@ 0x40
20027340:	9100      	str	r1, [sp, #0]
20027342:	ea47 0708 	orr.w	r7, r7, r8
20027346:	eb45 0507 	adc.w	r5, r5, r7
2002734a:	4928      	ldr	r1, [pc, #160]	@ (200273ec <mbedtls_sha512_process+0xa54>)
2002734c:	191b      	adds	r3, r3, r4
2002734e:	9c00      	ldr	r4, [sp, #0]
20027350:	eb42 0205 	adc.w	r2, r2, r5
20027354:	42a1      	cmp	r1, r4
20027356:	f47f abe3 	bne.w	20026b20 <mbedtls_sha512_process+0x188>
2002735a:	990e      	ldr	r1, [sp, #56]	@ 0x38
2002735c:	18cb      	adds	r3, r1, r3
2002735e:	990f      	ldr	r1, [sp, #60]	@ 0x3c
20027360:	eb42 0201 	adc.w	r2, r2, r1
20027364:	e9ca 3204 	strd	r3, r2, [sl, #16]
20027368:	9b10      	ldr	r3, [sp, #64]	@ 0x40
2002736a:	9a11      	ldr	r2, [sp, #68]	@ 0x44
2002736c:	eb13 030c 	adds.w	r3, r3, ip
20027370:	eb4e 0202 	adc.w	r2, lr, r2
20027374:	e9ca 3206 	strd	r3, r2, [sl, #24]
20027378:	9a01      	ldr	r2, [sp, #4]
2002737a:	9b12      	ldr	r3, [sp, #72]	@ 0x48
2002737c:	9913      	ldr	r1, [sp, #76]	@ 0x4c
2002737e:	189b      	adds	r3, r3, r2
20027380:	9a02      	ldr	r2, [sp, #8]
20027382:	eb42 0201 	adc.w	r2, r2, r1
20027386:	e9ca 3208 	strd	r3, r2, [sl, #32]
2002738a:	9a03      	ldr	r2, [sp, #12]
2002738c:	9b14      	ldr	r3, [sp, #80]	@ 0x50
2002738e:	9917      	ldr	r1, [sp, #92]	@ 0x5c
20027390:	189b      	adds	r3, r3, r2
20027392:	9a15      	ldr	r2, [sp, #84]	@ 0x54
20027394:	eb4b 0202 	adc.w	r2, fp, r2
20027398:	e9ca 320a 	strd	r3, r2, [sl, #40]	@ 0x28
2002739c:	9a04      	ldr	r2, [sp, #16]
2002739e:	9b16      	ldr	r3, [sp, #88]	@ 0x58
200273a0:	189b      	adds	r3, r3, r2
200273a2:	9a05      	ldr	r2, [sp, #20]
200273a4:	eb42 0201 	adc.w	r2, r2, r1
200273a8:	e9ca 320c 	strd	r3, r2, [sl, #48]	@ 0x30
200273ac:	9b18      	ldr	r3, [sp, #96]	@ 0x60
200273ae:	9a06      	ldr	r2, [sp, #24]
200273b0:	9919      	ldr	r1, [sp, #100]	@ 0x64
200273b2:	189a      	adds	r2, r3, r2
200273b4:	9b07      	ldr	r3, [sp, #28]
200273b6:	eb43 0301 	adc.w	r3, r3, r1
200273ba:	e9ca 230e 	strd	r2, r3, [sl, #56]	@ 0x38
200273be:	9b1a      	ldr	r3, [sp, #104]	@ 0x68
200273c0:	9a08      	ldr	r2, [sp, #32]
200273c2:	991b      	ldr	r1, [sp, #108]	@ 0x6c
200273c4:	189a      	adds	r2, r3, r2
200273c6:	9b09      	ldr	r3, [sp, #36]	@ 0x24
200273c8:	eb43 0301 	adc.w	r3, r3, r1
200273cc:	e9ca 2310 	strd	r2, r3, [sl, #64]	@ 0x40
200273d0:	9b1c      	ldr	r3, [sp, #112]	@ 0x70
200273d2:	9a0a      	ldr	r2, [sp, #40]	@ 0x28
200273d4:	991d      	ldr	r1, [sp, #116]	@ 0x74
200273d6:	189a      	adds	r2, r3, r2
200273d8:	9b0b      	ldr	r3, [sp, #44]	@ 0x2c
200273da:	eb43 0301 	adc.w	r3, r3, r1
200273de:	e9ca 2312 	strd	r2, r3, [sl, #72]	@ 0x48
200273e2:	f50d 7d3f 	add.w	sp, sp, #764	@ 0x2fc
200273e6:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
200273ea:	bf00      	nop
200273ec:	2002c1d0 	.word	0x2002c1d0

200273f0 <mbedtls_sha512_update.part.0>:
200273f0:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
200273f4:	4615      	mov	r5, r2
200273f6:	e9d0 3200 	ldrd	r3, r2, [r0]
200273fa:	f003 077f 	and.w	r7, r3, #127	@ 0x7f
200273fe:	195b      	adds	r3, r3, r5
20027400:	f152 0200 	adcs.w	r2, r2, #0
20027404:	460e      	mov	r6, r1
20027406:	f04f 0100 	mov.w	r1, #0
2002740a:	bf28      	it	cs
2002740c:	2101      	movcs	r1, #1
2002740e:	4604      	mov	r4, r0
20027410:	e9c0 3200 	strd	r3, r2, [r0]
20027414:	b131      	cbz	r1, 20027424 <mbedtls_sha512_update.part.0+0x34>
20027416:	e9d0 3202 	ldrd	r3, r2, [r0, #8]
2002741a:	3301      	adds	r3, #1
2002741c:	f142 0200 	adc.w	r2, r2, #0
20027420:	e9c0 3202 	strd	r3, r2, [r0, #8]
20027424:	b19f      	cbz	r7, 2002744e <mbedtls_sha512_update.part.0+0x5e>
20027426:	f1c7 0980 	rsb	r9, r7, #128	@ 0x80
2002742a:	45a9      	cmp	r9, r5
2002742c:	d80f      	bhi.n	2002744e <mbedtls_sha512_update.part.0+0x5e>
2002742e:	f104 0850 	add.w	r8, r4, #80	@ 0x50
20027432:	4631      	mov	r1, r6
20027434:	464a      	mov	r2, r9
20027436:	eb08 0007 	add.w	r0, r8, r7
2002743a:	f003 fa1d 	bl	2002a878 <memcpy>
2002743e:	3d80      	subs	r5, #128	@ 0x80
20027440:	4641      	mov	r1, r8
20027442:	4620      	mov	r0, r4
20027444:	443d      	add	r5, r7
20027446:	f7ff faa7 	bl	20026998 <mbedtls_sha512_process>
2002744a:	2700      	movs	r7, #0
2002744c:	444e      	add	r6, r9
2002744e:	46a8      	mov	r8, r5
20027450:	eb05 0906 	add.w	r9, r5, r6
20027454:	e004      	b.n	20027460 <mbedtls_sha512_update.part.0+0x70>
20027456:	4620      	mov	r0, r4
20027458:	f7ff fa9e 	bl	20026998 <mbedtls_sha512_process>
2002745c:	f1a8 0880 	sub.w	r8, r8, #128	@ 0x80
20027460:	f1b8 0f7f 	cmp.w	r8, #127	@ 0x7f
20027464:	eba9 0108 	sub.w	r1, r9, r8
20027468:	d8f5      	bhi.n	20027456 <mbedtls_sha512_update.part.0+0x66>
2002746a:	f06f 037f 	mvn.w	r3, #127	@ 0x7f
2002746e:	09e9      	lsrs	r1, r5, #7
20027470:	4359      	muls	r1, r3
20027472:	186a      	adds	r2, r5, r1
20027474:	d007      	beq.n	20027486 <mbedtls_sha512_update.part.0+0x96>
20027476:	f104 0050 	add.w	r0, r4, #80	@ 0x50
2002747a:	1a71      	subs	r1, r6, r1
2002747c:	4438      	add	r0, r7
2002747e:	e8bd 43f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
20027482:	f003 b9f9 	b.w	2002a878 <memcpy>
20027486:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}

2002748a <mbedtls_sha512_update>:
2002748a:	b10a      	cbz	r2, 20027490 <mbedtls_sha512_update+0x6>
2002748c:	f7ff bfb0 	b.w	200273f0 <mbedtls_sha512_update.part.0>
20027490:	4770      	bx	lr
	...

20027494 <mbedtls_sha512_finish>:
20027494:	b5f0      	push	{r4, r5, r6, r7, lr}
20027496:	4604      	mov	r4, r0
20027498:	e9d0 2300 	ldrd	r2, r3, [r0]
2002749c:	460d      	mov	r5, r1
2002749e:	e9d0 6102 	ldrd	r6, r1, [r0, #8]
200274a2:	00c9      	lsls	r1, r1, #3
200274a4:	ea41 7156 	orr.w	r1, r1, r6, lsr #29
200274a8:	b085      	sub	sp, #20
200274aa:	0e0f      	lsrs	r7, r1, #24
200274ac:	0f58      	lsrs	r0, r3, #29
200274ae:	00db      	lsls	r3, r3, #3
200274b0:	ea43 7352 	orr.w	r3, r3, r2, lsr #29
200274b4:	f88d 7000 	strb.w	r7, [sp]
200274b8:	0c0f      	lsrs	r7, r1, #16
200274ba:	f88d 7001 	strb.w	r7, [sp, #1]
200274be:	f88d 1003 	strb.w	r1, [sp, #3]
200274c2:	0a0f      	lsrs	r7, r1, #8
200274c4:	0e19      	lsrs	r1, r3, #24
200274c6:	ea40 00c6 	orr.w	r0, r0, r6, lsl #3
200274ca:	f88d 1008 	strb.w	r1, [sp, #8]
200274ce:	00d6      	lsls	r6, r2, #3
200274d0:	0c19      	lsrs	r1, r3, #16
200274d2:	f002 027f 	and.w	r2, r2, #127	@ 0x7f
200274d6:	2a6f      	cmp	r2, #111	@ 0x6f
200274d8:	ba00      	rev	r0, r0
200274da:	f88d 1009 	strb.w	r1, [sp, #9]
200274de:	ea4f 2113 	mov.w	r1, r3, lsr #8
200274e2:	bf94      	ite	ls
200274e4:	f1c2 0270 	rsbls	r2, r2, #112	@ 0x70
200274e8:	f1c2 02f0 	rsbhi	r2, r2, #240	@ 0xf0
200274ec:	9001      	str	r0, [sp, #4]
200274ee:	f88d 100a 	strb.w	r1, [sp, #10]
200274f2:	4620      	mov	r0, r4
200274f4:	4969      	ldr	r1, [pc, #420]	@ (2002769c <mbedtls_sha512_finish+0x208>)
200274f6:	ba36      	rev	r6, r6
200274f8:	f88d 300b 	strb.w	r3, [sp, #11]
200274fc:	f88d 7002 	strb.w	r7, [sp, #2]
20027500:	9603      	str	r6, [sp, #12]
20027502:	f7ff ffc2 	bl	2002748a <mbedtls_sha512_update>
20027506:	2210      	movs	r2, #16
20027508:	4669      	mov	r1, sp
2002750a:	4620      	mov	r0, r4
2002750c:	f7ff ff70 	bl	200273f0 <mbedtls_sha512_update.part.0>
20027510:	7de3      	ldrb	r3, [r4, #23]
20027512:	702b      	strb	r3, [r5, #0]
20027514:	8ae3      	ldrh	r3, [r4, #22]
20027516:	706b      	strb	r3, [r5, #1]
20027518:	6963      	ldr	r3, [r4, #20]
2002751a:	0a1b      	lsrs	r3, r3, #8
2002751c:	70ab      	strb	r3, [r5, #2]
2002751e:	6963      	ldr	r3, [r4, #20]
20027520:	70eb      	strb	r3, [r5, #3]
20027522:	7ce3      	ldrb	r3, [r4, #19]
20027524:	712b      	strb	r3, [r5, #4]
20027526:	8a63      	ldrh	r3, [r4, #18]
20027528:	716b      	strb	r3, [r5, #5]
2002752a:	6923      	ldr	r3, [r4, #16]
2002752c:	0a1b      	lsrs	r3, r3, #8
2002752e:	71ab      	strb	r3, [r5, #6]
20027530:	6923      	ldr	r3, [r4, #16]
20027532:	71eb      	strb	r3, [r5, #7]
20027534:	7fe3      	ldrb	r3, [r4, #31]
20027536:	722b      	strb	r3, [r5, #8]
20027538:	8be3      	ldrh	r3, [r4, #30]
2002753a:	726b      	strb	r3, [r5, #9]
2002753c:	69e3      	ldr	r3, [r4, #28]
2002753e:	0a1b      	lsrs	r3, r3, #8
20027540:	72ab      	strb	r3, [r5, #10]
20027542:	69e3      	ldr	r3, [r4, #28]
20027544:	72eb      	strb	r3, [r5, #11]
20027546:	7ee3      	ldrb	r3, [r4, #27]
20027548:	732b      	strb	r3, [r5, #12]
2002754a:	8b63      	ldrh	r3, [r4, #26]
2002754c:	736b      	strb	r3, [r5, #13]
2002754e:	69a3      	ldr	r3, [r4, #24]
20027550:	0a1b      	lsrs	r3, r3, #8
20027552:	73ab      	strb	r3, [r5, #14]
20027554:	69a3      	ldr	r3, [r4, #24]
20027556:	73eb      	strb	r3, [r5, #15]
20027558:	f894 3027 	ldrb.w	r3, [r4, #39]	@ 0x27
2002755c:	742b      	strb	r3, [r5, #16]
2002755e:	8ce3      	ldrh	r3, [r4, #38]	@ 0x26
20027560:	746b      	strb	r3, [r5, #17]
20027562:	6a63      	ldr	r3, [r4, #36]	@ 0x24
20027564:	0a1b      	lsrs	r3, r3, #8
20027566:	74ab      	strb	r3, [r5, #18]
20027568:	6a63      	ldr	r3, [r4, #36]	@ 0x24
2002756a:	74eb      	strb	r3, [r5, #19]
2002756c:	f894 3023 	ldrb.w	r3, [r4, #35]	@ 0x23
20027570:	752b      	strb	r3, [r5, #20]
20027572:	8c63      	ldrh	r3, [r4, #34]	@ 0x22
20027574:	756b      	strb	r3, [r5, #21]
20027576:	6a23      	ldr	r3, [r4, #32]
20027578:	0a1b      	lsrs	r3, r3, #8
2002757a:	75ab      	strb	r3, [r5, #22]
2002757c:	6a23      	ldr	r3, [r4, #32]
2002757e:	75eb      	strb	r3, [r5, #23]
20027580:	f894 302f 	ldrb.w	r3, [r4, #47]	@ 0x2f
20027584:	762b      	strb	r3, [r5, #24]
20027586:	8de3      	ldrh	r3, [r4, #46]	@ 0x2e
20027588:	766b      	strb	r3, [r5, #25]
2002758a:	6ae3      	ldr	r3, [r4, #44]	@ 0x2c
2002758c:	0a1b      	lsrs	r3, r3, #8
2002758e:	76ab      	strb	r3, [r5, #26]
20027590:	6ae3      	ldr	r3, [r4, #44]	@ 0x2c
20027592:	76eb      	strb	r3, [r5, #27]
20027594:	f894 302b 	ldrb.w	r3, [r4, #43]	@ 0x2b
20027598:	772b      	strb	r3, [r5, #28]
2002759a:	8d63      	ldrh	r3, [r4, #42]	@ 0x2a
2002759c:	776b      	strb	r3, [r5, #29]
2002759e:	6aa3      	ldr	r3, [r4, #40]	@ 0x28
200275a0:	0a1b      	lsrs	r3, r3, #8
200275a2:	77ab      	strb	r3, [r5, #30]
200275a4:	6aa3      	ldr	r3, [r4, #40]	@ 0x28
200275a6:	77eb      	strb	r3, [r5, #31]
200275a8:	f894 3037 	ldrb.w	r3, [r4, #55]	@ 0x37
200275ac:	f885 3020 	strb.w	r3, [r5, #32]
200275b0:	8ee3      	ldrh	r3, [r4, #54]	@ 0x36
200275b2:	f885 3021 	strb.w	r3, [r5, #33]	@ 0x21
200275b6:	6b63      	ldr	r3, [r4, #52]	@ 0x34
200275b8:	0a1b      	lsrs	r3, r3, #8
200275ba:	f885 3022 	strb.w	r3, [r5, #34]	@ 0x22
200275be:	6b63      	ldr	r3, [r4, #52]	@ 0x34
200275c0:	f885 3023 	strb.w	r3, [r5, #35]	@ 0x23
200275c4:	f894 3033 	ldrb.w	r3, [r4, #51]	@ 0x33
200275c8:	f885 3024 	strb.w	r3, [r5, #36]	@ 0x24
200275cc:	8e63      	ldrh	r3, [r4, #50]	@ 0x32
200275ce:	f885 3025 	strb.w	r3, [r5, #37]	@ 0x25
200275d2:	6b23      	ldr	r3, [r4, #48]	@ 0x30
200275d4:	0a1b      	lsrs	r3, r3, #8
200275d6:	f885 3026 	strb.w	r3, [r5, #38]	@ 0x26
200275da:	6b23      	ldr	r3, [r4, #48]	@ 0x30
200275dc:	f885 3027 	strb.w	r3, [r5, #39]	@ 0x27
200275e0:	f894 303f 	ldrb.w	r3, [r4, #63]	@ 0x3f
200275e4:	f885 3028 	strb.w	r3, [r5, #40]	@ 0x28
200275e8:	8fe3      	ldrh	r3, [r4, #62]	@ 0x3e
200275ea:	f885 3029 	strb.w	r3, [r5, #41]	@ 0x29
200275ee:	6be3      	ldr	r3, [r4, #60]	@ 0x3c
200275f0:	0a1b      	lsrs	r3, r3, #8
200275f2:	f885 302a 	strb.w	r3, [r5, #42]	@ 0x2a
200275f6:	6be3      	ldr	r3, [r4, #60]	@ 0x3c
200275f8:	f885 302b 	strb.w	r3, [r5, #43]	@ 0x2b
200275fc:	f894 303b 	ldrb.w	r3, [r4, #59]	@ 0x3b
20027600:	f885 302c 	strb.w	r3, [r5, #44]	@ 0x2c
20027604:	8f63      	ldrh	r3, [r4, #58]	@ 0x3a
20027606:	f885 302d 	strb.w	r3, [r5, #45]	@ 0x2d
2002760a:	6ba3      	ldr	r3, [r4, #56]	@ 0x38
2002760c:	0a1b      	lsrs	r3, r3, #8
2002760e:	f885 302e 	strb.w	r3, [r5, #46]	@ 0x2e
20027612:	6ba3      	ldr	r3, [r4, #56]	@ 0x38
20027614:	f885 302f 	strb.w	r3, [r5, #47]	@ 0x2f
20027618:	f8d4 30d0 	ldr.w	r3, [r4, #208]	@ 0xd0
2002761c:	2b00      	cmp	r3, #0
2002761e:	d13b      	bne.n	20027698 <mbedtls_sha512_finish+0x204>
20027620:	f894 3047 	ldrb.w	r3, [r4, #71]	@ 0x47
20027624:	f885 3030 	strb.w	r3, [r5, #48]	@ 0x30
20027628:	f8b4 3046 	ldrh.w	r3, [r4, #70]	@ 0x46
2002762c:	f885 3031 	strb.w	r3, [r5, #49]	@ 0x31
20027630:	6c63      	ldr	r3, [r4, #68]	@ 0x44
20027632:	0a1b      	lsrs	r3, r3, #8
20027634:	f885 3032 	strb.w	r3, [r5, #50]	@ 0x32
20027638:	6c63      	ldr	r3, [r4, #68]	@ 0x44
2002763a:	f885 3033 	strb.w	r3, [r5, #51]	@ 0x33
2002763e:	f894 3043 	ldrb.w	r3, [r4, #67]	@ 0x43
20027642:	f885 3034 	strb.w	r3, [r5, #52]	@ 0x34
20027646:	f8b4 3042 	ldrh.w	r3, [r4, #66]	@ 0x42
2002764a:	f885 3035 	strb.w	r3, [r5, #53]	@ 0x35
2002764e:	6c23      	ldr	r3, [r4, #64]	@ 0x40
20027650:	0a1b      	lsrs	r3, r3, #8
20027652:	f885 3036 	strb.w	r3, [r5, #54]	@ 0x36
20027656:	6c23      	ldr	r3, [r4, #64]	@ 0x40
20027658:	f885 3037 	strb.w	r3, [r5, #55]	@ 0x37
2002765c:	f894 304f 	ldrb.w	r3, [r4, #79]	@ 0x4f
20027660:	f885 3038 	strb.w	r3, [r5, #56]	@ 0x38
20027664:	f8b4 304e 	ldrh.w	r3, [r4, #78]	@ 0x4e
20027668:	f885 3039 	strb.w	r3, [r5, #57]	@ 0x39
2002766c:	6ce3      	ldr	r3, [r4, #76]	@ 0x4c
2002766e:	0a1b      	lsrs	r3, r3, #8
20027670:	f885 303a 	strb.w	r3, [r5, #58]	@ 0x3a
20027674:	6ce3      	ldr	r3, [r4, #76]	@ 0x4c
20027676:	f885 303b 	strb.w	r3, [r5, #59]	@ 0x3b
2002767a:	f894 304b 	ldrb.w	r3, [r4, #75]	@ 0x4b
2002767e:	f885 303c 	strb.w	r3, [r5, #60]	@ 0x3c
20027682:	f8b4 304a 	ldrh.w	r3, [r4, #74]	@ 0x4a
20027686:	f885 303d 	strb.w	r3, [r5, #61]	@ 0x3d
2002768a:	6ca3      	ldr	r3, [r4, #72]	@ 0x48
2002768c:	0a1b      	lsrs	r3, r3, #8
2002768e:	f885 303e 	strb.w	r3, [r5, #62]	@ 0x3e
20027692:	6ca3      	ldr	r3, [r4, #72]	@ 0x48
20027694:	f885 303f 	strb.w	r3, [r5, #63]	@ 0x3f
20027698:	b005      	add	sp, #20
2002769a:	bdf0      	pop	{r4, r5, r6, r7, pc}
2002769c:	2002becc 	.word	0x2002becc

200276a0 <mbedtls_sha512>:
200276a0:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
200276a4:	461c      	mov	r4, r3
200276a6:	b0b7      	sub	sp, #220	@ 0xdc
200276a8:	4606      	mov	r6, r0
200276aa:	4668      	mov	r0, sp
200276ac:	460f      	mov	r7, r1
200276ae:	4615      	mov	r5, r2
200276b0:	f7ff f8ce 	bl	20026850 <mbedtls_sha512_init>
200276b4:	2c00      	cmp	r4, #0
200276b6:	d03f      	beq.n	20027738 <mbedtls_sha512+0x98>
200276b8:	f20f 0bf4 	addw	fp, pc, #244	@ 0xf4
200276bc:	e9db ab00 	ldrd	sl, fp, [fp]
200276c0:	f20f 09f4 	addw	r9, pc, #244	@ 0xf4
200276c4:	e9d9 8900 	ldrd	r8, r9, [r9]
200276c8:	a13d      	add	r1, pc, #244	@ (adr r1, 200277c0 <mbedtls_sha512+0x120>)
200276ca:	e9d1 0100 	ldrd	r0, r1, [r1]
200276ce:	a33e      	add	r3, pc, #248	@ (adr r3, 200277c8 <mbedtls_sha512+0x128>)
200276d0:	e9d3 2300 	ldrd	r2, r3, [r3]
200276d4:	ed9f 4b24 	vldr	d4, [pc, #144]	@ 20027768 <mbedtls_sha512+0xc8>
200276d8:	ed9f 5b25 	vldr	d5, [pc, #148]	@ 20027770 <mbedtls_sha512+0xd0>
200276dc:	ed9f 6b26 	vldr	d6, [pc, #152]	@ 20027778 <mbedtls_sha512+0xd8>
200276e0:	ed9f 7b27 	vldr	d7, [pc, #156]	@ 20027780 <mbedtls_sha512+0xe0>
200276e4:	ed9f 3b28 	vldr	d3, [pc, #160]	@ 20027788 <mbedtls_sha512+0xe8>
200276e8:	e9cd 2312 	strd	r2, r3, [sp, #72]	@ 0x48
200276ec:	e9cd 0110 	strd	r0, r1, [sp, #64]	@ 0x40
200276f0:	463a      	mov	r2, r7
200276f2:	4631      	mov	r1, r6
200276f4:	4668      	mov	r0, sp
200276f6:	ed8d 3b00 	vstr	d3, [sp]
200276fa:	ed8d 3b02 	vstr	d3, [sp, #8]
200276fe:	ed8d 4b04 	vstr	d4, [sp, #16]
20027702:	ed8d 5b06 	vstr	d5, [sp, #24]
20027706:	ed8d 6b08 	vstr	d6, [sp, #32]
2002770a:	ed8d 7b0a 	vstr	d7, [sp, #40]	@ 0x28
2002770e:	e9cd ab0c 	strd	sl, fp, [sp, #48]	@ 0x30
20027712:	e9cd 890e 	strd	r8, r9, [sp, #56]	@ 0x38
20027716:	9434      	str	r4, [sp, #208]	@ 0xd0
20027718:	f7ff feb7 	bl	2002748a <mbedtls_sha512_update>
2002771c:	4629      	mov	r1, r5
2002771e:	4668      	mov	r0, sp
20027720:	f7ff feb8 	bl	20027494 <mbedtls_sha512_finish>
20027724:	2300      	movs	r3, #0
20027726:	461a      	mov	r2, r3
20027728:	f80d 2003 	strb.w	r2, [sp, r3]
2002772c:	3301      	adds	r3, #1
2002772e:	2bd8      	cmp	r3, #216	@ 0xd8
20027730:	d1fa      	bne.n	20027728 <mbedtls_sha512+0x88>
20027732:	b037      	add	sp, #220	@ 0xdc
20027734:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
20027738:	ed9f 4b15 	vldr	d4, [pc, #84]	@ 20027790 <mbedtls_sha512+0xf0>
2002773c:	f20f 0b90 	addw	fp, pc, #144	@ 0x90
20027740:	e9db ab00 	ldrd	sl, fp, [fp]
20027744:	f20f 0990 	addw	r9, pc, #144	@ 0x90
20027748:	e9d9 8900 	ldrd	r8, r9, [r9]
2002774c:	a124      	add	r1, pc, #144	@ (adr r1, 200277e0 <mbedtls_sha512+0x140>)
2002774e:	e9d1 0100 	ldrd	r0, r1, [r1]
20027752:	a325      	add	r3, pc, #148	@ (adr r3, 200277e8 <mbedtls_sha512+0x148>)
20027754:	e9d3 2300 	ldrd	r2, r3, [r3]
20027758:	ed9f 5b0f 	vldr	d5, [pc, #60]	@ 20027798 <mbedtls_sha512+0xf8>
2002775c:	ed9f 6b10 	vldr	d6, [pc, #64]	@ 200277a0 <mbedtls_sha512+0x100>
20027760:	ed9f 7b11 	vldr	d7, [pc, #68]	@ 200277a8 <mbedtls_sha512+0x108>
20027764:	e7be      	b.n	200276e4 <mbedtls_sha512+0x44>
20027766:	bf00      	nop
20027768:	c1059ed8 	.word	0xc1059ed8
2002776c:	cbbb9d5d 	.word	0xcbbb9d5d
20027770:	367cd507 	.word	0x367cd507
20027774:	629a292a 	.word	0x629a292a
20027778:	3070dd17 	.word	0x3070dd17
2002777c:	9159015a 	.word	0x9159015a
20027780:	f70e5939 	.word	0xf70e5939
20027784:	152fecd8 	.word	0x152fecd8
	...
20027790:	f3bcc908 	.word	0xf3bcc908
20027794:	6a09e667 	.word	0x6a09e667
20027798:	84caa73b 	.word	0x84caa73b
2002779c:	bb67ae85 	.word	0xbb67ae85
200277a0:	fe94f82b 	.word	0xfe94f82b
200277a4:	3c6ef372 	.word	0x3c6ef372
200277a8:	5f1d36f1 	.word	0x5f1d36f1
200277ac:	a54ff53a 	.word	0xa54ff53a
200277b0:	ffc00b31 	.word	0xffc00b31
200277b4:	67332667 	.word	0x67332667
200277b8:	68581511 	.word	0x68581511
200277bc:	8eb44a87 	.word	0x8eb44a87
200277c0:	64f98fa7 	.word	0x64f98fa7
200277c4:	db0c2e0d 	.word	0xdb0c2e0d
200277c8:	befa4fa4 	.word	0xbefa4fa4
200277cc:	47b5481d 	.word	0x47b5481d
200277d0:	ade682d1 	.word	0xade682d1
200277d4:	510e527f 	.word	0x510e527f
200277d8:	2b3e6c1f 	.word	0x2b3e6c1f
200277dc:	9b05688c 	.word	0x9b05688c
200277e0:	fb41bd6b 	.word	0xfb41bd6b
200277e4:	1f83d9ab 	.word	0x1f83d9ab
200277e8:	137e2179 	.word	0x137e2179
200277ec:	5be0cd19 	.word	0x5be0cd19

200277f0 <mbedtls_asn1_get_len>:
200277f0:	b570      	push	{r4, r5, r6, lr}
200277f2:	6803      	ldr	r3, [r0, #0]
200277f4:	1acd      	subs	r5, r1, r3
200277f6:	2d00      	cmp	r5, #0
200277f8:	dc02      	bgt.n	20027800 <mbedtls_asn1_get_len+0x10>
200277fa:	f06f 005f 	mvn.w	r0, #95	@ 0x5f
200277fe:	bd70      	pop	{r4, r5, r6, pc}
20027800:	f993 6000 	ldrsb.w	r6, [r3]
20027804:	781c      	ldrb	r4, [r3, #0]
20027806:	2e00      	cmp	r6, #0
20027808:	db0a      	blt.n	20027820 <mbedtls_asn1_get_len+0x30>
2002780a:	1c5c      	adds	r4, r3, #1
2002780c:	6004      	str	r4, [r0, #0]
2002780e:	781b      	ldrb	r3, [r3, #0]
20027810:	6013      	str	r3, [r2, #0]
20027812:	6803      	ldr	r3, [r0, #0]
20027814:	1ac9      	subs	r1, r1, r3
20027816:	6813      	ldr	r3, [r2, #0]
20027818:	428b      	cmp	r3, r1
2002781a:	d8ee      	bhi.n	200277fa <mbedtls_asn1_get_len+0xa>
2002781c:	2000      	movs	r0, #0
2002781e:	e7ee      	b.n	200277fe <mbedtls_asn1_get_len+0xe>
20027820:	f004 047f 	and.w	r4, r4, #127	@ 0x7f
20027824:	3c01      	subs	r4, #1
20027826:	2c03      	cmp	r4, #3
20027828:	d82b      	bhi.n	20027882 <mbedtls_asn1_get_len+0x92>
2002782a:	e8df f004 	tbb	[pc, r4]
2002782e:	0a02      	.short	0x0a02
20027830:	2114      	.short	0x2114
20027832:	2d01      	cmp	r5, #1
20027834:	d0e1      	beq.n	200277fa <mbedtls_asn1_get_len+0xa>
20027836:	785b      	ldrb	r3, [r3, #1]
20027838:	6013      	str	r3, [r2, #0]
2002783a:	6803      	ldr	r3, [r0, #0]
2002783c:	3302      	adds	r3, #2
2002783e:	6003      	str	r3, [r0, #0]
20027840:	e7e7      	b.n	20027812 <mbedtls_asn1_get_len+0x22>
20027842:	2d02      	cmp	r5, #2
20027844:	ddd9      	ble.n	200277fa <mbedtls_asn1_get_len+0xa>
20027846:	f8b3 3001 	ldrh.w	r3, [r3, #1]
2002784a:	ba5b      	rev16	r3, r3
2002784c:	b29b      	uxth	r3, r3
2002784e:	6013      	str	r3, [r2, #0]
20027850:	6803      	ldr	r3, [r0, #0]
20027852:	3303      	adds	r3, #3
20027854:	e7f3      	b.n	2002783e <mbedtls_asn1_get_len+0x4e>
20027856:	2d03      	cmp	r5, #3
20027858:	ddcf      	ble.n	200277fa <mbedtls_asn1_get_len+0xa>
2002785a:	789c      	ldrb	r4, [r3, #2]
2002785c:	785d      	ldrb	r5, [r3, #1]
2002785e:	0224      	lsls	r4, r4, #8
20027860:	78db      	ldrb	r3, [r3, #3]
20027862:	ea44 4405 	orr.w	r4, r4, r5, lsl #16
20027866:	4323      	orrs	r3, r4
20027868:	6013      	str	r3, [r2, #0]
2002786a:	6803      	ldr	r3, [r0, #0]
2002786c:	3304      	adds	r3, #4
2002786e:	e7e6      	b.n	2002783e <mbedtls_asn1_get_len+0x4e>
20027870:	2d04      	cmp	r5, #4
20027872:	ddc2      	ble.n	200277fa <mbedtls_asn1_get_len+0xa>
20027874:	f8d3 3001 	ldr.w	r3, [r3, #1]
20027878:	ba1b      	rev	r3, r3
2002787a:	6013      	str	r3, [r2, #0]
2002787c:	6803      	ldr	r3, [r0, #0]
2002787e:	3305      	adds	r3, #5
20027880:	e7dd      	b.n	2002783e <mbedtls_asn1_get_len+0x4e>
20027882:	f06f 0063 	mvn.w	r0, #99	@ 0x63
20027886:	e7ba      	b.n	200277fe <mbedtls_asn1_get_len+0xe>

20027888 <mbedtls_asn1_get_tag>:
20027888:	b470      	push	{r4, r5, r6}
2002788a:	6804      	ldr	r4, [r0, #0]
2002788c:	1b0e      	subs	r6, r1, r4
2002788e:	2e00      	cmp	r6, #0
20027890:	dd07      	ble.n	200278a2 <mbedtls_asn1_get_tag+0x1a>
20027892:	7826      	ldrb	r6, [r4, #0]
20027894:	429e      	cmp	r6, r3
20027896:	d108      	bne.n	200278aa <mbedtls_asn1_get_tag+0x22>
20027898:	3401      	adds	r4, #1
2002789a:	6004      	str	r4, [r0, #0]
2002789c:	bc70      	pop	{r4, r5, r6}
2002789e:	f7ff bfa7 	b.w	200277f0 <mbedtls_asn1_get_len>
200278a2:	f06f 005f 	mvn.w	r0, #95	@ 0x5f
200278a6:	bc70      	pop	{r4, r5, r6}
200278a8:	4770      	bx	lr
200278aa:	f06f 0061 	mvn.w	r0, #97	@ 0x61
200278ae:	e7fa      	b.n	200278a6 <mbedtls_asn1_get_tag+0x1e>

200278b0 <mbedtls_asn1_get_mpi>:
200278b0:	b573      	push	{r0, r1, r4, r5, r6, lr}
200278b2:	2302      	movs	r3, #2
200278b4:	4615      	mov	r5, r2
200278b6:	aa01      	add	r2, sp, #4
200278b8:	4604      	mov	r4, r0
200278ba:	f7ff ffe5 	bl	20027888 <mbedtls_asn1_get_tag>
200278be:	b940      	cbnz	r0, 200278d2 <mbedtls_asn1_get_mpi+0x22>
200278c0:	9e01      	ldr	r6, [sp, #4]
200278c2:	4628      	mov	r0, r5
200278c4:	4632      	mov	r2, r6
200278c6:	6821      	ldr	r1, [r4, #0]
200278c8:	f000 fad4 	bl	20027e74 <mbedtls_mpi_read_binary>
200278cc:	6823      	ldr	r3, [r4, #0]
200278ce:	4433      	add	r3, r6
200278d0:	6023      	str	r3, [r4, #0]
200278d2:	b002      	add	sp, #8
200278d4:	bd70      	pop	{r4, r5, r6, pc}

200278d6 <mbedtls_asn1_get_bitstring_null>:
200278d6:	b538      	push	{r3, r4, r5, lr}
200278d8:	2303      	movs	r3, #3
200278da:	4604      	mov	r4, r0
200278dc:	4615      	mov	r5, r2
200278de:	f7ff ffd3 	bl	20027888 <mbedtls_asn1_get_tag>
200278e2:	b958      	cbnz	r0, 200278fc <mbedtls_asn1_get_bitstring_null+0x26>
200278e4:	6813      	ldr	r3, [r2, #0]
200278e6:	1e5a      	subs	r2, r3, #1
200278e8:	2b01      	cmp	r3, #1
200278ea:	602a      	str	r2, [r5, #0]
200278ec:	d904      	bls.n	200278f8 <mbedtls_asn1_get_bitstring_null+0x22>
200278ee:	6823      	ldr	r3, [r4, #0]
200278f0:	1c5a      	adds	r2, r3, #1
200278f2:	6022      	str	r2, [r4, #0]
200278f4:	781b      	ldrb	r3, [r3, #0]
200278f6:	b10b      	cbz	r3, 200278fc <mbedtls_asn1_get_bitstring_null+0x26>
200278f8:	f06f 0067 	mvn.w	r0, #103	@ 0x67
200278fc:	bd38      	pop	{r3, r4, r5, pc}

200278fe <mbedtls_asn1_get_alg>:
200278fe:	e92d 41f3 	stmdb	sp!, {r0, r1, r4, r5, r6, r7, r8, lr}
20027902:	4690      	mov	r8, r2
20027904:	461e      	mov	r6, r3
20027906:	aa01      	add	r2, sp, #4
20027908:	2330      	movs	r3, #48	@ 0x30
2002790a:	4605      	mov	r5, r0
2002790c:	460f      	mov	r7, r1
2002790e:	f7ff ffbb 	bl	20027888 <mbedtls_asn1_get_tag>
20027912:	4604      	mov	r4, r0
20027914:	bb10      	cbnz	r0, 2002795c <mbedtls_asn1_get_alg+0x5e>
20027916:	682b      	ldr	r3, [r5, #0]
20027918:	1aff      	subs	r7, r7, r3
2002791a:	2f00      	cmp	r7, #0
2002791c:	dd38      	ble.n	20027990 <mbedtls_asn1_get_alg+0x92>
2002791e:	4642      	mov	r2, r8
20027920:	781b      	ldrb	r3, [r3, #0]
20027922:	4628      	mov	r0, r5
20027924:	f842 3b04 	str.w	r3, [r2], #4
20027928:	682f      	ldr	r7, [r5, #0]
2002792a:	9b01      	ldr	r3, [sp, #4]
2002792c:	441f      	add	r7, r3
2002792e:	4639      	mov	r1, r7
20027930:	2306      	movs	r3, #6
20027932:	f7ff ffa9 	bl	20027888 <mbedtls_asn1_get_tag>
20027936:	4604      	mov	r4, r0
20027938:	b980      	cbnz	r0, 2002795c <mbedtls_asn1_get_alg+0x5e>
2002793a:	682b      	ldr	r3, [r5, #0]
2002793c:	f8d8 2004 	ldr.w	r2, [r8, #4]
20027940:	f8c8 3008 	str.w	r3, [r8, #8]
20027944:	1899      	adds	r1, r3, r2
20027946:	42b9      	cmp	r1, r7
20027948:	6029      	str	r1, [r5, #0]
2002794a:	d10b      	bne.n	20027964 <mbedtls_asn1_get_alg+0x66>
2002794c:	4601      	mov	r1, r0
2002794e:	f106 030c 	add.w	r3, r6, #12
20027952:	4632      	mov	r2, r6
20027954:	3601      	adds	r6, #1
20027956:	42b3      	cmp	r3, r6
20027958:	7011      	strb	r1, [r2, #0]
2002795a:	d1fa      	bne.n	20027952 <mbedtls_asn1_get_alg+0x54>
2002795c:	4620      	mov	r0, r4
2002795e:	b002      	add	sp, #8
20027960:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
20027964:	5c9b      	ldrb	r3, [r3, r2]
20027966:	4632      	mov	r2, r6
20027968:	f842 3b04 	str.w	r3, [r2], #4
2002796c:	682b      	ldr	r3, [r5, #0]
2002796e:	4639      	mov	r1, r7
20027970:	3301      	adds	r3, #1
20027972:	4628      	mov	r0, r5
20027974:	602b      	str	r3, [r5, #0]
20027976:	f7ff ff3b 	bl	200277f0 <mbedtls_asn1_get_len>
2002797a:	b960      	cbnz	r0, 20027996 <mbedtls_asn1_get_alg+0x98>
2002797c:	682b      	ldr	r3, [r5, #0]
2002797e:	6872      	ldr	r2, [r6, #4]
20027980:	60b3      	str	r3, [r6, #8]
20027982:	4413      	add	r3, r2
20027984:	42bb      	cmp	r3, r7
20027986:	bf18      	it	ne
20027988:	f06f 0465 	mvnne.w	r4, #101	@ 0x65
2002798c:	602b      	str	r3, [r5, #0]
2002798e:	e7e5      	b.n	2002795c <mbedtls_asn1_get_alg+0x5e>
20027990:	f06f 045f 	mvn.w	r4, #95	@ 0x5f
20027994:	e7e2      	b.n	2002795c <mbedtls_asn1_get_alg+0x5e>
20027996:	4604      	mov	r4, r0
20027998:	e7e0      	b.n	2002795c <mbedtls_asn1_get_alg+0x5e>

2002799a <mpi_sub_hlp>:
2002799a:	2300      	movs	r3, #0
2002799c:	b5f0      	push	{r4, r5, r6, r7, lr}
2002799e:	461c      	mov	r4, r3
200279a0:	1f16      	subs	r6, r2, #4
200279a2:	4284      	cmp	r4, r0
200279a4:	d103      	bne.n	200279ae <mpi_sub_hlp+0x14>
200279a6:	eb02 0284 	add.w	r2, r2, r4, lsl #2
200279aa:	b9b3      	cbnz	r3, 200279da <mpi_sub_hlp+0x40>
200279ac:	bdf0      	pop	{r4, r5, r6, r7, pc}
200279ae:	f856 cf04 	ldr.w	ip, [r6, #4]!
200279b2:	ebac 0503 	sub.w	r5, ip, r3
200279b6:	6035      	str	r5, [r6, #0]
200279b8:	f851 7024 	ldr.w	r7, [r1, r4, lsl #2]
200279bc:	3401      	adds	r4, #1
200279be:	42bd      	cmp	r5, r7
200279c0:	bf2c      	ite	cs
200279c2:	f04f 0e00 	movcs.w	lr, #0
200279c6:	f04f 0e01 	movcc.w	lr, #1
200279ca:	1bed      	subs	r5, r5, r7
200279cc:	459c      	cmp	ip, r3
200279ce:	bf2c      	ite	cs
200279d0:	4673      	movcs	r3, lr
200279d2:	f10e 0301 	addcc.w	r3, lr, #1
200279d6:	6035      	str	r5, [r6, #0]
200279d8:	e7e3      	b.n	200279a2 <mpi_sub_hlp+0x8>
200279da:	6811      	ldr	r1, [r2, #0]
200279dc:	1ac8      	subs	r0, r1, r3
200279de:	4299      	cmp	r1, r3
200279e0:	bf2c      	ite	cs
200279e2:	2300      	movcs	r3, #0
200279e4:	2301      	movcc	r3, #1
200279e6:	f842 0b04 	str.w	r0, [r2], #4
200279ea:	e7de      	b.n	200279aa <mpi_sub_hlp+0x10>

200279ec <mpi_mul_hlp>:
200279ec:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
200279f0:	4694      	mov	ip, r2
200279f2:	460e      	mov	r6, r1
200279f4:	4686      	mov	lr, r0
200279f6:	2500      	movs	r5, #0
200279f8:	f102 0440 	add.w	r4, r2, #64	@ 0x40
200279fc:	f1be 0f0f 	cmp.w	lr, #15
20027a00:	f854 7c40 	ldr.w	r7, [r4, #-64]
20027a04:	f106 0640 	add.w	r6, r6, #64	@ 0x40
20027a08:	f104 0440 	add.w	r4, r4, #64	@ 0x40
20027a0c:	d87c      	bhi.n	20027b08 <mpi_mul_hlp+0x11c>
20027a0e:	f06f 080f 	mvn.w	r8, #15
20027a12:	0902      	lsrs	r2, r0, #4
20027a14:	fb08 0002 	mla	r0, r8, r2, r0
20027a18:	2807      	cmp	r0, #7
20027a1a:	ea4f 1e82 	mov.w	lr, r2, lsl #6
20027a1e:	eb0c 1482 	add.w	r4, ip, r2, lsl #6
20027a22:	eb01 1682 	add.w	r6, r1, r2, lsl #6
20027a26:	d95b      	bls.n	20027ae0 <mpi_mul_hlp+0xf4>
20027a28:	f851 100e 	ldr.w	r1, [r1, lr]
20027a2c:	3808      	subs	r0, #8
20027a2e:	fba1 1203 	umull	r1, r2, r1, r3
20027a32:	1869      	adds	r1, r5, r1
20027a34:	f142 0200 	adc.w	r2, r2, #0
20027a38:	187f      	adds	r7, r7, r1
20027a3a:	f84c 700e 	str.w	r7, [ip, lr]
20027a3e:	6871      	ldr	r1, [r6, #4]
20027a40:	f142 0200 	adc.w	r2, r2, #0
20027a44:	fba1 5103 	umull	r5, r1, r1, r3
20027a48:	1952      	adds	r2, r2, r5
20027a4a:	6865      	ldr	r5, [r4, #4]
20027a4c:	f141 0100 	adc.w	r1, r1, #0
20027a50:	1952      	adds	r2, r2, r5
20027a52:	6062      	str	r2, [r4, #4]
20027a54:	68b2      	ldr	r2, [r6, #8]
20027a56:	f141 0100 	adc.w	r1, r1, #0
20027a5a:	fba2 5203 	umull	r5, r2, r2, r3
20027a5e:	1949      	adds	r1, r1, r5
20027a60:	68a5      	ldr	r5, [r4, #8]
20027a62:	f142 0200 	adc.w	r2, r2, #0
20027a66:	1949      	adds	r1, r1, r5
20027a68:	60a1      	str	r1, [r4, #8]
20027a6a:	68f1      	ldr	r1, [r6, #12]
20027a6c:	f142 0200 	adc.w	r2, r2, #0
20027a70:	fba1 5103 	umull	r5, r1, r1, r3
20027a74:	1952      	adds	r2, r2, r5
20027a76:	68e5      	ldr	r5, [r4, #12]
20027a78:	f141 0100 	adc.w	r1, r1, #0
20027a7c:	1952      	adds	r2, r2, r5
20027a7e:	60e2      	str	r2, [r4, #12]
20027a80:	6932      	ldr	r2, [r6, #16]
20027a82:	f141 0100 	adc.w	r1, r1, #0
20027a86:	fba2 5203 	umull	r5, r2, r2, r3
20027a8a:	1949      	adds	r1, r1, r5
20027a8c:	6925      	ldr	r5, [r4, #16]
20027a8e:	f142 0200 	adc.w	r2, r2, #0
20027a92:	1949      	adds	r1, r1, r5
20027a94:	6121      	str	r1, [r4, #16]
20027a96:	6971      	ldr	r1, [r6, #20]
20027a98:	f142 0200 	adc.w	r2, r2, #0
20027a9c:	fba1 5103 	umull	r5, r1, r1, r3
20027aa0:	1952      	adds	r2, r2, r5
20027aa2:	6965      	ldr	r5, [r4, #20]
20027aa4:	f141 0100 	adc.w	r1, r1, #0
20027aa8:	1952      	adds	r2, r2, r5
20027aaa:	6162      	str	r2, [r4, #20]
20027aac:	69b2      	ldr	r2, [r6, #24]
20027aae:	f141 0100 	adc.w	r1, r1, #0
20027ab2:	fba2 5203 	umull	r5, r2, r2, r3
20027ab6:	1949      	adds	r1, r1, r5
20027ab8:	69a5      	ldr	r5, [r4, #24]
20027aba:	f142 0200 	adc.w	r2, r2, #0
20027abe:	1949      	adds	r1, r1, r5
20027ac0:	61a1      	str	r1, [r4, #24]
20027ac2:	69f1      	ldr	r1, [r6, #28]
20027ac4:	f142 0200 	adc.w	r2, r2, #0
20027ac8:	fba1 1503 	umull	r1, r5, r1, r3
20027acc:	1852      	adds	r2, r2, r1
20027ace:	69e1      	ldr	r1, [r4, #28]
20027ad0:	f145 0500 	adc.w	r5, r5, #0
20027ad4:	1852      	adds	r2, r2, r1
20027ad6:	61e2      	str	r2, [r4, #28]
20027ad8:	f145 0500 	adc.w	r5, r5, #0
20027adc:	3420      	adds	r4, #32
20027ade:	3620      	adds	r6, #32
20027ae0:	4627      	mov	r7, r4
20027ae2:	ea4f 0c80 	mov.w	ip, r0, lsl #2
20027ae6:	eb06 0080 	add.w	r0, r6, r0, lsl #2
20027aea:	42b0      	cmp	r0, r6
20027aec:	f857 1b04 	ldr.w	r1, [r7], #4
20027af0:	f040 80eb 	bne.w	20027cca <mpi_mul_hlp+0x2de>
20027af4:	4464      	add	r4, ip
20027af6:	6823      	ldr	r3, [r4, #0]
20027af8:	195b      	adds	r3, r3, r5
20027afa:	f844 3b04 	str.w	r3, [r4], #4
20027afe:	f04f 0501 	mov.w	r5, #1
20027b02:	d2f8      	bcs.n	20027af6 <mpi_mul_hlp+0x10a>
20027b04:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
20027b08:	f856 2c40 	ldr.w	r2, [r6, #-64]
20027b0c:	f1ae 0e10 	sub.w	lr, lr, #16
20027b10:	fba2 2803 	umull	r2, r8, r2, r3
20027b14:	18aa      	adds	r2, r5, r2
20027b16:	f148 0500 	adc.w	r5, r8, #0
20027b1a:	18ba      	adds	r2, r7, r2
20027b1c:	f844 2c80 	str.w	r2, [r4, #-128]
20027b20:	f856 2c3c 	ldr.w	r2, [r6, #-60]
20027b24:	f145 0500 	adc.w	r5, r5, #0
20027b28:	fba2 7203 	umull	r7, r2, r2, r3
20027b2c:	19ef      	adds	r7, r5, r7
20027b2e:	f854 5c7c 	ldr.w	r5, [r4, #-124]
20027b32:	f142 0200 	adc.w	r2, r2, #0
20027b36:	19ed      	adds	r5, r5, r7
20027b38:	f844 5c7c 	str.w	r5, [r4, #-124]
20027b3c:	f856 5c38 	ldr.w	r5, [r6, #-56]
20027b40:	f142 0200 	adc.w	r2, r2, #0
20027b44:	fba5 7503 	umull	r7, r5, r5, r3
20027b48:	19d7      	adds	r7, r2, r7
20027b4a:	f854 2c78 	ldr.w	r2, [r4, #-120]
20027b4e:	f145 0500 	adc.w	r5, r5, #0
20027b52:	19d2      	adds	r2, r2, r7
20027b54:	f844 2c78 	str.w	r2, [r4, #-120]
20027b58:	f856 2c34 	ldr.w	r2, [r6, #-52]
20027b5c:	f145 0500 	adc.w	r5, r5, #0
20027b60:	fba2 7203 	umull	r7, r2, r2, r3
20027b64:	19ef      	adds	r7, r5, r7
20027b66:	f854 5c74 	ldr.w	r5, [r4, #-116]
20027b6a:	f142 0200 	adc.w	r2, r2, #0
20027b6e:	19ed      	adds	r5, r5, r7
20027b70:	f844 5c74 	str.w	r5, [r4, #-116]
20027b74:	f856 5c30 	ldr.w	r5, [r6, #-48]
20027b78:	f142 0200 	adc.w	r2, r2, #0
20027b7c:	fba5 7503 	umull	r7, r5, r5, r3
20027b80:	19d7      	adds	r7, r2, r7
20027b82:	f854 2c70 	ldr.w	r2, [r4, #-112]
20027b86:	f145 0500 	adc.w	r5, r5, #0
20027b8a:	19d2      	adds	r2, r2, r7
20027b8c:	f844 2c70 	str.w	r2, [r4, #-112]
20027b90:	f856 2c2c 	ldr.w	r2, [r6, #-44]
20027b94:	f145 0500 	adc.w	r5, r5, #0
20027b98:	fba2 7203 	umull	r7, r2, r2, r3
20027b9c:	19ef      	adds	r7, r5, r7
20027b9e:	f854 5c6c 	ldr.w	r5, [r4, #-108]
20027ba2:	f142 0200 	adc.w	r2, r2, #0
20027ba6:	19ed      	adds	r5, r5, r7
20027ba8:	f844 5c6c 	str.w	r5, [r4, #-108]
20027bac:	f856 5c28 	ldr.w	r5, [r6, #-40]
20027bb0:	f142 0200 	adc.w	r2, r2, #0
20027bb4:	fba5 7503 	umull	r7, r5, r5, r3
20027bb8:	19d7      	adds	r7, r2, r7
20027bba:	f854 2c68 	ldr.w	r2, [r4, #-104]
20027bbe:	f145 0500 	adc.w	r5, r5, #0
20027bc2:	19d2      	adds	r2, r2, r7
20027bc4:	f844 2c68 	str.w	r2, [r4, #-104]
20027bc8:	f856 2c24 	ldr.w	r2, [r6, #-36]
20027bcc:	f145 0500 	adc.w	r5, r5, #0
20027bd0:	fba2 7203 	umull	r7, r2, r2, r3
20027bd4:	19ef      	adds	r7, r5, r7
20027bd6:	f854 5c64 	ldr.w	r5, [r4, #-100]
20027bda:	f142 0200 	adc.w	r2, r2, #0
20027bde:	19ed      	adds	r5, r5, r7
20027be0:	f844 5c64 	str.w	r5, [r4, #-100]
20027be4:	f856 5c20 	ldr.w	r5, [r6, #-32]
20027be8:	f142 0200 	adc.w	r2, r2, #0
20027bec:	fba5 7503 	umull	r7, r5, r5, r3
20027bf0:	19d7      	adds	r7, r2, r7
20027bf2:	f854 2c60 	ldr.w	r2, [r4, #-96]
20027bf6:	f145 0500 	adc.w	r5, r5, #0
20027bfa:	19d2      	adds	r2, r2, r7
20027bfc:	f844 2c60 	str.w	r2, [r4, #-96]
20027c00:	f856 2c1c 	ldr.w	r2, [r6, #-28]
20027c04:	f145 0500 	adc.w	r5, r5, #0
20027c08:	fba2 7203 	umull	r7, r2, r2, r3
20027c0c:	19ef      	adds	r7, r5, r7
20027c0e:	f854 5c5c 	ldr.w	r5, [r4, #-92]
20027c12:	f142 0200 	adc.w	r2, r2, #0
20027c16:	19ed      	adds	r5, r5, r7
20027c18:	f844 5c5c 	str.w	r5, [r4, #-92]
20027c1c:	f856 5c18 	ldr.w	r5, [r6, #-24]
20027c20:	f142 0200 	adc.w	r2, r2, #0
20027c24:	fba5 7503 	umull	r7, r5, r5, r3
20027c28:	19d7      	adds	r7, r2, r7
20027c2a:	f854 2c58 	ldr.w	r2, [r4, #-88]
20027c2e:	f145 0500 	adc.w	r5, r5, #0
20027c32:	19d2      	adds	r2, r2, r7
20027c34:	f844 2c58 	str.w	r2, [r4, #-88]
20027c38:	f856 2c14 	ldr.w	r2, [r6, #-20]
20027c3c:	f145 0500 	adc.w	r5, r5, #0
20027c40:	fba2 7203 	umull	r7, r2, r2, r3
20027c44:	19ef      	adds	r7, r5, r7
20027c46:	f854 5c54 	ldr.w	r5, [r4, #-84]
20027c4a:	f142 0200 	adc.w	r2, r2, #0
20027c4e:	19ed      	adds	r5, r5, r7
20027c50:	f844 5c54 	str.w	r5, [r4, #-84]
20027c54:	f856 5c10 	ldr.w	r5, [r6, #-16]
20027c58:	f142 0200 	adc.w	r2, r2, #0
20027c5c:	fba5 7503 	umull	r7, r5, r5, r3
20027c60:	19d7      	adds	r7, r2, r7
20027c62:	f854 2c50 	ldr.w	r2, [r4, #-80]
20027c66:	f145 0500 	adc.w	r5, r5, #0
20027c6a:	19d2      	adds	r2, r2, r7
20027c6c:	f844 2c50 	str.w	r2, [r4, #-80]
20027c70:	f856 2c0c 	ldr.w	r2, [r6, #-12]
20027c74:	f145 0500 	adc.w	r5, r5, #0
20027c78:	fba2 7203 	umull	r7, r2, r2, r3
20027c7c:	19ef      	adds	r7, r5, r7
20027c7e:	f854 5c4c 	ldr.w	r5, [r4, #-76]
20027c82:	f142 0200 	adc.w	r2, r2, #0
20027c86:	19ed      	adds	r5, r5, r7
20027c88:	f844 5c4c 	str.w	r5, [r4, #-76]
20027c8c:	f856 5c08 	ldr.w	r5, [r6, #-8]
20027c90:	f142 0200 	adc.w	r2, r2, #0
20027c94:	fba5 5703 	umull	r5, r7, r5, r3
20027c98:	1955      	adds	r5, r2, r5
20027c9a:	f854 2c48 	ldr.w	r2, [r4, #-72]
20027c9e:	f147 0700 	adc.w	r7, r7, #0
20027ca2:	1952      	adds	r2, r2, r5
20027ca4:	f844 2c48 	str.w	r2, [r4, #-72]
20027ca8:	f856 2c04 	ldr.w	r2, [r6, #-4]
20027cac:	f147 0700 	adc.w	r7, r7, #0
20027cb0:	fba2 2503 	umull	r2, r5, r2, r3
20027cb4:	18bf      	adds	r7, r7, r2
20027cb6:	f854 2c44 	ldr.w	r2, [r4, #-68]
20027cba:	f145 0500 	adc.w	r5, r5, #0
20027cbe:	19d2      	adds	r2, r2, r7
20027cc0:	f145 0500 	adc.w	r5, r5, #0
20027cc4:	f844 2c44 	str.w	r2, [r4, #-68]
20027cc8:	e698      	b.n	200279fc <mpi_mul_hlp+0x10>
20027cca:	f856 2b04 	ldr.w	r2, [r6], #4
20027cce:	fba2 2e03 	umull	r2, lr, r2, r3
20027cd2:	18aa      	adds	r2, r5, r2
20027cd4:	f14e 0500 	adc.w	r5, lr, #0
20027cd8:	1889      	adds	r1, r1, r2
20027cda:	f145 0500 	adc.w	r5, r5, #0
20027cde:	f847 1c04 	str.w	r1, [r7, #-4]
20027ce2:	e702      	b.n	20027aea <mpi_mul_hlp+0xfe>

20027ce4 <mbedtls_mpi_init>:
20027ce4:	b120      	cbz	r0, 20027cf0 <mbedtls_mpi_init+0xc>
20027ce6:	2300      	movs	r3, #0
20027ce8:	2201      	movs	r2, #1
20027cea:	e9c0 2300 	strd	r2, r3, [r0]
20027cee:	6083      	str	r3, [r0, #8]
20027cf0:	4770      	bx	lr

20027cf2 <mbedtls_mpi_free>:
20027cf2:	b510      	push	{r4, lr}
20027cf4:	4604      	mov	r4, r0
20027cf6:	b168      	cbz	r0, 20027d14 <mbedtls_mpi_free+0x22>
20027cf8:	6883      	ldr	r3, [r0, #8]
20027cfa:	b133      	cbz	r3, 20027d0a <mbedtls_mpi_free+0x18>
20027cfc:	2100      	movs	r1, #0
20027cfe:	6842      	ldr	r2, [r0, #4]
20027d00:	3a01      	subs	r2, #1
20027d02:	d208      	bcs.n	20027d16 <mbedtls_mpi_free+0x24>
20027d04:	68a0      	ldr	r0, [r4, #8]
20027d06:	f002 fcd7 	bl	2002a6b8 <free>
20027d0a:	2300      	movs	r3, #0
20027d0c:	2201      	movs	r2, #1
20027d0e:	e9c4 2300 	strd	r2, r3, [r4]
20027d12:	60a3      	str	r3, [r4, #8]
20027d14:	bd10      	pop	{r4, pc}
20027d16:	f843 1b04 	str.w	r1, [r3], #4
20027d1a:	e7f1      	b.n	20027d00 <mbedtls_mpi_free+0xe>

20027d1c <mbedtls_mpi_grow>:
20027d1c:	f242 7310 	movw	r3, #10000	@ 0x2710
20027d20:	4299      	cmp	r1, r3
20027d22:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
20027d26:	4605      	mov	r5, r0
20027d28:	460f      	mov	r7, r1
20027d2a:	d903      	bls.n	20027d34 <mbedtls_mpi_grow+0x18>
20027d2c:	f06f 000f 	mvn.w	r0, #15
20027d30:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
20027d34:	6846      	ldr	r6, [r0, #4]
20027d36:	428e      	cmp	r6, r1
20027d38:	d301      	bcc.n	20027d3e <mbedtls_mpi_grow+0x22>
20027d3a:	2000      	movs	r0, #0
20027d3c:	e7f8      	b.n	20027d30 <mbedtls_mpi_grow+0x14>
20027d3e:	2104      	movs	r1, #4
20027d40:	4638      	mov	r0, r7
20027d42:	f002 fc9d 	bl	2002a680 <calloc>
20027d46:	4680      	mov	r8, r0
20027d48:	2800      	cmp	r0, #0
20027d4a:	d0ef      	beq.n	20027d2c <mbedtls_mpi_grow+0x10>
20027d4c:	68ac      	ldr	r4, [r5, #8]
20027d4e:	b15c      	cbz	r4, 20027d68 <mbedtls_mpi_grow+0x4c>
20027d50:	00b6      	lsls	r6, r6, #2
20027d52:	4632      	mov	r2, r6
20027d54:	4621      	mov	r1, r4
20027d56:	f002 fd8f 	bl	2002a878 <memcpy>
20027d5a:	2300      	movs	r3, #0
20027d5c:	4426      	add	r6, r4
20027d5e:	42b4      	cmp	r4, r6
20027d60:	d105      	bne.n	20027d6e <mbedtls_mpi_grow+0x52>
20027d62:	68a8      	ldr	r0, [r5, #8]
20027d64:	f002 fca8 	bl	2002a6b8 <free>
20027d68:	e9c5 7801 	strd	r7, r8, [r5, #4]
20027d6c:	e7e5      	b.n	20027d3a <mbedtls_mpi_grow+0x1e>
20027d6e:	f844 3b04 	str.w	r3, [r4], #4
20027d72:	e7f4      	b.n	20027d5e <mbedtls_mpi_grow+0x42>

20027d74 <mbedtls_mpi_copy>:
20027d74:	4288      	cmp	r0, r1
20027d76:	b570      	push	{r4, r5, r6, lr}
20027d78:	4605      	mov	r5, r0
20027d7a:	460e      	mov	r6, r1
20027d7c:	d003      	beq.n	20027d86 <mbedtls_mpi_copy+0x12>
20027d7e:	688b      	ldr	r3, [r1, #8]
20027d80:	b91b      	cbnz	r3, 20027d8a <mbedtls_mpi_copy+0x16>
20027d82:	f7ff ffb6 	bl	20027cf2 <mbedtls_mpi_free>
20027d86:	2000      	movs	r0, #0
20027d88:	bd70      	pop	{r4, r5, r6, pc}
20027d8a:	684a      	ldr	r2, [r1, #4]
20027d8c:	3a01      	subs	r2, #1
20027d8e:	b11a      	cbz	r2, 20027d98 <mbedtls_mpi_copy+0x24>
20027d90:	f853 1022 	ldr.w	r1, [r3, r2, lsl #2]
20027d94:	2900      	cmp	r1, #0
20027d96:	d0f9      	beq.n	20027d8c <mbedtls_mpi_copy+0x18>
20027d98:	6833      	ldr	r3, [r6, #0]
20027d9a:	1c54      	adds	r4, r2, #1
20027d9c:	4621      	mov	r1, r4
20027d9e:	4628      	mov	r0, r5
20027da0:	602b      	str	r3, [r5, #0]
20027da2:	f7ff ffbb 	bl	20027d1c <mbedtls_mpi_grow>
20027da6:	4601      	mov	r1, r0
20027da8:	b950      	cbnz	r0, 20027dc0 <mbedtls_mpi_copy+0x4c>
20027daa:	686a      	ldr	r2, [r5, #4]
20027dac:	68a8      	ldr	r0, [r5, #8]
20027dae:	0092      	lsls	r2, r2, #2
20027db0:	f002 fd48 	bl	2002a844 <memset>
20027db4:	68b1      	ldr	r1, [r6, #8]
20027db6:	68a8      	ldr	r0, [r5, #8]
20027db8:	00a2      	lsls	r2, r4, #2
20027dba:	f002 fd5d 	bl	2002a878 <memcpy>
20027dbe:	e7e2      	b.n	20027d86 <mbedtls_mpi_copy+0x12>
20027dc0:	f06f 000f 	mvn.w	r0, #15
20027dc4:	e7e0      	b.n	20027d88 <mbedtls_mpi_copy+0x14>

20027dc6 <mbedtls_mpi_lset>:
20027dc6:	b570      	push	{r4, r5, r6, lr}
20027dc8:	460e      	mov	r6, r1
20027dca:	2101      	movs	r1, #1
20027dcc:	4604      	mov	r4, r0
20027dce:	f7ff ffa5 	bl	20027d1c <mbedtls_mpi_grow>
20027dd2:	4605      	mov	r5, r0
20027dd4:	b988      	cbnz	r0, 20027dfa <mbedtls_mpi_lset+0x34>
20027dd6:	6862      	ldr	r2, [r4, #4]
20027dd8:	4601      	mov	r1, r0
20027dda:	0092      	lsls	r2, r2, #2
20027ddc:	68a0      	ldr	r0, [r4, #8]
20027dde:	f002 fd31 	bl	2002a844 <memset>
20027de2:	68a3      	ldr	r3, [r4, #8]
20027de4:	ea86 72e6 	eor.w	r2, r6, r6, asr #31
20027de8:	2e00      	cmp	r6, #0
20027dea:	eba2 72e6 	sub.w	r2, r2, r6, asr #31
20027dee:	601a      	str	r2, [r3, #0]
20027df0:	bfac      	ite	ge
20027df2:	2301      	movge	r3, #1
20027df4:	f04f 33ff 	movlt.w	r3, #4294967295	@ 0xffffffff
20027df8:	6023      	str	r3, [r4, #0]
20027dfa:	4628      	mov	r0, r5
20027dfc:	bd70      	pop	{r4, r5, r6, pc}

20027dfe <mbedtls_mpi_lsb>:
20027dfe:	2300      	movs	r3, #0
20027e00:	4619      	mov	r1, r3
20027e02:	b570      	push	{r4, r5, r6, lr}
20027e04:	6844      	ldr	r4, [r0, #4]
20027e06:	428c      	cmp	r4, r1
20027e08:	d101      	bne.n	20027e0e <mbedtls_mpi_lsb+0x10>
20027e0a:	2000      	movs	r0, #0
20027e0c:	e008      	b.n	20027e20 <mbedtls_mpi_lsb+0x22>
20027e0e:	6882      	ldr	r2, [r0, #8]
20027e10:	f852 5021 	ldr.w	r5, [r2, r1, lsl #2]
20027e14:	2200      	movs	r2, #0
20027e16:	fa25 f602 	lsr.w	r6, r5, r2
20027e1a:	07f6      	lsls	r6, r6, #31
20027e1c:	d501      	bpl.n	20027e22 <mbedtls_mpi_lsb+0x24>
20027e1e:	1898      	adds	r0, r3, r2
20027e20:	bd70      	pop	{r4, r5, r6, pc}
20027e22:	3201      	adds	r2, #1
20027e24:	2a20      	cmp	r2, #32
20027e26:	d1f6      	bne.n	20027e16 <mbedtls_mpi_lsb+0x18>
20027e28:	3320      	adds	r3, #32
20027e2a:	3101      	adds	r1, #1
20027e2c:	e7eb      	b.n	20027e06 <mbedtls_mpi_lsb+0x8>

20027e2e <mbedtls_mpi_bitlen>:
20027e2e:	4602      	mov	r2, r0
20027e30:	6840      	ldr	r0, [r0, #4]
20027e32:	b188      	cbz	r0, 20027e58 <mbedtls_mpi_bitlen+0x2a>
20027e34:	6891      	ldr	r1, [r2, #8]
20027e36:	1e43      	subs	r3, r0, #1
20027e38:	b97b      	cbnz	r3, 20027e5a <mbedtls_mpi_bitlen+0x2c>
20027e3a:	461a      	mov	r2, r3
20027e3c:	5889      	ldr	r1, [r1, r2]
20027e3e:	2000      	movs	r0, #0
20027e40:	f04f 4200 	mov.w	r2, #2147483648	@ 0x80000000
20027e44:	4211      	tst	r1, r2
20027e46:	d104      	bne.n	20027e52 <mbedtls_mpi_bitlen+0x24>
20027e48:	3001      	adds	r0, #1
20027e4a:	2820      	cmp	r0, #32
20027e4c:	ea4f 0252 	mov.w	r2, r2, lsr #1
20027e50:	d1f8      	bne.n	20027e44 <mbedtls_mpi_bitlen+0x16>
20027e52:	3301      	adds	r3, #1
20027e54:	ebc0 1043 	rsb	r0, r0, r3, lsl #5
20027e58:	4770      	bx	lr
20027e5a:	f851 0023 	ldr.w	r0, [r1, r3, lsl #2]
20027e5e:	009a      	lsls	r2, r3, #2
20027e60:	2800      	cmp	r0, #0
20027e62:	d1eb      	bne.n	20027e3c <mbedtls_mpi_bitlen+0xe>
20027e64:	3b01      	subs	r3, #1
20027e66:	e7e7      	b.n	20027e38 <mbedtls_mpi_bitlen+0xa>

20027e68 <mbedtls_mpi_size>:
20027e68:	b508      	push	{r3, lr}
20027e6a:	f7ff ffe0 	bl	20027e2e <mbedtls_mpi_bitlen>
20027e6e:	3007      	adds	r0, #7
20027e70:	08c0      	lsrs	r0, r0, #3
20027e72:	bd08      	pop	{r3, pc}

20027e74 <mbedtls_mpi_read_binary>:
20027e74:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
20027e76:	4607      	mov	r7, r0
20027e78:	460c      	mov	r4, r1
20027e7a:	4616      	mov	r6, r2
20027e7c:	2500      	movs	r5, #0
20027e7e:	42b5      	cmp	r5, r6
20027e80:	d001      	beq.n	20027e86 <mbedtls_mpi_read_binary+0x12>
20027e82:	5d63      	ldrb	r3, [r4, r5]
20027e84:	b173      	cbz	r3, 20027ea4 <mbedtls_mpi_read_binary+0x30>
20027e86:	1b71      	subs	r1, r6, r5
20027e88:	f011 0303 	ands.w	r3, r1, #3
20027e8c:	bf18      	it	ne
20027e8e:	2301      	movne	r3, #1
20027e90:	4638      	mov	r0, r7
20027e92:	eb03 0191 	add.w	r1, r3, r1, lsr #2
20027e96:	f7ff ff41 	bl	20027d1c <mbedtls_mpi_grow>
20027e9a:	4601      	mov	r1, r0
20027e9c:	b120      	cbz	r0, 20027ea8 <mbedtls_mpi_read_binary+0x34>
20027e9e:	f06f 000f 	mvn.w	r0, #15
20027ea2:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
20027ea4:	3501      	adds	r5, #1
20027ea6:	e7ea      	b.n	20027e7e <mbedtls_mpi_read_binary+0xa>
20027ea8:	4638      	mov	r0, r7
20027eaa:	f7ff ff8c 	bl	20027dc6 <mbedtls_mpi_lset>
20027eae:	2800      	cmp	r0, #0
20027eb0:	d1f5      	bne.n	20027e9e <mbedtls_mpi_read_binary+0x2a>
20027eb2:	4603      	mov	r3, r0
20027eb4:	4434      	add	r4, r6
20027eb6:	1af2      	subs	r2, r6, r3
20027eb8:	4295      	cmp	r5, r2
20027eba:	d2f2      	bcs.n	20027ea2 <mbedtls_mpi_read_binary+0x2e>
20027ebc:	f8d7 e008 	ldr.w	lr, [r7, #8]
20027ec0:	f814 1d01 	ldrb.w	r1, [r4, #-1]!
20027ec4:	00da      	lsls	r2, r3, #3
20027ec6:	f023 0c03 	bic.w	ip, r3, #3
20027eca:	f002 0218 	and.w	r2, r2, #24
20027ece:	4091      	lsls	r1, r2
20027ed0:	f85e 200c 	ldr.w	r2, [lr, ip]
20027ed4:	3301      	adds	r3, #1
20027ed6:	430a      	orrs	r2, r1
20027ed8:	f84e 200c 	str.w	r2, [lr, ip]
20027edc:	e7eb      	b.n	20027eb6 <mbedtls_mpi_read_binary+0x42>

20027ede <mbedtls_mpi_write_binary>:
20027ede:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
20027ee0:	4615      	mov	r5, r2
20027ee2:	4607      	mov	r7, r0
20027ee4:	460c      	mov	r4, r1
20027ee6:	f7ff ffbf 	bl	20027e68 <mbedtls_mpi_size>
20027eea:	42a8      	cmp	r0, r5
20027eec:	4606      	mov	r6, r0
20027eee:	d816      	bhi.n	20027f1e <mbedtls_mpi_write_binary+0x40>
20027ef0:	4620      	mov	r0, r4
20027ef2:	462a      	mov	r2, r5
20027ef4:	2100      	movs	r1, #0
20027ef6:	f002 fca5 	bl	2002a844 <memset>
20027efa:	2300      	movs	r3, #0
20027efc:	442c      	add	r4, r5
20027efe:	42b3      	cmp	r3, r6
20027f00:	d101      	bne.n	20027f06 <mbedtls_mpi_write_binary+0x28>
20027f02:	2000      	movs	r0, #0
20027f04:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
20027f06:	68b8      	ldr	r0, [r7, #8]
20027f08:	f023 0203 	bic.w	r2, r3, #3
20027f0c:	5882      	ldr	r2, [r0, r2]
20027f0e:	00d9      	lsls	r1, r3, #3
20027f10:	f001 0118 	and.w	r1, r1, #24
20027f14:	40ca      	lsrs	r2, r1
20027f16:	f804 2d01 	strb.w	r2, [r4, #-1]!
20027f1a:	3301      	adds	r3, #1
20027f1c:	e7ef      	b.n	20027efe <mbedtls_mpi_write_binary+0x20>
20027f1e:	f06f 0007 	mvn.w	r0, #7
20027f22:	e7ef      	b.n	20027f04 <mbedtls_mpi_write_binary+0x26>

20027f24 <mbedtls_mpi_shift_l>:
20027f24:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
20027f26:	4605      	mov	r5, r0
20027f28:	460e      	mov	r6, r1
20027f2a:	094c      	lsrs	r4, r1, #5
20027f2c:	f001 071f 	and.w	r7, r1, #31
20027f30:	f7ff ff7d 	bl	20027e2e <mbedtls_mpi_bitlen>
20027f34:	686b      	ldr	r3, [r5, #4]
20027f36:	4430      	add	r0, r6
20027f38:	ebb0 1f43 	cmp.w	r0, r3, lsl #5
20027f3c:	d805      	bhi.n	20027f4a <mbedtls_mpi_shift_l+0x26>
20027f3e:	2e1f      	cmp	r6, #31
20027f40:	d811      	bhi.n	20027f66 <mbedtls_mpi_shift_l+0x42>
20027f42:	2f00      	cmp	r7, #0
20027f44:	d143      	bne.n	20027fce <mbedtls_mpi_shift_l+0xaa>
20027f46:	2000      	movs	r0, #0
20027f48:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
20027f4a:	f010 011f 	ands.w	r1, r0, #31
20027f4e:	bf18      	it	ne
20027f50:	2101      	movne	r1, #1
20027f52:	eb01 1150 	add.w	r1, r1, r0, lsr #5
20027f56:	4628      	mov	r0, r5
20027f58:	f7ff fee0 	bl	20027d1c <mbedtls_mpi_grow>
20027f5c:	2800      	cmp	r0, #0
20027f5e:	d0ee      	beq.n	20027f3e <mbedtls_mpi_shift_l+0x1a>
20027f60:	f06f 000f 	mvn.w	r0, #15
20027f64:	e7f0      	b.n	20027f48 <mbedtls_mpi_shift_l+0x24>
20027f66:	f06f 0003 	mvn.w	r0, #3
20027f6a:	686a      	ldr	r2, [r5, #4]
20027f6c:	4360      	muls	r0, r4
20027f6e:	4611      	mov	r1, r2
20027f70:	0093      	lsls	r3, r2, #2
20027f72:	42a1      	cmp	r1, r4
20027f74:	f1a3 0304 	sub.w	r3, r3, #4
20027f78:	d80c      	bhi.n	20027f94 <mbedtls_mpi_shift_l+0x70>
20027f7a:	1aa3      	subs	r3, r4, r2
20027f7c:	4294      	cmp	r4, r2
20027f7e:	bf88      	it	hi
20027f80:	2300      	movhi	r3, #0
20027f82:	4413      	add	r3, r2
20027f84:	2200      	movs	r2, #0
20027f86:	009b      	lsls	r3, r3, #2
20027f88:	3b04      	subs	r3, #4
20027f8a:	1d19      	adds	r1, r3, #4
20027f8c:	d0d9      	beq.n	20027f42 <mbedtls_mpi_shift_l+0x1e>
20027f8e:	68a9      	ldr	r1, [r5, #8]
20027f90:	50ca      	str	r2, [r1, r3]
20027f92:	e7f9      	b.n	20027f88 <mbedtls_mpi_shift_l+0x64>
20027f94:	68ae      	ldr	r6, [r5, #8]
20027f96:	3901      	subs	r1, #1
20027f98:	eb06 0c03 	add.w	ip, r6, r3
20027f9c:	f85c c000 	ldr.w	ip, [ip, r0]
20027fa0:	f846 c003 	str.w	ip, [r6, r3]
20027fa4:	e7e5      	b.n	20027f72 <mbedtls_mpi_shift_l+0x4e>
20027fa6:	68ab      	ldr	r3, [r5, #8]
20027fa8:	f853 1024 	ldr.w	r1, [r3, r4, lsl #2]
20027fac:	fa01 f007 	lsl.w	r0, r1, r7
20027fb0:	f843 0024 	str.w	r0, [r3, r4, lsl #2]
20027fb4:	68a8      	ldr	r0, [r5, #8]
20027fb6:	f850 3024 	ldr.w	r3, [r0, r4, lsl #2]
20027fba:	4313      	orrs	r3, r2
20027fbc:	f840 3024 	str.w	r3, [r0, r4, lsl #2]
20027fc0:	fa21 f206 	lsr.w	r2, r1, r6
20027fc4:	3401      	adds	r4, #1
20027fc6:	686b      	ldr	r3, [r5, #4]
20027fc8:	42a3      	cmp	r3, r4
20027fca:	d8ec      	bhi.n	20027fa6 <mbedtls_mpi_shift_l+0x82>
20027fcc:	e7bb      	b.n	20027f46 <mbedtls_mpi_shift_l+0x22>
20027fce:	2200      	movs	r2, #0
20027fd0:	f1c7 0620 	rsb	r6, r7, #32
20027fd4:	e7f7      	b.n	20027fc6 <mbedtls_mpi_shift_l+0xa2>

20027fd6 <mbedtls_mpi_shift_r>:
20027fd6:	b4f0      	push	{r4, r5, r6, r7}
20027fd8:	6843      	ldr	r3, [r0, #4]
20027fda:	094c      	lsrs	r4, r1, #5
20027fdc:	42a3      	cmp	r3, r4
20027fde:	f001 021f 	and.w	r2, r1, #31
20027fe2:	d301      	bcc.n	20027fe8 <mbedtls_mpi_shift_r+0x12>
20027fe4:	d104      	bne.n	20027ff0 <mbedtls_mpi_shift_r+0x1a>
20027fe6:	b392      	cbz	r2, 2002804e <mbedtls_mpi_shift_r+0x78>
20027fe8:	bcf0      	pop	{r4, r5, r6, r7}
20027fea:	2100      	movs	r1, #0
20027fec:	f7ff beeb 	b.w	20027dc6 <mbedtls_mpi_lset>
20027ff0:	291f      	cmp	r1, #31
20027ff2:	d82e      	bhi.n	20028052 <mbedtls_mpi_shift_r+0x7c>
20027ff4:	b9aa      	cbnz	r2, 20028022 <mbedtls_mpi_shift_r+0x4c>
20027ff6:	bcf0      	pop	{r4, r5, r6, r7}
20027ff8:	2000      	movs	r0, #0
20027ffa:	4770      	bx	lr
20027ffc:	6885      	ldr	r5, [r0, #8]
20027ffe:	586e      	ldr	r6, [r5, r1]
20028000:	3104      	adds	r1, #4
20028002:	f845 6023 	str.w	r6, [r5, r3, lsl #2]
20028006:	3301      	adds	r3, #1
20028008:	6845      	ldr	r5, [r0, #4]
2002800a:	1b2d      	subs	r5, r5, r4
2002800c:	429d      	cmp	r5, r3
2002800e:	d8f5      	bhi.n	20027ffc <mbedtls_mpi_shift_r+0x26>
20028010:	2400      	movs	r4, #0
20028012:	6841      	ldr	r1, [r0, #4]
20028014:	4299      	cmp	r1, r3
20028016:	d9ed      	bls.n	20027ff4 <mbedtls_mpi_shift_r+0x1e>
20028018:	6881      	ldr	r1, [r0, #8]
2002801a:	f841 4023 	str.w	r4, [r1, r3, lsl #2]
2002801e:	3301      	adds	r3, #1
20028020:	e7f7      	b.n	20028012 <mbedtls_mpi_shift_r+0x3c>
20028022:	2400      	movs	r4, #0
20028024:	6843      	ldr	r3, [r0, #4]
20028026:	f1c2 0720 	rsb	r7, r2, #32
2002802a:	3b01      	subs	r3, #1
2002802c:	d3e3      	bcc.n	20027ff6 <mbedtls_mpi_shift_r+0x20>
2002802e:	6881      	ldr	r1, [r0, #8]
20028030:	f851 5023 	ldr.w	r5, [r1, r3, lsl #2]
20028034:	fa25 f602 	lsr.w	r6, r5, r2
20028038:	f841 6023 	str.w	r6, [r1, r3, lsl #2]
2002803c:	6886      	ldr	r6, [r0, #8]
2002803e:	f856 1023 	ldr.w	r1, [r6, r3, lsl #2]
20028042:	4321      	orrs	r1, r4
20028044:	f846 1023 	str.w	r1, [r6, r3, lsl #2]
20028048:	fa05 f407 	lsl.w	r4, r5, r7
2002804c:	e7ed      	b.n	2002802a <mbedtls_mpi_shift_r+0x54>
2002804e:	291f      	cmp	r1, #31
20028050:	d9d1      	bls.n	20027ff6 <mbedtls_mpi_shift_r+0x20>
20028052:	2300      	movs	r3, #0
20028054:	00a1      	lsls	r1, r4, #2
20028056:	e7d7      	b.n	20028008 <mbedtls_mpi_shift_r+0x32>

20028058 <mbedtls_mpi_cmp_abs>:
20028058:	b530      	push	{r4, r5, lr}
2002805a:	6842      	ldr	r2, [r0, #4]
2002805c:	b922      	cbnz	r2, 20028068 <mbedtls_mpi_cmp_abs+0x10>
2002805e:	684b      	ldr	r3, [r1, #4]
20028060:	b95b      	cbnz	r3, 2002807a <mbedtls_mpi_cmp_abs+0x22>
20028062:	b19a      	cbz	r2, 2002808c <mbedtls_mpi_cmp_abs+0x34>
20028064:	2001      	movs	r0, #1
20028066:	e015      	b.n	20028094 <mbedtls_mpi_cmp_abs+0x3c>
20028068:	6883      	ldr	r3, [r0, #8]
2002806a:	eb03 0382 	add.w	r3, r3, r2, lsl #2
2002806e:	f853 3c04 	ldr.w	r3, [r3, #-4]
20028072:	2b00      	cmp	r3, #0
20028074:	d1f3      	bne.n	2002805e <mbedtls_mpi_cmp_abs+0x6>
20028076:	3a01      	subs	r2, #1
20028078:	e7f0      	b.n	2002805c <mbedtls_mpi_cmp_abs+0x4>
2002807a:	688c      	ldr	r4, [r1, #8]
2002807c:	eb04 0583 	add.w	r5, r4, r3, lsl #2
20028080:	f855 5c04 	ldr.w	r5, [r5, #-4]
20028084:	b90d      	cbnz	r5, 2002808a <mbedtls_mpi_cmp_abs+0x32>
20028086:	3b01      	subs	r3, #1
20028088:	e7ea      	b.n	20028060 <mbedtls_mpi_cmp_abs+0x8>
2002808a:	b922      	cbnz	r2, 20028096 <mbedtls_mpi_cmp_abs+0x3e>
2002808c:	1e18      	subs	r0, r3, #0
2002808e:	bf18      	it	ne
20028090:	2001      	movne	r0, #1
20028092:	4240      	negs	r0, r0
20028094:	bd30      	pop	{r4, r5, pc}
20028096:	4293      	cmp	r3, r2
20028098:	d3e4      	bcc.n	20028064 <mbedtls_mpi_cmp_abs+0xc>
2002809a:	d80e      	bhi.n	200280ba <mbedtls_mpi_cmp_abs+0x62>
2002809c:	3a01      	subs	r2, #1
2002809e:	6883      	ldr	r3, [r0, #8]
200280a0:	f853 1022 	ldr.w	r1, [r3, r2, lsl #2]
200280a4:	f854 3022 	ldr.w	r3, [r4, r2, lsl #2]
200280a8:	4299      	cmp	r1, r3
200280aa:	d8db      	bhi.n	20028064 <mbedtls_mpi_cmp_abs+0xc>
200280ac:	f102 32ff 	add.w	r2, r2, #4294967295	@ 0xffffffff
200280b0:	d303      	bcc.n	200280ba <mbedtls_mpi_cmp_abs+0x62>
200280b2:	1c53      	adds	r3, r2, #1
200280b4:	d1f3      	bne.n	2002809e <mbedtls_mpi_cmp_abs+0x46>
200280b6:	2000      	movs	r0, #0
200280b8:	e7ec      	b.n	20028094 <mbedtls_mpi_cmp_abs+0x3c>
200280ba:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
200280be:	e7e9      	b.n	20028094 <mbedtls_mpi_cmp_abs+0x3c>

200280c0 <mpi_montmul>:
200280c0:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
200280c4:	4615      	mov	r5, r2
200280c6:	b087      	sub	sp, #28
200280c8:	9305      	str	r3, [sp, #20]
200280ca:	9b10      	ldr	r3, [sp, #64]	@ 0x40
200280cc:	4606      	mov	r6, r0
200280ce:	685a      	ldr	r2, [r3, #4]
200280d0:	686b      	ldr	r3, [r5, #4]
200280d2:	4689      	mov	r9, r1
200280d4:	3301      	adds	r3, #1
200280d6:	429a      	cmp	r2, r3
200280d8:	d359      	bcc.n	2002818e <mpi_montmul+0xce>
200280da:	9b10      	ldr	r3, [sp, #64]	@ 0x40
200280dc:	6898      	ldr	r0, [r3, #8]
200280de:	2800      	cmp	r0, #0
200280e0:	d055      	beq.n	2002818e <mpi_montmul+0xce>
200280e2:	0092      	lsls	r2, r2, #2
200280e4:	2100      	movs	r1, #0
200280e6:	f002 fbad 	bl	2002a844 <memset>
200280ea:	9b10      	ldr	r3, [sp, #64]	@ 0x40
200280ec:	f8d5 8004 	ldr.w	r8, [r5, #4]
200280f0:	f8d3 a008 	ldr.w	sl, [r3, #8]
200280f4:	f8d9 3004 	ldr.w	r3, [r9, #4]
200280f8:	46d3      	mov	fp, sl
200280fa:	4543      	cmp	r3, r8
200280fc:	bf28      	it	cs
200280fe:	4643      	movcs	r3, r8
20028100:	2400      	movs	r4, #0
20028102:	9304      	str	r3, [sp, #16]
20028104:	f108 0301 	add.w	r3, r8, #1
20028108:	009a      	lsls	r2, r3, #2
2002810a:	eb0a 0383 	add.w	r3, sl, r3, lsl #2
2002810e:	9202      	str	r2, [sp, #8]
20028110:	9303      	str	r3, [sp, #12]
20028112:	4544      	cmp	r4, r8
20028114:	68b0      	ldr	r0, [r6, #8]
20028116:	d118      	bne.n	2002814a <mpi_montmul+0x8a>
20028118:	9b02      	ldr	r3, [sp, #8]
2002811a:	1f19      	subs	r1, r3, #4
2002811c:	461a      	mov	r2, r3
2002811e:	4451      	add	r1, sl
20028120:	f002 fbaa 	bl	2002a878 <memcpy>
20028124:	4629      	mov	r1, r5
20028126:	4630      	mov	r0, r6
20028128:	f7ff ff96 	bl	20028058 <mbedtls_mpi_cmp_abs>
2002812c:	3001      	adds	r0, #1
2002812e:	68b1      	ldr	r1, [r6, #8]
20028130:	bf0c      	ite	eq
20028132:	9b10      	ldreq	r3, [sp, #64]	@ 0x40
20028134:	460a      	movne	r2, r1
20028136:	4620      	mov	r0, r4
20028138:	bf14      	ite	ne
2002813a:	68a9      	ldrne	r1, [r5, #8]
2002813c:	689a      	ldreq	r2, [r3, #8]
2002813e:	f7ff fc2c 	bl	2002799a <mpi_sub_hlp>
20028142:	2000      	movs	r0, #0
20028144:	b007      	add	sp, #28
20028146:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
2002814a:	f850 3024 	ldr.w	r3, [r0, r4, lsl #2]
2002814e:	f8d9 1008 	ldr.w	r1, [r9, #8]
20028152:	9301      	str	r3, [sp, #4]
20028154:	9a01      	ldr	r2, [sp, #4]
20028156:	680b      	ldr	r3, [r1, #0]
20028158:	f8db 7000 	ldr.w	r7, [fp]
2002815c:	9804      	ldr	r0, [sp, #16]
2002815e:	fb03 7702 	mla	r7, r3, r2, r7
20028162:	9b05      	ldr	r3, [sp, #20]
20028164:	3401      	adds	r4, #1
20028166:	435f      	muls	r7, r3
20028168:	4613      	mov	r3, r2
2002816a:	465a      	mov	r2, fp
2002816c:	f7ff fc3e 	bl	200279ec <mpi_mul_hlp>
20028170:	465a      	mov	r2, fp
20028172:	463b      	mov	r3, r7
20028174:	4640      	mov	r0, r8
20028176:	68a9      	ldr	r1, [r5, #8]
20028178:	f7ff fc38 	bl	200279ec <mpi_mul_hlp>
2002817c:	2200      	movs	r2, #0
2002817e:	9b01      	ldr	r3, [sp, #4]
20028180:	f84b 3b04 	str.w	r3, [fp], #4
20028184:	9b03      	ldr	r3, [sp, #12]
20028186:	f843 2f04 	str.w	r2, [r3, #4]!
2002818a:	9303      	str	r3, [sp, #12]
2002818c:	e7c1      	b.n	20028112 <mpi_montmul+0x52>
2002818e:	f06f 0003 	mvn.w	r0, #3
20028192:	e7d7      	b.n	20028144 <mpi_montmul+0x84>

20028194 <mbedtls_mpi_cmp_mpi>:
20028194:	4602      	mov	r2, r0
20028196:	b530      	push	{r4, r5, lr}
20028198:	6843      	ldr	r3, [r0, #4]
2002819a:	b923      	cbnz	r3, 200281a6 <mbedtls_mpi_cmp_mpi+0x12>
2002819c:	6848      	ldr	r0, [r1, #4]
2002819e:	b958      	cbnz	r0, 200281b8 <mbedtls_mpi_cmp_mpi+0x24>
200281a0:	2b00      	cmp	r3, #0
200281a2:	d136      	bne.n	20028212 <mbedtls_mpi_cmp_mpi+0x7e>
200281a4:	e02f      	b.n	20028206 <mbedtls_mpi_cmp_mpi+0x72>
200281a6:	6890      	ldr	r0, [r2, #8]
200281a8:	eb00 0083 	add.w	r0, r0, r3, lsl #2
200281ac:	f850 0c04 	ldr.w	r0, [r0, #-4]
200281b0:	2800      	cmp	r0, #0
200281b2:	d1f3      	bne.n	2002819c <mbedtls_mpi_cmp_mpi+0x8>
200281b4:	3b01      	subs	r3, #1
200281b6:	e7f0      	b.n	2002819a <mbedtls_mpi_cmp_mpi+0x6>
200281b8:	688c      	ldr	r4, [r1, #8]
200281ba:	eb04 0580 	add.w	r5, r4, r0, lsl #2
200281be:	f855 5c04 	ldr.w	r5, [r5, #-4]
200281c2:	bb15      	cbnz	r5, 2002820a <mbedtls_mpi_cmp_mpi+0x76>
200281c4:	3801      	subs	r0, #1
200281c6:	e7ea      	b.n	2002819e <mbedtls_mpi_cmp_mpi+0xa>
200281c8:	680d      	ldr	r5, [r1, #0]
200281ca:	d202      	bcs.n	200281d2 <mbedtls_mpi_cmp_mpi+0x3e>
200281cc:	6808      	ldr	r0, [r1, #0]
200281ce:	4240      	negs	r0, r0
200281d0:	e020      	b.n	20028214 <mbedtls_mpi_cmp_mpi+0x80>
200281d2:	6810      	ldr	r0, [r2, #0]
200281d4:	2800      	cmp	r0, #0
200281d6:	dd03      	ble.n	200281e0 <mbedtls_mpi_cmp_mpi+0x4c>
200281d8:	2d00      	cmp	r5, #0
200281da:	da07      	bge.n	200281ec <mbedtls_mpi_cmp_mpi+0x58>
200281dc:	2001      	movs	r0, #1
200281de:	e019      	b.n	20028214 <mbedtls_mpi_cmp_mpi+0x80>
200281e0:	2d00      	cmp	r5, #0
200281e2:	dd03      	ble.n	200281ec <mbedtls_mpi_cmp_mpi+0x58>
200281e4:	b110      	cbz	r0, 200281ec <mbedtls_mpi_cmp_mpi+0x58>
200281e6:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
200281ea:	e013      	b.n	20028214 <mbedtls_mpi_cmp_mpi+0x80>
200281ec:	3b01      	subs	r3, #1
200281ee:	6891      	ldr	r1, [r2, #8]
200281f0:	f851 5023 	ldr.w	r5, [r1, r3, lsl #2]
200281f4:	f854 1023 	ldr.w	r1, [r4, r3, lsl #2]
200281f8:	428d      	cmp	r5, r1
200281fa:	d80b      	bhi.n	20028214 <mbedtls_mpi_cmp_mpi+0x80>
200281fc:	f103 33ff 	add.w	r3, r3, #4294967295	@ 0xffffffff
20028200:	d3e5      	bcc.n	200281ce <mbedtls_mpi_cmp_mpi+0x3a>
20028202:	1c59      	adds	r1, r3, #1
20028204:	d1f3      	bne.n	200281ee <mbedtls_mpi_cmp_mpi+0x5a>
20028206:	2000      	movs	r0, #0
20028208:	e004      	b.n	20028214 <mbedtls_mpi_cmp_mpi+0x80>
2002820a:	2b00      	cmp	r3, #0
2002820c:	d0de      	beq.n	200281cc <mbedtls_mpi_cmp_mpi+0x38>
2002820e:	4283      	cmp	r3, r0
20028210:	d9da      	bls.n	200281c8 <mbedtls_mpi_cmp_mpi+0x34>
20028212:	6810      	ldr	r0, [r2, #0]
20028214:	bd30      	pop	{r4, r5, pc}

20028216 <mbedtls_mpi_cmp_int>:
20028216:	b51f      	push	{r0, r1, r2, r3, r4, lr}
20028218:	ea81 73e1 	eor.w	r3, r1, r1, asr #31
2002821c:	eba3 73e1 	sub.w	r3, r3, r1, asr #31
20028220:	2900      	cmp	r1, #0
20028222:	9300      	str	r3, [sp, #0]
20028224:	bfac      	ite	ge
20028226:	2301      	movge	r3, #1
20028228:	f04f 33ff 	movlt.w	r3, #4294967295	@ 0xffffffff
2002822c:	9301      	str	r3, [sp, #4]
2002822e:	2301      	movs	r3, #1
20028230:	a901      	add	r1, sp, #4
20028232:	9302      	str	r3, [sp, #8]
20028234:	f8cd d00c 	str.w	sp, [sp, #12]
20028238:	f7ff ffac 	bl	20028194 <mbedtls_mpi_cmp_mpi>
2002823c:	b005      	add	sp, #20
2002823e:	f85d fb04 	ldr.w	pc, [sp], #4

20028242 <mbedtls_mpi_add_abs>:
20028242:	4290      	cmp	r0, r2
20028244:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
20028248:	4606      	mov	r6, r0
2002824a:	460c      	mov	r4, r1
2002824c:	4615      	mov	r5, r2
2002824e:	d002      	beq.n	20028256 <mbedtls_mpi_add_abs+0x14>
20028250:	4288      	cmp	r0, r1
20028252:	d12c      	bne.n	200282ae <mbedtls_mpi_add_abs+0x6c>
20028254:	462c      	mov	r4, r5
20028256:	2301      	movs	r3, #1
20028258:	6033      	str	r3, [r6, #0]
2002825a:	6865      	ldr	r5, [r4, #4]
2002825c:	bb85      	cbnz	r5, 200282c0 <mbedtls_mpi_add_abs+0x7e>
2002825e:	4629      	mov	r1, r5
20028260:	4630      	mov	r0, r6
20028262:	f7ff fd5b 	bl	20027d1c <mbedtls_mpi_grow>
20028266:	4607      	mov	r7, r0
20028268:	bb28      	cbnz	r0, 200282b6 <mbedtls_mpi_add_abs+0x74>
2002826a:	68b3      	ldr	r3, [r6, #8]
2002826c:	68a1      	ldr	r1, [r4, #8]
2002826e:	469c      	mov	ip, r3
20028270:	4604      	mov	r4, r0
20028272:	42a8      	cmp	r0, r5
20028274:	d12d      	bne.n	200282d2 <mbedtls_mpi_add_abs+0x90>
20028276:	eb03 0385 	add.w	r3, r3, r5, lsl #2
2002827a:	b1f4      	cbz	r4, 200282ba <mbedtls_mpi_add_abs+0x78>
2002827c:	6872      	ldr	r2, [r6, #4]
2002827e:	f105 0801 	add.w	r8, r5, #1
20028282:	42aa      	cmp	r2, r5
20028284:	d807      	bhi.n	20028296 <mbedtls_mpi_add_abs+0x54>
20028286:	4641      	mov	r1, r8
20028288:	4630      	mov	r0, r6
2002828a:	f7ff fd47 	bl	20027d1c <mbedtls_mpi_grow>
2002828e:	b990      	cbnz	r0, 200282b6 <mbedtls_mpi_add_abs+0x74>
20028290:	68b3      	ldr	r3, [r6, #8]
20028292:	eb03 0385 	add.w	r3, r3, r5, lsl #2
20028296:	681a      	ldr	r2, [r3, #0]
20028298:	4645      	mov	r5, r8
2002829a:	1912      	adds	r2, r2, r4
2002829c:	bf2c      	ite	cs
2002829e:	2401      	movcs	r4, #1
200282a0:	2400      	movcc	r4, #0
200282a2:	3c00      	subs	r4, #0
200282a4:	bf18      	it	ne
200282a6:	2401      	movne	r4, #1
200282a8:	f843 2b04 	str.w	r2, [r3], #4
200282ac:	e7e5      	b.n	2002827a <mbedtls_mpi_add_abs+0x38>
200282ae:	f7ff fd61 	bl	20027d74 <mbedtls_mpi_copy>
200282b2:	2800      	cmp	r0, #0
200282b4:	d0ce      	beq.n	20028254 <mbedtls_mpi_add_abs+0x12>
200282b6:	f06f 070f 	mvn.w	r7, #15
200282ba:	4638      	mov	r0, r7
200282bc:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
200282c0:	68a3      	ldr	r3, [r4, #8]
200282c2:	eb03 0385 	add.w	r3, r3, r5, lsl #2
200282c6:	f853 3c04 	ldr.w	r3, [r3, #-4]
200282ca:	2b00      	cmp	r3, #0
200282cc:	d1c7      	bne.n	2002825e <mbedtls_mpi_add_abs+0x1c>
200282ce:	3d01      	subs	r5, #1
200282d0:	e7c4      	b.n	2002825c <mbedtls_mpi_add_abs+0x1a>
200282d2:	f8dc 2000 	ldr.w	r2, [ip]
200282d6:	1912      	adds	r2, r2, r4
200282d8:	bf2c      	ite	cs
200282da:	f04f 0e01 	movcs.w	lr, #1
200282de:	f04f 0e00 	movcc.w	lr, #0
200282e2:	f851 4020 	ldr.w	r4, [r1, r0, lsl #2]
200282e6:	3001      	adds	r0, #1
200282e8:	1912      	adds	r2, r2, r4
200282ea:	f84c 2b04 	str.w	r2, [ip], #4
200282ee:	f14e 0400 	adc.w	r4, lr, #0
200282f2:	e7be      	b.n	20028272 <mbedtls_mpi_add_abs+0x30>

200282f4 <mbedtls_mpi_sub_abs>:
200282f4:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
200282f6:	460e      	mov	r6, r1
200282f8:	4605      	mov	r5, r0
200282fa:	4611      	mov	r1, r2
200282fc:	4630      	mov	r0, r6
200282fe:	4614      	mov	r4, r2
20028300:	f7ff feaa 	bl	20028058 <mbedtls_mpi_cmp_abs>
20028304:	3001      	adds	r0, #1
20028306:	d02f      	beq.n	20028368 <mbedtls_mpi_sub_abs+0x74>
20028308:	2300      	movs	r3, #0
2002830a:	2201      	movs	r2, #1
2002830c:	42ac      	cmp	r4, r5
2002830e:	e9cd 2301 	strd	r2, r3, [sp, #4]
20028312:	9303      	str	r3, [sp, #12]
20028314:	d10d      	bne.n	20028332 <mbedtls_mpi_sub_abs+0x3e>
20028316:	4621      	mov	r1, r4
20028318:	a801      	add	r0, sp, #4
2002831a:	f7ff fd2b 	bl	20027d74 <mbedtls_mpi_copy>
2002831e:	b138      	cbz	r0, 20028330 <mbedtls_mpi_sub_abs+0x3c>
20028320:	f06f 040f 	mvn.w	r4, #15
20028324:	a801      	add	r0, sp, #4
20028326:	f7ff fce4 	bl	20027cf2 <mbedtls_mpi_free>
2002832a:	4620      	mov	r0, r4
2002832c:	b004      	add	sp, #16
2002832e:	bd70      	pop	{r4, r5, r6, pc}
20028330:	ac01      	add	r4, sp, #4
20028332:	42ae      	cmp	r6, r5
20028334:	d109      	bne.n	2002834a <mbedtls_mpi_sub_abs+0x56>
20028336:	2301      	movs	r3, #1
20028338:	602b      	str	r3, [r5, #0]
2002833a:	e9d4 0101 	ldrd	r0, r1, [r4, #4]
2002833e:	b958      	cbnz	r0, 20028358 <mbedtls_mpi_sub_abs+0x64>
20028340:	68aa      	ldr	r2, [r5, #8]
20028342:	f7ff fb2a 	bl	2002799a <mpi_sub_hlp>
20028346:	2400      	movs	r4, #0
20028348:	e7ec      	b.n	20028324 <mbedtls_mpi_sub_abs+0x30>
2002834a:	4631      	mov	r1, r6
2002834c:	4628      	mov	r0, r5
2002834e:	f7ff fd11 	bl	20027d74 <mbedtls_mpi_copy>
20028352:	2800      	cmp	r0, #0
20028354:	d0ef      	beq.n	20028336 <mbedtls_mpi_sub_abs+0x42>
20028356:	e7e3      	b.n	20028320 <mbedtls_mpi_sub_abs+0x2c>
20028358:	eb01 0380 	add.w	r3, r1, r0, lsl #2
2002835c:	f853 3c04 	ldr.w	r3, [r3, #-4]
20028360:	2b00      	cmp	r3, #0
20028362:	d1ed      	bne.n	20028340 <mbedtls_mpi_sub_abs+0x4c>
20028364:	3801      	subs	r0, #1
20028366:	e7ea      	b.n	2002833e <mbedtls_mpi_sub_abs+0x4a>
20028368:	f06f 0409 	mvn.w	r4, #9
2002836c:	e7dd      	b.n	2002832a <mbedtls_mpi_sub_abs+0x36>

2002836e <mbedtls_mpi_add_mpi>:
2002836e:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
20028370:	680d      	ldr	r5, [r1, #0]
20028372:	6813      	ldr	r3, [r2, #0]
20028374:	4604      	mov	r4, r0
20028376:	436b      	muls	r3, r5
20028378:	460f      	mov	r7, r1
2002837a:	4616      	mov	r6, r2
2002837c:	d516      	bpl.n	200283ac <mbedtls_mpi_add_mpi+0x3e>
2002837e:	4611      	mov	r1, r2
20028380:	4638      	mov	r0, r7
20028382:	f7ff fe69 	bl	20028058 <mbedtls_mpi_cmp_abs>
20028386:	3001      	adds	r0, #1
20028388:	d007      	beq.n	2002839a <mbedtls_mpi_add_mpi+0x2c>
2002838a:	4632      	mov	r2, r6
2002838c:	4639      	mov	r1, r7
2002838e:	4620      	mov	r0, r4
20028390:	f7ff ffb0 	bl	200282f4 <mbedtls_mpi_sub_abs>
20028394:	b900      	cbnz	r0, 20028398 <mbedtls_mpi_add_mpi+0x2a>
20028396:	6025      	str	r5, [r4, #0]
20028398:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
2002839a:	463a      	mov	r2, r7
2002839c:	4631      	mov	r1, r6
2002839e:	4620      	mov	r0, r4
200283a0:	f7ff ffa8 	bl	200282f4 <mbedtls_mpi_sub_abs>
200283a4:	2800      	cmp	r0, #0
200283a6:	d1f7      	bne.n	20028398 <mbedtls_mpi_add_mpi+0x2a>
200283a8:	426d      	negs	r5, r5
200283aa:	e7f4      	b.n	20028396 <mbedtls_mpi_add_mpi+0x28>
200283ac:	f7ff ff49 	bl	20028242 <mbedtls_mpi_add_abs>
200283b0:	2800      	cmp	r0, #0
200283b2:	d0f0      	beq.n	20028396 <mbedtls_mpi_add_mpi+0x28>
200283b4:	f06f 000f 	mvn.w	r0, #15
200283b8:	e7ee      	b.n	20028398 <mbedtls_mpi_add_mpi+0x2a>

200283ba <mbedtls_mpi_sub_mpi>:
200283ba:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
200283bc:	680d      	ldr	r5, [r1, #0]
200283be:	6813      	ldr	r3, [r2, #0]
200283c0:	4604      	mov	r4, r0
200283c2:	436b      	muls	r3, r5
200283c4:	2b00      	cmp	r3, #0
200283c6:	460f      	mov	r7, r1
200283c8:	4616      	mov	r6, r2
200283ca:	dd16      	ble.n	200283fa <mbedtls_mpi_sub_mpi+0x40>
200283cc:	4611      	mov	r1, r2
200283ce:	4638      	mov	r0, r7
200283d0:	f7ff fe42 	bl	20028058 <mbedtls_mpi_cmp_abs>
200283d4:	3001      	adds	r0, #1
200283d6:	d007      	beq.n	200283e8 <mbedtls_mpi_sub_mpi+0x2e>
200283d8:	4632      	mov	r2, r6
200283da:	4639      	mov	r1, r7
200283dc:	4620      	mov	r0, r4
200283de:	f7ff ff89 	bl	200282f4 <mbedtls_mpi_sub_abs>
200283e2:	b900      	cbnz	r0, 200283e6 <mbedtls_mpi_sub_mpi+0x2c>
200283e4:	6025      	str	r5, [r4, #0]
200283e6:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
200283e8:	463a      	mov	r2, r7
200283ea:	4631      	mov	r1, r6
200283ec:	4620      	mov	r0, r4
200283ee:	f7ff ff81 	bl	200282f4 <mbedtls_mpi_sub_abs>
200283f2:	2800      	cmp	r0, #0
200283f4:	d1f7      	bne.n	200283e6 <mbedtls_mpi_sub_mpi+0x2c>
200283f6:	426d      	negs	r5, r5
200283f8:	e7f4      	b.n	200283e4 <mbedtls_mpi_sub_mpi+0x2a>
200283fa:	f7ff ff22 	bl	20028242 <mbedtls_mpi_add_abs>
200283fe:	2800      	cmp	r0, #0
20028400:	d0f0      	beq.n	200283e4 <mbedtls_mpi_sub_mpi+0x2a>
20028402:	f06f 000f 	mvn.w	r0, #15
20028406:	e7ee      	b.n	200283e6 <mbedtls_mpi_sub_mpi+0x2c>

20028408 <mbedtls_mpi_sub_int>:
20028408:	b51f      	push	{r0, r1, r2, r3, r4, lr}
2002840a:	ea82 73e2 	eor.w	r3, r2, r2, asr #31
2002840e:	eba3 73e2 	sub.w	r3, r3, r2, asr #31
20028412:	2a00      	cmp	r2, #0
20028414:	9300      	str	r3, [sp, #0]
20028416:	bfac      	ite	ge
20028418:	2301      	movge	r3, #1
2002841a:	f04f 33ff 	movlt.w	r3, #4294967295	@ 0xffffffff
2002841e:	9301      	str	r3, [sp, #4]
20028420:	2301      	movs	r3, #1
20028422:	aa01      	add	r2, sp, #4
20028424:	9302      	str	r3, [sp, #8]
20028426:	f8cd d00c 	str.w	sp, [sp, #12]
2002842a:	f7ff ffc6 	bl	200283ba <mbedtls_mpi_sub_mpi>
2002842e:	b005      	add	sp, #20
20028430:	f85d fb04 	ldr.w	pc, [sp], #4

20028434 <mbedtls_mpi_mul_mpi>:
20028434:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
20028438:	2300      	movs	r3, #0
2002843a:	4615      	mov	r5, r2
2002843c:	2201      	movs	r2, #1
2002843e:	b087      	sub	sp, #28
20028440:	4288      	cmp	r0, r1
20028442:	4607      	mov	r7, r0
20028444:	460e      	mov	r6, r1
20028446:	e9cd 2300 	strd	r2, r3, [sp]
2002844a:	e9cd 3202 	strd	r3, r2, [sp, #8]
2002844e:	e9cd 3304 	strd	r3, r3, [sp, #16]
20028452:	d110      	bne.n	20028476 <mbedtls_mpi_mul_mpi+0x42>
20028454:	4668      	mov	r0, sp
20028456:	f7ff fc8d 	bl	20027d74 <mbedtls_mpi_copy>
2002845a:	b158      	cbz	r0, 20028474 <mbedtls_mpi_mul_mpi+0x40>
2002845c:	f06f 090f 	mvn.w	r9, #15
20028460:	a803      	add	r0, sp, #12
20028462:	f7ff fc46 	bl	20027cf2 <mbedtls_mpi_free>
20028466:	4668      	mov	r0, sp
20028468:	f7ff fc43 	bl	20027cf2 <mbedtls_mpi_free>
2002846c:	4648      	mov	r0, r9
2002846e:	b007      	add	sp, #28
20028470:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
20028474:	466e      	mov	r6, sp
20028476:	42af      	cmp	r7, r5
20028478:	d106      	bne.n	20028488 <mbedtls_mpi_mul_mpi+0x54>
2002847a:	4639      	mov	r1, r7
2002847c:	a803      	add	r0, sp, #12
2002847e:	f7ff fc79 	bl	20027d74 <mbedtls_mpi_copy>
20028482:	2800      	cmp	r0, #0
20028484:	d1ea      	bne.n	2002845c <mbedtls_mpi_mul_mpi+0x28>
20028486:	ad03      	add	r5, sp, #12
20028488:	f8d6 8004 	ldr.w	r8, [r6, #4]
2002848c:	f1b8 0f00 	cmp.w	r8, #0
20028490:	d116      	bne.n	200284c0 <mbedtls_mpi_mul_mpi+0x8c>
20028492:	686c      	ldr	r4, [r5, #4]
20028494:	b9f4      	cbnz	r4, 200284d4 <mbedtls_mpi_mul_mpi+0xa0>
20028496:	eb08 0104 	add.w	r1, r8, r4
2002849a:	4638      	mov	r0, r7
2002849c:	f7ff fc3e 	bl	20027d1c <mbedtls_mpi_grow>
200284a0:	4601      	mov	r1, r0
200284a2:	2800      	cmp	r0, #0
200284a4:	d1da      	bne.n	2002845c <mbedtls_mpi_mul_mpi+0x28>
200284a6:	4638      	mov	r0, r7
200284a8:	f7ff fc8d 	bl	20027dc6 <mbedtls_mpi_lset>
200284ac:	4681      	mov	r9, r0
200284ae:	2800      	cmp	r0, #0
200284b0:	d1d4      	bne.n	2002845c <mbedtls_mpi_mul_mpi+0x28>
200284b2:	3c01      	subs	r4, #1
200284b4:	d217      	bcs.n	200284e6 <mbedtls_mpi_mul_mpi+0xb2>
200284b6:	6833      	ldr	r3, [r6, #0]
200284b8:	682a      	ldr	r2, [r5, #0]
200284ba:	4353      	muls	r3, r2
200284bc:	603b      	str	r3, [r7, #0]
200284be:	e7cf      	b.n	20028460 <mbedtls_mpi_mul_mpi+0x2c>
200284c0:	68b3      	ldr	r3, [r6, #8]
200284c2:	eb03 0388 	add.w	r3, r3, r8, lsl #2
200284c6:	f853 3c04 	ldr.w	r3, [r3, #-4]
200284ca:	2b00      	cmp	r3, #0
200284cc:	d1e1      	bne.n	20028492 <mbedtls_mpi_mul_mpi+0x5e>
200284ce:	f108 38ff 	add.w	r8, r8, #4294967295	@ 0xffffffff
200284d2:	e7db      	b.n	2002848c <mbedtls_mpi_mul_mpi+0x58>
200284d4:	68ab      	ldr	r3, [r5, #8]
200284d6:	eb03 0384 	add.w	r3, r3, r4, lsl #2
200284da:	f853 3c04 	ldr.w	r3, [r3, #-4]
200284de:	2b00      	cmp	r3, #0
200284e0:	d1d9      	bne.n	20028496 <mbedtls_mpi_mul_mpi+0x62>
200284e2:	3c01      	subs	r4, #1
200284e4:	e7d6      	b.n	20028494 <mbedtls_mpi_mul_mpi+0x60>
200284e6:	68ab      	ldr	r3, [r5, #8]
200284e8:	68ba      	ldr	r2, [r7, #8]
200284ea:	4640      	mov	r0, r8
200284ec:	f853 3024 	ldr.w	r3, [r3, r4, lsl #2]
200284f0:	68b1      	ldr	r1, [r6, #8]
200284f2:	eb02 0284 	add.w	r2, r2, r4, lsl #2
200284f6:	f7ff fa79 	bl	200279ec <mpi_mul_hlp>
200284fa:	e7da      	b.n	200284b2 <mbedtls_mpi_mul_mpi+0x7e>

200284fc <mbedtls_mpi_mul_int>:
200284fc:	b51f      	push	{r0, r1, r2, r3, r4, lr}
200284fe:	2301      	movs	r3, #1
20028500:	9200      	str	r2, [sp, #0]
20028502:	aa01      	add	r2, sp, #4
20028504:	e9cd 3301 	strd	r3, r3, [sp, #4]
20028508:	f8cd d00c 	str.w	sp, [sp, #12]
2002850c:	f7ff ff92 	bl	20028434 <mbedtls_mpi_mul_mpi>
20028510:	b005      	add	sp, #20
20028512:	f85d fb04 	ldr.w	pc, [sp], #4

20028516 <mbedtls_mpi_div_mpi>:
20028516:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
2002851a:	b09f      	sub	sp, #124	@ 0x7c
2002851c:	e9cd 1203 	strd	r1, r2, [sp, #12]
20028520:	9005      	str	r0, [sp, #20]
20028522:	2100      	movs	r1, #0
20028524:	4618      	mov	r0, r3
20028526:	9309      	str	r3, [sp, #36]	@ 0x24
20028528:	f7ff fe75 	bl	20028216 <mbedtls_mpi_cmp_int>
2002852c:	2800      	cmp	r0, #0
2002852e:	f000 81f3 	beq.w	20028918 <mbedtls_mpi_div_mpi+0x402>
20028532:	2501      	movs	r5, #1
20028534:	2400      	movs	r4, #0
20028536:	9909      	ldr	r1, [sp, #36]	@ 0x24
20028538:	9804      	ldr	r0, [sp, #16]
2002853a:	e9cd 5418 	strd	r5, r4, [sp, #96]	@ 0x60
2002853e:	e9cd 541b 	strd	r5, r4, [sp, #108]	@ 0x6c
20028542:	950f      	str	r5, [sp, #60]	@ 0x3c
20028544:	9512      	str	r5, [sp, #72]	@ 0x48
20028546:	9515      	str	r5, [sp, #84]	@ 0x54
20028548:	9416      	str	r4, [sp, #88]	@ 0x58
2002854a:	f7ff fd85 	bl	20028058 <mbedtls_mpi_cmp_abs>
2002854e:	3001      	adds	r0, #1
20028550:	d11f      	bne.n	20028592 <mbedtls_mpi_div_mpi+0x7c>
20028552:	9b05      	ldr	r3, [sp, #20]
20028554:	b933      	cbnz	r3, 20028564 <mbedtls_mpi_div_mpi+0x4e>
20028556:	9b03      	ldr	r3, [sp, #12]
20028558:	b9a3      	cbnz	r3, 20028584 <mbedtls_mpi_div_mpi+0x6e>
2002855a:	2100      	movs	r1, #0
2002855c:	4608      	mov	r0, r1
2002855e:	b01f      	add	sp, #124	@ 0x7c
20028560:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
20028564:	4621      	mov	r1, r4
20028566:	9805      	ldr	r0, [sp, #20]
20028568:	f7ff fc2d 	bl	20027dc6 <mbedtls_mpi_lset>
2002856c:	2800      	cmp	r0, #0
2002856e:	d0f2      	beq.n	20028556 <mbedtls_mpi_div_mpi+0x40>
20028570:	2400      	movs	r4, #0
20028572:	4625      	mov	r5, r4
20028574:	46a1      	mov	r9, r4
20028576:	46a0      	mov	r8, r4
20028578:	4626      	mov	r6, r4
2002857a:	4627      	mov	r7, r4
2002857c:	9402      	str	r4, [sp, #8]
2002857e:	f06f 010f 	mvn.w	r1, #15
20028582:	e0ef      	b.n	20028764 <mbedtls_mpi_div_mpi+0x24e>
20028584:	e9dd 0103 	ldrd	r0, r1, [sp, #12]
20028588:	f7ff fbf4 	bl	20027d74 <mbedtls_mpi_copy>
2002858c:	2800      	cmp	r0, #0
2002858e:	d1ef      	bne.n	20028570 <mbedtls_mpi_div_mpi+0x5a>
20028590:	e7e3      	b.n	2002855a <mbedtls_mpi_div_mpi+0x44>
20028592:	9904      	ldr	r1, [sp, #16]
20028594:	a80f      	add	r0, sp, #60	@ 0x3c
20028596:	e9cd 4410 	strd	r4, r4, [sp, #64]	@ 0x40
2002859a:	f7ff fbeb 	bl	20027d74 <mbedtls_mpi_copy>
2002859e:	e9dd 7610 	ldrd	r7, r6, [sp, #64]	@ 0x40
200285a2:	4682      	mov	sl, r0
200285a4:	2800      	cmp	r0, #0
200285a6:	f040 81a9 	bne.w	200288fc <mbedtls_mpi_div_mpi+0x3e6>
200285aa:	e9cd 0013 	strd	r0, r0, [sp, #76]	@ 0x4c
200285ae:	9909      	ldr	r1, [sp, #36]	@ 0x24
200285b0:	a812      	add	r0, sp, #72	@ 0x48
200285b2:	f7ff fbdf 	bl	20027d74 <mbedtls_mpi_copy>
200285b6:	e9dd 8913 	ldrd	r8, r9, [sp, #76]	@ 0x4c
200285ba:	4604      	mov	r4, r0
200285bc:	2800      	cmp	r0, #0
200285be:	f040 81a2 	bne.w	20028906 <mbedtls_mpi_div_mpi+0x3f0>
200285c2:	9b04      	ldr	r3, [sp, #16]
200285c4:	9017      	str	r0, [sp, #92]	@ 0x5c
200285c6:	6859      	ldr	r1, [r3, #4]
200285c8:	a815      	add	r0, sp, #84	@ 0x54
200285ca:	3102      	adds	r1, #2
200285cc:	9512      	str	r5, [sp, #72]	@ 0x48
200285ce:	950f      	str	r5, [sp, #60]	@ 0x3c
200285d0:	f7ff fba4 	bl	20027d1c <mbedtls_mpi_grow>
200285d4:	4605      	mov	r5, r0
200285d6:	b118      	cbz	r0, 200285e0 <mbedtls_mpi_div_mpi+0xca>
200285d8:	9b17      	ldr	r3, [sp, #92]	@ 0x5c
200285da:	9302      	str	r3, [sp, #8]
200285dc:	4625      	mov	r5, r4
200285de:	e7ce      	b.n	2002857e <mbedtls_mpi_div_mpi+0x68>
200285e0:	4601      	mov	r1, r0
200285e2:	a815      	add	r0, sp, #84	@ 0x54
200285e4:	f7ff fbef 	bl	20027dc6 <mbedtls_mpi_lset>
200285e8:	9b17      	ldr	r3, [sp, #92]	@ 0x5c
200285ea:	4604      	mov	r4, r0
200285ec:	9302      	str	r3, [sp, #8]
200285ee:	2800      	cmp	r0, #0
200285f0:	f040 818e 	bne.w	20028910 <mbedtls_mpi_div_mpi+0x3fa>
200285f4:	901a      	str	r0, [sp, #104]	@ 0x68
200285f6:	2102      	movs	r1, #2
200285f8:	a818      	add	r0, sp, #96	@ 0x60
200285fa:	f7ff fb8f 	bl	20027d1c <mbedtls_mpi_grow>
200285fe:	9d1a      	ldr	r5, [sp, #104]	@ 0x68
20028600:	2800      	cmp	r0, #0
20028602:	d1bc      	bne.n	2002857e <mbedtls_mpi_div_mpi+0x68>
20028604:	901d      	str	r0, [sp, #116]	@ 0x74
20028606:	2103      	movs	r1, #3
20028608:	a81b      	add	r0, sp, #108	@ 0x6c
2002860a:	f7ff fb87 	bl	20027d1c <mbedtls_mpi_grow>
2002860e:	9c1d      	ldr	r4, [sp, #116]	@ 0x74
20028610:	4683      	mov	fp, r0
20028612:	2800      	cmp	r0, #0
20028614:	d1b3      	bne.n	2002857e <mbedtls_mpi_div_mpi+0x68>
20028616:	a812      	add	r0, sp, #72	@ 0x48
20028618:	f7ff fc09 	bl	20027e2e <mbedtls_mpi_bitlen>
2002861c:	f000 001f 	and.w	r0, r0, #31
20028620:	281f      	cmp	r0, #31
20028622:	f000 808a 	beq.w	2002873a <mbedtls_mpi_div_mpi+0x224>
20028626:	f1c0 031f 	rsb	r3, r0, #31
2002862a:	4619      	mov	r1, r3
2002862c:	a80f      	add	r0, sp, #60	@ 0x3c
2002862e:	9306      	str	r3, [sp, #24]
20028630:	f7ff fc78 	bl	20027f24 <mbedtls_mpi_shift_l>
20028634:	e9dd 7610 	ldrd	r7, r6, [sp, #64]	@ 0x40
20028638:	2800      	cmp	r0, #0
2002863a:	d1a0      	bne.n	2002857e <mbedtls_mpi_div_mpi+0x68>
2002863c:	9906      	ldr	r1, [sp, #24]
2002863e:	a812      	add	r0, sp, #72	@ 0x48
20028640:	f7ff fc70 	bl	20027f24 <mbedtls_mpi_shift_l>
20028644:	e9dd 8913 	ldrd	r8, r9, [sp, #76]	@ 0x4c
20028648:	2800      	cmp	r0, #0
2002864a:	d198      	bne.n	2002857e <mbedtls_mpi_div_mpi+0x68>
2002864c:	46ba      	mov	sl, r7
2002864e:	f8cd 8020 	str.w	r8, [sp, #32]
20028652:	eba7 0b08 	sub.w	fp, r7, r8
20028656:	ea4f 134b 	mov.w	r3, fp, lsl #5
2002865a:	4619      	mov	r1, r3
2002865c:	a812      	add	r0, sp, #72	@ 0x48
2002865e:	e9cd 8913 	strd	r8, r9, [sp, #76]	@ 0x4c
20028662:	9301      	str	r3, [sp, #4]
20028664:	f7ff fc5e 	bl	20027f24 <mbedtls_mpi_shift_l>
20028668:	e9dd 8913 	ldrd	r8, r9, [sp, #76]	@ 0x4c
2002866c:	2800      	cmp	r0, #0
2002866e:	d186      	bne.n	2002857e <mbedtls_mpi_div_mpi+0x68>
20028670:	ea4f 038b 	mov.w	r3, fp, lsl #2
20028674:	930b      	str	r3, [sp, #44]	@ 0x2c
20028676:	9b02      	ldr	r3, [sp, #8]
20028678:	eb03 0b8b 	add.w	fp, r3, fp, lsl #2
2002867c:	a912      	add	r1, sp, #72	@ 0x48
2002867e:	a80f      	add	r0, sp, #60	@ 0x3c
20028680:	e9cd 7610 	strd	r7, r6, [sp, #64]	@ 0x40
20028684:	e9cd 8913 	strd	r8, r9, [sp, #76]	@ 0x4c
20028688:	f7ff fd84 	bl	20028194 <mbedtls_mpi_cmp_mpi>
2002868c:	2800      	cmp	r0, #0
2002868e:	da5a      	bge.n	20028746 <mbedtls_mpi_div_mpi+0x230>
20028690:	9901      	ldr	r1, [sp, #4]
20028692:	a812      	add	r0, sp, #72	@ 0x48
20028694:	f7ff fc9f 	bl	20027fd6 <mbedtls_mpi_shift_r>
20028698:	e9dd 8913 	ldrd	r8, r9, [sp, #76]	@ 0x4c
2002869c:	2800      	cmp	r0, #0
2002869e:	f47f af6e 	bne.w	2002857e <mbedtls_mpi_div_mpi+0x68>
200286a2:	f10a 33ff 	add.w	r3, sl, #4294967295	@ 0xffffffff
200286a6:	9301      	str	r3, [sp, #4]
200286a8:	9b08      	ldr	r3, [sp, #32]
200286aa:	9a02      	ldr	r2, [sp, #8]
200286ac:	3b01      	subs	r3, #1
200286ae:	9307      	str	r3, [sp, #28]
200286b0:	eb09 0383 	add.w	r3, r9, r3, lsl #2
200286b4:	930a      	str	r3, [sp, #40]	@ 0x28
200286b6:	9b08      	ldr	r3, [sp, #32]
200286b8:	f103 4380 	add.w	r3, r3, #1073741824	@ 0x40000000
200286bc:	3b02      	subs	r3, #2
200286be:	eb09 0383 	add.w	r3, r9, r3, lsl #2
200286c2:	930c      	str	r3, [sp, #48]	@ 0x30
200286c4:	9b0b      	ldr	r3, [sp, #44]	@ 0x2c
200286c6:	4413      	add	r3, r2
200286c8:	469a      	mov	sl, r3
200286ca:	9b01      	ldr	r3, [sp, #4]
200286cc:	9a07      	ldr	r2, [sp, #28]
200286ce:	4293      	cmp	r3, r2
200286d0:	d862      	bhi.n	20028798 <mbedtls_mpi_div_mpi+0x282>
200286d2:	9b05      	ldr	r3, [sp, #20]
200286d4:	b16b      	cbz	r3, 200286f2 <mbedtls_mpi_div_mpi+0x1dc>
200286d6:	4618      	mov	r0, r3
200286d8:	a915      	add	r1, sp, #84	@ 0x54
200286da:	f7ff fb4b 	bl	20027d74 <mbedtls_mpi_copy>
200286de:	2800      	cmp	r0, #0
200286e0:	f47f af4d 	bne.w	2002857e <mbedtls_mpi_div_mpi+0x68>
200286e4:	9b04      	ldr	r3, [sp, #16]
200286e6:	9a09      	ldr	r2, [sp, #36]	@ 0x24
200286e8:	681b      	ldr	r3, [r3, #0]
200286ea:	6812      	ldr	r2, [r2, #0]
200286ec:	4353      	muls	r3, r2
200286ee:	9a05      	ldr	r2, [sp, #20]
200286f0:	6013      	str	r3, [r2, #0]
200286f2:	9b03      	ldr	r3, [sp, #12]
200286f4:	2b00      	cmp	r3, #0
200286f6:	f000 810d 	beq.w	20028914 <mbedtls_mpi_div_mpi+0x3fe>
200286fa:	9906      	ldr	r1, [sp, #24]
200286fc:	a80f      	add	r0, sp, #60	@ 0x3c
200286fe:	e9cd 7610 	strd	r7, r6, [sp, #64]	@ 0x40
20028702:	f7ff fc68 	bl	20027fd6 <mbedtls_mpi_shift_r>
20028706:	e9dd 7610 	ldrd	r7, r6, [sp, #64]	@ 0x40
2002870a:	2800      	cmp	r0, #0
2002870c:	f47f af37 	bne.w	2002857e <mbedtls_mpi_div_mpi+0x68>
20028710:	9b04      	ldr	r3, [sp, #16]
20028712:	a90f      	add	r1, sp, #60	@ 0x3c
20028714:	681b      	ldr	r3, [r3, #0]
20028716:	9803      	ldr	r0, [sp, #12]
20028718:	930f      	str	r3, [sp, #60]	@ 0x3c
2002871a:	f7ff fb2b 	bl	20027d74 <mbedtls_mpi_copy>
2002871e:	4601      	mov	r1, r0
20028720:	2800      	cmp	r0, #0
20028722:	f47f af2c 	bne.w	2002857e <mbedtls_mpi_div_mpi+0x68>
20028726:	9001      	str	r0, [sp, #4]
20028728:	9803      	ldr	r0, [sp, #12]
2002872a:	f7ff fd74 	bl	20028216 <mbedtls_mpi_cmp_int>
2002872e:	9901      	ldr	r1, [sp, #4]
20028730:	b9c0      	cbnz	r0, 20028764 <mbedtls_mpi_div_mpi+0x24e>
20028732:	2301      	movs	r3, #1
20028734:	9a03      	ldr	r2, [sp, #12]
20028736:	6013      	str	r3, [r2, #0]
20028738:	e014      	b.n	20028764 <mbedtls_mpi_div_mpi+0x24e>
2002873a:	46ba      	mov	sl, r7
2002873c:	f8cd 8020 	str.w	r8, [sp, #32]
20028740:	f8cd b018 	str.w	fp, [sp, #24]
20028744:	e785      	b.n	20028652 <mbedtls_mpi_div_mpi+0x13c>
20028746:	f8db 2000 	ldr.w	r2, [fp]
2002874a:	a90f      	add	r1, sp, #60	@ 0x3c
2002874c:	3201      	adds	r2, #1
2002874e:	4608      	mov	r0, r1
20028750:	f8cb 2000 	str.w	r2, [fp]
20028754:	aa12      	add	r2, sp, #72	@ 0x48
20028756:	f7ff fe30 	bl	200283ba <mbedtls_mpi_sub_mpi>
2002875a:	e9dd 7610 	ldrd	r7, r6, [sp, #64]	@ 0x40
2002875e:	4601      	mov	r1, r0
20028760:	2800      	cmp	r0, #0
20028762:	d08b      	beq.n	2002867c <mbedtls_mpi_div_mpi+0x166>
20028764:	a80f      	add	r0, sp, #60	@ 0x3c
20028766:	9101      	str	r1, [sp, #4]
20028768:	e9cd 7610 	strd	r7, r6, [sp, #64]	@ 0x40
2002876c:	f7ff fac1 	bl	20027cf2 <mbedtls_mpi_free>
20028770:	a812      	add	r0, sp, #72	@ 0x48
20028772:	e9cd 8913 	strd	r8, r9, [sp, #76]	@ 0x4c
20028776:	f7ff fabc 	bl	20027cf2 <mbedtls_mpi_free>
2002877a:	9b02      	ldr	r3, [sp, #8]
2002877c:	a815      	add	r0, sp, #84	@ 0x54
2002877e:	9317      	str	r3, [sp, #92]	@ 0x5c
20028780:	f7ff fab7 	bl	20027cf2 <mbedtls_mpi_free>
20028784:	a818      	add	r0, sp, #96	@ 0x60
20028786:	951a      	str	r5, [sp, #104]	@ 0x68
20028788:	f7ff fab3 	bl	20027cf2 <mbedtls_mpi_free>
2002878c:	a81b      	add	r0, sp, #108	@ 0x6c
2002878e:	941d      	str	r4, [sp, #116]	@ 0x74
20028790:	f7ff faaf 	bl	20027cf2 <mbedtls_mpi_free>
20028794:	9901      	ldr	r1, [sp, #4]
20028796:	e6e1      	b.n	2002855c <mbedtls_mpi_div_mpi+0x46>
20028798:	9b01      	ldr	r3, [sp, #4]
2002879a:	ea4f 0b83 	mov.w	fp, r3, lsl #2
2002879e:	eb06 0383 	add.w	r3, r6, r3, lsl #2
200287a2:	930b      	str	r3, [sp, #44]	@ 0x2c
200287a4:	9b01      	ldr	r3, [sp, #4]
200287a6:	f1ab 0004 	sub.w	r0, fp, #4
200287aa:	f856 1023 	ldr.w	r1, [r6, r3, lsl #2]
200287ae:	9b0a      	ldr	r3, [sp, #40]	@ 0x28
200287b0:	681a      	ldr	r2, [r3, #0]
200287b2:	1833      	adds	r3, r6, r0
200287b4:	4291      	cmp	r1, r2
200287b6:	930d      	str	r3, [sp, #52]	@ 0x34
200287b8:	d255      	bcs.n	20028866 <mbedtls_mpi_div_mpi+0x350>
200287ba:	2300      	movs	r3, #0
200287bc:	5830      	ldr	r0, [r6, r0]
200287be:	f001 fd9f 	bl	2002a300 <__aeabi_uldivmod>
200287c2:	2900      	cmp	r1, #0
200287c4:	bf14      	ite	ne
200287c6:	f04f 33ff 	movne.w	r3, #4294967295	@ 0xffffffff
200287ca:	4603      	moveq	r3, r0
200287cc:	3301      	adds	r3, #1
200287ce:	f1ab 0b08 	sub.w	fp, fp, #8
200287d2:	f84a 3c04 	str.w	r3, [sl, #-4]
200287d6:	44b3      	add	fp, r6
200287d8:	f85a 3c04 	ldr.w	r3, [sl, #-4]
200287dc:	2100      	movs	r1, #0
200287de:	3b01      	subs	r3, #1
200287e0:	f84a 3c04 	str.w	r3, [sl, #-4]
200287e4:	a818      	add	r0, sp, #96	@ 0x60
200287e6:	951a      	str	r5, [sp, #104]	@ 0x68
200287e8:	f7ff faed 	bl	20027dc6 <mbedtls_mpi_lset>
200287ec:	9d1a      	ldr	r5, [sp, #104]	@ 0x68
200287ee:	2800      	cmp	r0, #0
200287f0:	f47f aec5 	bne.w	2002857e <mbedtls_mpi_div_mpi+0x68>
200287f4:	9b07      	ldr	r3, [sp, #28]
200287f6:	2b00      	cmp	r3, #0
200287f8:	d038      	beq.n	2002886c <mbedtls_mpi_div_mpi+0x356>
200287fa:	9b0c      	ldr	r3, [sp, #48]	@ 0x30
200287fc:	681b      	ldr	r3, [r3, #0]
200287fe:	602b      	str	r3, [r5, #0]
20028800:	9b0a      	ldr	r3, [sp, #40]	@ 0x28
20028802:	a918      	add	r1, sp, #96	@ 0x60
20028804:	681b      	ldr	r3, [r3, #0]
20028806:	4608      	mov	r0, r1
20028808:	606b      	str	r3, [r5, #4]
2002880a:	f85a 2c04 	ldr.w	r2, [sl, #-4]
2002880e:	f7ff fe75 	bl	200284fc <mbedtls_mpi_mul_int>
20028812:	9d1a      	ldr	r5, [sp, #104]	@ 0x68
20028814:	4601      	mov	r1, r0
20028816:	2800      	cmp	r0, #0
20028818:	f47f aeb1 	bne.w	2002857e <mbedtls_mpi_div_mpi+0x68>
2002881c:	a81b      	add	r0, sp, #108	@ 0x6c
2002881e:	941d      	str	r4, [sp, #116]	@ 0x74
20028820:	f7ff fad1 	bl	20027dc6 <mbedtls_mpi_lset>
20028824:	9c1d      	ldr	r4, [sp, #116]	@ 0x74
20028826:	2800      	cmp	r0, #0
20028828:	f47f aea9 	bne.w	2002857e <mbedtls_mpi_div_mpi+0x68>
2002882c:	9b01      	ldr	r3, [sp, #4]
2002882e:	a91b      	add	r1, sp, #108	@ 0x6c
20028830:	2b01      	cmp	r3, #1
20028832:	bf18      	it	ne
20028834:	f8db 0000 	ldrne.w	r0, [fp]
20028838:	9b0d      	ldr	r3, [sp, #52]	@ 0x34
2002883a:	6020      	str	r0, [r4, #0]
2002883c:	681b      	ldr	r3, [r3, #0]
2002883e:	a818      	add	r0, sp, #96	@ 0x60
20028840:	6063      	str	r3, [r4, #4]
20028842:	9b0b      	ldr	r3, [sp, #44]	@ 0x2c
20028844:	681b      	ldr	r3, [r3, #0]
20028846:	60a3      	str	r3, [r4, #8]
20028848:	f7ff fca4 	bl	20028194 <mbedtls_mpi_cmp_mpi>
2002884c:	2800      	cmp	r0, #0
2002884e:	dcc3      	bgt.n	200287d8 <mbedtls_mpi_div_mpi+0x2c2>
20028850:	f85a 2c04 	ldr.w	r2, [sl, #-4]
20028854:	a912      	add	r1, sp, #72	@ 0x48
20028856:	a818      	add	r0, sp, #96	@ 0x60
20028858:	e9cd 8913 	strd	r8, r9, [sp, #76]	@ 0x4c
2002885c:	f7ff fe4e 	bl	200284fc <mbedtls_mpi_mul_int>
20028860:	b130      	cbz	r0, 20028870 <mbedtls_mpi_div_mpi+0x35a>
20028862:	9d1a      	ldr	r5, [sp, #104]	@ 0x68
20028864:	e68b      	b.n	2002857e <mbedtls_mpi_div_mpi+0x68>
20028866:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
2002886a:	e7af      	b.n	200287cc <mbedtls_mpi_div_mpi+0x2b6>
2002886c:	9b07      	ldr	r3, [sp, #28]
2002886e:	e7c6      	b.n	200287fe <mbedtls_mpi_div_mpi+0x2e8>
20028870:	f06f 0b1f 	mvn.w	fp, #31
20028874:	9b08      	ldr	r3, [sp, #32]
20028876:	a818      	add	r0, sp, #96	@ 0x60
20028878:	fb0b fb03 	mul.w	fp, fp, r3
2002887c:	9b01      	ldr	r3, [sp, #4]
2002887e:	eb0b 1b43 	add.w	fp, fp, r3, lsl #5
20028882:	4659      	mov	r1, fp
20028884:	f7ff fb4e 	bl	20027f24 <mbedtls_mpi_shift_l>
20028888:	9d1a      	ldr	r5, [sp, #104]	@ 0x68
2002888a:	2800      	cmp	r0, #0
2002888c:	f47f ae77 	bne.w	2002857e <mbedtls_mpi_div_mpi+0x68>
20028890:	a90f      	add	r1, sp, #60	@ 0x3c
20028892:	4608      	mov	r0, r1
20028894:	aa18      	add	r2, sp, #96	@ 0x60
20028896:	e9cd 7610 	strd	r7, r6, [sp, #64]	@ 0x40
2002889a:	f7ff fd8e 	bl	200283ba <mbedtls_mpi_sub_mpi>
2002889e:	e9dd 7610 	ldrd	r7, r6, [sp, #64]	@ 0x40
200288a2:	4601      	mov	r1, r0
200288a4:	2800      	cmp	r0, #0
200288a6:	f47f af5d 	bne.w	20028764 <mbedtls_mpi_div_mpi+0x24e>
200288aa:	a80f      	add	r0, sp, #60	@ 0x3c
200288ac:	f7ff fcb3 	bl	20028216 <mbedtls_mpi_cmp_int>
200288b0:	2800      	cmp	r0, #0
200288b2:	da1d      	bge.n	200288f0 <mbedtls_mpi_div_mpi+0x3da>
200288b4:	a912      	add	r1, sp, #72	@ 0x48
200288b6:	a818      	add	r0, sp, #96	@ 0x60
200288b8:	f7ff fa5c 	bl	20027d74 <mbedtls_mpi_copy>
200288bc:	2800      	cmp	r0, #0
200288be:	d1d0      	bne.n	20028862 <mbedtls_mpi_div_mpi+0x34c>
200288c0:	4659      	mov	r1, fp
200288c2:	a818      	add	r0, sp, #96	@ 0x60
200288c4:	f7ff fb2e 	bl	20027f24 <mbedtls_mpi_shift_l>
200288c8:	9d1a      	ldr	r5, [sp, #104]	@ 0x68
200288ca:	2800      	cmp	r0, #0
200288cc:	f47f ae57 	bne.w	2002857e <mbedtls_mpi_div_mpi+0x68>
200288d0:	a90f      	add	r1, sp, #60	@ 0x3c
200288d2:	4608      	mov	r0, r1
200288d4:	aa18      	add	r2, sp, #96	@ 0x60
200288d6:	f7ff fd4a 	bl	2002836e <mbedtls_mpi_add_mpi>
200288da:	e9dd 7610 	ldrd	r7, r6, [sp, #64]	@ 0x40
200288de:	4601      	mov	r1, r0
200288e0:	2800      	cmp	r0, #0
200288e2:	f47f af3f 	bne.w	20028764 <mbedtls_mpi_div_mpi+0x24e>
200288e6:	f85a 3c04 	ldr.w	r3, [sl, #-4]
200288ea:	3b01      	subs	r3, #1
200288ec:	f84a 3c04 	str.w	r3, [sl, #-4]
200288f0:	9b01      	ldr	r3, [sp, #4]
200288f2:	f1aa 0a04 	sub.w	sl, sl, #4
200288f6:	3b01      	subs	r3, #1
200288f8:	9301      	str	r3, [sp, #4]
200288fa:	e6e6      	b.n	200286ca <mbedtls_mpi_div_mpi+0x1b4>
200288fc:	4625      	mov	r5, r4
200288fe:	46a1      	mov	r9, r4
20028900:	46a0      	mov	r8, r4
20028902:	9402      	str	r4, [sp, #8]
20028904:	e63b      	b.n	2002857e <mbedtls_mpi_div_mpi+0x68>
20028906:	4654      	mov	r4, sl
20028908:	4655      	mov	r5, sl
2002890a:	f8cd a008 	str.w	sl, [sp, #8]
2002890e:	e636      	b.n	2002857e <mbedtls_mpi_div_mpi+0x68>
20028910:	462c      	mov	r4, r5
20028912:	e663      	b.n	200285dc <mbedtls_mpi_div_mpi+0xc6>
20028914:	9903      	ldr	r1, [sp, #12]
20028916:	e725      	b.n	20028764 <mbedtls_mpi_div_mpi+0x24e>
20028918:	f06f 010b 	mvn.w	r1, #11
2002891c:	e61e      	b.n	2002855c <mbedtls_mpi_div_mpi+0x46>

2002891e <mbedtls_mpi_mod_mpi>:
2002891e:	b570      	push	{r4, r5, r6, lr}
20028920:	4604      	mov	r4, r0
20028922:	460d      	mov	r5, r1
20028924:	4610      	mov	r0, r2
20028926:	2100      	movs	r1, #0
20028928:	4616      	mov	r6, r2
2002892a:	f7ff fc74 	bl	20028216 <mbedtls_mpi_cmp_int>
2002892e:	2800      	cmp	r0, #0
20028930:	db24      	blt.n	2002897c <mbedtls_mpi_mod_mpi+0x5e>
20028932:	462a      	mov	r2, r5
20028934:	4633      	mov	r3, r6
20028936:	4621      	mov	r1, r4
20028938:	2000      	movs	r0, #0
2002893a:	f7ff fdec 	bl	20028516 <mbedtls_mpi_div_mpi>
2002893e:	4605      	mov	r5, r0
20028940:	b138      	cbz	r0, 20028952 <mbedtls_mpi_mod_mpi+0x34>
20028942:	4628      	mov	r0, r5
20028944:	bd70      	pop	{r4, r5, r6, pc}
20028946:	4632      	mov	r2, r6
20028948:	4621      	mov	r1, r4
2002894a:	4620      	mov	r0, r4
2002894c:	f7ff fd0f 	bl	2002836e <mbedtls_mpi_add_mpi>
20028950:	b990      	cbnz	r0, 20028978 <mbedtls_mpi_mod_mpi+0x5a>
20028952:	2100      	movs	r1, #0
20028954:	4620      	mov	r0, r4
20028956:	f7ff fc5e 	bl	20028216 <mbedtls_mpi_cmp_int>
2002895a:	2800      	cmp	r0, #0
2002895c:	dbf3      	blt.n	20028946 <mbedtls_mpi_mod_mpi+0x28>
2002895e:	4631      	mov	r1, r6
20028960:	4620      	mov	r0, r4
20028962:	f7ff fc17 	bl	20028194 <mbedtls_mpi_cmp_mpi>
20028966:	2800      	cmp	r0, #0
20028968:	dbeb      	blt.n	20028942 <mbedtls_mpi_mod_mpi+0x24>
2002896a:	4632      	mov	r2, r6
2002896c:	4621      	mov	r1, r4
2002896e:	4620      	mov	r0, r4
20028970:	f7ff fd23 	bl	200283ba <mbedtls_mpi_sub_mpi>
20028974:	2800      	cmp	r0, #0
20028976:	d0f2      	beq.n	2002895e <mbedtls_mpi_mod_mpi+0x40>
20028978:	4605      	mov	r5, r0
2002897a:	e7e2      	b.n	20028942 <mbedtls_mpi_mod_mpi+0x24>
2002897c:	f06f 0509 	mvn.w	r5, #9
20028980:	e7df      	b.n	20028942 <mbedtls_mpi_mod_mpi+0x24>

20028982 <mbedtls_mpi_exp_mod>:
20028982:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20028986:	4605      	mov	r5, r0
20028988:	f2ad 6d54 	subw	sp, sp, #1620	@ 0x654
2002898c:	4688      	mov	r8, r1
2002898e:	4618      	mov	r0, r3
20028990:	2100      	movs	r1, #0
20028992:	461c      	mov	r4, r3
20028994:	9203      	str	r2, [sp, #12]
20028996:	f7ff fc3e 	bl	20028216 <mbedtls_mpi_cmp_int>
2002899a:	2800      	cmp	r0, #0
2002899c:	f2c0 8202 	blt.w	20028da4 <mbedtls_mpi_exp_mod+0x422>
200289a0:	68a3      	ldr	r3, [r4, #8]
200289a2:	681f      	ldr	r7, [r3, #0]
200289a4:	f017 0301 	ands.w	r3, r7, #1
200289a8:	9305      	str	r3, [sp, #20]
200289aa:	f000 81fb 	beq.w	20028da4 <mbedtls_mpi_exp_mod+0x422>
200289ae:	2100      	movs	r1, #0
200289b0:	9803      	ldr	r0, [sp, #12]
200289b2:	f7ff fc30 	bl	20028216 <mbedtls_mpi_cmp_int>
200289b6:	2800      	cmp	r0, #0
200289b8:	f2c0 81f4 	blt.w	20028da4 <mbedtls_mpi_exp_mod+0x422>
200289bc:	2100      	movs	r1, #0
200289be:	2301      	movs	r3, #1
200289c0:	f44f 62c0 	mov.w	r2, #1536	@ 0x600
200289c4:	a814      	add	r0, sp, #80	@ 0x50
200289c6:	e9cd 3108 	strd	r3, r1, [sp, #32]
200289ca:	e9cd 130a 	strd	r1, r3, [sp, #40]	@ 0x28
200289ce:	e9cd 110c 	strd	r1, r1, [sp, #48]	@ 0x30
200289d2:	e9cd 310e 	strd	r3, r1, [sp, #56]	@ 0x38
200289d6:	9110      	str	r1, [sp, #64]	@ 0x40
200289d8:	f001 ff34 	bl	2002a844 <memset>
200289dc:	9803      	ldr	r0, [sp, #12]
200289de:	f7ff fa26 	bl	20027e2e <mbedtls_mpi_bitlen>
200289e2:	f5b0 7f28 	cmp.w	r0, #672	@ 0x2a0
200289e6:	d233      	bcs.n	20028a50 <mbedtls_mpi_exp_mod+0xce>
200289e8:	28ef      	cmp	r0, #239	@ 0xef
200289ea:	d833      	bhi.n	20028a54 <mbedtls_mpi_exp_mod+0xd2>
200289ec:	284f      	cmp	r0, #79	@ 0x4f
200289ee:	d833      	bhi.n	20028a58 <mbedtls_mpi_exp_mod+0xd6>
200289f0:	9b05      	ldr	r3, [sp, #20]
200289f2:	2818      	cmp	r0, #24
200289f4:	bf34      	ite	cc
200289f6:	461e      	movcc	r6, r3
200289f8:	2603      	movcs	r6, #3
200289fa:	6863      	ldr	r3, [r4, #4]
200289fc:	4628      	mov	r0, r5
200289fe:	f103 0901 	add.w	r9, r3, #1
20028a02:	4649      	mov	r1, r9
20028a04:	f7ff f98a 	bl	20027d1c <mbedtls_mpi_grow>
20028a08:	b340      	cbz	r0, 20028a5c <mbedtls_mpi_exp_mod+0xda>
20028a0a:	f06f 090f 	mvn.w	r9, #15
20028a0e:	2301      	movs	r3, #1
20028a10:	1e74      	subs	r4, r6, #1
20028a12:	fa03 f506 	lsl.w	r5, r3, r6
20028a16:	260c      	movs	r6, #12
20028a18:	fa03 f404 	lsl.w	r4, r3, r4
20028a1c:	af14      	add	r7, sp, #80	@ 0x50
20028a1e:	42a5      	cmp	r5, r4
20028a20:	f200 81ba 	bhi.w	20028d98 <mbedtls_mpi_exp_mod+0x416>
20028a24:	a817      	add	r0, sp, #92	@ 0x5c
20028a26:	f7ff f964 	bl	20027cf2 <mbedtls_mpi_free>
20028a2a:	a80b      	add	r0, sp, #44	@ 0x2c
20028a2c:	f7ff f961 	bl	20027cf2 <mbedtls_mpi_free>
20028a30:	a80e      	add	r0, sp, #56	@ 0x38
20028a32:	f7ff f95e 	bl	20027cf2 <mbedtls_mpi_free>
20028a36:	f8dd 3678 	ldr.w	r3, [sp, #1656]	@ 0x678
20028a3a:	b10b      	cbz	r3, 20028a40 <mbedtls_mpi_exp_mod+0xbe>
20028a3c:	689b      	ldr	r3, [r3, #8]
20028a3e:	b913      	cbnz	r3, 20028a46 <mbedtls_mpi_exp_mod+0xc4>
20028a40:	a808      	add	r0, sp, #32
20028a42:	f7ff f956 	bl	20027cf2 <mbedtls_mpi_free>
20028a46:	4648      	mov	r0, r9
20028a48:	f20d 6d54 	addw	sp, sp, #1620	@ 0x654
20028a4c:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
20028a50:	2606      	movs	r6, #6
20028a52:	e7d2      	b.n	200289fa <mbedtls_mpi_exp_mod+0x78>
20028a54:	2605      	movs	r6, #5
20028a56:	e7d0      	b.n	200289fa <mbedtls_mpi_exp_mod+0x78>
20028a58:	2604      	movs	r6, #4
20028a5a:	e7ce      	b.n	200289fa <mbedtls_mpi_exp_mod+0x78>
20028a5c:	4649      	mov	r1, r9
20028a5e:	a817      	add	r0, sp, #92	@ 0x5c
20028a60:	f7ff f95c 	bl	20027d1c <mbedtls_mpi_grow>
20028a64:	2800      	cmp	r0, #0
20028a66:	d1d0      	bne.n	20028a0a <mbedtls_mpi_exp_mod+0x88>
20028a68:	ea4f 0149 	mov.w	r1, r9, lsl #1
20028a6c:	a80b      	add	r0, sp, #44	@ 0x2c
20028a6e:	f7ff f955 	bl	20027d1c <mbedtls_mpi_grow>
20028a72:	2800      	cmp	r0, #0
20028a74:	d1c9      	bne.n	20028a0a <mbedtls_mpi_exp_mod+0x88>
20028a76:	f8d8 3000 	ldr.w	r3, [r8]
20028a7a:	9304      	str	r3, [sp, #16]
20028a7c:	3301      	adds	r3, #1
20028a7e:	d109      	bne.n	20028a94 <mbedtls_mpi_exp_mod+0x112>
20028a80:	4641      	mov	r1, r8
20028a82:	a80e      	add	r0, sp, #56	@ 0x38
20028a84:	f7ff f976 	bl	20027d74 <mbedtls_mpi_copy>
20028a88:	2800      	cmp	r0, #0
20028a8a:	d1be      	bne.n	20028a0a <mbedtls_mpi_exp_mod+0x88>
20028a8c:	2301      	movs	r3, #1
20028a8e:	f10d 0838 	add.w	r8, sp, #56	@ 0x38
20028a92:	930e      	str	r3, [sp, #56]	@ 0x38
20028a94:	f8dd 3678 	ldr.w	r3, [sp, #1656]	@ 0x678
20028a98:	b11b      	cbz	r3, 20028aa2 <mbedtls_mpi_exp_mod+0x120>
20028a9a:	689b      	ldr	r3, [r3, #8]
20028a9c:	2b00      	cmp	r3, #0
20028a9e:	f040 80ab 	bne.w	20028bf8 <mbedtls_mpi_exp_mod+0x276>
20028aa2:	2101      	movs	r1, #1
20028aa4:	a808      	add	r0, sp, #32
20028aa6:	f7ff f98e 	bl	20027dc6 <mbedtls_mpi_lset>
20028aaa:	2800      	cmp	r0, #0
20028aac:	d1ad      	bne.n	20028a0a <mbedtls_mpi_exp_mod+0x88>
20028aae:	6861      	ldr	r1, [r4, #4]
20028ab0:	a808      	add	r0, sp, #32
20028ab2:	0189      	lsls	r1, r1, #6
20028ab4:	f7ff fa36 	bl	20027f24 <mbedtls_mpi_shift_l>
20028ab8:	2800      	cmp	r0, #0
20028aba:	d1a6      	bne.n	20028a0a <mbedtls_mpi_exp_mod+0x88>
20028abc:	a908      	add	r1, sp, #32
20028abe:	4622      	mov	r2, r4
20028ac0:	4608      	mov	r0, r1
20028ac2:	f7ff ff2c 	bl	2002891e <mbedtls_mpi_mod_mpi>
20028ac6:	4681      	mov	r9, r0
20028ac8:	2800      	cmp	r0, #0
20028aca:	d1a0      	bne.n	20028a0e <mbedtls_mpi_exp_mod+0x8c>
20028acc:	f8dd 3678 	ldr.w	r3, [sp, #1656]	@ 0x678
20028ad0:	b13b      	cbz	r3, 20028ae2 <mbedtls_mpi_exp_mod+0x160>
20028ad2:	f8dd 2678 	ldr.w	r2, [sp, #1656]	@ 0x678
20028ad6:	ab08      	add	r3, sp, #32
20028ad8:	cb03      	ldmia	r3!, {r0, r1}
20028ada:	6010      	str	r0, [r2, #0]
20028adc:	6818      	ldr	r0, [r3, #0]
20028ade:	6051      	str	r1, [r2, #4]
20028ae0:	6090      	str	r0, [r2, #8]
20028ae2:	4621      	mov	r1, r4
20028ae4:	4640      	mov	r0, r8
20028ae6:	f7ff fb55 	bl	20028194 <mbedtls_mpi_cmp_mpi>
20028aea:	2800      	cmp	r0, #0
20028aec:	f2c0 808d 	blt.w	20028c0a <mbedtls_mpi_exp_mod+0x288>
20028af0:	4622      	mov	r2, r4
20028af2:	4641      	mov	r1, r8
20028af4:	a817      	add	r0, sp, #92	@ 0x5c
20028af6:	f7ff ff12 	bl	2002891e <mbedtls_mpi_mod_mpi>
20028afa:	4681      	mov	r9, r0
20028afc:	2800      	cmp	r0, #0
20028afe:	d186      	bne.n	20028a0e <mbedtls_mpi_exp_mod+0x8c>
20028b00:	1cba      	adds	r2, r7, #2
20028b02:	0052      	lsls	r2, r2, #1
20028b04:	f002 0208 	and.w	r2, r2, #8
20028b08:	443a      	add	r2, r7
20028b0a:	fb02 f307 	mul.w	r3, r2, r7
20028b0e:	f1c3 0302 	rsb	r3, r3, #2
20028b12:	4353      	muls	r3, r2
20028b14:	fb03 f207 	mul.w	r2, r3, r7
20028b18:	f1c2 0202 	rsb	r2, r2, #2
20028b1c:	4353      	muls	r3, r2
20028b1e:	435f      	muls	r7, r3
20028b20:	3f02      	subs	r7, #2
20028b22:	437b      	muls	r3, r7
20028b24:	f10d 0b2c 	add.w	fp, sp, #44	@ 0x2c
20028b28:	4622      	mov	r2, r4
20028b2a:	f8cd b000 	str.w	fp, [sp]
20028b2e:	a908      	add	r1, sp, #32
20028b30:	a817      	add	r0, sp, #92	@ 0x5c
20028b32:	9302      	str	r3, [sp, #8]
20028b34:	f7ff fac4 	bl	200280c0 <mpi_montmul>
20028b38:	2800      	cmp	r0, #0
20028b3a:	f040 80e4 	bne.w	20028d06 <mbedtls_mpi_exp_mod+0x384>
20028b3e:	4628      	mov	r0, r5
20028b40:	a908      	add	r1, sp, #32
20028b42:	f7ff f917 	bl	20027d74 <mbedtls_mpi_copy>
20028b46:	2800      	cmp	r0, #0
20028b48:	f47f af5f 	bne.w	20028a0a <mbedtls_mpi_exp_mod+0x88>
20028b4c:	2301      	movs	r3, #1
20028b4e:	aa07      	add	r2, sp, #28
20028b50:	e9cd 3311 	strd	r3, r3, [sp, #68]	@ 0x44
20028b54:	9307      	str	r3, [sp, #28]
20028b56:	9213      	str	r2, [sp, #76]	@ 0x4c
20028b58:	4628      	mov	r0, r5
20028b5a:	4622      	mov	r2, r4
20028b5c:	9b02      	ldr	r3, [sp, #8]
20028b5e:	f8cd b000 	str.w	fp, [sp]
20028b62:	a911      	add	r1, sp, #68	@ 0x44
20028b64:	f7ff faac 	bl	200280c0 <mpi_montmul>
20028b68:	2800      	cmp	r0, #0
20028b6a:	f040 80cc 	bne.w	20028d06 <mbedtls_mpi_exp_mod+0x384>
20028b6e:	2e01      	cmp	r6, #1
20028b70:	d153      	bne.n	20028c1a <mbedtls_mpi_exp_mod+0x298>
20028b72:	f04f 0900 	mov.w	r9, #0
20028b76:	464f      	mov	r7, r9
20028b78:	46ca      	mov	sl, r9
20028b7a:	46c8      	mov	r8, r9
20028b7c:	9b03      	ldr	r3, [sp, #12]
20028b7e:	f8d3 b004 	ldr.w	fp, [r3, #4]
20028b82:	f1ba 0f00 	cmp.w	sl, #0
20028b86:	f040 80a1 	bne.w	20028ccc <mbedtls_mpi_exp_mod+0x34a>
20028b8a:	f1bb 0f00 	cmp.w	fp, #0
20028b8e:	f040 8099 	bne.w	20028cc4 <mbedtls_mpi_exp_mod+0x342>
20028b92:	f04f 0a01 	mov.w	sl, #1
20028b96:	f10d 092c 	add.w	r9, sp, #44	@ 0x2c
20028b9a:	fa0a fa06 	lsl.w	sl, sl, r6
20028b9e:	45bb      	cmp	fp, r7
20028ba0:	f040 80dd 	bne.w	20028d5e <mbedtls_mpi_exp_mod+0x3dc>
20028ba4:	2301      	movs	r3, #1
20028ba6:	aa07      	add	r2, sp, #28
20028ba8:	e9cd 3311 	strd	r3, r3, [sp, #68]	@ 0x44
20028bac:	9307      	str	r3, [sp, #28]
20028bae:	9213      	str	r2, [sp, #76]	@ 0x4c
20028bb0:	f8cd 9000 	str.w	r9, [sp]
20028bb4:	4622      	mov	r2, r4
20028bb6:	4628      	mov	r0, r5
20028bb8:	9b02      	ldr	r3, [sp, #8]
20028bba:	a911      	add	r1, sp, #68	@ 0x44
20028bbc:	f7ff fa80 	bl	200280c0 <mpi_montmul>
20028bc0:	4681      	mov	r9, r0
20028bc2:	2800      	cmp	r0, #0
20028bc4:	f040 809f 	bne.w	20028d06 <mbedtls_mpi_exp_mod+0x384>
20028bc8:	9b04      	ldr	r3, [sp, #16]
20028bca:	3301      	adds	r3, #1
20028bcc:	f47f af1f 	bne.w	20028a0e <mbedtls_mpi_exp_mod+0x8c>
20028bd0:	9b03      	ldr	r3, [sp, #12]
20028bd2:	685b      	ldr	r3, [r3, #4]
20028bd4:	2b00      	cmp	r3, #0
20028bd6:	f43f af1a 	beq.w	20028a0e <mbedtls_mpi_exp_mod+0x8c>
20028bda:	9b03      	ldr	r3, [sp, #12]
20028bdc:	689b      	ldr	r3, [r3, #8]
20028bde:	681b      	ldr	r3, [r3, #0]
20028be0:	07db      	lsls	r3, r3, #31
20028be2:	f57f af14 	bpl.w	20028a0e <mbedtls_mpi_exp_mod+0x8c>
20028be6:	9b04      	ldr	r3, [sp, #16]
20028be8:	462a      	mov	r2, r5
20028bea:	4621      	mov	r1, r4
20028bec:	4628      	mov	r0, r5
20028bee:	602b      	str	r3, [r5, #0]
20028bf0:	f7ff fbbd 	bl	2002836e <mbedtls_mpi_add_mpi>
20028bf4:	4681      	mov	r9, r0
20028bf6:	e70a      	b.n	20028a0e <mbedtls_mpi_exp_mod+0x8c>
20028bf8:	f8dd 2678 	ldr.w	r2, [sp, #1656]	@ 0x678
20028bfc:	ab08      	add	r3, sp, #32
20028bfe:	6810      	ldr	r0, [r2, #0]
20028c00:	6851      	ldr	r1, [r2, #4]
20028c02:	c303      	stmia	r3!, {r0, r1}
20028c04:	6890      	ldr	r0, [r2, #8]
20028c06:	6018      	str	r0, [r3, #0]
20028c08:	e76b      	b.n	20028ae2 <mbedtls_mpi_exp_mod+0x160>
20028c0a:	4641      	mov	r1, r8
20028c0c:	a817      	add	r0, sp, #92	@ 0x5c
20028c0e:	f7ff f8b1 	bl	20027d74 <mbedtls_mpi_copy>
20028c12:	2800      	cmp	r0, #0
20028c14:	f43f af74 	beq.w	20028b00 <mbedtls_mpi_exp_mod+0x17e>
20028c18:	e6f7      	b.n	20028a0a <mbedtls_mpi_exp_mod+0x88>
20028c1a:	f04f 0a0c 	mov.w	sl, #12
20028c1e:	1e77      	subs	r7, r6, #1
20028c20:	6861      	ldr	r1, [r4, #4]
20028c22:	fa0a fa07 	lsl.w	sl, sl, r7
20028c26:	f10d 0950 	add.w	r9, sp, #80	@ 0x50
20028c2a:	44d1      	add	r9, sl
20028c2c:	4648      	mov	r0, r9
20028c2e:	3101      	adds	r1, #1
20028c30:	f7ff f874 	bl	20027d1c <mbedtls_mpi_grow>
20028c34:	2800      	cmp	r0, #0
20028c36:	f47f aee8 	bne.w	20028a0a <mbedtls_mpi_exp_mod+0x88>
20028c3a:	4648      	mov	r0, r9
20028c3c:	a917      	add	r1, sp, #92	@ 0x5c
20028c3e:	f7ff f899 	bl	20027d74 <mbedtls_mpi_copy>
20028c42:	2800      	cmp	r0, #0
20028c44:	f47f aee1 	bne.w	20028a0a <mbedtls_mpi_exp_mod+0x88>
20028c48:	4680      	mov	r8, r0
20028c4a:	4622      	mov	r2, r4
20028c4c:	4649      	mov	r1, r9
20028c4e:	4648      	mov	r0, r9
20028c50:	9b02      	ldr	r3, [sp, #8]
20028c52:	f8cd b000 	str.w	fp, [sp]
20028c56:	f7ff fa33 	bl	200280c0 <mpi_montmul>
20028c5a:	2800      	cmp	r0, #0
20028c5c:	d153      	bne.n	20028d06 <mbedtls_mpi_exp_mod+0x384>
20028c5e:	f108 0801 	add.w	r8, r8, #1
20028c62:	45b8      	cmp	r8, r7
20028c64:	d3f1      	bcc.n	20028c4a <mbedtls_mpi_exp_mod+0x2c8>
20028c66:	f04f 0801 	mov.w	r8, #1
20028c6a:	f10d 0b50 	add.w	fp, sp, #80	@ 0x50
20028c6e:	fa08 f707 	lsl.w	r7, r8, r7
20028c72:	4447      	add	r7, r8
20028c74:	44d3      	add	fp, sl
20028c76:	fa08 f806 	lsl.w	r8, r8, r6
20028c7a:	f10d 0a2c 	add.w	sl, sp, #44	@ 0x2c
20028c7e:	45b8      	cmp	r8, r7
20028c80:	f67f af77 	bls.w	20028b72 <mbedtls_mpi_exp_mod+0x1f0>
20028c84:	6861      	ldr	r1, [r4, #4]
20028c86:	f10b 090c 	add.w	r9, fp, #12
20028c8a:	4648      	mov	r0, r9
20028c8c:	3101      	adds	r1, #1
20028c8e:	f7ff f845 	bl	20027d1c <mbedtls_mpi_grow>
20028c92:	2800      	cmp	r0, #0
20028c94:	f47f aeb9 	bne.w	20028a0a <mbedtls_mpi_exp_mod+0x88>
20028c98:	4659      	mov	r1, fp
20028c9a:	4648      	mov	r0, r9
20028c9c:	f7ff f86a 	bl	20027d74 <mbedtls_mpi_copy>
20028ca0:	2800      	cmp	r0, #0
20028ca2:	f47f aeb2 	bne.w	20028a0a <mbedtls_mpi_exp_mod+0x88>
20028ca6:	4622      	mov	r2, r4
20028ca8:	4648      	mov	r0, r9
20028caa:	9b02      	ldr	r3, [sp, #8]
20028cac:	f8cd a000 	str.w	sl, [sp]
20028cb0:	a917      	add	r1, sp, #92	@ 0x5c
20028cb2:	f7ff fa05 	bl	200280c0 <mpi_montmul>
20028cb6:	bb30      	cbnz	r0, 20028d06 <mbedtls_mpi_exp_mod+0x384>
20028cb8:	46cb      	mov	fp, r9
20028cba:	3701      	adds	r7, #1
20028cbc:	e7df      	b.n	20028c7e <mbedtls_mpi_exp_mod+0x2fc>
20028cbe:	f04f 0902 	mov.w	r9, #2
20028cc2:	e75e      	b.n	20028b82 <mbedtls_mpi_exp_mod+0x200>
20028cc4:	f04f 0a20 	mov.w	sl, #32
20028cc8:	f10b 3bff 	add.w	fp, fp, #4294967295	@ 0xffffffff
20028ccc:	9b03      	ldr	r3, [sp, #12]
20028cce:	f10a 3aff 	add.w	sl, sl, #4294967295	@ 0xffffffff
20028cd2:	689b      	ldr	r3, [r3, #8]
20028cd4:	f853 302b 	ldr.w	r3, [r3, fp, lsl #2]
20028cd8:	fa23 f30a 	lsr.w	r3, r3, sl
20028cdc:	f013 0301 	ands.w	r3, r3, #1
20028ce0:	d114      	bne.n	20028d0c <mbedtls_mpi_exp_mod+0x38a>
20028ce2:	f1b9 0f00 	cmp.w	r9, #0
20028ce6:	f43f af4c 	beq.w	20028b82 <mbedtls_mpi_exp_mod+0x200>
20028cea:	f1b9 0f01 	cmp.w	r9, #1
20028cee:	d10d      	bne.n	20028d0c <mbedtls_mpi_exp_mod+0x38a>
20028cf0:	ab0b      	add	r3, sp, #44	@ 0x2c
20028cf2:	9300      	str	r3, [sp, #0]
20028cf4:	4622      	mov	r2, r4
20028cf6:	4629      	mov	r1, r5
20028cf8:	4628      	mov	r0, r5
20028cfa:	9b02      	ldr	r3, [sp, #8]
20028cfc:	f7ff f9e0 	bl	200280c0 <mpi_montmul>
20028d00:	2800      	cmp	r0, #0
20028d02:	f43f af3e 	beq.w	20028b82 <mbedtls_mpi_exp_mod+0x200>
20028d06:	f06f 0903 	mvn.w	r9, #3
20028d0a:	e680      	b.n	20028a0e <mbedtls_mpi_exp_mod+0x8c>
20028d0c:	3701      	adds	r7, #1
20028d0e:	1bf2      	subs	r2, r6, r7
20028d10:	4093      	lsls	r3, r2
20028d12:	42be      	cmp	r6, r7
20028d14:	ea48 0803 	orr.w	r8, r8, r3
20028d18:	d1d1      	bne.n	20028cbe <mbedtls_mpi_exp_mod+0x33c>
20028d1a:	f04f 0900 	mov.w	r9, #0
20028d1e:	ab0b      	add	r3, sp, #44	@ 0x2c
20028d20:	9300      	str	r3, [sp, #0]
20028d22:	4622      	mov	r2, r4
20028d24:	4629      	mov	r1, r5
20028d26:	4628      	mov	r0, r5
20028d28:	9b02      	ldr	r3, [sp, #8]
20028d2a:	f7ff f9c9 	bl	200280c0 <mpi_montmul>
20028d2e:	2800      	cmp	r0, #0
20028d30:	d1e9      	bne.n	20028d06 <mbedtls_mpi_exp_mod+0x384>
20028d32:	f109 0901 	add.w	r9, r9, #1
20028d36:	454f      	cmp	r7, r9
20028d38:	d8f1      	bhi.n	20028d1e <mbedtls_mpi_exp_mod+0x39c>
20028d3a:	200c      	movs	r0, #12
20028d3c:	ab0b      	add	r3, sp, #44	@ 0x2c
20028d3e:	a914      	add	r1, sp, #80	@ 0x50
20028d40:	fb00 1108 	mla	r1, r0, r8, r1
20028d44:	9300      	str	r3, [sp, #0]
20028d46:	4622      	mov	r2, r4
20028d48:	4628      	mov	r0, r5
20028d4a:	9b02      	ldr	r3, [sp, #8]
20028d4c:	f7ff f9b8 	bl	200280c0 <mpi_montmul>
20028d50:	4607      	mov	r7, r0
20028d52:	2800      	cmp	r0, #0
20028d54:	d1d7      	bne.n	20028d06 <mbedtls_mpi_exp_mod+0x384>
20028d56:	4680      	mov	r8, r0
20028d58:	f8dd 9014 	ldr.w	r9, [sp, #20]
20028d5c:	e711      	b.n	20028b82 <mbedtls_mpi_exp_mod+0x200>
20028d5e:	4622      	mov	r2, r4
20028d60:	4629      	mov	r1, r5
20028d62:	4628      	mov	r0, r5
20028d64:	9b02      	ldr	r3, [sp, #8]
20028d66:	f8cd 9000 	str.w	r9, [sp]
20028d6a:	f7ff f9a9 	bl	200280c0 <mpi_montmul>
20028d6e:	2800      	cmp	r0, #0
20028d70:	d1c9      	bne.n	20028d06 <mbedtls_mpi_exp_mod+0x384>
20028d72:	ea4f 0848 	mov.w	r8, r8, lsl #1
20028d76:	ea18 0f0a 	tst.w	r8, sl
20028d7a:	d102      	bne.n	20028d82 <mbedtls_mpi_exp_mod+0x400>
20028d7c:	f10b 0b01 	add.w	fp, fp, #1
20028d80:	e70d      	b.n	20028b9e <mbedtls_mpi_exp_mod+0x21c>
20028d82:	4622      	mov	r2, r4
20028d84:	4628      	mov	r0, r5
20028d86:	9b02      	ldr	r3, [sp, #8]
20028d88:	f8cd 9000 	str.w	r9, [sp]
20028d8c:	a917      	add	r1, sp, #92	@ 0x5c
20028d8e:	f7ff f997 	bl	200280c0 <mpi_montmul>
20028d92:	2800      	cmp	r0, #0
20028d94:	d0f2      	beq.n	20028d7c <mbedtls_mpi_exp_mod+0x3fa>
20028d96:	e7b6      	b.n	20028d06 <mbedtls_mpi_exp_mod+0x384>
20028d98:	fb06 7004 	mla	r0, r6, r4, r7
20028d9c:	f7fe ffa9 	bl	20027cf2 <mbedtls_mpi_free>
20028da0:	3401      	adds	r4, #1
20028da2:	e63c      	b.n	20028a1e <mbedtls_mpi_exp_mod+0x9c>
20028da4:	f06f 0903 	mvn.w	r9, #3
20028da8:	e64d      	b.n	20028a46 <mbedtls_mpi_exp_mod+0xc4>

20028daa <mbedtls_mpi_gcd>:
20028daa:	b570      	push	{r4, r5, r6, lr}
20028dac:	2300      	movs	r3, #0
20028dae:	2401      	movs	r4, #1
20028db0:	b086      	sub	sp, #24
20028db2:	4606      	mov	r6, r0
20028db4:	4668      	mov	r0, sp
20028db6:	4615      	mov	r5, r2
20028db8:	e9cd 4300 	strd	r4, r3, [sp]
20028dbc:	e9cd 3402 	strd	r3, r4, [sp, #8]
20028dc0:	e9cd 3304 	strd	r3, r3, [sp, #16]
20028dc4:	f7fe ffd6 	bl	20027d74 <mbedtls_mpi_copy>
20028dc8:	b150      	cbz	r0, 20028de0 <mbedtls_mpi_gcd+0x36>
20028dca:	f06f 040f 	mvn.w	r4, #15
20028dce:	4668      	mov	r0, sp
20028dd0:	f7fe ff8f 	bl	20027cf2 <mbedtls_mpi_free>
20028dd4:	a803      	add	r0, sp, #12
20028dd6:	f7fe ff8c 	bl	20027cf2 <mbedtls_mpi_free>
20028dda:	4620      	mov	r0, r4
20028ddc:	b006      	add	sp, #24
20028dde:	bd70      	pop	{r4, r5, r6, pc}
20028de0:	4629      	mov	r1, r5
20028de2:	a803      	add	r0, sp, #12
20028de4:	f7fe ffc6 	bl	20027d74 <mbedtls_mpi_copy>
20028de8:	2800      	cmp	r0, #0
20028dea:	d1ee      	bne.n	20028dca <mbedtls_mpi_gcd+0x20>
20028dec:	4668      	mov	r0, sp
20028dee:	f7ff f806 	bl	20027dfe <mbedtls_mpi_lsb>
20028df2:	4605      	mov	r5, r0
20028df4:	a803      	add	r0, sp, #12
20028df6:	f7ff f802 	bl	20027dfe <mbedtls_mpi_lsb>
20028dfa:	4285      	cmp	r5, r0
20028dfc:	bf28      	it	cs
20028dfe:	4605      	movcs	r5, r0
20028e00:	4668      	mov	r0, sp
20028e02:	4629      	mov	r1, r5
20028e04:	f7ff f8e7 	bl	20027fd6 <mbedtls_mpi_shift_r>
20028e08:	2800      	cmp	r0, #0
20028e0a:	d1de      	bne.n	20028dca <mbedtls_mpi_gcd+0x20>
20028e0c:	4629      	mov	r1, r5
20028e0e:	a803      	add	r0, sp, #12
20028e10:	f7ff f8e1 	bl	20027fd6 <mbedtls_mpi_shift_r>
20028e14:	2800      	cmp	r0, #0
20028e16:	d1d8      	bne.n	20028dca <mbedtls_mpi_gcd+0x20>
20028e18:	9403      	str	r4, [sp, #12]
20028e1a:	9400      	str	r4, [sp, #0]
20028e1c:	2100      	movs	r1, #0
20028e1e:	4668      	mov	r0, sp
20028e20:	f7ff f9f9 	bl	20028216 <mbedtls_mpi_cmp_int>
20028e24:	b968      	cbnz	r0, 20028e42 <mbedtls_mpi_gcd+0x98>
20028e26:	4629      	mov	r1, r5
20028e28:	a803      	add	r0, sp, #12
20028e2a:	f7ff f87b 	bl	20027f24 <mbedtls_mpi_shift_l>
20028e2e:	2800      	cmp	r0, #0
20028e30:	d1cb      	bne.n	20028dca <mbedtls_mpi_gcd+0x20>
20028e32:	4630      	mov	r0, r6
20028e34:	a903      	add	r1, sp, #12
20028e36:	f7fe ff9d 	bl	20027d74 <mbedtls_mpi_copy>
20028e3a:	4604      	mov	r4, r0
20028e3c:	2800      	cmp	r0, #0
20028e3e:	d0c6      	beq.n	20028dce <mbedtls_mpi_gcd+0x24>
20028e40:	e7c3      	b.n	20028dca <mbedtls_mpi_gcd+0x20>
20028e42:	4668      	mov	r0, sp
20028e44:	f7fe ffdb 	bl	20027dfe <mbedtls_mpi_lsb>
20028e48:	4601      	mov	r1, r0
20028e4a:	4668      	mov	r0, sp
20028e4c:	f7ff f8c3 	bl	20027fd6 <mbedtls_mpi_shift_r>
20028e50:	2800      	cmp	r0, #0
20028e52:	d1ba      	bne.n	20028dca <mbedtls_mpi_gcd+0x20>
20028e54:	a803      	add	r0, sp, #12
20028e56:	f7fe ffd2 	bl	20027dfe <mbedtls_mpi_lsb>
20028e5a:	4601      	mov	r1, r0
20028e5c:	a803      	add	r0, sp, #12
20028e5e:	f7ff f8ba 	bl	20027fd6 <mbedtls_mpi_shift_r>
20028e62:	2800      	cmp	r0, #0
20028e64:	d1b1      	bne.n	20028dca <mbedtls_mpi_gcd+0x20>
20028e66:	4668      	mov	r0, sp
20028e68:	a903      	add	r1, sp, #12
20028e6a:	f7ff f993 	bl	20028194 <mbedtls_mpi_cmp_mpi>
20028e6e:	2800      	cmp	r0, #0
20028e70:	db0e      	blt.n	20028e90 <mbedtls_mpi_gcd+0xe6>
20028e72:	4669      	mov	r1, sp
20028e74:	4668      	mov	r0, sp
20028e76:	aa03      	add	r2, sp, #12
20028e78:	f7ff fa3c 	bl	200282f4 <mbedtls_mpi_sub_abs>
20028e7c:	4604      	mov	r4, r0
20028e7e:	2800      	cmp	r0, #0
20028e80:	d1a5      	bne.n	20028dce <mbedtls_mpi_gcd+0x24>
20028e82:	2101      	movs	r1, #1
20028e84:	4668      	mov	r0, sp
20028e86:	f7ff f8a6 	bl	20027fd6 <mbedtls_mpi_shift_r>
20028e8a:	2800      	cmp	r0, #0
20028e8c:	d0c6      	beq.n	20028e1c <mbedtls_mpi_gcd+0x72>
20028e8e:	e79c      	b.n	20028dca <mbedtls_mpi_gcd+0x20>
20028e90:	a903      	add	r1, sp, #12
20028e92:	466a      	mov	r2, sp
20028e94:	4608      	mov	r0, r1
20028e96:	f7ff fa2d 	bl	200282f4 <mbedtls_mpi_sub_abs>
20028e9a:	4604      	mov	r4, r0
20028e9c:	2800      	cmp	r0, #0
20028e9e:	d196      	bne.n	20028dce <mbedtls_mpi_gcd+0x24>
20028ea0:	2101      	movs	r1, #1
20028ea2:	a803      	add	r0, sp, #12
20028ea4:	e7ef      	b.n	20028e86 <mbedtls_mpi_gcd+0xdc>

20028ea6 <mbedtls_mpi_fill_random>:
20028ea6:	b570      	push	{r4, r5, r6, lr}
20028ea8:	f5b1 6f80 	cmp.w	r1, #1024	@ 0x400
20028eac:	4605      	mov	r5, r0
20028eae:	460c      	mov	r4, r1
20028eb0:	4616      	mov	r6, r2
20028eb2:	4618      	mov	r0, r3
20028eb4:	f5ad 6d80 	sub.w	sp, sp, #1024	@ 0x400
20028eb8:	d80f      	bhi.n	20028eda <mbedtls_mpi_fill_random+0x34>
20028eba:	460a      	mov	r2, r1
20028ebc:	4669      	mov	r1, sp
20028ebe:	47b0      	blx	r6
20028ec0:	b940      	cbnz	r0, 20028ed4 <mbedtls_mpi_fill_random+0x2e>
20028ec2:	4622      	mov	r2, r4
20028ec4:	4669      	mov	r1, sp
20028ec6:	4628      	mov	r0, r5
20028ec8:	f7fe ffd4 	bl	20027e74 <mbedtls_mpi_read_binary>
20028ecc:	2800      	cmp	r0, #0
20028ece:	bf18      	it	ne
20028ed0:	f06f 000f 	mvnne.w	r0, #15
20028ed4:	f50d 6d80 	add.w	sp, sp, #1024	@ 0x400
20028ed8:	bd70      	pop	{r4, r5, r6, pc}
20028eda:	f06f 0003 	mvn.w	r0, #3
20028ede:	e7f9      	b.n	20028ed4 <mbedtls_mpi_fill_random+0x2e>

20028ee0 <mbedtls_mpi_inv_mod>:
20028ee0:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20028ee4:	b09f      	sub	sp, #124	@ 0x7c
20028ee6:	9001      	str	r0, [sp, #4]
20028ee8:	460f      	mov	r7, r1
20028eea:	4610      	mov	r0, r2
20028eec:	2101      	movs	r1, #1
20028eee:	4692      	mov	sl, r2
20028ef0:	f7ff f991 	bl	20028216 <mbedtls_mpi_cmp_int>
20028ef4:	2800      	cmp	r0, #0
20028ef6:	f340 81b5 	ble.w	20029264 <mbedtls_mpi_inv_mod+0x384>
20028efa:	2500      	movs	r5, #0
20028efc:	2601      	movs	r6, #1
20028efe:	4652      	mov	r2, sl
20028f00:	4639      	mov	r1, r7
20028f02:	a803      	add	r0, sp, #12
20028f04:	e9cd 6506 	strd	r6, r5, [sp, #24]
20028f08:	e9cd 5608 	strd	r5, r6, [sp, #32]
20028f0c:	e9cd 650c 	strd	r6, r5, [sp, #48]	@ 0x30
20028f10:	e9cd 650f 	strd	r6, r5, [sp, #60]	@ 0x3c
20028f14:	e9cd 6503 	strd	r6, r5, [sp, #12]
20028f18:	e9cd 6512 	strd	r6, r5, [sp, #72]	@ 0x48
20028f1c:	e9cd 5614 	strd	r5, r6, [sp, #80]	@ 0x50
20028f20:	e9cd 6518 	strd	r6, r5, [sp, #96]	@ 0x60
20028f24:	e9cd 651b 	strd	r6, r5, [sp, #108]	@ 0x6c
20028f28:	950a      	str	r5, [sp, #40]	@ 0x28
20028f2a:	9505      	str	r5, [sp, #20]
20028f2c:	9516      	str	r5, [sp, #88]	@ 0x58
20028f2e:	f7ff ff3c 	bl	20028daa <mbedtls_mpi_gcd>
20028f32:	4604      	mov	r4, r0
20028f34:	2800      	cmp	r0, #0
20028f36:	f040 8182 	bne.w	2002923e <mbedtls_mpi_inv_mod+0x35e>
20028f3a:	4631      	mov	r1, r6
20028f3c:	a803      	add	r0, sp, #12
20028f3e:	f7ff f96a 	bl	20028216 <mbedtls_mpi_cmp_int>
20028f42:	4605      	mov	r5, r0
20028f44:	2800      	cmp	r0, #0
20028f46:	f040 8171 	bne.w	2002922c <mbedtls_mpi_inv_mod+0x34c>
20028f4a:	4652      	mov	r2, sl
20028f4c:	4639      	mov	r1, r7
20028f4e:	a806      	add	r0, sp, #24
20028f50:	f7ff fce5 	bl	2002891e <mbedtls_mpi_mod_mpi>
20028f54:	4604      	mov	r4, r0
20028f56:	2800      	cmp	r0, #0
20028f58:	f040 8171 	bne.w	2002923e <mbedtls_mpi_inv_mod+0x35e>
20028f5c:	900b      	str	r0, [sp, #44]	@ 0x2c
20028f5e:	a906      	add	r1, sp, #24
20028f60:	a809      	add	r0, sp, #36	@ 0x24
20028f62:	f7fe ff07 	bl	20027d74 <mbedtls_mpi_copy>
20028f66:	f8dd 902c 	ldr.w	r9, [sp, #44]	@ 0x2c
20028f6a:	b920      	cbnz	r0, 20028f76 <mbedtls_mpi_inv_mod+0x96>
20028f6c:	4651      	mov	r1, sl
20028f6e:	a812      	add	r0, sp, #72	@ 0x48
20028f70:	f7fe ff00 	bl	20027d74 <mbedtls_mpi_copy>
20028f74:	b130      	cbz	r0, 20028f84 <mbedtls_mpi_inv_mod+0xa4>
20028f76:	f04f 0b00 	mov.w	fp, #0
20028f7a:	465d      	mov	r5, fp
20028f7c:	46d8      	mov	r8, fp
20028f7e:	465e      	mov	r6, fp
20028f80:	465f      	mov	r7, fp
20028f82:	e0f5      	b.n	20029170 <mbedtls_mpi_inv_mod+0x290>
20028f84:	9017      	str	r0, [sp, #92]	@ 0x5c
20028f86:	4651      	mov	r1, sl
20028f88:	a815      	add	r0, sp, #84	@ 0x54
20028f8a:	f7fe fef3 	bl	20027d74 <mbedtls_mpi_copy>
20028f8e:	f8dd 805c 	ldr.w	r8, [sp, #92]	@ 0x5c
20028f92:	2800      	cmp	r0, #0
20028f94:	f040 8159 	bne.w	2002924a <mbedtls_mpi_inv_mod+0x36a>
20028f98:	4631      	mov	r1, r6
20028f9a:	900e      	str	r0, [sp, #56]	@ 0x38
20028f9c:	a80c      	add	r0, sp, #48	@ 0x30
20028f9e:	f7fe ff12 	bl	20027dc6 <mbedtls_mpi_lset>
20028fa2:	9f0e      	ldr	r7, [sp, #56]	@ 0x38
20028fa4:	4601      	mov	r1, r0
20028fa6:	2800      	cmp	r0, #0
20028fa8:	f040 8152 	bne.w	20029250 <mbedtls_mpi_inv_mod+0x370>
20028fac:	9011      	str	r0, [sp, #68]	@ 0x44
20028fae:	a80f      	add	r0, sp, #60	@ 0x3c
20028fb0:	f7fe ff09 	bl	20027dc6 <mbedtls_mpi_lset>
20028fb4:	9e11      	ldr	r6, [sp, #68]	@ 0x44
20028fb6:	4683      	mov	fp, r0
20028fb8:	2800      	cmp	r0, #0
20028fba:	f040 814d 	bne.w	20029258 <mbedtls_mpi_inv_mod+0x378>
20028fbe:	4601      	mov	r1, r0
20028fc0:	901a      	str	r0, [sp, #104]	@ 0x68
20028fc2:	a818      	add	r0, sp, #96	@ 0x60
20028fc4:	f7fe feff 	bl	20027dc6 <mbedtls_mpi_lset>
20028fc8:	9d1a      	ldr	r5, [sp, #104]	@ 0x68
20028fca:	2800      	cmp	r0, #0
20028fcc:	f040 8147 	bne.w	2002925e <mbedtls_mpi_inv_mod+0x37e>
20028fd0:	2101      	movs	r1, #1
20028fd2:	a81b      	add	r0, sp, #108	@ 0x6c
20028fd4:	f8cd b074 	str.w	fp, [sp, #116]	@ 0x74
20028fd8:	f7fe fef5 	bl	20027dc6 <mbedtls_mpi_lset>
20028fdc:	f8dd b074 	ldr.w	fp, [sp, #116]	@ 0x74
20028fe0:	2800      	cmp	r0, #0
20028fe2:	f040 80c5 	bne.w	20029170 <mbedtls_mpi_inv_mod+0x290>
20028fe6:	f8d9 2000 	ldr.w	r2, [r9]
20028fea:	07d0      	lsls	r0, r2, #31
20028fec:	d554      	bpl.n	20029098 <mbedtls_mpi_inv_mod+0x1b8>
20028fee:	f8d8 2000 	ldr.w	r2, [r8]
20028ff2:	07d3      	lsls	r3, r2, #31
20028ff4:	f140 8083 	bpl.w	200290fe <mbedtls_mpi_inv_mod+0x21e>
20028ff8:	a915      	add	r1, sp, #84	@ 0x54
20028ffa:	a809      	add	r0, sp, #36	@ 0x24
20028ffc:	f8cd 902c 	str.w	r9, [sp, #44]	@ 0x2c
20029000:	f8cd 805c 	str.w	r8, [sp, #92]	@ 0x5c
20029004:	f7ff f8c6 	bl	20028194 <mbedtls_mpi_cmp_mpi>
20029008:	2800      	cmp	r0, #0
2002900a:	f2c0 80b4 	blt.w	20029176 <mbedtls_mpi_inv_mod+0x296>
2002900e:	a909      	add	r1, sp, #36	@ 0x24
20029010:	4608      	mov	r0, r1
20029012:	aa15      	add	r2, sp, #84	@ 0x54
20029014:	f7ff f9d1 	bl	200283ba <mbedtls_mpi_sub_mpi>
20029018:	f8dd 902c 	ldr.w	r9, [sp, #44]	@ 0x2c
2002901c:	4604      	mov	r4, r0
2002901e:	2800      	cmp	r0, #0
20029020:	f040 80d1 	bne.w	200291c6 <mbedtls_mpi_inv_mod+0x2e6>
20029024:	a90c      	add	r1, sp, #48	@ 0x30
20029026:	4608      	mov	r0, r1
20029028:	aa18      	add	r2, sp, #96	@ 0x60
2002902a:	970e      	str	r7, [sp, #56]	@ 0x38
2002902c:	951a      	str	r5, [sp, #104]	@ 0x68
2002902e:	f7ff f9c4 	bl	200283ba <mbedtls_mpi_sub_mpi>
20029032:	9f0e      	ldr	r7, [sp, #56]	@ 0x38
20029034:	4604      	mov	r4, r0
20029036:	2800      	cmp	r0, #0
20029038:	f040 80c5 	bne.w	200291c6 <mbedtls_mpi_inv_mod+0x2e6>
2002903c:	a90f      	add	r1, sp, #60	@ 0x3c
2002903e:	4608      	mov	r0, r1
20029040:	aa1b      	add	r2, sp, #108	@ 0x6c
20029042:	9611      	str	r6, [sp, #68]	@ 0x44
20029044:	f8cd b074 	str.w	fp, [sp, #116]	@ 0x74
20029048:	f7ff f9b7 	bl	200283ba <mbedtls_mpi_sub_mpi>
2002904c:	9e11      	ldr	r6, [sp, #68]	@ 0x44
2002904e:	4604      	mov	r4, r0
20029050:	2800      	cmp	r0, #0
20029052:	f040 80b8 	bne.w	200291c6 <mbedtls_mpi_inv_mod+0x2e6>
20029056:	2100      	movs	r1, #0
20029058:	a809      	add	r0, sp, #36	@ 0x24
2002905a:	f8cd 902c 	str.w	r9, [sp, #44]	@ 0x2c
2002905e:	f7ff f8da 	bl	20028216 <mbedtls_mpi_cmp_int>
20029062:	2800      	cmp	r0, #0
20029064:	d1bf      	bne.n	20028fe6 <mbedtls_mpi_inv_mod+0x106>
20029066:	2100      	movs	r1, #0
20029068:	a818      	add	r0, sp, #96	@ 0x60
2002906a:	951a      	str	r5, [sp, #104]	@ 0x68
2002906c:	f7ff f8d3 	bl	20028216 <mbedtls_mpi_cmp_int>
20029070:	2800      	cmp	r0, #0
20029072:	f2c0 809e 	blt.w	200291b2 <mbedtls_mpi_inv_mod+0x2d2>
20029076:	4651      	mov	r1, sl
20029078:	a818      	add	r0, sp, #96	@ 0x60
2002907a:	951a      	str	r5, [sp, #104]	@ 0x68
2002907c:	f7ff f88a 	bl	20028194 <mbedtls_mpi_cmp_mpi>
20029080:	2800      	cmp	r0, #0
20029082:	f280 80c8 	bge.w	20029216 <mbedtls_mpi_inv_mod+0x336>
20029086:	9801      	ldr	r0, [sp, #4]
20029088:	a918      	add	r1, sp, #96	@ 0x60
2002908a:	f7fe fe73 	bl	20027d74 <mbedtls_mpi_copy>
2002908e:	1e04      	subs	r4, r0, #0
20029090:	bf18      	it	ne
20029092:	f06f 040f 	mvnne.w	r4, #15
20029096:	e096      	b.n	200291c6 <mbedtls_mpi_inv_mod+0x2e6>
20029098:	2101      	movs	r1, #1
2002909a:	a809      	add	r0, sp, #36	@ 0x24
2002909c:	f8cd 902c 	str.w	r9, [sp, #44]	@ 0x2c
200290a0:	f7fe ff99 	bl	20027fd6 <mbedtls_mpi_shift_r>
200290a4:	f8dd 902c 	ldr.w	r9, [sp, #44]	@ 0x2c
200290a8:	2800      	cmp	r0, #0
200290aa:	d161      	bne.n	20029170 <mbedtls_mpi_inv_mod+0x290>
200290ac:	683a      	ldr	r2, [r7, #0]
200290ae:	07d3      	lsls	r3, r2, #31
200290b0:	d402      	bmi.n	200290b8 <mbedtls_mpi_inv_mod+0x1d8>
200290b2:	6832      	ldr	r2, [r6, #0]
200290b4:	07d4      	lsls	r4, r2, #31
200290b6:	d513      	bpl.n	200290e0 <mbedtls_mpi_inv_mod+0x200>
200290b8:	a90c      	add	r1, sp, #48	@ 0x30
200290ba:	4608      	mov	r0, r1
200290bc:	aa12      	add	r2, sp, #72	@ 0x48
200290be:	970e      	str	r7, [sp, #56]	@ 0x38
200290c0:	f7ff f955 	bl	2002836e <mbedtls_mpi_add_mpi>
200290c4:	9f0e      	ldr	r7, [sp, #56]	@ 0x38
200290c6:	4604      	mov	r4, r0
200290c8:	2800      	cmp	r0, #0
200290ca:	d17c      	bne.n	200291c6 <mbedtls_mpi_inv_mod+0x2e6>
200290cc:	a90f      	add	r1, sp, #60	@ 0x3c
200290ce:	4608      	mov	r0, r1
200290d0:	aa06      	add	r2, sp, #24
200290d2:	9611      	str	r6, [sp, #68]	@ 0x44
200290d4:	f7ff f971 	bl	200283ba <mbedtls_mpi_sub_mpi>
200290d8:	9e11      	ldr	r6, [sp, #68]	@ 0x44
200290da:	4604      	mov	r4, r0
200290dc:	2800      	cmp	r0, #0
200290de:	d172      	bne.n	200291c6 <mbedtls_mpi_inv_mod+0x2e6>
200290e0:	2101      	movs	r1, #1
200290e2:	a80c      	add	r0, sp, #48	@ 0x30
200290e4:	970e      	str	r7, [sp, #56]	@ 0x38
200290e6:	f7fe ff76 	bl	20027fd6 <mbedtls_mpi_shift_r>
200290ea:	9f0e      	ldr	r7, [sp, #56]	@ 0x38
200290ec:	2800      	cmp	r0, #0
200290ee:	d13f      	bne.n	20029170 <mbedtls_mpi_inv_mod+0x290>
200290f0:	2101      	movs	r1, #1
200290f2:	a80f      	add	r0, sp, #60	@ 0x3c
200290f4:	9611      	str	r6, [sp, #68]	@ 0x44
200290f6:	f7fe ff6e 	bl	20027fd6 <mbedtls_mpi_shift_r>
200290fa:	9e11      	ldr	r6, [sp, #68]	@ 0x44
200290fc:	e770      	b.n	20028fe0 <mbedtls_mpi_inv_mod+0x100>
200290fe:	2101      	movs	r1, #1
20029100:	a815      	add	r0, sp, #84	@ 0x54
20029102:	f8cd 805c 	str.w	r8, [sp, #92]	@ 0x5c
20029106:	f7fe ff66 	bl	20027fd6 <mbedtls_mpi_shift_r>
2002910a:	f8dd 805c 	ldr.w	r8, [sp, #92]	@ 0x5c
2002910e:	2800      	cmp	r0, #0
20029110:	d12e      	bne.n	20029170 <mbedtls_mpi_inv_mod+0x290>
20029112:	682a      	ldr	r2, [r5, #0]
20029114:	07d1      	lsls	r1, r2, #31
20029116:	d403      	bmi.n	20029120 <mbedtls_mpi_inv_mod+0x240>
20029118:	f8db 2000 	ldr.w	r2, [fp]
2002911c:	07d2      	lsls	r2, r2, #31
2002911e:	d515      	bpl.n	2002914c <mbedtls_mpi_inv_mod+0x26c>
20029120:	a918      	add	r1, sp, #96	@ 0x60
20029122:	4608      	mov	r0, r1
20029124:	aa12      	add	r2, sp, #72	@ 0x48
20029126:	951a      	str	r5, [sp, #104]	@ 0x68
20029128:	f7ff f921 	bl	2002836e <mbedtls_mpi_add_mpi>
2002912c:	9d1a      	ldr	r5, [sp, #104]	@ 0x68
2002912e:	4604      	mov	r4, r0
20029130:	2800      	cmp	r0, #0
20029132:	d148      	bne.n	200291c6 <mbedtls_mpi_inv_mod+0x2e6>
20029134:	a91b      	add	r1, sp, #108	@ 0x6c
20029136:	4608      	mov	r0, r1
20029138:	aa06      	add	r2, sp, #24
2002913a:	f8cd b074 	str.w	fp, [sp, #116]	@ 0x74
2002913e:	f7ff f93c 	bl	200283ba <mbedtls_mpi_sub_mpi>
20029142:	f8dd b074 	ldr.w	fp, [sp, #116]	@ 0x74
20029146:	4604      	mov	r4, r0
20029148:	2800      	cmp	r0, #0
2002914a:	d13c      	bne.n	200291c6 <mbedtls_mpi_inv_mod+0x2e6>
2002914c:	2101      	movs	r1, #1
2002914e:	a818      	add	r0, sp, #96	@ 0x60
20029150:	951a      	str	r5, [sp, #104]	@ 0x68
20029152:	f7fe ff40 	bl	20027fd6 <mbedtls_mpi_shift_r>
20029156:	9d1a      	ldr	r5, [sp, #104]	@ 0x68
20029158:	b950      	cbnz	r0, 20029170 <mbedtls_mpi_inv_mod+0x290>
2002915a:	2101      	movs	r1, #1
2002915c:	a81b      	add	r0, sp, #108	@ 0x6c
2002915e:	f8cd b074 	str.w	fp, [sp, #116]	@ 0x74
20029162:	f7fe ff38 	bl	20027fd6 <mbedtls_mpi_shift_r>
20029166:	f8dd b074 	ldr.w	fp, [sp, #116]	@ 0x74
2002916a:	2800      	cmp	r0, #0
2002916c:	f43f af3f 	beq.w	20028fee <mbedtls_mpi_inv_mod+0x10e>
20029170:	f06f 040f 	mvn.w	r4, #15
20029174:	e027      	b.n	200291c6 <mbedtls_mpi_inv_mod+0x2e6>
20029176:	a915      	add	r1, sp, #84	@ 0x54
20029178:	4608      	mov	r0, r1
2002917a:	aa09      	add	r2, sp, #36	@ 0x24
2002917c:	f7ff f91d 	bl	200283ba <mbedtls_mpi_sub_mpi>
20029180:	f8dd 805c 	ldr.w	r8, [sp, #92]	@ 0x5c
20029184:	4604      	mov	r4, r0
20029186:	b9f0      	cbnz	r0, 200291c6 <mbedtls_mpi_inv_mod+0x2e6>
20029188:	a918      	add	r1, sp, #96	@ 0x60
2002918a:	4608      	mov	r0, r1
2002918c:	aa0c      	add	r2, sp, #48	@ 0x30
2002918e:	951a      	str	r5, [sp, #104]	@ 0x68
20029190:	970e      	str	r7, [sp, #56]	@ 0x38
20029192:	f7ff f912 	bl	200283ba <mbedtls_mpi_sub_mpi>
20029196:	9d1a      	ldr	r5, [sp, #104]	@ 0x68
20029198:	4604      	mov	r4, r0
2002919a:	b9a0      	cbnz	r0, 200291c6 <mbedtls_mpi_inv_mod+0x2e6>
2002919c:	a91b      	add	r1, sp, #108	@ 0x6c
2002919e:	4608      	mov	r0, r1
200291a0:	aa0f      	add	r2, sp, #60	@ 0x3c
200291a2:	f8cd b074 	str.w	fp, [sp, #116]	@ 0x74
200291a6:	9611      	str	r6, [sp, #68]	@ 0x44
200291a8:	f7ff f907 	bl	200283ba <mbedtls_mpi_sub_mpi>
200291ac:	f8dd b074 	ldr.w	fp, [sp, #116]	@ 0x74
200291b0:	e74d      	b.n	2002904e <mbedtls_mpi_inv_mod+0x16e>
200291b2:	a918      	add	r1, sp, #96	@ 0x60
200291b4:	4652      	mov	r2, sl
200291b6:	4608      	mov	r0, r1
200291b8:	f7ff f8d9 	bl	2002836e <mbedtls_mpi_add_mpi>
200291bc:	9d1a      	ldr	r5, [sp, #104]	@ 0x68
200291be:	4604      	mov	r4, r0
200291c0:	2800      	cmp	r0, #0
200291c2:	f43f af50 	beq.w	20029066 <mbedtls_mpi_inv_mod+0x186>
200291c6:	a806      	add	r0, sp, #24
200291c8:	f7fe fd93 	bl	20027cf2 <mbedtls_mpi_free>
200291cc:	a809      	add	r0, sp, #36	@ 0x24
200291ce:	f8cd 902c 	str.w	r9, [sp, #44]	@ 0x2c
200291d2:	f7fe fd8e 	bl	20027cf2 <mbedtls_mpi_free>
200291d6:	a80c      	add	r0, sp, #48	@ 0x30
200291d8:	970e      	str	r7, [sp, #56]	@ 0x38
200291da:	f7fe fd8a 	bl	20027cf2 <mbedtls_mpi_free>
200291de:	a80f      	add	r0, sp, #60	@ 0x3c
200291e0:	9611      	str	r6, [sp, #68]	@ 0x44
200291e2:	f7fe fd86 	bl	20027cf2 <mbedtls_mpi_free>
200291e6:	a803      	add	r0, sp, #12
200291e8:	f7fe fd83 	bl	20027cf2 <mbedtls_mpi_free>
200291ec:	a812      	add	r0, sp, #72	@ 0x48
200291ee:	f7fe fd80 	bl	20027cf2 <mbedtls_mpi_free>
200291f2:	a815      	add	r0, sp, #84	@ 0x54
200291f4:	f8cd 805c 	str.w	r8, [sp, #92]	@ 0x5c
200291f8:	f7fe fd7b 	bl	20027cf2 <mbedtls_mpi_free>
200291fc:	a818      	add	r0, sp, #96	@ 0x60
200291fe:	951a      	str	r5, [sp, #104]	@ 0x68
20029200:	f7fe fd77 	bl	20027cf2 <mbedtls_mpi_free>
20029204:	a81b      	add	r0, sp, #108	@ 0x6c
20029206:	f8cd b074 	str.w	fp, [sp, #116]	@ 0x74
2002920a:	f7fe fd72 	bl	20027cf2 <mbedtls_mpi_free>
2002920e:	4620      	mov	r0, r4
20029210:	b01f      	add	sp, #124	@ 0x7c
20029212:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
20029216:	a918      	add	r1, sp, #96	@ 0x60
20029218:	4652      	mov	r2, sl
2002921a:	4608      	mov	r0, r1
2002921c:	f7ff f8cd 	bl	200283ba <mbedtls_mpi_sub_mpi>
20029220:	9d1a      	ldr	r5, [sp, #104]	@ 0x68
20029222:	4604      	mov	r4, r0
20029224:	2800      	cmp	r0, #0
20029226:	f43f af26 	beq.w	20029076 <mbedtls_mpi_inv_mod+0x196>
2002922a:	e7cc      	b.n	200291c6 <mbedtls_mpi_inv_mod+0x2e6>
2002922c:	46a3      	mov	fp, r4
2002922e:	4625      	mov	r5, r4
20029230:	46a0      	mov	r8, r4
20029232:	4626      	mov	r6, r4
20029234:	4627      	mov	r7, r4
20029236:	46a1      	mov	r9, r4
20029238:	f06f 040d 	mvn.w	r4, #13
2002923c:	e7c3      	b.n	200291c6 <mbedtls_mpi_inv_mod+0x2e6>
2002923e:	46ab      	mov	fp, r5
20029240:	46a8      	mov	r8, r5
20029242:	462e      	mov	r6, r5
20029244:	462f      	mov	r7, r5
20029246:	46a9      	mov	r9, r5
20029248:	e7bd      	b.n	200291c6 <mbedtls_mpi_inv_mod+0x2e6>
2002924a:	46a3      	mov	fp, r4
2002924c:	4625      	mov	r5, r4
2002924e:	e696      	b.n	20028f7e <mbedtls_mpi_inv_mod+0x9e>
20029250:	46a3      	mov	fp, r4
20029252:	4625      	mov	r5, r4
20029254:	4626      	mov	r6, r4
20029256:	e78b      	b.n	20029170 <mbedtls_mpi_inv_mod+0x290>
20029258:	46a3      	mov	fp, r4
2002925a:	4625      	mov	r5, r4
2002925c:	e788      	b.n	20029170 <mbedtls_mpi_inv_mod+0x290>
2002925e:	f04f 0b00 	mov.w	fp, #0
20029262:	e785      	b.n	20029170 <mbedtls_mpi_inv_mod+0x290>
20029264:	f06f 0403 	mvn.w	r4, #3
20029268:	e7d1      	b.n	2002920e <mbedtls_mpi_inv_mod+0x32e>
	...

2002926c <mbedtls_oid_get_pk_alg>:
2002926c:	b570      	push	{r4, r5, r6, lr}
2002926e:	460e      	mov	r6, r1
20029270:	4605      	mov	r5, r0
20029272:	b110      	cbz	r0, 2002927a <mbedtls_oid_get_pk_alg+0xe>
20029274:	4c09      	ldr	r4, [pc, #36]	@ (2002929c <mbedtls_oid_get_pk_alg+0x30>)
20029276:	6820      	ldr	r0, [r4, #0]
20029278:	b910      	cbnz	r0, 20029280 <mbedtls_oid_get_pk_alg+0x14>
2002927a:	f06f 002d 	mvn.w	r0, #45	@ 0x2d
2002927e:	bd70      	pop	{r4, r5, r6, pc}
20029280:	686b      	ldr	r3, [r5, #4]
20029282:	6862      	ldr	r2, [r4, #4]
20029284:	429a      	cmp	r2, r3
20029286:	d103      	bne.n	20029290 <mbedtls_oid_get_pk_alg+0x24>
20029288:	68a9      	ldr	r1, [r5, #8]
2002928a:	f001 facb 	bl	2002a824 <memcmp>
2002928e:	b108      	cbz	r0, 20029294 <mbedtls_oid_get_pk_alg+0x28>
20029290:	3414      	adds	r4, #20
20029292:	e7f0      	b.n	20029276 <mbedtls_oid_get_pk_alg+0xa>
20029294:	7c23      	ldrb	r3, [r4, #16]
20029296:	7033      	strb	r3, [r6, #0]
20029298:	e7f1      	b.n	2002927e <mbedtls_oid_get_pk_alg+0x12>
2002929a:	bf00      	nop
2002929c:	2002c234 	.word	0x2002c234

200292a0 <mbedtls_oid_get_md_alg>:
200292a0:	b570      	push	{r4, r5, r6, lr}
200292a2:	460e      	mov	r6, r1
200292a4:	4605      	mov	r5, r0
200292a6:	b110      	cbz	r0, 200292ae <mbedtls_oid_get_md_alg+0xe>
200292a8:	4c09      	ldr	r4, [pc, #36]	@ (200292d0 <mbedtls_oid_get_md_alg+0x30>)
200292aa:	6820      	ldr	r0, [r4, #0]
200292ac:	b910      	cbnz	r0, 200292b4 <mbedtls_oid_get_md_alg+0x14>
200292ae:	f06f 002d 	mvn.w	r0, #45	@ 0x2d
200292b2:	bd70      	pop	{r4, r5, r6, pc}
200292b4:	686b      	ldr	r3, [r5, #4]
200292b6:	6862      	ldr	r2, [r4, #4]
200292b8:	429a      	cmp	r2, r3
200292ba:	d103      	bne.n	200292c4 <mbedtls_oid_get_md_alg+0x24>
200292bc:	68a9      	ldr	r1, [r5, #8]
200292be:	f001 fab1 	bl	2002a824 <memcmp>
200292c2:	b108      	cbz	r0, 200292c8 <mbedtls_oid_get_md_alg+0x28>
200292c4:	3414      	adds	r4, #20
200292c6:	e7f0      	b.n	200292aa <mbedtls_oid_get_md_alg+0xa>
200292c8:	7c23      	ldrb	r3, [r4, #16]
200292ca:	7033      	strb	r3, [r6, #0]
200292cc:	e7f1      	b.n	200292b2 <mbedtls_oid_get_md_alg+0x12>
200292ce:	bf00      	nop
200292d0:	2002c1d0 	.word	0x2002c1d0

200292d4 <mbedtls_oid_get_oid_by_md>:
200292d4:	b530      	push	{r4, r5, lr}
200292d6:	4b08      	ldr	r3, [pc, #32]	@ (200292f8 <mbedtls_oid_get_oid_by_md+0x24>)
200292d8:	681c      	ldr	r4, [r3, #0]
200292da:	b914      	cbnz	r4, 200292e2 <mbedtls_oid_get_oid_by_md+0xe>
200292dc:	f06f 002d 	mvn.w	r0, #45	@ 0x2d
200292e0:	e006      	b.n	200292f0 <mbedtls_oid_get_oid_by_md+0x1c>
200292e2:	7c1d      	ldrb	r5, [r3, #16]
200292e4:	4285      	cmp	r5, r0
200292e6:	d104      	bne.n	200292f2 <mbedtls_oid_get_oid_by_md+0x1e>
200292e8:	2000      	movs	r0, #0
200292ea:	600c      	str	r4, [r1, #0]
200292ec:	685b      	ldr	r3, [r3, #4]
200292ee:	6013      	str	r3, [r2, #0]
200292f0:	bd30      	pop	{r4, r5, pc}
200292f2:	3314      	adds	r3, #20
200292f4:	e7f0      	b.n	200292d8 <mbedtls_oid_get_oid_by_md+0x4>
200292f6:	bf00      	nop
200292f8:	2002c1d0 	.word	0x2002c1d0

200292fc <mbedtls_pk_init>:
200292fc:	b110      	cbz	r0, 20029304 <mbedtls_pk_init+0x8>
200292fe:	2300      	movs	r3, #0
20029300:	e9c0 3300 	strd	r3, r3, [r0]
20029304:	4770      	bx	lr

20029306 <mbedtls_pk_free>:
20029306:	b510      	push	{r4, lr}
20029308:	4604      	mov	r4, r0
2002930a:	b160      	cbz	r0, 20029326 <mbedtls_pk_free+0x20>
2002930c:	6803      	ldr	r3, [r0, #0]
2002930e:	b153      	cbz	r3, 20029326 <mbedtls_pk_free+0x20>
20029310:	6a9b      	ldr	r3, [r3, #40]	@ 0x28
20029312:	6840      	ldr	r0, [r0, #4]
20029314:	4798      	blx	r3
20029316:	2100      	movs	r1, #0
20029318:	f104 0308 	add.w	r3, r4, #8
2002931c:	4622      	mov	r2, r4
2002931e:	3401      	adds	r4, #1
20029320:	429c      	cmp	r4, r3
20029322:	7011      	strb	r1, [r2, #0]
20029324:	d1fa      	bne.n	2002931c <mbedtls_pk_free+0x16>
20029326:	bd10      	pop	{r4, pc}

20029328 <mbedtls_pk_info_from_type>:
20029328:	2801      	cmp	r0, #1
2002932a:	4802      	ldr	r0, [pc, #8]	@ (20029334 <mbedtls_pk_info_from_type+0xc>)
2002932c:	bf18      	it	ne
2002932e:	2000      	movne	r0, #0
20029330:	4770      	bx	lr
20029332:	bf00      	nop
20029334:	2002c284 	.word	0x2002c284

20029338 <mbedtls_pk_setup>:
20029338:	b570      	push	{r4, r5, r6, lr}
2002933a:	460e      	mov	r6, r1
2002933c:	4605      	mov	r5, r0
2002933e:	b148      	cbz	r0, 20029354 <mbedtls_pk_setup+0x1c>
20029340:	b141      	cbz	r1, 20029354 <mbedtls_pk_setup+0x1c>
20029342:	6804      	ldr	r4, [r0, #0]
20029344:	b934      	cbnz	r4, 20029354 <mbedtls_pk_setup+0x1c>
20029346:	6a4b      	ldr	r3, [r1, #36]	@ 0x24
20029348:	4798      	blx	r3
2002934a:	6068      	str	r0, [r5, #4]
2002934c:	b120      	cbz	r0, 20029358 <mbedtls_pk_setup+0x20>
2002934e:	4620      	mov	r0, r4
20029350:	602e      	str	r6, [r5, #0]
20029352:	bd70      	pop	{r4, r5, r6, pc}
20029354:	4801      	ldr	r0, [pc, #4]	@ (2002935c <mbedtls_pk_setup+0x24>)
20029356:	e7fc      	b.n	20029352 <mbedtls_pk_setup+0x1a>
20029358:	4801      	ldr	r0, [pc, #4]	@ (20029360 <mbedtls_pk_setup+0x28>)
2002935a:	e7fa      	b.n	20029352 <mbedtls_pk_setup+0x1a>
2002935c:	ffffc180 	.word	0xffffc180
20029360:	ffffc080 	.word	0xffffc080

20029364 <mbedtls_pk_verify>:
20029364:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
20029368:	460d      	mov	r5, r1
2002936a:	e9dd 8908 	ldrd	r8, r9, [sp, #32]
2002936e:	4616      	mov	r6, r2
20029370:	4604      	mov	r4, r0
20029372:	b910      	cbnz	r0, 2002937a <mbedtls_pk_verify+0x16>
20029374:	480e      	ldr	r0, [pc, #56]	@ (200293b0 <mbedtls_pk_verify+0x4c>)
20029376:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
2002937a:	6802      	ldr	r2, [r0, #0]
2002937c:	2a00      	cmp	r2, #0
2002937e:	d0f9      	beq.n	20029374 <mbedtls_pk_verify+0x10>
20029380:	b93b      	cbnz	r3, 20029392 <mbedtls_pk_verify+0x2e>
20029382:	4608      	mov	r0, r1
20029384:	f7fc fd42 	bl	20025e0c <mbedtls_md_info_from_type>
20029388:	2800      	cmp	r0, #0
2002938a:	d0f3      	beq.n	20029374 <mbedtls_pk_verify+0x10>
2002938c:	f7fc fd4a 	bl	20025e24 <mbedtls_md_get_size>
20029390:	4603      	mov	r3, r0
20029392:	6822      	ldr	r2, [r4, #0]
20029394:	6917      	ldr	r7, [r2, #16]
20029396:	b147      	cbz	r7, 200293aa <mbedtls_pk_verify+0x46>
20029398:	e9cd 8908 	strd	r8, r9, [sp, #32]
2002939c:	4632      	mov	r2, r6
2002939e:	4629      	mov	r1, r5
200293a0:	46bc      	mov	ip, r7
200293a2:	6860      	ldr	r0, [r4, #4]
200293a4:	e8bd 47f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
200293a8:	4760      	bx	ip
200293aa:	4802      	ldr	r0, [pc, #8]	@ (200293b4 <mbedtls_pk_verify+0x50>)
200293ac:	e7e3      	b.n	20029376 <mbedtls_pk_verify+0x12>
200293ae:	bf00      	nop
200293b0:	ffffc180 	.word	0xffffc180
200293b4:	ffffc100 	.word	0xffffc100

200293b8 <pk_get_pk_alg>:
200293b8:	b530      	push	{r4, r5, lr}
200293ba:	4615      	mov	r5, r2
200293bc:	2200      	movs	r2, #0
200293be:	b085      	sub	sp, #20
200293c0:	e9c3 2200 	strd	r2, r2, [r3]
200293c4:	609a      	str	r2, [r3, #8]
200293c6:	aa01      	add	r2, sp, #4
200293c8:	461c      	mov	r4, r3
200293ca:	f7fe fa98 	bl	200278fe <mbedtls_asn1_get_alg>
200293ce:	b118      	cbz	r0, 200293d8 <pk_get_pk_alg+0x20>
200293d0:	f5a0 506a 	sub.w	r0, r0, #14976	@ 0x3a80
200293d4:	b005      	add	sp, #20
200293d6:	bd30      	pop	{r4, r5, pc}
200293d8:	4629      	mov	r1, r5
200293da:	a801      	add	r0, sp, #4
200293dc:	f7ff ff46 	bl	2002926c <mbedtls_oid_get_pk_alg>
200293e0:	b960      	cbnz	r0, 200293fc <pk_get_pk_alg+0x44>
200293e2:	782b      	ldrb	r3, [r5, #0]
200293e4:	2b01      	cmp	r3, #1
200293e6:	d1f5      	bne.n	200293d4 <pk_get_pk_alg+0x1c>
200293e8:	6823      	ldr	r3, [r4, #0]
200293ea:	2b05      	cmp	r3, #5
200293ec:	d000      	beq.n	200293f0 <pk_get_pk_alg+0x38>
200293ee:	b93b      	cbnz	r3, 20029400 <pk_get_pk_alg+0x48>
200293f0:	6862      	ldr	r2, [r4, #4]
200293f2:	4b04      	ldr	r3, [pc, #16]	@ (20029404 <pk_get_pk_alg+0x4c>)
200293f4:	2a00      	cmp	r2, #0
200293f6:	bf18      	it	ne
200293f8:	4618      	movne	r0, r3
200293fa:	e7eb      	b.n	200293d4 <pk_get_pk_alg+0x1c>
200293fc:	4802      	ldr	r0, [pc, #8]	@ (20029408 <pk_get_pk_alg+0x50>)
200293fe:	e7e9      	b.n	200293d4 <pk_get_pk_alg+0x1c>
20029400:	4800      	ldr	r0, [pc, #0]	@ (20029404 <pk_get_pk_alg+0x4c>)
20029402:	e7e7      	b.n	200293d4 <pk_get_pk_alg+0x1c>
20029404:	ffffc580 	.word	0xffffc580
20029408:	ffffc380 	.word	0xffffc380

2002940c <mbedtls_pk_parse_subpubkey>:
2002940c:	2300      	movs	r3, #0
2002940e:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
20029412:	b087      	sub	sp, #28
20029414:	4690      	mov	r8, r2
20029416:	f88d 3003 	strb.w	r3, [sp, #3]
2002941a:	aa01      	add	r2, sp, #4
2002941c:	2330      	movs	r3, #48	@ 0x30
2002941e:	4606      	mov	r6, r0
20029420:	f7fe fa32 	bl	20027888 <mbedtls_asn1_get_tag>
20029424:	b128      	cbz	r0, 20029432 <mbedtls_pk_parse_subpubkey+0x26>
20029426:	f5a0 5474 	sub.w	r4, r0, #15616	@ 0x3d00
2002942a:	4620      	mov	r0, r4
2002942c:	b007      	add	sp, #28
2002942e:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
20029432:	9b01      	ldr	r3, [sp, #4]
20029434:	6837      	ldr	r7, [r6, #0]
20029436:	4630      	mov	r0, r6
20029438:	441f      	add	r7, r3
2002943a:	4639      	mov	r1, r7
2002943c:	ab03      	add	r3, sp, #12
2002943e:	f10d 0203 	add.w	r2, sp, #3
20029442:	f7ff ffb9 	bl	200293b8 <pk_get_pk_alg>
20029446:	4604      	mov	r4, r0
20029448:	2800      	cmp	r0, #0
2002944a:	d1ee      	bne.n	2002942a <mbedtls_pk_parse_subpubkey+0x1e>
2002944c:	4639      	mov	r1, r7
2002944e:	4630      	mov	r0, r6
20029450:	aa01      	add	r2, sp, #4
20029452:	f7fe fa40 	bl	200278d6 <mbedtls_asn1_get_bitstring_null>
20029456:	b110      	cbz	r0, 2002945e <mbedtls_pk_parse_subpubkey+0x52>
20029458:	f5a0 546c 	sub.w	r4, r0, #15104	@ 0x3b00
2002945c:	e7e5      	b.n	2002942a <mbedtls_pk_parse_subpubkey+0x1e>
2002945e:	6833      	ldr	r3, [r6, #0]
20029460:	9a01      	ldr	r2, [sp, #4]
20029462:	4413      	add	r3, r2
20029464:	429f      	cmp	r7, r3
20029466:	d14b      	bne.n	20029500 <mbedtls_pk_parse_subpubkey+0xf4>
20029468:	f89d 0003 	ldrb.w	r0, [sp, #3]
2002946c:	f7ff ff5c 	bl	20029328 <mbedtls_pk_info_from_type>
20029470:	4601      	mov	r1, r0
20029472:	2800      	cmp	r0, #0
20029474:	d046      	beq.n	20029504 <mbedtls_pk_parse_subpubkey+0xf8>
20029476:	4640      	mov	r0, r8
20029478:	f7ff ff5e 	bl	20029338 <mbedtls_pk_setup>
2002947c:	4604      	mov	r4, r0
2002947e:	2800      	cmp	r0, #0
20029480:	d1d3      	bne.n	2002942a <mbedtls_pk_parse_subpubkey+0x1e>
20029482:	f89d 3003 	ldrb.w	r3, [sp, #3]
20029486:	2b01      	cmp	r3, #1
20029488:	d138      	bne.n	200294fc <mbedtls_pk_parse_subpubkey+0xf0>
2002948a:	2330      	movs	r3, #48	@ 0x30
2002948c:	4639      	mov	r1, r7
2002948e:	4630      	mov	r0, r6
20029490:	aa02      	add	r2, sp, #8
20029492:	f8d8 5004 	ldr.w	r5, [r8, #4]
20029496:	f7fe f9f7 	bl	20027888 <mbedtls_asn1_get_tag>
2002949a:	b138      	cbz	r0, 200294ac <mbedtls_pk_parse_subpubkey+0xa0>
2002949c:	f5a0 556c 	sub.w	r5, r0, #15104	@ 0x3b00
200294a0:	bb3d      	cbnz	r5, 200294f2 <mbedtls_pk_parse_subpubkey+0xe6>
200294a2:	6833      	ldr	r3, [r6, #0]
200294a4:	42bb      	cmp	r3, r7
200294a6:	d0c0      	beq.n	2002942a <mbedtls_pk_parse_subpubkey+0x1e>
200294a8:	4d17      	ldr	r5, [pc, #92]	@ (20029508 <mbedtls_pk_parse_subpubkey+0xfc>)
200294aa:	e022      	b.n	200294f2 <mbedtls_pk_parse_subpubkey+0xe6>
200294ac:	6833      	ldr	r3, [r6, #0]
200294ae:	9a02      	ldr	r2, [sp, #8]
200294b0:	4413      	add	r3, r2
200294b2:	429f      	cmp	r7, r3
200294b4:	d1f8      	bne.n	200294a8 <mbedtls_pk_parse_subpubkey+0x9c>
200294b6:	f105 0a08 	add.w	sl, r5, #8
200294ba:	4652      	mov	r2, sl
200294bc:	4639      	mov	r1, r7
200294be:	4630      	mov	r0, r6
200294c0:	f7fe f9f6 	bl	200278b0 <mbedtls_asn1_get_mpi>
200294c4:	2800      	cmp	r0, #0
200294c6:	d1e9      	bne.n	2002949c <mbedtls_pk_parse_subpubkey+0x90>
200294c8:	4639      	mov	r1, r7
200294ca:	4630      	mov	r0, r6
200294cc:	f105 0214 	add.w	r2, r5, #20
200294d0:	f7fe f9ee 	bl	200278b0 <mbedtls_asn1_get_mpi>
200294d4:	2800      	cmp	r0, #0
200294d6:	d1e1      	bne.n	2002949c <mbedtls_pk_parse_subpubkey+0x90>
200294d8:	6833      	ldr	r3, [r6, #0]
200294da:	429f      	cmp	r7, r3
200294dc:	d1e4      	bne.n	200294a8 <mbedtls_pk_parse_subpubkey+0x9c>
200294de:	4628      	mov	r0, r5
200294e0:	f000 f8c2 	bl	20029668 <mbedtls_rsa_check_pubkey>
200294e4:	b920      	cbnz	r0, 200294f0 <mbedtls_pk_parse_subpubkey+0xe4>
200294e6:	4650      	mov	r0, sl
200294e8:	f7fe fcbe 	bl	20027e68 <mbedtls_mpi_size>
200294ec:	6068      	str	r0, [r5, #4]
200294ee:	e7d8      	b.n	200294a2 <mbedtls_pk_parse_subpubkey+0x96>
200294f0:	4d06      	ldr	r5, [pc, #24]	@ (2002950c <mbedtls_pk_parse_subpubkey+0x100>)
200294f2:	4640      	mov	r0, r8
200294f4:	f7ff ff07 	bl	20029306 <mbedtls_pk_free>
200294f8:	462c      	mov	r4, r5
200294fa:	e796      	b.n	2002942a <mbedtls_pk_parse_subpubkey+0x1e>
200294fc:	4d04      	ldr	r5, [pc, #16]	@ (20029510 <mbedtls_pk_parse_subpubkey+0x104>)
200294fe:	e7f8      	b.n	200294f2 <mbedtls_pk_parse_subpubkey+0xe6>
20029500:	4c01      	ldr	r4, [pc, #4]	@ (20029508 <mbedtls_pk_parse_subpubkey+0xfc>)
20029502:	e792      	b.n	2002942a <mbedtls_pk_parse_subpubkey+0x1e>
20029504:	4c02      	ldr	r4, [pc, #8]	@ (20029510 <mbedtls_pk_parse_subpubkey+0x104>)
20029506:	e790      	b.n	2002942a <mbedtls_pk_parse_subpubkey+0x1e>
20029508:	ffffc49a 	.word	0xffffc49a
2002950c:	ffffc500 	.word	0xffffc500
20029510:	ffffc380 	.word	0xffffc380

20029514 <mbedtls_pk_parse_public_key>:
20029514:	4613      	mov	r3, r2
20029516:	b507      	push	{r0, r1, r2, lr}
20029518:	4602      	mov	r2, r0
2002951a:	9101      	str	r1, [sp, #4]
2002951c:	a801      	add	r0, sp, #4
2002951e:	4419      	add	r1, r3
20029520:	f7ff ff74 	bl	2002940c <mbedtls_pk_parse_subpubkey>
20029524:	b003      	add	sp, #12
20029526:	f85d fb04 	ldr.w	pc, [sp], #4

2002952a <rsa_can_do>:
2002952a:	2801      	cmp	r0, #1
2002952c:	d002      	beq.n	20029534 <rsa_can_do+0xa>
2002952e:	1f83      	subs	r3, r0, #6
20029530:	4258      	negs	r0, r3
20029532:	4158      	adcs	r0, r3
20029534:	4770      	bx	lr

20029536 <rsa_get_bitlen>:
20029536:	6840      	ldr	r0, [r0, #4]
20029538:	00c0      	lsls	r0, r0, #3
2002953a:	4770      	bx	lr

2002953c <rsa_debug>:
2002953c:	2301      	movs	r3, #1
2002953e:	4a06      	ldr	r2, [pc, #24]	@ (20029558 <rsa_debug+0x1c>)
20029540:	700b      	strb	r3, [r1, #0]
20029542:	730b      	strb	r3, [r1, #12]
20029544:	4b05      	ldr	r3, [pc, #20]	@ (2002955c <rsa_debug+0x20>)
20029546:	604a      	str	r2, [r1, #4]
20029548:	f100 0208 	add.w	r2, r0, #8
2002954c:	3014      	adds	r0, #20
2002954e:	608a      	str	r2, [r1, #8]
20029550:	610b      	str	r3, [r1, #16]
20029552:	6148      	str	r0, [r1, #20]
20029554:	4770      	bx	lr
20029556:	bf00      	nop
20029558:	2002b060 	.word	0x2002b060
2002955c:	2002b066 	.word	0x2002b066

20029560 <rsa_free_wrap>:
20029560:	b510      	push	{r4, lr}
20029562:	4604      	mov	r4, r0
20029564:	f000 fe7c 	bl	2002a260 <mbedtls_rsa_free>
20029568:	4620      	mov	r0, r4
2002956a:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
2002956e:	f001 b8a3 	b.w	2002a6b8 <free>

20029572 <rsa_alloc_wrap>:
20029572:	b510      	push	{r4, lr}
20029574:	21ac      	movs	r1, #172	@ 0xac
20029576:	2001      	movs	r0, #1
20029578:	f001 f882 	bl	2002a680 <calloc>
2002957c:	4604      	mov	r4, r0
2002957e:	b118      	cbz	r0, 20029588 <rsa_alloc_wrap+0x16>
20029580:	2200      	movs	r2, #0
20029582:	4611      	mov	r1, r2
20029584:	f000 f862 	bl	2002964c <mbedtls_rsa_init>
20029588:	4620      	mov	r0, r4
2002958a:	bd10      	pop	{r4, pc}

2002958c <rsa_check_pair_wrap>:
2002958c:	f000 b99c 	b.w	200298c8 <mbedtls_rsa_check_pub_priv>

20029590 <rsa_encrypt_wrap>:
20029590:	b4f0      	push	{r4, r5, r6, r7}
20029592:	9f04      	ldr	r7, [sp, #16]
20029594:	6846      	ldr	r6, [r0, #4]
20029596:	460d      	mov	r5, r1
20029598:	603e      	str	r6, [r7, #0]
2002959a:	9f05      	ldr	r7, [sp, #20]
2002959c:	4614      	mov	r4, r2
2002959e:	e9dd 1206 	ldrd	r1, r2, [sp, #24]
200295a2:	42be      	cmp	r6, r7
200295a4:	d806      	bhi.n	200295b4 <rsa_encrypt_wrap+0x24>
200295a6:	e9cd 5305 	strd	r5, r3, [sp, #20]
200295aa:	9404      	str	r4, [sp, #16]
200295ac:	2300      	movs	r3, #0
200295ae:	bcf0      	pop	{r4, r5, r6, r7}
200295b0:	f000 bbe2 	b.w	20029d78 <mbedtls_rsa_pkcs1_encrypt>
200295b4:	4801      	ldr	r0, [pc, #4]	@ (200295bc <rsa_encrypt_wrap+0x2c>)
200295b6:	bcf0      	pop	{r4, r5, r6, r7}
200295b8:	4770      	bx	lr
200295ba:	bf00      	nop
200295bc:	ffffbc00 	.word	0xffffbc00

200295c0 <rsa_decrypt_wrap>:
200295c0:	b4f0      	push	{r4, r5, r6, r7}
200295c2:	4616      	mov	r6, r2
200295c4:	6847      	ldr	r7, [r0, #4]
200295c6:	460c      	mov	r4, r1
200295c8:	e9dd 5105 	ldrd	r5, r1, [sp, #20]
200295cc:	42b7      	cmp	r7, r6
200295ce:	9a07      	ldr	r2, [sp, #28]
200295d0:	d106      	bne.n	200295e0 <rsa_decrypt_wrap+0x20>
200295d2:	e9cd 3506 	strd	r3, r5, [sp, #24]
200295d6:	9405      	str	r4, [sp, #20]
200295d8:	2301      	movs	r3, #1
200295da:	bcf0      	pop	{r4, r5, r6, r7}
200295dc:	f000 bc6e 	b.w	20029ebc <mbedtls_rsa_pkcs1_decrypt>
200295e0:	4801      	ldr	r0, [pc, #4]	@ (200295e8 <rsa_decrypt_wrap+0x28>)
200295e2:	bcf0      	pop	{r4, r5, r6, r7}
200295e4:	4770      	bx	lr
200295e6:	bf00      	nop
200295e8:	ffffbf80 	.word	0xffffbf80

200295ec <rsa_sign_wrap>:
200295ec:	b4f0      	push	{r4, r5, r6, r7}
200295ee:	460c      	mov	r4, r1
200295f0:	4615      	mov	r5, r2
200295f2:	e9dd 1206 	ldrd	r1, r2, [sp, #24]
200295f6:	6847      	ldr	r7, [r0, #4]
200295f8:	9e05      	ldr	r6, [sp, #20]
200295fa:	6037      	str	r7, [r6, #0]
200295fc:	9e04      	ldr	r6, [sp, #16]
200295fe:	e9cd 4304 	strd	r4, r3, [sp, #16]
20029602:	e9cd 5606 	strd	r5, r6, [sp, #24]
20029606:	bcf0      	pop	{r4, r5, r6, r7}
20029608:	2301      	movs	r3, #1
2002960a:	f000 bd31 	b.w	2002a070 <mbedtls_rsa_pkcs1_sign>
	...

20029610 <rsa_verify_wrap>:
20029610:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
20029612:	9d09      	ldr	r5, [sp, #36]	@ 0x24
20029614:	6846      	ldr	r6, [r0, #4]
20029616:	4604      	mov	r4, r0
20029618:	42ae      	cmp	r6, r5
2002961a:	d811      	bhi.n	20029640 <rsa_verify_wrap+0x30>
2002961c:	e9cd 1300 	strd	r1, r3, [sp]
20029620:	2300      	movs	r3, #0
20029622:	9e08      	ldr	r6, [sp, #32]
20029624:	4619      	mov	r1, r3
20029626:	e9cd 2602 	strd	r2, r6, [sp, #8]
2002962a:	461a      	mov	r2, r3
2002962c:	f000 fe08 	bl	2002a240 <mbedtls_rsa_pkcs1_verify>
20029630:	b920      	cbnz	r0, 2002963c <rsa_verify_wrap+0x2c>
20029632:	6862      	ldr	r2, [r4, #4]
20029634:	4b03      	ldr	r3, [pc, #12]	@ (20029644 <rsa_verify_wrap+0x34>)
20029636:	42aa      	cmp	r2, r5
20029638:	bf38      	it	cc
2002963a:	4618      	movcc	r0, r3
2002963c:	b004      	add	sp, #16
2002963e:	bd70      	pop	{r4, r5, r6, pc}
20029640:	4801      	ldr	r0, [pc, #4]	@ (20029648 <rsa_verify_wrap+0x38>)
20029642:	e7fb      	b.n	2002963c <rsa_verify_wrap+0x2c>
20029644:	ffffc700 	.word	0xffffc700
20029648:	ffffbc80 	.word	0xffffbc80

2002964c <mbedtls_rsa_init>:
2002964c:	b570      	push	{r4, r5, r6, lr}
2002964e:	4604      	mov	r4, r0
20029650:	460e      	mov	r6, r1
20029652:	4615      	mov	r5, r2
20029654:	2100      	movs	r1, #0
20029656:	22ac      	movs	r2, #172	@ 0xac
20029658:	f001 f8f4 	bl	2002a844 <memset>
2002965c:	e9c4 6529 	strd	r6, r5, [r4, #164]	@ 0xa4
20029660:	bd70      	pop	{r4, r5, r6, pc}

20029662 <mbedtls_rsa_set_padding>:
20029662:	e9c0 1229 	strd	r1, r2, [r0, #164]	@ 0xa4
20029666:	4770      	bx	lr

20029668 <mbedtls_rsa_check_pubkey>:
20029668:	b538      	push	{r3, r4, r5, lr}
2002966a:	6902      	ldr	r2, [r0, #16]
2002966c:	4604      	mov	r4, r0
2002966e:	b10a      	cbz	r2, 20029674 <mbedtls_rsa_check_pubkey+0xc>
20029670:	69c3      	ldr	r3, [r0, #28]
20029672:	b90b      	cbnz	r3, 20029678 <mbedtls_rsa_check_pubkey+0x10>
20029674:	4811      	ldr	r0, [pc, #68]	@ (200296bc <mbedtls_rsa_check_pubkey+0x54>)
20029676:	bd38      	pop	{r3, r4, r5, pc}
20029678:	6812      	ldr	r2, [r2, #0]
2002967a:	07d2      	lsls	r2, r2, #31
2002967c:	d5fa      	bpl.n	20029674 <mbedtls_rsa_check_pubkey+0xc>
2002967e:	681b      	ldr	r3, [r3, #0]
20029680:	07db      	lsls	r3, r3, #31
20029682:	d5f7      	bpl.n	20029674 <mbedtls_rsa_check_pubkey+0xc>
20029684:	f100 0508 	add.w	r5, r0, #8
20029688:	4628      	mov	r0, r5
2002968a:	f7fe fbd0 	bl	20027e2e <mbedtls_mpi_bitlen>
2002968e:	287f      	cmp	r0, #127	@ 0x7f
20029690:	d9f0      	bls.n	20029674 <mbedtls_rsa_check_pubkey+0xc>
20029692:	4628      	mov	r0, r5
20029694:	f7fe fbcb 	bl	20027e2e <mbedtls_mpi_bitlen>
20029698:	f5b0 5f00 	cmp.w	r0, #8192	@ 0x2000
2002969c:	d8ea      	bhi.n	20029674 <mbedtls_rsa_check_pubkey+0xc>
2002969e:	3414      	adds	r4, #20
200296a0:	4620      	mov	r0, r4
200296a2:	f7fe fbc4 	bl	20027e2e <mbedtls_mpi_bitlen>
200296a6:	2801      	cmp	r0, #1
200296a8:	d9e4      	bls.n	20029674 <mbedtls_rsa_check_pubkey+0xc>
200296aa:	4629      	mov	r1, r5
200296ac:	4620      	mov	r0, r4
200296ae:	f7fe fd71 	bl	20028194 <mbedtls_mpi_cmp_mpi>
200296b2:	2800      	cmp	r0, #0
200296b4:	dade      	bge.n	20029674 <mbedtls_rsa_check_pubkey+0xc>
200296b6:	2000      	movs	r0, #0
200296b8:	e7dd      	b.n	20029676 <mbedtls_rsa_check_pubkey+0xe>
200296ba:	bf00      	nop
200296bc:	ffffbe00 	.word	0xffffbe00

200296c0 <mbedtls_rsa_check_privkey>:
200296c0:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
200296c4:	b0a9      	sub	sp, #164	@ 0xa4
200296c6:	4605      	mov	r5, r0
200296c8:	f7ff ffce 	bl	20029668 <mbedtls_rsa_check_pubkey>
200296cc:	b120      	cbz	r0, 200296d8 <mbedtls_rsa_check_privkey+0x18>
200296ce:	4c7d      	ldr	r4, [pc, #500]	@ (200298c4 <mbedtls_rsa_check_privkey+0x204>)
200296d0:	4620      	mov	r0, r4
200296d2:	b029      	add	sp, #164	@ 0xa4
200296d4:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
200296d8:	6b6b      	ldr	r3, [r5, #52]	@ 0x34
200296da:	2b00      	cmp	r3, #0
200296dc:	d0f7      	beq.n	200296ce <mbedtls_rsa_check_privkey+0xe>
200296de:	6c2b      	ldr	r3, [r5, #64]	@ 0x40
200296e0:	2b00      	cmp	r3, #0
200296e2:	d0f4      	beq.n	200296ce <mbedtls_rsa_check_privkey+0xe>
200296e4:	6aab      	ldr	r3, [r5, #40]	@ 0x28
200296e6:	2b00      	cmp	r3, #0
200296e8:	d0f1      	beq.n	200296ce <mbedtls_rsa_check_privkey+0xe>
200296ea:	a801      	add	r0, sp, #4
200296ec:	f7fe fafa 	bl	20027ce4 <mbedtls_mpi_init>
200296f0:	a804      	add	r0, sp, #16
200296f2:	f7fe faf7 	bl	20027ce4 <mbedtls_mpi_init>
200296f6:	a807      	add	r0, sp, #28
200296f8:	f7fe faf4 	bl	20027ce4 <mbedtls_mpi_init>
200296fc:	a80a      	add	r0, sp, #40	@ 0x28
200296fe:	f7fe faf1 	bl	20027ce4 <mbedtls_mpi_init>
20029702:	a80d      	add	r0, sp, #52	@ 0x34
20029704:	f7fe faee 	bl	20027ce4 <mbedtls_mpi_init>
20029708:	a810      	add	r0, sp, #64	@ 0x40
2002970a:	f7fe faeb 	bl	20027ce4 <mbedtls_mpi_init>
2002970e:	a813      	add	r0, sp, #76	@ 0x4c
20029710:	f7fe fae8 	bl	20027ce4 <mbedtls_mpi_init>
20029714:	a816      	add	r0, sp, #88	@ 0x58
20029716:	f7fe fae5 	bl	20027ce4 <mbedtls_mpi_init>
2002971a:	a819      	add	r0, sp, #100	@ 0x64
2002971c:	f7fe fae2 	bl	20027ce4 <mbedtls_mpi_init>
20029720:	a81c      	add	r0, sp, #112	@ 0x70
20029722:	f7fe fadf 	bl	20027ce4 <mbedtls_mpi_init>
20029726:	a81f      	add	r0, sp, #124	@ 0x7c
20029728:	f7fe fadc 	bl	20027ce4 <mbedtls_mpi_init>
2002972c:	a822      	add	r0, sp, #136	@ 0x88
2002972e:	f7fe fad9 	bl	20027ce4 <mbedtls_mpi_init>
20029732:	f105 072c 	add.w	r7, r5, #44	@ 0x2c
20029736:	a825      	add	r0, sp, #148	@ 0x94
20029738:	f105 0638 	add.w	r6, r5, #56	@ 0x38
2002973c:	f7fe fad2 	bl	20027ce4 <mbedtls_mpi_init>
20029740:	4632      	mov	r2, r6
20029742:	4639      	mov	r1, r7
20029744:	a801      	add	r0, sp, #4
20029746:	f7fe fe75 	bl	20028434 <mbedtls_mpi_mul_mpi>
2002974a:	4604      	mov	r4, r0
2002974c:	2800      	cmp	r0, #0
2002974e:	d15e      	bne.n	2002980e <mbedtls_rsa_check_privkey+0x14e>
20029750:	f105 0820 	add.w	r8, r5, #32
20029754:	f105 0914 	add.w	r9, r5, #20
20029758:	464a      	mov	r2, r9
2002975a:	4641      	mov	r1, r8
2002975c:	a804      	add	r0, sp, #16
2002975e:	f7fe fe69 	bl	20028434 <mbedtls_mpi_mul_mpi>
20029762:	4604      	mov	r4, r0
20029764:	2800      	cmp	r0, #0
20029766:	d152      	bne.n	2002980e <mbedtls_rsa_check_privkey+0x14e>
20029768:	2201      	movs	r2, #1
2002976a:	4639      	mov	r1, r7
2002976c:	a807      	add	r0, sp, #28
2002976e:	f7fe fe4b 	bl	20028408 <mbedtls_mpi_sub_int>
20029772:	4604      	mov	r4, r0
20029774:	2800      	cmp	r0, #0
20029776:	d14a      	bne.n	2002980e <mbedtls_rsa_check_privkey+0x14e>
20029778:	2201      	movs	r2, #1
2002977a:	4631      	mov	r1, r6
2002977c:	a80a      	add	r0, sp, #40	@ 0x28
2002977e:	f7fe fe43 	bl	20028408 <mbedtls_mpi_sub_int>
20029782:	4604      	mov	r4, r0
20029784:	2800      	cmp	r0, #0
20029786:	d142      	bne.n	2002980e <mbedtls_rsa_check_privkey+0x14e>
20029788:	aa0a      	add	r2, sp, #40	@ 0x28
2002978a:	a907      	add	r1, sp, #28
2002978c:	a80d      	add	r0, sp, #52	@ 0x34
2002978e:	f7fe fe51 	bl	20028434 <mbedtls_mpi_mul_mpi>
20029792:	4604      	mov	r4, r0
20029794:	2800      	cmp	r0, #0
20029796:	d13a      	bne.n	2002980e <mbedtls_rsa_check_privkey+0x14e>
20029798:	4649      	mov	r1, r9
2002979a:	aa0d      	add	r2, sp, #52	@ 0x34
2002979c:	a813      	add	r0, sp, #76	@ 0x4c
2002979e:	f7ff fb04 	bl	20028daa <mbedtls_mpi_gcd>
200297a2:	4604      	mov	r4, r0
200297a4:	2800      	cmp	r0, #0
200297a6:	d132      	bne.n	2002980e <mbedtls_rsa_check_privkey+0x14e>
200297a8:	aa0a      	add	r2, sp, #40	@ 0x28
200297aa:	a907      	add	r1, sp, #28
200297ac:	a816      	add	r0, sp, #88	@ 0x58
200297ae:	f7ff fafc 	bl	20028daa <mbedtls_mpi_gcd>
200297b2:	4604      	mov	r4, r0
200297b4:	bb58      	cbnz	r0, 2002980e <mbedtls_rsa_check_privkey+0x14e>
200297b6:	ab16      	add	r3, sp, #88	@ 0x58
200297b8:	aa0d      	add	r2, sp, #52	@ 0x34
200297ba:	a91c      	add	r1, sp, #112	@ 0x70
200297bc:	a819      	add	r0, sp, #100	@ 0x64
200297be:	f7fe feaa 	bl	20028516 <mbedtls_mpi_div_mpi>
200297c2:	4604      	mov	r4, r0
200297c4:	bb18      	cbnz	r0, 2002980e <mbedtls_rsa_check_privkey+0x14e>
200297c6:	aa19      	add	r2, sp, #100	@ 0x64
200297c8:	a904      	add	r1, sp, #16
200297ca:	a810      	add	r0, sp, #64	@ 0x40
200297cc:	f7ff f8a7 	bl	2002891e <mbedtls_mpi_mod_mpi>
200297d0:	4604      	mov	r4, r0
200297d2:	b9e0      	cbnz	r0, 2002980e <mbedtls_rsa_check_privkey+0x14e>
200297d4:	4641      	mov	r1, r8
200297d6:	aa07      	add	r2, sp, #28
200297d8:	a81f      	add	r0, sp, #124	@ 0x7c
200297da:	f7ff f8a0 	bl	2002891e <mbedtls_mpi_mod_mpi>
200297de:	4604      	mov	r4, r0
200297e0:	b9a8      	cbnz	r0, 2002980e <mbedtls_rsa_check_privkey+0x14e>
200297e2:	4641      	mov	r1, r8
200297e4:	aa0a      	add	r2, sp, #40	@ 0x28
200297e6:	a822      	add	r0, sp, #136	@ 0x88
200297e8:	f7ff f899 	bl	2002891e <mbedtls_mpi_mod_mpi>
200297ec:	4604      	mov	r4, r0
200297ee:	b970      	cbnz	r0, 2002980e <mbedtls_rsa_check_privkey+0x14e>
200297f0:	463a      	mov	r2, r7
200297f2:	4631      	mov	r1, r6
200297f4:	a825      	add	r0, sp, #148	@ 0x94
200297f6:	f7ff fb73 	bl	20028ee0 <mbedtls_mpi_inv_mod>
200297fa:	4604      	mov	r4, r0
200297fc:	b938      	cbnz	r0, 2002980e <mbedtls_rsa_check_privkey+0x14e>
200297fe:	f105 0108 	add.w	r1, r5, #8
20029802:	a801      	add	r0, sp, #4
20029804:	f7fe fcc6 	bl	20028194 <mbedtls_mpi_cmp_mpi>
20029808:	2800      	cmp	r0, #0
2002980a:	d031      	beq.n	20029870 <mbedtls_rsa_check_privkey+0x1b0>
2002980c:	4c2d      	ldr	r4, [pc, #180]	@ (200298c4 <mbedtls_rsa_check_privkey+0x204>)
2002980e:	a801      	add	r0, sp, #4
20029810:	f7fe fa6f 	bl	20027cf2 <mbedtls_mpi_free>
20029814:	a804      	add	r0, sp, #16
20029816:	f7fe fa6c 	bl	20027cf2 <mbedtls_mpi_free>
2002981a:	a807      	add	r0, sp, #28
2002981c:	f7fe fa69 	bl	20027cf2 <mbedtls_mpi_free>
20029820:	a80a      	add	r0, sp, #40	@ 0x28
20029822:	f7fe fa66 	bl	20027cf2 <mbedtls_mpi_free>
20029826:	a80d      	add	r0, sp, #52	@ 0x34
20029828:	f7fe fa63 	bl	20027cf2 <mbedtls_mpi_free>
2002982c:	a810      	add	r0, sp, #64	@ 0x40
2002982e:	f7fe fa60 	bl	20027cf2 <mbedtls_mpi_free>
20029832:	a813      	add	r0, sp, #76	@ 0x4c
20029834:	f7fe fa5d 	bl	20027cf2 <mbedtls_mpi_free>
20029838:	a816      	add	r0, sp, #88	@ 0x58
2002983a:	f7fe fa5a 	bl	20027cf2 <mbedtls_mpi_free>
2002983e:	a819      	add	r0, sp, #100	@ 0x64
20029840:	f7fe fa57 	bl	20027cf2 <mbedtls_mpi_free>
20029844:	a81c      	add	r0, sp, #112	@ 0x70
20029846:	f7fe fa54 	bl	20027cf2 <mbedtls_mpi_free>
2002984a:	a81f      	add	r0, sp, #124	@ 0x7c
2002984c:	f7fe fa51 	bl	20027cf2 <mbedtls_mpi_free>
20029850:	a822      	add	r0, sp, #136	@ 0x88
20029852:	f7fe fa4e 	bl	20027cf2 <mbedtls_mpi_free>
20029856:	a825      	add	r0, sp, #148	@ 0x94
20029858:	f7fe fa4b 	bl	20027cf2 <mbedtls_mpi_free>
2002985c:	f514 4f84 	cmn.w	r4, #16896	@ 0x4200
20029860:	f43f af35 	beq.w	200296ce <mbedtls_rsa_check_privkey+0xe>
20029864:	2c00      	cmp	r4, #0
20029866:	f43f af33 	beq.w	200296d0 <mbedtls_rsa_check_privkey+0x10>
2002986a:	f5a4 4484 	sub.w	r4, r4, #16896	@ 0x4200
2002986e:	e72f      	b.n	200296d0 <mbedtls_rsa_check_privkey+0x10>
20029870:	f105 0144 	add.w	r1, r5, #68	@ 0x44
20029874:	a81f      	add	r0, sp, #124	@ 0x7c
20029876:	f7fe fc8d 	bl	20028194 <mbedtls_mpi_cmp_mpi>
2002987a:	2800      	cmp	r0, #0
2002987c:	d1c6      	bne.n	2002980c <mbedtls_rsa_check_privkey+0x14c>
2002987e:	f105 0150 	add.w	r1, r5, #80	@ 0x50
20029882:	a822      	add	r0, sp, #136	@ 0x88
20029884:	f7fe fc86 	bl	20028194 <mbedtls_mpi_cmp_mpi>
20029888:	2800      	cmp	r0, #0
2002988a:	d1bf      	bne.n	2002980c <mbedtls_rsa_check_privkey+0x14c>
2002988c:	f105 015c 	add.w	r1, r5, #92	@ 0x5c
20029890:	a825      	add	r0, sp, #148	@ 0x94
20029892:	f7fe fc7f 	bl	20028194 <mbedtls_mpi_cmp_mpi>
20029896:	2800      	cmp	r0, #0
20029898:	d1b8      	bne.n	2002980c <mbedtls_rsa_check_privkey+0x14c>
2002989a:	2100      	movs	r1, #0
2002989c:	a81c      	add	r0, sp, #112	@ 0x70
2002989e:	f7fe fcba 	bl	20028216 <mbedtls_mpi_cmp_int>
200298a2:	2800      	cmp	r0, #0
200298a4:	d1b2      	bne.n	2002980c <mbedtls_rsa_check_privkey+0x14c>
200298a6:	2101      	movs	r1, #1
200298a8:	a810      	add	r0, sp, #64	@ 0x40
200298aa:	f7fe fcb4 	bl	20028216 <mbedtls_mpi_cmp_int>
200298ae:	2800      	cmp	r0, #0
200298b0:	d1ac      	bne.n	2002980c <mbedtls_rsa_check_privkey+0x14c>
200298b2:	2101      	movs	r1, #1
200298b4:	a813      	add	r0, sp, #76	@ 0x4c
200298b6:	f7fe fcae 	bl	20028216 <mbedtls_mpi_cmp_int>
200298ba:	4604      	mov	r4, r0
200298bc:	2800      	cmp	r0, #0
200298be:	d1a5      	bne.n	2002980c <mbedtls_rsa_check_privkey+0x14c>
200298c0:	e7a5      	b.n	2002980e <mbedtls_rsa_check_privkey+0x14e>
200298c2:	bf00      	nop
200298c4:	ffffbe00 	.word	0xffffbe00

200298c8 <mbedtls_rsa_check_pub_priv>:
200298c8:	b538      	push	{r3, r4, r5, lr}
200298ca:	4605      	mov	r5, r0
200298cc:	460c      	mov	r4, r1
200298ce:	f7ff fecb 	bl	20029668 <mbedtls_rsa_check_pubkey>
200298d2:	b918      	cbnz	r0, 200298dc <mbedtls_rsa_check_pub_priv+0x14>
200298d4:	4620      	mov	r0, r4
200298d6:	f7ff fef3 	bl	200296c0 <mbedtls_rsa_check_privkey>
200298da:	b108      	cbz	r0, 200298e0 <mbedtls_rsa_check_pub_priv+0x18>
200298dc:	4809      	ldr	r0, [pc, #36]	@ (20029904 <mbedtls_rsa_check_pub_priv+0x3c>)
200298de:	bd38      	pop	{r3, r4, r5, pc}
200298e0:	f104 0108 	add.w	r1, r4, #8
200298e4:	f105 0008 	add.w	r0, r5, #8
200298e8:	f7fe fc54 	bl	20028194 <mbedtls_mpi_cmp_mpi>
200298ec:	2800      	cmp	r0, #0
200298ee:	d1f5      	bne.n	200298dc <mbedtls_rsa_check_pub_priv+0x14>
200298f0:	f104 0114 	add.w	r1, r4, #20
200298f4:	f105 0014 	add.w	r0, r5, #20
200298f8:	f7fe fc4c 	bl	20028194 <mbedtls_mpi_cmp_mpi>
200298fc:	2800      	cmp	r0, #0
200298fe:	d0ee      	beq.n	200298de <mbedtls_rsa_check_pub_priv+0x16>
20029900:	e7ec      	b.n	200298dc <mbedtls_rsa_check_pub_priv+0x14>
20029902:	bf00      	nop
20029904:	ffffbe00 	.word	0xffffbe00

20029908 <mbedtls_rsa_public>:
20029908:	b5f0      	push	{r4, r5, r6, r7, lr}
2002990a:	460c      	mov	r4, r1
2002990c:	4605      	mov	r5, r0
2002990e:	b087      	sub	sp, #28
20029910:	a803      	add	r0, sp, #12
20029912:	4616      	mov	r6, r2
20029914:	f7fe f9e6 	bl	20027ce4 <mbedtls_mpi_init>
20029918:	4621      	mov	r1, r4
2002991a:	686a      	ldr	r2, [r5, #4]
2002991c:	a803      	add	r0, sp, #12
2002991e:	f7fe faa9 	bl	20027e74 <mbedtls_mpi_read_binary>
20029922:	4604      	mov	r4, r0
20029924:	b9d0      	cbnz	r0, 2002995c <mbedtls_rsa_public+0x54>
20029926:	f105 0408 	add.w	r4, r5, #8
2002992a:	4621      	mov	r1, r4
2002992c:	a803      	add	r0, sp, #12
2002992e:	f7fe fc31 	bl	20028194 <mbedtls_mpi_cmp_mpi>
20029932:	2800      	cmp	r0, #0
20029934:	da1b      	bge.n	2002996e <mbedtls_rsa_public+0x66>
20029936:	f105 0368 	add.w	r3, r5, #104	@ 0x68
2002993a:	a903      	add	r1, sp, #12
2002993c:	686f      	ldr	r7, [r5, #4]
2002993e:	4608      	mov	r0, r1
20029940:	9300      	str	r3, [sp, #0]
20029942:	f105 0214 	add.w	r2, r5, #20
20029946:	4623      	mov	r3, r4
20029948:	f7ff f81b 	bl	20028982 <mbedtls_mpi_exp_mod>
2002994c:	4604      	mov	r4, r0
2002994e:	b928      	cbnz	r0, 2002995c <mbedtls_rsa_public+0x54>
20029950:	463a      	mov	r2, r7
20029952:	4631      	mov	r1, r6
20029954:	a803      	add	r0, sp, #12
20029956:	f7fe fac2 	bl	20027ede <mbedtls_mpi_write_binary>
2002995a:	4604      	mov	r4, r0
2002995c:	a803      	add	r0, sp, #12
2002995e:	f7fe f9c8 	bl	20027cf2 <mbedtls_mpi_free>
20029962:	b10c      	cbz	r4, 20029968 <mbedtls_rsa_public+0x60>
20029964:	f5a4 4485 	sub.w	r4, r4, #17024	@ 0x4280
20029968:	4620      	mov	r0, r4
2002996a:	b007      	add	sp, #28
2002996c:	bdf0      	pop	{r4, r5, r6, r7, pc}
2002996e:	f06f 0403 	mvn.w	r4, #3
20029972:	e7f3      	b.n	2002995c <mbedtls_rsa_public+0x54>

20029974 <mbedtls_rsa_private>:
20029974:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20029978:	461e      	mov	r6, r3
2002997a:	6b43      	ldr	r3, [r0, #52]	@ 0x34
2002997c:	4604      	mov	r4, r0
2002997e:	460d      	mov	r5, r1
20029980:	4617      	mov	r7, r2
20029982:	b09d      	sub	sp, #116	@ 0x74
20029984:	2b00      	cmp	r3, #0
20029986:	f000 8179 	beq.w	20029c7c <mbedtls_rsa_private+0x308>
2002998a:	6c03      	ldr	r3, [r0, #64]	@ 0x40
2002998c:	2b00      	cmp	r3, #0
2002998e:	f000 8175 	beq.w	20029c7c <mbedtls_rsa_private+0x308>
20029992:	6a83      	ldr	r3, [r0, #40]	@ 0x28
20029994:	2b00      	cmp	r3, #0
20029996:	f000 8171 	beq.w	20029c7c <mbedtls_rsa_private+0x308>
2002999a:	a804      	add	r0, sp, #16
2002999c:	f7fe f9a2 	bl	20027ce4 <mbedtls_mpi_init>
200299a0:	a807      	add	r0, sp, #28
200299a2:	f7fe f99f 	bl	20027ce4 <mbedtls_mpi_init>
200299a6:	a80a      	add	r0, sp, #40	@ 0x28
200299a8:	f7fe f99c 	bl	20027ce4 <mbedtls_mpi_init>
200299ac:	a80d      	add	r0, sp, #52	@ 0x34
200299ae:	f7fe f999 	bl	20027ce4 <mbedtls_mpi_init>
200299b2:	a810      	add	r0, sp, #64	@ 0x40
200299b4:	f7fe f996 	bl	20027ce4 <mbedtls_mpi_init>
200299b8:	a813      	add	r0, sp, #76	@ 0x4c
200299ba:	f7fe f993 	bl	20027ce4 <mbedtls_mpi_init>
200299be:	b12d      	cbz	r5, 200299cc <mbedtls_rsa_private+0x58>
200299c0:	a816      	add	r0, sp, #88	@ 0x58
200299c2:	f7fe f98f 	bl	20027ce4 <mbedtls_mpi_init>
200299c6:	a819      	add	r0, sp, #100	@ 0x64
200299c8:	f7fe f98c 	bl	20027ce4 <mbedtls_mpi_init>
200299cc:	4631      	mov	r1, r6
200299ce:	6862      	ldr	r2, [r4, #4]
200299d0:	a804      	add	r0, sp, #16
200299d2:	f7fe fa4f 	bl	20027e74 <mbedtls_mpi_read_binary>
200299d6:	4603      	mov	r3, r0
200299d8:	2800      	cmp	r0, #0
200299da:	f040 80e0 	bne.w	20029b9e <mbedtls_rsa_private+0x22a>
200299de:	f104 0608 	add.w	r6, r4, #8
200299e2:	4631      	mov	r1, r6
200299e4:	a804      	add	r0, sp, #16
200299e6:	f7fe fbd5 	bl	20028194 <mbedtls_mpi_cmp_mpi>
200299ea:	2800      	cmp	r0, #0
200299ec:	f280 8143 	bge.w	20029c76 <mbedtls_rsa_private+0x302>
200299f0:	f104 0a44 	add.w	sl, r4, #68	@ 0x44
200299f4:	f104 0950 	add.w	r9, r4, #80	@ 0x50
200299f8:	2d00      	cmp	r5, #0
200299fa:	f000 8089 	beq.w	20029b10 <mbedtls_rsa_private+0x19c>
200299fe:	f8d4 30a0 	ldr.w	r3, [r4, #160]	@ 0xa0
20029a02:	2b00      	cmp	r3, #0
20029a04:	f000 80f4 	beq.w	20029bf0 <mbedtls_rsa_private+0x27c>
20029a08:	f104 088c 	add.w	r8, r4, #140	@ 0x8c
20029a0c:	4642      	mov	r2, r8
20029a0e:	4641      	mov	r1, r8
20029a10:	4640      	mov	r0, r8
20029a12:	f7fe fd0f 	bl	20028434 <mbedtls_mpi_mul_mpi>
20029a16:	4603      	mov	r3, r0
20029a18:	2800      	cmp	r0, #0
20029a1a:	f040 80c0 	bne.w	20029b9e <mbedtls_rsa_private+0x22a>
20029a1e:	4632      	mov	r2, r6
20029a20:	4641      	mov	r1, r8
20029a22:	4640      	mov	r0, r8
20029a24:	f7fe ff7b 	bl	2002891e <mbedtls_mpi_mod_mpi>
20029a28:	4603      	mov	r3, r0
20029a2a:	2800      	cmp	r0, #0
20029a2c:	f040 80b7 	bne.w	20029b9e <mbedtls_rsa_private+0x22a>
20029a30:	f104 0898 	add.w	r8, r4, #152	@ 0x98
20029a34:	4642      	mov	r2, r8
20029a36:	4641      	mov	r1, r8
20029a38:	4640      	mov	r0, r8
20029a3a:	f7fe fcfb 	bl	20028434 <mbedtls_mpi_mul_mpi>
20029a3e:	4603      	mov	r3, r0
20029a40:	2800      	cmp	r0, #0
20029a42:	f040 80ac 	bne.w	20029b9e <mbedtls_rsa_private+0x22a>
20029a46:	4632      	mov	r2, r6
20029a48:	4641      	mov	r1, r8
20029a4a:	4640      	mov	r0, r8
20029a4c:	f7fe ff67 	bl	2002891e <mbedtls_mpi_mod_mpi>
20029a50:	4603      	mov	r3, r0
20029a52:	2800      	cmp	r0, #0
20029a54:	f040 80a3 	bne.w	20029b9e <mbedtls_rsa_private+0x22a>
20029a58:	a904      	add	r1, sp, #16
20029a5a:	4608      	mov	r0, r1
20029a5c:	f104 028c 	add.w	r2, r4, #140	@ 0x8c
20029a60:	f7fe fce8 	bl	20028434 <mbedtls_mpi_mul_mpi>
20029a64:	4603      	mov	r3, r0
20029a66:	2800      	cmp	r0, #0
20029a68:	f040 8099 	bne.w	20029b9e <mbedtls_rsa_private+0x22a>
20029a6c:	a904      	add	r1, sp, #16
20029a6e:	4632      	mov	r2, r6
20029a70:	4608      	mov	r0, r1
20029a72:	f7fe ff54 	bl	2002891e <mbedtls_mpi_mod_mpi>
20029a76:	4603      	mov	r3, r0
20029a78:	2800      	cmp	r0, #0
20029a7a:	f040 8090 	bne.w	20029b9e <mbedtls_rsa_private+0x22a>
20029a7e:	2201      	movs	r2, #1
20029a80:	f104 012c 	add.w	r1, r4, #44	@ 0x2c
20029a84:	a80d      	add	r0, sp, #52	@ 0x34
20029a86:	f7fe fcbf 	bl	20028408 <mbedtls_mpi_sub_int>
20029a8a:	4603      	mov	r3, r0
20029a8c:	2800      	cmp	r0, #0
20029a8e:	f040 8086 	bne.w	20029b9e <mbedtls_rsa_private+0x22a>
20029a92:	2201      	movs	r2, #1
20029a94:	f104 0138 	add.w	r1, r4, #56	@ 0x38
20029a98:	a810      	add	r0, sp, #64	@ 0x40
20029a9a:	f7fe fcb5 	bl	20028408 <mbedtls_mpi_sub_int>
20029a9e:	4603      	mov	r3, r0
20029aa0:	2800      	cmp	r0, #0
20029aa2:	d17c      	bne.n	20029b9e <mbedtls_rsa_private+0x22a>
20029aa4:	463b      	mov	r3, r7
20029aa6:	462a      	mov	r2, r5
20029aa8:	211c      	movs	r1, #28
20029aaa:	a813      	add	r0, sp, #76	@ 0x4c
20029aac:	f7ff f9fb 	bl	20028ea6 <mbedtls_mpi_fill_random>
20029ab0:	4603      	mov	r3, r0
20029ab2:	2800      	cmp	r0, #0
20029ab4:	d173      	bne.n	20029b9e <mbedtls_rsa_private+0x22a>
20029ab6:	aa13      	add	r2, sp, #76	@ 0x4c
20029ab8:	a90d      	add	r1, sp, #52	@ 0x34
20029aba:	a816      	add	r0, sp, #88	@ 0x58
20029abc:	f7fe fcba 	bl	20028434 <mbedtls_mpi_mul_mpi>
20029ac0:	4603      	mov	r3, r0
20029ac2:	2800      	cmp	r0, #0
20029ac4:	d16b      	bne.n	20029b9e <mbedtls_rsa_private+0x22a>
20029ac6:	a916      	add	r1, sp, #88	@ 0x58
20029ac8:	4652      	mov	r2, sl
20029aca:	4608      	mov	r0, r1
20029acc:	f7fe fc4f 	bl	2002836e <mbedtls_mpi_add_mpi>
20029ad0:	4603      	mov	r3, r0
20029ad2:	2800      	cmp	r0, #0
20029ad4:	d163      	bne.n	20029b9e <mbedtls_rsa_private+0x22a>
20029ad6:	463b      	mov	r3, r7
20029ad8:	462a      	mov	r2, r5
20029ada:	211c      	movs	r1, #28
20029adc:	a813      	add	r0, sp, #76	@ 0x4c
20029ade:	f7ff f9e2 	bl	20028ea6 <mbedtls_mpi_fill_random>
20029ae2:	4603      	mov	r3, r0
20029ae4:	2800      	cmp	r0, #0
20029ae6:	d15a      	bne.n	20029b9e <mbedtls_rsa_private+0x22a>
20029ae8:	aa13      	add	r2, sp, #76	@ 0x4c
20029aea:	a910      	add	r1, sp, #64	@ 0x40
20029aec:	a819      	add	r0, sp, #100	@ 0x64
20029aee:	f7fe fca1 	bl	20028434 <mbedtls_mpi_mul_mpi>
20029af2:	4603      	mov	r3, r0
20029af4:	2800      	cmp	r0, #0
20029af6:	d152      	bne.n	20029b9e <mbedtls_rsa_private+0x22a>
20029af8:	a919      	add	r1, sp, #100	@ 0x64
20029afa:	464a      	mov	r2, r9
20029afc:	4608      	mov	r0, r1
20029afe:	f7fe fc36 	bl	2002836e <mbedtls_mpi_add_mpi>
20029b02:	4603      	mov	r3, r0
20029b04:	2800      	cmp	r0, #0
20029b06:	d14a      	bne.n	20029b9e <mbedtls_rsa_private+0x22a>
20029b08:	f10d 0964 	add.w	r9, sp, #100	@ 0x64
20029b0c:	f10d 0a58 	add.w	sl, sp, #88	@ 0x58
20029b10:	f104 0374 	add.w	r3, r4, #116	@ 0x74
20029b14:	f104 082c 	add.w	r8, r4, #44	@ 0x2c
20029b18:	9300      	str	r3, [sp, #0]
20029b1a:	4652      	mov	r2, sl
20029b1c:	4643      	mov	r3, r8
20029b1e:	a904      	add	r1, sp, #16
20029b20:	a807      	add	r0, sp, #28
20029b22:	f7fe ff2e 	bl	20028982 <mbedtls_mpi_exp_mod>
20029b26:	4603      	mov	r3, r0
20029b28:	2800      	cmp	r0, #0
20029b2a:	d138      	bne.n	20029b9e <mbedtls_rsa_private+0x22a>
20029b2c:	f104 0380 	add.w	r3, r4, #128	@ 0x80
20029b30:	f104 0738 	add.w	r7, r4, #56	@ 0x38
20029b34:	9300      	str	r3, [sp, #0]
20029b36:	464a      	mov	r2, r9
20029b38:	463b      	mov	r3, r7
20029b3a:	a904      	add	r1, sp, #16
20029b3c:	a80a      	add	r0, sp, #40	@ 0x28
20029b3e:	f7fe ff20 	bl	20028982 <mbedtls_mpi_exp_mod>
20029b42:	4603      	mov	r3, r0
20029b44:	bb58      	cbnz	r0, 20029b9e <mbedtls_rsa_private+0x22a>
20029b46:	aa0a      	add	r2, sp, #40	@ 0x28
20029b48:	a907      	add	r1, sp, #28
20029b4a:	a804      	add	r0, sp, #16
20029b4c:	f7fe fc35 	bl	200283ba <mbedtls_mpi_sub_mpi>
20029b50:	4603      	mov	r3, r0
20029b52:	bb20      	cbnz	r0, 20029b9e <mbedtls_rsa_private+0x22a>
20029b54:	f104 025c 	add.w	r2, r4, #92	@ 0x5c
20029b58:	a904      	add	r1, sp, #16
20029b5a:	a807      	add	r0, sp, #28
20029b5c:	f7fe fc6a 	bl	20028434 <mbedtls_mpi_mul_mpi>
20029b60:	4603      	mov	r3, r0
20029b62:	b9e0      	cbnz	r0, 20029b9e <mbedtls_rsa_private+0x22a>
20029b64:	4642      	mov	r2, r8
20029b66:	a907      	add	r1, sp, #28
20029b68:	a804      	add	r0, sp, #16
20029b6a:	f7fe fed8 	bl	2002891e <mbedtls_mpi_mod_mpi>
20029b6e:	4603      	mov	r3, r0
20029b70:	b9a8      	cbnz	r0, 20029b9e <mbedtls_rsa_private+0x22a>
20029b72:	463a      	mov	r2, r7
20029b74:	a904      	add	r1, sp, #16
20029b76:	a807      	add	r0, sp, #28
20029b78:	f7fe fc5c 	bl	20028434 <mbedtls_mpi_mul_mpi>
20029b7c:	4603      	mov	r3, r0
20029b7e:	b970      	cbnz	r0, 20029b9e <mbedtls_rsa_private+0x22a>
20029b80:	aa07      	add	r2, sp, #28
20029b82:	a90a      	add	r1, sp, #40	@ 0x28
20029b84:	a804      	add	r0, sp, #16
20029b86:	f7fe fbf2 	bl	2002836e <mbedtls_mpi_add_mpi>
20029b8a:	4603      	mov	r3, r0
20029b8c:	b938      	cbnz	r0, 20029b9e <mbedtls_rsa_private+0x22a>
20029b8e:	2d00      	cmp	r5, #0
20029b90:	d15f      	bne.n	20029c52 <mbedtls_rsa_private+0x2de>
20029b92:	6862      	ldr	r2, [r4, #4]
20029b94:	9926      	ldr	r1, [sp, #152]	@ 0x98
20029b96:	a804      	add	r0, sp, #16
20029b98:	f7fe f9a1 	bl	20027ede <mbedtls_mpi_write_binary>
20029b9c:	4603      	mov	r3, r0
20029b9e:	a804      	add	r0, sp, #16
20029ba0:	9303      	str	r3, [sp, #12]
20029ba2:	f7fe f8a6 	bl	20027cf2 <mbedtls_mpi_free>
20029ba6:	a807      	add	r0, sp, #28
20029ba8:	f7fe f8a3 	bl	20027cf2 <mbedtls_mpi_free>
20029bac:	a80a      	add	r0, sp, #40	@ 0x28
20029bae:	f7fe f8a0 	bl	20027cf2 <mbedtls_mpi_free>
20029bb2:	a80d      	add	r0, sp, #52	@ 0x34
20029bb4:	f7fe f89d 	bl	20027cf2 <mbedtls_mpi_free>
20029bb8:	a810      	add	r0, sp, #64	@ 0x40
20029bba:	f7fe f89a 	bl	20027cf2 <mbedtls_mpi_free>
20029bbe:	a813      	add	r0, sp, #76	@ 0x4c
20029bc0:	f7fe f897 	bl	20027cf2 <mbedtls_mpi_free>
20029bc4:	9b03      	ldr	r3, [sp, #12]
20029bc6:	b135      	cbz	r5, 20029bd6 <mbedtls_rsa_private+0x262>
20029bc8:	a816      	add	r0, sp, #88	@ 0x58
20029bca:	f7fe f892 	bl	20027cf2 <mbedtls_mpi_free>
20029bce:	a819      	add	r0, sp, #100	@ 0x64
20029bd0:	f7fe f88f 	bl	20027cf2 <mbedtls_mpi_free>
20029bd4:	9b03      	ldr	r3, [sp, #12]
20029bd6:	b10b      	cbz	r3, 20029bdc <mbedtls_rsa_private+0x268>
20029bd8:	f5a3 4386 	sub.w	r3, r3, #17152	@ 0x4300
20029bdc:	4618      	mov	r0, r3
20029bde:	b01d      	add	sp, #116	@ 0x74
20029be0:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
20029be4:	9b03      	ldr	r3, [sp, #12]
20029be6:	3b01      	subs	r3, #1
20029be8:	9303      	str	r3, [sp, #12]
20029bea:	d107      	bne.n	20029bfc <mbedtls_rsa_private+0x288>
20029bec:	4b24      	ldr	r3, [pc, #144]	@ (20029c80 <mbedtls_rsa_private+0x30c>)
20029bee:	e7d6      	b.n	20029b9e <mbedtls_rsa_private+0x22a>
20029bf0:	230b      	movs	r3, #11
20029bf2:	f104 0b98 	add.w	fp, r4, #152	@ 0x98
20029bf6:	9303      	str	r3, [sp, #12]
20029bf8:	f104 088c 	add.w	r8, r4, #140	@ 0x8c
20029bfc:	6861      	ldr	r1, [r4, #4]
20029bfe:	463b      	mov	r3, r7
20029c00:	462a      	mov	r2, r5
20029c02:	4658      	mov	r0, fp
20029c04:	3901      	subs	r1, #1
20029c06:	f7ff f94e 	bl	20028ea6 <mbedtls_mpi_fill_random>
20029c0a:	4603      	mov	r3, r0
20029c0c:	2800      	cmp	r0, #0
20029c0e:	d1c6      	bne.n	20029b9e <mbedtls_rsa_private+0x22a>
20029c10:	4632      	mov	r2, r6
20029c12:	4659      	mov	r1, fp
20029c14:	4640      	mov	r0, r8
20029c16:	f7ff f8c8 	bl	20028daa <mbedtls_mpi_gcd>
20029c1a:	4603      	mov	r3, r0
20029c1c:	2800      	cmp	r0, #0
20029c1e:	d1be      	bne.n	20029b9e <mbedtls_rsa_private+0x22a>
20029c20:	2101      	movs	r1, #1
20029c22:	4640      	mov	r0, r8
20029c24:	f7fe faf7 	bl	20028216 <mbedtls_mpi_cmp_int>
20029c28:	2800      	cmp	r0, #0
20029c2a:	d1db      	bne.n	20029be4 <mbedtls_rsa_private+0x270>
20029c2c:	4632      	mov	r2, r6
20029c2e:	4659      	mov	r1, fp
20029c30:	4640      	mov	r0, r8
20029c32:	f7ff f955 	bl	20028ee0 <mbedtls_mpi_inv_mod>
20029c36:	4603      	mov	r3, r0
20029c38:	2800      	cmp	r0, #0
20029c3a:	d1b0      	bne.n	20029b9e <mbedtls_rsa_private+0x22a>
20029c3c:	f104 0368 	add.w	r3, r4, #104	@ 0x68
20029c40:	9300      	str	r3, [sp, #0]
20029c42:	4641      	mov	r1, r8
20029c44:	4633      	mov	r3, r6
20029c46:	4640      	mov	r0, r8
20029c48:	f104 0214 	add.w	r2, r4, #20
20029c4c:	f7fe fe99 	bl	20028982 <mbedtls_mpi_exp_mod>
20029c50:	e6fe      	b.n	20029a50 <mbedtls_rsa_private+0xdc>
20029c52:	a904      	add	r1, sp, #16
20029c54:	4608      	mov	r0, r1
20029c56:	f104 0298 	add.w	r2, r4, #152	@ 0x98
20029c5a:	f7fe fbeb 	bl	20028434 <mbedtls_mpi_mul_mpi>
20029c5e:	4603      	mov	r3, r0
20029c60:	2800      	cmp	r0, #0
20029c62:	d19c      	bne.n	20029b9e <mbedtls_rsa_private+0x22a>
20029c64:	a904      	add	r1, sp, #16
20029c66:	4632      	mov	r2, r6
20029c68:	4608      	mov	r0, r1
20029c6a:	f7fe fe58 	bl	2002891e <mbedtls_mpi_mod_mpi>
20029c6e:	4603      	mov	r3, r0
20029c70:	2800      	cmp	r0, #0
20029c72:	d08e      	beq.n	20029b92 <mbedtls_rsa_private+0x21e>
20029c74:	e793      	b.n	20029b9e <mbedtls_rsa_private+0x22a>
20029c76:	f06f 0303 	mvn.w	r3, #3
20029c7a:	e790      	b.n	20029b9e <mbedtls_rsa_private+0x22a>
20029c7c:	4b01      	ldr	r3, [pc, #4]	@ (20029c84 <mbedtls_rsa_private+0x310>)
20029c7e:	e7ad      	b.n	20029bdc <mbedtls_rsa_private+0x268>
20029c80:	ffffbb80 	.word	0xffffbb80
20029c84:	ffffbf80 	.word	0xffffbf80

20029c88 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt>:
20029c88:	e92d 4ff7 	stmdb	sp!, {r0, r1, r2, r4, r5, r6, r7, r8, r9, sl, fp, lr}
20029c8c:	4698      	mov	r8, r3
20029c8e:	e9dd a30c 	ldrd	sl, r3, [sp, #48]	@ 0x30
20029c92:	f1b8 0f01 	cmp.w	r8, #1
20029c96:	4606      	mov	r6, r0
20029c98:	460f      	mov	r7, r1
20029c9a:	4691      	mov	r9, r2
20029c9c:	9d0e      	ldr	r5, [sp, #56]	@ 0x38
20029c9e:	d103      	bne.n	20029ca8 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0x20>
20029ca0:	f8d0 20a4 	ldr.w	r2, [r0, #164]	@ 0xa4
20029ca4:	2a00      	cmp	r2, #0
20029ca6:	d162      	bne.n	20029d6e <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xe6>
20029ca8:	2f00      	cmp	r7, #0
20029caa:	d060      	beq.n	20029d6e <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xe6>
20029cac:	2b00      	cmp	r3, #0
20029cae:	d05e      	beq.n	20029d6e <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xe6>
20029cb0:	2d00      	cmp	r5, #0
20029cb2:	d05c      	beq.n	20029d6e <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xe6>
20029cb4:	f11a 0f0c 	cmn.w	sl, #12
20029cb8:	6874      	ldr	r4, [r6, #4]
20029cba:	d858      	bhi.n	20029d6e <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xe6>
20029cbc:	f10a 020b 	add.w	r2, sl, #11
20029cc0:	42a2      	cmp	r2, r4
20029cc2:	d854      	bhi.n	20029d6e <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xe6>
20029cc4:	4629      	mov	r1, r5
20029cc6:	2200      	movs	r2, #0
20029cc8:	eba4 040a 	sub.w	r4, r4, sl
20029ccc:	3c03      	subs	r4, #3
20029cce:	f801 2b02 	strb.w	r2, [r1], #2
20029cd2:	f1b8 0f00 	cmp.w	r8, #0
20029cd6:	d131      	bne.n	20029d3c <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xb4>
20029cd8:	2202      	movs	r2, #2
20029cda:	4414      	add	r4, r2
20029cdc:	706a      	strb	r2, [r5, #1]
20029cde:	442c      	add	r4, r5
20029ce0:	42a1      	cmp	r1, r4
20029ce2:	d112      	bne.n	20029d0a <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0x82>
20029ce4:	2200      	movs	r2, #0
20029ce6:	4620      	mov	r0, r4
20029ce8:	4619      	mov	r1, r3
20029cea:	f800 2b01 	strb.w	r2, [r0], #1
20029cee:	4652      	mov	r2, sl
20029cf0:	f000 fdc2 	bl	2002a878 <memcpy>
20029cf4:	f1b8 0f00 	cmp.w	r8, #0
20029cf8:	d12f      	bne.n	20029d5a <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xd2>
20029cfa:	462a      	mov	r2, r5
20029cfc:	4629      	mov	r1, r5
20029cfe:	4630      	mov	r0, r6
20029d00:	b003      	add	sp, #12
20029d02:	e8bd 4ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20029d06:	f7ff bdff 	b.w	20029908 <mbedtls_rsa_public>
20029d0a:	f04f 0b64 	mov.w	fp, #100	@ 0x64
20029d0e:	2201      	movs	r2, #1
20029d10:	4648      	mov	r0, r9
20029d12:	9301      	str	r3, [sp, #4]
20029d14:	9100      	str	r1, [sp, #0]
20029d16:	47b8      	blx	r7
20029d18:	9900      	ldr	r1, [sp, #0]
20029d1a:	9b01      	ldr	r3, [sp, #4]
20029d1c:	780a      	ldrb	r2, [r1, #0]
20029d1e:	b94a      	cbnz	r2, 20029d34 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xac>
20029d20:	f1bb 0b01 	subs.w	fp, fp, #1
20029d24:	d001      	beq.n	20029d2a <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xa2>
20029d26:	2800      	cmp	r0, #0
20029d28:	d0f1      	beq.n	20029d0e <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0x86>
20029d2a:	f5a0 4089 	sub.w	r0, r0, #17536	@ 0x4480
20029d2e:	b003      	add	sp, #12
20029d30:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
20029d34:	2800      	cmp	r0, #0
20029d36:	d1f8      	bne.n	20029d2a <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xa2>
20029d38:	3101      	adds	r1, #1
20029d3a:	e7d1      	b.n	20029ce0 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0x58>
20029d3c:	2001      	movs	r0, #1
20029d3e:	462a      	mov	r2, r5
20029d40:	f04f 0cff 	mov.w	ip, #255	@ 0xff
20029d44:	f802 0f01 	strb.w	r0, [r2, #1]!
20029d48:	1820      	adds	r0, r4, r0
20029d4a:	4428      	add	r0, r5
20029d4c:	4282      	cmp	r2, r0
20029d4e:	d101      	bne.n	20029d54 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xcc>
20029d50:	440c      	add	r4, r1
20029d52:	e7c7      	b.n	20029ce4 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0x5c>
20029d54:	f802 cf01 	strb.w	ip, [r2, #1]!
20029d58:	e7f8      	b.n	20029d4c <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xc4>
20029d5a:	462b      	mov	r3, r5
20029d5c:	464a      	mov	r2, r9
20029d5e:	4639      	mov	r1, r7
20029d60:	4630      	mov	r0, r6
20029d62:	950c      	str	r5, [sp, #48]	@ 0x30
20029d64:	b003      	add	sp, #12
20029d66:	e8bd 4ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20029d6a:	f7ff be03 	b.w	20029974 <mbedtls_rsa_private>
20029d6e:	4801      	ldr	r0, [pc, #4]	@ (20029d74 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xec>)
20029d70:	e7dd      	b.n	20029d2e <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xa6>
20029d72:	bf00      	nop
20029d74:	ffffbf80 	.word	0xffffbf80

20029d78 <mbedtls_rsa_pkcs1_encrypt>:
20029d78:	b410      	push	{r4}
20029d7a:	f8d0 40a4 	ldr.w	r4, [r0, #164]	@ 0xa4
20029d7e:	b91c      	cbnz	r4, 20029d88 <mbedtls_rsa_pkcs1_encrypt+0x10>
20029d80:	f85d 4b04 	ldr.w	r4, [sp], #4
20029d84:	f7ff bf80 	b.w	20029c88 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt>
20029d88:	4801      	ldr	r0, [pc, #4]	@ (20029d90 <mbedtls_rsa_pkcs1_encrypt+0x18>)
20029d8a:	f85d 4b04 	ldr.w	r4, [sp], #4
20029d8e:	4770      	bx	lr
20029d90:	ffffbf00 	.word	0xffffbf00

20029d94 <mbedtls_rsa_rsaes_pkcs1_v15_decrypt>:
20029d94:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
20029d98:	4698      	mov	r8, r3
20029d9a:	f5ad 6d81 	sub.w	sp, sp, #1032	@ 0x408
20029d9e:	f1b8 0f01 	cmp.w	r8, #1
20029da2:	f8dd 3424 	ldr.w	r3, [sp, #1060]	@ 0x424
20029da6:	d103      	bne.n	20029db0 <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0x1c>
20029da8:	f8d0 40a4 	ldr.w	r4, [r0, #164]	@ 0xa4
20029dac:	2c00      	cmp	r4, #0
20029dae:	d17c      	bne.n	20029eaa <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0x116>
20029db0:	6845      	ldr	r5, [r0, #4]
20029db2:	f1a5 0410 	sub.w	r4, r5, #16
20029db6:	f5b4 7f7c 	cmp.w	r4, #1008	@ 0x3f0
20029dba:	d876      	bhi.n	20029eaa <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0x116>
20029dbc:	ae02      	add	r6, sp, #8
20029dbe:	f1b8 0f00 	cmp.w	r8, #0
20029dc2:	d153      	bne.n	20029e6c <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0xd8>
20029dc4:	4632      	mov	r2, r6
20029dc6:	4619      	mov	r1, r3
20029dc8:	f7ff fd9e 	bl	20029908 <mbedtls_rsa_public>
20029dcc:	4604      	mov	r4, r0
20029dce:	2800      	cmp	r0, #0
20029dd0:	d140      	bne.n	20029e54 <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0xc0>
20029dd2:	f1b8 0f01 	cmp.w	r8, #1
20029dd6:	7831      	ldrb	r1, [r6, #0]
20029dd8:	7872      	ldrb	r2, [r6, #1]
20029dda:	f1a5 0703 	sub.w	r7, r5, #3
20029dde:	d149      	bne.n	20029e74 <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0xe0>
20029de0:	f082 0202 	eor.w	r2, r2, #2
20029de4:	ea41 0302 	orr.w	r3, r1, r2
20029de8:	4684      	mov	ip, r0
20029dea:	4686      	mov	lr, r0
20029dec:	4602      	mov	r2, r0
20029dee:	f10d 0109 	add.w	r1, sp, #9
20029df2:	f811 0f01 	ldrb.w	r0, [r1, #1]!
20029df6:	f10e 0e01 	add.w	lr, lr, #1
20029dfa:	f1c0 0800 	rsb	r8, r0, #0
20029dfe:	ea40 0008 	orr.w	r0, r0, r8
20029e02:	f3c0 10c0 	ubfx	r0, r0, #7, #1
20029e06:	f080 0001 	eor.w	r0, r0, #1
20029e0a:	ea4c 0c00 	orr.w	ip, ip, r0
20029e0e:	f1cc 0000 	rsb	r0, ip, #0
20029e12:	ea4c 0000 	orr.w	r0, ip, r0
20029e16:	f3c0 10c0 	ubfx	r0, r0, #7, #1
20029e1a:	f080 0001 	eor.w	r0, r0, #1
20029e1e:	45be      	cmp	lr, r7
20029e20:	4402      	add	r2, r0
20029e22:	d3e6      	bcc.n	20029df2 <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0x5e>
20029e24:	f10d 000a 	add.w	r0, sp, #10
20029e28:	1881      	adds	r1, r0, r2
20029e2a:	5c80      	ldrb	r0, [r0, r2]
20029e2c:	3101      	adds	r1, #1
20029e2e:	4303      	orrs	r3, r0
20029e30:	2a07      	cmp	r2, #7
20029e32:	bf98      	it	ls
20029e34:	f043 0301 	orrls.w	r3, r3, #1
20029e38:	bb9b      	cbnz	r3, 20029ea2 <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0x10e>
20029e3a:	1b8b      	subs	r3, r1, r6
20029e3c:	1aea      	subs	r2, r5, r3
20029e3e:	f8dd 342c 	ldr.w	r3, [sp, #1068]	@ 0x42c
20029e42:	429a      	cmp	r2, r3
20029e44:	d82f      	bhi.n	20029ea6 <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0x112>
20029e46:	f8dd 3420 	ldr.w	r3, [sp, #1056]	@ 0x420
20029e4a:	f8dd 0428 	ldr.w	r0, [sp, #1064]	@ 0x428
20029e4e:	601a      	str	r2, [r3, #0]
20029e50:	f000 fd12 	bl	2002a878 <memcpy>
20029e54:	2300      	movs	r3, #0
20029e56:	461a      	mov	r2, r3
20029e58:	54f2      	strb	r2, [r6, r3]
20029e5a:	3301      	adds	r3, #1
20029e5c:	f5b3 6f80 	cmp.w	r3, #1024	@ 0x400
20029e60:	d1fa      	bne.n	20029e58 <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0xc4>
20029e62:	4620      	mov	r0, r4
20029e64:	f50d 6d81 	add.w	sp, sp, #1032	@ 0x408
20029e68:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
20029e6c:	9600      	str	r6, [sp, #0]
20029e6e:	f7ff fd81 	bl	20029974 <mbedtls_rsa_private>
20029e72:	e7ab      	b.n	20029dcc <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0x38>
20029e74:	f082 0201 	eor.w	r2, r2, #1
20029e78:	ea41 0302 	orr.w	r3, r1, r2
20029e7c:	4684      	mov	ip, r0
20029e7e:	4602      	mov	r2, r0
20029e80:	f10d 0109 	add.w	r1, sp, #9
20029e84:	f811 ef01 	ldrb.w	lr, [r1, #1]!
20029e88:	3001      	adds	r0, #1
20029e8a:	f1be 0fff 	cmp.w	lr, #255	@ 0xff
20029e8e:	bf18      	it	ne
20029e90:	f04c 0c01 	orrne.w	ip, ip, #1
20029e94:	42b8      	cmp	r0, r7
20029e96:	f08c 0e01 	eor.w	lr, ip, #1
20029e9a:	fa52 f28e 	uxtab	r2, r2, lr
20029e9e:	d3f1      	bcc.n	20029e84 <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0xf0>
20029ea0:	e7c0      	b.n	20029e24 <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0x90>
20029ea2:	4c03      	ldr	r4, [pc, #12]	@ (20029eb0 <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0x11c>)
20029ea4:	e7d6      	b.n	20029e54 <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0xc0>
20029ea6:	4c03      	ldr	r4, [pc, #12]	@ (20029eb4 <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0x120>)
20029ea8:	e7d4      	b.n	20029e54 <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0xc0>
20029eaa:	4c03      	ldr	r4, [pc, #12]	@ (20029eb8 <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0x124>)
20029eac:	e7d9      	b.n	20029e62 <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0xce>
20029eae:	bf00      	nop
20029eb0:	ffffbf00 	.word	0xffffbf00
20029eb4:	ffffbc00 	.word	0xffffbc00
20029eb8:	ffffbf80 	.word	0xffffbf80

20029ebc <mbedtls_rsa_pkcs1_decrypt>:
20029ebc:	b410      	push	{r4}
20029ebe:	f8d0 40a4 	ldr.w	r4, [r0, #164]	@ 0xa4
20029ec2:	b91c      	cbnz	r4, 20029ecc <mbedtls_rsa_pkcs1_decrypt+0x10>
20029ec4:	f85d 4b04 	ldr.w	r4, [sp], #4
20029ec8:	f7ff bf64 	b.w	20029d94 <mbedtls_rsa_rsaes_pkcs1_v15_decrypt>
20029ecc:	4801      	ldr	r0, [pc, #4]	@ (20029ed4 <mbedtls_rsa_pkcs1_decrypt+0x18>)
20029ece:	f85d 4b04 	ldr.w	r4, [sp], #4
20029ed2:	4770      	bx	lr
20029ed4:	ffffbf00 	.word	0xffffbf00

20029ed8 <mbedtls_rsa_rsassa_pkcs1_v15_sign>:
20029ed8:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20029edc:	4692      	mov	sl, r2
20029ede:	2200      	movs	r2, #0
20029ee0:	b089      	sub	sp, #36	@ 0x24
20029ee2:	2b01      	cmp	r3, #1
20029ee4:	4604      	mov	r4, r0
20029ee6:	461f      	mov	r7, r3
20029ee8:	e9cd 2206 	strd	r2, r2, [sp, #24]
20029eec:	f89d 8048 	ldrb.w	r8, [sp, #72]	@ 0x48
20029ef0:	f8dd 904c 	ldr.w	r9, [sp, #76]	@ 0x4c
20029ef4:	9e15      	ldr	r6, [sp, #84]	@ 0x54
20029ef6:	9102      	str	r1, [sp, #8]
20029ef8:	d107      	bne.n	20029f0a <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x32>
20029efa:	f8d0 20a4 	ldr.w	r2, [r0, #164]	@ 0xa4
20029efe:	b122      	cbz	r2, 20029f0a <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x32>
20029f00:	4d59      	ldr	r5, [pc, #356]	@ (2002a068 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x190>)
20029f02:	4628      	mov	r0, r5
20029f04:	b009      	add	sp, #36	@ 0x24
20029f06:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
20029f0a:	f8d4 b004 	ldr.w	fp, [r4, #4]
20029f0e:	f1ab 0503 	sub.w	r5, fp, #3
20029f12:	f1b8 0f00 	cmp.w	r8, #0
20029f16:	d014      	beq.n	20029f42 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x6a>
20029f18:	4640      	mov	r0, r8
20029f1a:	f7fb ff77 	bl	20025e0c <mbedtls_md_info_from_type>
20029f1e:	4681      	mov	r9, r0
20029f20:	2800      	cmp	r0, #0
20029f22:	d0ed      	beq.n	20029f00 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x28>
20029f24:	4640      	mov	r0, r8
20029f26:	aa06      	add	r2, sp, #24
20029f28:	a907      	add	r1, sp, #28
20029f2a:	f7ff f9d3 	bl	200292d4 <mbedtls_oid_get_oid_by_md>
20029f2e:	2800      	cmp	r0, #0
20029f30:	d1e6      	bne.n	20029f00 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x28>
20029f32:	9a06      	ldr	r2, [sp, #24]
20029f34:	4648      	mov	r0, r9
20029f36:	1aaa      	subs	r2, r5, r2
20029f38:	f1a2 050a 	sub.w	r5, r2, #10
20029f3c:	f7fb ff72 	bl	20025e24 <mbedtls_md_get_size>
20029f40:	4681      	mov	r9, r0
20029f42:	eba5 0209 	sub.w	r2, r5, r9
20029f46:	2a07      	cmp	r2, #7
20029f48:	d9da      	bls.n	20029f00 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x28>
20029f4a:	4593      	cmp	fp, r2
20029f4c:	d3d8      	bcc.n	20029f00 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x28>
20029f4e:	46b3      	mov	fp, r6
20029f50:	2500      	movs	r5, #0
20029f52:	2101      	movs	r1, #1
20029f54:	f80b 5b02 	strb.w	r5, [fp], #2
20029f58:	4658      	mov	r0, fp
20029f5a:	7071      	strb	r1, [r6, #1]
20029f5c:	21ff      	movs	r1, #255	@ 0xff
20029f5e:	9203      	str	r2, [sp, #12]
20029f60:	f000 fc70 	bl	2002a844 <memset>
20029f64:	9a03      	ldr	r2, [sp, #12]
20029f66:	eb0b 0002 	add.w	r0, fp, r2
20029f6a:	f80b 5002 	strb.w	r5, [fp, r2]
20029f6e:	f1b8 0f00 	cmp.w	r8, #0
20029f72:	d10c      	bne.n	20029f8e <mbedtls_rsa_rsassa_pkcs1_v15_sign+0xb6>
20029f74:	464a      	mov	r2, r9
20029f76:	9914      	ldr	r1, [sp, #80]	@ 0x50
20029f78:	3001      	adds	r0, #1
20029f7a:	f000 fc7d 	bl	2002a878 <memcpy>
20029f7e:	bb8f      	cbnz	r7, 20029fe4 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x10c>
20029f80:	4632      	mov	r2, r6
20029f82:	4631      	mov	r1, r6
20029f84:	4620      	mov	r0, r4
20029f86:	f7ff fcbf 	bl	20029908 <mbedtls_rsa_public>
20029f8a:	4605      	mov	r5, r0
20029f8c:	e7b9      	b.n	20029f02 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x2a>
20029f8e:	2130      	movs	r1, #48	@ 0x30
20029f90:	7041      	strb	r1, [r0, #1]
20029f92:	9a06      	ldr	r2, [sp, #24]
20029f94:	70c1      	strb	r1, [r0, #3]
20029f96:	3208      	adds	r2, #8
20029f98:	fa52 f289 	uxtab	r2, r2, r9
20029f9c:	7082      	strb	r2, [r0, #2]
20029f9e:	9a06      	ldr	r2, [sp, #24]
20029fa0:	f100 0807 	add.w	r8, r0, #7
20029fa4:	b2d1      	uxtb	r1, r2
20029fa6:	f101 0c04 	add.w	ip, r1, #4
20029faa:	f880 c004 	strb.w	ip, [r0, #4]
20029fae:	f04f 0c06 	mov.w	ip, #6
20029fb2:	7181      	strb	r1, [r0, #6]
20029fb4:	f880 c005 	strb.w	ip, [r0, #5]
20029fb8:	9907      	ldr	r1, [sp, #28]
20029fba:	4640      	mov	r0, r8
20029fbc:	9203      	str	r2, [sp, #12]
20029fbe:	f000 fc5b 	bl	2002a878 <memcpy>
20029fc2:	2105      	movs	r1, #5
20029fc4:	9a03      	ldr	r2, [sp, #12]
20029fc6:	fa5f fb89 	uxtb.w	fp, r9
20029fca:	eb08 0002 	add.w	r0, r8, r2
20029fce:	f808 1002 	strb.w	r1, [r8, r2]
20029fd2:	2204      	movs	r2, #4
20029fd4:	7045      	strb	r5, [r0, #1]
20029fd6:	7082      	strb	r2, [r0, #2]
20029fd8:	f880 b003 	strb.w	fp, [r0, #3]
20029fdc:	464a      	mov	r2, r9
20029fde:	9914      	ldr	r1, [sp, #80]	@ 0x50
20029fe0:	3004      	adds	r0, #4
20029fe2:	e7ca      	b.n	20029f7a <mbedtls_rsa_rsassa_pkcs1_v15_sign+0xa2>
20029fe4:	6865      	ldr	r5, [r4, #4]
20029fe6:	2001      	movs	r0, #1
20029fe8:	4629      	mov	r1, r5
20029fea:	f000 fb49 	bl	2002a680 <calloc>
20029fee:	4607      	mov	r7, r0
20029ff0:	b140      	cbz	r0, 2002a004 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x12c>
20029ff2:	4629      	mov	r1, r5
20029ff4:	2001      	movs	r0, #1
20029ff6:	f000 fb43 	bl	2002a680 <calloc>
20029ffa:	4680      	mov	r8, r0
20029ffc:	b928      	cbnz	r0, 2002a00a <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x132>
20029ffe:	4638      	mov	r0, r7
2002a000:	f000 fb5a 	bl	2002a6b8 <free>
2002a004:	f06f 050f 	mvn.w	r5, #15
2002a008:	e77b      	b.n	20029f02 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x2a>
2002a00a:	4633      	mov	r3, r6
2002a00c:	4652      	mov	r2, sl
2002a00e:	4620      	mov	r0, r4
2002a010:	9902      	ldr	r1, [sp, #8]
2002a012:	9700      	str	r7, [sp, #0]
2002a014:	f7ff fcae 	bl	20029974 <mbedtls_rsa_private>
2002a018:	4605      	mov	r5, r0
2002a01a:	b9a0      	cbnz	r0, 2002a046 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x16e>
2002a01c:	4642      	mov	r2, r8
2002a01e:	4639      	mov	r1, r7
2002a020:	4620      	mov	r0, r4
2002a022:	f7ff fc71 	bl	20029908 <mbedtls_rsa_public>
2002a026:	4605      	mov	r5, r0
2002a028:	b968      	cbnz	r0, 2002a046 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x16e>
2002a02a:	4601      	mov	r1, r0
2002a02c:	4603      	mov	r3, r0
2002a02e:	6862      	ldr	r2, [r4, #4]
2002a030:	429a      	cmp	r2, r3
2002a032:	d10f      	bne.n	2002a054 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x17c>
2002a034:	f88d 1017 	strb.w	r1, [sp, #23]
2002a038:	f89d 3017 	ldrb.w	r3, [sp, #23]
2002a03c:	b98b      	cbnz	r3, 2002a062 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x18a>
2002a03e:	4639      	mov	r1, r7
2002a040:	4630      	mov	r0, r6
2002a042:	f000 fc19 	bl	2002a878 <memcpy>
2002a046:	4638      	mov	r0, r7
2002a048:	f000 fb36 	bl	2002a6b8 <free>
2002a04c:	4640      	mov	r0, r8
2002a04e:	f000 fb33 	bl	2002a6b8 <free>
2002a052:	e756      	b.n	20029f02 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x2a>
2002a054:	f818 0003 	ldrb.w	r0, [r8, r3]
2002a058:	5cf4      	ldrb	r4, [r6, r3]
2002a05a:	3301      	adds	r3, #1
2002a05c:	4060      	eors	r0, r4
2002a05e:	4301      	orrs	r1, r0
2002a060:	e7e6      	b.n	2002a030 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x158>
2002a062:	4d02      	ldr	r5, [pc, #8]	@ (2002a06c <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x194>)
2002a064:	e7ef      	b.n	2002a046 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x16e>
2002a066:	bf00      	nop
2002a068:	ffffbf80 	.word	0xffffbf80
2002a06c:	ffffbd00 	.word	0xffffbd00

2002a070 <mbedtls_rsa_pkcs1_sign>:
2002a070:	b430      	push	{r4, r5}
2002a072:	f8d0 50a4 	ldr.w	r5, [r0, #164]	@ 0xa4
2002a076:	f89d 4008 	ldrb.w	r4, [sp, #8]
2002a07a:	b91d      	cbnz	r5, 2002a084 <mbedtls_rsa_pkcs1_sign+0x14>
2002a07c:	9402      	str	r4, [sp, #8]
2002a07e:	bc30      	pop	{r4, r5}
2002a080:	f7ff bf2a 	b.w	20029ed8 <mbedtls_rsa_rsassa_pkcs1_v15_sign>
2002a084:	4801      	ldr	r0, [pc, #4]	@ (2002a08c <mbedtls_rsa_pkcs1_sign+0x1c>)
2002a086:	bc30      	pop	{r4, r5}
2002a088:	4770      	bx	lr
2002a08a:	bf00      	nop
2002a08c:	ffffbf00 	.word	0xffffbf00

2002a090 <mbedtls_rsa_rsassa_pkcs1_v15_verify>:
2002a090:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
2002a094:	461c      	mov	r4, r3
2002a096:	f2ad 4d2c 	subw	sp, sp, #1068	@ 0x42c
2002a09a:	f89d 3450 	ldrb.w	r3, [sp, #1104]	@ 0x450
2002a09e:	2c01      	cmp	r4, #1
2002a0a0:	9303      	str	r3, [sp, #12]
2002a0a2:	f8dd 8454 	ldr.w	r8, [sp, #1108]	@ 0x454
2002a0a6:	f8dd 345c 	ldr.w	r3, [sp, #1116]	@ 0x45c
2002a0aa:	d108      	bne.n	2002a0be <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x2e>
2002a0ac:	f8d0 50a4 	ldr.w	r5, [r0, #164]	@ 0xa4
2002a0b0:	b12d      	cbz	r5, 2002a0be <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x2e>
2002a0b2:	4d60      	ldr	r5, [pc, #384]	@ (2002a234 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x1a4>)
2002a0b4:	4628      	mov	r0, r5
2002a0b6:	f20d 4d2c 	addw	sp, sp, #1068	@ 0x42c
2002a0ba:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
2002a0be:	6846      	ldr	r6, [r0, #4]
2002a0c0:	f1a6 0510 	sub.w	r5, r6, #16
2002a0c4:	f5b5 7f7c 	cmp.w	r5, #1008	@ 0x3f0
2002a0c8:	d8f3      	bhi.n	2002a0b2 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x22>
2002a0ca:	af0a      	add	r7, sp, #40	@ 0x28
2002a0cc:	b954      	cbnz	r4, 2002a0e4 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x54>
2002a0ce:	463a      	mov	r2, r7
2002a0d0:	4619      	mov	r1, r3
2002a0d2:	f7ff fc19 	bl	20029908 <mbedtls_rsa_public>
2002a0d6:	4605      	mov	r5, r0
2002a0d8:	2800      	cmp	r0, #0
2002a0da:	d1eb      	bne.n	2002a0b4 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x24>
2002a0dc:	783b      	ldrb	r3, [r7, #0]
2002a0de:	b12b      	cbz	r3, 2002a0ec <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x5c>
2002a0e0:	4d55      	ldr	r5, [pc, #340]	@ (2002a238 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x1a8>)
2002a0e2:	e7e7      	b.n	2002a0b4 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x24>
2002a0e4:	9700      	str	r7, [sp, #0]
2002a0e6:	f7ff fc45 	bl	20029974 <mbedtls_rsa_private>
2002a0ea:	e7f4      	b.n	2002a0d6 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x46>
2002a0ec:	787b      	ldrb	r3, [r7, #1]
2002a0ee:	ac06      	add	r4, sp, #24
2002a0f0:	f10d 002a 	add.w	r0, sp, #42	@ 0x2a
2002a0f4:	2b01      	cmp	r3, #1
2002a0f6:	6020      	str	r0, [r4, #0]
2002a0f8:	d1f2      	bne.n	2002a0e0 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x50>
2002a0fa:	1e73      	subs	r3, r6, #1
2002a0fc:	443b      	add	r3, r7
2002a0fe:	7802      	ldrb	r2, [r0, #0]
2002a100:	b992      	cbnz	r2, 2002a128 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x98>
2002a102:	3001      	adds	r0, #1
2002a104:	1bc7      	subs	r7, r0, r7
2002a106:	2f0a      	cmp	r7, #10
2002a108:	6020      	str	r0, [r4, #0]
2002a10a:	dde9      	ble.n	2002a0e0 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x50>
2002a10c:	1bf6      	subs	r6, r6, r7
2002a10e:	4546      	cmp	r6, r8
2002a110:	d112      	bne.n	2002a138 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0xa8>
2002a112:	9b03      	ldr	r3, [sp, #12]
2002a114:	b983      	cbnz	r3, 2002a138 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0xa8>
2002a116:	4642      	mov	r2, r8
2002a118:	f8dd 1458 	ldr.w	r1, [sp, #1112]	@ 0x458
2002a11c:	f000 fb82 	bl	2002a824 <memcmp>
2002a120:	2800      	cmp	r0, #0
2002a122:	d0c7      	beq.n	2002a0b4 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x24>
2002a124:	4d45      	ldr	r5, [pc, #276]	@ (2002a23c <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x1ac>)
2002a126:	e7c5      	b.n	2002a0b4 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x24>
2002a128:	4298      	cmp	r0, r3
2002a12a:	d2d9      	bcs.n	2002a0e0 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x50>
2002a12c:	2aff      	cmp	r2, #255	@ 0xff
2002a12e:	f100 0001 	add.w	r0, r0, #1
2002a132:	d1d5      	bne.n	2002a0e0 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x50>
2002a134:	6020      	str	r0, [r4, #0]
2002a136:	e7e2      	b.n	2002a0fe <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x6e>
2002a138:	9803      	ldr	r0, [sp, #12]
2002a13a:	f7fb fe67 	bl	20025e0c <mbedtls_md_info_from_type>
2002a13e:	2800      	cmp	r0, #0
2002a140:	d0b7      	beq.n	2002a0b2 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x22>
2002a142:	f7fb fe6f 	bl	20025e24 <mbedtls_md_get_size>
2002a146:	f8d4 a000 	ldr.w	sl, [r4]
2002a14a:	af05      	add	r7, sp, #20
2002a14c:	eb0a 0806 	add.w	r8, sl, r6
2002a150:	4681      	mov	r9, r0
2002a152:	2330      	movs	r3, #48	@ 0x30
2002a154:	463a      	mov	r2, r7
2002a156:	4641      	mov	r1, r8
2002a158:	4620      	mov	r0, r4
2002a15a:	f7fd fb95 	bl	20027888 <mbedtls_asn1_get_tag>
2002a15e:	2800      	cmp	r0, #0
2002a160:	d1e0      	bne.n	2002a124 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a162:	f8d4 b000 	ldr.w	fp, [r4]
2002a166:	f10a 0a02 	add.w	sl, sl, #2
2002a16a:	45d3      	cmp	fp, sl
2002a16c:	d1da      	bne.n	2002a124 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a16e:	683b      	ldr	r3, [r7, #0]
2002a170:	3302      	adds	r3, #2
2002a172:	42b3      	cmp	r3, r6
2002a174:	d1d6      	bne.n	2002a124 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a176:	2330      	movs	r3, #48	@ 0x30
2002a178:	463a      	mov	r2, r7
2002a17a:	4641      	mov	r1, r8
2002a17c:	4620      	mov	r0, r4
2002a17e:	f7fd fb83 	bl	20027888 <mbedtls_asn1_get_tag>
2002a182:	2800      	cmp	r0, #0
2002a184:	d1ce      	bne.n	2002a124 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a186:	f8d4 a000 	ldr.w	sl, [r4]
2002a18a:	f10b 0b02 	add.w	fp, fp, #2
2002a18e:	45da      	cmp	sl, fp
2002a190:	d1c8      	bne.n	2002a124 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a192:	683b      	ldr	r3, [r7, #0]
2002a194:	3306      	adds	r3, #6
2002a196:	444b      	add	r3, r9
2002a198:	42b3      	cmp	r3, r6
2002a19a:	d1c3      	bne.n	2002a124 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a19c:	2306      	movs	r3, #6
2002a19e:	4641      	mov	r1, r8
2002a1a0:	4620      	mov	r0, r4
2002a1a2:	aa08      	add	r2, sp, #32
2002a1a4:	ae07      	add	r6, sp, #28
2002a1a6:	f7fd fb6f 	bl	20027888 <mbedtls_asn1_get_tag>
2002a1aa:	2800      	cmp	r0, #0
2002a1ac:	d1ba      	bne.n	2002a124 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a1ae:	6823      	ldr	r3, [r4, #0]
2002a1b0:	f10a 0a02 	add.w	sl, sl, #2
2002a1b4:	4553      	cmp	r3, sl
2002a1b6:	d1b5      	bne.n	2002a124 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a1b8:	9a08      	ldr	r2, [sp, #32]
2002a1ba:	f10d 0a13 	add.w	sl, sp, #19
2002a1be:	9309      	str	r3, [sp, #36]	@ 0x24
2002a1c0:	4651      	mov	r1, sl
2002a1c2:	4413      	add	r3, r2
2002a1c4:	4630      	mov	r0, r6
2002a1c6:	6023      	str	r3, [r4, #0]
2002a1c8:	f7ff f86a 	bl	200292a0 <mbedtls_oid_get_md_alg>
2002a1cc:	2800      	cmp	r0, #0
2002a1ce:	d1a9      	bne.n	2002a124 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a1d0:	f89d 3013 	ldrb.w	r3, [sp, #19]
2002a1d4:	9a03      	ldr	r2, [sp, #12]
2002a1d6:	4293      	cmp	r3, r2
2002a1d8:	d1a4      	bne.n	2002a124 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a1da:	2305      	movs	r3, #5
2002a1dc:	463a      	mov	r2, r7
2002a1de:	4641      	mov	r1, r8
2002a1e0:	4620      	mov	r0, r4
2002a1e2:	f8d4 a000 	ldr.w	sl, [r4]
2002a1e6:	f7fd fb4f 	bl	20027888 <mbedtls_asn1_get_tag>
2002a1ea:	2800      	cmp	r0, #0
2002a1ec:	d19a      	bne.n	2002a124 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a1ee:	6826      	ldr	r6, [r4, #0]
2002a1f0:	f10a 0a02 	add.w	sl, sl, #2
2002a1f4:	4556      	cmp	r6, sl
2002a1f6:	d195      	bne.n	2002a124 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a1f8:	2304      	movs	r3, #4
2002a1fa:	463a      	mov	r2, r7
2002a1fc:	4641      	mov	r1, r8
2002a1fe:	4620      	mov	r0, r4
2002a200:	f7fd fb42 	bl	20027888 <mbedtls_asn1_get_tag>
2002a204:	2800      	cmp	r0, #0
2002a206:	d18d      	bne.n	2002a124 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a208:	6824      	ldr	r4, [r4, #0]
2002a20a:	3602      	adds	r6, #2
2002a20c:	42b4      	cmp	r4, r6
2002a20e:	d189      	bne.n	2002a124 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a210:	683b      	ldr	r3, [r7, #0]
2002a212:	454b      	cmp	r3, r9
2002a214:	d186      	bne.n	2002a124 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a216:	464a      	mov	r2, r9
2002a218:	4620      	mov	r0, r4
2002a21a:	f8dd 1458 	ldr.w	r1, [sp, #1112]	@ 0x458
2002a21e:	f000 fb01 	bl	2002a824 <memcmp>
2002a222:	2800      	cmp	r0, #0
2002a224:	f47f af7e 	bne.w	2002a124 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a228:	444c      	add	r4, r9
2002a22a:	45a0      	cmp	r8, r4
2002a22c:	f43f af42 	beq.w	2002a0b4 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x24>
2002a230:	e778      	b.n	2002a124 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a232:	bf00      	nop
2002a234:	ffffbf80 	.word	0xffffbf80
2002a238:	ffffbf00 	.word	0xffffbf00
2002a23c:	ffffbc80 	.word	0xffffbc80

2002a240 <mbedtls_rsa_pkcs1_verify>:
2002a240:	b430      	push	{r4, r5}
2002a242:	f8d0 50a4 	ldr.w	r5, [r0, #164]	@ 0xa4
2002a246:	f89d 4008 	ldrb.w	r4, [sp, #8]
2002a24a:	b91d      	cbnz	r5, 2002a254 <mbedtls_rsa_pkcs1_verify+0x14>
2002a24c:	9402      	str	r4, [sp, #8]
2002a24e:	bc30      	pop	{r4, r5}
2002a250:	f7ff bf1e 	b.w	2002a090 <mbedtls_rsa_rsassa_pkcs1_v15_verify>
2002a254:	4801      	ldr	r0, [pc, #4]	@ (2002a25c <mbedtls_rsa_pkcs1_verify+0x1c>)
2002a256:	bc30      	pop	{r4, r5}
2002a258:	4770      	bx	lr
2002a25a:	bf00      	nop
2002a25c:	ffffbf00 	.word	0xffffbf00

2002a260 <mbedtls_rsa_free>:
2002a260:	b510      	push	{r4, lr}
2002a262:	4604      	mov	r4, r0
2002a264:	308c      	adds	r0, #140	@ 0x8c
2002a266:	f7fd fd44 	bl	20027cf2 <mbedtls_mpi_free>
2002a26a:	f104 0098 	add.w	r0, r4, #152	@ 0x98
2002a26e:	f7fd fd40 	bl	20027cf2 <mbedtls_mpi_free>
2002a272:	f104 0080 	add.w	r0, r4, #128	@ 0x80
2002a276:	f7fd fd3c 	bl	20027cf2 <mbedtls_mpi_free>
2002a27a:	f104 0074 	add.w	r0, r4, #116	@ 0x74
2002a27e:	f7fd fd38 	bl	20027cf2 <mbedtls_mpi_free>
2002a282:	f104 0068 	add.w	r0, r4, #104	@ 0x68
2002a286:	f7fd fd34 	bl	20027cf2 <mbedtls_mpi_free>
2002a28a:	f104 005c 	add.w	r0, r4, #92	@ 0x5c
2002a28e:	f7fd fd30 	bl	20027cf2 <mbedtls_mpi_free>
2002a292:	f104 0050 	add.w	r0, r4, #80	@ 0x50
2002a296:	f7fd fd2c 	bl	20027cf2 <mbedtls_mpi_free>
2002a29a:	f104 0044 	add.w	r0, r4, #68	@ 0x44
2002a29e:	f7fd fd28 	bl	20027cf2 <mbedtls_mpi_free>
2002a2a2:	f104 0038 	add.w	r0, r4, #56	@ 0x38
2002a2a6:	f7fd fd24 	bl	20027cf2 <mbedtls_mpi_free>
2002a2aa:	f104 002c 	add.w	r0, r4, #44	@ 0x2c
2002a2ae:	f7fd fd20 	bl	20027cf2 <mbedtls_mpi_free>
2002a2b2:	f104 0020 	add.w	r0, r4, #32
2002a2b6:	f7fd fd1c 	bl	20027cf2 <mbedtls_mpi_free>
2002a2ba:	f104 0014 	add.w	r0, r4, #20
2002a2be:	f7fd fd18 	bl	20027cf2 <mbedtls_mpi_free>
2002a2c2:	f104 0008 	add.w	r0, r4, #8
2002a2c6:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
2002a2ca:	f7fd bd12 	b.w	20027cf2 <mbedtls_mpi_free>
	...

2002a2d0 <BSP_GetFlash1DIV>:
2002a2d0:	4b01      	ldr	r3, [pc, #4]	@ (2002a2d8 <BSP_GetFlash1DIV+0x8>)
2002a2d2:	8818      	ldrh	r0, [r3, #0]
2002a2d4:	4770      	bx	lr
2002a2d6:	bf00      	nop
2002a2d8:	2004495a 	.word	0x2004495a

2002a2dc <BSP_GetFlash2DIV>:
2002a2dc:	4b01      	ldr	r3, [pc, #4]	@ (2002a2e4 <BSP_GetFlash2DIV+0x8>)
2002a2de:	8818      	ldrh	r0, [r3, #0]
2002a2e0:	4770      	bx	lr
2002a2e2:	bf00      	nop
2002a2e4:	20044958 	.word	0x20044958

2002a2e8 <BSP_SetFlash1DIV>:
2002a2e8:	4b01      	ldr	r3, [pc, #4]	@ (2002a2f0 <BSP_SetFlash1DIV+0x8>)
2002a2ea:	8018      	strh	r0, [r3, #0]
2002a2ec:	4770      	bx	lr
2002a2ee:	bf00      	nop
2002a2f0:	2004495a 	.word	0x2004495a

2002a2f4 <BSP_SetFlash2DIV>:
2002a2f4:	4b01      	ldr	r3, [pc, #4]	@ (2002a2fc <BSP_SetFlash2DIV+0x8>)
2002a2f6:	8018      	strh	r0, [r3, #0]
2002a2f8:	4770      	bx	lr
2002a2fa:	bf00      	nop
2002a2fc:	20044958 	.word	0x20044958

2002a300 <__aeabi_uldivmod>:
2002a300:	b953      	cbnz	r3, 2002a318 <__aeabi_uldivmod+0x18>
2002a302:	b94a      	cbnz	r2, 2002a318 <__aeabi_uldivmod+0x18>
2002a304:	2900      	cmp	r1, #0
2002a306:	bf08      	it	eq
2002a308:	2800      	cmpeq	r0, #0
2002a30a:	bf1c      	itt	ne
2002a30c:	f04f 31ff 	movne.w	r1, #4294967295	@ 0xffffffff
2002a310:	f04f 30ff 	movne.w	r0, #4294967295	@ 0xffffffff
2002a314:	f000 b9b2 	b.w	2002a67c <__aeabi_idiv0>
2002a318:	f1ad 0c08 	sub.w	ip, sp, #8
2002a31c:	e96d ce04 	strd	ip, lr, [sp, #-16]!
2002a320:	f000 f806 	bl	2002a330 <__udivmoddi4>
2002a324:	f8dd e004 	ldr.w	lr, [sp, #4]
2002a328:	e9dd 2302 	ldrd	r2, r3, [sp, #8]
2002a32c:	b004      	add	sp, #16
2002a32e:	4770      	bx	lr

2002a330 <__udivmoddi4>:
2002a330:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
2002a334:	468c      	mov	ip, r1
2002a336:	9e09      	ldr	r6, [sp, #36]	@ 0x24
2002a338:	4604      	mov	r4, r0
2002a33a:	460f      	mov	r7, r1
2002a33c:	2b00      	cmp	r3, #0
2002a33e:	d148      	bne.n	2002a3d2 <__udivmoddi4+0xa2>
2002a340:	428a      	cmp	r2, r1
2002a342:	4615      	mov	r5, r2
2002a344:	d95e      	bls.n	2002a404 <__udivmoddi4+0xd4>
2002a346:	fab2 f382 	clz	r3, r2
2002a34a:	b13b      	cbz	r3, 2002a35c <__udivmoddi4+0x2c>
2002a34c:	f1c3 0220 	rsb	r2, r3, #32
2002a350:	409f      	lsls	r7, r3
2002a352:	409d      	lsls	r5, r3
2002a354:	409c      	lsls	r4, r3
2002a356:	fa20 f202 	lsr.w	r2, r0, r2
2002a35a:	4317      	orrs	r7, r2
2002a35c:	ea4f 4e15 	mov.w	lr, r5, lsr #16
2002a360:	fa1f fc85 	uxth.w	ip, r5
2002a364:	0c22      	lsrs	r2, r4, #16
2002a366:	fbb7 f1fe 	udiv	r1, r7, lr
2002a36a:	fb0e 7711 	mls	r7, lr, r1, r7
2002a36e:	fb01 f00c 	mul.w	r0, r1, ip
2002a372:	ea42 4207 	orr.w	r2, r2, r7, lsl #16
2002a376:	4290      	cmp	r0, r2
2002a378:	d907      	bls.n	2002a38a <__udivmoddi4+0x5a>
2002a37a:	18aa      	adds	r2, r5, r2
2002a37c:	f101 37ff 	add.w	r7, r1, #4294967295	@ 0xffffffff
2002a380:	d202      	bcs.n	2002a388 <__udivmoddi4+0x58>
2002a382:	4290      	cmp	r0, r2
2002a384:	f200 8158 	bhi.w	2002a638 <__udivmoddi4+0x308>
2002a388:	4639      	mov	r1, r7
2002a38a:	1a12      	subs	r2, r2, r0
2002a38c:	b2a4      	uxth	r4, r4
2002a38e:	fbb2 f0fe 	udiv	r0, r2, lr
2002a392:	fb0e 2210 	mls	r2, lr, r0, r2
2002a396:	fb00 fc0c 	mul.w	ip, r0, ip
2002a39a:	ea44 4402 	orr.w	r4, r4, r2, lsl #16
2002a39e:	45a4      	cmp	ip, r4
2002a3a0:	d90b      	bls.n	2002a3ba <__udivmoddi4+0x8a>
2002a3a2:	192c      	adds	r4, r5, r4
2002a3a4:	f100 32ff 	add.w	r2, r0, #4294967295	@ 0xffffffff
2002a3a8:	bf2c      	ite	cs
2002a3aa:	2701      	movcs	r7, #1
2002a3ac:	2700      	movcc	r7, #0
2002a3ae:	45a4      	cmp	ip, r4
2002a3b0:	d902      	bls.n	2002a3b8 <__udivmoddi4+0x88>
2002a3b2:	2f00      	cmp	r7, #0
2002a3b4:	f000 8143 	beq.w	2002a63e <__udivmoddi4+0x30e>
2002a3b8:	4610      	mov	r0, r2
2002a3ba:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
2002a3be:	eba4 040c 	sub.w	r4, r4, ip
2002a3c2:	2100      	movs	r1, #0
2002a3c4:	b11e      	cbz	r6, 2002a3ce <__udivmoddi4+0x9e>
2002a3c6:	40dc      	lsrs	r4, r3
2002a3c8:	2300      	movs	r3, #0
2002a3ca:	e9c6 4300 	strd	r4, r3, [r6]
2002a3ce:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
2002a3d2:	428b      	cmp	r3, r1
2002a3d4:	d906      	bls.n	2002a3e4 <__udivmoddi4+0xb4>
2002a3d6:	b10e      	cbz	r6, 2002a3dc <__udivmoddi4+0xac>
2002a3d8:	e9c6 0100 	strd	r0, r1, [r6]
2002a3dc:	2100      	movs	r1, #0
2002a3de:	4608      	mov	r0, r1
2002a3e0:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
2002a3e4:	fab3 f183 	clz	r1, r3
2002a3e8:	2900      	cmp	r1, #0
2002a3ea:	d151      	bne.n	2002a490 <__udivmoddi4+0x160>
2002a3ec:	4563      	cmp	r3, ip
2002a3ee:	f0c0 8116 	bcc.w	2002a61e <__udivmoddi4+0x2ee>
2002a3f2:	4282      	cmp	r2, r0
2002a3f4:	f240 8113 	bls.w	2002a61e <__udivmoddi4+0x2ee>
2002a3f8:	4608      	mov	r0, r1
2002a3fa:	2e00      	cmp	r6, #0
2002a3fc:	d0e7      	beq.n	2002a3ce <__udivmoddi4+0x9e>
2002a3fe:	e9c6 4700 	strd	r4, r7, [r6]
2002a402:	e7e4      	b.n	2002a3ce <__udivmoddi4+0x9e>
2002a404:	2a00      	cmp	r2, #0
2002a406:	f000 80af 	beq.w	2002a568 <__udivmoddi4+0x238>
2002a40a:	fab2 f382 	clz	r3, r2
2002a40e:	2b00      	cmp	r3, #0
2002a410:	f040 80c2 	bne.w	2002a598 <__udivmoddi4+0x268>
2002a414:	1a8a      	subs	r2, r1, r2
2002a416:	ea4f 4e15 	mov.w	lr, r5, lsr #16
2002a41a:	b2af      	uxth	r7, r5
2002a41c:	2101      	movs	r1, #1
2002a41e:	0c20      	lsrs	r0, r4, #16
2002a420:	fbb2 fcfe 	udiv	ip, r2, lr
2002a424:	fb0e 221c 	mls	r2, lr, ip, r2
2002a428:	ea40 4202 	orr.w	r2, r0, r2, lsl #16
2002a42c:	fb07 f00c 	mul.w	r0, r7, ip
2002a430:	4290      	cmp	r0, r2
2002a432:	d90e      	bls.n	2002a452 <__udivmoddi4+0x122>
2002a434:	18aa      	adds	r2, r5, r2
2002a436:	f10c 38ff 	add.w	r8, ip, #4294967295	@ 0xffffffff
2002a43a:	bf2c      	ite	cs
2002a43c:	f04f 0901 	movcs.w	r9, #1
2002a440:	f04f 0900 	movcc.w	r9, #0
2002a444:	4290      	cmp	r0, r2
2002a446:	d903      	bls.n	2002a450 <__udivmoddi4+0x120>
2002a448:	f1b9 0f00 	cmp.w	r9, #0
2002a44c:	f000 80f0 	beq.w	2002a630 <__udivmoddi4+0x300>
2002a450:	46c4      	mov	ip, r8
2002a452:	1a12      	subs	r2, r2, r0
2002a454:	b2a4      	uxth	r4, r4
2002a456:	fbb2 f0fe 	udiv	r0, r2, lr
2002a45a:	fb0e 2210 	mls	r2, lr, r0, r2
2002a45e:	fb00 f707 	mul.w	r7, r0, r7
2002a462:	ea44 4402 	orr.w	r4, r4, r2, lsl #16
2002a466:	42a7      	cmp	r7, r4
2002a468:	d90e      	bls.n	2002a488 <__udivmoddi4+0x158>
2002a46a:	192c      	adds	r4, r5, r4
2002a46c:	f100 32ff 	add.w	r2, r0, #4294967295	@ 0xffffffff
2002a470:	bf2c      	ite	cs
2002a472:	f04f 0e01 	movcs.w	lr, #1
2002a476:	f04f 0e00 	movcc.w	lr, #0
2002a47a:	42a7      	cmp	r7, r4
2002a47c:	d903      	bls.n	2002a486 <__udivmoddi4+0x156>
2002a47e:	f1be 0f00 	cmp.w	lr, #0
2002a482:	f000 80d2 	beq.w	2002a62a <__udivmoddi4+0x2fa>
2002a486:	4610      	mov	r0, r2
2002a488:	1be4      	subs	r4, r4, r7
2002a48a:	ea40 400c 	orr.w	r0, r0, ip, lsl #16
2002a48e:	e799      	b.n	2002a3c4 <__udivmoddi4+0x94>
2002a490:	f1c1 0520 	rsb	r5, r1, #32
2002a494:	408b      	lsls	r3, r1
2002a496:	fa0c f401 	lsl.w	r4, ip, r1
2002a49a:	fa00 f901 	lsl.w	r9, r0, r1
2002a49e:	fa22 f705 	lsr.w	r7, r2, r5
2002a4a2:	fa2c fc05 	lsr.w	ip, ip, r5
2002a4a6:	408a      	lsls	r2, r1
2002a4a8:	431f      	orrs	r7, r3
2002a4aa:	fa20 f305 	lsr.w	r3, r0, r5
2002a4ae:	0c38      	lsrs	r0, r7, #16
2002a4b0:	4323      	orrs	r3, r4
2002a4b2:	fa1f fe87 	uxth.w	lr, r7
2002a4b6:	0c1c      	lsrs	r4, r3, #16
2002a4b8:	fbbc f8f0 	udiv	r8, ip, r0
2002a4bc:	fb00 cc18 	mls	ip, r0, r8, ip
2002a4c0:	ea44 440c 	orr.w	r4, r4, ip, lsl #16
2002a4c4:	fb08 fc0e 	mul.w	ip, r8, lr
2002a4c8:	45a4      	cmp	ip, r4
2002a4ca:	d90e      	bls.n	2002a4ea <__udivmoddi4+0x1ba>
2002a4cc:	193c      	adds	r4, r7, r4
2002a4ce:	f108 3aff 	add.w	sl, r8, #4294967295	@ 0xffffffff
2002a4d2:	bf2c      	ite	cs
2002a4d4:	f04f 0b01 	movcs.w	fp, #1
2002a4d8:	f04f 0b00 	movcc.w	fp, #0
2002a4dc:	45a4      	cmp	ip, r4
2002a4de:	d903      	bls.n	2002a4e8 <__udivmoddi4+0x1b8>
2002a4e0:	f1bb 0f00 	cmp.w	fp, #0
2002a4e4:	f000 80b8 	beq.w	2002a658 <__udivmoddi4+0x328>
2002a4e8:	46d0      	mov	r8, sl
2002a4ea:	eba4 040c 	sub.w	r4, r4, ip
2002a4ee:	fa1f fc83 	uxth.w	ip, r3
2002a4f2:	fbb4 f3f0 	udiv	r3, r4, r0
2002a4f6:	fb00 4413 	mls	r4, r0, r3, r4
2002a4fa:	fb03 fe0e 	mul.w	lr, r3, lr
2002a4fe:	ea4c 4404 	orr.w	r4, ip, r4, lsl #16
2002a502:	45a6      	cmp	lr, r4
2002a504:	d90e      	bls.n	2002a524 <__udivmoddi4+0x1f4>
2002a506:	193c      	adds	r4, r7, r4
2002a508:	f103 30ff 	add.w	r0, r3, #4294967295	@ 0xffffffff
2002a50c:	bf2c      	ite	cs
2002a50e:	f04f 0c01 	movcs.w	ip, #1
2002a512:	f04f 0c00 	movcc.w	ip, #0
2002a516:	45a6      	cmp	lr, r4
2002a518:	d903      	bls.n	2002a522 <__udivmoddi4+0x1f2>
2002a51a:	f1bc 0f00 	cmp.w	ip, #0
2002a51e:	f000 809f 	beq.w	2002a660 <__udivmoddi4+0x330>
2002a522:	4603      	mov	r3, r0
2002a524:	ea43 4008 	orr.w	r0, r3, r8, lsl #16
2002a528:	eba4 040e 	sub.w	r4, r4, lr
2002a52c:	fba0 ec02 	umull	lr, ip, r0, r2
2002a530:	4564      	cmp	r4, ip
2002a532:	4673      	mov	r3, lr
2002a534:	46e0      	mov	r8, ip
2002a536:	d302      	bcc.n	2002a53e <__udivmoddi4+0x20e>
2002a538:	d107      	bne.n	2002a54a <__udivmoddi4+0x21a>
2002a53a:	45f1      	cmp	r9, lr
2002a53c:	d205      	bcs.n	2002a54a <__udivmoddi4+0x21a>
2002a53e:	ebbe 0302 	subs.w	r3, lr, r2
2002a542:	eb6c 0c07 	sbc.w	ip, ip, r7
2002a546:	3801      	subs	r0, #1
2002a548:	46e0      	mov	r8, ip
2002a54a:	b15e      	cbz	r6, 2002a564 <__udivmoddi4+0x234>
2002a54c:	ebb9 0203 	subs.w	r2, r9, r3
2002a550:	eb64 0408 	sbc.w	r4, r4, r8
2002a554:	fa04 f505 	lsl.w	r5, r4, r5
2002a558:	fa22 f301 	lsr.w	r3, r2, r1
2002a55c:	40cc      	lsrs	r4, r1
2002a55e:	431d      	orrs	r5, r3
2002a560:	e9c6 5400 	strd	r5, r4, [r6]
2002a564:	2100      	movs	r1, #0
2002a566:	e732      	b.n	2002a3ce <__udivmoddi4+0x9e>
2002a568:	0842      	lsrs	r2, r0, #1
2002a56a:	462f      	mov	r7, r5
2002a56c:	084b      	lsrs	r3, r1, #1
2002a56e:	46ac      	mov	ip, r5
2002a570:	ea42 72c1 	orr.w	r2, r2, r1, lsl #31
2002a574:	46ae      	mov	lr, r5
2002a576:	07c4      	lsls	r4, r0, #31
2002a578:	0c11      	lsrs	r1, r2, #16
2002a57a:	b292      	uxth	r2, r2
2002a57c:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
2002a580:	ea42 4201 	orr.w	r2, r2, r1, lsl #16
2002a584:	fbb1 f1f5 	udiv	r1, r1, r5
2002a588:	fbb3 f0f5 	udiv	r0, r3, r5
2002a58c:	231f      	movs	r3, #31
2002a58e:	eba2 020c 	sub.w	r2, r2, ip
2002a592:	ea41 4100 	orr.w	r1, r1, r0, lsl #16
2002a596:	e742      	b.n	2002a41e <__udivmoddi4+0xee>
2002a598:	409d      	lsls	r5, r3
2002a59a:	f1c3 0220 	rsb	r2, r3, #32
2002a59e:	4099      	lsls	r1, r3
2002a5a0:	409c      	lsls	r4, r3
2002a5a2:	fa2c fc02 	lsr.w	ip, ip, r2
2002a5a6:	ea4f 4e15 	mov.w	lr, r5, lsr #16
2002a5aa:	fa20 f202 	lsr.w	r2, r0, r2
2002a5ae:	b2af      	uxth	r7, r5
2002a5b0:	fbbc f8fe 	udiv	r8, ip, lr
2002a5b4:	430a      	orrs	r2, r1
2002a5b6:	fb0e cc18 	mls	ip, lr, r8, ip
2002a5ba:	0c11      	lsrs	r1, r2, #16
2002a5bc:	ea41 410c 	orr.w	r1, r1, ip, lsl #16
2002a5c0:	fb08 fc07 	mul.w	ip, r8, r7
2002a5c4:	458c      	cmp	ip, r1
2002a5c6:	d950      	bls.n	2002a66a <__udivmoddi4+0x33a>
2002a5c8:	1869      	adds	r1, r5, r1
2002a5ca:	f108 30ff 	add.w	r0, r8, #4294967295	@ 0xffffffff
2002a5ce:	bf2c      	ite	cs
2002a5d0:	f04f 0901 	movcs.w	r9, #1
2002a5d4:	f04f 0900 	movcc.w	r9, #0
2002a5d8:	458c      	cmp	ip, r1
2002a5da:	d902      	bls.n	2002a5e2 <__udivmoddi4+0x2b2>
2002a5dc:	f1b9 0f00 	cmp.w	r9, #0
2002a5e0:	d030      	beq.n	2002a644 <__udivmoddi4+0x314>
2002a5e2:	eba1 010c 	sub.w	r1, r1, ip
2002a5e6:	fbb1 f8fe 	udiv	r8, r1, lr
2002a5ea:	fb08 fc07 	mul.w	ip, r8, r7
2002a5ee:	fb0e 1118 	mls	r1, lr, r8, r1
2002a5f2:	b292      	uxth	r2, r2
2002a5f4:	ea42 4201 	orr.w	r2, r2, r1, lsl #16
2002a5f8:	4562      	cmp	r2, ip
2002a5fa:	d234      	bcs.n	2002a666 <__udivmoddi4+0x336>
2002a5fc:	18aa      	adds	r2, r5, r2
2002a5fe:	f108 31ff 	add.w	r1, r8, #4294967295	@ 0xffffffff
2002a602:	bf2c      	ite	cs
2002a604:	f04f 0901 	movcs.w	r9, #1
2002a608:	f04f 0900 	movcc.w	r9, #0
2002a60c:	4562      	cmp	r2, ip
2002a60e:	d2be      	bcs.n	2002a58e <__udivmoddi4+0x25e>
2002a610:	f1b9 0f00 	cmp.w	r9, #0
2002a614:	d1bb      	bne.n	2002a58e <__udivmoddi4+0x25e>
2002a616:	f1a8 0102 	sub.w	r1, r8, #2
2002a61a:	442a      	add	r2, r5
2002a61c:	e7b7      	b.n	2002a58e <__udivmoddi4+0x25e>
2002a61e:	1a84      	subs	r4, r0, r2
2002a620:	eb6c 0203 	sbc.w	r2, ip, r3
2002a624:	2001      	movs	r0, #1
2002a626:	4617      	mov	r7, r2
2002a628:	e6e7      	b.n	2002a3fa <__udivmoddi4+0xca>
2002a62a:	442c      	add	r4, r5
2002a62c:	3802      	subs	r0, #2
2002a62e:	e72b      	b.n	2002a488 <__udivmoddi4+0x158>
2002a630:	f1ac 0c02 	sub.w	ip, ip, #2
2002a634:	442a      	add	r2, r5
2002a636:	e70c      	b.n	2002a452 <__udivmoddi4+0x122>
2002a638:	3902      	subs	r1, #2
2002a63a:	442a      	add	r2, r5
2002a63c:	e6a5      	b.n	2002a38a <__udivmoddi4+0x5a>
2002a63e:	442c      	add	r4, r5
2002a640:	3802      	subs	r0, #2
2002a642:	e6ba      	b.n	2002a3ba <__udivmoddi4+0x8a>
2002a644:	eba5 0c0c 	sub.w	ip, r5, ip
2002a648:	f1a8 0002 	sub.w	r0, r8, #2
2002a64c:	4461      	add	r1, ip
2002a64e:	fbb1 f8fe 	udiv	r8, r1, lr
2002a652:	fb08 fc07 	mul.w	ip, r8, r7
2002a656:	e7ca      	b.n	2002a5ee <__udivmoddi4+0x2be>
2002a658:	f1a8 0802 	sub.w	r8, r8, #2
2002a65c:	443c      	add	r4, r7
2002a65e:	e744      	b.n	2002a4ea <__udivmoddi4+0x1ba>
2002a660:	3b02      	subs	r3, #2
2002a662:	443c      	add	r4, r7
2002a664:	e75e      	b.n	2002a524 <__udivmoddi4+0x1f4>
2002a666:	4641      	mov	r1, r8
2002a668:	e791      	b.n	2002a58e <__udivmoddi4+0x25e>
2002a66a:	eba1 010c 	sub.w	r1, r1, ip
2002a66e:	4640      	mov	r0, r8
2002a670:	fbb1 f8fe 	udiv	r8, r1, lr
2002a674:	fb08 fc07 	mul.w	ip, r8, r7
2002a678:	e7b9      	b.n	2002a5ee <__udivmoddi4+0x2be>
2002a67a:	bf00      	nop

2002a67c <__aeabi_idiv0>:
2002a67c:	4770      	bx	lr
2002a67e:	bf00      	nop

2002a680 <calloc>:
2002a680:	4b02      	ldr	r3, [pc, #8]	@ (2002a68c <calloc+0xc>)
2002a682:	460a      	mov	r2, r1
2002a684:	4601      	mov	r1, r0
2002a686:	6818      	ldr	r0, [r3, #0]
2002a688:	f000 b802 	b.w	2002a690 <_calloc_r>
2002a68c:	2004495c 	.word	0x2004495c

2002a690 <_calloc_r>:
2002a690:	b570      	push	{r4, r5, r6, lr}
2002a692:	fba1 5402 	umull	r5, r4, r1, r2
2002a696:	b934      	cbnz	r4, 2002a6a6 <_calloc_r+0x16>
2002a698:	4629      	mov	r1, r5
2002a69a:	f000 f837 	bl	2002a70c <_malloc_r>
2002a69e:	4606      	mov	r6, r0
2002a6a0:	b928      	cbnz	r0, 2002a6ae <_calloc_r+0x1e>
2002a6a2:	4630      	mov	r0, r6
2002a6a4:	bd70      	pop	{r4, r5, r6, pc}
2002a6a6:	220c      	movs	r2, #12
2002a6a8:	2600      	movs	r6, #0
2002a6aa:	6002      	str	r2, [r0, #0]
2002a6ac:	e7f9      	b.n	2002a6a2 <_calloc_r+0x12>
2002a6ae:	462a      	mov	r2, r5
2002a6b0:	4621      	mov	r1, r4
2002a6b2:	f000 f8c7 	bl	2002a844 <memset>
2002a6b6:	e7f4      	b.n	2002a6a2 <_calloc_r+0x12>

2002a6b8 <free>:
2002a6b8:	4b02      	ldr	r3, [pc, #8]	@ (2002a6c4 <free+0xc>)
2002a6ba:	4601      	mov	r1, r0
2002a6bc:	6818      	ldr	r0, [r3, #0]
2002a6be:	f000 b8e9 	b.w	2002a894 <_free_r>
2002a6c2:	bf00      	nop
2002a6c4:	2004495c 	.word	0x2004495c

2002a6c8 <sbrk_aligned>:
2002a6c8:	b570      	push	{r4, r5, r6, lr}
2002a6ca:	4e0f      	ldr	r6, [pc, #60]	@ (2002a708 <sbrk_aligned+0x40>)
2002a6cc:	460c      	mov	r4, r1
2002a6ce:	4605      	mov	r5, r0
2002a6d0:	6831      	ldr	r1, [r6, #0]
2002a6d2:	b911      	cbnz	r1, 2002a6da <sbrk_aligned+0x12>
2002a6d4:	f000 f8be 	bl	2002a854 <_sbrk_r>
2002a6d8:	6030      	str	r0, [r6, #0]
2002a6da:	4621      	mov	r1, r4
2002a6dc:	4628      	mov	r0, r5
2002a6de:	f000 f8b9 	bl	2002a854 <_sbrk_r>
2002a6e2:	1c43      	adds	r3, r0, #1
2002a6e4:	d103      	bne.n	2002a6ee <sbrk_aligned+0x26>
2002a6e6:	f04f 34ff 	mov.w	r4, #4294967295	@ 0xffffffff
2002a6ea:	4620      	mov	r0, r4
2002a6ec:	bd70      	pop	{r4, r5, r6, pc}
2002a6ee:	1cc4      	adds	r4, r0, #3
2002a6f0:	f024 0403 	bic.w	r4, r4, #3
2002a6f4:	42a0      	cmp	r0, r4
2002a6f6:	d0f8      	beq.n	2002a6ea <sbrk_aligned+0x22>
2002a6f8:	1a21      	subs	r1, r4, r0
2002a6fa:	4628      	mov	r0, r5
2002a6fc:	f000 f8aa 	bl	2002a854 <_sbrk_r>
2002a700:	3001      	adds	r0, #1
2002a702:	d1f2      	bne.n	2002a6ea <sbrk_aligned+0x22>
2002a704:	e7ef      	b.n	2002a6e6 <sbrk_aligned+0x1e>
2002a706:	bf00      	nop
2002a708:	2004d01c 	.word	0x2004d01c

2002a70c <_malloc_r>:
2002a70c:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
2002a710:	1ccd      	adds	r5, r1, #3
2002a712:	4606      	mov	r6, r0
2002a714:	f025 0503 	bic.w	r5, r5, #3
2002a718:	3508      	adds	r5, #8
2002a71a:	2d0c      	cmp	r5, #12
2002a71c:	bf38      	it	cc
2002a71e:	250c      	movcc	r5, #12
2002a720:	2d00      	cmp	r5, #0
2002a722:	db01      	blt.n	2002a728 <_malloc_r+0x1c>
2002a724:	42a9      	cmp	r1, r5
2002a726:	d904      	bls.n	2002a732 <_malloc_r+0x26>
2002a728:	230c      	movs	r3, #12
2002a72a:	6033      	str	r3, [r6, #0]
2002a72c:	2000      	movs	r0, #0
2002a72e:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
2002a732:	f8df 80d4 	ldr.w	r8, [pc, #212]	@ 2002a808 <_malloc_r+0xfc>
2002a736:	f000 f869 	bl	2002a80c <__malloc_lock>
2002a73a:	f8d8 3000 	ldr.w	r3, [r8]
2002a73e:	461c      	mov	r4, r3
2002a740:	bb44      	cbnz	r4, 2002a794 <_malloc_r+0x88>
2002a742:	4629      	mov	r1, r5
2002a744:	4630      	mov	r0, r6
2002a746:	f7ff ffbf 	bl	2002a6c8 <sbrk_aligned>
2002a74a:	1c43      	adds	r3, r0, #1
2002a74c:	4604      	mov	r4, r0
2002a74e:	d158      	bne.n	2002a802 <_malloc_r+0xf6>
2002a750:	f8d8 4000 	ldr.w	r4, [r8]
2002a754:	4627      	mov	r7, r4
2002a756:	2f00      	cmp	r7, #0
2002a758:	d143      	bne.n	2002a7e2 <_malloc_r+0xd6>
2002a75a:	2c00      	cmp	r4, #0
2002a75c:	d04b      	beq.n	2002a7f6 <_malloc_r+0xea>
2002a75e:	6823      	ldr	r3, [r4, #0]
2002a760:	4639      	mov	r1, r7
2002a762:	4630      	mov	r0, r6
2002a764:	eb04 0903 	add.w	r9, r4, r3
2002a768:	f000 f874 	bl	2002a854 <_sbrk_r>
2002a76c:	4581      	cmp	r9, r0
2002a76e:	d142      	bne.n	2002a7f6 <_malloc_r+0xea>
2002a770:	6821      	ldr	r1, [r4, #0]
2002a772:	4630      	mov	r0, r6
2002a774:	1a6d      	subs	r5, r5, r1
2002a776:	4629      	mov	r1, r5
2002a778:	f7ff ffa6 	bl	2002a6c8 <sbrk_aligned>
2002a77c:	3001      	adds	r0, #1
2002a77e:	d03a      	beq.n	2002a7f6 <_malloc_r+0xea>
2002a780:	6823      	ldr	r3, [r4, #0]
2002a782:	442b      	add	r3, r5
2002a784:	6023      	str	r3, [r4, #0]
2002a786:	f8d8 3000 	ldr.w	r3, [r8]
2002a78a:	685a      	ldr	r2, [r3, #4]
2002a78c:	bb62      	cbnz	r2, 2002a7e8 <_malloc_r+0xdc>
2002a78e:	f8c8 7000 	str.w	r7, [r8]
2002a792:	e00f      	b.n	2002a7b4 <_malloc_r+0xa8>
2002a794:	6822      	ldr	r2, [r4, #0]
2002a796:	1b52      	subs	r2, r2, r5
2002a798:	d420      	bmi.n	2002a7dc <_malloc_r+0xd0>
2002a79a:	2a0b      	cmp	r2, #11
2002a79c:	d917      	bls.n	2002a7ce <_malloc_r+0xc2>
2002a79e:	1961      	adds	r1, r4, r5
2002a7a0:	42a3      	cmp	r3, r4
2002a7a2:	6025      	str	r5, [r4, #0]
2002a7a4:	bf18      	it	ne
2002a7a6:	6059      	strne	r1, [r3, #4]
2002a7a8:	6863      	ldr	r3, [r4, #4]
2002a7aa:	bf08      	it	eq
2002a7ac:	f8c8 1000 	streq.w	r1, [r8]
2002a7b0:	5162      	str	r2, [r4, r5]
2002a7b2:	604b      	str	r3, [r1, #4]
2002a7b4:	4630      	mov	r0, r6
2002a7b6:	f000 f82f 	bl	2002a818 <__malloc_unlock>
2002a7ba:	f104 000b 	add.w	r0, r4, #11
2002a7be:	1d23      	adds	r3, r4, #4
2002a7c0:	f020 0007 	bic.w	r0, r0, #7
2002a7c4:	1ac2      	subs	r2, r0, r3
2002a7c6:	bf1c      	itt	ne
2002a7c8:	1a1b      	subne	r3, r3, r0
2002a7ca:	50a3      	strne	r3, [r4, r2]
2002a7cc:	e7af      	b.n	2002a72e <_malloc_r+0x22>
2002a7ce:	6862      	ldr	r2, [r4, #4]
2002a7d0:	42a3      	cmp	r3, r4
2002a7d2:	bf0c      	ite	eq
2002a7d4:	f8c8 2000 	streq.w	r2, [r8]
2002a7d8:	605a      	strne	r2, [r3, #4]
2002a7da:	e7eb      	b.n	2002a7b4 <_malloc_r+0xa8>
2002a7dc:	4623      	mov	r3, r4
2002a7de:	6864      	ldr	r4, [r4, #4]
2002a7e0:	e7ae      	b.n	2002a740 <_malloc_r+0x34>
2002a7e2:	463c      	mov	r4, r7
2002a7e4:	687f      	ldr	r7, [r7, #4]
2002a7e6:	e7b6      	b.n	2002a756 <_malloc_r+0x4a>
2002a7e8:	461a      	mov	r2, r3
2002a7ea:	685b      	ldr	r3, [r3, #4]
2002a7ec:	42a3      	cmp	r3, r4
2002a7ee:	d1fb      	bne.n	2002a7e8 <_malloc_r+0xdc>
2002a7f0:	2300      	movs	r3, #0
2002a7f2:	6053      	str	r3, [r2, #4]
2002a7f4:	e7de      	b.n	2002a7b4 <_malloc_r+0xa8>
2002a7f6:	230c      	movs	r3, #12
2002a7f8:	4630      	mov	r0, r6
2002a7fa:	6033      	str	r3, [r6, #0]
2002a7fc:	f000 f80c 	bl	2002a818 <__malloc_unlock>
2002a800:	e794      	b.n	2002a72c <_malloc_r+0x20>
2002a802:	6005      	str	r5, [r0, #0]
2002a804:	e7d6      	b.n	2002a7b4 <_malloc_r+0xa8>
2002a806:	bf00      	nop
2002a808:	2004d020 	.word	0x2004d020

2002a80c <__malloc_lock>:
2002a80c:	4801      	ldr	r0, [pc, #4]	@ (2002a814 <__malloc_lock+0x8>)
2002a80e:	f000 b831 	b.w	2002a874 <__retarget_lock_acquire_recursive>
2002a812:	bf00      	nop
2002a814:	2004d15c 	.word	0x2004d15c

2002a818 <__malloc_unlock>:
2002a818:	4801      	ldr	r0, [pc, #4]	@ (2002a820 <__malloc_unlock+0x8>)
2002a81a:	f000 b82c 	b.w	2002a876 <__retarget_lock_release_recursive>
2002a81e:	bf00      	nop
2002a820:	2004d15c 	.word	0x2004d15c

2002a824 <memcmp>:
2002a824:	3901      	subs	r1, #1
2002a826:	4402      	add	r2, r0
2002a828:	b510      	push	{r4, lr}
2002a82a:	4290      	cmp	r0, r2
2002a82c:	d101      	bne.n	2002a832 <memcmp+0xe>
2002a82e:	2000      	movs	r0, #0
2002a830:	e005      	b.n	2002a83e <memcmp+0x1a>
2002a832:	7803      	ldrb	r3, [r0, #0]
2002a834:	f811 4f01 	ldrb.w	r4, [r1, #1]!
2002a838:	42a3      	cmp	r3, r4
2002a83a:	d001      	beq.n	2002a840 <memcmp+0x1c>
2002a83c:	1b18      	subs	r0, r3, r4
2002a83e:	bd10      	pop	{r4, pc}
2002a840:	3001      	adds	r0, #1
2002a842:	e7f2      	b.n	2002a82a <memcmp+0x6>

2002a844 <memset>:
2002a844:	4402      	add	r2, r0
2002a846:	4603      	mov	r3, r0
2002a848:	4293      	cmp	r3, r2
2002a84a:	d100      	bne.n	2002a84e <memset+0xa>
2002a84c:	4770      	bx	lr
2002a84e:	f803 1b01 	strb.w	r1, [r3], #1
2002a852:	e7f9      	b.n	2002a848 <memset+0x4>

2002a854 <_sbrk_r>:
2002a854:	b538      	push	{r3, r4, r5, lr}
2002a856:	2300      	movs	r3, #0
2002a858:	4d05      	ldr	r5, [pc, #20]	@ (2002a870 <_sbrk_r+0x1c>)
2002a85a:	4604      	mov	r4, r0
2002a85c:	4608      	mov	r0, r1
2002a85e:	602b      	str	r3, [r5, #0]
2002a860:	f000 f862 	bl	2002a928 <_sbrk>
2002a864:	1c43      	adds	r3, r0, #1
2002a866:	d102      	bne.n	2002a86e <_sbrk_r+0x1a>
2002a868:	682b      	ldr	r3, [r5, #0]
2002a86a:	b103      	cbz	r3, 2002a86e <_sbrk_r+0x1a>
2002a86c:	6023      	str	r3, [r4, #0]
2002a86e:	bd38      	pop	{r3, r4, r5, pc}
2002a870:	2004d160 	.word	0x2004d160

2002a874 <__retarget_lock_acquire_recursive>:
2002a874:	4770      	bx	lr

2002a876 <__retarget_lock_release_recursive>:
2002a876:	4770      	bx	lr

2002a878 <memcpy>:
2002a878:	440a      	add	r2, r1
2002a87a:	1e43      	subs	r3, r0, #1
2002a87c:	4291      	cmp	r1, r2
2002a87e:	d100      	bne.n	2002a882 <memcpy+0xa>
2002a880:	4770      	bx	lr
2002a882:	b510      	push	{r4, lr}
2002a884:	f811 4b01 	ldrb.w	r4, [r1], #1
2002a888:	4291      	cmp	r1, r2
2002a88a:	f803 4f01 	strb.w	r4, [r3, #1]!
2002a88e:	d1f9      	bne.n	2002a884 <memcpy+0xc>
2002a890:	bd10      	pop	{r4, pc}
	...

2002a894 <_free_r>:
2002a894:	b538      	push	{r3, r4, r5, lr}
2002a896:	4605      	mov	r5, r0
2002a898:	2900      	cmp	r1, #0
2002a89a:	d041      	beq.n	2002a920 <_free_r+0x8c>
2002a89c:	f851 3c04 	ldr.w	r3, [r1, #-4]
2002a8a0:	1f0c      	subs	r4, r1, #4
2002a8a2:	2b00      	cmp	r3, #0
2002a8a4:	bfb8      	it	lt
2002a8a6:	18e4      	addlt	r4, r4, r3
2002a8a8:	f7ff ffb0 	bl	2002a80c <__malloc_lock>
2002a8ac:	4a1d      	ldr	r2, [pc, #116]	@ (2002a924 <_free_r+0x90>)
2002a8ae:	6813      	ldr	r3, [r2, #0]
2002a8b0:	b933      	cbnz	r3, 2002a8c0 <_free_r+0x2c>
2002a8b2:	6063      	str	r3, [r4, #4]
2002a8b4:	6014      	str	r4, [r2, #0]
2002a8b6:	4628      	mov	r0, r5
2002a8b8:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
2002a8bc:	f7ff bfac 	b.w	2002a818 <__malloc_unlock>
2002a8c0:	42a3      	cmp	r3, r4
2002a8c2:	d908      	bls.n	2002a8d6 <_free_r+0x42>
2002a8c4:	6820      	ldr	r0, [r4, #0]
2002a8c6:	1821      	adds	r1, r4, r0
2002a8c8:	428b      	cmp	r3, r1
2002a8ca:	bf01      	itttt	eq
2002a8cc:	6819      	ldreq	r1, [r3, #0]
2002a8ce:	685b      	ldreq	r3, [r3, #4]
2002a8d0:	1809      	addeq	r1, r1, r0
2002a8d2:	6021      	streq	r1, [r4, #0]
2002a8d4:	e7ed      	b.n	2002a8b2 <_free_r+0x1e>
2002a8d6:	461a      	mov	r2, r3
2002a8d8:	685b      	ldr	r3, [r3, #4]
2002a8da:	b10b      	cbz	r3, 2002a8e0 <_free_r+0x4c>
2002a8dc:	42a3      	cmp	r3, r4
2002a8de:	d9fa      	bls.n	2002a8d6 <_free_r+0x42>
2002a8e0:	6811      	ldr	r1, [r2, #0]
2002a8e2:	1850      	adds	r0, r2, r1
2002a8e4:	42a0      	cmp	r0, r4
2002a8e6:	d10b      	bne.n	2002a900 <_free_r+0x6c>
2002a8e8:	6820      	ldr	r0, [r4, #0]
2002a8ea:	4401      	add	r1, r0
2002a8ec:	1850      	adds	r0, r2, r1
2002a8ee:	6011      	str	r1, [r2, #0]
2002a8f0:	4283      	cmp	r3, r0
2002a8f2:	d1e0      	bne.n	2002a8b6 <_free_r+0x22>
2002a8f4:	6818      	ldr	r0, [r3, #0]
2002a8f6:	685b      	ldr	r3, [r3, #4]
2002a8f8:	4408      	add	r0, r1
2002a8fa:	6053      	str	r3, [r2, #4]
2002a8fc:	6010      	str	r0, [r2, #0]
2002a8fe:	e7da      	b.n	2002a8b6 <_free_r+0x22>
2002a900:	d902      	bls.n	2002a908 <_free_r+0x74>
2002a902:	230c      	movs	r3, #12
2002a904:	602b      	str	r3, [r5, #0]
2002a906:	e7d6      	b.n	2002a8b6 <_free_r+0x22>
2002a908:	6820      	ldr	r0, [r4, #0]
2002a90a:	1821      	adds	r1, r4, r0
2002a90c:	428b      	cmp	r3, r1
2002a90e:	bf02      	ittt	eq
2002a910:	6819      	ldreq	r1, [r3, #0]
2002a912:	685b      	ldreq	r3, [r3, #4]
2002a914:	1809      	addeq	r1, r1, r0
2002a916:	6063      	str	r3, [r4, #4]
2002a918:	bf08      	it	eq
2002a91a:	6021      	streq	r1, [r4, #0]
2002a91c:	6054      	str	r4, [r2, #4]
2002a91e:	e7ca      	b.n	2002a8b6 <_free_r+0x22>
2002a920:	bd38      	pop	{r3, r4, r5, pc}
2002a922:	bf00      	nop
2002a924:	2004d020 	.word	0x2004d020

2002a928 <_sbrk>:
2002a928:	4a05      	ldr	r2, [pc, #20]	@ (2002a940 <_sbrk+0x18>)
2002a92a:	4603      	mov	r3, r0
2002a92c:	6810      	ldr	r0, [r2, #0]
2002a92e:	b110      	cbz	r0, 2002a936 <_sbrk+0xe>
2002a930:	4403      	add	r3, r0
2002a932:	6013      	str	r3, [r2, #0]
2002a934:	4770      	bx	lr
2002a936:	4803      	ldr	r0, [pc, #12]	@ (2002a944 <_sbrk+0x1c>)
2002a938:	4403      	add	r3, r0
2002a93a:	6013      	str	r3, [r2, #0]
2002a93c:	4770      	bx	lr
2002a93e:	bf00      	nop
2002a940:	2004d164 	.word	0x2004d164
2002a944:	20042000 	.word	0x20042000
2002a948:	50041000 	.word	0x50041000
2002a94c:	00000002 	.word	0x00000002
2002a950:	10000000 	.word	0x10000000
2002a954:	00000004 	.word	0x00000004
2002a958:	00000000 	.word	0x00000000
2002a95c:	50081008 	.word	0x50081008
2002a960:	00000000 	.word	0x00000000
2002a964:	00000032 	.word	0x00000032
2002a968:	00000000 	.word	0x00000000
2002a96c:	50042000 	.word	0x50042000
2002a970:	00000002 	.word	0x00000002
2002a974:	12000000 	.word	0x12000000
2002a978:	00000004 	.word	0x00000004
2002a97c:	00000000 	.word	0x00000000
2002a980:	5008101c 	.word	0x5008101c
2002a984:	00000000 	.word	0x00000000
2002a988:	00000033 	.word	0x00000033
2002a98c:	00000001 	.word	0x00000001
2002a990:	62636573 	.word	0x62636573
2002a994:	20746f6f 	.word	0x20746f6f
2002a998:	6b676973 	.word	0x6b676973
2002a99c:	70207965 	.word	0x70207965
2002a9a0:	65206275 	.word	0x65206275
2002a9a4:	00217272 	.word	0x00217272
2002a9a8:	62636573 	.word	0x62636573
2002a9ac:	20746f6f 	.word	0x20746f6f
2002a9b0:	20676d69 	.word	0x20676d69
2002a9b4:	68736168 	.word	0x68736168
2002a9b8:	67697320 	.word	0x67697320
2002a9bc:	72726520 	.word	0x72726520
2002a9c0:	65730021 	.word	0x65730021
2002a9c4:	6f6f6263 	.word	0x6f6f6263
2002a9c8:	78652074 	.word	0x78652074
2002a9cc:	20747063 	.word	0x20747063
2002a9d0:	6c6c756e 	.word	0x6c6c756e
2002a9d4:	41480021 	.word	0x41480021
2002a9d8:	535f4853 	.word	0x535f4853
2002a9dc:	49545445 	.word	0x49545445
2002a9e0:	253d474e 	.word	0x253d474e
2002a9e4:	0a583830 	.word	0x0a583830
2002a9e8:	616f4c00 	.word	0x616f4c00
2002a9ec:	56492064 	.word	0x56492064
2002a9f0:	646e6120 	.word	0x646e6120
2002a9f4:	6e656c20 	.word	0x6e656c20
2002a9f8:	20687467 	.word	0x20687467
2002a9fc:	48534148 	.word	0x48534148
2002aa00:	5445535f 	.word	0x5445535f
2002aa04:	474e4954 	.word	0x474e4954
2002aa08:	3830253d 	.word	0x3830253d
2002aa0c:	69202c58 	.word	0x69202c58
2002aa10:	656c2076 	.word	0x656c2076
2002aa14:	6874676e 	.word	0x6874676e
2002aa18:	0a64253d 	.word	0x0a64253d
2002aa1c:	73655200 	.word	0x73655200
2002aa20:	20746c75 	.word	0x20746c75
2002aa24:	3d6e656c 	.word	0x3d6e656c
2002aa28:	000a6425 	.word	0x000a6425
2002aa2c:	2070614d 	.word	0x2070614d
2002aa30:	6f727265 	.word	0x6f727265
2002aa34:	6c203a72 	.word	0x6c203a72
2002aa38:	6369676f 	.word	0x6369676f
2002aa3c:	2c642520 	.word	0x2c642520
2002aa40:	79687020 	.word	0x79687020
2002aa44:	0a642520 	.word	0x0a642520
2002aa48:	52524500 	.word	0x52524500
2002aa4c:	2032203a 	.word	0x2032203a
2002aa50:	69676f6c 	.word	0x69676f6c
2002aa54:	6c622063 	.word	0x6c622063
2002aa58:	736b636f 	.word	0x736b636f
2002aa5c:	70616d20 	.word	0x70616d20
2002aa60:	206f7420 	.word	0x206f7420
2002aa64:	656d6173 	.word	0x656d6173
2002aa68:	6b6c6220 	.word	0x6b6c6220
2002aa6c:	6f6c203a 	.word	0x6f6c203a
2002aa70:	30636967 	.word	0x30636967
2002aa74:	2c642520 	.word	0x2c642520
2002aa78:	79687020 	.word	0x79687020
2002aa7c:	64252030 	.word	0x64252030
2002aa80:	6f6c202c 	.word	0x6f6c202c
2002aa84:	31636967 	.word	0x31636967
2002aa88:	2c642520 	.word	0x2c642520
2002aa8c:	79687020 	.word	0x79687020
2002aa90:	64252031 	.word	0x64252031
2002aa94:	614d000a 	.word	0x614d000a
2002aa98:	72652070 	.word	0x72652070
2002aa9c:	30726f72 	.word	0x30726f72
2002aaa0:	6f6c203a 	.word	0x6f6c203a
2002aaa4:	20636967 	.word	0x20636967
2002aaa8:	202c6425 	.word	0x202c6425
2002aaac:	20796870 	.word	0x20796870
2002aab0:	000a6425 	.word	0x000a6425
2002aab4:	20746547 	.word	0x20746547
2002aab8:	2070616d 	.word	0x2070616d
2002aabc:	636f6c62 	.word	0x636f6c62
2002aac0:	7265206b 	.word	0x7265206b
2002aac4:	20726f72 	.word	0x20726f72
2002aac8:	2d206425 	.word	0x2d206425
2002aacc:	25203e2d 	.word	0x25203e2d
2002aad0:	42000a64 	.word	0x42000a64
2002aad4:	76204d42 	.word	0x76204d42
2002aad8:	69737265 	.word	0x69737265
2002aadc:	6e206e6f 	.word	0x6e206e6f
2002aae0:	6920746f 	.word	0x6920746f
2002aae4:	6572636e 	.word	0x6572636e
2002aae8:	64657361 	.word	0x64657361
2002aaec:	7270203a 	.word	0x7270203a
2002aaf0:	25207665 	.word	0x25207665
2002aaf4:	63202c64 	.word	0x63202c64
2002aaf8:	20727275 	.word	0x20727275
2002aafc:	000a6425 	.word	0x000a6425
2002ab00:	41544144 	.word	0x41544144
2002ab04:	746f6e20 	.word	0x746f6e20
2002ab08:	61657220 	.word	0x61657220
2002ab0c:	616e6f73 	.word	0x616e6f73
2002ab10:	20656c62 	.word	0x20656c62
2002ab14:	42206e69 	.word	0x42206e69
2002ab18:	62204d42 	.word	0x62204d42
2002ab1c:	25206b6c 	.word	0x25206b6c
2002ab20:	61702064 	.word	0x61702064
2002ab24:	25206567 	.word	0x25206567
2002ab28:	30203a64 	.word	0x30203a64
2002ab2c:	0a782578 	.word	0x0a782578
2002ab30:	61655200 	.word	0x61655200
2002ab34:	62622064 	.word	0x62622064
2002ab38:	6c62206d 	.word	0x6c62206d
2002ab3c:	6425206b 	.word	0x6425206b
2002ab40:	67617020 	.word	0x67617020
2002ab44:	64252065 	.word	0x64252065
2002ab48:	69616620 	.word	0x69616620
2002ab4c:	49000a6c 	.word	0x49000a6c
2002ab50:	6c61766e 	.word	0x6c61766e
2002ab54:	42206469 	.word	0x42206469
2002ab58:	49204d42 	.word	0x49204d42
2002ab5c:	25205844 	.word	0x25205844
2002ab60:	56000a64 	.word	0x56000a64
2002ab64:	64252031 	.word	0x64252031
2002ab68:	206e6920 	.word	0x206e6920
2002ab6c:	636f6c62 	.word	0x636f6c62
2002ab70:	6425206b 	.word	0x6425206b
2002ab74:	3256202c 	.word	0x3256202c
2002ab78:	20642520 	.word	0x20642520
2002ab7c:	62206e69 	.word	0x62206e69
2002ab80:	6b636f6c 	.word	0x6b636f6c
2002ab84:	0a642520 	.word	0x0a642520
2002ab88:	6d615300 	.word	0x6d615300
2002ab8c:	69687465 	.word	0x69687465
2002ab90:	6d20676e 	.word	0x6d20676e
2002ab94:	20747375 	.word	0x20747375
2002ab98:	77206562 	.word	0x77206562
2002ab9c:	676e6f72 	.word	0x676e6f72
2002aba0:	6567202c 	.word	0x6567202c
2002aba4:	656e2074 	.word	0x656e2074
2002aba8:	65762077 	.word	0x65762077
2002abac:	6f697372 	.word	0x6f697372
2002abb0:	6425206e 	.word	0x6425206e
2002abb4:	206f6420 	.word	0x206f6420
2002abb8:	20746f6e 	.word	0x20746f6e
2002abbc:	656d6173 	.word	0x656d6173
2002abc0:	206f7420 	.word	0x206f7420
2002abc4:	76657270 	.word	0x76657270
2002abc8:	65686320 	.word	0x65686320
2002abcc:	25206b63 	.word	0x25206b63
2002abd0:	43000a64 	.word	0x43000a64
2002abd4:	63204352 	.word	0x63204352
2002abd8:	6b636568 	.word	0x6b636568
2002abdc:	72726520 	.word	0x72726520
2002abe0:	0a20726f 	.word	0x0a20726f
2002abe4:	61655200 	.word	0x61655200
2002abe8:	62622064 	.word	0x62622064
2002abec:	6c62206d 	.word	0x6c62206d
2002abf0:	6425206b 	.word	0x6425206b
2002abf4:	67617020 	.word	0x67617020
2002abf8:	64252065 	.word	0x64252065
2002abfc:	74616420 	.word	0x74616420
2002ac00:	6f6e2061 	.word	0x6f6e2061
2002ac04:	72772074 	.word	0x72772074
2002ac08:	20657469 	.word	0x20657469
2002ac0c:	20726f66 	.word	0x20726f66
2002ac10:	20646e32 	.word	0x20646e32
2002ac14:	656d6974 	.word	0x656d6974
2002ac18:	6552000a 	.word	0x6552000a
2002ac1c:	62206461 	.word	0x62206461
2002ac20:	62206d62 	.word	0x62206d62
2002ac24:	25206b6c 	.word	0x25206b6c
2002ac28:	61702064 	.word	0x61702064
2002ac2c:	25206567 	.word	0x25206567
2002ac30:	61662064 	.word	0x61662064
2002ac34:	66206c69 	.word	0x66206c69
2002ac38:	3220726f 	.word	0x3220726f
2002ac3c:	7420646e 	.word	0x7420646e
2002ac40:	3f656d69 	.word	0x3f656d69
2002ac44:	614c000a 	.word	0x614c000a
2002ac48:	74736574 	.word	0x74736574
2002ac4c:	72657620 	.word	0x72657620
2002ac50:	6e6f6973 	.word	0x6e6f6973
2002ac54:	0a642520 	.word	0x0a642520
2002ac58:	74654700 	.word	0x74654700
2002ac5c:	79687020 	.word	0x79687020
2002ac60:	6b6c6220 	.word	0x6b6c6220
2002ac64:	726f6620 	.word	0x726f6620
2002ac68:	20642520 	.word	0x20642520
2002ac6c:	6c696166 	.word	0x6c696166
2002ac70:	65687720 	.word	0x65687720
2002ac74:	6572206e 	.word	0x6572206e
2002ac78:	000a6461 	.word	0x000a6461
2002ac7c:	636f6c42 	.word	0x636f6c42
2002ac80:	6425206b 	.word	0x6425206b
2002ac84:	61726520 	.word	0x61726520
2002ac88:	66206573 	.word	0x66206573
2002ac8c:	2c6c6961 	.word	0x2c6c6961
2002ac90:	72616d20 	.word	0x72616d20
2002ac94:	7361206b 	.word	0x7361206b
2002ac98:	64616220 	.word	0x64616220
2002ac9c:	6c42000a 	.word	0x6c42000a
2002aca0:	206b636f 	.word	0x206b636f
2002aca4:	63206425 	.word	0x63206425
2002aca8:	6b636568 	.word	0x6b636568
2002acac:	20736120 	.word	0x20736120
2002acb0:	20646162 	.word	0x20646162
2002acb4:	636f6c62 	.word	0x636f6c62
2002acb8:	42000a6b 	.word	0x42000a6b
2002acbc:	6b636f6c 	.word	0x6b636f6c
2002acc0:	20642520 	.word	0x20642520
2002acc4:	62207369 	.word	0x62207369
2002acc8:	69206461 	.word	0x69206461
2002accc:	7375206e 	.word	0x7375206e
2002acd0:	62207265 	.word	0x62207265
2002acd4:	6b636f6c 	.word	0x6b636f6c
2002acd8:	6162000a 	.word	0x6162000a
2002acdc:	64252064 	.word	0x64252064
2002ace0:	6572202c 	.word	0x6572202c
2002ace4:	63616c70 	.word	0x63616c70
2002ace8:	64252065 	.word	0x64252065
2002acec:	6f4e000a 	.word	0x6f4e000a
2002acf0:	63616220 	.word	0x63616220
2002acf4:	2070756b 	.word	0x2070756b
2002acf8:	636f6c62 	.word	0x636f6c62
2002acfc:	6e61206b 	.word	0x6e61206b
2002ad00:	6f6d2079 	.word	0x6f6d2079
2002ad04:	000a6572 	.word	0x000a6572
2002ad08:	74706d65 	.word	0x74706d65
2002ad0c:	61742079 	.word	0x61742079
2002ad10:	20656c62 	.word	0x20656c62
2002ad14:	6e206425 	.word	0x6e206425
2002ad18:	6520746f 	.word	0x6520746f
2002ad1c:	67756f6e 	.word	0x67756f6e
2002ad20:	6f662068 	.word	0x6f662068
2002ad24:	6e692072 	.word	0x6e692072
2002ad28:	61697469 	.word	0x61697469
2002ad2c:	55000a6c 	.word	0x55000a6c
2002ad30:	74616470 	.word	0x74616470
2002ad34:	61742065 	.word	0x61742065
2002ad38:	20656c62 	.word	0x20656c62
2002ad3c:	66206f74 	.word	0x66206f74
2002ad40:	6873616c 	.word	0x6873616c
2002ad44:	6e6f6420 	.word	0x6e6f6420
2002ad48:	49000a65 	.word	0x49000a65
2002ad4c:	6974696e 	.word	0x6974696e
2002ad50:	74206c61 	.word	0x74206c61
2002ad54:	656c6261 	.word	0x656c6261
2002ad58:	69616620 	.word	0x69616620
2002ad5c:	42000a6c 	.word	0x42000a6c
2002ad60:	69204d42 	.word	0x69204d42
2002ad64:	6974696e 	.word	0x6974696e
2002ad68:	7a696c61 	.word	0x7a696c61
2002ad6c:	62206465 	.word	0x62206465
2002ad70:	726f6665 	.word	0x726f6665
2002ad74:	64202c65 	.word	0x64202c65
2002ad78:	6f6e206f 	.word	0x6f6e206f
2002ad7c:	6e692074 	.word	0x6e692074
2002ad80:	61207469 	.word	0x61207469
2002ad84:	6d20796e 	.word	0x6d20796e
2002ad88:	0a65726f 	.word	0x0a65726f
2002ad8c:	54454400 	.word	0x54454400
2002ad90:	20642520 	.word	0x20642520
2002ad94:	0a646162 	.word	0x0a646162
2002ad98:	4b4c4200 	.word	0x4b4c4200
2002ad9c:	20642520 	.word	0x20642520
2002ada0:	64616572 	.word	0x64616572
2002ada4:	69616620 	.word	0x69616620
2002ada8:	6d202c6c 	.word	0x6d202c6c
2002adac:	206b7261 	.word	0x206b7261
2002adb0:	62207361 	.word	0x62207361
2002adb4:	000a6461 	.word	0x000a6461
2002adb8:	20746564 	.word	0x20746564
2002adbc:	206d6262 	.word	0x206d6262
2002adc0:	6c626174 	.word	0x6c626174
2002adc4:	69772065 	.word	0x69772065
2002adc8:	25206874 	.word	0x25206874
2002adcc:	25202c64 	.word	0x25202c64
2002add0:	25202c64 	.word	0x25202c64
2002add4:	64000a64 	.word	0x64000a64
2002add8:	63657465 	.word	0x63657465
2002addc:	65722074 	.word	0x65722074
2002ade0:	746c7573 	.word	0x746c7573
2002ade4:	0a642520 	.word	0x0a642520
2002ade8:	20317600 	.word	0x20317600
2002adec:	69206425 	.word	0x69206425
2002adf0:	6c62206e 	.word	0x6c62206e
2002adf4:	6425206b 	.word	0x6425206b
2002adf8:	3276202c 	.word	0x3276202c
2002adfc:	20642520 	.word	0x20642520
2002ae00:	62206e69 	.word	0x62206e69
2002ae04:	6b636f6c 	.word	0x6b636f6c
2002ae08:	0a642520 	.word	0x0a642520
2002ae0c:	65684300 	.word	0x65684300
2002ae10:	62206b63 	.word	0x62206b63
2002ae14:	74206d62 	.word	0x74206d62
2002ae18:	656c6261 	.word	0x656c6261
2002ae1c:	69616620 	.word	0x69616620
2002ae20:	64000a6c 	.word	0x64000a6c
2002ae24:	63657465 	.word	0x63657465
2002ae28:	65722074 	.word	0x65722074
2002ae2c:	746c7573 	.word	0x746c7573
2002ae30:	20642520 	.word	0x20642520
2002ae34:	20746f6e 	.word	0x20746f6e
2002ae38:	73616572 	.word	0x73616572
2002ae3c:	62616e6f 	.word	0x62616e6f
2002ae40:	000a656c 	.word	0x000a656c
2002ae44:	204d4242 	.word	0x204d4242
2002ae48:	3a4d454d 	.word	0x3a4d454d
2002ae4c:	78746320 	.word	0x78746320
2002ae50:	2c702520 	.word	0x2c702520
2002ae54:	70616d20 	.word	0x70616d20
2002ae58:	70252031 	.word	0x70252031
2002ae5c:	616d202c 	.word	0x616d202c
2002ae60:	25203270 	.word	0x25203270
2002ae64:	000a2070 	.word	0x000a2070
2002ae68:	5f666973 	.word	0x5f666973
2002ae6c:	5f6d6262 	.word	0x5f6d6262
2002ae70:	74696e69 	.word	0x74696e69
2002ae74:	6e6f6420 	.word	0x6e6f6420
2002ae78:	53000a65 	.word	0x53000a65
2002ae7c:	31354148 	.word	0x31354148
2002ae80:	48530032 	.word	0x48530032
2002ae84:	34383341 	.word	0x34383341
2002ae88:	41485300 	.word	0x41485300
2002ae8c:	00363532 	.word	0x00363532
2002ae90:	32414853 	.word	0x32414853
2002ae94:	60003432 	.word	0x60003432
2002ae98:	65014886 	.word	0x65014886
2002ae9c:	04020403 	.word	0x04020403
2002aea0:	2d646900 	.word	0x2d646900
2002aea4:	32616873 	.word	0x32616873
2002aea8:	60003432 	.word	0x60003432
2002aeac:	65014886 	.word	0x65014886
2002aeb0:	01020403 	.word	0x01020403
2002aeb4:	2d646900 	.word	0x2d646900
2002aeb8:	32616873 	.word	0x32616873
2002aebc:	60003635 	.word	0x60003635
2002aec0:	65014886 	.word	0x65014886
2002aec4:	02020403 	.word	0x02020403
2002aec8:	2d646900 	.word	0x2d646900
2002aecc:	33616873 	.word	0x33616873
2002aed0:	60003438 	.word	0x60003438
2002aed4:	65014886 	.word	0x65014886
2002aed8:	03020403 	.word	0x03020403
2002aedc:	2d646900 	.word	0x2d646900
2002aee0:	35616873 	.word	0x35616873
2002aee4:	2b003231 	.word	0x2b003231
2002aee8:	0702030e 	.word	0x0702030e
2002aeec:	73656400 	.word	0x73656400
2002aef0:	00434243 	.word	0x00434243
2002aef4:	2d534544 	.word	0x2d534544
2002aef8:	00434243 	.word	0x00434243
2002aefc:	8648862a 	.word	0x8648862a
2002af00:	07030df7 	.word	0x07030df7
2002af04:	73656400 	.word	0x73656400
2002af08:	6564652d 	.word	0x6564652d
2002af0c:	62632d33 	.word	0x62632d33
2002af10:	45440063 	.word	0x45440063
2002af14:	44452d53 	.word	0x44452d53
2002af18:	432d3345 	.word	0x432d3345
2002af1c:	2a004342 	.word	0x2a004342
2002af20:	f7864886 	.word	0xf7864886
2002af24:	0101010d 	.word	0x0101010d
2002af28:	61737200 	.word	0x61737200
2002af2c:	72636e45 	.word	0x72636e45
2002af30:	69747079 	.word	0x69747079
2002af34:	52006e6f 	.word	0x52006e6f
2002af38:	2a004153 	.word	0x2a004153
2002af3c:	3dce4886 	.word	0x3dce4886
2002af40:	69000102 	.word	0x69000102
2002af44:	63652d64 	.word	0x63652d64
2002af48:	6c627550 	.word	0x6c627550
2002af4c:	654b6369 	.word	0x654b6369
2002af50:	65470079 	.word	0x65470079
2002af54:	6972656e 	.word	0x6972656e
2002af58:	43452063 	.word	0x43452063
2002af5c:	79656b20 	.word	0x79656b20
2002af60:	04812b00 	.word	0x04812b00
2002af64:	69000c01 	.word	0x69000c01
2002af68:	63652d64 	.word	0x63652d64
2002af6c:	45004844 	.word	0x45004844
2002af70:	656b2043 	.word	0x656b2043
2002af74:	6f662079 	.word	0x6f662079
2002af78:	43452072 	.word	0x43452072
2002af7c:	2a004844 	.word	0x2a004844
2002af80:	f7864886 	.word	0xf7864886
2002af84:	0e01010d 	.word	0x0e01010d
2002af88:	61687300 	.word	0x61687300
2002af8c:	57343232 	.word	0x57343232
2002af90:	52687469 	.word	0x52687469
2002af94:	6e454153 	.word	0x6e454153
2002af98:	70797263 	.word	0x70797263
2002af9c:	6e6f6974 	.word	0x6e6f6974
2002afa0:	41535200 	.word	0x41535200
2002afa4:	74697720 	.word	0x74697720
2002afa8:	48532068 	.word	0x48532068
2002afac:	32322d41 	.word	0x32322d41
2002afb0:	862a0034 	.word	0x862a0034
2002afb4:	0df78648 	.word	0x0df78648
2002afb8:	000b0101 	.word	0x000b0101
2002afbc:	32616873 	.word	0x32616873
2002afc0:	69573635 	.word	0x69573635
2002afc4:	53526874 	.word	0x53526874
2002afc8:	636e4541 	.word	0x636e4541
2002afcc:	74707972 	.word	0x74707972
2002afd0:	006e6f69 	.word	0x006e6f69
2002afd4:	20415352 	.word	0x20415352
2002afd8:	68746977 	.word	0x68746977
2002afdc:	41485320 	.word	0x41485320
2002afe0:	3635322d 	.word	0x3635322d
2002afe4:	48862a00 	.word	0x48862a00
2002afe8:	010df786 	.word	0x010df786
2002afec:	73000c01 	.word	0x73000c01
2002aff0:	38336168 	.word	0x38336168
2002aff4:	74695734 	.word	0x74695734
2002aff8:	41535268 	.word	0x41535268
2002affc:	72636e45 	.word	0x72636e45
2002b000:	69747079 	.word	0x69747079
2002b004:	52006e6f 	.word	0x52006e6f
2002b008:	77204153 	.word	0x77204153
2002b00c:	20687469 	.word	0x20687469
2002b010:	2d414853 	.word	0x2d414853
2002b014:	00343833 	.word	0x00343833
2002b018:	8648862a 	.word	0x8648862a
2002b01c:	01010df7 	.word	0x01010df7
2002b020:	6873000d 	.word	0x6873000d
2002b024:	32313561 	.word	0x32313561
2002b028:	68746957 	.word	0x68746957
2002b02c:	45415352 	.word	0x45415352
2002b030:	7972636e 	.word	0x7972636e
2002b034:	6f697470 	.word	0x6f697470
2002b038:	5352006e 	.word	0x5352006e
2002b03c:	69772041 	.word	0x69772041
2002b040:	53206874 	.word	0x53206874
2002b044:	352d4148 	.word	0x352d4148
2002b048:	2a003231 	.word	0x2a003231
2002b04c:	f7864886 	.word	0xf7864886
2002b050:	0a01010d 	.word	0x0a01010d
2002b054:	41535200 	.word	0x41535200
2002b058:	2d415353 	.word	0x2d415353
2002b05c:	00535350 	.word	0x00535350
2002b060:	2e617372 	.word	0x2e617372
2002b064:	7372004e 	.word	0x7372004e
2002b068:	00452e61 	.word	0x00452e61

2002b06c <HASH_SIZE>:
2002b06c:	20202014 00000000 04030201 00000000     .   ............
2002b07c:	01060204                                ....

2002b080 <CSWTCH.52>:
2002b080:	0000003f 00003f00 003f0000              ?....?....?.

2002b08c <hpsys_dll2_limit>:
	...
2002b094:	112a8800 112a8800                       ..*...*.

2002b09c <hpsys_dvfs_config>:
2002b09c:	000906fb 00100330 000a08fd 00110331     ....0.......1...
2002b0ac:	000d0b00 00130213 000f0d02 00130213     ................

2002b0bc <crc32tab>:
2002b0bc:	00000000 77073096 ee0e612c 990951ba     .....0.w,a...Q..
2002b0cc:	076dc419 706af48f e963a535 9e6495a3     ..m...jp5.c...d.
2002b0dc:	0edb8832 79dcb8a4 e0d5e91e 97d2d988     2......y........
2002b0ec:	09b64c2b 7eb17cbd e7b82d07 90bf1d91     +L...|.~.-......
2002b0fc:	1db71064 6ab020f2 f3b97148 84be41de     d.... .jHq...A..
2002b10c:	1adad47d 6ddde4eb f4d4b551 83d385c7     }......mQ.......
2002b11c:	136c9856 646ba8c0 fd62f97a 8a65c9ec     V.l...kdz.b...e.
2002b12c:	14015c4f 63066cd9 fa0f3d63 8d080df5     O\...l.cc=......
2002b13c:	3b6e20c8 4c69105e d56041e4 a2677172     . n;^.iL.A`.rqg.
2002b14c:	3c03e4d1 4b04d447 d20d85fd a50ab56b     ...<G..K....k...
2002b15c:	35b5a8fa 42b2986c dbbbc9d6 acbcf940     ...5l..B....@...
2002b16c:	32d86ce3 45df5c75 dcd60dcf abd13d59     .l.2u\.E....Y=..
2002b17c:	26d930ac 51de003a c8d75180 bfd06116     .0.&:..Q.Q...a..
2002b18c:	21b4f4b5 56b3c423 cfba9599 b8bda50f     ...!#..V........
2002b19c:	2802b89e 5f058808 c60cd9b2 b10be924     ...(..._....$...
2002b1ac:	2f6f7c87 58684c11 c1611dab b6662d3d     .|o/.LhX..a.=-f.
2002b1bc:	76dc4190 01db7106 98d220bc efd5102a     .A.v.q... ..*...
2002b1cc:	71b18589 06b6b51f 9fbfe4a5 e8b8d433     ...q........3...
2002b1dc:	7807c9a2 0f00f934 9609a88e e10e9818     ...x4...........
2002b1ec:	7f6a0dbb 086d3d2d 91646c97 e6635c01     ..j.-=m..ld..\c.
2002b1fc:	6b6b51f4 1c6c6162 856530d8 f262004e     .Qkkbal..0e.N.b.
2002b20c:	6c0695ed 1b01a57b 8208f4c1 f50fc457     ...l{.......W...
2002b21c:	65b0d9c6 12b7e950 8bbeb8ea fcb9887c     ...eP.......|...
2002b22c:	62dd1ddf 15da2d49 8cd37cf3 fbd44c65     ...bI-...|..eL..
2002b23c:	4db26158 3ab551ce a3bc0074 d4bb30e2     Xa.M.Q.:t....0..
2002b24c:	4adfa541 3dd895d7 a4d1c46d d3d6f4fb     A..J...=m.......
2002b25c:	4369e96a 346ed9fc ad678846 da60b8d0     j.iC..n4F.g...`.
2002b26c:	44042d73 33031de5 aa0a4c5f dd0d7cc9     s-.D...3_L...|..
2002b27c:	5005713c 270241aa be0b1010 c90c2086     <q.P.A.'..... ..
2002b28c:	5768b525 206f85b3 b966d409 ce61e49f     %.hW..o ..f...a.
2002b29c:	5edef90e 29d9c998 b0d09822 c7d7a8b4     ...^...)".......
2002b2ac:	59b33d17 2eb40d81 b7bd5c3b c0ba6cad     .=.Y....;\...l..
2002b2bc:	edb88320 9abfb3b6 03b6e20c 74b1d29a      ..............t
2002b2cc:	ead54739 9dd277af 04db2615 73dc1683     9G...w...&.....s
2002b2dc:	e3630b12 94643b84 0d6d6a3e 7a6a5aa8     ..c..;d.>jm..Zjz
2002b2ec:	e40ecf0b 9309ff9d 0a00ae27 7d079eb1     ........'......}
2002b2fc:	f00f9344 8708a3d2 1e01f268 6906c2fe     D.......h......i
2002b30c:	f762575d 806567cb 196c3671 6e6b06e7     ]Wb..ge.q6l...kn
2002b31c:	fed41b76 89d32be0 10da7a5a 67dd4acc     v....+..Zz...J.g
2002b32c:	f9b9df6f 8ebeeff9 17b7be43 60b08ed5     o.......C......`
2002b33c:	d6d6a3e8 a1d1937e 38d8c2c4 4fdff252     ....~......8R..O
2002b34c:	d1bb67f1 a6bc5767 3fb506dd 48b2364b     .g..gW.....?K6.H
2002b35c:	d80d2bda af0a1b4c 36034af6 41047a60     .+..L....J.6`z.A
2002b36c:	df60efc3 a867df55 316e8eef 4669be79     ..`.U.g...n1y.iF
2002b37c:	cb61b38c bc66831a 256fd2a0 5268e236     ..a...f...o%6.hR
2002b38c:	cc0c7795 bb0b4703 220216b9 5505262f     .w...G....."/&.U
2002b39c:	c5ba3bbe b2bd0b28 2bb45a92 5cb36a04     .;..(....Z.+.j.\
2002b3ac:	c2d7ffa7 b5d0cf31 2cd99e8b 5bdeae1d     ....1......,...[
2002b3bc:	9b64c2b0 ec63f226 756aa39c 026d930a     ..d.&.c...ju..m.
2002b3cc:	9c0906a9 eb0e363f 72076785 05005713     ....?6...g.r.W..
2002b3dc:	95bf4a82 e2b87a14 7bb12bae 0cb61b38     .J...z...+.{8...
2002b3ec:	92d28e9b e5d5be0d 7cdcefb7 0bdbdf21     ...........|!...
2002b3fc:	86d3d2d4 f1d4e242 68ddb3f8 1fda836e     ....B......hn...
2002b40c:	81be16cd f6b9265b 6fb077e1 18b74777     ....[&...w.owG..
2002b41c:	88085ae6 ff0f6a70 66063bca 11010b5c     .Z..pj...;.f\...
2002b42c:	8f659eff f862ae69 616bffd3 166ccf45     ..e.i.b...kaE.l.
2002b43c:	a00ae278 d70dd2ee 4e048354 3903b3c2     x.......T..N...9
2002b44c:	a7672661 d06016f7 4969474d 3e6e77db     a&g...`.MGiI.wn>
2002b45c:	aed16a4a d9d65adc 40df0b66 37d83bf0     Jj...Z..f..@.;.7
2002b46c:	a9bcae53 debb9ec5 47b2cf7f 30b5ffe9     S..........G...0
2002b47c:	bdbdf21c cabac28a 53b39330 24b4a3a6     ........0..S...$
2002b48c:	bad03605 cdd70693 54de5729 23d967bf     .6......)W.T.g.#
2002b49c:	b3667a2e c4614ab8 5d681b02 2a6f2b94     .zf..Ja...h].+o*
2002b4ac:	b40bbe37 c30c8ea1 5a05df1b 2d02ef8d     7..........Z...-

2002b4bc <pin_pad_func_lcpu>:
	...
2002b4dc:	032100b2 00000301 00000000 024b023b     ..!.........;.K.
2002b4ec:	00000237 00000000 00000000 00000000     7...............
2002b4fc:	032200b3 00000302 00000000 024b023c     ..".........<.K.
2002b50c:	00000238 00000000 00000000 00000000     8...............
2002b51c:	032300b4 00000303 00000000 024b023d     ..#.........=.K.
2002b52c:	0000023a 00000000 00000000 00000000     :...............
2002b53c:	032400b5 00000304 00000000 024b023e     ..$.........>.K.
2002b54c:	00000239 00000000 00000000 00000000     9...............

2002b55c <pin_pad_func_hcpu>:
	...
2002b57c:	000400f2 00000000 000b0000 00000000     ................
	...
2002b59c:	000900f3 00000000 00030000 00000000     ................
	...
2002b5bc:	000a00f4 00000000 000a0000 00000000     ................
	...
2002b5dc:	000b00f5 00000000 000b0000 00000000     ................
	...
2002b5fc:	000c00f6 00000000 00030000 00000000     ................
	...
2002b61c:	000300f7 000d0000 00000009 00000000     ................
	...
2002b63c:	000200f8 000e0000 0000000b 00000000     ................
	...
2002b65c:	000100f9 000f0000 0009000a 00000000     ................
	...
2002b67c:	000d00fa 00100000 000c0003 00000000     ................
	...
2002b69c:	000e00fb 00060000 00010001 00000000     ................
	...
2002b6bc:	000f00fc 00010000 000c000c 00000000     ................
	...
2002b6dc:	001000fd 00030000 00090000 00000000     ................
	...
2002b6fc:	000500fe 00000006 00000000 00000000     ................
	...
2002b71c:	01540052 00000000 026302b2 016a0000     R.T.......c...j.
	...
2002b73c:	00000053 00000000 026402b3 00000000     S.........d.....
	...
2002b75c:	01550054 01c60000 026502b4 016b019a     T.U.......e...k.
2002b76c:	023b0000 02270000 00000000 00000000     ..;...'.........
2002b77c:	014e0055 01c80000 026602b5 015f0199     U.N.......f..._.
2002b78c:	023c0000 02280000 00000000 00000000     ..<...(.........
2002b79c:	014f0056 01c70000 026702b6 015e0197     V.O.......g...^.
2002b7ac:	023d0000 02290000 00000000 00000000     ..=...).........
2002b7bc:	01500057 01c40000 026802b7 01680195     W.P.......h...h.
2002b7cc:	023e0000 022a0000 00000000 00000000     ..>...*.........
2002b7dc:	01510058 01c50000 026902b8 01690194     X.Q.......i...i.
2002b7ec:	023f0000 022b0000 00000000 00000000     ..?...+.........
2002b7fc:	01520059 01d40000 026a02b9 01600192     Y.R.......j...`.
2002b80c:	02400000 022c0000 00000000 00000000     ..@...,.........
2002b81c:	0153005a 01d50000 026b02ba 01610191     Z.S.......k...a.
2002b82c:	02410000 0000023a 00000000 00000000     ..A.:...........
2002b83c:	0000005b 00000000 026c02bb 00000000     [.........l.....
2002b84c:	02420000 00000239 00000000 00000000     ..B.9...........
2002b85c:	0000005c 00000000 026d02bc 00000000     \.........m.....
	...
2002b87c:	0000005d 00000000 026e02bd 00000000     ].........n.....
2002b88c:	01d30000 02210237 00000000 00000000     ....7.!.........
2002b89c:	001b005e 000001b7 026f02be 00000000     ^.........o.....
2002b8ac:	00000000 02220238 00000000 00000000     ....8.".........
2002b8bc:	0022005f 000001b8 027002bf 00000000     _.".......p.....
2002b8cc:	00000000 02230000 00000000 00000000     ......#.........
2002b8dc:	00230060 000001b2 027102c0 00000000     `.#.......q.....
2002b8ec:	00000000 02240000 00000000 00000000     ......$.........
2002b8fc:	00210061 000001b4 027202c1 00000000     a.!.......r.....
2002b90c:	00000000 02250000 00000000 00000000     ......%.........
2002b91c:	00190062 000001b5 027302c2 00000000     b.........s.....
2002b92c:	00000000 02260000 00000000 00000000     ......&.........
2002b93c:	00240063 000001b6 027402c3 00000000     c.$.......t.....
	...
2002b95c:	00000064 0000021a 027502c4 00000000     d.........u.....
	...
2002b97c:	00000065 00000219 027602c5 00000000     e.........v.....
	...
2002b99c:	00000066 00000000 027702c6 00000000     f.........w.....
2002b9ac:	024b0000 00000000 00000000 00000000     ..K.............
2002b9bc:	00000067 00000000 027802c7 00000000     g.........x.....
	...
2002b9dc:	00000068 01d40000 027902c8 00000000     h.........y.....
	...
2002b9fc:	00000069 01d50000 027a02c9 00000000     i.........z.....
	...
2002ba1c:	0000006a 01c60149 027b02ca 03620361     j...I.....{.a.b.
2002ba2c:	03640363 03660365 00000000 00000000     c.d.e.f.........
2002ba3c:	0000006b 01c80148 027c02cb 03620361     k...H.....|.a.b.
2002ba4c:	03640363 03660365 00000000 00000000     c.d.e.f.........
2002ba5c:	0000006c 00000000 027d02cc 03620361     l.........}.a.b.
2002ba6c:	03640363 03660365 00000000 00000000     c.d.e.f.........
2002ba7c:	0000006d 00000000 027e02cd 03620361     m.........~.a.b.
2002ba8c:	03640363 03660365 00000000 00000000     c.d.e.f.........
2002ba9c:	0000006e 01c70146 027f02ce 00000000     n...F...........
	...
2002babc:	0000006f 01c40147 028002cf 00000000     o...G...........
	...
2002badc:	00000070 01c50000 028102d0 00000000     p...............
	...
2002bafc:	00000071 00000000 028202d1 00000000     q...............
2002bb0c:	02430000 00000000 00000000 00000000     ..C.............
2002bb1c:	00000072 00000000 028302d2 00000000     r...............
	...
2002bb3c:	00000073 00000000 028402d3 00000000     s...............
	...
2002bb5c:	00000074 00000000 028502d4 00000000     t...............
	...
2002bb7c:	00000075 00000000 028602d5 00000000     u...............
	...
2002bb9c:	00000076 00000000 028702d6 00000000     v...............
	...
2002bbbc:	00000077 0000014d 028802d7 01620000     w...M.........b.
2002bbcc:	02440000 00000000 00000000 00000000     ..D.............
2002bbdc:	00000078 0000014c 028902d8 00000000     x...L...........
	...
2002bbfc:	00000079 0000014a 028a02d9 01630190     y...J.........c.
2002bc0c:	02450000 022f0000 00000000 00000000     ..E.../.........
2002bc1c:	0000007a 0000014b 028b02da 0164018f     z...K.........d.
2002bc2c:	02460000 02300000 00000000 00000000     ..F...0.........
2002bc3c:	0000007b 00000000 028c02db 01650193     {.............e.
2002bc4c:	02470000 02310000 00000000 00000000     ..G...1.........
2002bc5c:	0000007c 00000000 028d02dc 01660196     |.............f.
2002bc6c:	02480000 02320000 00000000 00000000     ..H...2.........
2002bc7c:	0000007d 00000000 028e02dd 01670198     }.............g.
2002bc8c:	02490000 02330000 00000000 00000000     ..I...3.........
2002bc9c:	0000007e 00000000 028f02de 00000000     ~...............
2002bcac:	024a0000 02340000 00000000 00000000     ..J...4.........

2002bcbc <CSWTCH.5>:
2002bcbc:	2002bd5c 2002bd2c 2002bcfc 2002bccc     \.. ,.. ... ... 

2002bccc <mbedtls_sha512_info>:
2002bccc:	00000008 2002ae7b 00000040 00000080     ....{.. @.......
2002bcdc:	20025ec5 20025ebb 20025eb7 20025eb1     .^. .^. .^. .^. 
2002bcec:	20025e95 20025e83 20025e7f 20025e7b     .^. .^. .^. {^. 

2002bcfc <mbedtls_sha384_info>:
2002bcfc:	00000007 2002ae82 00000030 00000080     ....... 0.......
2002bd0c:	20025ebf 20025ebb 20025eb7 20025eab     .^. .^. .^. .^. 
2002bd1c:	20025e95 20025e83 20025e7f 20025e7b     .^. .^. .^. {^. 

2002bd2c <mbedtls_sha256_info>:
2002bd2c:	00000006 2002ae89 00000020 00000040     .......  ...@...
2002bd3c:	20025e75 20025e6b 20025e67 20025e61     u^. k^. g^. a^. 
2002bd4c:	20025e45 20025e33 20025e2f 20025e2b     E^. 3^. /^. +^. 

2002bd5c <mbedtls_sha224_info>:
2002bd5c:	00000005 2002ae90 0000001c 00000040     ....... ....@...
2002bd6c:	20025e6f 20025e6b 20025e67 20025e5b     o^. k^. g^. [^. 
2002bd7c:	20025e45 20025e33 20025e2f 20025e2b     E^. 3^. /^. +^. 

2002bd8c <sha256_padding>:
2002bd8c:	00000080 00000000 00000000 00000000     ................
	...

2002bdcc <K>:
2002bdcc:	428a2f98 71374491 b5c0fbcf e9b5dba5     ./.B.D7q........
2002bddc:	3956c25b 59f111f1 923f82a4 ab1c5ed5     [.V9...Y..?..^..
2002bdec:	d807aa98 12835b01 243185be 550c7dc3     .....[....1$.}.U
2002bdfc:	72be5d74 80deb1fe 9bdc06a7 c19bf174     t].r........t...
2002be0c:	e49b69c1 efbe4786 0fc19dc6 240ca1cc     .i...G.........$
2002be1c:	2de92c6f 4a7484aa 5cb0a9dc 76f988da     o,.-..tJ...\...v
2002be2c:	983e5152 a831c66d b00327c8 bf597fc7     RQ>.m.1..'....Y.
2002be3c:	c6e00bf3 d5a79147 06ca6351 14292967     ....G...Qc..g)).
2002be4c:	27b70a85 2e1b2138 4d2c6dfc 53380d13     ...'8!...m,M..8S
2002be5c:	650a7354 766a0abb 81c2c92e 92722c85     Ts.e..jv.....,r.
2002be6c:	a2bfe8a1 a81a664b c24b8b70 c76c51a3     ....Kf..p.K..Ql.
2002be7c:	d192e819 d6990624 f40e3585 106aa070     ....$....5..p.j.
2002be8c:	19a4c116 1e376c08 2748774c 34b0bcb5     .....l7.LwH'...4
2002be9c:	391c0cb3 4ed8aa4a 5b9cca4f 682e6ff3     ...9J..NO..[.o.h
2002beac:	748f82ee 78a5636f 84c87814 8cc70208     ...toc.x.x......
2002bebc:	90befffa a4506ceb bef9a3f7 c67178f2     .....lP......xq.

2002becc <sha512_padding>:
2002becc:	00000080 00000000 00000000 00000000     ................
	...

2002bf50 <K>:
2002bf50:	d728ae22 428a2f98 23ef65cd 71374491     ".(../.B.e.#.D7q
2002bf60:	ec4d3b2f b5c0fbcf 8189dbbc e9b5dba5     /;M.............
2002bf70:	f348b538 3956c25b b605d019 59f111f1     8.H.[.V9.......Y
2002bf80:	af194f9b 923f82a4 da6d8118 ab1c5ed5     .O....?...m..^..
2002bf90:	a3030242 d807aa98 45706fbe 12835b01     B........opE.[..
2002bfa0:	4ee4b28c 243185be d5ffb4e2 550c7dc3     ...N..1$.....}.U
2002bfb0:	f27b896f 72be5d74 3b1696b1 80deb1fe     o.{.t].r...;....
2002bfc0:	25c71235 9bdc06a7 cf692694 c19bf174     5..%.....&i.t...
2002bfd0:	9ef14ad2 e49b69c1 384f25e3 efbe4786     .J...i...%O8.G..
2002bfe0:	8b8cd5b5 0fc19dc6 77ac9c65 240ca1cc     ........e..w...$
2002bff0:	592b0275 2de92c6f 6ea6e483 4a7484aa     u.+Yo,.-...n..tJ
2002c000:	bd41fbd4 5cb0a9dc 831153b5 76f988da     ..A....\.S.....v
2002c010:	ee66dfab 983e5152 2db43210 a831c66d     ..f.RQ>..2.-m.1.
2002c020:	98fb213f b00327c8 beef0ee4 bf597fc7     ?!...'........Y.
2002c030:	3da88fc2 c6e00bf3 930aa725 d5a79147     ...=....%...G...
2002c040:	e003826f 06ca6351 0a0e6e70 14292967     o...Qc..pn..g)).
2002c050:	46d22ffc 27b70a85 5c26c926 2e1b2138     ./.F...'&.&\8!..
2002c060:	5ac42aed 4d2c6dfc 9d95b3df 53380d13     .*.Z.m,M......8S
2002c070:	8baf63de 650a7354 3c77b2a8 766a0abb     .c..Ts.e..w<..jv
2002c080:	47edaee6 81c2c92e 1482353b 92722c85     ...G....;5...,r.
2002c090:	4cf10364 a2bfe8a1 bc423001 a81a664b     d..L.....0B.Kf..
2002c0a0:	d0f89791 c24b8b70 0654be30 c76c51a3     ....p.K.0.T..Ql.
2002c0b0:	d6ef5218 d192e819 5565a910 d6990624     .R........eU$...
2002c0c0:	5771202a f40e3585 32bbd1b8 106aa070     * qW.5.....2p.j.
2002c0d0:	b8d2d0c8 19a4c116 5141ab53 1e376c08     ........S.AQ.l7.
2002c0e0:	df8eeb99 2748774c e19b48a8 34b0bcb5     ....LwH'.H.....4
2002c0f0:	c5c95a63 391c0cb3 e3418acb 4ed8aa4a     cZ.....9..A.J..N
2002c100:	7763e373 5b9cca4f d6b2b8a3 682e6ff3     s.cwO..[.....o.h
2002c110:	5defb2fc 748f82ee 43172f60 78a5636f     ...]...t`/.Coc.x
2002c120:	a1f0ab72 84c87814 1a6439ec 8cc70208     r....x...9d.....
2002c130:	23631e28 90befffa de82bde9 a4506ceb     (.c#.........lP.
2002c140:	b2c67915 bef9a3f7 e372532b c67178f2     .y......+Sr..xq.
2002c150:	ea26619c ca273ece 21c0c207 d186b8c7     .a&..>'....!....
2002c160:	cde0eb1e eada7dd6 ee6ed178 f57d4f7f     .....}..x.n..O}.
2002c170:	72176fba 06f067aa a2c898a6 0a637dc5     .o.r.g.......}c.
2002c180:	bef90dae 113f9804 131c471b 1b710b35     ......?..G..5.q.
2002c190:	23047d84 28db77f5 40c72493 32caab7b     .}.#.w.(.$.@{..2
2002c1a0:	15c9bebc 3c9ebe0a 9c100d4c 431d67c4     .......<L....g.C
2002c1b0:	cb3e42b6 4cc5d4be fc657e2a 597f299c     .B>....L*~e..).Y
2002c1c0:	3ad6faec 5fcb6fab 4a475817 6c44198c     ...:.o._.XGJ..Dl

2002c1d0 <oid_md_alg>:
2002c1d0:	2002ae97 00000009 2002aea1 2002afaa     ... ....... ... 
2002c1e0:	00000005 2002aeab 00000009 2002aeb5     ....... ....... 
2002c1f0:	2002afdd 00000006 2002aebf 00000009     ... ....... ....
2002c200:	2002aec9 2002b010 00000007 2002aed3     ... ... ....... 
2002c210:	00000009 2002aedd 2002b043 00000008     ....... C.. ....
	...

2002c234 <oid_pk_alg>:
2002c234:	2002af1f 00000009 2002af29 2002af37     ... ....).. 7.. 
2002c244:	00000001 2002af3b 00000007 2002af43     ....;.. ....C.. 
2002c254:	2002af52 00000002 2002af61 00000005     R.. ....a.. ....
2002c264:	2002af67 2002af6f 00000003 00000000     g.. o.. ........
	...

2002c284 <mbedtls_rsa_info>:
2002c284:	00000001 2002af37 20029537 2002952b     ....7.. 7.. +.. 
2002c294:	20029611 200295ed 200295c1 20029591     ... ... ... ... 
2002c2a4:	2002958d 20029573 20029561 2002953d     ... s.. a.. =.. 

2002c2b4 <_init>:
2002c2b4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
2002c2b6:	bf00      	nop
2002c2b8:	bcf8      	pop	{r3, r4, r5, r6, r7}
2002c2ba:	bc08      	pop	{r3}
2002c2bc:	469e      	mov	lr, r3
2002c2be:	4770      	bx	lr

2002c2c0 <_fini>:
2002c2c0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
2002c2c2:	bf00      	nop
2002c2c4:	bcf8      	pop	{r3, r4, r5, r6, r7}
2002c2c6:	bc08      	pop	{r3}
2002c2c8:	469e      	mov	lr, r3
2002c2ca:	4770      	bx	lr

2002c2cc <__EH_FRAME_BEGIN__>:
2002c2cc:	0000 0000                                   ....

Disassembly of section .l1_ret_text_HAL_Set_backup:

2002c2d0 <HAL_Set_backup>:
2002c2d0:	4b01      	ldr	r3, [pc, #4]	@ (2002c2d8 <HAL_Set_backup+0x8>)
2002c2d2:	f843 1020 	str.w	r1, [r3, r0, lsl #2]
2002c2d6:	4770      	bx	lr
2002c2d8:	500cb030 	.word	0x500cb030

Disassembly of section .l1_ret_text_HAL_Get_backup:

2002c2dc <HAL_Get_backup>:
2002c2dc:	4b01      	ldr	r3, [pc, #4]	@ (2002c2e4 <HAL_Get_backup+0x8>)
2002c2de:	f853 0020 	ldr.w	r0, [r3, r0, lsl #2]
2002c2e2:	4770      	bx	lr
2002c2e4:	500cb030 	.word	0x500cb030

Disassembly of section .l1_ret_text_HAL_PMU_ConfigPeriLdo:

2002c2e8 <HAL_PMU_ConfigPeriLdo>:
2002c2e8:	b538      	push	{r3, r4, r5, lr}
2002c2ea:	b150      	cbz	r0, 2002c302 <HAL_PMU_ConfigPeriLdo+0x1a>
2002c2ec:	4c18      	ldr	r4, [pc, #96]	@ (2002c350 <HAL_PMU_ConfigPeriLdo+0x68>)
2002c2ee:	6863      	ldr	r3, [r4, #4]
2002c2f0:	b2db      	uxtb	r3, r3
2002c2f2:	2b07      	cmp	r3, #7
2002c2f4:	d101      	bne.n	2002c2fa <HAL_PMU_ConfigPeriLdo+0x12>
2002c2f6:	2000      	movs	r0, #0
2002c2f8:	bd38      	pop	{r3, r4, r5, pc}
2002c2fa:	6863      	ldr	r3, [r4, #4]
2002c2fc:	b2db      	uxtb	r3, r3
2002c2fe:	2b0f      	cmp	r3, #15
2002c300:	d0f9      	beq.n	2002c2f6 <HAL_PMU_ConfigPeriLdo+0xe>
2002c302:	4c13      	ldr	r4, [pc, #76]	@ (2002c350 <HAL_PMU_ConfigPeriLdo+0x68>)
2002c304:	6863      	ldr	r3, [r4, #4]
2002c306:	b2db      	uxtb	r3, r3
2002c308:	2b07      	cmp	r3, #7
2002c30a:	d0f4      	beq.n	2002c2f6 <HAL_PMU_ConfigPeriLdo+0xe>
2002c30c:	6863      	ldr	r3, [r4, #4]
2002c30e:	b2db      	uxtb	r3, r3
2002c310:	2b0f      	cmp	r3, #15
2002c312:	d0f0      	beq.n	2002c2f6 <HAL_PMU_ConfigPeriLdo+0xe>
2002c314:	2810      	cmp	r0, #16
2002c316:	d818      	bhi.n	2002c34a <HAL_PMU_ConfigPeriLdo+0x62>
2002c318:	4b0e      	ldr	r3, [pc, #56]	@ (2002c354 <HAL_PMU_ConfigPeriLdo+0x6c>)
2002c31a:	40c3      	lsrs	r3, r0
2002c31c:	07db      	lsls	r3, r3, #31
2002c31e:	d514      	bpl.n	2002c34a <HAL_PMU_ConfigPeriLdo+0x62>
2002c320:	2900      	cmp	r1, #0
2002c322:	f04f 0421 	mov.w	r4, #33	@ 0x21
2002c326:	bf0c      	ite	eq
2002c328:	2120      	moveq	r1, #32
2002c32a:	2101      	movne	r1, #1
2002c32c:	4d0a      	ldr	r5, [pc, #40]	@ (2002c358 <HAL_PMU_ConfigPeriLdo+0x70>)
2002c32e:	4084      	lsls	r4, r0
2002c330:	6deb      	ldr	r3, [r5, #92]	@ 0x5c
2002c332:	4081      	lsls	r1, r0
2002c334:	ea23 0304 	bic.w	r3, r3, r4
2002c338:	430b      	orrs	r3, r1
2002c33a:	65eb      	str	r3, [r5, #92]	@ 0x5c
2002c33c:	2a00      	cmp	r2, #0
2002c33e:	d0da      	beq.n	2002c2f6 <HAL_PMU_ConfigPeriLdo+0xe>
2002c340:	f241 3088 	movw	r0, #5000	@ 0x1388
2002c344:	f7f5 fe0f 	bl	20021f66 <HAL_Delay_us>
2002c348:	e7d5      	b.n	2002c2f6 <HAL_PMU_ConfigPeriLdo+0xe>
2002c34a:	2001      	movs	r0, #1
2002c34c:	e7d4      	b.n	2002c2f8 <HAL_PMU_ConfigPeriLdo+0x10>
2002c34e:	bf00      	nop
2002c350:	5000b000 	.word	0x5000b000
2002c354:	00010101 	.word	0x00010101
2002c358:	500ca000 	.word	0x500ca000

Disassembly of section .l1_ret_text_HAL_PMU_Reboot:

2002c35c <HAL_PMU_Reboot>:
2002c35c:	b538      	push	{r3, r4, r5, lr}
2002c35e:	f3ef 8310 	mrs	r3, PRIMASK
2002c362:	2501      	movs	r5, #1
2002c364:	f385 8810 	msr	PRIMASK, r5
2002c368:	2002      	movs	r0, #2
2002c36a:	f7f6 fb0d 	bl	20022988 <HAL_HPAON_WakeCore>
2002c36e:	4628      	mov	r0, r5
2002c370:	f7f8 ff1a 	bl	200251a8 <HAL_RCC_Reset_and_Halt_LCPU>
2002c374:	462a      	mov	r2, r5
2002c376:	2100      	movs	r1, #0
2002c378:	2008      	movs	r0, #8
2002c37a:	f7ff ffb5 	bl	2002c2e8 <HAL_PMU_ConfigPeriLdo>
2002c37e:	f44f 50fa 	mov.w	r0, #8000	@ 0x1f40
2002c382:	f7f5 fd91 	bl	20021ea8 <HAL_Delay_us_>
2002c386:	2000      	movs	r0, #0
2002c388:	f7f8 fd0e 	bl	20024da8 <HAL_RCC_HCPU_GetClockSrc>
2002c38c:	4604      	mov	r4, r0
2002c38e:	b928      	cbnz	r0, 2002c39c <HAL_PMU_Reboot+0x40>
2002c390:	f7f6 fb24 	bl	200229dc <HAL_HPAON_EnableXT48>
2002c394:	4629      	mov	r1, r5
2002c396:	4620      	mov	r0, r4
2002c398:	f7f8 fdce 	bl	20024f38 <HAL_RCC_HCPU_ClockSelect>
2002c39c:	4b10      	ldr	r3, [pc, #64]	@ (2002c3e0 <HAL_PMU_Reboot+0x84>)
2002c39e:	4c11      	ldr	r4, [pc, #68]	@ (2002c3e4 <HAL_PMU_Reboot+0x88>)
2002c3a0:	2000      	movs	r0, #0
2002c3a2:	6763      	str	r3, [r4, #116]	@ 0x74
2002c3a4:	f7ff ff9a 	bl	2002c2dc <HAL_Get_backup>
2002c3a8:	4601      	mov	r1, r0
2002c3aa:	f020 407f 	bic.w	r0, r0, #4278190080	@ 0xff000000
2002c3ae:	f020 000f 	bic.w	r0, r0, #15
2002c3b2:	b928      	cbnz	r0, 2002c3c0 <HAL_PMU_Reboot+0x64>
2002c3b4:	f441 41a0 	orr.w	r1, r1, #20480	@ 0x5000
2002c3b8:	f041 0150 	orr.w	r1, r1, #80	@ 0x50
2002c3bc:	f7ff ff88 	bl	2002c2d0 <HAL_Set_backup>
2002c3c0:	6823      	ldr	r3, [r4, #0]
2002c3c2:	075b      	lsls	r3, r3, #29
2002c3c4:	d506      	bpl.n	2002c3d4 <HAL_PMU_Reboot+0x78>
2002c3c6:	6823      	ldr	r3, [r4, #0]
2002c3c8:	4807      	ldr	r0, [pc, #28]	@ (2002c3e8 <HAL_PMU_Reboot+0x8c>)
2002c3ca:	f023 0304 	bic.w	r3, r3, #4
2002c3ce:	6023      	str	r3, [r4, #0]
2002c3d0:	f7f5 fdc9 	bl	20021f66 <HAL_Delay_us>
2002c3d4:	4a03      	ldr	r2, [pc, #12]	@ (2002c3e4 <HAL_PMU_Reboot+0x88>)
2002c3d6:	6813      	ldr	r3, [r2, #0]
2002c3d8:	f043 0304 	orr.w	r3, r3, #4
2002c3dc:	6013      	str	r3, [r2, #0]
2002c3de:	e7fe      	b.n	2002c3de <HAL_PMU_Reboot+0x82>
2002c3e0:	0a50c015 	.word	0x0a50c015
2002c3e4:	500ca000 	.word	0x500ca000
2002c3e8:	000186a0 	.word	0x000186a0

Disassembly of section .l1_ret_text_HAL_PMU_GetHpsysVoutRef:

2002c3ec <HAL_PMU_GetHpsysVoutRef>:
2002c3ec:	4b04      	ldr	r3, [pc, #16]	@ (2002c400 <HAL_PMU_GetHpsysVoutRef+0x14>)
2002c3ee:	781a      	ldrb	r2, [r3, #0]
2002c3f0:	b122      	cbz	r2, 2002c3fc <HAL_PMU_GetHpsysVoutRef+0x10>
2002c3f2:	b118      	cbz	r0, 2002c3fc <HAL_PMU_GetHpsysVoutRef+0x10>
2002c3f4:	78db      	ldrb	r3, [r3, #3]
2002c3f6:	7003      	strb	r3, [r0, #0]
2002c3f8:	2000      	movs	r0, #0
2002c3fa:	4770      	bx	lr
2002c3fc:	2001      	movs	r0, #1
2002c3fe:	4770      	bx	lr
2002c400:	2004cbcc 	.word	0x2004cbcc

Disassembly of section .l1_ret_text_HAL_PMU_GetHpsysVoutRef2:

2002c404 <HAL_PMU_GetHpsysVoutRef2>:
2002c404:	4b04      	ldr	r3, [pc, #16]	@ (2002c418 <HAL_PMU_GetHpsysVoutRef2+0x14>)
2002c406:	781a      	ldrb	r2, [r3, #0]
2002c408:	b122      	cbz	r2, 2002c414 <HAL_PMU_GetHpsysVoutRef2+0x10>
2002c40a:	b118      	cbz	r0, 2002c414 <HAL_PMU_GetHpsysVoutRef2+0x10>
2002c40c:	7b5b      	ldrb	r3, [r3, #13]
2002c40e:	7003      	strb	r3, [r0, #0]
2002c410:	2000      	movs	r0, #0
2002c412:	4770      	bx	lr
2002c414:	2001      	movs	r0, #1
2002c416:	4770      	bx	lr
2002c418:	2004cbcc 	.word	0x2004cbcc
