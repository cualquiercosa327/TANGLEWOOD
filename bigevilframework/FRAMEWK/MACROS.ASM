;==============================================================
;   http://www.bigevilcorporation.co.uk
;==============================================================
;   SEGA Genesis Framework (c) Matt Phillips 2016
;==============================================================
;   macros.asm - Utility macros
;==============================================================

; Disable interrupts (pushes to stack)
DISABLE_INTERRUPTS: macro
	PUSHW  sr
	ori.w  #status_reg_int_disable, sr
	endm

; Restore interrupts (pops from stack)
RESTORE_INTERRUPTS: macro
	POPW    sr
	endm

; Stack push (word)
PUSHW: macro reg
    move.w \reg, -(sp)
    endm
	
; Stack pop (word)
POPW: macro reg
    move.w (sp)+, \reg
    endm
	
; Stack push (longword)
PUSHL: macro reg
    move.l \reg, -(sp)
    endm
	
; Stack pop (longword)
POPL: macro reg
    move.l (sp)+, \reg
    endm

; Stack push multiple regs (word)
PUSHMW: macro regs
	 movem.w \regs, -(sp)
	 endm
	 
; Stack pop multiple regs (word)
POPMW: macro regs
	movem.w (sp)+, \regs
	endm

; Stack push multiple regs (longword)
PUSHM: macro regs
	 movem.l \regs, -(sp)
	 endm
	 
; Stack pop multiple regs (longword)
POPM: macro regs
	movem.l (sp)+, \regs
	endm
	
; Stack push all regs
PUSHALL: macro
	 movem.l d0-d7/a0-a6, -(sp)
	 endm
	 
; Stack pop all regs
POPALL: macro
	movem.l (sp)+, d0-d7/a0-a6
	endm

;==============================================================
	
; Stack alloc (bytes)
ALLOCSTACKB: macro bytes
	sub.l  #\bytes, sp
	endm
	
; Stack free (bytes)
FREESTACKB: macro bytes
	addi.l #\bytes, sp
	endm
	
;==============================================================

; Copy memory (longwords)
MEMCPYL: macro destreg,sourcereg,countreg
	subq.w #0x1, \countreg
	PUSHM  \destreg/\sourcereg
	@MEMCPYL_LP\@:
	move.l (\sourcereg)+, (\destreg)+
	dbra   \countreg, @MEMCPYL_LP\@
	POPM   \destreg/\sourcereg
	endm

; Copy memory (words)
MEMCPYW: macro destreg,sourcereg,countreg
	subq.w #0x1, \countreg
	PUSHM  \destreg/\sourcereg
	@MEMCPYL_LP\@:
	move.w (\sourcereg)+, (\destreg)+
	dbra   \countreg, @MEMCPYL_LP\@
	POPM   \destreg/\sourcereg
	endm

; Copy memory (bytes)
MEMCPYB: macro destreg,sourcereg,countreg
	subq.w #0x1, \countreg
	PUSHM  \destreg/\sourcereg
	@MEMCPYB_LP\@:
	move.b (\sourcereg)+, (\destreg)+
	dbra   \countreg, @MEMCPYB_LP\@
	POPM   \destreg/\sourcereg
	endm
	
; Zero memory (longwords)
MEMZEROL: macro addressreg,countreg
	subq.w #0x1, \countreg
	PUSHL  \addressreg
	@MEMZEROL_LP\@:
	move.l #0x0, (\addressreg)+
	dbra   \countreg, @MEMZEROL_LP\@
	POPL   \addressreg
	endm

; Zero memory (words)
MEMZEROW: macro addressreg,countreg
	subq.w #0x1, \countreg
	PUSHL  \addressreg
	@MEMZEROW_LP\@:
	move.w #0x0, (\addressreg)+
	dbra   \countreg, @MEMZEROW_LP\@
	POPL   \addressreg
	endm

