; == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == ==
;   **AUTOGENERATED WITH BEEHIVE** - the complete art tool for SEGA Mega Drive
; == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == ==
;   http://www.bigevilcorporation.co.uk
; == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == ==
;   Beehive and SEGA Genesis Framework (c) Matt Phillips 2015
; == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == ==


map_blockmap_end_level_size_b	equ 0x00000030	; Size in bytes
map_blockmap_end_level_size_w	equ (map_blockmap_end_level_size_b/2)	; Size in words
map_blockmap_end_level_size_l	equ (map_blockmap_end_level_size_b/4)	; Size in longwords
map_end_level_width	equ 0x28
map_end_level_height	equ 0x20
map_blockmap_end_level_width	equ 0x0A
map_blockmap_end_level_height	equ 0x08

map_blockmap_end_level_coloffsets:
	dc.w 0x0000
	dc.w 0x0002
	dc.w 0x0004
	dc.w 0x0006
	dc.w 0x0008
	dc.w 0x000A
	dc.w 0x000C
	dc.w 0x0016
	dc.w 0x0020
	dc.w 0x002A
