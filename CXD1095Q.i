;@ ASM header for the CXD1095Q emulator
;@

	cxdptr			.req r12

							;@ CXD1095Q.s
	.struct 0

	cxdRegisters:
	cxdPortAOut:		.byte 0
	cxdPortBOut:		.byte 0
	cxdPortCOut:		.byte 0
	cxdPortDOut:		.byte 0
	cxdPortEOut:		.byte 0
	cxdPadding1:		.space 1
	cxdRegister1:		.byte 0
	cxdRegister2:		.byte 0

	cxdPortAIn:			.byte 0
	cxdPortBIn:			.byte 0
	cxdPortCIn:			.byte 0
	cxdPortDIn:			.byte 0
	cxdPortEIn:			.byte 0
	cxdPadding2:		.space 3

	cxdPortAOutFptr:	.long 0
	cxdPortBOutFptr:	.long 0
	cxdPortCOutFptr:	.long 0
	cxdPortDOutFptr:	.long 0
	cxdPortEOutFptr:	.long 0
	cxdPortAInFptr:		.long 0
	cxdPortBInFptr:		.long 0
	cxdPortCInFptr:		.long 0
	cxdPortDInFptr:		.long 0
	cxdPortEInFptr:		.long 0

	cxdSize:

;@----------------------------------------------------------------------------

