# $Id: 02_add_r1.asm,v 1.2 2001/03/22 00:39:03 ellard Exp $
#
# Copyright 1999-2000 by the President and Fellows of Harvard College.
# See LICENSE.txt for license information.
#
#@ tests add for r1
# OK

	lc r2, 1
	add r1, r2, r2

	hlt
