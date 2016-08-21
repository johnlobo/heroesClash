;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.5 #9498 (Mac OS X x86_64)
;--------------------------------------------------------
	.module keyboard
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _drawText
	.globl _strlen
	.globl _cpct_getScreenPtr
	.globl _cpct_drawSolidBox
	.globl _cpct_px2byteM0
	.globl _cpct_isAnyKeyPressed_f
	.globl _cpct_isAnyKeyPressed
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard_f
	.globl _cpct_scanKeyboard
	.globl _wait4UserKeypress
	.globl _esperaUnaTecla
	.globl _waitKeyUp
	.globl _wait4Key
	.globl _redefineKey
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
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
;src/utils/keyboard.c:32: u32 wait4UserKeypress() {
;	---------------------------------
; Function wait4UserKeypress
; ---------------------------------
_wait4UserKeypress::
;src/utils/keyboard.c:36: do {
	ld	hl,#0x0000
	ld	e,l
	ld	d,h
00101$:
;src/utils/keyboard.c:37: c++;                       // One more cycle
	inc	l
	jr	NZ,00115$
	inc	h
	jr	NZ,00115$
	inc	e
	jr	NZ,00115$
	inc	d
00115$:
;src/utils/keyboard.c:38: cpct_scanKeyboard_f();     // Scan the scan the keyboard
	push	hl
	push	de
	call	_cpct_scanKeyboard_f
	call	_cpct_isAnyKeyPressed_f
	ld	a,l
	pop	de
	pop	hl
	or	a, a
	jr	Z,00101$
;src/utils/keyboard.c:41: return c;
	ret
;src/utils/keyboard.c:45: cpct_keyID esperaUnaTecla() {
;	---------------------------------
; Function esperaUnaTecla
; ---------------------------------
_esperaUnaTecla::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/utils/keyboard.c:48: u8 i = 10, *keys = cpct_keyboardStatusBuffer + 9;
	ld	d,#0x0A
;src/utils/keyboard.c:52: do { cpct_scanKeyboard(); } while ( ! cpct_isAnyKeyPressed() );
00101$:
	push	de
	call	_cpct_scanKeyboard
	call	_cpct_isAnyKeyPressed
	pop	de
	ld	a,l
	or	a, a
	jr	Z,00101$
;src/utils/keyboard.c:55: do {
	ld	bc,#(_cpct_keyboardStatusBuffer + 0x0009)
	ld	e,#0x0A
00106$:
;src/utils/keyboard.c:58: keypressed = *keys ^ 0xFF;
	ld	a,(bc)
	xor	a, #0xFF
	ld	-2 (ix),a
	ld	-1 (ix),#0x00
;src/utils/keyboard.c:60: return (keypressed << 8) + (i - 1);  // Formato cpct_keyID: 8 primeros bits = máscara de tecla, 8 siguientes fila del teclado (0-9)
	ld	h,-2 (ix)
	ld	l,#0x00
;src/utils/keyboard.c:59: if (keypressed)
	ld	a,-1 (ix)
	or	a,-2 (ix)
	jr	Z,00105$
;src/utils/keyboard.c:60: return (keypressed << 8) + (i - 1);  // Formato cpct_keyID: 8 primeros bits = máscara de tecla, 8 siguientes fila del teclado (0-9)
	ld	c,d
	ld	b,#0x00
	dec	bc
	add	hl,bc
	jr	00109$
00105$:
;src/utils/keyboard.c:61: keys--;
	dec	bc
;src/utils/keyboard.c:62: } while (--i);
	dec	e
	ld	a,e
	ld	d,a
;src/utils/keyboard.c:63: return (keypressed << 8) + (i - 1);
	or	a,a
	jr	NZ,00106$
	ld	d,a
	dec	de
	add	hl,de
00109$:
	ld	sp, ix
	pop	ix
	ret
;src/utils/keyboard.c:66: void waitKeyUp(cpct_keyID key) {
;	---------------------------------
; Function waitKeyUp
; ---------------------------------
_waitKeyUp::
;src/utils/keyboard.c:68: while (cpct_isKeyPressed(key)) {
00101$:
	pop	bc
	pop	hl
	push	hl
	push	bc
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	ret	Z
;src/utils/keyboard.c:69: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
	jr	00101$
;src/utils/keyboard.c:73: void wait4Key(cpct_keyID key) {
;	---------------------------------
; Function wait4Key
; ---------------------------------
_wait4Key::
;src/utils/keyboard.c:74: do
00101$:
;src/utils/keyboard.c:75: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/utils/keyboard.c:76: while ( ! cpct_isKeyPressed(key) );
	pop	bc
	pop	hl
	push	hl
	push	bc
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00101$
;src/utils/keyboard.c:77: do
00104$:
;src/utils/keyboard.c:78: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/utils/keyboard.c:79: while ( cpct_isKeyPressed(key) );
	pop	bc
	pop	hl
	push	hl
	push	bc
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	NZ,00104$
	ret
;src/utils/keyboard.c:82: cpct_keyID redefineKey(u8 text[]) {
;	---------------------------------
; Function redefineKey
; ---------------------------------
_redefineKey::
;src/utils/keyboard.c:87: u8* pvideo = cpct_getScreenPtr(CPCT_VMEM_START, 39 - 10 * FONT_W, 144);
	ld	hl,#0x9009
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/utils/keyboard.c:88: cpct_drawSolidBox(pvideo, cpct_px2byteM0(5,5), 15 * FONT_W, FONT_H);
	push	hl
	ld	hl,#0x0505
	push	hl
	call	_cpct_px2byteM0
	ld	d,l
	pop	bc
	ld	hl,#0x0B2D
	push	hl
	push	de
	inc	sp
	push	bc
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
;src/utils/keyboard.c:90: x = strlen(text);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_strlen
	pop	af
;src/utils/keyboard.c:92: drawText(text, 39 - ((x / 2) * FONT_W), 144,1);
	srl	l
	ld	c,l
	add	hl, hl
	add	hl, bc
	ld	c,l
	ld	a,#0x27
	sub	a, c
	ld	b,a
	ld	hl,#0x0190
	push	hl
	push	bc
	inc	sp
	ld	hl, #5
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	_drawText
	pop	af
	pop	af
	inc	sp
;src/utils/keyboard.c:94: key = esperaUnaTecla();
	call	_esperaUnaTecla
;src/utils/keyboard.c:95: waitKeyUp(key);
	push	hl
	push	hl
	call	_waitKeyUp
	pop	af
	pop	hl
;src/utils/keyboard.c:97: return key;
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
