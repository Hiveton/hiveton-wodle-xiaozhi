
build_sf32lb52-lcd_n16r8_hcpu/lcpu/lcpu.elf:     file format elf32-littlearm


Disassembly of section .text:

00400000 <__Vectors>:
  400000:	20401a68 	.word	0x20401a68
  400004:	00400d41 	.word	0x00400d41
  400008:	00400891 	.word	0x00400891
  40000c:	000008a9 	.word	0x000008a9
  400010:	000008e5 	.word	0x000008e5
  400014:	00400d8b 	.word	0x00400d8b
  400018:	00400d8b 	.word	0x00400d8b
  40001c:	00400d8b 	.word	0x00400d8b
	...
  40002c:	00400d8b 	.word	0x00400d8b
  400030:	00400d8b 	.word	0x00400d8b
  400034:	00000000 	.word	0x00000000
  400038:	0000080d 	.word	0x0000080d
  40003c:	00400e69 	.word	0x00400e69
  400040:	004004b1 	.word	0x004004b1
  400044:	00004fa1 	.word	0x00004fa1
  400048:	00400d8b 	.word	0x00400d8b
  40004c:	00400d8b 	.word	0x00400d8b
  400050:	00400d8b 	.word	0x00400d8b
  400054:	00400d8b 	.word	0x00400d8b
  400058:	00400d8b 	.word	0x00400d8b
  40005c:	00400d8b 	.word	0x00400d8b
  400060:	00400d8b 	.word	0x00400d8b
  400064:	00400d8b 	.word	0x00400d8b
  400068:	00400d8b 	.word	0x00400d8b
  40006c:	00007361 	.word	0x00007361
  400070:	00400d8b 	.word	0x00400d8b
  400074:	00400d8b 	.word	0x00400d8b
  400078:	00400d8b 	.word	0x00400d8b
  40007c:	00005901 	.word	0x00005901
  400080:	00400d8b 	.word	0x00400d8b
  400084:	00400d8b 	.word	0x00400d8b
  400088:	0040075d 	.word	0x0040075d
  40008c:	00400d8b 	.word	0x00400d8b
  400090:	00400d8b 	.word	0x00400d8b
  400094:	00400d8b 	.word	0x00400d8b
  400098:	00400d8b 	.word	0x00400d8b
  40009c:	00400249 	.word	0x00400249
  4000a0:	00400d8b 	.word	0x00400d8b
  4000a4:	00400d8b 	.word	0x00400d8b
  4000a8:	00400d8b 	.word	0x00400d8b
  4000ac:	00400d8b 	.word	0x00400d8b
  4000b0:	00400d8b 	.word	0x00400d8b
  4000b4:	00400d8b 	.word	0x00400d8b
  4000b8:	00400d8b 	.word	0x00400d8b
  4000bc:	00400d8b 	.word	0x00400d8b
	...