; Zero memory (bytes)
MEMZEROB: macro addressreg,countreg
	subq.w #0x1, \countreg
	PUSHL  \addressreg
	@MEMZEROB_LP\@:
	move.b #0x0, (\addressreg)+
	dbra   \countreg, @MEMZEROB_LP\@
	POPL   \addressreg
	endm

;==============================================================

; 'even' equivalent for RS
RS_ALIGN: macro
	if __RS&1
	rs.b 1
	endc
	endm

;==============================================================
	
; Set VDP register state (and update local table)
VDP_SETREG: macro regnum,valuereg
	move.b \valuereg,(vdp_regs+\regnum)
	andi.w #0x00FF,\valuereg
	ori.w  #((0x80|(\regnum))<<8),\valuereg
	move.w \valuereg, vdp_control
	endm
	
; Get VDP register state from local table
VDP_GETREG: macro regnum,valuereg
	move.b (vdp_regs+\regnum),\valuereg
	endm

; Setup for writing to static VRAM address
VDP_SET_VRAM_WRITE: macro addr
	move.l  #(vdp_cmd_vram_write)|((\addr)&$3FFF)<<16|(\addr)>>14, vdp_control
	endm

; Setup for reading from static VRAM address
VDP_SET_VRAM_READ: macro addr
	move.l  #(vdp_cmd_vram_read)|((\addr)&$3FFF)<<16|(\addr)>>14, vdp_control
	endm
	
; Setup for writing to static CRAM address
VDP_SET_CRAM_WRITE: macro addr
	move.l  #(vdp_cmd_cram_write)|((\addr)&$3FFF)<<16|(\addr)>>14, vdp_control
	endm

; Set VDP data address for reading/writing
VDP_SETADDRESS: macro destreg, baseaddr, optype
	; Address bit pattern: --DC BA98 7654 3210 ---- ---- ---- --FE
	add.l   \baseaddr, \destreg		; Add VRAM address offset
	rol.l   #0x2,\destreg			; Roll bits 14/15 of address to bits 16/17
	lsr.w   #0x2, \destreg			; Shift lower word back
	swap    \destreg				; Swap address hi/lo
	ori.l   \optype, \destreg		; OR in VRAM/CRAM/VSRAM write/read command
	move.l  \destreg, vdp_control	; Move dest address to VDP control port
	endm

; Set VDP autoincrement
VDP_SETAUTOINCREMENT: macro value
	PUSHW  d0
	move.w #\value, d0
	VDP_SETREG 0xF,d0
	POPW   d0
	endm

; Set VDP HINT line count
VDP_SETHINT macro line
	VDP_SETREG 0xA,\line
	endm

; DMA to VDP VRAM
VDP_DMA_VRAM: macro src, dest, len, tmpreg
	DISABLE_INTERRUPTS
    move.l  #0x94009300|((\len)<<7&0x00FF0000)|((\len)>>1&0xFF), vdp_control
    move.l  #0x96009500|((\src)<<7&0x00FF0000)|((\src)>>1&0xFF), vdp_control
    move.w  #0x9700|((\src)>>17&0x7F), vdp_control
	VDP_GETREG 1, \tmpreg
	ori.b   #0x10, \tmpreg
	VDP_SETREG 1, \tmpreg
    move.l  #vdp_cmd_dma_vram_write|((\dest)&0x3FFF)<<16|(\dest)>>14, vdp_control
	andi.b  #0xEF, \tmpreg
	VDP_SETREG 1, \tmpreg
	RESTORE_INTERRUPTS
    endm

; DMA to VDP CRAM
VDP_DMA_CRAM: macro src, dest, len, tmpreg
	DISABLE_INTERRUPTS
    move.l  #0x94009300|((\len)<<7&0x00FF0000)|((\len)>>1&0xFF), vdp_control
    move.l  #0x96009500|((\src)<<7&0x00FF0000)|((\src)>>1&0xFF), vdp_control
    move.w  #0x9700|((\src)>>17&0x7F), vdp_control
	VDP_GETREG 1, \tmpreg
	ori.b   #0x10, \tmpreg
	VDP_SETREG 1, \tmpreg
    move.l  #vdp_cmd_dma_cram_write|((\dest)&0x3FFF)<<16|(\dest)>>14, vdp_control
	andi.b  #0xEF, \tmpreg
	VDP_SETREG 1, \tmpreg
	RESTORE_INTERRUPTS
    endm

