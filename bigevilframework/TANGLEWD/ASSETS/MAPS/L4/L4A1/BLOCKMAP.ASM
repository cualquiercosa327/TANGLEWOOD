; == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == ==
;   **AUTOGENERATED WITH BEEHIVE** - the complete art tool for SEGA Mega Drive
; == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == ==
;   http://www.bigevilcorporation.co.uk
; == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == ==
;   Beehive and SEGA Genesis Framework (c) Matt Phillips 2015
; == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == ==


map_blockmap_L4A1_size_b	equ 0x00001932	; Size in bytes
map_blockmap_L4A1_size_w	equ (map_blockmap_L4A1_size_b/2)	; Size in words
map_blockmap_L4A1_size_l	equ (map_blockmap_L4A1_size_b/4)	; Size in longwords
map_L4A1_width	equ 0x4B0
map_L4A1_height	equ 0x5C
map_blockmap_L4A1_width	equ 0x12C
map_blockmap_L4A1_height	equ 0x17

map_blockmap_L4A1_coloffsets:
	dc.w 0x0000
	dc.w 0x001A
	dc.w 0x0034
	dc.w 0x0042
	dc.w 0x004E
	dc.w 0x005A
	dc.w 0x006E
	dc.w 0x0098
	dc.w 0x00C4
	dc.w 0x00E0
	dc.w 0x00FC
	dc.w 0x0116
	dc.w 0x012C
	dc.w 0x013E
	dc.w 0x014E
	dc.w 0x015E
	dc.w 0x016C
	dc.w 0x017C
	dc.w 0x0188
	dc.w 0x0198
	dc.w 0x01A6
	dc.w 0x01B4
	dc.w 0x01C2
	dc.w 0x01D0
	dc.w 0x01E2
	dc.w 0x01F4
	dc.w 0x0204
	dc.w 0x0226
	dc.w 0x024A
	dc.w 0x025C
	dc.w 0x026E
	dc.w 0x0280
	dc.w 0x0294
	dc.w 0x02A8
	dc.w 0x02BA
	dc.w 0x02CC
	dc.w 0x02E0
	dc.w 0x02F4
	dc.w 0x0308
	dc.w 0x031C
	dc.w 0x032E
	dc.w 0x0340
	dc.w 0x0352
	dc.w 0x0366
	dc.w 0x037A
	dc.w 0x038C
	dc.w 0x039A
	dc.w 0x03A6
	dc.w 0x03BA
	dc.w 0x03D0
	dc.w 0x03DC
	dc.w 0x03EE
	dc.w 0x0400
	dc.w 0x040C
	dc.w 0x0418
	dc.w 0x0424
	dc.w 0x0430
	dc.w 0x043A
	dc.w 0x0444
	dc.w 0x0450
	dc.w 0x045C
	dc.w 0x0470
	dc.w 0x0482
	dc.w 0x0494
	dc.w 0x04B4
	dc.w 0x04D4
	dc.w 0x04EC
	dc.w 0x0504
	dc.w 0x0518
	dc.w 0x052C
	dc.w 0x053A
	dc.w 0x0548
	dc.w 0x0558
	dc.w 0x0566
	dc.w 0x0574
	dc.w 0x0580
	dc.w 0x0590
	dc.w 0x059E
	dc.w 0x05AA
	dc.w 0x05B6
	dc.w 0x05C8
	dc.w 0x05D6
	dc.w 0x05E2
	dc.w 0x05F2
	dc.w 0x0602
	dc.w 0x0612
	dc.w 0x0622
	dc.w 0x0636
	dc.w 0x064E
	dc.w 0x066C
	dc.w 0x0688
	dc.w 0x06A4
	dc.w 0x06C0
	dc.w 0x06DA
	dc.w 0x06F6
	dc.w 0x0712
	dc.w 0x072E
	dc.w 0x0744
	dc.w 0x075A
	dc.w 0x0770
	dc.w 0x078A
	dc.w 0x07A4
	dc.w 0x07BE
	dc.w 0x07DA
	dc.w 0x07F4
	dc.w 0x080C
	dc.w 0x0822
	dc.w 0x0832
	dc.w 0x0846
	dc.w 0x085A
	dc.w 0x086E
	dc.w 0x0880
	dc.w 0x0896
	dc.w 0x08A8
	dc.w 0x08C2
	dc.w 0x08DE
	dc.w 0x08FA
	dc.w 0x0916
	dc.w 0x092C
	dc.w 0x0942
	dc.w 0x0958
	dc.w 0x096C
	dc.w 0x097A
	dc.w 0x0988
	dc.w 0x099C
	dc.w 0x09B0
	dc.w 0x09CA
	dc.w 0x09E6
	dc.w 0x0A02
	dc.w 0x0A1E
	dc.w 0x0A38
	dc.w 0x0A54
	dc.w 0x0A70
	dc.w 0x0A8C
	dc.w 0x0AA2
	dc.w 0x0AB2
	dc.w 0x0AC2
	dc.w 0x0ACE
	dc.w 0x0ADC
	dc.w 0x0AF2
	dc.w 0x0B08
	dc.w 0x0B16
	dc.w 0x0B24
	dc.w 0x0B30
	dc.w 0x0B3C
	dc.w 0x0B48
	dc.w 0x0B54
	dc.w 0x0B66
	dc.w 0x0B78
	dc.w 0x0B8E
	dc.w 0x0BA6
	dc.w 0x0BBE
	dc.w 0x0BD6
	dc.w 0x0BEE
	dc.w 0x0C06
	dc.w 0x0C20
	dc.w 0x0C3A
	dc.w 0x0C54
	dc.w 0x0C6E
	dc.w 0x0C88
	dc.w 0x0CA2
	dc.w 0x0CC6
	dc.w 0x0CE6
	dc.w 0x0D04
	dc.w 0x0D1E
	dc.w 0x0D38
	dc.w 0x0D52
	dc.w 0x0D6A
	dc.w 0x0D82
	dc.w 0x0D9A
	dc.w 0x0DB2
	dc.w 0x0DC8
	dc.w 0x0DDE
	dc.w 0x0DF4
	dc.w 0x0E0A
	dc.w 0x0E22
	dc.w 0x0E3A
	dc.w 0x0E52
	dc.w 0x0E68
	dc.w 0x0E7C
	dc.w 0x0E90
	dc.w 0x0EA8
	dc.w 0x0EC4
	dc.w 0x0EE0
	dc.w 0x0F00
	dc.w 0x0F24
	dc.w 0x0F46
	dc.w 0x0F66
	dc.w 0x0F88
	dc.w 0x0FAA
	dc.w 0x0FC0
	dc.w 0x0FD6
	dc.w 0x0FEC
	dc.w 0x1004
	dc.w 0x1018
	dc.w 0x1032
	dc.w 0x104A
	dc.w 0x1060
	dc.w 0x1076
	dc.w 0x1090
	dc.w 0x10AA
	dc.w 0x10C2
	dc.w 0x10DE
	dc.w 0x10FA
	dc.w 0x1116
	dc.w 0x1130
	dc.w 0x1144
	dc.w 0x115C
	dc.w 0x1174
	dc.w 0x118C
	dc.w 0x119E
	dc.w 0x11B0
	dc.w 0x11C2
	dc.w 0x11D4
	dc.w 0x11E8
	dc.w 0x11FA
	dc.w 0x120C
	dc.w 0x121E
	dc.w 0x1230
	dc.w 0x1242
	dc.w 0x1254
	dc.w 0x1266
	dc.w 0x127A
	dc.w 0x128E
	dc.w 0x12A2
	dc.w 0x12B2
	dc.w 0x12C2
	dc.w 0x12DE
	dc.w 0x12FA
	dc.w 0x1316
	dc.w 0x1336
	dc.w 0x1354
	dc.w 0x136C
	dc.w 0x1384
	dc.w 0x139C
	dc.w 0x13B6
	dc.w 0x13CC
	dc.w 0x13E2
	dc.w 0x13FC
	dc.w 0x1410
	dc.w 0x1424
	dc.w 0x1434
	dc.w 0x1448
	dc.w 0x145C
	dc.w 0x1474
	dc.w 0x148C
	dc.w 0x149E
	dc.w 0x14B4
	dc.w 0x14C8
	dc.w 0x14DC
	dc.w 0x14F2
	dc.w 0x150A
	dc.w 0x1522
	dc.w 0x1538
	dc.w 0x154E
	dc.w 0x1564
	dc.w 0x157A
	dc.w 0x1586
	dc.w 0x1594
	dc.w 0x15A2
	dc.w 0x15B4
	dc.w 0x15C6
	dc.w 0x15DC
	dc.w 0x15F2
	dc.w 0x1608
	dc.w 0x1630
	dc.w 0x1658
	dc.w 0x1680
	dc.w 0x16A8
	dc.w 0x16B8
	dc.w 0x16C8
	dc.w 0x16DC
	dc.w 0x16F0
	dc.w 0x1702
	dc.w 0x1716
	dc.w 0x172A
	dc.w 0x173E
	dc.w 0x1750
	dc.w 0x1764
	dc.w 0x1778
	dc.w 0x1788
	dc.w 0x179A
	dc.w 0x17B2
	dc.w 0x17CA
	dc.w 0x17E2
	dc.w 0x17FA
	dc.w 0x180A
	dc.w 0x181A
	dc.w 0x182C
	dc.w 0x183C
	dc.w 0x184C
	dc.w 0x185C
	dc.w 0x1870
	dc.w 0x188A
	dc.w 0x18A2
	dc.w 0x18BA
	dc.w 0x18D2
	dc.w 0x18EA
	dc.w 0x1902
	dc.w 0x191A
