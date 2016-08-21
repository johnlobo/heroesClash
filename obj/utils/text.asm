;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.5 #9498 (Mac OS X x86_64)
;--------------------------------------------------------
	.module text
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _moveCharacter
	.globl _strLength
	.globl _clearWindow
	.globl _itoa
	.globl _cpct_getScreenPtr
	.globl _cpct_waitVSYNC
	.globl _cpct_drawSprite
	.globl _strCopy
	.globl _drawNumber
	.globl _drawText
	.globl _moveFallingText
	.globl _drawFallingText
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
;src/utils/text.c:23: u8 strLength(u8 str[]) {
;	---------------------------------
; Function strLength
; ---------------------------------
_strLength::
;src/utils/text.c:27: while (str[result] != '\0') {
	ld	c,#0x00
00101$:
	ld	hl, #2
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	b,#0x00
	add	hl, bc
	ld	a,(hl)
	or	a, a
	jr	Z,00103$
;src/utils/text.c:28: result++;
	inc	c
	jr	00101$
00103$:
;src/utils/text.c:30: return result;
	ld	l,c
	ret
;src/utils/text.c:36: void strCopy(i8* to, const i8* from) {
;	---------------------------------
; Function strCopy
; ---------------------------------
_strCopy::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/utils/text.c:39: while (i) {
	ld	c,6 (ix)
	ld	b,7 (ix)
	ld	e,4 (ix)
	ld	d,5 (ix)
	ld	-1 (ix),#0x1E
00101$:
	ld	a,-1 (ix)
	or	a, a
	jr	Z,00104$
;src/utils/text.c:40: *to++ = *from++;
	ld	a,(bc)
	inc	bc
	ld	(de),a
	inc	de
;src/utils/text.c:41: i--;
	dec	-1 (ix)
	jr	00101$
00104$:
	inc	sp
	pop	ix
	ret
;src/utils/text.c:45: void drawNumber(u16 aNumber, u8 length, u8 xPos, u8 yPos) {
;	---------------------------------
; Function drawNumber
; ---------------------------------
_drawNumber::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-8
	add	hl,sp
;src/utils/text.c:53: itoa(aNumber, str, 10);
	ld	sp, hl
	inc	hl
	inc	hl
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	push	bc
	ld	hl,#0x000A
	push	hl
	push	de
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_itoa
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	pop	bc
;src/utils/text.c:55: zeros = length - strLength(str);
	ld	e, c
	ld	d, b
	push	bc
	push	de
	call	_strLength
	pop	af
	pop	bc
	ld	a,6 (ix)
	sub	a, l
	ld	-7 (ix),a
;src/utils/text.c:57: number = str[x];
	ld	a,(bc)
	ld	e,a
;src/utils/text.c:59: while (number != '\0') {
	ld	-8 (ix),#0x00
00101$:
	ld	a,e
	or	a, a
	jr	Z,00104$
;src/utils/text.c:61: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, (zeros + x) * FONT_W + xPos, yPos);
	ld	a,-7 (ix)
	add	a, -8 (ix)
	ld	l,a
	push	de
	ld	e,l
	add	hl, hl
	add	hl, de
	pop	de
	ld	a,l
	add	a, 7 (ix)
	ld	d,a
	push	bc
	push	de
	ld	a,8 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
	pop	bc
;src/utils/text.c:62: cpct_drawSprite(G_numbers_big[number - 48], pvideo, FONT_W, FONT_H);
	push	hl
	pop	iy
	ld	d,#0x00
	ld	a,e
	add	a,#0xD0
	ld	e,a
	ld	a,d
	adc	a,#0xFF
	ld	d,a
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	de,#_G_numbers_big
	add	hl,de
	ex	de,hl
	push	bc
	ld	hl,#0x0B03
	push	hl
	push	iy
	push	de
	call	_cpct_drawSprite
	pop	bc
;src/utils/text.c:64: number = str[++x];
	inc	-8 (ix)
	ld	l,-8 (ix)
	ld	h,#0x00
	add	hl,bc
	ld	e,(hl)
	jr	00101$
00104$:
	ld	sp, ix
	pop	ix
	ret
;src/utils/text.c:70: void drawText(u8 text[], u8 xPos, u8 yPos, u8 centered) {
;	---------------------------------
; Function drawText
; ---------------------------------
_drawText::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	dec	sp
;src/utils/text.c:76: if (centered) {
	ld	a,8 (ix)
	or	a, a
	jr	Z,00102$
;src/utils/text.c:77: x = strLength(text);
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_strLength
	pop	af
;src/utils/text.c:78: xPos = 39 - (x / 2) * FONT_W;
	srl	l
	ld	c,l
	add	hl, hl
	add	hl, bc
	ld	a,#0x27
	sub	a, l
	ld	6 (ix),a
00102$:
;src/utils/text.c:82: character = text[x];
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	a,(bc)
	ld	-5 (ix),a
;src/utils/text.c:84: while (character != '\0') {
	ld	-4 (ix),#0x00
	ld	-1 (ix),#0x00
00109$:
	ld	a,-5 (ix)
	or	a, a
	jp	Z,00112$
;src/utils/text.c:86: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, (x * FONT_W) + xPos, yPos);
	ld	a,-1 (ix)
	add	a, 6 (ix)
	ld	d,a
	push	bc
	ld	a,7 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	bc
;src/utils/text.c:91: cpct_drawSprite(G_numbers_big[character - 48], pvideo, FONT_W, FONT_H);
	ld	-3 (ix),l
	ld	-2 (ix),h
	ld	e,-5 (ix)
	ld	d,#0x00
;src/utils/text.c:89: if (character >= 48 && character <= 57) {
	ld	a,-5 (ix)
	sub	a, #0x30
	jr	C,00106$
	ld	a,#0x39
	sub	a, -5 (ix)
	jr	C,00106$
;src/utils/text.c:91: cpct_drawSprite(G_numbers_big[character - 48], pvideo, FONT_W, FONT_H);
	ld	a,e
	add	a,#0xD0
	ld	e,a
	ld	a,d
	adc	a,#0xFF
	ld	d,a
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	de,#_G_numbers_big
	add	hl,de
	ex	de,hl
	push	bc
	ld	hl,#0x0B03
	push	hl
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	push	hl
	push	de
	call	_cpct_drawSprite
	pop	bc
	jr	00107$
00106$:
;src/utils/text.c:94: else if (character != 32) { //32 = SPACE
	ld	a,-5 (ix)
	sub	a, #0x20
	jr	Z,00107$
;src/utils/text.c:96: cpct_drawSprite(g_font_big[character - 64], pvideo, FONT_W, FONT_H);
	ld	a,e
	add	a,#0xC0
	ld	e,a
	ld	a,d
	adc	a,#0xFF
	ld	d,a
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	de,#_g_font_big
	add	hl,de
	ex	de,hl
	push	bc
	ld	hl,#0x0B03
	push	hl
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	push	hl
	push	de
	call	_cpct_drawSprite
	pop	bc
00107$:
;src/utils/text.c:99: character = text[++x];
	inc	-1 (ix)
	inc	-1 (ix)
	inc	-1 (ix)
	inc	-4 (ix)
	ld	l,-4 (ix)
	ld	h,#0x00
	add	hl,bc
	ld	a,(hl)
	ld	-5 (ix),a
	jp	00109$
00112$:
	ld	sp, ix
	pop	ix
	ret
;src/utils/text.c:103: void moveCharacter(FChar *character) {
;	---------------------------------
; Function moveCharacter
; ---------------------------------
_moveCharacter::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-13
	add	hl,sp
	ld	sp,hl
;src/utils/text.c:105: if (character->phase != FALLING_TEXT_MAX_BOUNCES) {
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	a,(bc)
	ld	d,a
;src/utils/text.c:110: if (character->yPos != character->startyPos) {
	ld	hl,#0x0002
	add	hl,bc
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	e,(hl)
;src/utils/text.c:112: clearWindow(character->xPos, character->yPos + (character->phase % 2 != 0 ? - FALLING_TEXT_SPEED : FALLING_TEXT_SPEED), FONT_W, FONT_H);
	ld	hl,#0x0001
	add	hl,bc
	ld	-4 (ix),l
	ld	-3 (ix),h
;src/utils/text.c:144: drawText(character->character, character->xPos, character->yPos, 0);
	ld	hl,#0x0006
	add	hl,bc
	ld	-6 (ix),l
	ld	-5 (ix),h
;src/utils/text.c:105: if (character->phase != FALLING_TEXT_MAX_BOUNCES) {
	ld	a,d
	sub	a, #0x06
	jp	Z,00111$
;src/utils/text.c:110: if (character->yPos != character->startyPos) {
	ld	hl,#0x0003
	add	hl,bc
	ld	-8 (ix),l
	ld	-7 (ix),h
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a,(hl)
	ld	-9 (ix),a
	ld	a,e
	sub	a, -9 (ix)
	jr	Z,00102$
;src/utils/text.c:112: clearWindow(character->xPos, character->yPos + (character->phase % 2 != 0 ? - FALLING_TEXT_SPEED : FALLING_TEXT_SPEED), FONT_W, FONT_H);
	bit	0, d
	jr	Z,00115$
	ld	l,#0xFD
	jr	00116$
00115$:
	ld	l,#0x03
00116$:
	ld	a,e
	add	a, l
	ld	e,a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	d,(hl)
	push	bc
	ld	hl,#0x0B03
	push	hl
	ld	a,e
	push	af
	inc	sp
	push	de
	inc	sp
	call	_clearWindow
	pop	af
	pop	af
	pop	bc
00102$:
;src/utils/text.c:117: if (character->phase % 2 != 0) {
	ld	a,(bc)
	and	a, #0x01
	ld	-9 (ix),a
;src/utils/text.c:110: if (character->yPos != character->startyPos) {
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	e,(hl)
;src/utils/text.c:121: if (character->yPos >= character->destinationyPos) {
	ld	hl,#0x0005
	add	hl,bc
	ld	-11 (ix),l
	ld	-10 (ix),h
;src/utils/text.c:125: character->destinationyPos = character->endyPos - ((character->endyPos - character->startyPos) / character->phase);
	ld	hl,#0x0004
	add	hl,bc
	ex	(sp), hl
;src/utils/text.c:117: if (character->phase % 2 != 0) {
	ld	a,-9 (ix)
	or	a, a
	jr	Z,00108$
;src/utils/text.c:119: character->yPos += FALLING_TEXT_SPEED;
	inc	e
	inc	e
	inc	e
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),e
;src/utils/text.c:121: if (character->yPos >= character->destinationyPos) {
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	d,(hl)
	ld	a,e
	sub	a, d
	jr	C,00109$
;src/utils/text.c:123: character->phase++;
	ld	a,(bc)
	ld	e,a
	inc	e
	ld	a,e
	ld	(bc),a
;src/utils/text.c:125: character->destinationyPos = character->endyPos - ((character->endyPos - character->startyPos) / character->phase);
	pop	hl
	push	hl
	ld	a,(hl)
	ld	-9 (ix), a
	ld	c, a
	ld	b,#0x00
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	l,(hl)
	ld	d,#0x00
	ld	a,c
	sub	a, l
	ld	c,a
	ld	a,b
	sbc	a, d
	ld	b,a
	ld	d,#0x00
	push	de
	push	bc
	call	__divsint
	pop	af
	pop	af
	ld	a, -9 (ix)
	sub	a, l
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl),a
	jr	00109$
00108$:
;src/utils/text.c:132: character->yPos -= FALLING_TEXT_SPEED;
	ld	a,e
	add	a,#0xFD
	ld	e,a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),e
;src/utils/text.c:134: if (character->yPos <= character->destinationyPos) {
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a, (hl)
	sub	a, e
	jr	C,00109$
;src/utils/text.c:136: character->phase++;
	ld	a,(bc)
	inc	a
	ld	(bc),a
;src/utils/text.c:138: character->destinationyPos = character->endyPos;
	pop	hl
	push	hl
	ld	c,(hl)
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl),c
00109$:
;src/utils/text.c:144: drawText(character->character, character->xPos, character->yPos, 0);
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	b,(hl)
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	d,(hl)
	xor	a, a
	push	af
	inc	sp
	ld	c, d
	push	bc
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	call	_drawText
	pop	af
	pop	af
	inc	sp
	jr	00113$
00111$:
;src/utils/text.c:148: clearWindow(character->xPos, character->yPos - FALLING_TEXT_SPEED, FONT_W, FONT_H);
	ld	a,e
	add	a,#0xFD
	ld	d,a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	b,(hl)
	ld	hl,#0x0B03
	push	hl
	push	de
	inc	sp
	push	bc
	inc	sp
	call	_clearWindow
	pop	af
	pop	af
;src/utils/text.c:149: drawText(character->character, character->xPos, character->yPos, 0);
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	d,(hl)
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	b,(hl)
	xor	a, a
	push	af
	inc	sp
	push	de
	inc	sp
	push	bc
	inc	sp
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	call	_drawText
	pop	af
	pop	af
	inc	sp
00113$:
	ld	sp, ix
	pop	ix
	ret
;src/utils/text.c:154: u8 moveFallingText(FChar *text, u8 lenght) {
;	---------------------------------
; Function moveFallingText
; ---------------------------------
_moveFallingText::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/utils/text.c:158: for (x = 0; x < lenght; x++) {
	ld	c,#0x00
00109$:
	ld	a,c
	sub	a, 6 (ix)
	jr	NC,00107$
;src/utils/text.c:160: if (x == 0 || (x > 0 && text[x - 1].phase == 1 && text[x - 1].yPos >= text[x].yPos + 15) || text[x - 1].phase > 1) moveCharacter(&text[x]);
	ld	l,c
	ld	h,#0x00
	ld	e, l
	ld	d, h
	sla	e
	rl	d
	sla	e
	rl	d
	sla	e
	rl	d
	ld	a,4 (ix)
	add	a, e
	ld	-2 (ix),a
	ld	a,5 (ix)
	adc	a, d
	ld	-1 (ix),a
	ld	a,c
	or	a, a
	jr	Z,00101$
	dec	hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de,hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl,de
	ld	b,(hl)
	ld	a,c
	or	a, a
	jr	Z,00106$
	ld	a,b
	dec	a
	jr	NZ,00106$
	inc	hl
	inc	hl
	ld	e,(hl)
	pop	hl
	push	hl
	inc	hl
	inc	hl
	ld	l,(hl)
	ld	h,#0x00
	push	de
	ld	de,#0x000F
	add	hl, de
	pop	de
	ld	d,#0x00
	ld	a,e
	sub	a, l
	ld	a,d
	sbc	a, h
	jp	PO, 00138$
	xor	a, #0x80
00138$:
	jp	P,00101$
00106$:
	ld	a,#0x01
	sub	a, b
	jr	NC,00110$
00101$:
	push	bc
	pop	de
	pop	hl
	push	hl
	push	de
	push	hl
	call	_moveCharacter
	pop	af
	pop	bc
00110$:
;src/utils/text.c:158: for (x = 0; x < lenght; x++) {
	inc	c
	jr	00109$
00107$:
;src/utils/text.c:163: return text[lenght - 1].phase == FALLING_TEXT_MAX_BOUNCES;
	ld	l,6 (ix)
	ld	h,#0x00
	dec	hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl,bc
	ld	a,(hl)
	sub	a, #0x06
	jr	NZ,00139$
	ld	a,#0x01
	jr	00140$
00139$:
	xor	a,a
00140$:
	ld	l,a
	ld	sp, ix
	pop	ix
	ret
;src/utils/text.c:169: void drawFallingText(u8 text[], u8 xPos, u8 yPos, u8 destinationyPos) {
;	---------------------------------
; Function drawFallingText
; ---------------------------------
_drawFallingText::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-166
	add	hl,sp
	ld	sp,hl
;src/utils/text.c:175: for (x = 0; x < strLength(text) && x < FALLING_TEXT_MAX_LENGHT; x++) {
	ld	hl,#0x0001
	add	hl,sp
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	iy,#0
	add	iy,sp
	ld	0 (iy),#0x00
	ld	-3 (ix),#0x00
00109$:
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_strLength
	pop	af
	ld	c,l
	ld	iy,#0
	add	iy,sp
	ld	a,0 (iy)
	sub	a, c
	jp	NC,00120$
	ld	a,0 (iy)
	sub	a, #0x14
	jr	NC,00120$
;src/utils/text.c:177: ftext[x].phase = 1;
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	a,-2 (ix)
	add	a, c
	ld	c,a
	ld	a,-1 (ix)
	adc	a, b
	ld	b,a
	ld	a,#0x01
	ld	(bc),a
;src/utils/text.c:178: ftext[x].xPos = xPos + (x * FONT_W);
	ld	e, c
	ld	d, b
	inc	de
	ld	a,6 (ix)
	add	a, -3 (ix)
	ld	(de),a
;src/utils/text.c:179: ftext[x].yPos = yPos;
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	a,7 (ix)
	ld	(de),a
;src/utils/text.c:180: ftext[x].startyPos = yPos;
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
	ld	a,7 (ix)
	ld	(de),a
;src/utils/text.c:181: ftext[x].endyPos = destinationyPos;
	ld	hl,#0x0004
	add	hl,bc
	ld	a,8 (ix)
	ld	(hl),a
;src/utils/text.c:182: ftext[x].destinationyPos = destinationyPos;
	ld	hl,#0x0005
	add	hl,bc
	ld	a,8 (ix)
	ld	(hl),a
;src/utils/text.c:183: ftext[x].character[0] = text[x];
	ld	hl,#0x0006
	add	hl,bc
	ld	-5 (ix),l
	ld	-4 (ix),h
	ld	a,4 (ix)
	ld	hl,#0
	add	hl,sp
	add	a, (hl)
	ld	e,a
	ld	a,5 (ix)
	adc	a, #0x00
	ld	d,a
	ld	a,(de)
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	(hl),a
;src/utils/text.c:184: ftext[x].character[1] = '\0';
	ld	hl,#0x0007
	add	hl,bc
	ld	(hl),#0x00
;src/utils/text.c:175: for (x = 0; x < strLength(text) && x < FALLING_TEXT_MAX_LENGHT; x++) {
	inc	-3 (ix)
	inc	-3 (ix)
	inc	-3 (ix)
	inc	0 (iy)
	jp	00109$
;src/utils/text.c:187: while (1) {
00120$:
	ld	a,-2 (ix)
	ld	-5 (ix),a
	ld	a,-1 (ix)
	ld	-4 (ix),a
00105$:
;src/utils/text.c:190: if (moveFallingText(ftext, strLength(text) <= FALLING_TEXT_MAX_LENGHT ? strLength(text) : FALLING_TEXT_MAX_LENGHT)) {
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_strLength
	pop	af
	ld	a,#0x14
	sub	a, l
	jr	C,00113$
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_strLength
	pop	af
	ld	b,l
	jr	00114$
00113$:
	ld	b,#0x14
00114$:
	ld	e,-5 (ix)
	ld	d,-4 (ix)
	push	bc
	inc	sp
	push	de
	call	_moveFallingText
	pop	af
	inc	sp
	ld	a,l
	or	a, a
;src/utils/text.c:192: return;
	jr	NZ,00111$
;src/utils/text.c:196: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
	jr	00105$
00111$:
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
