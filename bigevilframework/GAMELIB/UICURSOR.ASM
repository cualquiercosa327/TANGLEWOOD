OLD_MENU_INPUT					equ 0

;==============================================================
;   BIG EVIL FRAMEWORK - Matt Phillips (c) 2017
;==============================================================
;   http://www.bigevilcorporation.co.uk
;==============================================================
;   uicursor.asm - UI menu selection cursor and input processing
;==============================================================

UIWidgetCursor_WidgetArraySize	equ 0x10

UIWidgetCursor_DrawBorder		equ 0x8

UIWidgetCursor_Input_Up			equ (1<<pad_button_up)
UIWidgetCursor_Input_Down		equ (1<<pad_button_down)
UIWidgetCursor_Input_Left		equ (1<<pad_button_left)
UIWidgetCursor_Input_Right		equ (1<<pad_button_right)
UIWidgetCursor_Input_Select		equ (1<<pad_button_start)|(1<<pad_button_a)
UIWidgetCursor_Input_Cancel		equ (1<<pad_button_b)
UIWidgetCursor_Input_Advance	equ (1<<pad_button_c)

UIWidgetCursor_Audio_Move		equ SFX_UI_Move

	rsset UIWidget_Struct_Size
;---------------------------------
UIWidgetCursor_Widgets		rs.l UIWidgetCursor_WidgetArraySize
UIWidgetCursor_Sprite		rs.b SpriteObj_Struct_Size
UIWidgetCursor_PrevInput	rs.w 1	; For input debounce
UIWidgetCursor_NumWidgets	rs.b 1	; Num widgets added for selection
UIWidgetCursor_CurrIndex	rs.b 1	; Currently selected widget index
;---------------------------------
	RS_ALIGN
UIWidgetCursor_Struct_Size	rs.b 0
;---------------------------------

UIWidgetCursorInit:
	; a0 --- Cursor addr

	; Base init
	jsr    UIWidgetInit

	; Set update/render routines
	move.l #UIWidgetCursorUpdate, UIWidget_UpdateRoutine(a0)
	move.l #UIWidgetCursorRender, UIWidget_RenderRoutine(a0)

	; Initial state
	move.w #0x0, UIWidgetCursor_PrevInput(a0)
	move.b #0x0, UIWidgetCursor_NumWidgets(a0)
	move.b #0x0, UIWidgetCursor_CurrIndex(a0)

	; Init sprite obj
	PUSHL  a0
	lea    UIWidgetCursor_Sprite(a0), a0
	jsr    SpriteObjInit
	POPL   a0

	rts

UIWidgetCursorLoadSprite:
	; a0 --- Cursor addr
	; a1 --- Tileset address
	; a2 --- Multi-sprite subsprite dimentions bits array address
	; a3 --- Multi-sprite subsprite position offsets array address
	; a4 --- Multi-sprite tiles per subsprite array address
	; d1 (w) Num tiles
	; d2 (b) Num subsprites
	; d3 (w) Sprite W/H dimentions
	; d4 (b) Palette ID
	; d5 (b) Priority
	; d6 (w) Width
	; d7 (w) height

	move.l a0, a5

	PUSHL  a0

	lea    UIWidgetCursor_Sprite(a0), a0

	; Set dimensions
	move.w d6, UIWidget_Width(a5)
	move.w d7, UIWidget_Height(a5)
	move.w d6, Entity_Width(a0)
	move.w d7, Entity_Height(a0)

	; Load sprite
	jsr    SpriteObjLoad

	POPL   a0

	rts

UIWidgetCursorAddWidget:
	; a0 --- Cursor addr
	; a1 --- Widget addr

	; Add to array
	moveq #0x0, d0
	move.b UIWidgetCursor_NumWidgets(a0), d0
	lsl.l  #0x2, d0
	move.l a0, a2
	lea    UIWidgetCursor_Widgets(a2), a2
	add.l  d0, a2
	move.l a1, (a2)

	; If first widget, set focus
	tst.b  UIWidgetCursor_NumWidgets(a0)
	bne    @NotFirst
	move.b #0x0, d0
	jsr    UIWidgetCursorSelect
	@NotFirst:

	; Increment count
	addq.b #0x1, UIWidgetCursor_NumWidgets(a0)

	rts

