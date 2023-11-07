;@
;@  CXD1095Q.s
;@  Sony CXD1095Q io chip emulator for arm32.
;@
;@  Created by Fredrik Ahlström on 2015-05-27.
;@  Copyright © 2015-2022 Fredrik Ahlström. All rights reserved.
;@
#ifdef __arm__

#include "CXD1095Q.i"

	.syntax unified
	.arm

	.section .text
	.align 2
;@----------------------------------------------------------------------------
CXD1095QReset:				;@ cxdptr=r12=pointer to struct
	.global CXD1095QReset
;@----------------------------------------------------------------------------
	stmfd sp!,{lr}

	mov r0,#0
	mov r2,#cxdSize/4
regLoop:
	subs r2,r2,#1
	strpl r0,[cxdptr,r2,lsl#2]
	bhi regLoop

	ldmfd sp!,{lr}
	bx lr
;@----------------------------------------------------------------------------
CXD1095QW:
	.global CXD1095QW
;@----------------------------------------------------------------------------
	and r1,r1,#0x7
	strb r0,[cxdptr,r1]
	ldr pc,[pc,r1,lsl#2]
	.long 0
cxdWriteTable:
	.long CXD1095QReg0W
	.long CXD1095QReg1W
	.long CXD1095QReg2W
	.long CXD1095QReg3W
	.long CXD1095QReg4W
	.long CXD1095QReg5W
	.long CXD1095QReg6W
	.long CXD1095QReg7W
;@----------------------------------------------------------------------------
CXD1095QReg0W:
	ldrb r1,[cxdptr,#cxdRegister1]
	eor r1,r1,#0x03
	tst r1,#0x03
	ldrne r1,[cxdptr,#cxdPortAOutFptr]
	cmpne r1,#0
	bxne r1
	bx lr
CXD1095QReg1W:
	ldrb r1,[cxdptr,#cxdRegister1]
	eor r1,r1,#0x0C
	tst r1,#0x0C
	ldrne r1,[cxdptr,#cxdPortBOutFptr]
	cmpne r1,#0
	bxne r1
	bx lr
CXD1095QReg2W:
	ldrb r1,[cxdptr,#cxdRegister1]
	eor r1,r1,#0x30
	tst r1,#0x30
	ldrne r1,[cxdptr,#cxdPortCOutFptr]
	cmpne r1,#0
	bxne r1
	bx lr
CXD1095QReg3W:
	ldrb r1,[cxdptr,#cxdRegister1]
	eor r1,r1,#0xC0
	tst r1,#0xC0
	ldrne r1,[cxdptr,#cxdPortDOutFptr]
	cmpne r1,#0
	bxne r1
	bx lr
CXD1095QReg4W:
	ldrb r1,[cxdptr,#cxdRegister2]
	eor r1,r1,#0x0F
	tst r1,#0x0F
	ldrne r1,[cxdptr,#cxdPortEOutFptr]
	cmpne r1,#0
	bxne r1
	bx lr
;@----------------------------------------------------------------------------
CXD1095QReg5W:
//	bx lr
;@----------------------------------------------------------------------------
CXD1095QReg6W:
//	bx lr
;@----------------------------------------------------------------------------
CXD1095QReg7W:
	bx lr


;@----------------------------------------------------------------------------
CXD1095QR:
	.global CXD1095QR
;@----------------------------------------------------------------------------
	and r1,r1,#0x7
	ldr pc,[pc,r1,lsl#2]
	.long 0
cxdReadTable:
	.long CXD1095QReg0R
	.long CXD1095QReg1R
	.long CXD1095QReg2R
	.long CXD1095QReg3R
	.long CXD1095QReg4R
	.long CXD1095QReg5R
	.long CXD1095QReg6R
	.long CXD1095QReg7R
;@----------------------------------------------------------------------------
CXD1095QReg0R:
	stmfd sp!,{r4,lr}
	ldrb r4,[cxdptr,#cxdRegister1]
	ands r4,r4,#0x03
	ldrne r1,[cxdptr,#cxdPortAInFptr]
	cmpne r1,#0
	ldrbeq r0,[cxdptr,#cxdPortAIn]
	blxne r1
	movs r4,r4,lsl#31
	orrcs r4,r4,#0xF0
	orrmi r4,r4,#0x0F
	ldrb r2,[cxdptr,#cxdPortAOut]
	and r0,r0,r4
	bic r2,r2,r4
	orr r0,r0,r2
	ldmfd sp!,{r4,lr}
	bx lr
;@----------------------------------------------------------------------------
CXD1095QReg1R:
	stmfd sp!,{r4,lr}
	ldrb r4,[cxdptr,#cxdRegister1]
	ands r4,r4,#0x0C
	ldrne r1,[cxdptr,#cxdPortBInFptr]
	cmpne r1,#0
	ldrbeq r0,[cxdptr,#cxdPortBIn]
	blxne r1
	movs r4,r4,lsl#29
	orrcs r4,r4,#0xF0
	orrmi r4,r4,#0x0F
	ldrb r2,[cxdptr,#cxdPortBOut]
	and r0,r0,r4
	bic r2,r2,r4
	orr r0,r0,r2
	ldmfd sp!,{r4,lr}
	bx lr
;@----------------------------------------------------------------------------
CXD1095QReg2R:
	stmfd sp!,{r4,lr}
	ldrb r4,[cxdptr,#cxdRegister1]
	ands r4,r4,#0x30
	ldrne r1,[cxdptr,#cxdPortCInFptr]
	cmpne r1,#0
	ldrbeq r0,[cxdptr,#cxdPortCIn]
	blxne r1
	movs r4,r4,lsl#27
	orrcs r4,r4,#0xF0
	orrmi r4,r4,#0x0F
	ldrb r2,[cxdptr,#cxdPortCOut]
	and r0,r0,r4
	bic r2,r2,r4
	orr r0,r0,r2
	ldmfd sp!,{r4,lr}
	bx lr
;@----------------------------------------------------------------------------
CXD1095QReg3R:
	stmfd sp!,{r4,lr}
	ldrb r4,[cxdptr,#cxdRegister1]
	ands r4,r4,#0xC0
	ldrne r1,[cxdptr,#cxdPortDInFptr]
	cmpne r1,#0
	ldrbeq r0,[cxdptr,#cxdPortDIn]
	blxne r1
	movs r4,r4,lsl#25
	orrcs r4,r4,#0xF0
	orrmi r4,r4,#0x0F
	ldrb r2,[cxdptr,#cxdPortDOut]
	and r0,r0,r4
	bic r2,r2,r4
	orr r0,r0,r2
	ldmfd sp!,{r4,lr}
	bx lr
;@----------------------------------------------------------------------------
CXD1095QReg4R:
	stmfd sp!,{r4,lr}
	ldrb r4,[cxdptr,#cxdRegister2]
	ands r4,r4,#0x0F
	ldrne r1,[cxdptr,#cxdPortEInFptr]
	cmpne r1,#0
	ldrbeq r0,[cxdptr,#cxdPortEIn]
	blxne r1
	ldrb r2,[cxdptr,#cxdPortEOut]
	and r0,r0,r4
	bic r2,r2,r4
	orr r0,r0,r2
	and r0,r0,#0x0F
	ldmfd sp!,{r4,lr}
	bx lr
;@----------------------------------------------------------------------------
CXD1095QReg5R:
CXD1095QReg6R:
CXD1095QReg7R:
	mov r0,#0x00
	bx lr
;@----------------------------------------------------------------------------
	.end
#endif // #ifdef __arm__