00400100 <deregister_tm_clones>:
  400100:	4803      	ldr	r0, [pc, #12]	@ (400110 <deregister_tm_clones+0x10>)
  400102:	4b04      	ldr	r3, [pc, #16]	@ (400114 <deregister_tm_clones+0x14>)
  400104:	4283      	cmp	r3, r0
  400106:	d002      	beq.n	40010e <deregister_tm_clones+0xe>
  400108:	4b03      	ldr	r3, [pc, #12]	@ (400118 <deregister_tm_clones+0x18>)
  40010a:	b103      	cbz	r3, 40010e <deregister_tm_clones+0xe>
  40010c:	4718      	bx	r3
  40010e:	4770      	bx	lr
  400110:	20401668 	.word	0x20401668
  400114:	20401668 	.word	0x20401668
  400118:	00000000 	.word	0x00000000

0040011c <register_tm_clones>:
  40011c:	4b06      	ldr	r3, [pc, #24]	@ (400138 <register_tm_clones+0x1c>)
  40011e:	4907      	ldr	r1, [pc, #28]	@ (40013c <register_tm_clones+0x20>)
  400120:	1ac9      	subs	r1, r1, r3
  400122:	1089      	asrs	r1, r1, #2
  400124:	bf48      	it	mi
  400126:	3101      	addmi	r1, #1
  400128:	1049      	asrs	r1, r1, #1
  40012a:	d003      	beq.n	400134 <register_tm_clones+0x18>
  40012c:	4b04      	ldr	r3, [pc, #16]	@ (400140 <register_tm_clones+0x24>)
  40012e:	b10b      	cbz	r3, 400134 <register_tm_clones+0x18>
  400130:	4801      	ldr	r0, [pc, #4]	@ (400138 <register_tm_clones+0x1c>)
  400132:	4718      	bx	r3
  400134:	4770      	bx	lr
  400136:	bf00      	nop
  400138:	20401668 	.word	0x20401668
  40013c:	20401668 	.word	0x20401668
  400140:	00000000 	.word	0x00000000

00400144 <__do_global_dtors_aux>:
  400144:	b510      	push	{r4, lr}
  400146:	4c06      	ldr	r4, [pc, #24]	@ (400160 <__do_global_dtors_aux+0x1c>)
  400148:	7823      	ldrb	r3, [r4, #0]
  40014a:	b943      	cbnz	r3, 40015e <__do_global_dtors_aux+0x1a>
  40014c:	f7ff ffd8 	bl	400100 <deregister_tm_clones>
  400150:	4b04      	ldr	r3, [pc, #16]	@ (400164 <__do_global_dtors_aux+0x20>)
  400152:	b113      	cbz	r3, 40015a <__do_global_dtors_aux+0x16>
  400154:	4804      	ldr	r0, [pc, #16]	@ (400168 <__do_global_dtors_aux+0x24>)
  400156:	f3af 8000 	nop.w
  40015a:	2301      	movs	r3, #1
  40015c:	7023      	strb	r3, [r4, #0]
  40015e:	bd10      	pop	{r4, pc}
  400160:	20401a68 	.word	0x20401a68
  400164:	00000000 	.word	0x00000000
  400168:	00401610 	.word	0x00401610

0040016c <frame_dummy>:
  40016c:	b508      	push	{r3, lr}
  40016e:	4b05      	ldr	r3, [pc, #20]	@ (400184 <frame_dummy+0x18>)
  400170:	b11b      	cbz	r3, 40017a <frame_dummy+0xe>
  400172:	4905      	ldr	r1, [pc, #20]	@ (400188 <frame_dummy+0x1c>)
  400174:	4805      	ldr	r0, [pc, #20]	@ (40018c <frame_dummy+0x20>)
  400176:	f3af 8000 	nop.w
  40017a:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
  40017e:	f7ff bfcd 	b.w	40011c <register_tm_clones>
  400182:	bf00      	nop
  400184:	00000000 	.word	0x00000000
  400188:	20401a6c 	.word	0x20401a6c
  40018c:	00401610 	.word	0x00401610

00400190 <HAL_MspInit>:
  400190:	4770      	bx	lr

00400192 <SystemClock_Config>:
  400192:	4770      	bx	lr

00400194 <rc10k_cal_hook_func>:
  400194:	b537      	push	{r0, r1, r2, r4, r5, lr}
  400196:	f640 32b8 	movw	r2, #3000	@ 0xbb8
  40019a:	4b08      	ldr	r3, [pc, #32]	@ (4001bc <rc10k_cal_hook_func+0x28>)
  40019c:	4c08      	ldr	r4, [pc, #32]	@ (4001c0 <rc10k_cal_hook_func+0x2c>)
  40019e:	6c9d      	ldr	r5, [r3, #72]	@ 0x48
  4001a0:	6823      	ldr	r3, [r4, #0]
  4001a2:	1aeb      	subs	r3, r5, r3
  4001a4:	4293      	cmp	r3, r2
  4001a6:	d906      	bls.n	4001b6 <rc10k_cal_hook_func+0x22>
  4001a8:	f000 fbc4 	bl	400934 <HAL_RC_CAL_GetLPCycle_ex>
  4001ac:	a901      	add	r1, sp, #4
  4001ae:	f000 fbd1 	bl	400954 <HAL_RC_CALget_curr_cycle_on_48M>
  4001b2:	b900      	cbnz	r0, 4001b6 <rc10k_cal_hook_func+0x22>
  4001b4:	6025      	str	r5, [r4, #0]
  4001b6:	b003      	add	sp, #12
  4001b8:	bd30      	pop	{r4, r5, pc}
  4001ba:	bf00      	nop
  4001bc:	40040000 	.word	0x40040000
  4001c0:	20401a84 	.word	0x20401a84

004001c4 <rc10k_cal_init>:
  4001c4:	b507      	push	{r0, r1, r2, lr}
  4001c6:	4b0b      	ldr	r3, [pc, #44]	@ (4001f4 <rc10k_cal_init+0x30>)
  4001c8:	f893 30db 	ldrb.w	r3, [r3, #219]	@ 0xdb
  4001cc:	b173      	cbz	r3, 4001ec <rc10k_cal_init+0x28>
  4001ce:	4b0a      	ldr	r3, [pc, #40]	@ (4001f8 <rc10k_cal_init+0x34>)
  4001d0:	480a      	ldr	r0, [pc, #40]	@ (4001fc <rc10k_cal_init+0x38>)
  4001d2:	6c9a      	ldr	r2, [r3, #72]	@ 0x48
  4001d4:	4b0a      	ldr	r3, [pc, #40]	@ (400200 <rc10k_cal_init+0x3c>)
  4001d6:	601a      	str	r2, [r3, #0]
  4001d8:	f455 fd92 	bl	55d00 <rt_thread_idle_sethook>
  4001dc:	2014      	movs	r0, #20
  4001de:	f000 fbaf 	bl	400940 <HAL_RC_CAL_SetLPCycle_ex>
  4001e2:	f000 fba7 	bl	400934 <HAL_RC_CAL_GetLPCycle_ex>
  4001e6:	a901      	add	r1, sp, #4
  4001e8:	f000 fbb4 	bl	400954 <HAL_RC_CALget_curr_cycle_on_48M>
  4001ec:	2000      	movs	r0, #0
  4001ee:	b003      	add	sp, #12
  4001f0:	f85d fb04 	ldr.w	pc, [sp], #4
  4001f4:	2040fd00 	.word	0x2040fd00
  4001f8:	40040000 	.word	0x40040000
  4001fc:	00400195 	.word	0x00400195
  400200:	20401a84 	.word	0x20401a84

00400204 <main>:
  400204:	2000      	movs	r0, #0
  400206:	4770      	bx	lr

00400208 <hcpu2lcpu_notification_callback>:
  400208:	2907      	cmp	r1, #7
  40020a:	b510      	push	{r4, lr}
  40020c:	460c      	mov	r4, r1
  40020e:	d904      	bls.n	40021a <hcpu2lcpu_notification_callback+0x12>
  400210:	2234      	movs	r2, #52	@ 0x34
  400212:	490a      	ldr	r1, [pc, #40]	@ (40023c <hcpu2lcpu_notification_callback+0x34>)
  400214:	480a      	ldr	r0, [pc, #40]	@ (400240 <hcpu2lcpu_notification_callback+0x38>)
  400216:	f451 f8a1 	bl	5135c <rt_assert_handler>
  40021a:	4b0a      	ldr	r3, [pc, #40]	@ (400244 <hcpu2lcpu_notification_callback+0x3c>)
  40021c:	6a5a      	ldr	r2, [r3, #36]	@ 0x24
  40021e:	40e2      	lsrs	r2, r4
  400220:	07d2      	lsls	r2, r2, #31
  400222:	d503      	bpl.n	40022c <hcpu2lcpu_notification_callback+0x24>
  400224:	b91c      	cbnz	r4, 40022e <hcpu2lcpu_notification_callback+0x26>
  400226:	6a98      	ldr	r0, [r3, #40]	@ 0x28
  400228:	f416 fa8a 	bl	16740 <ipc_queue_data_ind_rom>
  40022c:	bd10      	pop	{r4, pc}
  40022e:	eb03 0384 	add.w	r3, r3, r4, lsl #2
  400232:	6a98      	ldr	r0, [r3, #40]	@ 0x28
  400234:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
  400238:	f416 ba66 	b.w	16708 <ipc_queue_data_ind>
  40023c:	00401423 	.word	0x00401423
  400240:	00401284 	.word	0x00401284
  400244:	2040e498 	.word	0x2040e498

00400248 <HCPU2LCPU_IRQHandler>:
  400248:	b508      	push	{r3, lr}
  40024a:	f452 fc05 	bl	52a58 <rt_interrupt_enter>
  40024e:	4803      	ldr	r0, [pc, #12]	@ (40025c <HCPU2LCPU_IRQHandler+0x14>)
  400250:	f000 fc3d 	bl	400ace <HAL_MAILBOX_IRQHandler>
  400254:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
  400258:	f452 bc16 	b.w	52a88 <rt_interrupt_leave>
  40025c:	2040162c 	.word	0x2040162c

00400260 <sys_init_debug_trigger>:
  400260:	b508      	push	{r3, lr}
  400262:	4a06      	ldr	r2, [pc, #24]	@ (40027c <sys_init_debug_trigger+0x1c>)
  400264:	4806      	ldr	r0, [pc, #24]	@ (400280 <sys_init_debug_trigger+0x20>)
  400266:	6913      	ldr	r3, [r2, #16]
  400268:	f043 5300 	orr.w	r3, r3, #536870912	@ 0x20000000
  40026c:	6113      	str	r3, [r2, #16]
  40026e:	f451 f893 	bl	51398 <rt_assert_set_hook>
  400272:	4804      	ldr	r0, [pc, #16]	@ (400284 <sys_init_debug_trigger+0x24>)
  400274:	f452 f9cc 	bl	52610 <rt_hw_exception_install>
  400278:	2000      	movs	r0, #0
  40027a:	bd08      	pop	{r3, pc}
  40027c:	4000f000 	.word	0x4000f000
  400280:	004002a9 	.word	0x004002a9
  400284:	00400289 	.word	0x00400289

00400288 <exception_handler>:
  400288:	b510      	push	{r4, lr}
  40028a:	4c06      	ldr	r4, [pc, #24]	@ (4002a4 <exception_handler+0x1c>)
  40028c:	6923      	ldr	r3, [r4, #16]
  40028e:	005b      	lsls	r3, r3, #1
  400290:	d406      	bmi.n	4002a0 <exception_handler+0x18>
  400292:	2001      	movs	r0, #1
  400294:	f401 feae 	bl	1ff4 <HAL_LPAON_WakeCore>
  400298:	6923      	ldr	r3, [r4, #16]
  40029a:	f043 5380 	orr.w	r3, r3, #268435456	@ 0x10000000
  40029e:	6123      	str	r3, [r4, #16]
  4002a0:	2001      	movs	r0, #1
  4002a2:	bd10      	pop	{r4, pc}
  4002a4:	4000f000 	.word	0x4000f000

004002a8 <assert_hook>:
  4002a8:	b510      	push	{r4, lr}
  4002aa:	4c08      	ldr	r4, [pc, #32]	@ (4002cc <assert_hook+0x24>)
  4002ac:	6923      	ldr	r3, [r4, #16]
  4002ae:	005b      	lsls	r3, r3, #1
  4002b0:	d40a      	bmi.n	4002c8 <assert_hook+0x20>
  4002b2:	2001      	movs	r0, #1
  4002b4:	f401 fe9e 	bl	1ff4 <HAL_LPAON_WakeCore>
  4002b8:	6923      	ldr	r3, [r4, #16]
  4002ba:	f043 5380 	orr.w	r3, r3, #268435456	@ 0x10000000
  4002be:	6123      	str	r3, [r4, #16]
  4002c0:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
  4002c4:	f000 bfa8 	b.w	401218 <rt_hw_fatal_error>
  4002c8:	bd10      	pop	{r4, pc}
  4002ca:	bf00      	nop
  4002cc:	4000f000 	.word	0x4000f000

004002d0 <DBG_Trigger_IRQHandler>:
  4002d0:	b508      	push	{r3, lr}
  4002d2:	f452 fbc1 	bl	52a58 <rt_interrupt_enter>
  4002d6:	f240 123b 	movw	r2, #315	@ 0x13b
  4002da:	4904      	ldr	r1, [pc, #16]	@ (4002ec <DBG_Trigger_IRQHandler+0x1c>)
  4002dc:	4804      	ldr	r0, [pc, #16]	@ (4002f0 <DBG_Trigger_IRQHandler+0x20>)
  4002de:	f451 f83d 	bl	5135c <rt_assert_handler>
  4002e2:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
  4002e6:	f452 bbcf 	b.w	52a88 <rt_interrupt_leave>
  4002ea:	bf00      	nop
  4002ec:	00401443 	.word	0x00401443
  4002f0:	0040129d 	.word	0x0040129d

004002f4 <sifli_exit_idle>:
  4002f4:	4770      	bx	lr

004002f6 <sifli_resume>:
  4002f6:	4770      	bx	lr

004002f8 <sifli_suspend>:
  4002f8:	2901      	cmp	r1, #1
  4002fa:	b508      	push	{r3, lr}
  4002fc:	d801      	bhi.n	400302 <sifli_suspend+0xa>
  4002fe:	2000      	movs	r0, #0
  400300:	bd08      	pop	{r3, pc}
  400302:	f416 f9bb 	bl	1667c <ipc_queue_check_idle>
  400306:	b908      	cbnz	r0, 40030c <sifli_suspend+0x14>
  400308:	2007      	movs	r0, #7
  40030a:	e7f9      	b.n	400300 <sifli_suspend+0x8>
  40030c:	f416 f9d4 	bl	166b8 <ipc_queue_check_idle_rom>
  400310:	2800      	cmp	r0, #0
  400312:	d0f9      	beq.n	400308 <sifli_suspend+0x10>
  400314:	4b02      	ldr	r3, [pc, #8]	@ (400320 <sifli_suspend+0x28>)
  400316:	6a5a      	ldr	r2, [r3, #36]	@ 0x24
  400318:	6a1b      	ldr	r3, [r3, #32]
  40031a:	421a      	tst	r2, r3
  40031c:	d0ef      	beq.n	4002fe <sifli_suspend+0x6>
  40031e:	e7f3      	b.n	400308 <sifli_suspend+0x10>
  400320:	40040000 	.word	0x40040000

00400324 <rt_application_init_power_on_mode>:
  400324:	4770      	bx	lr

00400326 <SystemPowerOnModeInit>:
  400326:	b508      	push	{r3, lr}
  400328:	f001 f8fc 	bl	401524 <SystemPowerOnInitLCPU>
  40032c:	bd08      	pop	{r3, pc}
	...

00400330 <SystemPowerOnModeGet>:
  400330:	4b01      	ldr	r3, [pc, #4]	@ (400338 <SystemPowerOnModeGet+0x8>)
  400332:	7818      	ldrb	r0, [r3, #0]
  400334:	4770      	bx	lr
  400336:	bf00      	nop
  400338:	2040fd54 	.word	0x2040fd54

0040033c <sifli_standby_handler>:
  40033c:	b510      	push	{r4, lr}
  40033e:	4c0f      	ldr	r4, [pc, #60]	@ (40037c <sifli_standby_handler+0x40>)
  400340:	6a23      	ldr	r3, [r4, #32]
  400342:	069a      	lsls	r2, r3, #26
  400344:	d406      	bmi.n	400354 <sifli_standby_handler+0x18>
  400346:	f45a fa59 	bl	5a7fc <sifli_standby_handler_core>
  40034a:	6a23      	ldr	r3, [r4, #32]
  40034c:	069b      	lsls	r3, r3, #26
  40034e:	d40b      	bmi.n	400368 <sifli_standby_handler+0x2c>
  400350:	2000      	movs	r0, #0
  400352:	bd10      	pop	{r4, pc}
  400354:	4b0a      	ldr	r3, [pc, #40]	@ (400380 <sifli_standby_handler+0x44>)
  400356:	2b00      	cmp	r3, #0
  400358:	d0f5      	beq.n	400346 <sifli_standby_handler+0xa>
  40035a:	f000 f955 	bl	400608 <ble_standby_sleep_pre_handler>
  40035e:	2800      	cmp	r0, #0
  400360:	d0f1      	beq.n	400346 <sifli_standby_handler+0xa>
  400362:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
  400366:	e7f4      	b.n	400352 <sifli_standby_handler+0x16>
  400368:	4c06      	ldr	r4, [pc, #24]	@ (400384 <sifli_standby_handler+0x48>)
  40036a:	6823      	ldr	r3, [r4, #0]
  40036c:	2b00      	cmp	r3, #0
  40036e:	d0ef      	beq.n	400350 <sifli_standby_handler+0x14>
  400370:	f000 f94c 	bl	40060c <ble_standby_sleep_after_handler>
  400374:	2300      	movs	r3, #0
  400376:	6023      	str	r3, [r4, #0]
  400378:	e7ea      	b.n	400350 <sifli_standby_handler+0x14>
  40037a:	bf00      	nop
  40037c:	40040000 	.word	0x40040000
  400380:	00400609 	.word	0x00400609
  400384:	20401af8 	.word	0x20401af8

00400388 <low_power_init>:
  400388:	b510      	push	{r4, lr}
  40038a:	2200      	movs	r2, #0
  40038c:	21fc      	movs	r1, #252	@ 0xfc
  40038e:	480c      	ldr	r0, [pc, #48]	@ (4003c0 <low_power_init+0x38>)
  400390:	f455 f938 	bl	55604 <rt_system_pm_init>
  400394:	2001      	movs	r0, #1
  400396:	490b      	ldr	r1, [pc, #44]	@ (4003c4 <low_power_init+0x3c>)
  400398:	f453 ff1c 	bl	541d4 <rt_pm_policy_register>
  40039c:	490a      	ldr	r1, [pc, #40]	@ (4003c8 <low_power_init+0x40>)
  40039e:	2000      	movs	r0, #0
  4003a0:	f453 fe36 	bl	54010 <rt_pm_device_register>
  4003a4:	f416 f866 	bl	16474 <init_default_wakeup_src>
  4003a8:	4b08      	ldr	r3, [pc, #32]	@ (4003cc <low_power_init+0x44>)
  4003aa:	4c09      	ldr	r4, [pc, #36]	@ (4003d0 <low_power_init+0x48>)
  4003ac:	6c9b      	ldr	r3, [r3, #72]	@ 0x48
  4003ae:	60a3      	str	r3, [r4, #8]
  4003b0:	f455 ff16 	bl	561e0 <rt_tick_get>
  4003b4:	2301      	movs	r3, #1
  4003b6:	60e0      	str	r0, [r4, #12]
  4003b8:	7023      	strb	r3, [r4, #0]
  4003ba:	2000      	movs	r0, #0
  4003bc:	bd10      	pop	{r4, pc}
  4003be:	bf00      	nop
  4003c0:	20401638 	.word	0x20401638
  4003c4:	00401478 	.word	0x00401478
  4003c8:	0040146c 	.word	0x0040146c
  4003cc:	40040000 	.word	0x40040000
  4003d0:	20401ad8 	.word	0x20401ad8

004003d4 <sifli_shutdown_handler>:
  4003d4:	4770      	bx	lr
	...

004003d8 <sifli_sleep>:
  4003d8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
  4003da:	4b2c      	ldr	r3, [pc, #176]	@ (40048c <sifli_sleep+0xb4>)
  4003dc:	6019      	str	r1, [r3, #0]
  4003de:	3902      	subs	r1, #2
  4003e0:	2903      	cmp	r1, #3
  4003e2:	d805      	bhi.n	4003f0 <sifli_sleep+0x18>
  4003e4:	e8df f001 	tbb	[pc, r1]
  4003e8:	0209414a 	.word	0x0209414a
  4003ec:	f7ff fff2 	bl	4003d4 <sifli_shutdown_handler>
  4003f0:	4b27      	ldr	r3, [pc, #156]	@ (400490 <sifli_sleep+0xb8>)
  4003f2:	6a5a      	ldr	r2, [r3, #36]	@ 0x24
  4003f4:	4b27      	ldr	r3, [pc, #156]	@ (400494 <sifli_sleep+0xbc>)
  4003f6:	601a      	str	r2, [r3, #0]
  4003f8:	e03f      	b.n	40047a <sifli_sleep+0xa2>
  4003fa:	2009      	movs	r0, #9
  4003fc:	f453 fc4c 	bl	53c98 <rt_object_get_information>
  400400:	4604      	mov	r4, r0
  400402:	6845      	ldr	r5, [r0, #4]
  400404:	1d07      	adds	r7, r0, #4
  400406:	42bd      	cmp	r5, r7
  400408:	d11d      	bne.n	400446 <sifli_sleep+0x6e>
  40040a:	4e21      	ldr	r6, [pc, #132]	@ (400490 <sifli_sleep+0xb8>)
  40040c:	f7ff ff96 	bl	40033c <sifli_standby_handler>
  400410:	6cb2      	ldr	r2, [r6, #72]	@ 0x48
  400412:	4b21      	ldr	r3, [pc, #132]	@ (400498 <sifli_sleep+0xc0>)
  400414:	4821      	ldr	r0, [pc, #132]	@ (40049c <sifli_sleep+0xc4>)
  400416:	619a      	str	r2, [r3, #24]
  400418:	f451 fc3c 	bl	51c94 <rt_device_find>
  40041c:	4605      	mov	r5, r0
  40041e:	b118      	cbz	r0, 400428 <sifli_sleep+0x50>
  400420:	2204      	movs	r2, #4
  400422:	2101      	movs	r1, #1
  400424:	f451 fbbc 	bl	51ba0 <rt_device_control>
  400428:	6c73      	ldr	r3, [r6, #68]	@ 0x44
  40042a:	481d      	ldr	r0, [pc, #116]	@ (4004a0 <sifli_sleep+0xc8>)
  40042c:	f023 0301 	bic.w	r3, r3, #1
  400430:	6473      	str	r3, [r6, #68]	@ 0x44
  400432:	f401 fc73 	bl	1d1c <HAL_GPIO_ClearInterrupt>
  400436:	6864      	ldr	r4, [r4, #4]
  400438:	42bc      	cmp	r4, r7
  40043a:	d10c      	bne.n	400456 <sifli_sleep+0x7e>
  40043c:	f416 fabe 	bl	169bc <ipc_queue_restore_all>
  400440:	f416 faf0 	bl	16a24 <ipc_queue_restore_all_rom>
  400444:	e7d4      	b.n	4003f0 <sifli_sleep+0x18>
  400446:	f1a5 000c 	sub.w	r0, r5, #12
  40044a:	2204      	movs	r2, #4
  40044c:	2102      	movs	r1, #2
  40044e:	f451 fba7 	bl	51ba0 <rt_device_control>
  400452:	682d      	ldr	r5, [r5, #0]
  400454:	e7d7      	b.n	400406 <sifli_sleep+0x2e>
  400456:	f1a4 000c 	sub.w	r0, r4, #12
  40045a:	4285      	cmp	r5, r0
  40045c:	d003      	beq.n	400466 <sifli_sleep+0x8e>
  40045e:	2204      	movs	r2, #4
  400460:	2101      	movs	r1, #1
  400462:	f451 fb9d 	bl	51ba0 <rt_device_control>
  400466:	6824      	ldr	r4, [r4, #0]
  400468:	e7e6      	b.n	400438 <sifli_sleep+0x60>
  40046a:	f45a f865 	bl	5a538 <sifli_deep_handler>
  40046e:	4b08      	ldr	r3, [pc, #32]	@ (400490 <sifli_sleep+0xb8>)
  400470:	2800      	cmp	r0, #0
  400472:	6c9a      	ldr	r2, [r3, #72]	@ 0x48
  400474:	4b08      	ldr	r3, [pc, #32]	@ (400498 <sifli_sleep+0xc0>)
  400476:	619a      	str	r2, [r3, #24]
  400478:	dbba      	blt.n	4003f0 <sifli_sleep+0x18>
  40047a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
  40047c:	f45a f8a8 	bl	5a5d0 <sifli_light_handler>
  400480:	4b03      	ldr	r3, [pc, #12]	@ (400490 <sifli_sleep+0xb8>)
  400482:	6c9a      	ldr	r2, [r3, #72]	@ 0x48
  400484:	4b04      	ldr	r3, [pc, #16]	@ (400498 <sifli_sleep+0xc0>)
  400486:	619a      	str	r2, [r3, #24]
  400488:	e7b2      	b.n	4003f0 <sifli_sleep+0x18>
  40048a:	bf00      	nop
  40048c:	2040e8c0 	.word	0x2040e8c0
  400490:	40040000 	.word	0x40040000
  400494:	2040fd58 	.word	0x2040fd58
  400498:	20401ad8 	.word	0x20401ad8
  40049c:	004012ad 	.word	0x004012ad
  4004a0:	40080000 	.word	0x40080000

004004a4 <pm_set_last_latch_tick>:
  4004a4:	4b01      	ldr	r3, [pc, #4]	@ (4004ac <pm_set_last_latch_tick+0x8>)
  4004a6:	60d8      	str	r0, [r3, #12]
  4004a8:	4770      	bx	lr
  4004aa:	bf00      	nop
  4004ac:	20401ad8 	.word	0x20401ad8

004004b0 <AON_IRQHandler>:
  4004b0:	b508      	push	{r3, lr}
  4004b2:	f452 fad1 	bl	52a58 <rt_interrupt_enter>
  4004b6:	f400 ff95 	bl	13e4 <AON_LCPU_IRQHandler>
  4004ba:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
  4004be:	f452 bae3 	b.w	52a88 <rt_interrupt_leave>
	...

004004c4 <bt_audiopath_init>:
  4004c4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
  4004c6:	4e12      	ldr	r6, [pc, #72]	@ (400510 <bt_audiopath_init+0x4c>)
  4004c8:	4b12      	ldr	r3, [pc, #72]	@ (400514 <bt_audiopath_init+0x50>)
  4004ca:	4c13      	ldr	r4, [pc, #76]	@ (400518 <bt_audiopath_init+0x54>)
  4004cc:	6033      	str	r3, [r6, #0]
  4004ce:	3320      	adds	r3, #32
  4004d0:	6023      	str	r3, [r4, #0]
  4004d2:	4a12      	ldr	r2, [pc, #72]	@ (40051c <bt_audiopath_init+0x58>)
  4004d4:	4b12      	ldr	r3, [pc, #72]	@ (400520 <bt_audiopath_init+0x5c>)
  4004d6:	4f13      	ldr	r7, [pc, #76]	@ (400524 <bt_audiopath_init+0x60>)
  4004d8:	601a      	str	r2, [r3, #0]
  4004da:	4b13      	ldr	r3, [pc, #76]	@ (400528 <bt_audiopath_init+0x64>)
  4004dc:	4d13      	ldr	r5, [pc, #76]	@ (40052c <bt_audiopath_init+0x68>)
  4004de:	603b      	str	r3, [r7, #0]
  4004e0:	f503 73e6 	add.w	r3, r3, #460	@ 0x1cc
  4004e4:	602b      	str	r3, [r5, #0]
  4004e6:	4b12      	ldr	r3, [pc, #72]	@ (400530 <bt_audiopath_init+0x6c>)
  4004e8:	f502 726b 	add.w	r2, r2, #940	@ 0x3ac
  4004ec:	4811      	ldr	r0, [pc, #68]	@ (400534 <bt_audiopath_init+0x70>)
  4004ee:	601a      	str	r2, [r3, #0]
  4004f0:	f405 faac 	bl	5a4c <bt_sco_data_handle_callback+0xd0>
  4004f4:	6839      	ldr	r1, [r7, #0]
  4004f6:	6830      	ldr	r0, [r6, #0]
  4004f8:	f44f 72e6 	mov.w	r2, #460	@ 0x1cc
  4004fc:	f454 fb7a 	bl	54bf4 <rt_ringbuffer_getchar+0x63>
  400500:	6820      	ldr	r0, [r4, #0]
  400502:	f44f 72e6 	mov.w	r2, #460	@ 0x1cc
  400506:	6829      	ldr	r1, [r5, #0]
  400508:	f454 fb74 	bl	54bf4 <rt_ringbuffer_getchar+0x63>
  40050c:	2000      	movs	r0, #0
  40050e:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
  400510:	2040e6e8 	.word	0x2040e6e8
  400514:	2040e000 	.word	0x2040e000
  400518:	2040e6ec 	.word	0x2040e6ec
  40051c:	2040e040 	.word	0x2040e040
  400520:	2040e6f0 	.word	0x2040e6f0
  400524:	2040e6f4 	.word	0x2040e6f4
  400528:	2040e050 	.word	0x2040e050
  40052c:	2040e6f8 	.word	0x2040e6f8
  400530:	2040e6fc 	.word	0x2040e6fc
  400534:	0000597d 	.word	0x0000597d

00400538 <patch_install>:
  400538:	4a04      	ldr	r2, [pc, #16]	@ (40054c <patch_install+0x14>)
  40053a:	4b05      	ldr	r3, [pc, #20]	@ (400550 <patch_install+0x18>)
  40053c:	601a      	str	r2, [r3, #0]
  40053e:	3a01      	subs	r2, #1
  400540:	6812      	ldr	r2, [r2, #0]
  400542:	b10a      	cbz	r2, 400548 <patch_install+0x10>
  400544:	681b      	ldr	r3, [r3, #0]
  400546:	4718      	bx	r3
  400548:	4770      	bx	lr
  40054a:	bf00      	nop
  40054c:	00406001 	.word	0x00406001
  400550:	20401afc 	.word	0x20401afc

00400554 <bluetooth_init>:
  400554:	b510      	push	{r4, lr}
  400556:	2001      	movs	r0, #1
  400558:	f000 f946 	bl	4007e8 <rf_ptc_config>
  40055c:	f451 ffcc 	bl	524f8 <rt_hw_ble_int_init>
  400560:	f401 fbf3 	bl	1d4a <HAL_GetLXTEnabled>
  400564:	b928      	cbnz	r0, 400572 <bluetooth_init+0x1e>
  400566:	f450 fe79 	bl	5125c <rom_config_set_default_sleep_mode+0x7>
  40056a:	f000 f9e3 	bl	400934 <HAL_RC_CAL_GetLPCycle_ex>
  40056e:	f450 fe69 	bl	51244 <rom_config_set_default_link_config+0xb>
  400572:	2003      	movs	r0, #3
  400574:	f450 fe76 	bl	51264 <rom_config_set_default_xtal_enabled+0x7>
  400578:	2400      	movs	r4, #0
  40057a:	230e      	movs	r3, #14
  40057c:	4a0c      	ldr	r2, [pc, #48]	@ (4005b0 <bluetooth_init+0x5c>)
  40057e:	490d      	ldr	r1, [pc, #52]	@ (4005b4 <bluetooth_init+0x60>)
  400580:	4610      	mov	r0, r2
  400582:	e9c2 4407 	strd	r4, r4, [r2, #28]
  400586:	7513      	strb	r3, [r2, #20]
  400588:	f453 fd42 	bl	54010 <rt_pm_device_register>
  40058c:	480a      	ldr	r0, [pc, #40]	@ (4005b8 <bluetooth_init+0x64>)
  40058e:	f455 fbb7 	bl	55d00 <rt_thread_idle_sethook>
  400592:	480a      	ldr	r0, [pc, #40]	@ (4005bc <bluetooth_init+0x68>)
  400594:	f453 fe1a 	bl	541cc <rt_pm_override_mode_select>
  400598:	f7ff ffce 	bl	400538 <patch_install>
  40059c:	f000 f8c2 	bl	400724 <bluetooth_config>
  4005a0:	f401 fefe 	bl	23a0 <HAL_RCC_SetMacFreq>
  4005a4:	4620      	mov	r0, r4
  4005a6:	f404 fcb9 	bl	4f1c <ble_aon_irq_handler+0x2b>
  4005aa:	4620      	mov	r0, r4
  4005ac:	bd10      	pop	{r4, pc}
  4005ae:	bf00      	nop
  4005b0:	20401b00 	.word	0x20401b00
  4005b4:	00401480 	.word	0x00401480
  4005b8:	00017955 	.word	0x00017955
  4005bc:	004005c1 	.word	0x004005c1

004005c0 <bluetooth_select_pm_mode>:
  4005c0:	3001      	adds	r0, #1
  4005c2:	b508      	push	{r3, lr}
  4005c4:	d001      	beq.n	4005ca <bluetooth_select_pm_mode+0xa>
  4005c6:	2001      	movs	r0, #1
  4005c8:	bd08      	pop	{r3, pc}
  4005ca:	f417 fbb9 	bl	17d40 <bluetooth_stack_suspend>
  4005ce:	2800      	cmp	r0, #0
  4005d0:	d1f9      	bne.n	4005c6 <bluetooth_select_pm_mode+0x6>
  4005d2:	2003      	movs	r0, #3
  4005d4:	e7f8      	b.n	4005c8 <bluetooth_select_pm_mode+0x8>
	...

004005d8 <bluetooth_pm_suspend>:
  4005d8:	b508      	push	{r3, lr}
  4005da:	4b09      	ldr	r3, [pc, #36]	@ (400600 <bluetooth_pm_suspend+0x28>)
  4005dc:	4602      	mov	r2, r0
  4005de:	6a18      	ldr	r0, [r3, #32]
  4005e0:	f010 0020 	ands.w	r0, r0, #32
  4005e4:	d006      	beq.n	4005f4 <bluetooth_pm_suspend+0x1c>
  4005e6:	4b07      	ldr	r3, [pc, #28]	@ (400604 <bluetooth_pm_suspend+0x2c>)
  4005e8:	429a      	cmp	r2, r3
  4005ea:	d104      	bne.n	4005f6 <bluetooth_pm_suspend+0x1e>
  4005ec:	2901      	cmp	r1, #1
  4005ee:	d904      	bls.n	4005fa <bluetooth_pm_suspend+0x22>
  4005f0:	f417 fba6 	bl	17d40 <bluetooth_stack_suspend>
  4005f4:	bd08      	pop	{r3, pc}
  4005f6:	2000      	movs	r0, #0
  4005f8:	e7fc      	b.n	4005f4 <bluetooth_pm_suspend+0x1c>
  4005fa:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
  4005fe:	e7f9      	b.n	4005f4 <bluetooth_pm_suspend+0x1c>
  400600:	40040000 	.word	0x40040000
  400604:	20401b00 	.word	0x20401b00

00400608 <ble_standby_sleep_pre_handler>:
  400608:	f404 bd2a 	b.w	5060 <ble_standby_sleep_after_handler_rom+0x4f>

0040060c <ble_standby_sleep_after_handler>:
  40060c:	b508      	push	{r3, lr}
  40060e:	f401 fec7 	bl	23a0 <HAL_RCC_SetMacFreq>
  400612:	f404 fcfd 	bl	5010 <ble_memory_config+0x18>
  400616:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
  40061a:	2000      	movs	r0, #0
  40061c:	f000 b8e4 	b.w	4007e8 <rf_ptc_config>

00400620 <rom_port_get>:
  400620:	b510      	push	{r4, lr}
  400622:	b148      	cbz	r0, 400638 <rom_port_get+0x18>
  400624:	2801      	cmp	r0, #1
  400626:	d009      	beq.n	40063c <rom_port_get+0x1c>
  400628:	f640 02d6 	movw	r2, #2262	@ 0x8d6
  40062c:	4904      	ldr	r1, [pc, #16]	@ (400640 <rom_port_get+0x20>)
  40062e:	4805      	ldr	r0, [pc, #20]	@ (400644 <rom_port_get+0x24>)
  400630:	f450 fe94 	bl	5135c <rt_assert_handler>
  400634:	4620      	mov	r0, r4
  400636:	bd10      	pop	{r4, pc}
  400638:	2402      	movs	r4, #2
  40063a:	e7fb      	b.n	400634 <rom_port_get+0x14>
  40063c:	2406      	movs	r4, #6
  40063e:	e7f9      	b.n	400634 <rom_port_get+0x14>
  400640:	00401498 	.word	0x00401498
  400644:	0040129d 	.word	0x0040129d

00400648 <act_config>:
  400648:	2206      	movs	r2, #6
  40064a:	b538      	push	{r3, r4, r5, lr}
  40064c:	4c0d      	ldr	r4, [pc, #52]	@ (400684 <act_config+0x3c>)
  40064e:	2302      	movs	r3, #2
  400650:	2501      	movs	r5, #1
  400652:	70a2      	strb	r2, [r4, #2]
  400654:	2203      	movs	r2, #3
  400656:	2004      	movs	r0, #4
  400658:	7023      	strb	r3, [r4, #0]
  40065a:	70e2      	strb	r2, [r4, #3]
  40065c:	7123      	strb	r3, [r4, #4]
  40065e:	7065      	strb	r5, [r4, #1]
  400660:	f450 fdba 	bl	511d8 <rom_config_em_memory+0x33>
  400664:	8843      	ldrh	r3, [r0, #2]
  400666:	2014      	movs	r0, #20
  400668:	3b02      	subs	r3, #2
  40066a:	71e3      	strb	r3, [r4, #7]
  40066c:	f450 fdb4 	bl	511d8 <rom_config_em_memory+0x33>
  400670:	8843      	ldrh	r3, [r0, #2]
  400672:	7165      	strb	r5, [r4, #5]
  400674:	3b02      	subs	r3, #2
  400676:	7223      	strb	r3, [r4, #8]
  400678:	71a5      	strb	r5, [r4, #6]
  40067a:	4620      	mov	r0, r4
  40067c:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
  400680:	f450 bdda 	b.w	51238 <rom_config_set_controller_enabled+0x7>
  400684:	2040ead4 	.word	0x2040ead4

00400688 <mem_config>:
  400688:	b500      	push	{lr}
  40068a:	4a16      	ldr	r2, [pc, #88]	@ (4006e4 <mem_config+0x5c>)
  40068c:	b091      	sub	sp, #68	@ 0x44
  40068e:	7953      	ldrb	r3, [r2, #5]
  400690:	7990      	ldrb	r0, [r2, #6]
  400692:	005b      	lsls	r3, r3, #1
  400694:	f003 0302 	and.w	r3, r3, #2
  400698:	f000 0001 	and.w	r0, r0, #1
  40069c:	4318      	orrs	r0, r3
  40069e:	f450 fdc7 	bl	51230 <rom_config_get_default_attribute_4_em+0x57>
  4006a2:	2228      	movs	r2, #40	@ 0x28
  4006a4:	2100      	movs	r1, #0
  4006a6:	a806      	add	r0, sp, #24
  4006a8:	f000 fde4 	bl	401274 <memset>
  4006ac:	f44f 7200 	mov.w	r2, #512	@ 0x200
  4006b0:	4b0d      	ldr	r3, [pc, #52]	@ (4006e8 <mem_config+0x60>)
  4006b2:	2106      	movs	r1, #6
  4006b4:	e9cd 3203 	strd	r3, r2, [sp, #12]
  4006b8:	2300      	movs	r3, #0
  4006ba:	e9cd 3101 	strd	r3, r1, [sp, #4]
  4006be:	f44f 7327 	mov.w	r3, #668	@ 0x29c
  4006c2:	2201      	movs	r2, #1
  4006c4:	f44f 5180 	mov.w	r1, #4096	@ 0x1000
  4006c8:	9300      	str	r3, [sp, #0]
  4006ca:	a806      	add	r0, sp, #24
  4006cc:	f44f 5300 	mov.w	r3, #8192	@ 0x2000
  4006d0:	f44f fefe 	bl	504d0 <mem_env_config>
  4006d4:	a806      	add	r0, sp, #24
  4006d6:	f404 fc8f 	bl	4ff8 <ble_memory_config>
  4006da:	f409 fb93 	bl	9e04 <em_config_customized>
  4006de:	b011      	add	sp, #68	@ 0x44
  4006e0:	f85d fb04 	ldr.w	pc, [sp], #4
  4006e4:	2040ead4 	.word	0x2040ead4
  4006e8:	2040fe00 	.word	0x2040fe00

004006ec <port_config>:
  4006ec:	b510      	push	{r4, lr}
  4006ee:	2000      	movs	r0, #0
  4006f0:	f7ff ff96 	bl	400620 <rom_port_get>
  4006f4:	4b08      	ldr	r3, [pc, #32]	@ (400718 <port_config+0x2c>)
  4006f6:	f853 3020 	ldr.w	r3, [r3, r0, lsl #2]
  4006fa:	4798      	blx	r3
  4006fc:	4604      	mov	r4, r0
  4006fe:	b928      	cbnz	r0, 40070c <port_config+0x20>
  400700:	f640 2249 	movw	r2, #2633	@ 0xa49
  400704:	4905      	ldr	r1, [pc, #20]	@ (40071c <port_config+0x30>)
  400706:	4806      	ldr	r0, [pc, #24]	@ (400720 <port_config+0x34>)
  400708:	f450 fe28 	bl	5135c <rt_assert_handler>
  40070c:	4620      	mov	r0, r4
  40070e:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
  400712:	2100      	movs	r1, #0
  400714:	f450 bdb8 	b.w	51288 <rom_config_set_swprofiling+0xb>
  400718:	0005fdcc 	.word	0x0005fdcc
  40071c:	0040148c 	.word	0x0040148c
  400720:	004012c2 	.word	0x004012c2

00400724 <bluetooth_config>:
  400724:	b508      	push	{r3, lr}
  400726:	f7ff ff8f 	bl	400648 <act_config>
  40072a:	f7ff ffad 	bl	400688 <mem_config>
  40072e:	f7ff ffdd 	bl	4006ec <port_config>
  400732:	bd08      	pop	{r3, pc}

00400734 <ptc_save_phase>:
  400734:	4b07      	ldr	r3, [pc, #28]	@ (400754 <ptc_save_phase+0x20>)
  400736:	f8d3 2098 	ldr.w	r2, [r3, #152]	@ 0x98
  40073a:	f3c2 030b 	ubfx	r3, r2, #0, #12
  40073e:	0512      	lsls	r2, r2, #20
  400740:	bf44      	itt	mi
  400742:	f483 637f 	eormi.w	r3, r3, #4080	@ 0xff0
  400746:	f083 030f 	eormi.w	r3, r3, #15
  40074a:	b113      	cbz	r3, 400752 <ptc_save_phase+0x1e>
  40074c:	4a02      	ldr	r2, [pc, #8]	@ (400758 <ptc_save_phase+0x24>)
  40074e:	6812      	ldr	r2, [r2, #0]
  400750:	6013      	str	r3, [r2, #0]
  400752:	4770      	bx	lr
  400754:	40084000 	.word	0x40084000
  400758:	20401654 	.word	0x20401654

0040075c <PTC2_IRQHandler>:
  40075c:	b510      	push	{r4, lr}
  40075e:	4b07      	ldr	r3, [pc, #28]	@ (40077c <PTC2_IRQHandler+0x20>)
  400760:	681c      	ldr	r4, [r3, #0]
  400762:	f452 f979 	bl	52a58 <rt_interrupt_enter>
  400766:	07a3      	lsls	r3, r4, #30
  400768:	d504      	bpl.n	400774 <PTC2_IRQHandler+0x18>
  40076a:	4805      	ldr	r0, [pc, #20]	@ (400780 <PTC2_IRQHandler+0x24>)
  40076c:	f000 fa07 	bl	400b7e <HAL_PTC_IRQHandler>
  400770:	f7ff ffe0 	bl	400734 <ptc_save_phase>
  400774:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
  400778:	f452 b986 	b.w	52a88 <rt_interrupt_leave>
  40077c:	4000c000 	.word	0x4000c000
  400780:	20401b40 	.word	0x20401b40

00400784 <ptc_config>:
  400784:	b570      	push	{r4, r5, r6, lr}
  400786:	4616      	mov	r6, r2
  400788:	221c      	movs	r2, #28
  40078a:	4350      	muls	r0, r2
  40078c:	4d11      	ldr	r5, [pc, #68]	@ (4007d4 <ptc_config+0x50>)
  40078e:	4a12      	ldr	r2, [pc, #72]	@ (4007d8 <ptc_config+0x54>)
  400790:	182c      	adds	r4, r5, r0
  400792:	502a      	str	r2, [r5, r0]
  400794:	2201      	movs	r2, #1
  400796:	7522      	strb	r2, [r4, #20]
  400798:	4a10      	ldr	r2, [pc, #64]	@ (4007dc <ptc_config+0x58>)
  40079a:	2005      	movs	r0, #5
  40079c:	6812      	ldr	r2, [r2, #0]
  40079e:	74e0      	strb	r0, [r4, #19]
  4007a0:	60a2      	str	r2, [r4, #8]
  4007a2:	2200      	movs	r2, #0
  4007a4:	2012      	movs	r0, #18
  4007a6:	75a1      	strb	r1, [r4, #22]
  4007a8:	4611      	mov	r1, r2
  4007aa:	60e2      	str	r2, [r4, #12]
  4007ac:	74a6      	strb	r6, [r4, #18]
  4007ae:	8223      	strh	r3, [r4, #16]
  4007b0:	f401 fc7c 	bl	20ac <HAL_NVIC_SetPriority>
  4007b4:	4620      	mov	r0, r4
  4007b6:	f000 f99d 	bl	400af4 <HAL_PTC_Init>
  4007ba:	b128      	cbz	r0, 4007c8 <ptc_config+0x44>
  4007bc:	f240 125f 	movw	r2, #351	@ 0x15f
  4007c0:	4907      	ldr	r1, [pc, #28]	@ (4007e0 <ptc_config+0x5c>)
  4007c2:	4808      	ldr	r0, [pc, #32]	@ (4007e4 <ptc_config+0x60>)
  4007c4:	f450 fdca 	bl	5135c <rt_assert_handler>
  4007c8:	4620      	mov	r0, r4
  4007ca:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
  4007ce:	2101      	movs	r1, #1
  4007d0:	f000 b9b0 	b.w	400b34 <HAL_PTC_Enable>
  4007d4:	20401b40 	.word	0x20401b40
  4007d8:	4000c000 	.word	0x4000c000
  4007dc:	20401654 	.word	0x20401654
  4007e0:	004014a5 	.word	0x004014a5
  4007e4:	004012c5 	.word	0x004012c5

004007e8 <rf_ptc_config>:
  4007e8:	b510      	push	{r4, lr}
  4007ea:	b128      	cbz	r0, 4007f8 <rf_ptc_config+0x10>
  4007ec:	2200      	movs	r2, #0
  4007ee:	4b08      	ldr	r3, [pc, #32]	@ (400810 <rf_ptc_config+0x28>)
  4007f0:	681b      	ldr	r3, [r3, #0]
  4007f2:	601a      	str	r2, [r3, #0]
  4007f4:	605a      	str	r2, [r3, #4]
  4007f6:	811a      	strh	r2, [r3, #8]
  4007f8:	2038      	movs	r0, #56	@ 0x38
  4007fa:	f000 fa59 	bl	400cb0 <HAL_RCC_EnableModule>
  4007fe:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
  400802:	2300      	movs	r3, #0
  400804:	2169      	movs	r1, #105	@ 0x69
  400806:	461a      	mov	r2, r3
  400808:	4618      	mov	r0, r3
  40080a:	f7ff bfbb 	b.w	400784 <ptc_config>
  40080e:	bf00      	nop
  400810:	20401654 	.word	0x20401654

00400814 <__aeabi_unwind_cpp_pr0>:
  400814:	2000      	movs	r0, #0
  400816:	4770      	bx	lr

00400818 <HAL_PostMspInit>:
  400818:	4770      	bx	lr

0040081a <HAL_Init>:
  40081a:	b508      	push	{r3, lr}
  40081c:	f000 fb82 	bl	400f24 <HAL_PreInit>
  400820:	f7ff fffa 	bl	400818 <HAL_PostMspInit>
  400824:	f000 fa67 	bl	400cf6 <HAL_RCC_Init>
  400828:	2003      	movs	r0, #3
  40082a:	f401 fc61 	bl	20f0 <HAL_NVIC_SetPriorityGrouping>
  40082e:	2000      	movs	r0, #0
  400830:	f000 fb17 	bl	400e62 <HAL_InitTick>
  400834:	3800      	subs	r0, #0
  400836:	bf18      	it	ne
  400838:	2001      	movne	r0, #1
  40083a:	bd08      	pop	{r3, pc}

0040083c <HAL_IncTick>:
  40083c:	4a02      	ldr	r2, [pc, #8]	@ (400848 <HAL_IncTick+0xc>)
  40083e:	6813      	ldr	r3, [r2, #0]
  400840:	3301      	adds	r3, #1
  400842:	6013      	str	r3, [r2, #0]
  400844:	4770      	bx	lr
  400846:	bf00      	nop
  400848:	20401b5c 	.word	0x20401b5c

0040084c <HAL_Delay_us>:
  40084c:	4603      	mov	r3, r0
  40084e:	b570      	push	{r4, r5, r6, lr}
  400850:	b1b8      	cbz	r0, 400882 <HAL_Delay_us+0x36>
  400852:	f242 7510 	movw	r5, #10000	@ 0x2710
  400856:	f04f 26e0 	mov.w	r6, #3758153728	@ 0xe000e000
  40085a:	42ab      	cmp	r3, r5
  40085c:	bf84      	itt	hi
  40085e:	f5a3 541c 	subhi.w	r4, r3, #9984	@ 0x2700
  400862:	f242 7310 	movwhi	r3, #10000	@ 0x2710
  400866:	6932      	ldr	r2, [r6, #16]
  400868:	bf98      	it	ls
  40086a:	2400      	movls	r4, #0
  40086c:	4618      	mov	r0, r3
  40086e:	bf88      	it	hi
  400870:	3c10      	subhi	r4, #16
  400872:	07d3      	lsls	r3, r2, #31
  400874:	d408      	bmi.n	400888 <HAL_Delay_us+0x3c>
  400876:	f401 fa29 	bl	1ccc <HAL_Delay_us_>
  40087a:	4623      	mov	r3, r4
  40087c:	2c00      	cmp	r4, #0
  40087e:	d1ec      	bne.n	40085a <HAL_Delay_us+0xe>
  400880:	e001      	b.n	400886 <HAL_Delay_us+0x3a>
  400882:	f401 fa23 	bl	1ccc <HAL_Delay_us_>
  400886:	bd70      	pop	{r4, r5, r6, pc}
  400888:	f401 fa02 	bl	1c90 <HAL_Delay_us2_>
  40088c:	e7f5      	b.n	40087a <HAL_Delay_us+0x2e>
	...

00400890 <NMI_Handler>:
  400890:	b508      	push	{r3, lr}
  400892:	4b05      	ldr	r3, [pc, #20]	@ (4008a8 <NMI_Handler+0x18>)
  400894:	691b      	ldr	r3, [r3, #16]
  400896:	005b      	lsls	r3, r3, #1
  400898:	d502      	bpl.n	4008a0 <NMI_Handler+0x10>
  40089a:	f7ff fd19 	bl	4002d0 <DBG_Trigger_IRQHandler>
  40089e:	bd08      	pop	{r3, pc}
  4008a0:	f000 fa82 	bl	400da8 <WDT_IRQHandler>
  4008a4:	e7fb      	b.n	40089e <NMI_Handler+0xe>
  4008a6:	bf00      	nop
  4008a8:	4000f000 	.word	0x4000f000

004008ac <HAL_GPIO_Restore>:
  4008ac:	4b11      	ldr	r3, [pc, #68]	@ (4008f4 <HAL_GPIO_Restore+0x48>)
  4008ae:	b5f0      	push	{r4, r5, r6, r7, lr}
  4008b0:	4298      	cmp	r0, r3
  4008b2:	d11b      	bne.n	4008ec <HAL_GPIO_Restore+0x40>
  4008b4:	2a03      	cmp	r2, #3
  4008b6:	d11b      	bne.n	4008f0 <HAL_GPIO_Restore+0x44>
  4008b8:	2400      	movs	r4, #0
  4008ba:	271c      	movs	r7, #28
  4008bc:	fb07 f604 	mul.w	r6, r7, r4
  4008c0:	198d      	adds	r5, r1, r6
  4008c2:	598e      	ldr	r6, [r1, r6]
  4008c4:	eb00 13c4 	add.w	r3, r0, r4, lsl #7
  4008c8:	605e      	str	r6, [r3, #4]
  4008ca:	686e      	ldr	r6, [r5, #4]
  4008cc:	3401      	adds	r4, #1
  4008ce:	611e      	str	r6, [r3, #16]
  4008d0:	68ee      	ldr	r6, [r5, #12]
  4008d2:	42a2      	cmp	r2, r4
  4008d4:	629e      	str	r6, [r3, #40]	@ 0x28
  4008d6:	692e      	ldr	r6, [r5, #16]
  4008d8:	639e      	str	r6, [r3, #56]	@ 0x38
  4008da:	696e      	ldr	r6, [r5, #20]
  4008dc:	645e      	str	r6, [r3, #68]	@ 0x44
  4008de:	69ae      	ldr	r6, [r5, #24]
  4008e0:	651e      	str	r6, [r3, #80]	@ 0x50
  4008e2:	68ad      	ldr	r5, [r5, #8]
  4008e4:	61dd      	str	r5, [r3, #28]
  4008e6:	d8e9      	bhi.n	4008bc <HAL_GPIO_Restore+0x10>
  4008e8:	2000      	movs	r0, #0
  4008ea:	bdf0      	pop	{r4, r5, r6, r7, pc}
  4008ec:	2a02      	cmp	r2, #2
  4008ee:	e7e2      	b.n	4008b6 <HAL_GPIO_Restore+0xa>
  4008f0:	2001      	movs	r0, #1
  4008f2:	e7fa      	b.n	4008ea <HAL_GPIO_Restore+0x3e>
  4008f4:	500a0000 	.word	0x500a0000

004008f8 <HAL_RC_locked>:
  4008f8:	b507      	push	{r0, r1, r2, lr}
  4008fa:	2100      	movs	r1, #0
  4008fc:	2002      	movs	r0, #2
  4008fe:	f000 f8ab 	bl	400a58 <HAL_MAILBOX_GetMutex>
  400902:	2100      	movs	r1, #0
  400904:	9001      	str	r0, [sp, #4]
  400906:	a801      	add	r0, sp, #4
  400908:	f000 f8c2 	bl	400a90 <HAL_MAILBOX_Lock>
  40090c:	3800      	subs	r0, #0
  40090e:	bf18      	it	ne
  400910:	2001      	movne	r0, #1
  400912:	4240      	negs	r0, r0
  400914:	b003      	add	sp, #12
  400916:	f85d fb04 	ldr.w	pc, [sp], #4

0040091a <HAL_RC_unlocked>:
  40091a:	b507      	push	{r0, r1, r2, lr}
  40091c:	2100      	movs	r1, #0
  40091e:	2002      	movs	r0, #2
  400920:	f000 f89a 	bl	400a58 <HAL_MAILBOX_GetMutex>
  400924:	2100      	movs	r1, #0
  400926:	9001      	str	r0, [sp, #4]
  400928:	a801      	add	r0, sp, #4
  40092a:	f000 f8c3 	bl	400ab4 <HAL_MAILBOX_UnLock>
  40092e:	b003      	add	sp, #12
  400930:	f85d fb04 	ldr.w	pc, [sp], #4

00400934 <HAL_RC_CAL_GetLPCycle_ex>:
  400934:	4b01      	ldr	r3, [pc, #4]	@ (40093c <HAL_RC_CAL_GetLPCycle_ex+0x8>)
  400936:	7818      	ldrb	r0, [r3, #0]
  400938:	4770      	bx	lr
  40093a:	bf00      	nop
  40093c:	20401658 	.word	0x20401658

00400940 <HAL_RC_CAL_SetLPCycle_ex>:
  400940:	b118      	cbz	r0, 40094a <HAL_RC_CAL_SetLPCycle_ex+0xa>
  400942:	4b03      	ldr	r3, [pc, #12]	@ (400950 <HAL_RC_CAL_SetLPCycle_ex+0x10>)
  400944:	7018      	strb	r0, [r3, #0]
  400946:	2000      	movs	r0, #0
  400948:	4770      	bx	lr
  40094a:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
  40094e:	4770      	bx	lr
  400950:	20401658 	.word	0x20401658

00400954 <HAL_RC_CALget_curr_cycle_on_48M>:
  400954:	b573      	push	{r0, r1, r4, r5, r6, lr}
  400956:	4606      	mov	r6, r0
  400958:	460d      	mov	r5, r1
  40095a:	f401 f9f6 	bl	1d4a <HAL_GetLXTEnabled>
  40095e:	2800      	cmp	r0, #0
  400960:	d16d      	bne.n	400a3e <HAL_RC_CALget_curr_cycle_on_48M+0xea>
  400962:	f7ff ffc9 	bl	4008f8 <HAL_RC_locked>
  400966:	2800      	cmp	r0, #0
  400968:	d16c      	bne.n	400a44 <HAL_RC_CALget_curr_cycle_on_48M+0xf0>
  40096a:	4c38      	ldr	r4, [pc, #224]	@ (400a4c <HAL_RC_CALget_curr_cycle_on_48M+0xf8>)
  40096c:	2001      	movs	r0, #1
  40096e:	f8d4 3114 	ldr.w	r3, [r4, #276]	@ 0x114
  400972:	f36f 43dc 	bfc	r3, #19, #10
  400976:	f443 2300 	orr.w	r3, r3, #524288	@ 0x80000
  40097a:	f8c4 3114 	str.w	r3, [r4, #276]	@ 0x114
  40097e:	f8d4 3114 	ldr.w	r3, [r4, #276]	@ 0x114
  400982:	f043 5300 	orr.w	r3, r3, #536870912	@ 0x20000000
  400986:	f8c4 3114 	str.w	r3, [r4, #276]	@ 0x114
  40098a:	f8d4 3114 	ldr.w	r3, [r4, #276]	@ 0x114
  40098e:	f423 3380 	bic.w	r3, r3, #65536	@ 0x10000
  400992:	f8c4 3114 	str.w	r3, [r4, #276]	@ 0x114
  400996:	f8d4 3114 	ldr.w	r3, [r4, #276]	@ 0x114
  40099a:	f8c4 3114 	str.w	r3, [r4, #276]	@ 0x114
  40099e:	f8d4 3114 	ldr.w	r3, [r4, #276]	@ 0x114
  4009a2:	f36f 030f 	bfc	r3, #0, #16
  4009a6:	f8c4 3114 	str.w	r3, [r4, #276]	@ 0x114
  4009aa:	f8d4 3114 	ldr.w	r3, [r4, #276]	@ 0x114
  4009ae:	431e      	orrs	r6, r3
  4009b0:	f8c4 6114 	str.w	r6, [r4, #276]	@ 0x114
  4009b4:	f8d4 3114 	ldr.w	r3, [r4, #276]	@ 0x114
  4009b8:	f443 3300 	orr.w	r3, r3, #131072	@ 0x20000
  4009bc:	f8c4 3114 	str.w	r3, [r4, #276]	@ 0x114
  4009c0:	f000 fa40 	bl	400e44 <HAL_Delay>
  4009c4:	f8d4 3118 	ldr.w	r3, [r4, #280]	@ 0x118
  4009c8:	2b00      	cmp	r3, #0
  4009ca:	dafb      	bge.n	4009c4 <HAL_RC_CALget_curr_cycle_on_48M+0x70>
  4009cc:	4820      	ldr	r0, [pc, #128]	@ (400a50 <HAL_RC_CALget_curr_cycle_on_48M+0xfc>)
  4009ce:	f8d4 2118 	ldr.w	r2, [r4, #280]	@ 0x118
  4009d2:	6801      	ldr	r1, [r0, #0]
  4009d4:	4e1f      	ldr	r6, [pc, #124]	@ (400a54 <HAL_RC_CALget_curr_cycle_on_48M+0x100>)
  4009d6:	f022 4200 	bic.w	r2, r2, #2147483648	@ 0x80000000
  4009da:	b371      	cbz	r1, 400a3a <HAL_RC_CALget_curr_cycle_on_48M+0xe6>
  4009dc:	6833      	ldr	r3, [r6, #0]
  4009de:	4293      	cmp	r3, r2
  4009e0:	d21d      	bcs.n	400a1e <HAL_RC_CALget_curr_cycle_on_48M+0xca>
  4009e2:	1ad4      	subs	r4, r2, r3
  4009e4:	2cfa      	cmp	r4, #250	@ 0xfa
  4009e6:	d923      	bls.n	400a30 <HAL_RC_CALget_curr_cycle_on_48M+0xdc>
  4009e8:	4299      	cmp	r1, r3
  4009ea:	d921      	bls.n	400a30 <HAL_RC_CALget_curr_cycle_on_48M+0xdc>
  4009ec:	1ac9      	subs	r1, r1, r3
  4009ee:	29fa      	cmp	r1, #250	@ 0xfa
  4009f0:	d91e      	bls.n	400a30 <HAL_RC_CALget_curr_cycle_on_48M+0xdc>
  4009f2:	eb03 0443 	add.w	r4, r3, r3, lsl #1
  4009f6:	230d      	movs	r3, #13
  4009f8:	3408      	adds	r4, #8
  4009fa:	fb03 4402 	mla	r4, r3, r2, r4
  4009fe:	0924      	lsrs	r4, r4, #4
  400a00:	6002      	str	r2, [r0, #0]
  400a02:	2204      	movs	r2, #4
  400a04:	2002      	movs	r0, #2
  400a06:	eb0d 0102 	add.w	r1, sp, r2
  400a0a:	6034      	str	r4, [r6, #0]
  400a0c:	9401      	str	r4, [sp, #4]
  400a0e:	f401 fa49 	bl	1ea4 <HAL_LCPU_CONFIG_set>
  400a12:	602c      	str	r4, [r5, #0]
  400a14:	f7ff ff81 	bl	40091a <HAL_RC_unlocked>
  400a18:	2000      	movs	r0, #0
  400a1a:	b002      	add	sp, #8
  400a1c:	bd70      	pop	{r4, r5, r6, pc}
  400a1e:	d907      	bls.n	400a30 <HAL_RC_CALget_curr_cycle_on_48M+0xdc>
  400a20:	1a9c      	subs	r4, r3, r2
  400a22:	2cc8      	cmp	r4, #200	@ 0xc8
  400a24:	d904      	bls.n	400a30 <HAL_RC_CALget_curr_cycle_on_48M+0xdc>
  400a26:	4299      	cmp	r1, r3
  400a28:	d202      	bcs.n	400a30 <HAL_RC_CALget_curr_cycle_on_48M+0xdc>
  400a2a:	1a59      	subs	r1, r3, r1
  400a2c:	29c8      	cmp	r1, #200	@ 0xc8
  400a2e:	e7df      	b.n	4009f0 <HAL_RC_CALget_curr_cycle_on_48M+0x9c>
  400a30:	ebc3 1403 	rsb	r4, r3, r3, lsl #4
  400a34:	4414      	add	r4, r2
  400a36:	3408      	adds	r4, #8
  400a38:	e7e1      	b.n	4009fe <HAL_RC_CALget_curr_cycle_on_48M+0xaa>
  400a3a:	4614      	mov	r4, r2
  400a3c:	e7e0      	b.n	400a00 <HAL_RC_CALget_curr_cycle_on_48M+0xac>
  400a3e:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
  400a42:	e7ea      	b.n	400a1a <HAL_RC_CALget_curr_cycle_on_48M+0xc6>
  400a44:	f06f 0002 	mvn.w	r0, #2
  400a48:	e7e7      	b.n	400a1a <HAL_RC_CALget_curr_cycle_on_48M+0xc6>
  400a4a:	bf00      	nop
  400a4c:	40090000 	.word	0x40090000
  400a50:	20401b64 	.word	0x20401b64
  400a54:	20401b60 	.word	0x20401b60

00400a58 <HAL_MAILBOX_GetMutex>:
  400a58:	2801      	cmp	r0, #1
  400a5a:	b508      	push	{r3, lr}
  400a5c:	d108      	bne.n	400a70 <HAL_MAILBOX_GetMutex+0x18>
  400a5e:	2903      	cmp	r1, #3
  400a60:	d80e      	bhi.n	400a80 <HAL_MAILBOX_GetMutex+0x28>
  400a62:	4808      	ldr	r0, [pc, #32]	@ (400a84 <HAL_MAILBOX_GetMutex+0x2c>)
  400a64:	e000      	b.n	400a68 <HAL_MAILBOX_GetMutex+0x10>
  400a66:	4808      	ldr	r0, [pc, #32]	@ (400a88 <HAL_MAILBOX_GetMutex+0x30>)
  400a68:	2318      	movs	r3, #24
  400a6a:	fb03 0001 	mla	r0, r3, r1, r0
  400a6e:	e008      	b.n	400a82 <HAL_MAILBOX_GetMutex+0x2a>
  400a70:	2901      	cmp	r1, #1
  400a72:	d805      	bhi.n	400a80 <HAL_MAILBOX_GetMutex+0x28>
  400a74:	2802      	cmp	r0, #2
  400a76:	d0f6      	beq.n	400a66 <HAL_MAILBOX_GetMutex+0xe>
  400a78:	21b0      	movs	r1, #176	@ 0xb0
  400a7a:	4804      	ldr	r0, [pc, #16]	@ (400a8c <HAL_MAILBOX_GetMutex+0x34>)
  400a7c:	f000 fa20 	bl	400ec0 <HAL_AssertFailed>
  400a80:	2000      	movs	r0, #0
  400a82:	bd08      	pop	{r3, pc}
  400a84:	50082000 	.word	0x50082000
  400a88:	40002000 	.word	0x40002000
  400a8c:	004012ce 	.word	0x004012ce

00400a90 <HAL_MAILBOX_Lock>:
  400a90:	b508      	push	{r3, lr}
  400a92:	b138      	cbz	r0, 400aa4 <HAL_MAILBOX_Lock+0x14>
  400a94:	6800      	ldr	r0, [r0, #0]
  400a96:	b148      	cbz	r0, 400aac <HAL_MAILBOX_Lock+0x1c>
  400a98:	6940      	ldr	r0, [r0, #20]
  400a9a:	2800      	cmp	r0, #0
  400a9c:	db08      	blt.n	400ab0 <HAL_MAILBOX_Lock+0x20>
  400a9e:	f000 000f 	and.w	r0, r0, #15
  400aa2:	bd08      	pop	{r3, pc}
  400aa4:	2002      	movs	r0, #2
  400aa6:	f7ff ffd7 	bl	400a58 <HAL_MAILBOX_GetMutex>
  400aaa:	e7f4      	b.n	400a96 <HAL_MAILBOX_Lock+0x6>
  400aac:	2004      	movs	r0, #4
  400aae:	e7f8      	b.n	400aa2 <HAL_MAILBOX_Lock+0x12>
  400ab0:	2000      	movs	r0, #0
  400ab2:	e7f6      	b.n	400aa2 <HAL_MAILBOX_Lock+0x12>

00400ab4 <HAL_MAILBOX_UnLock>:
  400ab4:	b508      	push	{r3, lr}
  400ab6:	b130      	cbz	r0, 400ac6 <HAL_MAILBOX_UnLock+0x12>
  400ab8:	6800      	ldr	r0, [r0, #0]
  400aba:	b118      	cbz	r0, 400ac4 <HAL_MAILBOX_UnLock+0x10>
  400abc:	6943      	ldr	r3, [r0, #20]
  400abe:	f043 4300 	orr.w	r3, r3, #2147483648	@ 0x80000000
  400ac2:	6143      	str	r3, [r0, #20]
  400ac4:	bd08      	pop	{r3, pc}
  400ac6:	2002      	movs	r0, #2
  400ac8:	f7ff ffc6 	bl	400a58 <HAL_MAILBOX_GetMutex>
  400acc:	e7f5      	b.n	400aba <HAL_MAILBOX_UnLock+0x6>

00400ace <HAL_MAILBOX_IRQHandler>:
  400ace:	b570      	push	{r4, r5, r6, lr}
  400ad0:	4605      	mov	r5, r0
  400ad2:	2600      	movs	r6, #0
  400ad4:	6803      	ldr	r3, [r0, #0]
  400ad6:	691c      	ldr	r4, [r3, #16]
  400ad8:	609c      	str	r4, [r3, #8]
  400ada:	b904      	cbnz	r4, 400ade <HAL_MAILBOX_IRQHandler+0x10>
  400adc:	bd70      	pop	{r4, r5, r6, pc}
  400ade:	07e3      	lsls	r3, r4, #31
  400ae0:	d504      	bpl.n	400aec <HAL_MAILBOX_IRQHandler+0x1e>
  400ae2:	68ab      	ldr	r3, [r5, #8]
  400ae4:	b113      	cbz	r3, 400aec <HAL_MAILBOX_IRQHandler+0x1e>
  400ae6:	4628      	mov	r0, r5
  400ae8:	b2f1      	uxtb	r1, r6
  400aea:	4798      	blx	r3
  400aec:	0864      	lsrs	r4, r4, #1
  400aee:	3601      	adds	r6, #1
  400af0:	e7f3      	b.n	400ada <HAL_MAILBOX_IRQHandler+0xc>
	...

00400af4 <HAL_PTC_Init>:
  400af4:	b510      	push	{r4, lr}
  400af6:	4604      	mov	r4, r0
  400af8:	b918      	cbnz	r0, 400b02 <HAL_PTC_Init+0xe>
  400afa:	2115      	movs	r1, #21
  400afc:	480c      	ldr	r0, [pc, #48]	@ (400b30 <HAL_PTC_Init+0x3c>)
  400afe:	f000 f9df 	bl	400ec0 <HAL_AssertFailed>
  400b02:	7d23      	ldrb	r3, [r4, #20]
  400b04:	2b07      	cmp	r3, #7
  400b06:	d903      	bls.n	400b10 <HAL_PTC_Init+0x1c>
  400b08:	2116      	movs	r1, #22
  400b0a:	4809      	ldr	r0, [pc, #36]	@ (400b30 <HAL_PTC_Init+0x3c>)
  400b0c:	f000 f9d8 	bl	400ec0 <HAL_AssertFailed>
  400b10:	6823      	ldr	r3, [r4, #0]
  400b12:	7d22      	ldrb	r2, [r4, #20]
  400b14:	3310      	adds	r3, #16
  400b16:	eb03 1302 	add.w	r3, r3, r2, lsl #4
  400b1a:	68a2      	ldr	r2, [r4, #8]
  400b1c:	6063      	str	r3, [r4, #4]
  400b1e:	605a      	str	r2, [r3, #4]
  400b20:	6863      	ldr	r3, [r4, #4]
  400b22:	68e2      	ldr	r2, [r4, #12]
  400b24:	2000      	movs	r0, #0
  400b26:	609a      	str	r2, [r3, #8]
  400b28:	2301      	movs	r3, #1
  400b2a:	7623      	strb	r3, [r4, #24]
  400b2c:	bd10      	pop	{r4, pc}
  400b2e:	bf00      	nop
  400b30:	0040136f 	.word	0x0040136f

00400b34 <HAL_PTC_Enable>:
  400b34:	2201      	movs	r2, #1
  400b36:	b510      	push	{r4, lr}
  400b38:	7d03      	ldrb	r3, [r0, #20]
  400b3a:	6804      	ldr	r4, [r0, #0]
  400b3c:	fa02 f303 	lsl.w	r3, r2, r3
  400b40:	b1b1      	cbz	r1, 400b70 <HAL_PTC_Enable+0x3c>
  400b42:	6861      	ldr	r1, [r4, #4]
  400b44:	430b      	orrs	r3, r1
  400b46:	f443 3380 	orr.w	r3, r3, #65536	@ 0x10000
  400b4a:	6063      	str	r3, [r4, #4]
  400b4c:	6804      	ldr	r4, [r0, #0]
  400b4e:	7d01      	ldrb	r1, [r0, #20]
  400b50:	68a3      	ldr	r3, [r4, #8]
  400b52:	408a      	lsls	r2, r1
  400b54:	4313      	orrs	r3, r2
  400b56:	ea43 4302 	orr.w	r3, r3, r2, lsl #16
  400b5a:	60a3      	str	r3, [r4, #8]
  400b5c:	7cc2      	ldrb	r2, [r0, #19]
  400b5e:	7d83      	ldrb	r3, [r0, #22]
  400b60:	ea43 4302 	orr.w	r3, r3, r2, lsl #16
  400b64:	6842      	ldr	r2, [r0, #4]
  400b66:	6013      	str	r3, [r2, #0]
  400b68:	2202      	movs	r2, #2
  400b6a:	7602      	strb	r2, [r0, #24]
  400b6c:	2000      	movs	r0, #0
  400b6e:	bd10      	pop	{r4, pc}
  400b70:	68a1      	ldr	r1, [r4, #8]
  400b72:	ea43 4303 	orr.w	r3, r3, r3, lsl #16
  400b76:	ea21 0303 	bic.w	r3, r1, r3
  400b7a:	60a3      	str	r3, [r4, #8]
  400b7c:	e7f5      	b.n	400b6a <HAL_PTC_Enable+0x36>

00400b7e <HAL_PTC_IRQHandler>:
  400b7e:	2301      	movs	r3, #1
  400b80:	6802      	ldr	r2, [r0, #0]
  400b82:	7d00      	ldrb	r0, [r0, #20]
  400b84:	6851      	ldr	r1, [r2, #4]
  400b86:	4083      	lsls	r3, r0
  400b88:	430b      	orrs	r3, r1
  400b8a:	6053      	str	r3, [r2, #4]
  400b8c:	4770      	bx	lr
	...

00400b90 <RCC_GetModuleMask>:
  400b90:	b510      	push	{r4, lr}
  400b92:	b15a      	cbz	r2, 400bac <RCC_GetModuleMask+0x1c>
  400b94:	b151      	cbz	r1, 400bac <RCC_GetModuleMask+0x1c>
  400b96:	2823      	cmp	r0, #35	@ 0x23
  400b98:	d05d      	beq.n	400c56 <RCC_GetModuleMask+0xc6>
  400b9a:	d847      	bhi.n	400c2c <RCC_GetModuleMask+0x9c>
  400b9c:	280b      	cmp	r0, #11
  400b9e:	d83b      	bhi.n	400c18 <RCC_GetModuleMask+0x88>
  400ba0:	b9e0      	cbnz	r0, 400bdc <RCC_GetModuleMask+0x4c>
  400ba2:	f240 3122 	movw	r1, #802	@ 0x322
  400ba6:	4841      	ldr	r0, [pc, #260]	@ (400cac <RCC_GetModuleMask+0x11c>)
  400ba8:	f000 f98a 	bl	400ec0 <HAL_AssertFailed>
  400bac:	2000      	movs	r0, #0
  400bae:	e051      	b.n	400c54 <RCC_GetModuleMask+0xc4>
  400bb0:	3859      	subs	r0, #89	@ 0x59
  400bb2:	2807      	cmp	r0, #7
  400bb4:	d8f5      	bhi.n	400ba2 <RCC_GetModuleMask+0x12>
  400bb6:	a401      	add	r4, pc, #4	@ (adr r4, 400bbc <RCC_GetModuleMask+0x2c>)
  400bb8:	f854 f020 	ldr.w	pc, [r4, r0, lsl #2]
  400bbc:	00400c75 	.word	0x00400c75
  400bc0:	00400c8d 	.word	0x00400c8d
  400bc4:	00400c95 	.word	0x00400c95
  400bc8:	00400c9d 	.word	0x00400c9d
  400bcc:	00400ba3 	.word	0x00400ba3
  400bd0:	00400ba3 	.word	0x00400ba3
  400bd4:	00400ba3 	.word	0x00400ba3
  400bd8:	00400ca5 	.word	0x00400ca5
  400bdc:	3801      	subs	r0, #1
  400bde:	2300      	movs	r3, #0
  400be0:	280a      	cmp	r0, #10
  400be2:	d8de      	bhi.n	400ba2 <RCC_GetModuleMask+0x12>
  400be4:	a401      	add	r4, pc, #4	@ (adr r4, 400bec <RCC_GetModuleMask+0x5c>)
  400be6:	f854 f020 	ldr.w	pc, [r4, r0, lsl #2]
  400bea:	bf00      	nop
  400bec:	00400c87 	.word	0x00400c87
  400bf0:	00400ba3 	.word	0x00400ba3
  400bf4:	00400ba3 	.word	0x00400ba3
  400bf8:	00400c81 	.word	0x00400c81
  400bfc:	00400ba3 	.word	0x00400ba3
  400c00:	00400c7b 	.word	0x00400c7b
  400c04:	00400ba3 	.word	0x00400ba3
  400c08:	00400ba3 	.word	0x00400ba3
  400c0c:	00400ba3 	.word	0x00400ba3
  400c10:	00400c6f 	.word	0x00400c6f
  400c14:	00400c69 	.word	0x00400c69
  400c18:	2816      	cmp	r0, #22
  400c1a:	f04f 0300 	mov.w	r3, #0
  400c1e:	d01f      	beq.n	400c60 <RCC_GetModuleMask+0xd0>
  400c20:	2822      	cmp	r0, #34	@ 0x22
  400c22:	d1be      	bne.n	400ba2 <RCC_GetModuleMask+0x12>
  400c24:	600b      	str	r3, [r1, #0]
  400c26:	f44f 7300 	mov.w	r3, #512	@ 0x200
  400c2a:	e010      	b.n	400c4e <RCC_GetModuleMask+0xbe>
  400c2c:	2860      	cmp	r0, #96	@ 0x60
  400c2e:	d8b8      	bhi.n	400ba2 <RCC_GetModuleMask+0x12>
  400c30:	2858      	cmp	r0, #88	@ 0x58
  400c32:	f04f 0300 	mov.w	r3, #0
  400c36:	d8bb      	bhi.n	400bb0 <RCC_GetModuleMask+0x20>
  400c38:	2838      	cmp	r0, #56	@ 0x38
  400c3a:	d005      	beq.n	400c48 <RCC_GetModuleMask+0xb8>
  400c3c:	283a      	cmp	r0, #58	@ 0x3a
  400c3e:	d1b0      	bne.n	400ba2 <RCC_GetModuleMask+0x12>
  400c40:	600b      	str	r3, [r1, #0]
  400c42:	f44f 3380 	mov.w	r3, #65536	@ 0x10000
  400c46:	e002      	b.n	400c4e <RCC_GetModuleMask+0xbe>
  400c48:	600b      	str	r3, [r1, #0]
  400c4a:	f44f 7380 	mov.w	r3, #256	@ 0x100
  400c4e:	f04f 4080 	mov.w	r0, #1073741824	@ 0x40000000
  400c52:	6013      	str	r3, [r2, #0]
  400c54:	bd10      	pop	{r4, pc}
  400c56:	2300      	movs	r3, #0
  400c58:	600b      	str	r3, [r1, #0]
  400c5a:	f44f 6380 	mov.w	r3, #1024	@ 0x400
  400c5e:	e7f6      	b.n	400c4e <RCC_GetModuleMask+0xbe>
  400c60:	600b      	str	r3, [r1, #0]
  400c62:	f44f 4300 	mov.w	r3, #32768	@ 0x8000
  400c66:	e7f2      	b.n	400c4e <RCC_GetModuleMask+0xbe>
  400c68:	600b      	str	r3, [r1, #0]
  400c6a:	2340      	movs	r3, #64	@ 0x40
  400c6c:	e7ef      	b.n	400c4e <RCC_GetModuleMask+0xbe>
  400c6e:	600b      	str	r3, [r1, #0]
  400c70:	2320      	movs	r3, #32
  400c72:	e7ec      	b.n	400c4e <RCC_GetModuleMask+0xbe>
  400c74:	600b      	str	r3, [r1, #0]
  400c76:	2310      	movs	r3, #16
  400c78:	e7e9      	b.n	400c4e <RCC_GetModuleMask+0xbe>
  400c7a:	600b      	str	r3, [r1, #0]
  400c7c:	2308      	movs	r3, #8
  400c7e:	e7e6      	b.n	400c4e <RCC_GetModuleMask+0xbe>
  400c80:	600b      	str	r3, [r1, #0]
  400c82:	2304      	movs	r3, #4
  400c84:	e7e3      	b.n	400c4e <RCC_GetModuleMask+0xbe>
  400c86:	600b      	str	r3, [r1, #0]
  400c88:	2302      	movs	r3, #2
  400c8a:	e7e0      	b.n	400c4e <RCC_GetModuleMask+0xbe>
  400c8c:	600b      	str	r3, [r1, #0]
  400c8e:	f44f 1380 	mov.w	r3, #1048576	@ 0x100000
  400c92:	e7dc      	b.n	400c4e <RCC_GetModuleMask+0xbe>
  400c94:	600b      	str	r3, [r1, #0]
  400c96:	f44f 2300 	mov.w	r3, #524288	@ 0x80000
  400c9a:	e7d8      	b.n	400c4e <RCC_GetModuleMask+0xbe>
  400c9c:	600b      	str	r3, [r1, #0]
  400c9e:	f44f 2380 	mov.w	r3, #262144	@ 0x40000
  400ca2:	e7d4      	b.n	400c4e <RCC_GetModuleMask+0xbe>
  400ca4:	600b      	str	r3, [r1, #0]
  400ca6:	2380      	movs	r3, #128	@ 0x80
  400ca8:	e7d1      	b.n	400c4e <RCC_GetModuleMask+0xbe>
  400caa:	bf00      	nop
  400cac:	004013bc 	.word	0x004013bc

00400cb0 <HAL_RCC_EnableModule>:
  400cb0:	b507      	push	{r0, r1, r2, lr}
  400cb2:	466a      	mov	r2, sp
  400cb4:	a901      	add	r1, sp, #4
  400cb6:	f7ff ff6b 	bl	400b90 <RCC_GetModuleMask>
  400cba:	f1b0 4f80 	cmp.w	r0, #1073741824	@ 0x40000000
  400cbe:	d101      	bne.n	400cc4 <HAL_RCC_EnableModule+0x14>
  400cc0:	9b01      	ldr	r3, [sp, #4]
  400cc2:	b13b      	cbz	r3, 400cd4 <HAL_RCC_EnableModule+0x24>
  400cc4:	f640 0122 	movw	r1, #2082	@ 0x822
  400cc8:	4809      	ldr	r0, [pc, #36]	@ (400cf0 <HAL_RCC_EnableModule+0x40>)
  400cca:	b003      	add	sp, #12
  400ccc:	f85d eb04 	ldr.w	lr, [sp], #4
  400cd0:	f000 b8f6 	b.w	400ec0 <HAL_AssertFailed>
  400cd4:	f3ef 8210 	mrs	r2, PRIMASK
  400cd8:	2301      	movs	r3, #1
  400cda:	f383 8810 	msr	PRIMASK, r3
  400cde:	6843      	ldr	r3, [r0, #4]
  400ce0:	9900      	ldr	r1, [sp, #0]
  400ce2:	430b      	orrs	r3, r1
  400ce4:	6043      	str	r3, [r0, #4]
  400ce6:	f382 8810 	msr	PRIMASK, r2
  400cea:	b003      	add	sp, #12
  400cec:	f85d fb04 	ldr.w	pc, [sp], #4
  400cf0:	004013bc 	.word	0x004013bc

00400cf4 <HAL_RCC_MspInit>:
  400cf4:	4770      	bx	lr

00400cf6 <HAL_RCC_Init>:
  400cf6:	b508      	push	{r3, lr}
  400cf8:	f7ff fffc 	bl	400cf4 <HAL_RCC_MspInit>
  400cfc:	bd08      	pop	{r3, pc}

00400cfe <hw_preinit0>:
  400cfe:	4770      	bx	lr

00400d00 <SystemInit>:
  400d00:	b508      	push	{r3, lr}
  400d02:	4a0b      	ldr	r2, [pc, #44]	@ (400d30 <SystemInit+0x30>)
  400d04:	4b0b      	ldr	r3, [pc, #44]	@ (400d34 <SystemInit+0x34>)
  400d06:	609a      	str	r2, [r3, #8]
  400d08:	f8d3 2088 	ldr.w	r2, [r3, #136]	@ 0x88
  400d0c:	f042 023f 	orr.w	r2, r2, #63	@ 0x3f
  400d10:	f8c3 2088 	str.w	r2, [r3, #136]	@ 0x88
  400d14:	f7ff fff3 	bl	400cfe <hw_preinit0>
  400d18:	f44f fc58 	bl	505cc <mpu_config>
  400d1c:	f405 f914 	bl	5f48 <cache_enable>
  400d20:	f7ff fb01 	bl	400326 <SystemPowerOnModeInit>
  400d24:	f450 fad4 	bl	512d0 <rom_scatterload>
  400d28:	4b03      	ldr	r3, [pc, #12]	@ (400d38 <SystemInit+0x38>)
  400d2a:	4a04      	ldr	r2, [pc, #16]	@ (400d3c <SystemInit+0x3c>)
  400d2c:	601a      	str	r2, [r3, #0]
  400d2e:	bd08      	pop	{r3, pc}
  400d30:	00400000 	.word	0x00400000
  400d34:	e000ed00 	.word	0xe000ed00
  400d38:	2040165c 	.word	0x2040165c
  400d3c:	017d7840 	.word	0x017d7840

00400d40 <Reset_Handler>:
  400d40:	f8df d048 	ldr.w	sp, [pc, #72]	@ 400d8c <BTIM3_IRQHandler+0x2>
  400d44:	4812      	ldr	r0, [pc, #72]	@ (400d90 <BTIM3_IRQHandler+0x6>)
  400d46:	f380 880a 	msr	MSPLIM, r0
  400d4a:	f7ff ffd9 	bl	400d00 <SystemInit>
  400d4e:	4c11      	ldr	r4, [pc, #68]	@ (400d94 <BTIM3_IRQHandler+0xa>)
  400d50:	4d11      	ldr	r5, [pc, #68]	@ (400d98 <BTIM3_IRQHandler+0xe>)
  400d52:	42ac      	cmp	r4, r5
  400d54:	da09      	bge.n	400d6a <Reset_Handler+0x2a>
  400d56:	6821      	ldr	r1, [r4, #0]
  400d58:	6862      	ldr	r2, [r4, #4]
  400d5a:	68a3      	ldr	r3, [r4, #8]
  400d5c:	3b04      	subs	r3, #4
  400d5e:	bfa2      	ittt	ge
  400d60:	58c8      	ldrge	r0, [r1, r3]
  400d62:	50d0      	strge	r0, [r2, r3]
  400d64:	e7fa      	bge.n	400d5c <Reset_Handler+0x1c>
  400d66:	340c      	adds	r4, #12
  400d68:	e7f3      	b.n	400d52 <Reset_Handler+0x12>
  400d6a:	4b0c      	ldr	r3, [pc, #48]	@ (400d9c <BTIM3_IRQHandler+0x12>)
  400d6c:	4c0c      	ldr	r4, [pc, #48]	@ (400da0 <BTIM3_IRQHandler+0x16>)
  400d6e:	42a3      	cmp	r3, r4
  400d70:	da08      	bge.n	400d84 <Reset_Handler+0x44>
  400d72:	6819      	ldr	r1, [r3, #0]
  400d74:	685a      	ldr	r2, [r3, #4]
  400d76:	2000      	movs	r0, #0
  400d78:	3a04      	subs	r2, #4
  400d7a:	bfa4      	itt	ge
  400d7c:	5088      	strge	r0, [r1, r2]
  400d7e:	e7fb      	bge.n	400d78 <Reset_Handler+0x38>
  400d80:	3308      	adds	r3, #8
  400d82:	e7f4      	b.n	400d6e <Reset_Handler+0x2e>
  400d84:	f000 f968 	bl	401058 <entry>
  400d88:	e7fe      	b.n	400d88 <Reset_Handler+0x48>

00400d8a <BTIM3_IRQHandler>:
  400d8a:	e7fe      	b.n	400d8a <BTIM3_IRQHandler>
  400d8c:	20401a68 	.word	0x20401a68
  400d90:	20401668 	.word	0x20401668
  400d94:	00401624 	.word	0x00401624
  400d98:	00401624 	.word	0x00401624
  400d9c:	00401624 	.word	0x00401624
  400da0:	0040162c 	.word	0x0040162c

00400da4 <wdt_store_exception_information>:
  400da4:	4770      	bx	lr
	...

00400da8 <WDT_IRQHandler>:
  400da8:	b538      	push	{r3, r4, r5, lr}
  400daa:	4b18      	ldr	r3, [pc, #96]	@ (400e0c <WDT_IRQHandler+0x64>)
  400dac:	681a      	ldr	r2, [r3, #0]
  400dae:	bb2a      	cbnz	r2, 400dfc <WDT_IRQHandler+0x54>
  400db0:	2401      	movs	r4, #1
  400db2:	4d17      	ldr	r5, [pc, #92]	@ (400e10 <WDT_IRQHandler+0x68>)
  400db4:	601c      	str	r4, [r3, #0]
  400db6:	692b      	ldr	r3, [r5, #16]
  400db8:	005a      	lsls	r2, r3, #1
  400dba:	d41f      	bmi.n	400dfc <WDT_IRQHandler+0x54>
  400dbc:	f7ff fff2 	bl	400da4 <wdt_store_exception_information>
  400dc0:	4620      	mov	r0, r4
  400dc2:	f401 f917 	bl	1ff4 <HAL_LPAON_WakeCore>
  400dc6:	692b      	ldr	r3, [r5, #16]
  400dc8:	4620      	mov	r0, r4
  400dca:	f043 5380 	orr.w	r3, r3, #268435456	@ 0x10000000
  400dce:	612b      	str	r3, [r5, #16]
  400dd0:	4b10      	ldr	r3, [pc, #64]	@ (400e14 <WDT_IRQHandler+0x6c>)
  400dd2:	4d11      	ldr	r5, [pc, #68]	@ (400e18 <WDT_IRQHandler+0x70>)
  400dd4:	f64b 3481 	movw	r4, #48001	@ 0xbb81
  400dd8:	602b      	str	r3, [r5, #0]
  400dda:	f000 f833 	bl	400e44 <HAL_Delay>
  400dde:	2234      	movs	r2, #52	@ 0x34
  400de0:	682b      	ldr	r3, [r5, #0]
  400de2:	60da      	str	r2, [r3, #12]
  400de4:	682b      	ldr	r3, [r5, #0]
  400de6:	695b      	ldr	r3, [r3, #20]
  400de8:	079b      	lsls	r3, r3, #30
  400dea:	d408      	bmi.n	400dfe <WDT_IRQHandler+0x56>
  400dec:	2001      	movs	r0, #1
  400dee:	f000 f829 	bl	400e44 <HAL_Delay>
  400df2:	4a07      	ldr	r2, [pc, #28]	@ (400e10 <WDT_IRQHandler+0x68>)
  400df4:	6813      	ldr	r3, [r2, #0]
  400df6:	f043 0301 	orr.w	r3, r3, #1
  400dfa:	6013      	str	r3, [r2, #0]
  400dfc:	bd38      	pop	{r3, r4, r5, pc}
  400dfe:	3c01      	subs	r4, #1
  400e00:	d0f4      	beq.n	400dec <WDT_IRQHandler+0x44>
  400e02:	2001      	movs	r0, #1
  400e04:	f400 ff62 	bl	1ccc <HAL_Delay_us_>
  400e08:	e7ec      	b.n	400de4 <WDT_IRQHandler+0x3c>
  400e0a:	bf00      	nop
  400e0c:	20401b68 	.word	0x20401b68
  400e10:	4000f000 	.word	0x4000f000
  400e14:	4000b000 	.word	0x4000b000
  400e18:	20401b6c 	.word	0x20401b6c

00400e1c <lcpu_thread_init_hook>:
  400e1c:	b510      	push	{r4, lr}
  400e1e:	6ac2      	ldr	r2, [r0, #44]	@ 0x2c
  400e20:	6a81      	ldr	r1, [r0, #40]	@ 0x28
  400e22:	3a04      	subs	r2, #4
  400e24:	4604      	mov	r4, r0
  400e26:	440a      	add	r2, r1
  400e28:	4b05      	ldr	r3, [pc, #20]	@ (400e40 <lcpu_thread_init_hook+0x24>)
  400e2a:	e9d0 0108 	ldrd	r0, r1, [r0, #32]
  400e2e:	f451 fc15 	bl	5265c <rt_hw_stack_init>
  400e32:	61e0      	str	r0, [r4, #28]
  400e34:	6aa1      	ldr	r1, [r4, #40]	@ 0x28
  400e36:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
  400e3a:	f000 b945 	b.w	4010c8 <rt_hw_set_stack_limit>
  400e3e:	bf00      	nop
  400e40:	00055ad1 	.word	0x00055ad1

00400e44 <HAL_Delay>:
  400e44:	b507      	push	{r0, r1, r2, lr}
  400e46:	9001      	str	r0, [sp, #4]
  400e48:	9b01      	ldr	r3, [sp, #4]
  400e4a:	b913      	cbnz	r3, 400e52 <HAL_Delay+0xe>
  400e4c:	b003      	add	sp, #12
  400e4e:	f85d fb04 	ldr.w	pc, [sp], #4
  400e52:	f44f 707a 	mov.w	r0, #1000	@ 0x3e8
  400e56:	f7ff fcf9 	bl	40084c <HAL_Delay_us>
  400e5a:	9b01      	ldr	r3, [sp, #4]
  400e5c:	3b01      	subs	r3, #1
  400e5e:	9301      	str	r3, [sp, #4]
  400e60:	e7f2      	b.n	400e48 <HAL_Delay+0x4>

00400e62 <HAL_InitTick>:
  400e62:	2000      	movs	r0, #0
  400e64:	4770      	bx	lr
	...

00400e68 <SysTick_Handler>:
  400e68:	b570      	push	{r4, r5, r6, lr}
  400e6a:	4d14      	ldr	r5, [pc, #80]	@ (400ebc <SysTick_Handler+0x54>)
  400e6c:	f451 fdf4 	bl	52a58 <rt_interrupt_enter>
  400e70:	6a6b      	ldr	r3, [r5, #36]	@ 0x24
  400e72:	f7ff fce3 	bl	40083c <HAL_IncTick>
  400e76:	f455 f9b3 	bl	561e0 <rt_tick_get>
  400e7a:	6aeb      	ldr	r3, [r5, #44]	@ 0x2c
  400e7c:	4604      	mov	r4, r0
  400e7e:	069b      	lsls	r3, r3, #26
  400e80:	d405      	bmi.n	400e8e <SysTick_Handler+0x26>
  400e82:	f455 f9b5 	bl	561f0 <rt_tick_increase>
  400e86:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
  400e8a:	f451 bdfd 	b.w	52a88 <rt_interrupt_leave>
  400e8e:	6cad      	ldr	r5, [r5, #72]	@ 0x48
  400e90:	1c46      	adds	r6, r0, #1
  400e92:	f401 f8bf 	bl	2014 <HAL_LPTIM_GetFreq>
  400e96:	2301      	movs	r3, #1
  400e98:	4602      	mov	r2, r0
  400e9a:	4629      	mov	r1, r5
  400e9c:	4630      	mov	r0, r6
  400e9e:	f44f fd1b 	bl	508d8 <pm_latch_tick>
  400ea2:	4284      	cmp	r4, r0
  400ea4:	d0ef      	beq.n	400e86 <SysTick_Handler+0x1e>
  400ea6:	4286      	cmp	r6, r0
  400ea8:	d0eb      	beq.n	400e82 <SysTick_Handler+0x1a>
  400eaa:	f455 f9a1 	bl	561f0 <rt_tick_increase>
  400eae:	f455 f99f 	bl	561f0 <rt_tick_increase>
  400eb2:	1ca0      	adds	r0, r4, #2
  400eb4:	f7ff faf6 	bl	4004a4 <pm_set_last_latch_tick>
  400eb8:	e7e5      	b.n	400e86 <SysTick_Handler+0x1e>
  400eba:	bf00      	nop
  400ebc:	40040000 	.word	0x40040000

00400ec0 <HAL_AssertFailed>:
  400ec0:	2300      	movs	r3, #0
  400ec2:	b507      	push	{r0, r1, r2, lr}
  400ec4:	f240 222f 	movw	r2, #559	@ 0x22f
  400ec8:	4905      	ldr	r1, [pc, #20]	@ (400ee0 <HAL_AssertFailed+0x20>)
  400eca:	4806      	ldr	r0, [pc, #24]	@ (400ee4 <HAL_AssertFailed+0x24>)
  400ecc:	9301      	str	r3, [sp, #4]
  400ece:	f450 fa45 	bl	5135c <rt_assert_handler>
  400ed2:	9b01      	ldr	r3, [sp, #4]
  400ed4:	2b00      	cmp	r3, #0
  400ed6:	d0fc      	beq.n	400ed2 <HAL_AssertFailed+0x12>
  400ed8:	b003      	add	sp, #12
  400eda:	f85d fb04 	ldr.w	pc, [sp], #4
  400ede:	bf00      	nop
  400ee0:	004014b0 	.word	0x004014b0
  400ee4:	0040129d 	.word	0x0040129d

00400ee8 <rt_hw_preboard_init>:
  400ee8:	4770      	bx	lr
	...

00400eec <rt_hw_board_init>:
  400eec:	b508      	push	{r3, lr}
  400eee:	f7ff fffb 	bl	400ee8 <rt_hw_preboard_init>
  400ef2:	f7ff fc92 	bl	40081a <HAL_Init>
  400ef6:	4808      	ldr	r0, [pc, #32]	@ (400f18 <rt_hw_board_init+0x2c>)
  400ef8:	f454 ff58 	bl	55dac <rt_thread_inited_sethook>
  400efc:	f7ff f949 	bl	400192 <SystemClock_Config>
  400f00:	f451 fbca 	bl	52698 <rt_hw_systick_init>
  400f04:	f451 fc12 	bl	5272c <rt_hw_watchdog_init>
  400f08:	4904      	ldr	r1, [pc, #16]	@ (400f1c <rt_hw_board_init+0x30>)
  400f0a:	4805      	ldr	r0, [pc, #20]	@ (400f20 <rt_hw_board_init+0x34>)
  400f0c:	f454 fb2c 	bl	55568 <rt_system_heap_init>
  400f10:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
  400f14:	f000 b826 	b.w	400f64 <rt_components_board_init>
  400f18:	00400e1d 	.word	0x00400e1d
  400f1c:	20405c00 	.word	0x20405c00
  400f20:	20401d78 	.word	0x20401d78

00400f24 <HAL_PreInit>:
  400f24:	b508      	push	{r3, lr}
  400f26:	f401 f843 	bl	1fb0 <HAL_LPAON_EnableXT48>
  400f2a:	f04f 4280 	mov.w	r2, #1073741824	@ 0x40000000
  400f2e:	6913      	ldr	r3, [r2, #16]
  400f30:	2101      	movs	r1, #1
  400f32:	f023 0303 	bic.w	r3, r3, #3
  400f36:	f043 0301 	orr.w	r3, r3, #1
  400f3a:	6113      	str	r3, [r2, #16]
  400f3c:	6913      	ldr	r3, [r2, #16]
  400f3e:	2002      	movs	r0, #2
  400f40:	f043 0310 	orr.w	r3, r3, #16
  400f44:	6113      	str	r3, [r2, #16]
  400f46:	2203      	movs	r2, #3
  400f48:	f401 f9fe 	bl	2348 <HAL_RCC_LCPU_SetDiv>
  400f4c:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
  400f50:	f7ff b91e 	b.w	400190 <HAL_MspInit>

00400f54 <rti_start>:
  400f54:	2000      	movs	r0, #0
  400f56:	4770      	bx	lr

00400f58 <rti_board_start>:
  400f58:	2000      	movs	r0, #0
  400f5a:	4770      	bx	lr

00400f5c <rti_board_end>:
  400f5c:	2000      	movs	r0, #0
  400f5e:	4770      	bx	lr

00400f60 <rti_end>:
  400f60:	2000      	movs	r0, #0
  400f62:	4770      	bx	lr

00400f64 <rt_components_board_init>:
  400f64:	b538      	push	{r3, r4, r5, lr}
  400f66:	4c04      	ldr	r4, [pc, #16]	@ (400f78 <rt_components_board_init+0x14>)
  400f68:	4d04      	ldr	r5, [pc, #16]	@ (400f7c <rt_components_board_init+0x18>)
  400f6a:	42ac      	cmp	r4, r5
  400f6c:	d300      	bcc.n	400f70 <rt_components_board_init+0xc>
  400f6e:	bd38      	pop	{r3, r4, r5, pc}
  400f70:	f854 3b04 	ldr.w	r3, [r4], #4
  400f74:	4798      	blx	r3
  400f76:	e7f8      	b.n	400f6a <rt_components_board_init+0x6>
  400f78:	004015e8 	.word	0x004015e8
  400f7c:	004015ec 	.word	0x004015ec

00400f80 <rt_components_init>:
  400f80:	b538      	push	{r3, r4, r5, lr}
  400f82:	4c05      	ldr	r4, [pc, #20]	@ (400f98 <rt_components_init+0x18>)
  400f84:	4d05      	ldr	r5, [pc, #20]	@ (400f9c <rt_components_init+0x1c>)
  400f86:	42ac      	cmp	r4, r5
  400f88:	d300      	bcc.n	400f8c <rt_components_init+0xc>
  400f8a:	bd38      	pop	{r3, r4, r5, pc}
  400f8c:	f854 3b04 	ldr.w	r3, [r4], #4
  400f90:	2b00      	cmp	r3, #0
  400f92:	d0f8      	beq.n	400f86 <rt_components_init+0x6>
  400f94:	4798      	blx	r3
  400f96:	e7f6      	b.n	400f86 <rt_components_init+0x6>
  400f98:	004015ec 	.word	0x004015ec
  400f9c:	0040160c 	.word	0x0040160c

00400fa0 <main_thread_entry>:
  400fa0:	b513      	push	{r0, r1, r4, lr}
  400fa2:	2402      	movs	r4, #2
  400fa4:	f88d 4006 	strb.w	r4, [sp, #6]
  400fa8:	f454 ff50 	bl	55e4c <rt_thread_self>
  400fac:	f890 3035 	ldrb.w	r3, [r0, #53]	@ 0x35
  400fb0:	f88d 3007 	strb.w	r3, [sp, #7]
  400fb4:	f454 ff4a 	bl	55e4c <rt_thread_self>
  400fb8:	4621      	mov	r1, r4
  400fba:	f10d 0206 	add.w	r2, sp, #6
  400fbe:	f454 fc59 	bl	55874 <rt_thread_control>
  400fc2:	f7ff ffdd 	bl	400f80 <rt_components_init>
  400fc6:	f454 ff41 	bl	55e4c <rt_thread_self>
  400fca:	4621      	mov	r1, r4
  400fcc:	f10d 0207 	add.w	r2, sp, #7
  400fd0:	f454 fc50 	bl	55874 <rt_thread_control>
  400fd4:	f7ff f916 	bl	400204 <main>
  400fd8:	b002      	add	sp, #8
  400fda:	bd10      	pop	{r4, pc}

00400fdc <pre_main>:
  400fdc:	4770      	bx	lr
	...

00400fe0 <rt_application_init>:
  400fe0:	2302      	movs	r3, #2
  400fe2:	2214      	movs	r2, #20
  400fe4:	b513      	push	{r0, r1, r4, lr}
  400fe6:	490b      	ldr	r1, [pc, #44]	@ (401014 <rt_application_init+0x34>)
  400fe8:	e9cd 3200 	strd	r3, r2, [sp]
  400fec:	480a      	ldr	r0, [pc, #40]	@ (401018 <rt_application_init+0x38>)
  400fee:	f44f 6380 	mov.w	r3, #1024	@ 0x400
  400ff2:	2200      	movs	r2, #0
  400ff4:	f454 fc86 	bl	55904 <rt_thread_create>
  400ff8:	4604      	mov	r4, r0
  400ffa:	b928      	cbnz	r0, 401008 <rt_application_init+0x28>
  400ffc:	f44f 72b3 	mov.w	r2, #358	@ 0x166
  401000:	4906      	ldr	r1, [pc, #24]	@ (40101c <rt_application_init+0x3c>)
  401002:	4807      	ldr	r0, [pc, #28]	@ (401020 <rt_application_init+0x40>)
  401004:	f450 f9aa 	bl	5135c <rt_assert_handler>
  401008:	4620      	mov	r0, r4
  40100a:	b002      	add	sp, #8
  40100c:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
  401010:	f454 bfba 	b.w	55f88 <rt_thread_startup>
  401014:	00400fa1 	.word	0x00400fa1
  401018:	00401409 	.word	0x00401409
  40101c:	004014c1 	.word	0x004014c1
  401020:	0040140e 	.word	0x0040140e

00401024 <rtthread_startup>:
  401024:	b508      	push	{r3, lr}
  401026:	f7ff f3d9 	bl	7dc <rt_hw_interrupt_disable>
  40102a:	f7ff f97b 	bl	400324 <rt_application_init_power_on_mode>
  40102e:	f7ff ff5d 	bl	400eec <rt_hw_board_init>
  401032:	f7ff f97d 	bl	400330 <SystemPowerOnModeGet>
  401036:	b908      	cbnz	r0, 40103c <rtthread_startup+0x18>
  401038:	f454 f9fb 	bl	55432 <rt_show_version>
  40103c:	f454 fc10 	bl	55860 <rt_system_timer_init>
  401040:	f454 fbe4 	bl	5580c <rt_system_scheduler_init>
  401044:	f7ff ffcc 	bl	400fe0 <rt_application_init>
  401048:	f454 fc12 	bl	55870 <rt_system_timer_thread_init>
  40104c:	f000 f81e 	bl	40108c <rt_thread_idle_init>
  401050:	f454 fbf2 	bl	55838 <rt_system_scheduler_start>
  401054:	2000      	movs	r0, #0
  401056:	bd08      	pop	{r3, pc}

00401058 <entry>:
  401058:	b508      	push	{r3, lr}
  40105a:	f7ff ffbf 	bl	400fdc <pre_main>
  40105e:	f7ff ffe1 	bl	401024 <rtthread_startup>
  401062:	2000      	movs	r0, #0
  401064:	bd08      	pop	{r3, pc}
	...

00401068 <rt_thread_idle_entry>:
  401068:	b538      	push	{r3, r4, r5, lr}
  40106a:	2400      	movs	r4, #0
  40106c:	4d06      	ldr	r5, [pc, #24]	@ (401088 <rt_thread_idle_entry+0x20>)
  40106e:	f855 3b04 	ldr.w	r3, [r5], #4
  401072:	b103      	cbz	r3, 401076 <rt_thread_idle_entry+0xe>
  401074:	4798      	blx	r3
  401076:	3401      	adds	r4, #1
  401078:	2c04      	cmp	r4, #4
  40107a:	d1f8      	bne.n	40106e <rt_thread_idle_entry+0x6>
  40107c:	f454 fdc2 	bl	55c04 <rt_thread_idle_excute>
  401080:	f454 fb00 	bl	55684 <rt_system_power_manager>
  401084:	e7f1      	b.n	40106a <rt_thread_idle_entry+0x2>
  401086:	bf00      	nop
  401088:	2040efec 	.word	0x2040efec

0040108c <rt_thread_idle_init>:
  40108c:	b51f      	push	{r0, r1, r2, r3, r4, lr}
  40108e:	2307      	movs	r3, #7
  401090:	2220      	movs	r2, #32
  401092:	e9cd 3202 	strd	r3, r2, [sp, #8]
  401096:	f44f 7300 	mov.w	r3, #512	@ 0x200
  40109a:	9301      	str	r3, [sp, #4]
  40109c:	4b06      	ldr	r3, [pc, #24]	@ (4010b8 <rt_thread_idle_init+0x2c>)
  40109e:	4a07      	ldr	r2, [pc, #28]	@ (4010bc <rt_thread_idle_init+0x30>)
  4010a0:	9300      	str	r3, [sp, #0]
  4010a2:	4907      	ldr	r1, [pc, #28]	@ (4010c0 <rt_thread_idle_init+0x34>)
  4010a4:	2300      	movs	r3, #0
  4010a6:	4807      	ldr	r0, [pc, #28]	@ (4010c4 <rt_thread_idle_init+0x38>)
  4010a8:	f454 fe44 	bl	55d34 <rt_thread_init>
  4010ac:	4805      	ldr	r0, [pc, #20]	@ (4010c4 <rt_thread_idle_init+0x38>)
  4010ae:	b005      	add	sp, #20
  4010b0:	f85d eb04 	ldr.w	lr, [sp], #4
  4010b4:	f454 bf68 	b.w	55f88 <rt_thread_startup>
  4010b8:	20401b78 	.word	0x20401b78
  4010bc:	00401069 	.word	0x00401069
  4010c0:	0040141d 	.word	0x0040141d
  4010c4:	2040ef70 	.word	0x2040ef70

004010c8 <rt_hw_set_stack_limit>:
  4010c8:	4770      	bx	lr
  4010ca:	0000      	movs	r0, r0
  4010cc:	f3ef 8010 	mrs	r0, PRIMASK
  4010d0:	b672      	cpsid	i
  4010d2:	4770      	bx	lr
  4010d4:	f380 8810 	msr	PRIMASK, r0
  4010d8:	4770      	bx	lr
  4010da:	bf40      	sev
  4010dc:	4a5f      	ldr	r2, [pc, #380]	@ (40125c <rt_hw_fatal_error+0x44>)
  4010de:	6813      	ldr	r3, [r2, #0]
  4010e0:	2b01      	cmp	r3, #1
  4010e2:	d004      	beq.n	4010ee <_reswitch>
  4010e4:	f04f 0301 	mov.w	r3, #1
  4010e8:	6013      	str	r3, [r2, #0]
  4010ea:	4a5d      	ldr	r2, [pc, #372]	@ (401260 <rt_hw_fatal_error+0x48>)
  4010ec:	6010      	str	r0, [r2, #0]

004010ee <_reswitch>:
  4010ee:	4a5d      	ldr	r2, [pc, #372]	@ (401264 <rt_hw_fatal_error+0x4c>)
  4010f0:	6011      	str	r1, [r2, #0]
  4010f2:	485d      	ldr	r0, [pc, #372]	@ (401268 <rt_hw_fatal_error+0x50>)
  4010f4:	f04f 5180 	mov.w	r1, #268435456	@ 0x10000000
  4010f8:	6001      	str	r1, [r0, #0]
  4010fa:	4770      	bx	lr
  4010fc:	f3ef 8210 	mrs	r2, PRIMASK
  401100:	b672      	cpsid	i
  401102:	4856      	ldr	r0, [pc, #344]	@ (40125c <rt_hw_fatal_error+0x44>)
  401104:	6801      	ldr	r1, [r0, #0]
  401106:	b1c9      	cbz	r1, 40113c <pendsv_exit>
  401108:	f04f 0100 	mov.w	r1, #0
  40110c:	6001      	str	r1, [r0, #0]
  40110e:	4854      	ldr	r0, [pc, #336]	@ (401260 <rt_hw_fatal_error+0x48>)
  401110:	6801      	ldr	r1, [r0, #0]
  401112:	b149      	cbz	r1, 401128 <switch_to_thread>
  401114:	f3ef 8109 	mrs	r1, PSP
  401118:	e921 0ff0 	stmdb	r1!, {r4, r5, r6, r7, r8, r9, sl, fp}
  40111c:	f3ef 840b 	mrs	r4, PSPLIM
  401120:	f841 4d04 	str.w	r4, [r1, #-4]!
  401124:	6800      	ldr	r0, [r0, #0]
  401126:	6001      	str	r1, [r0, #0]

00401128 <switch_to_thread>:
  401128:	494e      	ldr	r1, [pc, #312]	@ (401264 <rt_hw_fatal_error+0x4c>)
  40112a:	6809      	ldr	r1, [r1, #0]
  40112c:	6809      	ldr	r1, [r1, #0]
  40112e:	c910      	ldmia	r1!, {r4}
  401130:	f384 880b 	msr	PSPLIM, r4
  401134:	e8b1 0ff0 	ldmia.w	r1!, {r4, r5, r6, r7, r8, r9, sl, fp}
  401138:	f381 8809 	msr	PSP, r1

0040113c <pendsv_exit>:
  40113c:	f382 8810 	msr	PRIMASK, r2
  401140:	f04e 0e04 	orr.w	lr, lr, #4
  401144:	4770      	bx	lr
  401146:	4849      	ldr	r0, [pc, #292]	@ (40126c <rt_hw_fatal_error+0x54>)
  401148:	f44f 017f 	mov.w	r1, #16711680	@ 0xff0000
  40114c:	f8d0 2000 	ldr.w	r2, [r0]
  401150:	ea41 0102 	orr.w	r1, r1, r2
  401154:	6001      	str	r1, [r0, #0]
  401156:	4770      	bx	lr
  401158:	4942      	ldr	r1, [pc, #264]	@ (401264 <rt_hw_fatal_error+0x4c>)
  40115a:	6008      	str	r0, [r1, #0]
  40115c:	4940      	ldr	r1, [pc, #256]	@ (401260 <rt_hw_fatal_error+0x48>)
  40115e:	f04f 0000 	mov.w	r0, #0
  401162:	6008      	str	r0, [r1, #0]
  401164:	493d      	ldr	r1, [pc, #244]	@ (40125c <rt_hw_fatal_error+0x44>)
  401166:	f04f 0001 	mov.w	r0, #1
  40116a:	6008      	str	r0, [r1, #0]
  40116c:	483f      	ldr	r0, [pc, #252]	@ (40126c <rt_hw_fatal_error+0x54>)
  40116e:	f44f 017f 	mov.w	r1, #16711680	@ 0xff0000
  401172:	f8d0 2000 	ldr.w	r2, [r0]
  401176:	ea41 0102 	orr.w	r1, r1, r2
  40117a:	6001      	str	r1, [r0, #0]
  40117c:	483a      	ldr	r0, [pc, #232]	@ (401268 <rt_hw_fatal_error+0x50>)
  40117e:	f04f 5180 	mov.w	r1, #268435456	@ 0x10000000
  401182:	6001      	str	r1, [r0, #0]
  401184:	483a      	ldr	r0, [pc, #232]	@ (401270 <rt_hw_fatal_error+0x58>)
  401186:	6800      	ldr	r0, [r0, #0]
  401188:	6800      	ldr	r0, [r0, #0]
  40118a:	bf00      	nop
  40118c:	f380 8808 	msr	MSP, r0
  401190:	b661      	cpsie	f
  401192:	b662      	cpsie	i
  401194:	4770      	bx	lr
  401196:	bf00      	nop
  401198:	bf20      	wfe
  40119a:	4770      	bx	lr
  40119c:	f3ef 8008 	mrs	r0, MSP
  4011a0:	f01e 0f04 	tst.w	lr, #4
  4011a4:	d001      	beq.n	4011aa <_get_sp_done>
  4011a6:	f3ef 8009 	mrs	r0, PSP

004011aa <_get_sp_done>:
  4011aa:	e920 0ff0 	stmdb	r0!, {r4, r5, r6, r7, r8, r9, sl, fp}
  4011ae:	f3ef 840b 	mrs	r4, PSPLIM
  4011b2:	f840 4d04 	str.w	r4, [r0, #-4]!
  4011b6:	f840 ed04 	str.w	lr, [r0, #-4]!
  4011ba:	f01e 0f04 	tst.w	lr, #4
  4011be:	d002      	beq.n	4011c6 <_update_msp>
  4011c0:	f380 8809 	msr	PSP, r0
  4011c4:	e001      	b.n	4011ca <_update_done>

004011c6 <_update_msp>:
  4011c6:	f380 8808 	msr	MSP, r0

004011ca <_update_done>:
  4011ca:	b500      	push	{lr}
  4011cc:	f451 fa27 	bl	5261e <rt_hw_hard_fault_exception>
  4011d0:	f85d eb04 	ldr.w	lr, [sp], #4
  4011d4:	f04e 0e04 	orr.w	lr, lr, #4
  4011d8:	4770      	bx	lr
  4011da:	f3ef 8008 	mrs	r0, MSP
  4011de:	f01e 0f04 	tst.w	lr, #4
  4011e2:	d001      	beq.n	4011e8 <_mm_get_sp_done>
  4011e4:	f3ef 8009 	mrs	r0, PSP

004011e8 <_mm_get_sp_done>:
  4011e8:	e920 0ff0 	stmdb	r0!, {r4, r5, r6, r7, r8, r9, sl, fp}
  4011ec:	f3ef 840b 	mrs	r4, PSPLIM
  4011f0:	f840 4d04 	str.w	r4, [r0, #-4]!
  4011f4:	f840 ed04 	str.w	lr, [r0, #-4]!
  4011f8:	f01e 0f04 	tst.w	lr, #4
  4011fc:	d002      	beq.n	401204 <_mm_update_msp>
  4011fe:	f380 8809 	msr	PSP, r0
  401202:	e001      	b.n	401208 <_mm_update_done>

00401204 <_mm_update_msp>:
  401204:	f380 8808 	msr	MSP, r0

00401208 <_mm_update_done>:
  401208:	b500      	push	{lr}
  40120a:	f451 fa0b 	bl	52624 <rt_hw_mem_manage_exception>
  40120e:	f85d eb04 	ldr.w	lr, [sp], #4
  401212:	f04e 0e04 	orr.w	lr, lr, #4
  401216:	4770      	bx	lr

00401218 <rt_hw_fatal_error>:
  401218:	b410      	push	{r4}
  40121a:	f3ef 8403 	mrs	r4, PSR
  40121e:	b410      	push	{r4}
  401220:	467c      	mov	r4, pc
  401222:	b500      	push	{lr}
  401224:	b500      	push	{lr}
  401226:	f84d cd04 	str.w	ip, [sp, #-4]!
  40122a:	b40f      	push	{r0, r1, r2, r3}
  40122c:	9c08      	ldr	r4, [sp, #32]
  40122e:	e92d 0ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
  401232:	f3ef 840b 	mrs	r4, PSPLIM
  401236:	b410      	push	{r4}
  401238:	4668      	mov	r0, sp
  40123a:	f451 f9af 	bl	5259c <rt_hw_do_fatal_error>
  40123e:	bc10      	pop	{r4}
  401240:	f384 880b 	msr	PSPLIM, r4
  401244:	e8bd 0ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
  401248:	bc0f      	pop	{r0, r1, r2, r3}
  40124a:	f85d cb04 	ldr.w	ip, [sp], #4
  40124e:	f85d eb04 	ldr.w	lr, [sp], #4
  401252:	bc10      	pop	{r4}
  401254:	bc10      	pop	{r4}
  401256:	bc10      	pop	{r4}
  401258:	4770      	bx	lr
  40125a:	0000      	.short	0x0000
  40125c:	2040f8a4 	.word	0x2040f8a4
  401260:	2040f874 	.word	0x2040f874
  401264:	2040f878 	.word	0x2040f878
  401268:	e000ed04 	.word	0xe000ed04
  40126c:	e000ed20 	.word	0xe000ed20
  401270:	e000ed08 	.word	0xe000ed08

00401274 <memset>:
  401274:	4402      	add	r2, r0
  401276:	4603      	mov	r3, r0
  401278:	4293      	cmp	r3, r2
  40127a:	d100      	bne.n	40127e <memset+0xa>
  40127c:	4770      	bx	lr
  40127e:	f803 1b01 	strb.w	r1, [r3], #1
  401282:	e7f9      	b.n	401278 <memset+0x4>
  401284:	64695f71 	.word	0x64695f71
  401288:	203c2078 	.word	0x203c2078
  40128c:	5f435049 	.word	0x5f435049
  401290:	515f5748 	.word	0x515f5748
  401294:	45554555 	.word	0x45554555
  401298:	4d554e5f 	.word	0x4d554e5f
  40129c:	48003000 	.word	0x48003000
  4012a0:	4f5f4c41 	.word	0x4f5f4c41
  4012a4:	3d3d204b 	.word	0x3d3d204b
  4012a8:	72726520 	.word	0x72726520
  4012ac:	6e697000 	.word	0x6e697000
  4012b0:	6c616300 	.word	0x6c616300
  4012b4:	6361626c 	.word	0x6361626c
  4012b8:	3d21206b 	.word	0x3d21206b
  4012bc:	4c554e20 	.word	0x4c554e20
  4012c0:	6c74004c 	.word	0x6c74004c
  4012c4:	5f545200 	.word	0x5f545200
  4012c8:	534c4146 	.word	0x534c4146
  4012cc:	552f0045 	.word	0x552f0045
  4012d0:	73726573 	.word	0x73726573
  4012d4:	7669682f 	.word	0x7669682f
  4012d8:	6e6f7465 	.word	0x6e6f7465
  4012dc:	7669482f 	.word	0x7669482f
  4012e0:	6e6f7465 	.word	0x6e6f7465
  4012e4:	65646f43 	.word	0x65646f43
  4012e8:	7669482f 	.word	0x7669482f
  4012ec:	6e6f7465 	.word	0x6e6f7465
  4012f0:	6c646f57 	.word	0x6c646f57
  4012f4:	61695865 	.word	0x61695865
  4012f8:	69687a6f 	.word	0x69687a6f
  4012fc:	6b64732f 	.word	0x6b64732f
  401300:	6972642f 	.word	0x6972642f
  401304:	73726576 	.word	0x73726576
  401308:	6c61682f 	.word	0x6c61682f
  40130c:	3066622f 	.word	0x3066622f
  401310:	6c61685f 	.word	0x6c61685f
  401314:	69616d5f 	.word	0x69616d5f
  401318:	786f626c 	.word	0x786f626c
  40131c:	2f00632e 	.word	0x2f00632e
  401320:	72657355 	.word	0x72657355
  401324:	69682f73 	.word	0x69682f73
  401328:	6f746576 	.word	0x6f746576
  40132c:	69482f6e 	.word	0x69482f6e
  401330:	6f746576 	.word	0x6f746576
  401334:	646f436e 	.word	0x646f436e
  401338:	69482f65 	.word	0x69482f65
  40133c:	6f746576 	.word	0x6f746576
  401340:	646f576e 	.word	0x646f576e
  401344:	6958656c 	.word	0x6958656c
  401348:	687a6f61 	.word	0x687a6f61
  40134c:	64732f69 	.word	0x64732f69
  401350:	72642f6b 	.word	0x72642f6b
  401354:	72657669 	.word	0x72657669
  401358:	61682f73 	.word	0x61682f73
  40135c:	66622f6c 	.word	0x66622f6c
  401360:	61685f30 	.word	0x61685f30
  401364:	69705f6c 	.word	0x69705f6c
  401368:	78756d6e 	.word	0x78756d6e
  40136c:	2f00632e 	.word	0x2f00632e
  401370:	72657355 	.word	0x72657355
  401374:	69682f73 	.word	0x69682f73
  401378:	6f746576 	.word	0x6f746576
  40137c:	69482f6e 	.word	0x69482f6e
  401380:	6f746576 	.word	0x6f746576
  401384:	646f436e 	.word	0x646f436e
  401388:	69482f65 	.word	0x69482f65
  40138c:	6f746576 	.word	0x6f746576
  401390:	646f576e 	.word	0x646f576e
  401394:	6958656c 	.word	0x6958656c
  401398:	687a6f61 	.word	0x687a6f61
  40139c:	64732f69 	.word	0x64732f69
  4013a0:	72642f6b 	.word	0x72642f6b
  4013a4:	72657669 	.word	0x72657669
  4013a8:	61682f73 	.word	0x61682f73
  4013ac:	66622f6c 	.word	0x66622f6c
  4013b0:	61685f30 	.word	0x61685f30
  4013b4:	74705f6c 	.word	0x74705f6c
  4013b8:	00632e63 	.word	0x00632e63
  4013bc:	6573552f 	.word	0x6573552f
  4013c0:	682f7372 	.word	0x682f7372
  4013c4:	74657669 	.word	0x74657669
  4013c8:	482f6e6f 	.word	0x482f6e6f
  4013cc:	74657669 	.word	0x74657669
  4013d0:	6f436e6f 	.word	0x6f436e6f
  4013d4:	482f6564 	.word	0x482f6564
  4013d8:	74657669 	.word	0x74657669
  4013dc:	6f576e6f 	.word	0x6f576e6f
  4013e0:	58656c64 	.word	0x58656c64
  4013e4:	7a6f6169 	.word	0x7a6f6169
  4013e8:	732f6968 	.word	0x732f6968
  4013ec:	642f6b64 	.word	0x642f6b64
  4013f0:	65766972 	.word	0x65766972
  4013f4:	682f7372 	.word	0x682f7372
  4013f8:	622f6c61 	.word	0x622f6c61
  4013fc:	685f3066 	.word	0x685f3066
  401400:	725f6c61 	.word	0x725f6c61
  401404:	632e6363 	.word	0x632e6363
  401408:	69616d00 	.word	0x69616d00
  40140c:	6974006e 	.word	0x6974006e
  401410:	3d212064 	.word	0x3d212064
  401414:	5f545220 	.word	0x5f545220
  401418:	4c4c554e 	.word	0x4c4c554e
  40141c:	64697400 	.word	0x64697400
  401420:	656c      	.short	0x656c
	...

00401423 <__FUNCTION__.0>:
  401423:	6368 7570 6c32 7063 5f75 6f6e 6974 6966     hcpu2lcpu_notifi
  401433:	6163 6974 6e6f 635f 6c61 626c 6361 006b     cation_callback.

00401443 <__FUNCTION__.1>:
  401443:	4244 5f47 7254 6769 6567 5f72 5249 4851     DBG_Trigger_IRQH
  401453:	6e61 6c64 7265                               andler.

0040145a <__FUNCTION__.2>:
  40145a:	6d70 705f 6e69 725f 7365 6f74 6572 0000     pm_pin_restore..
	...

0040146c <sifli_pm_op>:
  40146c:	02f9 0040 02f7 0040 0000 0000               ..@...@.....

00401478 <pm_policy>:
  401478:	000a 0000 0003 0000                         ........

00401480 <g_ble_mac_pm_ops>:
  401480:	05d9 0040 0000 0000 0000 0000               ..@.........

0040148c <__FUNCTION__.0>:
  40148c:	6f70 7472 635f 6e6f 6966 0067               port_config.

00401498 <__FUNCTION__.3>:
  401498:	6f72 5f6d 6f70 7472 675f 7465                rom_port_get.

004014a5 <__FUNCTION__.0>:
  4014a5:	7470 5f63 6f63 666e 6769                     ptc_config.

004014b0 <__FUNCTION__.0>:
  4014b0:	4148 5f4c 7341 6573 7472 6146 6c69 6465     HAL_AssertFailed
	...

004014c1 <__FUNCTION__.0>:
  4014c1:	7472 615f 7070 696c 6163 6974 6e6f 695f     rt_application_i
  4014d1:	696e 0074                                    nit..

004014d6 <sifli_pm_run>:
  4014d6:	4770      	bx	lr

004014d8 <sifli_enter_idle>:
  4014d8:	4770      	bx	lr
	...

004014dc <pm_pin_restore>:
  4014dc:	b508      	push	{r3, lr}
  4014de:	480c      	ldr	r0, [pc, #48]	@ (401510 <pm_pin_restore+0x34>)
  4014e0:	f000 f856 	bl	401590 <HAL_PIN_Restore>
  4014e4:	b128      	cbz	r0, 4014f2 <pm_pin_restore+0x16>
  4014e6:	f240 1271 	movw	r2, #369	@ 0x171
  4014ea:	490a      	ldr	r1, [pc, #40]	@ (401514 <pm_pin_restore+0x38>)
  4014ec:	480a      	ldr	r0, [pc, #40]	@ (401518 <pm_pin_restore+0x3c>)
  4014ee:	f44f ff35 	bl	5135c <rt_assert_handler>
  4014f2:	2202      	movs	r2, #2
  4014f4:	4909      	ldr	r1, [pc, #36]	@ (40151c <pm_pin_restore+0x40>)
  4014f6:	480a      	ldr	r0, [pc, #40]	@ (401520 <pm_pin_restore+0x44>)
  4014f8:	f7ff f9d8 	bl	4008ac <HAL_GPIO_Restore>
  4014fc:	b138      	cbz	r0, 40150e <pm_pin_restore+0x32>
  4014fe:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
  401502:	f240 1275 	movw	r2, #373	@ 0x175
  401506:	4903      	ldr	r1, [pc, #12]	@ (401514 <pm_pin_restore+0x38>)
  401508:	4803      	ldr	r0, [pc, #12]	@ (401518 <pm_pin_restore+0x3c>)
  40150a:	f44f bf27 	b.w	5135c <rt_assert_handler>
  40150e:	bd08      	pop	{r3, pc}
  401510:	20401a88 	.word	0x20401a88
  401514:	0040145a 	.word	0x0040145a
  401518:	0040129f 	.word	0x0040129f
  40151c:	20401aa0 	.word	0x20401aa0
  401520:	40080000 	.word	0x40080000

00401524 <SystemPowerOnInitLCPU>:
  401524:	b538      	push	{r3, r4, r5, lr}
  401526:	4c16      	ldr	r4, [pc, #88]	@ (401580 <SystemPowerOnInitLCPU+0x5c>)
  401528:	6823      	ldr	r3, [r4, #0]
  40152a:	f003 0303 	and.w	r3, r3, #3
  40152e:	2b03      	cmp	r3, #3
  401530:	4b14      	ldr	r3, [pc, #80]	@ (401584 <SystemPowerOnInitLCPU+0x60>)
  401532:	d002      	beq.n	40153a <SystemPowerOnInitLCPU+0x16>
  401534:	2200      	movs	r2, #0
  401536:	701a      	strb	r2, [r3, #0]
  401538:	bd38      	pop	{r3, r4, r5, pc}
  40153a:	2501      	movs	r5, #1
  40153c:	701d      	strb	r5, [r3, #0]
  40153e:	f455 fbe1 	bl	56d04 <rt_wdt_restore>
  401542:	4a11      	ldr	r2, [pc, #68]	@ (401588 <SystemPowerOnInitLCPU+0x64>)
  401544:	6913      	ldr	r3, [r2, #16]
  401546:	f043 5300 	orr.w	r3, r3, #536870912	@ 0x20000000
  40154a:	6113      	str	r3, [r2, #16]
  40154c:	6c63      	ldr	r3, [r4, #68]	@ 0x44
  40154e:	f023 0302 	bic.w	r3, r3, #2
  401552:	6463      	str	r3, [r4, #68]	@ 0x44
  401554:	f7ff ffc2 	bl	4014dc <pm_pin_restore>
  401558:	6c63      	ldr	r3, [r4, #68]	@ 0x44
  40155a:	f023 0301 	bic.w	r3, r3, #1
  40155e:	6463      	str	r3, [r4, #68]	@ 0x44
  401560:	f7ff f95b 	bl	40081a <HAL_Init>
  401564:	f7ff f13a 	bl	7dc <rt_hw_interrupt_disable>
  401568:	4b08      	ldr	r3, [pc, #32]	@ (40158c <SystemPowerOnInitLCPU+0x68>)
  40156a:	601d      	str	r5, [r3, #0]
  40156c:	f7fe fe11 	bl	400192 <SystemClock_Config>
  401570:	f451 f892 	bl	52698 <rt_hw_systick_init>
  401574:	f7ff f16f 	bl	856 <rt_hw_cfg_pendsv_pri>
  401578:	f44f fb80 	bl	50c7c <restore_context>
  40157c:	e7dc      	b.n	401538 <SystemPowerOnInitLCPU+0x14>
  40157e:	bf00      	nop
  401580:	40040000 	.word	0x40040000
  401584:	2040fd54 	.word	0x2040fd54
  401588:	4000f000 	.word	0x4000f000
  40158c:	20401af8 	.word	0x20401af8

00401590 <HAL_PIN_Restore>:
  401590:	b510      	push	{r4, lr}
  401592:	4604      	mov	r4, r0
  401594:	b920      	cbnz	r0, 4015a0 <HAL_PIN_Restore+0x10>
  401596:	f640 01b5 	movw	r1, #2229	@ 0x8b5
  40159a:	480a      	ldr	r0, [pc, #40]	@ (4015c4 <HAL_PIN_Restore+0x34>)
  40159c:	f7ff fc90 	bl	400ec0 <HAL_AssertFailed>
  4015a0:	6822      	ldr	r2, [r4, #0]
  4015a2:	4b09      	ldr	r3, [pc, #36]	@ (4015c8 <HAL_PIN_Restore+0x38>)
  4015a4:	2000      	movs	r0, #0
  4015a6:	601a      	str	r2, [r3, #0]
  4015a8:	6862      	ldr	r2, [r4, #4]
  4015aa:	605a      	str	r2, [r3, #4]
  4015ac:	68a2      	ldr	r2, [r4, #8]
  4015ae:	609a      	str	r2, [r3, #8]
  4015b0:	68e2      	ldr	r2, [r4, #12]
  4015b2:	60da      	str	r2, [r3, #12]
  4015b4:	6922      	ldr	r2, [r4, #16]
  4015b6:	f503 4340 	add.w	r3, r3, #49152	@ 0xc000
  4015ba:	639a      	str	r2, [r3, #56]	@ 0x38
  4015bc:	6962      	ldr	r2, [r4, #20]
  4015be:	63da      	str	r2, [r3, #60]	@ 0x3c
  4015c0:	bd10      	pop	{r4, pc}
  4015c2:	bf00      	nop
  4015c4:	0040131f 	.word	0x0040131f
  4015c8:	40003000 	.word	0x40003000

004015cc <_init>:
  4015cc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
  4015ce:	bf00      	nop
  4015d0:	bcf8      	pop	{r3, r4, r5, r6, r7}
  4015d2:	bc08      	pop	{r3}
  4015d4:	469e      	mov	lr, r3
  4015d6:	4770      	bx	lr

004015d8 <_fini>:
  4015d8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
  4015da:	bf00      	nop
  4015dc:	bcf8      	pop	{r3, r4, r5, r6, r7}
  4015de:	bc08      	pop	{r3}
  4015e0:	469e      	mov	lr, r3
  4015e2:	4770      	bx	lr

004015e4 <__rt_init_rti_start>:
  4015e4:	0f55 0040                                   U.@.

004015e8 <__rt_init_rti_board_start>:
  4015e8:	0f59 0040                                   Y.@.

004015ec <__rt_init_rti_board_end>:
  4015ec:	0f5d 0040                                   ].@.

004015f0 <__rt_init_low_power_init>:
  4015f0:	0389 0040                                   ..@.

004015f4 <__rt_init_libc_system_init>:
  4015f4:	a6e1 0002                                   ....

004015f8 <__rt_init_rc10k_cal_init>:
  4015f8:	01c5 0040                                   ..@.

004015fc <__rt_init_sys_init_debug_trigger>:
  4015fc:	0261 0040                                   a.@.

00401600 <__rt_init_sys_init_lh_bt_audio_queue>:
  401600:	aced 0005                                   ....

00401604 <__rt_init_bt_audiopath_init>:
  401604:	04c5 0040                                   ..@.

00401608 <__rt_init_bluetooth_init>:
  401608:	0555 0040                                   U.@.

0040160c <__rt_init_rti_end>:
  40160c:	0f61 0040                                   a.@.

00401610 <__EH_FRAME_BEGIN__>:
  401610:	0000 0000                                   ....
