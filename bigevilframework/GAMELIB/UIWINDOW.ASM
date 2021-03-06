;==============================================================
;   BIG EVIL FRAMEWORK - Matt Phillips (c) 2017
;==============================================================
;   http://www.bigevilcorporation.co.uk
;==============================================================
;   uiwindow.asm - User interface window (collection of widgets)
;==============================================================

	rsset Entity_Struct_Size
;---------------------------------
	LINKED_LIST Widgets				; Widgets belonging to this window
UIWindow_OnForward			rs.l 1	; Callback for window advancing
UIWindow_OnBack				rs.l 1	; Callback for window closing
;---------------------------------
	RS_ALIGN
UIWindow_Struct_Size		rs.b 0
;---------------------------------

UIWindowInit:
	; a0 --- Window addr

	; Base init
	jsr    EntityInit

	; Initial state
	MLIST_INIT Widgets,a0
	move.l #0x0, UIWindow_OnForward(a0)
	move.l #0x0, UIWindow_OnBack(a0)
	move.b #0x1, Entity_Active(a0)
	
	; Set update and render routines
	move.l #UIWindowUpdate, Entity_UpdateRoutine(a0)
	move.l #UIWindowRender, Entity_RenderRoutine(a0)

	; Add to update and render lists
	jsr EntityAddToUpdateList
	jsr EntityAddToRenderList

	rts

UIWindowAddWidget:
	; a0 --- Window addr
	; a1 --- Widget addr

	move.l a0, UIWidget_Window(a1)
	MLIST_APPEND_TAIL Widgets,a1,a2,a0

	rts

UIWindowUpdate:
	; a0 --- Window addr
	; a1 --- Level addr

	tst.b  Entity_Active(a0)
	beq    @Inactive

	PUSHMW d2-d5

	MLIST_GET_HEAD Widgets,a2,a0			; Get list head
	@WidgetLp:								; For all widgets in list
	cmpa.w #0x0, a2
	beq    @ListEnd
	PUSHM  a0-a2
	move.l a2, a0							; Widget addr to a0
	move.l UIWidget_UpdateRoutine(a0), a2 	; Get update routine
	jsr    (a2)								; Execute update routine
	POPM   a0-a2
	LIST_GET_NEXT Widgets,a2,a2				; Get next ptr
	bra    @WidgetLp						; Loop
	@ListEnd:

	POPMW  d2-d5

	@Inactive:

	rts

UIWindowRender:
	; a0 --- Window addr
	; a1 --- Level addr
	; d2 (w) Camera left
	; d3 (w) Camera right
	; d4 (w) Camera top
	; d5 (w) Camera bottom

	MLIST_GET_HEAD Widgets,a2,a0			; Get list head
	@WidgetLp:								; For all widgets in list
	cmpa.w #0x0, a2
	beq    @ListEnd
	PUSHM  a0-a2
	move.l a2, a0							; Widget addr to a0
	move.l UIWidget_RenderRoutine(a0), a2 	; Get render routine
	jsr    (a2)								; Execute update routine
	POPM   a0-a2
	LIST_GET_NEXT Widgets,a2,a2				; Get next ptr
	bra    @WidgetLp						; Loop
	@ListEnd:

	rts