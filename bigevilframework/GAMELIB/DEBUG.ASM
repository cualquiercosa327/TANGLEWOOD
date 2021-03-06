;==============================================================
;   BIG EVIL FRAMEWORK - Matt Phillips (c) 2015
;==============================================================
;   http://www.bigevilcorporation.co.uk
;==============================================================
;   debug.asm - debug drawing and controls
;==============================================================

debugdraw_playerpos_text_x equ 0x8
debugdraw_playerpos_text_y equ 0x1

debugdraw_palette			equ 0x2
debugdraw_palette_prio_bits	equ ((debugdraw_palette<<13)|1<<15)

DBG_DrawWord:
	; d0 (w)  Word
	; d1 (ww) Pos (sprite space)

	PUSHM  a0-a2/d0-d4

	ALLOCSTACKB 0x10
	move.l sp, a0
	PUSHL  d1
	jsr    TXT_ItoA_Hex_w
	POPL   d1
	moveq #0x0, d0
	move.w (vram_addr_systemfont), d0
	BYTES2TILES d0
	move.w #debugdraw_palette_prio_bits, d2
	jsr    TXT_DrawSprites
	FREESTACKB 0x10

	POPM   a0-a2/d0-d4

	rts

DBG_DrawLong:
	; d0 (l)  Long
	; d1 (ww) Pos (sprite space)

	PUSHM  a0-a2/d0-d4

	ALLOCSTACKB 0x10
	move.l sp, a0
	PUSHL  d1
	jsr    TXT_ItoA_Hex_l
	POPL   d1
	moveq #0x0, d0
	move.w (vram_addr_systemfont), d0
	BYTES2TILES d0
	move.w #debugdraw_palette_prio_bits, d2
	jsr    TXT_DrawSprites
	FREESTACKB 0x10

	POPM   a0-a2/d0-d4

	rts

DBG_DebugDraw:

	; Alloc string space
	sub.l  #0x10, sp

	move.l sp, a4
	move.l (hblank_counter), d0
	; To string
	move.l a4, a0
	jsr    TXT_ItoA_Hex_l
	move.w  #debugdraw_playerpos_text_x, d1
	swap   d1
	move.w  #debugdraw_playerpos_text_y, d1
	move.l a4, a0					; String
	move.w (vram_addr_systemfont), d0	; Font
	move.b #0x0, d2					; Palette
	move.b #0x0, d3					; Plane A
	jsr    TXT_DrawPlane
	
	move.l sp, a4
	move.l (vblank_counter), d0
	; To string
	move.l a4, a0
	jsr    TXT_ItoA_Hex_l
	move.w  #debugdraw_playerpos_text_x, d1
	swap   d1
	move.w  #debugdraw_playerpos_text_y+0x1, d1
	move.l a4, a0					; String
	move.w (vram_addr_systemfont), d0	; Font
	move.b #0x0, d2					; Palette
	move.b #0x0, d3					; Plane A
	jsr    TXT_DrawPlane
	
	move.l sp, a4
	move.l (vblank_counter), d0
	; To string
	move.l a4, a0
	jsr    TXT_ItoA_Hex_l
	move.w  #debugdraw_playerpos_text_x, d1
	swap   d1
	move.w  #debugdraw_playerpos_text_y+0x2, d1
	move.l a4, a0					; String
	move.w (vram_addr_systemfont), d0	; Font
	move.b #0x0, d2					; Palette
	move.b #0x0, d3					; Plane A
	jsr    TXT_DrawPlane
	
	; Free string space
	addi.l #0x10, sp
	
	; Alloc string space
	;sub.l  #0x10, sp
    ;
	;move.l sp, a4
    ;
	;; Get player X
	;lea    Player1, a2
	;move.l Entity_WorldPosX(a2), d0
    ;
	;; To string
	;move.l a4, a0
	;jsr    TXT_ItoA_Hex_l
	;
	;; Translate scroll pos to tile space
	;move.l (WorldScrollX), d1
	;lsr.l  #0x8, d1					; Screen space (subpixels) to pixels
	;divu.w #0x8, d1					; Pixels to tile space
	;addi.w #debugdraw_playerpos_text_x, d1
	;swap   d1
    ;
	;move.l (WorldScrollY), d2
	;lsr.l  #0x8, d2					; Screen space (subpixels) to pixels
	;divu.w #0x8, d2					; Pixels to tile space
	;addi.w #debugdraw_playerpos_text_y, d2
	;move.w d2, d1
    ;
	;move.l a4, a0					; String
	;move.w (vram_addr_systemfont), d0	; Font
	;move.b #0x0, d2					; Palette
	;move.b #0x0, d3					; Plane A
    ;
	;jsr    TXT_DrawPlane
    ;
	;; Get player Y
	;lea    Player1, a2
	;move.l Entity_WorldPosY(a2), d0
    ;
	;; To string
	;move.l a4, a0
	;jsr    TXT_ItoA_Hex_l
	;
	;; Translate scroll pos to tile space
	;move.l (WorldScrollX), d1
	;lsr.l  #0x8, d1					; Screen space (subpixels) to pixels
	;divu.w #0x8, d1					; Pixels to tile space
	;addi.w #debugdraw_playerpos_text_x, d1
	;swap   d1
    ;
	;move.l (WorldScrollY), d2
	;lsr.l  #0x8, d2					; Screen space (subpixels) to pixels
	;divu.w #0x8, d2					; Pixels to tile space
	;addi.w #debugdraw_playerpos_text_y+0x1, d2
	;move.w d2, d1
    ;
	;move.l a4, a0					; String
	;move.w (vram_addr_systemfont), d0	; Font
	;move.b #0x0, d2					; Palette
	;move.b #0x0, d3					; Plane A
    ;
	;jsr    TXT_DrawPlane
    ;
	;; Free string space
	;addi.l #0x10, sp


	rts
