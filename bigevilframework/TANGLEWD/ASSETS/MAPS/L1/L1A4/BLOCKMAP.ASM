; == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == ==
;   **AUTOGENERATED WITH BEEHIVE** - the complete art tool for SEGA Mega Drive
; == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == ==
;   http://www.bigevilcorporation.co.uk
; == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == ==
;   Beehive and SEGA Genesis Framework (c) Matt Phillips 2015
; == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == ==


map_blockmap_L1A4_size_b	equ 0x0000258E	; Size in bytes
map_blockmap_L1A4_size_w	equ (map_blockmap_L1A4_size_b/2)	; Size in words
map_blockmap_L1A4_size_l	equ (map_blockmap_L1A4_size_b/4)	; Size in longwords
map_L1A4_width	equ 0x5DC
map_L1A4_height	equ 0x8C
map_blockmap_L1A4_width	equ 0x177
map_blockmap_L1A4_height	equ 0x23

map_blockmap_L1A4_coloffsets:
	dc.w 0x0000
	dc.w 0x0012
	dc.w 0x0024
	dc.w 0x0036
	dc.w 0x004C
	dc.w 0x0062
	dc.w 0x0074
	dc.w 0x0086
	dc.w 0x0098
	dc.w 0x00AA
	dc.w 0x00BC
	dc.w 0x00CE
	dc.w 0x00E4
	dc.w 0x00FA
	dc.w 0x010C
	dc.w 0x011E
	dc.w 0x0130
	dc.w 0x0142
	dc.w 0x0154
	dc.w 0x0166
	dc.w 0x0178
	dc.w 0x018C
	dc.w 0x01A2
	dc.w 0x01B8
	dc.w 0x01D8
	dc.w 0x0204
	dc.w 0x022E
	dc.w 0x024A
	dc.w 0x025A
	dc.w 0x0268
	dc.w 0x0278
	dc.w 0x0286
	dc.w 0x0294
	dc.w 0x02A2
	dc.w 0x02B0
	dc.w 0x02BE
	dc.w 0x02CC
	dc.w 0x02DA
	dc.w 0x02EA
	dc.w 0x02F8
	dc.w 0x0306
	dc.w 0x0314
	dc.w 0x0324
	dc.w 0x0332
	dc.w 0x0340
	dc.w 0x0356
	dc.w 0x036E
	dc.w 0x0386
	dc.w 0x039E
	dc.w 0x03B6
	dc.w 0x03DA
	dc.w 0x03FE
	dc.w 0x0420
	dc.w 0x043E
	dc.w 0x0458
	dc.w 0x0474
	dc.w 0x048E
	dc.w 0x04A8
	dc.w 0x04C6
	dc.w 0x04E4
	dc.w 0x0502
	dc.w 0x0526
	dc.w 0x0552
	dc.w 0x057E
	dc.w 0x05AA
	dc.w 0x05D4
	dc.w 0x05F0
	dc.w 0x060E
	dc.w 0x062C
	dc.w 0x0648
	dc.w 0x065A
	dc.w 0x066A
	dc.w 0x0688
	dc.w 0x06B2
	dc.w 0x06E0
	dc.w 0x0700
	dc.w 0x0716
	dc.w 0x072C
	dc.w 0x0740
	dc.w 0x0754
	dc.w 0x0768
	dc.w 0x077C
	dc.w 0x0790
	dc.w 0x07A4
	dc.w 0x07B8
	dc.w 0x07CC
	dc.w 0x07E0
	dc.w 0x07F4
	dc.w 0x0808
	dc.w 0x081C
	dc.w 0x0830
	dc.w 0x0844
	dc.w 0x085A
	dc.w 0x0870
	dc.w 0x0888
	dc.w 0x08A4
	dc.w 0x08BE
	dc.w 0x08D6
	dc.w 0x08EE
	dc.w 0x0908
	dc.w 0x091E
	dc.w 0x0932
	dc.w 0x094E
	dc.w 0x096E
	dc.w 0x098E
	dc.w 0x09A0
	dc.w 0x09AE
	dc.w 0x09BC
	dc.w 0x09CA
	dc.w 0x09D8
	dc.w 0x09E6
	dc.w 0x09F4
	dc.w 0x0A04
	dc.w 0x0A16
	dc.w 0x0A46
	dc.w 0x0A74
	dc.w 0x0A90
	dc.w 0x0AB4
	dc.w 0x0ADA
	dc.w 0x0AF6
	dc.w 0x0B0E
	dc.w 0x0B2E
	dc.w 0x0B4E
	dc.w 0x0B6A
	dc.w 0x0B86
	dc.w 0x0BA2
	dc.w 0x0BBA
	dc.w 0x0BD0
	dc.w 0x0BE6
	dc.w 0x0BFA
	dc.w 0x0C0C
	dc.w 0x0C1E
	dc.w 0x0C32
	dc.w 0x0C42
	dc.w 0x0C50
	dc.w 0x0C5E
	dc.w 0x0C6E
	dc.w 0x0C7E
	dc.w 0x0C8E
	dc.w 0x0C9E
	dc.w 0x0CAE
	dc.w 0x0CBE
	dc.w 0x0CCC
	dc.w 0x0CDA
	dc.w 0x0CE8
	dc.w 0x0CF6
	dc.w 0x0D04
	dc.w 0x0D12
	dc.w 0x0D20
	dc.w 0x0D30
	dc.w 0x0D3E
	dc.w 0x0D4C
	dc.w 0x0D5A
	dc.w 0x0D6A
	dc.w 0x0D78
	dc.w 0x0D86
	dc.w 0x0D96
	dc.w 0x0DA6
	dc.w 0x0DB6
	dc.w 0x0DC6
	dc.w 0x0DD4
	dc.w 0x0DE2
	dc.w 0x0DF0
	dc.w 0x0DFE
	dc.w 0x0E0C
	dc.w 0x0E1C
	dc.w 0x0E2A
	dc.w 0x0E38
	dc.w 0x0E46
	dc.w 0x0E54
	dc.w 0x0E62
	dc.w 0x0E70
	dc.w 0x0E80
	dc.w 0x0E90
	dc.w 0x0EA0
	dc.w 0x0EB6
	dc.w 0x0ECC
	dc.w 0x0EE2
	dc.w 0x0EF2
	dc.w 0x0F04
	dc.w 0x0F14
	dc.w 0x0F22
	dc.w 0x0F30
	dc.w 0x0F3E
	dc.w 0x0F4C
	dc.w 0x0F5A
	dc.w 0x0F6A
	dc.w 0x0F78
	dc.w 0x0F86
	dc.w 0x0F98
	dc.w 0x0FAA
	dc.w 0x0FB8
	dc.w 0x0FC6
	dc.w 0x0FD4
	dc.w 0x0FF0
	dc.w 0x1008
	dc.w 0x101E
	dc.w 0x1032
	dc.w 0x1046
	dc.w 0x105E
	dc.w 0x1076
	dc.w 0x108A
	dc.w 0x10A0
	dc.w 0x10B8
	dc.w 0x10D0
	dc.w 0x10F4
	dc.w 0x1118
	dc.w 0x113E
	dc.w 0x1162
	dc.w 0x118A
	dc.w 0x11AE
	dc.w 0x11D0
	dc.w 0x11F4
	dc.w 0x1220
	dc.w 0x1250
	dc.w 0x1274
	dc.w 0x1290
	dc.w 0x12B8
	dc.w 0x12E0
	dc.w 0x1302
	dc.w 0x131E
	dc.w 0x133A
	dc.w 0x1354
	dc.w 0x136C
	dc.w 0x138A
	dc.w 0x139E
	dc.w 0x13B4
	dc.w 0x13C8
	dc.w 0x13DC
	dc.w 0x13F0
	dc.w 0x1404
	dc.w 0x1422
	dc.w 0x1440
	dc.w 0x1466
	dc.w 0x148C
	dc.w 0x14B2
	dc.w 0x14D0
	dc.w 0x14EA
	dc.w 0x1504
	dc.w 0x151A
	dc.w 0x152E
	dc.w 0x153C
	dc.w 0x154A
	dc.w 0x1558
	dc.w 0x1566
	dc.w 0x1574
	dc.w 0x1582
	dc.w 0x1590
	dc.w 0x159E
	dc.w 0x15B8
	dc.w 0x15D6
	dc.w 0x15F2
	dc.w 0x1612
	dc.w 0x1630
	dc.w 0x164C
	dc.w 0x165C
	dc.w 0x166A
	dc.w 0x167A
	dc.w 0x168A
	dc.w 0x16A6
	dc.w 0x16C2
	dc.w 0x16E0
	dc.w 0x16FC
	dc.w 0x171A
	dc.w 0x1734
	dc.w 0x1742
	dc.w 0x1750
	dc.w 0x175E
	dc.w 0x176C
	dc.w 0x177A
	dc.w 0x1788
	dc.w 0x1796
	dc.w 0x17A4
	dc.w 0x17B2
	dc.w 0x17C6
	dc.w 0x17DC
	dc.w 0x17F6
	dc.w 0x1810
	dc.w 0x182C
	dc.w 0x184A
	dc.w 0x186E
	dc.w 0x188E
	dc.w 0x18AE
	dc.w 0x18C0
	dc.w 0x18D4
	dc.w 0x18E6
	dc.w 0x18FA
	dc.w 0x1910
	dc.w 0x1924
	dc.w 0x193A
	dc.w 0x194E
	dc.w 0x1962
	dc.w 0x1974
	dc.w 0x19A0
	dc.w 0x19D2
	dc.w 0x19FE
	dc.w 0x1A30
	dc.w 0x1A62
	dc.w 0x1A8A
	dc.w 0x1AA4
	dc.w 0x1AC2
	dc.w 0x1ADE
	dc.w 0x1AFA
	dc.w 0x1B18
	dc.w 0x1B32
	dc.w 0x1B48
	dc.w 0x1B5C
	dc.w 0x1B74
	dc.w 0x1B8E
	dc.w 0x1BAA
	dc.w 0x1BC6
	dc.w 0x1BDC
	dc.w 0x1BF4
	dc.w 0x1C0A
	dc.w 0x1C1E
	dc.w 0x1C34
	dc.w 0x1C4C
	dc.w 0x1C66
	dc.w 0x1C88
	dc.w 0x1CAA
	dc.w 0x1CCE
	dc.w 0x1CEA
	dc.w 0x1D08
	dc.w 0x1D28
	dc.w 0x1D4A
	dc.w 0x1D62
	dc.w 0x1D7A
	dc.w 0x1D9C
	dc.w 0x1DBC
	dc.w 0x1DDA
	dc.w 0x1DFA
	dc.w 0x1E14
	dc.w 0x1E2A
	dc.w 0x1E48
	dc.w 0x1E68
	dc.w 0x1E80
	dc.w 0x1E94
	dc.w 0x1EB4
	dc.w 0x1ED6
	dc.w 0x1EFC
	dc.w 0x1F2C
	dc.w 0x1F54
	dc.w 0x1F7C
	dc.w 0x1F9E
	dc.w 0x1FD0
	dc.w 0x2006
	dc.w 0x2038
	dc.w 0x2062
	dc.w 0x2090
	dc.w 0x20C2
	dc.w 0x20F0
	dc.w 0x2118
	dc.w 0x213E
	dc.w 0x2164
	dc.w 0x218C
	dc.w 0x21B6
	dc.w 0x21F2
	dc.w 0x222A
	dc.w 0x224E
	dc.w 0x227A
	dc.w 0x22B2
	dc.w 0x22E6
	dc.w 0x2320
	dc.w 0x2354
	dc.w 0x2386
	dc.w 0x23B6
	dc.w 0x23E8
	dc.w 0x241A
	dc.w 0x2444
	dc.w 0x2464
	dc.w 0x248E
	dc.w 0x24BA
	dc.w 0x24EA
	dc.w 0x2522
	dc.w 0x2560
