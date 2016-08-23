;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.5 #9498 (Mac OS X x86_64)
;--------------------------------------------------------
	.module game
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _checkUserMovement
	.globl _drawUser
	.globl _newHand
	.globl _insertCardEnemy
	.globl _insertCardUser
	.globl _drawScreen
	.globl _initGame
	.globl _delay
	.globl _cpc_GetSp
	.globl _reset_cpc
	.globl _cpct_getRandom_mxor_u8
	.globl _cpct_getScreenPtr
	.globl _cpct_drawSpriteMaskedAlignedTable
	.globl _cpct_drawSprite
	.globl _cpct_isKeyPressed
	.globl _tile_buffer_1
	.globl _tile_buffer_0
	.globl _abort
	.globl _user
	.globl _keys
	.globl _enemyTable
	.globl _userTable
	.globl _enemyY
	.globl _enemyX
	.globl _cards
	.globl _game
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_enemyX::
	.ds 1
_enemyY::
	.ds 1
_userTable::
	.ds 48
_enemyTable::
	.ds 48
_keys::
	.ds 14
_user::
	.ds 7
_abort::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_tile_buffer_0::
	.ds 50
_tile_buffer_1::
	.ds 50
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
;src/game.c:56: cpctm_createTransparentMaskTable(hc_tablatrans, 0x100, M0, 0);
;	---------------------------------
; Function dummy_cpct_transparentMaskTable0M0_container
; ---------------------------------
_dummy_cpct_transparentMaskTable0M0_container::
	.area _hc_tablatrans_ (ABS) 
	.org 0x100 
	 _hc_tablatrans::
	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.area _CSEG (REL, CON) 