UIWidgetCursorSelect:
	; a0 --- Cursor addr
	; d0 (b) Widget index

	; Deselect current widget
	moveq #0x0, d1
	move.b UIWidgetCursor_CurrIndex(a0), d1	; Get curr index
	lsl.l  #0x2, d1							; To longwords
	move.l a0, a2							; Get widget ptr array
	lea    UIWidgetCursor_Widgets(a2), a2
	add.l  d1, a2
	move.l (a2), a2							; Deref
	cmpa.w #0x0, a2
	beq    @NoCurrWidget
	move.b #0x0, UIWidget_HasFocus(a2)		; Clear focus
	@NoCurrWidget:
	
	; Select new widget
	move.b d0, UIWidgetCursor_CurrIndex(a0)	; Set new index
	andi.l #0xFF, d0
	lsl.l  #0x2, d0							; To longwords
	move.l a0, a2							; Get widget ptr array
	lea    UIWidgetCursor_Widgets(a2), a2
	add.l  d0, a2
	move.l (a2), a2							; Deref
	move.b #0x1, UIWidget_HasFocus(a2)		; Set focus

	; Set new cursor position
	move.w UIWidget_PositionX(a2), d0		; Get select widget x/y
	move.w UIWidget_PositionY(a2), d1
	move.w UIWidget_Width(a2), d2			; Get selected widget width/height
	move.w UIWidget_Height(a2), d3
	move.w UIWidget_Width(a0), d4			; Get cursor width/height
	move.w UIWidget_Height(a0), d5
	
	sub.w  d4, d0							; Sub cursor width
	subi.w #UIWidgetCursor_DrawBorder, d0	; Sub cursor border
	
	lsr.w  #0x1, d3							; Centre widget height
	lsr.w  #0x1, d5
	add.w  d3, d1
	sub.w  d5, d1
	
	move.w d0, UIWidget_PositionX(a0)		; Set cursor pos
	move.w d1, UIWidget_PositionY(a0)

	rts

UIWidgetCursorCycleOption:
	; a0 --- Cursor addr
	; d0 (b) 0 = left, 1 = right

	PUSHL  a0
	moveq  #0x0, d1
	move.b UIWidgetCursor_CurrIndex(a0), d1	; Get curr index
	lsl.l  #0x2, d1							; To longwords
	move.l a0, a2							; Get widget ptr array
	lea    UIWidgetCursor_Widgets(a2), a2
	add.l  d1, a2
	move.l (a2), a0							; Deref
	cmpa.w #0x0, a0
	beq    @NoCurrWidget
	move.l UIWidget_OnOptionCycle(a0), a3
	cmpa.w #0x0, a3
	beq    @NoCallback
	jsr    (a3)
	@NoCurrWidget:
	@NoCallback:
	POPL   a0

	rts

UIWidgetCursorAdvanceOption:
	; a0 --- Cursor addr
	; d0 (b) 0 = left, 1 = right

	PUSHL  a0
	moveq  #0x0, d1
	move.b UIWidgetCursor_CurrIndex(a0), d1	; Get curr index
	lsl.l  #0x2, d1							; To longwords
	move.l a0, a2							; Get widget ptr array
	lea    UIWidgetCursor_Widgets(a2), a2
	add.l  d1, a2
	move.l (a2), a0							; Deref
	cmpa.w #0x0, a0
	beq    @NoCurrWidget
	move.l UIWidget_OnOptionAdvance(a0), a3
	cmpa.w #0x0, a3
	beq    @NoCallback
	jsr    (a3)
	@NoCurrWidget:
	@NoCallback:
	POPL   a0

	rts

