; == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == ==
;   **AUTOGENERATED WITH BEEHIVE** - the complete art tool for SEGA Mega Drive
; == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == ==
;   http://www.bigevilcorporation.co.uk
; == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == ==
;   Beehive and SEGA Genesis Framework (c) Matt Phillips 2015
; == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == ==


spriteanims_water:

actor_water_sheet_trail_anim_trail:
actor_water_sheet_trail_anim_trail_numframes: equ 0x6
actor_water_sheet_trail_anim_trail_speed: equ 0x51
actor_water_sheet_trail_anim_trail_track_frames:
	dc.l actor_water_sheet_trail_frame_0_header
	dc.l actor_water_sheet_trail_frame_1_header
	dc.l actor_water_sheet_trail_frame_2_header
	dc.l actor_water_sheet_trail_frame_3_header
	dc.l actor_water_sheet_trail_frame_4_header
	dc.l actor_water_sheet_trail_frame_5_header

	Even
actor_water_sheet_trail_anim_trail_track_posx equ 0
actor_water_sheet_trail_anim_trail_track_posy equ 0
actor_water_sheet_trail_anim_trail_track_sfx equ 0

actor_water_sheet_splash_anim_large:
actor_water_sheet_splash_anim_large_numframes: equ 0x8
actor_water_sheet_splash_anim_large_speed: equ 0x33
actor_water_sheet_splash_anim_large_track_frames:
	dc.l actor_water_sheet_splash_frame_0_header
	dc.l actor_water_sheet_splash_frame_1_header
	dc.l actor_water_sheet_splash_frame_2_header
	dc.l actor_water_sheet_splash_frame_3_header
	dc.l actor_water_sheet_splash_frame_4_header
	dc.l actor_water_sheet_splash_frame_5_header
	dc.l actor_water_sheet_splash_frame_6_header
	dc.l actor_water_sheet_splash_frame_7_header

	Even
actor_water_sheet_splash_anim_large_track_posx equ 0
actor_water_sheet_splash_anim_large_track_posy equ 0
actor_water_sheet_splash_anim_large_track_sfx equ 0
actor_water_sheet_splash_anim_tiny:
actor_water_sheet_splash_anim_tiny_numframes: equ 0x4
actor_water_sheet_splash_anim_tiny_speed: equ 0x33
actor_water_sheet_splash_anim_tiny_track_frames:
	dc.l actor_water_sheet_splash_frame_0_header
	dc.l actor_water_sheet_splash_frame_5_header
	dc.l actor_water_sheet_splash_frame_6_header
	dc.l actor_water_sheet_splash_frame_7_header

	Even
actor_water_sheet_splash_anim_tiny_track_posx equ 0
actor_water_sheet_splash_anim_tiny_track_posy equ 0
actor_water_sheet_splash_anim_tiny_track_sfx equ 0
actor_water_sheet_splash_anim_small:
actor_water_sheet_splash_anim_small_numframes: equ 0x5
actor_water_sheet_splash_anim_small_speed: equ 0x33
actor_water_sheet_splash_anim_small_track_frames:
	dc.l actor_water_sheet_splash_frame_0_header
	dc.l actor_water_sheet_splash_frame_4_header
	dc.l actor_water_sheet_splash_frame_5_header
	dc.l actor_water_sheet_splash_frame_6_header
	dc.l actor_water_sheet_splash_frame_7_header

	Even
actor_water_sheet_splash_anim_small_track_posx equ 0
actor_water_sheet_splash_anim_small_track_posy equ 0
actor_water_sheet_splash_anim_small_track_sfx equ 0

