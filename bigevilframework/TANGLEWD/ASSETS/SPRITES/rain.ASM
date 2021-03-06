; == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == ==
;   **AUTOGENERATED WITH BEEHIVE** - the complete art tool for SEGA Mega Drive
; == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == ==
;   http://www.bigevilcorporation.co.uk
; == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == ==
;   Beehive and SEGA Genesis Framework (c) Matt Phillips 2015
; == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == ==


actor_rain:

actor_rain_VRAM_size_b		equ 0x180	; VRAM size to alloc (size of largest frame, bytes)
actor_rain_sheet_light_width		equ 0x20	; Max width of largest frame in pixels
actor_rain_sheet_light_height		equ 0x20	; Max height of largest frame in pixels


actor_rain_sheet_light_frametable:
actor_rain_sheet_light_frame_0_header:
	dc.w 0x0008	; Frame size (tiles)
	dc.w actor_rain_sheet_light_frame_0_size_subsprites	; Frame size (subsprites)
	dc.l actor_rain_sheet_light_frame_0
	dc.l actor_rain_sheet_light_frame_0_subsprite_dimensions_bits
	dc.l actor_rain_sheet_light_frame_0_subsprite_pos_offsets

actor_rain_sheet_light_frame_1_header:
	dc.w 0x000C	; Frame size (tiles)
	dc.w actor_rain_sheet_light_frame_1_size_subsprites	; Frame size (subsprites)
	dc.l actor_rain_sheet_light_frame_1
	dc.l actor_rain_sheet_light_frame_1_subsprite_dimensions_bits
	dc.l actor_rain_sheet_light_frame_1_subsprite_pos_offsets

actor_rain_sheet_light_frame_2_header:
	dc.w 0x000C	; Frame size (tiles)
	dc.w actor_rain_sheet_light_frame_2_size_subsprites	; Frame size (subsprites)
	dc.l actor_rain_sheet_light_frame_2
	dc.l actor_rain_sheet_light_frame_2_subsprite_dimensions_bits
	dc.l actor_rain_sheet_light_frame_2_subsprite_pos_offsets

actor_rain_sheet_light_frame_0_size_b		equ 0x0100	; Size in bytes
actor_rain_sheet_light_frame_0_size_t		equ 0x0008	; Size in tiles
actor_rain_sheet_light_frame_0_size_subsprites		equ 0x0001	; Size in subsprites

; Subsprite offsets from 0,0 (in pixels) - unflipped (ww) and flipped X (ww)
actor_rain_sheet_light_frame_0_subsprite_pos_offsets:
	dc.l 0x00080000, 0x00080000
	Even

; Subsprite dimension bits (for sprite descs)
actor_rain_sheet_light_frame_0_subsprite_dimensions_bits:
	dc.b 0x7
	Even

actor_rain_sheet_light_frame_1_size_b		equ 0x0180	; Size in bytes
actor_rain_sheet_light_frame_1_size_t		equ 0x000C	; Size in tiles
actor_rain_sheet_light_frame_1_size_subsprites		equ 0x0001	; Size in subsprites

; Subsprite offsets from 0,0 (in pixels) - unflipped (ww) and flipped X (ww)
actor_rain_sheet_light_frame_1_subsprite_pos_offsets:
	dc.l 0x00080000, 0x00000000
	Even

; Subsprite dimension bits (for sprite descs)
actor_rain_sheet_light_frame_1_subsprite_dimensions_bits:
	dc.b 0xB
	Even

actor_rain_sheet_light_frame_2_size_b		equ 0x0180	; Size in bytes
actor_rain_sheet_light_frame_2_size_t		equ 0x000C	; Size in tiles
actor_rain_sheet_light_frame_2_size_subsprites		equ 0x0001	; Size in subsprites

; Subsprite offsets from 0,0 (in pixels) - unflipped (ww) and flipped X (ww)
actor_rain_sheet_light_frame_2_subsprite_pos_offsets:
	dc.l 0x00080000, 0x00000000
	Even

; Subsprite dimension bits (for sprite descs)
actor_rain_sheet_light_frame_2_subsprite_dimensions_bits:
	dc.b 0xB
	Even


spritesheets_rain:

spritesheet_rain_light:

actor_rain_sheet_light_frame_0:
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000003
	dc.l	0x00000003
	dc.l	0x00000030
	dc.l	0x00000030

	dc.l	0x00000200
	dc.l	0x00000200
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000

	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000

	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000

	dc.l	0x01000000
	dc.l	0x01000000
	dc.l	0x30000000
	dc.l	0x30000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000

	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000

	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000001
	dc.l	0x00000001
	dc.l	0x00000030
	dc.l	0x00000030

	dc.l	0x00000300
	dc.l	0x00000300
	dc.l	0x00003000
	dc.l	0x00003000
	dc.l	0x00030000
	dc.l	0x00030000
	dc.l	0x00200000
	dc.l	0x00200000


actor_rain_sheet_light_frame_1:
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000003
	dc.l	0x00000030
	dc.l	0x00000200

	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000

	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000

	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000

	dc.l	0x00001000
	dc.l	0x00010000
	dc.l	0x00300000
	dc.l	0x03000000
	dc.l	0x30000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000

	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000

	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000

	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000003
	dc.l	0x00000030
	dc.l	0x00000300
	dc.l	0x00003000
	dc.l	0x00030000
	dc.l	0x00200000

	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000

	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000

	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000001
	dc.l	0x00000010
	dc.l	0x00000100
	dc.l	0x00001000
	dc.l	0x00030000
	dc.l	0x00300000

	dc.l	0x03000000
	dc.l	0x30000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000


actor_rain_sheet_light_frame_2:
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000033
	dc.l	0x00002200

	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000

	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000

	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000

	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000011
	dc.l	0x00003300
	dc.l	0x00330000
	dc.l	0x33000000
	dc.l	0x00000000
	dc.l	0x00000000

	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000

	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000

	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000033
	dc.l	0x00003300
	dc.l	0x00330000
	dc.l	0x22000000

	dc.l	0x00000000
	dc.l	0x11000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000

	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000

	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000

	dc.l	0x00000011
	dc.l	0x00001100
	dc.l	0x00330000
	dc.l	0x33000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000
	dc.l	0x00000000