UIWidgetCursorUpdate:
	; a0 --- Cursor addr

	tst.b  UIWidget_Enabled(a0)
	beq    @NoInput

	IF AUTOTEST_ENABLED

	; Autotest pad input
	lea AutotestData, a4
	move.w Autotest_PadDataA(a4), d0
	move.w #0x0, Autotest_PadDataA(a4)

	ELSE

	; Read pad
	jsr    PAD_ReadPadA

	ENDIF

	IF OLD_MENU_INPUT
	; Debounce
	cmp.w  UIWidgetCursor_PrevInput(a0), d0
	beq    @NoInput

	; Store prev input
	move.w d0, UIWidgetCursor_PrevInput(a0)
	
	ELSE
	
	move.w	UIWidgetCursor_PrevInput(a0), d1
	move.w	d0, UIWidgetCursor_PrevInput(a0)
	not.w	d1
	and.w	d1, d0
	
	ENDIF

	; Determine button pressed
	move.w d0, d1
	andi.w #UIWidgetCursor_Input_Up, d1
	bne    @InputUp

	move.w d0, d1
	andi.w #UIWidgetCursor_Input_Down, d1
	bne    @InputDown

	move.w d0, d1
	andi.w #UIWidgetCursor_Input_Left, d1
	bne    @InputLeft

	move.w d0, d1
	andi.w #UIWidgetCursor_Input_Right, d1
	bne    @InputRight

	move.w d0, d1
	andi.w #UIWidgetCursor_Input_Select, d1
	bne    @InputSelect

	move.w d0, d1
	andi.w #UIWidgetCursor_Input_Cancel, d1
	bne    @InputCancel

	move.w d0, d1
	andi.w #UIWidgetCursor_Input_Advance, d1
	bne    @InputAdvance

	bra    @NoInput

	;==============================================================

	@InputUp:

	; Navigate up
	move.b UIWidgetCursor_NumWidgets(a0), d1
	move.b UIWidgetCursor_CurrIndex(a0), d2
	bne    @NoWrapDown
	move.b d1, d2
	@NoWrapDown:
	subq.b #0x1, d2
	PUSHL  d0
	move.b d2, d0
	PLAYSFX #UIWidgetCursor_Audio_Move
	jsr    UIWidgetCursorSelect
	POPL   d0
	bra    @EndInput

	;==============================================================

	@InputDown:

	; Navigate down
	move.b UIWidgetCursor_NumWidgets(a0), d1
	move.b UIWidgetCursor_CurrIndex(a0), d2
	addq.b #0x1, d2
	cmp.b  d1, d2
	bne    @NoWrapUp
	move.b #0x0, d2
	@NoWrapUp:
	PUSHL  d0
	move.b d2, d0
	PLAYSFX #UIWidgetCursor_Audio_Move
	jsr    UIWidgetCursorSelect
	POPL   d0
	bra    @EndInput

	;==============================================================

	@InputLeft:

	; Widget option left
	PUSHL  d0
	move.b #0x0, d0
	jsr    UIWidgetCursorCycleOption
	POPL   d0
	bra    @EndInput

	;==============================================================

	@InputRight:

	; Widget option right
	PUSHL  d0
	move.b #0x1, d0
	jsr    UIWidgetCursorCycleOption
	POPL   d0
	bra    @EndInput

	;==============================================================

	@InputSelect:
	
	; Entry selected
	PUSHM  a0-a1
	move.b UIWidgetCursor_CurrIndex(a0), d0	; Get selected index
	andi.l #0xFF, d0
	lsl.l  #0x2, d0							; To longwords
	move.l a0, a2							; Get widget ptr array
	lea    UIWidgetCursor_Widgets(a2), a2
	add.l  d0, a2
	move.l (a2), a0							; Deref
	jsr    UIWidgetSelect					; Callback
	POPM   a0-a1
	bra    @EndInput

	;==============================================================

	@InputCancel:

	; Entry selected
	PUSHM  a0-a1
	move.b UIWidgetCursor_CurrIndex(a0), d0	; Get selected index
	andi.l #0xFF, d0
	lsl.l  #0x2, d0							; To longwords
	move.l a0, a2							; Get widget ptr array
	lea    UIWidgetCursor_Widgets(a2), a2
	add.l  d0, a2
	move.l (a2), a0							; Deref
	jsr    UIWidgetCancel					; Callback
	POPM   a0-a1
	bra    @EndInput

	;==============================================================

	@InputAdvance:

	; Advance option
	PUSHL  d0
	move.b #0x1, d0
	jsr    UIWidgetCursorAdvanceOption
	POPL   d0
	bra    @EndInput

	;==============================================================

	@NoInput:
	@EndInput:

	;==============================================================

	; Update sprite position
	move.w UIWidget_PositionX(a0), d0
	move.w UIWidget_PositionY(a0), d1
	addi.w #vdp_sprite_border_x, d0
	addi.w #vdp_sprite_border_y, d1
	TOSUBPIXELS d0
	TOSUBPIXELS d1

	PUSHL  a0
	lea    UIWidgetCursor_Sprite(a0), a0
	move.l d0, Entity_WorldPosX(a0)
	move.l d1, Entity_WorldPosY(a0)
	POPL   a0

	rts

UIWidgetCursorRender:
	; a0 --- Cursor addr

	; Draw sprite
	PUSHL  a0
	lea    UIWidgetCursor_Sprite(a0), a0
	jsr    SpriteObjDraw
	POPL   a0
	
	rts