;==============================================================

; Clamp value between A and B
CLAMP: macro valuereg,minreg,maxreg
	cmp.l  \minreg,\valuereg
	bge    @WITHIN_MIN\@
	move.l \minreg,\valuereg
	@WITHIN_MIN\@:
	cmp.l  \maxreg,\valuereg
	ble    @WITHIN_MAX\@
	move.l \maxreg,\valuereg
	@WITHIN_MAX\@:
	endm

CLAMPL: macro valuereg,minreg,maxreg
	cmp.l  \minreg,\valuereg
	bge    @WITHIN_MIN\@
	move.l \minreg,\valuereg
	@WITHIN_MIN\@:
	cmp.l  \maxreg,\valuereg
	ble    @WITHIN_MAX\@
	move.l \maxreg,\valuereg
	@WITHIN_MAX\@:
	endm

CLAMPW: macro valuereg,minreg,maxreg
	cmp.w  \minreg,\valuereg
	bge    @WITHIN_MIN\@
	move.w \minreg,\valuereg
	@WITHIN_MIN\@:
	cmp.w  \maxreg,\valuereg
	ble    @WITHIN_MAX\@
	move.w \maxreg,\valuereg
	@WITHIN_MAX\@:
	endm

CLAMPB: macro valuereg,minreg,maxreg
	cmp.b  \minreg,\valuereg
	bge    @WITHIN_MIN\@
	move.b \minreg,\valuereg
	@WITHIN_MIN\@:
	cmp.b  \maxreg,\valuereg
	ble    @WITHIN_MAX\@
	move.b \maxreg,\valuereg
	@WITHIN_MAX\@:
	endm

; Clamp value between A and B, with unknown A/B order
CLAMP_UNORDERED: macro valuereg,minreg,maxreg,tmpreg
	cmp.l  \minreg, \maxreg
	bgt    @CORRECT_ORDER\@
	move.l \minreg, \tmpreg
	move.l \maxreg, \minreg
	move.l \tmpreg, \maxreg
	@CORRECT_ORDER\@:
	cmp.l  \minreg,\valuereg
	bge    @WITHIN_MIN\@
	move.l \minreg,\valuereg
	@WITHIN_MIN\@:
	cmp.l  \maxreg,\valuereg
	ble    @WITHIN_MAX\@
	move.l \maxreg,\valuereg
	@WITHIN_MAX\@:
	endm
	
; Get positive absolute
ABS: macro valuereg
	cmp.l #0x0, \valuereg
	bge   @Pos\@
	neg.l \valuereg
	@Pos\@:
	endm

ABSL: macro valuereg
	cmp.l #0x0, \valuereg
	bge   @Pos\@
	neg.l \valuereg
	@Pos\@:
	endm

ABSW: macro valuereg
	tst.w \valuereg
	bge   @Pos\@
	neg.w \valuereg
	@Pos\@:
	endm

; Round
ROUNDW: macro valuereg,roundto
	andi.w #0xFFFF, \valuereg
	addi.w \roundto-1, \valuereg
	divu   \roundto, \valuereg
	mulu   \roundto, \valuereg
	endm

;==============================================================

; Fixed 16.16, full 32 bit multiply
MULS1616_FIXED_L: macro x,y,dest
	move.l #(((y&0xffff)*(x&0xffff))>>16)+((y&0xffff)*(x>>16))+((y>>16)*(x&0xffff))+(((y>>16)*(x>>16))<<16), \dest
	endm

; Fixed 16.16, full 32 bit multiply, result >>16
MULS1616_FIXED_W: macro x,y,dest
	move.w #(((y&0xffff)*(x&0xffff))>>16)+((y&0xffff)*(x>>16))+((y>>16)*(x&0xffff))+(((y>>16)*(x>>16))<<16)>>16, \dest
	endm

