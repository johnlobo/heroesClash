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
	.globl _insertCard
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
	.globl _cpct_scanKeyboard_f
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
	.dw _hc_figures_1
	.dw _hc_figures_2
	.dw _hc_figures_3
;src/game.c:77: void initGame(){
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
;src/game.c:96: void drawScreen(){
;	---------------------------------
; Function drawScreen
; ---------------------------------
_drawScreen::
;src/game.c:99: for (j=0;j<TABLE_HEIGHT;j++){
	ld	c,#0x00
00106$:
;src/game.c:100: for (i=0;i<TABLE_WIDTH;i++){
	ld	b,#0x08
00105$:
	ld	e,b
	dec	e
	ld	a,e
	ld	b,a
	or	a, a
	jr	NZ,00105$
;src/game.c:99: for (j=0;j<TABLE_HEIGHT;j++){
	inc	c
	ld	a,c
	sub	a, #0x06
	jr	C,00106$
	ret
;src/game.c:105: void insertCard(){
;	---------------------------------
; Function insertCard
; ---------------------------------
_insertCard::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-7
	add	hl,sp
	ld	sp,hl
;src/game.c:108: u8 stopped = 0;
	ld	c,#0x00
;src/game.c:111: row = 5;
	ld	e,#0x05
;src/game.c:112: col = user.x;
	ld	a,(#_user+0)
	ld	-6 (ix),a
;src/game.c:113: card = (cpct_rand() / 85) + 1;
	push	bc
	push	de
	call	_cpct_getRandom_mxor_u8
	ld	b,l
	pop	de
	ld	a,b
	pop	bc
	ld	b,a
	push	bc
	push	de
	ld	a,#0x55
	push	af
	inc	sp
	push	bc
	inc	sp
	call	__divuchar
	pop	af
	pop	de
	pop	bc
	ld	a,l
	inc	a
	ld	-7 (ix),a
;src/game.c:115: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X+(col*TILE_W), USER_TABLE_Y+(row*TILE_H));
	push	de
	ld	a,-6 (ix)
	ld	e,a
	add	a, a
	add	a, a
	add	a, e
	pop	de
	add	a, #0x02
	ld	-1 (ix),a
	push	bc
	push	de
	ld	a,#0x8E
	push	af
	inc	sp
	ld	a,-1 (ix)
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
	pop	bc
	ld	b,l
	ld	d,h
;src/game.c:116: cpc_GetSp((u8*) tile_buffer_1, 10, 10, (int) pvmem);
	ld	-3 (ix),b
	ld	-2 (ix),d
	push	bc
	push	de
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	push	hl
	ld	hl,#0x0A0A
	push	hl
	ld	hl,#_tile_buffer_1
	push	hl
	call	_cpc_GetSp
	pop	de
	pop	bc
;src/game.c:117: cpct_drawSpriteMaskedAlignedTable(cards[card], pvmem, TILE_W, TILE_H, hc_tablatrans);
	ld	l,-7 (ix)
	ld	h,#0x00
	add	hl, hl
	ld	a,#<(_cards)
	add	a, l
	ld	-3 (ix),a
	ld	a,#>(_cards)
	adc	a, h
	ld	-2 (ix),a
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	push	hl
	pop	iy
	push	bc
	push	de
	ld	hl,#_hc_tablatrans
	push	hl
	ld	hl,#0x0A05
	push	hl
	ld	e,b
	push	de
	push	iy
	call	_cpct_drawSpriteMaskedAlignedTable
	pop	de
	pop	bc
;src/game.c:119: while (!stopped){
	push	de
	ld	e,-6 (ix)
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	pop	de
	ld	a,#<(_userTable)
	add	a, l
	ld	-5 (ix),a
	ld	a,#>(_userTable)
	adc	a, h
	ld	-4 (ix),a
00107$:
	ld	a,c
	or	a, a
	jp	NZ,00109$
;src/game.c:120: delay(10);
	push	bc
	push	de
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x000A
	push	hl
	call	_delay
	pop	af
	pop	af
	pop	de
	pop	bc
;src/game.c:121: if ((row>0) && (userTable[col][row-1]==0)){
	ld	a,e
	or	a, a
	jp	Z,00104$
	ld	b,e
	dec	b
	ld	a,-5 (ix)
	add	a, b
	ld	l,a
	ld	a,-4 (ix)
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
	or	a, a
	jp	NZ,00104$
;src/game.c:122: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X+(col*TILE_W), USER_TABLE_Y+(row*TILE_H));
	ld	a,e
	add	a, a
	add	a, a
	add	a, e
	add	a, a
	add	a, #0x5C
	ld	d,a
	push	bc
	push	de
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
;src/game.c:124: row--;
	ld	e,b
;src/game.c:125: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X+(col*TILE_W), USER_TABLE_Y+(row*TILE_H));
	push	de
	ld	a,e
	add	a, a
	add	a, a
	add	a, e
	add	a, a
	pop	de
	add	a, #0x5C
	ld	b,a
	push	bc
	push	de
	push	bc
	inc	sp
	ld	a,-1 (ix)
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
	pop	bc
;src/game.c:126: cpc_GetSp((u8*) tile_buffer_1, 10, 10, (int) pvmem);
	ld	b,l
	ld	d,h
	push	bc
	push	de
	push	hl
	ld	hl,#0x0A0A
	push	hl
	ld	hl,#_tile_buffer_1
	push	hl
	call	_cpc_GetSp
	pop	de
	pop	bc
;src/game.c:127: cpct_drawSpriteMaskedAlignedTable(cards[card], pvmem, TILE_W, TILE_H, hc_tablatrans);
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	push	hl
	pop	iy
	push	bc
	push	de
	ld	hl,#_hc_tablatrans
	push	hl
	ld	hl,#0x0A05
	push	hl
	ld	e,b
	push	de
	push	iy
	call	_cpct_drawSpriteMaskedAlignedTable
	pop	de
	pop	bc
;src/game.c:128: if (row == 0)
	ld	a,e
	or	a, a
	jp	NZ,00107$
;src/game.c:129: stopped = 1;
	ld	c,#0x01
	jp	00107$
00104$:
;src/game.c:131: stopped = 1;
	ld	c,#0x01
	jp	00107$
00109$:
;src/game.c:134: userTable[col][row]= card;
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	d,#0x00
	add	hl, de
	ld	a,-7 (ix)
	ld	(hl),a
	ld	sp, ix
	pop	ix
	ret
;src/game.c:137: void drawUser(){
;	---------------------------------
; Function drawUser
; ---------------------------------
_drawUser::
;src/game.c:144: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X+(user.px*TILE_W), USER_TABLE_Y+(user.py*TILE_H));
	ld	a, (#(_user + 0x0003) + 0)
	ld	c,a
	add	a, a
	add	a, a
	add	a, c
	add	a, a
	add	a, #0x5C
	ld	d,a
	ld	a, (#(_user + 0x0002) + 0)
	ld	c,a
	add	a, a
	add	a, a
	add	a, c
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
;src/game.c:145: cpct_drawSprite(tile_buffer_0, pvmem, HC_MARKER_W, HC_MARKER_H);
	ld	hl,#0x0A05
	push	hl
	push	bc
	ld	hl,#_tile_buffer_0
	push	hl
	call	_cpct_drawSprite
;src/game.c:146: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X+(user.x*TILE_W), USER_TABLE_Y+(user.y*TILE_H));
	ld	a, (#(_user + 0x0001) + 0)
	ld	c,a
	add	a, a
	add	a, a
	add	a, c
	add	a, a
	add	a, #0x5C
	ld	d,a
	ld	a, (#_user + 0)
	ld	c,a
	add	a, a
	add	a, a
	add	a, c
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
;src/game.c:147: cpc_GetSp((u8*) tile_buffer_0, 10, 10, (int) pvmem);
	ld	e, c
	ld	d, b
	push	bc
	push	de
	ld	hl,#0x0A0A
	push	hl
	ld	hl,#_tile_buffer_0
	push	hl
	call	_cpc_GetSp
	pop	bc
;src/game.c:148: cpct_drawSpriteMaskedAlignedTable(hc_marker, pvmem, HC_MARKER_W, HC_MARKER_H, hc_tablatrans);
	ld	de,#_hc_tablatrans+0
	push	de
	ld	hl,#0x0A05
	push	hl
	push	bc
	ld	hl,#_hc_marker
	push	hl
	call	_cpct_drawSpriteMaskedAlignedTable
;src/game.c:151: user.px = user.x;
	ld	a, (#_user + 0)
	ld	(#(_user + 0x0002)),a
;src/game.c:152: user.py = user.y;
	ld	a, (#(_user + 0x0001) + 0)
	ld	(#(_user + 0x0003)),a
	ret
;src/game.c:155: void checkUserMovement(){
;	---------------------------------
; Function checkUserMovement
; ---------------------------------
_checkUserMovement::
;src/game.c:156: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/game.c:158: if ((user.x<(TABLE_WIDTH-1)) && (cpct_isKeyPressed(keys.right))) {
	ld	a,(#_user + 0)
	sub	a, #0x07
	jr	NC,00105$
	ld	hl, (#(_keys + 0x0006) + 0)
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00105$
;src/game.c:159: user.px = user.x;
	ld	bc,#_user+0
	ld	a,(bc)
	ld	(#(_user + 0x0002)),a
;src/game.c:160: user.x++;
	ld	a,(bc)
	inc	a
	ld	(bc),a
;src/game.c:161: user.moved = 1;
	ld	hl,#(_user + 0x0004)
	ld	(hl),#0x01
	jr	00106$
00105$:
;src/game.c:162: } else if ((user.x>0) && (cpct_isKeyPressed(keys.left))) {
	ld	a, (#_user + 0)
	or	a, a
	jr	Z,00106$
	ld	hl, (#(_keys + 0x0004) + 0)
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00106$
;src/game.c:163: user.px = user.x;
	ld	bc,#_user+0
	ld	a,(bc)
	ld	(#(_user + 0x0002)),a
;src/game.c:164: user.x--;
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
;src/game.c:165: user.moved = 1;
	ld	hl,#(_user + 0x0004)
	ld	(hl),#0x01
00106$:
;src/game.c:168: if ((user.y<(TABLE_HEIGHT-1)) && (cpct_isKeyPressed(keys.down))) {
	ld	bc,#_user + 1
	ld	a,(bc)
;src/game.c:169: user.py = user.y;
;src/game.c:171: user.moved = 1;
;src/game.c:168: if ((user.y<(TABLE_HEIGHT-1)) && (cpct_isKeyPressed(keys.down))) {
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
;src/game.c:169: user.py = user.y;
	ld	hl,#(_user + 0x0003)
	ld	(hl),e
;src/game.c:170: user.y++;
	ld	a,(bc)
	inc	a
	ld	(bc),a
;src/game.c:171: user.moved = 1;
	ld	hl,#(_user + 0x0004)
	ld	(hl),#0x01
	jr	00113$
00112$:
;src/game.c:172: } else if ((user.y>0) && (cpct_isKeyPressed(keys.up))) {
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
;src/game.c:173: user.py = user.y;
	ld	a,(bc)
	ld	(#(_user + 0x0003)),a
;src/game.c:174: user.y--;
	ld	a,(bc)
	add	a,#0xFF
	ld	(bc),a
;src/game.c:175: user.moved = 1;
	ld	hl,#(_user + 0x0004)
	ld	(hl),#0x01
00113$:
;src/game.c:177: if ((userTable[user.x][user.y]==0) && (cpct_isKeyPressed(keys.fire))){
	ld	a, (#_user + 0)
	ld	e,a
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	ex	de,hl
	ld	hl,#_userTable
	add	hl,de
	ex	de,hl
	ld	a,(bc)
	ld	c,a
	ld	l,c
	ld	h,#0x00
	add	hl,de
	ld	a,(hl)
	or	a, a
	jr	NZ,00116$
	ld	hl, (#(_keys + 0x0008) + 0)
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00116$
;src/game.c:178: insertCard();
	call	_insertCard
00116$:
;src/game.c:181: if (cpct_isKeyPressed(keys.abort)){
	ld	hl, (#(_keys + 0x000c) + 0)
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	ret	Z
;src/game.c:183: reset_cpc();
	jp  _reset_cpc
;src/game.c:187: void game(){
;	---------------------------------
; Function game
; ---------------------------------
_game::
;src/game.c:188: initGame();
	call	_initGame
;src/game.c:189: drawScreen();
	call	_drawScreen
;src/game.c:190: drawUser();
	call	_drawUser
;src/game.c:191: while (1){
00106$:
;src/game.c:192: checkUserMovement();
	call	_checkUserMovement
;src/game.c:193: if (user.moved){
	ld	a, (#(_user + 0x0004) + 0)
	or	a, a
	jr	Z,00102$
;src/game.c:194: drawUser();
	call	_drawUser
;src/game.c:195: user.moved = 0;
	ld	hl,#(_user + 0x0004)
	ld	(hl),#0x00
00102$:
;src/game.c:197: if (abort)
	ld	a,(#_abort + 0)
	or	a, a
	ret	NZ
;src/game.c:199: delay(20);
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
