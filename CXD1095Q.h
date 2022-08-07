//
//  CXD1095Q.h
//  Sony CXD1095Q io chip emulator for arm32.
//
//  Created by Fredrik Ahlström on 2015-05-27.
//  Copyright © 2015-2022 Fredrik Ahlström. All rights reserved.
//

#ifndef CXD1095Q_HEADER
#define CXD1095Q_HEADER

typedef struct {
	u8 cxdPortAOut;
	u8 cxdPortBOut;
	u8 cxdPortCOut;
	u8 cxdPortDOut;
	u8 cxdPortEOut;
	u8 cxdPadding1;
	u8 cxdRegister1;
	u8 cxdRegister2;

	u8 cxdPortAIn;
	u8 cxdPortBIn;
	u8 cxdPortCIn;
	u8 cxdPortDIn;
	u8 cxdPortEIn;
	u8 cxdPadding2[3];

	u32 cxdPortAOutFptr;
	u32 cxdPortBOutFptr;
	u32 cxdPortCOutFptr;
	u32 cxdPortDOutFptr;
	u32 cxdPortEOutFptr;
	u32 cxdPortAInFptr;
	u32 cxdPortBInFptr;
	u32 cxdPortCInFptr;
	u32 cxdPortDInFptr;
	u32 cxdPortEInFptr;
} cxd1095Q;


void CXD1095QReset(cxd1095Q *chip);
void CXD1095QW(cxd1095Q *chip, int adr, u8 value);
void CXD1095QR(cxd1095Q *chip, int adr);


#endif
