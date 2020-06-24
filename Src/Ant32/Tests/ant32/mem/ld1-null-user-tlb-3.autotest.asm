#note: r40 (the exception handler) and r46 (the start of usermode code) must
#be specified in hex (0xwhatever)
#I just don't see any reason not to, and it makes programming the script
#much nicer to deal with...

#load exception handler
    lc      r40, 0x80000064
    leh     r40

#enable exceptions
	cle

#load TLB entries
#virtual page 0 is for instructions
#virtual page 1 is for data
    lc      r46, 0x00000070 #usermode start address
    lc      r47, 1          #interrupts off
    lc      r48, 1          #in user mode
    lc      r42, 0x00000000 #denotes VPN 0
    lc      r43, 0x0000000d #denotes VPN 0 maps to physical page 0
							#and is fetchable, readable, and valid
    tlbse   r0, r42         #load into entry 0

    lc      r42, 0x00001000 #denotes VPN 1
    lc      r43, 0x0000101e #denotes VPN 1 maps to physical page 1
							#and is readable, writable, valid, and dirty
                            #(dirty to prevent taking a
                            #read-only exception)
    tlbse   r48, r42       #load into entry 1

#this last tlb entry is designed to produce a bus error
    lc      r44, 2          #load into TLB entry 2
    lc      r42, 0x3fffe000 #denotes VPN 0x3fffe
    lc      r43, 0x3fffe01f #map VPN 0x3fffe to page 0x3fffe
							#and is readable, writable, valid, and dirty
                            #(dirty to prevent taking a
                            #read-only exception)
    tlbse   r44, r42

    lc r50, 0x00003000
    lc r51, 0x0000301b
    lc r52, 10
    tlbse r52, r50
    tlble r60, r52

#warp to user mode
    rfe     r46, r47, r48

#handle exceptions
    lc  r49, 0xdeadbeef
    halt    #or rather don't =)

    lc r53, 0x00003000
    ld1 r54, r53, 0
    trap

#@expected values
#r50 = 0x00003000
#r51 = 0x0000301b
#r52 = 10
#r53 = 0x00003000
#r60 = 0x00003000
#r61 = 0x0000301b
#tlb 10:
#vpn = 0x00003
#ppn = 0x00003
#os = 0
#at = 0x01b
#e3 = 0x000000c8
#mode = S
#interrupts = off
#exceptions = off
#r40 = 0x80000064
#r46 = 0x00000070
#r47 = 1
#r48 = 1
#r42 = 0x3fffe000
#r43 = 0x3fffe01f
#r44 = 2
#r49 = 0xdeadbeef
#pc = 0x80000070
#e0 = 0x00000074
#e2 = 0x00003000
#e1 = 0x00000001
#tlb 0:
#   vpn = 0x00000
#   os = 0x000
#   ppn = 0x00000
#   at = 0x00d
#tlb 1:
#   vpn = 0x00001
#   os = 0x000
#   ppn = 0x00001
#   at = 0x01e
#tlb 2:
#   vpn = 0x3fffe
#   os = 0x000
#   ppn = 0x3fffe
#   at = 0x01f

