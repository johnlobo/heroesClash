;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.5 #9498 (Mac OS X x86_64)
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _init
	.globl _interruptHandler
	.globl _playmusic
	.globl _wait4UserKeypress
	.globl _clearScreen
	.globl _game
	.globl _drawText
	.globl _cpct_restoreState_mxor_u8
	.globl _cpct_setSeed_mxor
	.globl _cpct_akp_musicPlay
	.globl _cpct_akp_musicInit
	.globl _cpct_setPALColour
	.globl _cpct_setPalette
	.globl _cpct_fw2hw
	.globl _cpct_setVideoMode
	.globl _cpct_scanKeyboard_if
	.globl _cpct_memset
	.globl _cpct_setInterruptHandler
	.globl _cpct_disableFirmware
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_interruptHandler_i_1_107:
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/main.c:24: void playmusic() {
;	---------------------------------
; Function playmusic
; ---------------------------------
_playmusic::
;src/main.c:39: __endasm;
	exx
	.db	#0x08
	push	af
	push	bc
	push	de
	push	hl
	call	_cpct_akp_musicPlay
	pop	hl
	pop	de
	pop	bc
	pop	af
	.db	#0x08
	exx
	ret
;src/main.c:43: void interruptHandler() {
;	---------------------------------
; Function interruptHandler
; ---------------------------------
_interruptHandler::
;src/main.c:46: i++;
	ld	hl, #_interruptHandler_i_1_107+0
	inc	(hl)
;src/main.c:47: switch(i) {
	ld	a,(#_interruptHandler_i_1_107 + 0)
	cp	a,#0x05
	jp	Z,_cpct_scanKeyboard_if
	cp	a,#0x06
	jp	Z,_playmusic
	sub	a, #0x09
	jr	Z,00103$
	ret
;src/main.c:48: case 5: 
;src/main.c:49: cpct_scanKeyboard_if();
;src/main.c:50: break;
	jp  _cpct_scanKeyboard_if
;src/main.c:51: case 6:
;src/main.c:53: playmusic();
;src/main.c:54: break;
	jp  _playmusic
;src/main.c:55: case 9:
00103$:
;src/main.c:56: i=0;
	ld	hl,#_interruptHandler_i_1_107 + 0
	ld	(hl), #0x00
;src/main.c:57: }
	ret
;src/main.c:60: void init() {
;	---------------------------------
; Function init
; ---------------------------------
_init::
;src/main.c:62: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:63: cpct_setVideoMode(0);
	ld	l,#0x00
	call	_cpct_setVideoMode
;src/main.c:64: cpct_fw2hw(hc_graphics_palette, 16);
	ld	hl,#0x0010
	push	hl
	ld	hl,#_hc_graphics_palette
	push	hl
	call	_cpct_fw2hw
;src/main.c:65: cpct_setPalette(hc_graphics_palette, 16);
	ld	hl,#0x0010
	push	hl
	ld	hl,#_hc_graphics_palette
	push	hl
	call	_cpct_setPalette
;src/main.c:66: cpct_setBorder(HW_BLACK);
	ld	hl,#0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:67: cpct_akp_musicInit(hc_smoke);
	ld	hl,#_hc_smoke
	push	hl
	call	_cpct_akp_musicInit
	pop	af
;src/main.c:68: cpct_setInterruptHandler(interruptHandler);
	ld	hl,#_interruptHandler
	call	_cpct_setInterruptHandler
;src/main.c:73: cpct_akp_musicPlay();
	call	_cpct_akp_musicPlay
;src/main.c:75: drawText("HERO QUEST IS READY", 31, 76, 1);
	ld	hl,#0x014C
	push	hl
	ld	a,#0x1F
	push	af
	inc	sp
	ld	hl,#___str_0
	push	hl
	call	_drawText
	pop	af
;src/main.c:76: drawText("PRESS ANY KEY", 20, 90, 1);
	inc	sp
	ld	hl,#0x015A
	ex	(sp),hl
	ld	a,#0x14
	push	af
	inc	sp
	ld	hl,#___str_1
	push	hl
	call	_drawText
	pop	af
	pop	af
	inc	sp
;src/main.c:78: seed = wait4UserKeypress();
	call	_wait4UserKeypress
;src/main.c:80: if (!seed)
	ld	a,d
	or	a, e
	or	a, h
	or	a,l
	jr	NZ,00102$
;src/main.c:81: seed++;
	inc	l
	jr	NZ,00109$
	inc	h
	jr	NZ,00109$
	inc	e
	jr	NZ,00109$
	inc	d
00109$:
00102$:
;src/main.c:82: cpct_srand(seed);
	call	_cpct_setSeed_mxor
	call	_cpct_restoreState_mxor_u8
;src/main.c:84: clearScreen();
	call	_clearScreen
	ret
___str_0:
	.ascii "HERO QUEST IS READY"
	.db 0x00
___str_1:
	.ascii "PRESS ANY KEY"
	.db 0x00
;src/main.c:88: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:91: cpct_memset(CPCT_VMEM_START, 0, 0x4000);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:93: init();
	call	_init
;src/main.c:95: game();
	call	_game
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