;src/game.c:67: void delay(u32 cycles) {
;	---------------------------------
; Function delay
; ---------------------------------
_delay::
;src/game.c:69: for (i = 0; i < cycles; i++) {
	ld	bc,#0x0000
	ld	de,#0x0000
00103$:
	ld	hl,#2
	add	hl,sp
	ld	a,c
	sub	a, (hl)
	ld	a,b
	inc	hl
	sbc	a, (hl)
	ld	a,e
	inc	hl
	sbc	a, (hl)
	ld	a,d
	inc	hl
	sbc	a, (hl)
	ret	NC
;src/game.c:72: __endasm;
	halt
;src/game.c:69: for (i = 0; i < cycles; i++) {
	inc	c
	jr	NZ,00103$
	inc	b
	jr	NZ,00103$
	inc	e
	jr	NZ,00103$
	inc	d
	jr	00103$
_cards:
	.dw _hc_figures_0
	.dw _hc_figures_0
	.dw _hc_figures_1
	.dw _hc_figures_2
	.dw _hc_figures_3
;src/game.c:77: void initGame() {
;	---------------------------------
; Function initGame
; ---------------------------------
_initGame::
;src/game.c:78: abort = 0;
	ld	hl,#_abort + 0
	ld	(hl), #0x00
;src/game.c:80: user.x = 0;
	ld	hl,#_user
	ld	(hl),#0x00
;src/game.c:81: user.y = 0;
	ld	hl,#(_user + 0x0001)
	ld	(hl),#0x00
;src/game.c:82: user.px = 0;
	ld	hl,#(_user + 0x0002)
	ld	(hl),#0x00
;src/game.c:83: user.py = 0;
	ld	hl,#(_user + 0x0003)
	ld	(hl),#0x00
;src/game.c:84: user.moved = 0;
	ld	hl,#(_user + 0x0004)
	ld	(hl),#0x00
;src/game.c:85: user.buffer = tile_buffer_0;
	ld	hl,#_tile_buffer_0
	ld	((_user + 0x0005)), hl
;src/game.c:87: keys.up    = Key_CursorUp;
	ld	hl,#0x0100
	ld	(_keys), hl
;src/game.c:88: keys.down  = Key_CursorDown;
	ld	h, #0x04
	ld	((_keys + 0x0002)), hl
;src/game.c:89: keys.left  = Key_CursorLeft;
	ld	hl,#0x0101
	ld	((_keys + 0x0004)), hl
;src/game.c:90: keys.right = Key_CursorRight;
	ld	hl,#0x0200
	ld	((_keys + 0x0006)), hl
;src/game.c:91: keys.fire  = Key_Space;
	ld	hl,#0x8005
	ld	((_keys + 0x0008)), hl
;src/game.c:92: keys.pause = Key_Del;
	ld	l, #0x09
	ld	((_keys + 0x000a)), hl
;src/game.c:93: keys.abort = Key_Esc;
	ld	hl,#0x0408
	ld	((_keys + 0x000c)), hl
	ret
;src/game.c:96: void drawScreen() {
;	---------------------------------
; Function drawScreen
; ---------------------------------
_drawScreen::
;src/game.c:99: for (j = 0; j < TABLE_HEIGHT; j++) {
	ld	c,#0x00
00106$:
;src/game.c:100: for (i = 0; i < TABLE_WIDTH; i++) {
	ld	b,#0x08
00105$:
	ld	e,b
	dec	e
	ld	a,e
	ld	b,a
	or	a, a
	jr	NZ,00105$
;src/game.c:99: for (j = 0; j < TABLE_HEIGHT; j++) {
	inc	c
	ld	a,c
	sub	a, #0x06
	jr	C,00106$
	ret
;src/game.c:105: void insertCardUser(u8 col) {
;	---------------------------------
; Function insertCardUser
; ---------------------------------
_insertCardUser::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-10
	add	hl,sp
	ld	sp,hl
;src/game.c:108: u8 stopped = 0;
	ld	-9 (ix),#0x00
;src/game.c:111: row = 5;
	ld	-8 (ix),#0x05
;src/game.c:112: card = (cpct_rand() / 64) + 1;
	call	_cpct_getRandom_mxor_u8
	ld	a,l
	rlca
	rlca
	and	a,#0x03
	inc	a
	ld	-10 (ix),a
;src/game.c:114: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X + (col * (TILE_W + 1)), USER_TABLE_Y + (row * (TILE_H + 2)));
	ld	a,4 (ix)
	ld	c,a
	add	a, a
	add	a, c
	add	a, a
	add	a, #0x02
	ld	-1 (ix),a
	ld	a,#0x98
	push	af
	inc	sp
	ld	a,-1 (ix)
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ex	de,hl
;src/game.c:115: cpc_GetSp((u8*) tile_buffer_1, 10, 5, (int) pvmem);
	ld	c, e
	ld	b, d
	push	de
	push	bc
	ld	hl,#0x050A
	push	hl
	ld	hl,#_tile_buffer_1
	push	hl
	call	_cpc_GetSp
	pop	de
;src/game.c:116: cpct_drawSpriteMaskedAlignedTable(cards[card], pvmem, TILE_W, TILE_H, hc_tablatrans);
	ld	bc,#_cards+0
	ld	l,-10 (ix)
	ld	h,#0x00
	add	hl, hl
	add	hl,bc
	ld	-3 (ix),l
	ld	-2 (ix),h
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#_hc_tablatrans
	push	hl
	ld	hl,#0x0A05
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMaskedAlignedTable
;src/game.c:118: while (!stopped) {
	ld	bc,#_userTable+0
	ld	e,4 (ix)
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl,bc
	ld	-5 (ix),l
	ld	-4 (ix),h
	ld	a,-5 (ix)
	ld	-7 (ix),a
	ld	a,-4 (ix)
	ld	-6 (ix),a
00107$:
	ld	a,-9 (ix)
	or	a, a
	jp	NZ,00109$
;src/game.c:119: delay(10);
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x000A
	push	hl
	call	_delay
	pop	af
	pop	af
;src/game.c:120: if ((row > 0) && (userTable[col][row - 1] == 0)) {
	ld	a,-8 (ix)
	or	a, a
	jp	Z,00104$
	ld	c,-8 (ix)
	dec	c
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	b,#0x00
	add	hl, bc
	ld	a,(hl)
	or	a, a
	jr	NZ,00104$
;src/game.c:121: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X + (col * (TILE_W + 1)), USER_TABLE_Y + (row * (TILE_H + 2)));
	ld	a,-8 (ix)
	ld	e,a
	add	a, a
	add	a, e
	add	a, a
	add	a, a
	add	a, #0x5C
	ld	b,a
	push	bc
	push	bc
	inc	sp
	ld	a,-1 (ix)
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ex	de,hl
	ld	hl,#0x0A05
	push	hl
	push	de
	ld	hl,#_tile_buffer_1
	push	hl
	call	_cpct_drawSprite
	pop	bc
;src/game.c:123: row--;
;src/game.c:124: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X + (col * (TILE_W + 1)), USER_TABLE_Y + (row * (TILE_H + 2)));
	ld	-8 (ix), c
	ld	a,c
	add	a, a
	add	a, c
	add	a, a
	add	a, a
	add	a, #0x5C
	ld	b,a
	push	bc
	inc	sp
	ld	a,-1 (ix)
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/game.c:125: cpc_GetSp((u8*) tile_buffer_1, 10, 5, (int) pvmem);
	ld	e, c
	ld	d, b
	push	bc
	push	de
	ld	hl,#0x050A
	push	hl
	ld	hl,#_tile_buffer_1
	push	hl
	call	_cpc_GetSp
	pop	bc
;src/game.c:126: cpct_drawSpriteMaskedAlignedTable(cards[card], pvmem, TILE_W, TILE_H, hc_tablatrans);
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#_hc_tablatrans
	push	hl
	ld	hl,#0x0A05
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMaskedAlignedTable
;src/game.c:127: if (row == 0)
	ld	a,-8 (ix)
	or	a, a
	jp	NZ,00107$
;src/game.c:128: stopped = 1;
	ld	-9 (ix),#0x01
	jp	00107$
00104$:
;src/game.c:130: stopped = 1;
	ld	-9 (ix),#0x01
	jp	00107$
00109$:
;src/game.c:133: userTable[col][row] = card;
	ld	a,-5 (ix)
	add	a, -8 (ix)
	ld	c,a
	ld	a,-4 (ix)
	adc	a, #0x00
	ld	b,a
	ld	a,-10 (ix)
	ld	(bc),a
	ld	sp, ix
	pop	ix
	ret
;src/game.c:136: void insertCardEnemy(u8 col) {
;	---------------------------------
; Function insertCardEnemy
; ---------------------------------
_insertCardEnemy::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-10
	add	hl,sp
	ld	sp,hl
;src/game.c:139: u8 stopped = 0;
	ld	-10 (ix),#0x00
;src/game.c:142: row = 0;
	ld	-8 (ix),#0x00
;src/game.c:143: card = (cpct_rand() / 64) + 1;
	call	_cpct_getRandom_mxor_u8
	ld	a,l
	rlca
	rlca
	and	a,#0x03
	inc	a
	ld	-9 (ix),a
;src/game.c:145: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, ENEMY_TABLE_X + (col * (TILE_W + 1)), ENEMY_TABLE_Y + (row * (TILE_H + 2)));
	ld	a,4 (ix)
	ld	c,a
	add	a, a
	add	a, c
	add	a, a
	add	a, #0x02
	ld	-7 (ix),a
	ld	a,#0x02
	push	af
	inc	sp
	ld	a,-7 (ix)
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ex	de,hl
;src/game.c:146: cpc_GetSp((u8*) tile_buffer_1, 10, 5, (int) pvmem);
	ld	c, e
	ld	b, d
	push	de
	push	bc
	ld	hl,#0x050A
	push	hl
	ld	hl,#_tile_buffer_1
	push	hl
	call	_cpc_GetSp
	pop	de
;src/game.c:147: cpct_drawSpriteMaskedAlignedTable(cards[card], pvmem, TILE_W, TILE_H, hc_tablatrans);
	ld	bc,#_cards+0
	ld	l,-9 (ix)
	ld	h,#0x00
	add	hl, hl
	add	hl,bc
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#_hc_tablatrans
	push	hl
	ld	hl,#0x0A05
	push	hl
	push	de
	push	bc
	call	_cpct_drawSpriteMaskedAlignedTable
;src/game.c:149: while (!stopped) {
	ld	bc,#_enemyTable+0
	ld	e,4 (ix)
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl,bc
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	a,-4 (ix)
	ld	-6 (ix),a
	ld	a,-3 (ix)
	ld	-5 (ix),a
00107$:
	ld	a,-10 (ix)
	or	a, a
	jp	NZ,00109$
;src/game.c:150: delay(10);
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x000A
	push	hl
	call	_delay
	pop	af
	pop	af
;src/game.c:151: if ((row < 5) && (enemyTable[col][row + 1] == 0)) {
	ld	a,-8 (ix)
	sub	a, #0x05
	jp	NC,00104$
	ld	c,-8 (ix)
	inc	c
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	b,#0x00
	add	hl, bc
	ld	a,(hl)
	or	a, a
	jr	NZ,00104$
;src/game.c:152: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, ENEMY_TABLE_X + (col * (TILE_W + 1)), ENEMY_TABLE_Y + (row * (TILE_H + 2)));
	ld	a,-8 (ix)
	ld	e,a
	add	a, a
	add	a, e
	add	a, a
	add	a, a
	ld	b,a
	inc	b
	inc	b
	push	bc
	push	bc
	inc	sp
	ld	a,-7 (ix)
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ex	de,hl
	ld	hl,#0x0A05
	push	hl
	push	de
	ld	hl,#_tile_buffer_1
	push	hl
	call	_cpct_drawSprite
	pop	bc
;src/game.c:154: row++;
;src/game.c:155: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, ENEMY_TABLE_X + (col * (TILE_W + 1)), ENEMY_TABLE_Y + (row * (TILE_H + 2)));
	ld	-8 (ix), c
	ld	a,c
	add	a, a
	add	a, c
	add	a, a
	add	a, a
	ld	b,a
	inc	b
	inc	b
	push	bc
	inc	sp
	ld	a,-7 (ix)
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/game.c:156: cpc_GetSp((u8*) tile_buffer_1, 10, 5, (int) pvmem);
	ld	e, c
	ld	d, b
	push	bc
	push	de
	ld	hl,#0x050A
	push	hl
	ld	hl,#_tile_buffer_1
	push	hl
	call	_cpc_GetSp
	pop	bc
;src/game.c:157: cpct_drawSpriteMaskedAlignedTable(cards[card], pvmem, TILE_W, TILE_H, hc_tablatrans);
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#_hc_tablatrans
	push	hl
	ld	hl,#0x0A05
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMaskedAlignedTable
;src/game.c:158: if (row == 5)
	ld	a,-8 (ix)
	sub	a, #0x05
	jp	NZ,00107$
;src/game.c:159: stopped = 1;
	ld	-10 (ix),#0x01
	jp	00107$
00104$:
;src/game.c:161: stopped = 1;
	ld	-10 (ix),#0x01
	jp	00107$
00109$:
;src/game.c:164: enemyTable[col][row] = card;
	ld	a,-4 (ix)
	add	a, -8 (ix)
	ld	c,a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	b,a
	ld	a,-9 (ix)
	ld	(bc),a
	ld	sp, ix
	pop	ix
	ret
;src/game.c:167: void newHand(u8 side) {
;	---------------------------------
; Function newHand
; ---------------------------------
_newHand::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/game.c:171: for (i = 0; i < 8; i++) {
	ld	-1 (ix),#0x00
00111$:
;src/game.c:172: if (side) {
	ld	a,4 (ix)
	or	a, a
	jr	Z,00108$
;src/game.c:173: col = (cpct_rand() / 32);
	call	_cpct_getRandom_mxor_u8
	ld	a,l
	rlca
	rlca
	rlca
	and	a,#0x07
	ld	c,a
;src/game.c:174: while (userTable[col][5] != 0) {
00101$:
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	de,#_userTable
	add	hl,de
	ld	de, #0x0005
	add	hl, de
	ld	a,(hl)
	or	a, a
	jr	Z,00103$
;src/game.c:175: col = (cpct_rand() / 32);
	call	_cpct_getRandom_mxor_u8
	ld	a,l
	rlca
	rlca
	rlca
	and	a,#0x07
	ld	c,a
	jr	00101$
00103$:
;src/game.c:177: insertCardUser(col);
	ld	a,c
	push	af
	inc	sp
	call	_insertCardUser
	inc	sp
	jr	00112$
00108$:
;src/game.c:179: col = (cpct_rand() / 32);
	call	_cpct_getRandom_mxor_u8
	ld	a,l
	rlca
	rlca
	rlca
	and	a,#0x07
	ld	b,a
;src/game.c:180: while (enemyTable[col][0] != 0) {
00104$:
	ld	e,b
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	ld	de,#_enemyTable
	add	hl,de
	ld	a,(hl)
	or	a, a
	jr	Z,00106$
;src/game.c:181: col = (cpct_rand() / 32);
	call	_cpct_getRandom_mxor_u8
	ld	a,l
	rlca
	rlca
	rlca
	and	a,#0x07
	ld	b,a
	jr	00104$
00106$:
;src/game.c:183: insertCardEnemy(col);
	push	bc
	inc	sp
	call	_insertCardEnemy
	inc	sp
00112$:
;src/game.c:171: for (i = 0; i < 8; i++) {
	inc	-1 (ix)
	ld	a,-1 (ix)
	sub	a, #0x08
	jr	C,00111$
	inc	sp
	pop	ix
	ret
;src/game.c:188: void drawUser() {
;	---------------------------------
; Function drawUser
; ---------------------------------
_drawUser::
;src/game.c:195: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X + (user.px * (TILE_W + 1)), USER_TABLE_Y + (user.py * (TILE_H + 2)));
	ld	a, (#(_user + 0x0003) + 0)
	ld	c,a
	add	a, a
	add	a, c
	add	a, a
	add	a, a
	add	a, #0x5C
	ld	d,a
	ld	a, (#(_user + 0x0002) + 0)
	ld	c,a
	add	a, a
	add	a, c
	add	a, a
	ld	b,a
	inc	b
	inc	b
	push	de
	inc	sp
	push	bc
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/game.c:196: cpct_drawSprite(tile_buffer_0, pvmem, HC_MARKER_W, HC_MARKER_H);
	ld	hl,#0x0A05
	push	hl
	push	bc
	ld	hl,#_tile_buffer_0
	push	hl
	call	_cpct_drawSprite
;src/game.c:197: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X + (user.x * (TILE_W + 1)), USER_TABLE_Y + (user.y * (TILE_H + 2)));
	ld	a, (#(_user + 0x0001) + 0)
	ld	c,a
	add	a, a
	add	a, c
	add	a, a
	add	a, a
	add	a, #0x5C
	ld	d,a
	ld	a, (#_user + 0)
	ld	c,a
	add	a, a
	add	a, c
	add	a, a
	ld	b,a
	inc	b
	inc	b
	push	de
	inc	sp
	push	bc
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/game.c:198: cpc_GetSp((u8*) tile_buffer_0, 10, 5, (int) pvmem);
	ld	e, c
	ld	d, b
	push	bc
	push	de
	ld	hl,#0x050A
	push	hl
	ld	hl,#_tile_buffer_0
	push	hl
	call	_cpc_GetSp
	pop	bc
;src/game.c:199: cpct_drawSpriteMaskedAlignedTable(hc_marker, pvmem, HC_MARKER_W, HC_MARKER_H, hc_tablatrans);
	ld	de,#_hc_tablatrans+0
	push	de
	ld	hl,#0x0A05
	push	hl
	push	bc
	ld	hl,#_hc_marker
	push	hl
	call	_cpct_drawSpriteMaskedAlignedTable
;src/game.c:202: user.px = user.x;
	ld	a, (#_user + 0)
	ld	(#(_user + 0x0002)),a
;src/game.c:203: user.py = user.y;
	ld	a, (#(_user + 0x0001) + 0)
	ld	(#(_user + 0x0003)),a
	ret
;src/game.c:206: void checkUserMovement() {
;	---------------------------------
; Function checkUserMovement
; ---------------------------------
_checkUserMovement::
;src/game.c:209: if ((user.x < (TABLE_WIDTH - 1)) && (cpct_isKeyPressed(keys.right))) {
	ld	a,(#_user + 0)
	sub	a, #0x07
	jr	NC,00105$
	ld	hl, (#(_keys + 0x0006) + 0)
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00105$
;src/game.c:210: user.px = user.x;
	ld	bc,#_user+0
	ld	a,(bc)
	ld	(#(_user + 0x0002)),a
;src/game.c:211: user.x++;
	ld	a,(bc)
	inc	a
	ld	(bc),a
;src/game.c:212: user.moved = 1;
	ld	hl,#(_user + 0x0004)
	ld	(hl),#0x01
	jr	00106$
00105$:
;src/game.c:213: } else if ((user.x > 0) && (cpct_isKeyPressed(keys.left))) {
	ld	a, (#_user + 0)
	or	a, a
	jr	Z,00106$
	ld	hl, (#(_keys + 0x0004) + 0)
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00106$
;src/game.c:214: user.px = user.x;
	ld	bc,#_user+0
	ld	a,(bc)
	ld	(#(_user + 0x0002)),a
;src/game.c:215: user.x--;
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
;src/game.c:216: user.moved = 1;
	ld	hl,#(_user + 0x0004)
	ld	(hl),#0x01
00106$:
;src/game.c:219: if ((user.y < (TABLE_HEIGHT - 1)) && (cpct_isKeyPressed(keys.down))) {
	ld	bc,#_user + 1
	ld	a,(bc)
;src/game.c:220: user.py = user.y;
;src/game.c:222: user.moved = 1;
;src/game.c:219: if ((user.y < (TABLE_HEIGHT - 1)) && (cpct_isKeyPressed(keys.down))) {
	ld	e,a
	sub	a, #0x05
	jr	NC,00112$
	ld	hl, (#(_keys + 0x0002) + 0)
	push	bc
	call	_cpct_isKeyPressed
	ld	d,l
	pop	bc
	ld	a,(bc)
	ld	e,a
	ld	a,d
	or	a, a
	jr	Z,00112$
;src/game.c:220: user.py = user.y;
	ld	hl,#(_user + 0x0003)
	ld	(hl),e
;src/game.c:221: user.y++;
	ld	a,(bc)
	inc	a
	ld	(bc),a
;src/game.c:222: user.moved = 1;
	ld	hl,#(_user + 0x0004)
	ld	(hl),#0x01
	jr	00113$
00112$:
;src/game.c:223: } else if ((user.y > 0) && (cpct_isKeyPressed(keys.up))) {
	ld	a,e
	or	a, a
	jr	Z,00113$
	ld	hl, (#_keys + 0)
	push	bc
	call	_cpct_isKeyPressed
	pop	bc
	ld	a,l
	or	a, a
	jr	Z,00113$
;src/game.c:224: user.py = user.y;
	ld	a,(bc)
	ld	(#(_user + 0x0003)),a
;src/game.c:225: user.y--;
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
;src/game.c:226: user.moved = 1;
	ld	hl,#(_user + 0x0004)
	ld	(hl),#0x01
00113$:
;src/game.c:228: if ((userTable[user.x][5] == 0) && (cpct_isKeyPressed(keys.fire))) {
	ld	a, (#_user + 0)
	ld	c,a
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	de,#_userTable
	add	hl,de
	ld	de, #0x0005
	add	hl, de
	ld	a,(hl)
	or	a, a
	jr	NZ,00116$
	ld	hl, (#(_keys + 0x0008) + 0)
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00116$
;src/game.c:229: newHand(1);
	ld	a,#0x01
	push	af
	inc	sp
	call	_newHand
	inc	sp
00116$:
;src/game.c:232: if (cpct_isKeyPressed(keys.abort)) {
	ld	hl, (#(_keys + 0x000c) + 0)
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	ret	Z
;src/game.c:234: reset_cpc();
	jp  _reset_cpc
;src/game.c:238: void game() {
;	---------------------------------
; Function game
; ---------------------------------
_game::
;src/game.c:241: initGame();
	call	_initGame
;src/game.c:242: drawScreen();
	call	_drawScreen
;src/game.c:243: newHand(0);  //0 for Enemy 1 for User
	xor	a, a
	push	af
	inc	sp
	call	_newHand
	inc	sp
;src/game.c:244: newHand(1);  //0 for Enemy 1 for User
	ld	a,#0x01
	push	af
	inc	sp
	call	_newHand
	inc	sp
;src/game.c:245: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X + (user.x * (TILE_W + 1)), USER_TABLE_Y + (user.y * (TILE_H + 2)));
	ld	a, (#_user + 1)
	ld	c,a
	add	a, a
	add	a, c
	add	a, a
	add	a, a
	add	a, #0x5C
	ld	d,a
	ld	a, (#_user + 0)
	ld	c,a
	add	a, a
	add	a, c
	add	a, a
	ld	b,a
	inc	b
	inc	b
	push	de
	inc	sp
	push	bc
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
;src/game.c:246: cpc_GetSp((u8*) tile_buffer_0, 10, 5, (int) pvmem);
	push	hl
	ld	hl,#0x050A
	push	hl
	ld	hl,#_tile_buffer_0
	push	hl
	call	_cpc_GetSp
;src/game.c:247: drawUser();
	call	_drawUser
;src/game.c:248: while (1) {
00106$:
;src/game.c:249: checkUserMovement();
	call	_checkUserMovement
;src/game.c:250: if (user.moved) {
	ld	a, (#(_user + 0x0004) + 0)
	or	a, a
	jr	Z,00102$
;src/game.c:251: drawUser();
	call	_drawUser
;src/game.c:252: user.moved = 0;
	ld	hl,#(_user + 0x0004)
	ld	(hl),#0x00
00102$:
;src/game.c:254: if (abort)
	ld	a,(#_abort + 0)
	or	a, a
	ret	NZ
;src/game.c:256: delay(20);
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x0014
	push	hl
	call	_delay
	pop	af
	pop	af
	jr	00106$
	.area _CODE
	.area _INITIALIZER
__xinit__tile_buffer_0:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__tile_buffer_1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.area _CABS (ABS)
