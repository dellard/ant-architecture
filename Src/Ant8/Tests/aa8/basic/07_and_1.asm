# $Id: 07_and_1.asm,v 1.3 2001/03/22 00:38:59 ellard Exp $
#
# Copyright 1999-2001 by the President and Fellows of Harvard College.
# See LICENSE.txt for license information.
#
#@ tests bitwise and
# OK

	lc r2, 0b11100100
	lc r3, 0b00011011
	lc r4, 0b10101010
	lc r5, 0b01010101

	and r6, r2, r3
	add r7, r1, r0

	and r8, r2, r4
	add r9, r1, r0

	and r10, r2, r5
	add r11, r1, r0

	and r12, r3, r4
	add r13, r1, r0

	and r14, r3, r5
	add r15, r1, r0

	hlt