; Lossy 16.16 fixed point divide (converts to 24.8 to avoid overflow)
DIVS1616_LOSSY: macro div,reg
	cmp.w  #0x1, \div
	beq    @ONE\@
	cmp.l  #0x0, \reg
	beq    @ZERO\@
	asr.l  #0x8, \reg
	divs.w \div,\reg
	andi.l #0x0000FFFF, \reg
	ext.l  \reg
	lsl.l  #0x8, \reg
	@ONE\@:
	@ZERO\@:
	endm

; With constant divisor
DIVS1616_LOSSY_FIXED: macro div,reg
	cmp.l  #0x0, \reg
	beq    @ZERO\@
	asr.l  #0x8, \reg
	divs.w \div,\reg
	andi.l #0x0000FFFF, \reg
	ext.l  \reg
	lsl.l  #0x8, \reg
	@ZERO\@:
	endm

;==============================================================

; Matches sign of two regs
MATCH_SIGN:	macro reg1,reg2
	cmp.l   #0x0, \reg1		; If reg1 >= 0, positive
	bgt     @POS1\@
	@NEG1\@:
	cmp.l   #0x0, \reg2		; If reg2 < 0, match
	blt     @MATCH\@
	neg.l   \reg2			; Mismatch, invert reg2
	bra     @END\@
	@POS1\@:
	cmp.l   #0x0, \reg2		; If reg2 >= 0, match
	bgt     @MATCH\@
	neg.l   \reg2			; Mismatch, invert reg2
	@MATCH\@:
	@END\@:
	endm

;==============================================================
	
; Fixed-point (frac = 8) linear interpolation between A and B by T
LERP_FIXED8: macro destreg,from,to,time
	sub.l  \from,\to
	mulu   \time,\to
	lsr.l  #0x8, \to
	add.l  \from,\to
	move.l \to,\destreg
	endm
	
LERP_FIXED: macro destreg,A,B,T
	; a + ((t * (b-a)) >> 8)
	sub.l  \A,\B
	mulu   \T,\B
	lsr.l  #0x8,\B
	add.l  \A,\B
	move.l \B,\destreg
	endm
	
; Integer linear interpolation between A and B by T (0-1024)
LERP_INT1024: macro destreg,A,B,T,tempreg
	; (A*(1024-T) + B * T) >> 10
	move.l #1024,\tempreg		; Backup T
	sub.l  \T,\tempreg	; (1024-T)
	mulu   \tempreg,\A		; A*(1024-T)
	mulu   \T,\B			; B*T
	add.l  \A,\B			; (A*(1024-T) + B * T)
	lsr.l  #0x8,\B			; (A*(1024-T) + B * T) >> 10
	lsr.l  #0x2,\B
	move.l \B,\destreg
	endm

;==============================================================

TOSUBPIXELS: macro destreg
	swap   \destreg
	move.w #0x0, \destreg
	endm
	
TOPIXELS: macro destreg
	move.w #0x0, \destreg
	swap   \destreg
	endm
	
PIXELS2TILES: macro reg
	lsr.w  #0x3, \reg
	endm
	
TILES2PIXELS: macro reg
	lsl.w  #0x3, \reg
	endm

BYTES2TILES: macro reg
	lsr.w  #0x5, \reg
	endm

TILES2BYTES: macro reg
	lsl.w  #0x5, \reg
	endm

TILES2BLOCKS: macro reg
	lsr.w  #0x2, \reg
	endm

PIXELS2BLOCKS: macro reg
	lsr.w  #0x5, \reg
	endm
	
BLOCKS2TILES: macro reg
	lsl.w  #0x2, \reg
	endm

;==============================================================

RAISE_EXCEPTION: macro errcode
	PUSHL   #(\errcode)
	IFND FINAL
	jsr     Exception_Breakpoint_Hook
	ENDIF
	illegal
	endm
