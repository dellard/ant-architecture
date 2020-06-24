# $Id: 10_ld_2.asm,v 1.3 2001/03/22 00:38:59 ellard Exp $
#
# Copyright 1999-2001 by the President and Fellows of Harvard College.
# See LICENSE.txt for license information.
#
#@ Tests basic ld1 functionality
#@ Makes sure that the address isn't simply loaded into the des...
# OK

	lc r2, $a
	lc r3, $b
	lc r4, $c
	lc r5, $d
	lc r6, $e
	lc r7, $f
	lc r8, $g

	ld r9, r2, 0
	ld r10, r3, 0
	ld r11, r4, 0
	ld r12, r5, 0
	ld r13, r6, 0
	ld r14, r7, 0
	ld r15, r8, 0

	hlt


_data_:

a:
	.byte	'a' , 0001, 0002, 0003, 0004, 0005, 0006, 0007
	.byte	0020, 0021, 0022, 0023, 0024, 0025, 0026, 0027
	.byte	0030, 0031, 0032, 0033, 0034, 0035, 0036, 0037
b:
	.byte	'b' , 0041, 0042, 0043, 0044, 0045, 0046, 0047
	.byte	0060, 0061, 0062, 0063, 0064, 0065, 0066, 0067
	.byte	0070, 0071, 0072, 0073, 0074, 0075, 0076, 0077

c:
	.byte	'c' , 0101, 0102, 0103, 0104, 0105, 0106, 0107
	.byte	0120, 0121, 0122, 0123, 0124, 0125, 0126, 0127
	.byte	0130, 0131, 0132, 0133, 0134, 0135, 0136, 0137
d:
	.byte	'd' , 0141, 0142, 0143, 0144, 0145, 0146, 0147
	.byte	0160, 0161, 0162, 0163, 0164, 0165, 0166, 0167
	.byte	0170, 0171, 0172, 0173, 0174, 0175, 0176, 0177

e:
	.byte	'e' , 0201, 0202, 0203, 0204, 0205, 0206, 0207
	.byte	0260, 0261, 0262, 0263, 0264, 0265, 0266, 0267
	.byte	0270, 0271, 0272, 0273, 0274, 0275, 0276, 0277

f:
	.byte	'f' , 0301, 0302, 0303, 0304, 0305, 0306, 0307
	.byte	0320, 0321, 0322, 0323, 0324, 0325, 0326, 0327
	.byte	0330, 0331, 0332, 0333, 0334, 0335, 0336, 0337
g:
	.byte	'g', 0341, 0342, 0343, 0344, 0345, 0346, 0347
	.byte	0360, 0361, 0362, 0363, 0364, 0365, 0366, 0367
	.byte	0370, 0371, 0372, 0373, 0374, 0375, 0376, 0377
