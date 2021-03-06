;==============================================================
;   TANGLEWOOD - A game by Matt Phillips - (c) 2016
;==============================================================
;   http://www.bigevilcorporation.co.uk
;==============================================================
;   rope.asm - Rope segment for lift/hoist
;==============================================================

; Constants
Rope_Width				equ 0x40
Rope_Height				equ 0x20

; Animations
RopeSegmentAnimIdx_Swing	equ 0
; -------------------------------
RopeSegmentAnimIdx_Max		equ 1

; Structs
	rsset (AnimObj_Struct_Size)
;---------------------------------
RopeSegment_Animations	   	rs.b (Animation_Struct_Size*RopeSegmentAnimIdx_Max)
RopeSegment_Angle			rs.w 1
;---------------------------------
	RS_ALIGN
RopeSegment_Struct_Size		rs.b 0
;---------------------------------

;==============================================================

RopeSegmentInit:
	; a0 --- GameObj addr
	; a1 --- Level addr

	; Base init
	jsr    AnimObjInit
	
	; Set type
	ori.l  #entity_type_rope, Entity_TypeBits(a0)
	addq.w #0x1, EntityCount_Rope
	
	; Set update and render routines
	move.l #AnimObjUpdate, Entity_UpdateRoutine(a0)
	move.l #AnimObjDraw, Entity_RenderRoutine(a0)
	
	; Add to update and render lists
	jsr    EntityAddToUpdateList
	jsr    EntityAddToRenderList
	
	; Default state
	move.b #0x1, Entity_Active(a0)
	move.b #0x1, SpriteObj_Visible(a0)
	move.w #Rope_Width, Entity_Width(a0)
	move.w #Rope_Height, Entity_Height(a0)

	rts
	
RopeSegmentLoadGfx:
	; a0 --- GameObj addr
	; a1 --- Level addr

	SPRITE_LOAD_DEFAULT rope,rope,0,PaletteId_World0,0x0
	
	rts
