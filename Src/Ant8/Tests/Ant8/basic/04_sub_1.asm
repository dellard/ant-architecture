# $Id: 04_sub_1.asm,v 1.2 2001/03/22 00:39:03 ellard Exp $
#
# Copyright 1999-2000 by the President and Fellows of Harvard College.
# See LICENSE.txt for license information.
#
#@ tests sub with overflow.
# OK

	lc r2, -100
	lc r3, 100

	sub r4, r2, r3
	add r5, r1, r0

	sub r6, r3, r2
	add r7, r1, r0

	sub r8, r2, r2
	add r9, r1, r0

	sub r10, r3, r3
	add r11, r1, r0

	hlt

