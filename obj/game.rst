                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.5 #9498 (Mac OS X x86_64)
                              4 ;--------------------------------------------------------
                              5 	.module game
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _checkUserMovement
                             12 	.globl _userTakeCard
                             13 	.globl _drawUser
                             14 	.globl _newHand
                             15 	.globl _insertCardEnemy
                             16 	.globl _insertCardUser
                             17 	.globl _drawScreen
                             18 	.globl _initGame
                             19 	.globl _delay
                             20 	.globl _cpc_GetSp
                             21 	.globl _reset_cpc
                             22 	.globl _cpct_getRandom_mxor_u8
                             23 	.globl _cpct_getScreenPtr
                             24 	.globl _cpct_setBlendMode
                             25 	.globl _cpct_drawSpriteMaskedAlignedTable
                             26 	.globl _cpct_drawSpriteBlended
                             27 	.globl _cpct_drawSprite
                             28 	.globl _cpct_isKeyPressed
                             29 	.globl _tile_buffer_1
                             30 	.globl _tile_buffer_0
                             31 	.globl _abort
                             32 	.globl _user
                             33 	.globl _keys
                             34 	.globl _enemyTable
                             35 	.globl _userTable
                             36 	.globl _enemyY
                             37 	.globl _enemyX
                             38 	.globl _cards
                             39 	.globl _game
                             40 ;--------------------------------------------------------
                             41 ; special function registers
                             42 ;--------------------------------------------------------
                             43 ;--------------------------------------------------------
                             44 ; ram data
                             45 ;--------------------------------------------------------
                             46 	.area _DATA
   60F0                      47 _enemyX::
   60F0                      48 	.ds 1
   60F1                      49 _enemyY::
   60F1                      50 	.ds 1
   60F2                      51 _userTable::
   60F2                      52 	.ds 48
   6122                      53 _enemyTable::
   6122                      54 	.ds 48
   6152                      55 _keys::
   6152                      56 	.ds 14
   6160                      57 _user::
   6160                      58 	.ds 8
   6168                      59 _abort::
   6168                      60 	.ds 1
                             61 ;--------------------------------------------------------
                             62 ; ram data
                             63 ;--------------------------------------------------------
                             64 	.area _INITIALIZED
   616A                      65 _tile_buffer_0::
   616A                      66 	.ds 50
   619C                      67 _tile_buffer_1::
   619C                      68 	.ds 50
                             69 ;--------------------------------------------------------
                             70 ; absolute external ram data
                             71 ;--------------------------------------------------------
                             72 	.area _DABS (ABS)
                             73 ;--------------------------------------------------------
                             74 ; global & static initialisations
                             75 ;--------------------------------------------------------
                             76 	.area _HOME
                             77 	.area _GSINIT
                             78 	.area _GSFINAL
                             79 	.area _GSINIT
                             80 ;--------------------------------------------------------
                             81 ; Home
                             82 ;--------------------------------------------------------
                             83 	.area _HOME
                             84 	.area _HOME
                             85 ;--------------------------------------------------------
                             86 ; code
                             87 ;--------------------------------------------------------
                             88 	.area _CODE
                             89 ;src/game.c:56: cpctm_createTransparentMaskTable(hc_tablatrans, 0x100, M0, 0);
                             90 ;	---------------------------------
                             91 ; Function dummy_cpct_transparentMaskTable0M0_container
                             92 ; ---------------------------------
   4224                      93 _dummy_cpct_transparentMaskTable0M0_container::
                             94 	.area _hc_tablatrans_ (ABS) 
   0100                      95 	.org 0x100 
   0100                      96 	 _hc_tablatrans::
   0100 FF AA 55 00 AA AA    97 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0108 55 00 55 00 00 00    98 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0110 AA AA 00 00 AA AA    99 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0118 00 00 00 00 00 00   100 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0120 55 00 55 00 00 00   101 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0128 55 00 55 00 00 00   102 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0130 00 00 00 00 00 00   103 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0138 00 00 00 00 00 00   104 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0140 AA AA 00 00 AA AA   105 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0148 00 00 00 00 00 00   106 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0150 AA AA 00 00 AA AA   107 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0158 00 00 00 00 00 00   108 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0160 00 00 00 00 00 00   109 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0168 00 00 00 00 00 00   110 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0170 00 00 00 00 00 00   111 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0178 00 00 00 00 00 00   112 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0180 55 00 55 00 00 00   113 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0188 55 00 55 00 00 00   114 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0190 00 00 00 00 00 00   115 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0198 00 00 00 00 00 00   116 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A0 55 00 55 00 00 00   117 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A8 55 00 55 00 00 00   118 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B0 00 00 00 00 00 00   119 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B8 00 00 00 00 00 00   120 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C0 00 00 00 00 00 00   121 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C8 00 00 00 00 00 00   122 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D0 00 00 00 00 00 00   123 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D8 00 00 00 00 00 00   124 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E0 00 00 00 00 00 00   125 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E8 00 00 00 00 00 00   126 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F0 00 00 00 00 00 00   127 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F8 00 00 00 00 00 00   128 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            129 	.area _CSEG (REL, CON) 
                            130 ;src/game.c:67: void delay(u32 cycles) {
                            131 ;	---------------------------------
                            132 ; Function delay
                            133 ; ---------------------------------
   6232                     134 _delay::
                            135 ;src/game.c:69: for (i = 0; i < cycles; i++) {
   6232 01 00 00      [10]  136 	ld	bc,#0x0000
   6235 11 00 00      [10]  137 	ld	de,#0x0000
   6238                     138 00103$:
   6238 21 02 00      [10]  139 	ld	hl,#2
   623B 39            [11]  140 	add	hl,sp
   623C 79            [ 4]  141 	ld	a,c
   623D 96            [ 7]  142 	sub	a, (hl)
   623E 78            [ 4]  143 	ld	a,b
   623F 23            [ 6]  144 	inc	hl
   6240 9E            [ 7]  145 	sbc	a, (hl)
   6241 7B            [ 4]  146 	ld	a,e
   6242 23            [ 6]  147 	inc	hl
   6243 9E            [ 7]  148 	sbc	a, (hl)
   6244 7A            [ 4]  149 	ld	a,d
   6245 23            [ 6]  150 	inc	hl
   6246 9E            [ 7]  151 	sbc	a, (hl)
   6247 D0            [11]  152 	ret	NC
                            153 ;src/game.c:72: __endasm;
   6248 76            [ 4]  154 	halt
                            155 ;src/game.c:69: for (i = 0; i < cycles; i++) {
   6249 0C            [ 4]  156 	inc	c
   624A 20 EC         [12]  157 	jr	NZ,00103$
   624C 04            [ 4]  158 	inc	b
   624D 20 E9         [12]  159 	jr	NZ,00103$
   624F 1C            [ 4]  160 	inc	e
   6250 20 E6         [12]  161 	jr	NZ,00103$
   6252 14            [ 4]  162 	inc	d
   6253 18 E3         [12]  163 	jr	00103$
   6255                     164 _cards:
   6255 FA 40               165 	.dw _hc_figures_0
   6257 FA 40               166 	.dw _hc_figures_0
   6259 2C 41               167 	.dw _hc_figures_1
   625B 5E 41               168 	.dw _hc_figures_2
   625D 90 41               169 	.dw _hc_figures_3
                            170 ;src/game.c:77: void initGame() {
                            171 ;	---------------------------------
                            172 ; Function initGame
                            173 ; ---------------------------------
   625F                     174 _initGame::
                            175 ;src/game.c:78: abort = 0;
   625F 21 68 61      [10]  176 	ld	hl,#_abort + 0
   6262 36 00         [10]  177 	ld	(hl), #0x00
                            178 ;src/game.c:80: user.x = 0;
   6264 21 60 61      [10]  179 	ld	hl,#_user
   6267 36 00         [10]  180 	ld	(hl),#0x00
                            181 ;src/game.c:81: user.y = 0;
   6269 21 61 61      [10]  182 	ld	hl,#(_user + 0x0001)
   626C 36 00         [10]  183 	ld	(hl),#0x00
                            184 ;src/game.c:82: user.px = 0;
   626E 21 62 61      [10]  185 	ld	hl,#(_user + 0x0002)
   6271 36 00         [10]  186 	ld	(hl),#0x00
                            187 ;src/game.c:83: user.py = 0;
   6273 21 63 61      [10]  188 	ld	hl,#(_user + 0x0003)
   6276 36 00         [10]  189 	ld	(hl),#0x00
                            190 ;src/game.c:84: user.cardTaken = 0;
   6278 21 65 61      [10]  191 	ld	hl,#(_user + 0x0005)
   627B 36 00         [10]  192 	ld	(hl),#0x00
                            193 ;src/game.c:85: user.moved = 0;
   627D 21 64 61      [10]  194 	ld	hl,#(_user + 0x0004)
   6280 36 00         [10]  195 	ld	(hl),#0x00
                            196 ;src/game.c:86: user.buffer = tile_buffer_0;
   6282 21 6A 61      [10]  197 	ld	hl,#_tile_buffer_0
   6285 22 66 61      [16]  198 	ld	((_user + 0x0006)), hl
                            199 ;src/game.c:88: keys.up    = Key_CursorUp;
   6288 21 00 01      [10]  200 	ld	hl,#0x0100
   628B 22 52 61      [16]  201 	ld	(_keys), hl
                            202 ;src/game.c:89: keys.down  = Key_CursorDown;
   628E 26 04         [ 7]  203 	ld	h, #0x04
   6290 22 54 61      [16]  204 	ld	((_keys + 0x0002)), hl
                            205 ;src/game.c:90: keys.left  = Key_CursorLeft;
   6293 21 01 01      [10]  206 	ld	hl,#0x0101
   6296 22 56 61      [16]  207 	ld	((_keys + 0x0004)), hl
                            208 ;src/game.c:91: keys.right = Key_CursorRight;
   6299 21 00 02      [10]  209 	ld	hl,#0x0200
   629C 22 58 61      [16]  210 	ld	((_keys + 0x0006)), hl
                            211 ;src/game.c:92: keys.fire  = Key_Space;
   629F 21 05 80      [10]  212 	ld	hl,#0x8005
   62A2 22 5A 61      [16]  213 	ld	((_keys + 0x0008)), hl
                            214 ;src/game.c:93: keys.pause = Key_Del;
   62A5 2E 09         [ 7]  215 	ld	l, #0x09
   62A7 22 5C 61      [16]  216 	ld	((_keys + 0x000a)), hl
                            217 ;src/game.c:94: keys.abort = Key_Esc;
   62AA 21 08 04      [10]  218 	ld	hl,#0x0408
   62AD 22 5E 61      [16]  219 	ld	((_keys + 0x000c)), hl
                            220 ;src/game.c:96: cpct_setBlendMode(CPCT_BLEND_XOR);
   62B0 2E AE         [ 7]  221 	ld	l,#0xAE
   62B2 C3 3A 55      [10]  222 	jp  _cpct_setBlendMode
                            223 ;src/game.c:99: void drawScreen() {
                            224 ;	---------------------------------
                            225 ; Function drawScreen
                            226 ; ---------------------------------
   62B5                     227 _drawScreen::
                            228 ;src/game.c:102: for (j = 0; j < TABLE_HEIGHT; j++) {
   62B5 0E 00         [ 7]  229 	ld	c,#0x00
   62B7                     230 00106$:
                            231 ;src/game.c:103: for (i = 0; i < TABLE_WIDTH; i++) {
   62B7 06 08         [ 7]  232 	ld	b,#0x08
   62B9                     233 00105$:
   62B9 58            [ 4]  234 	ld	e,b
   62BA 1D            [ 4]  235 	dec	e
   62BB 7B            [ 4]  236 	ld	a,e
   62BC 47            [ 4]  237 	ld	b,a
   62BD B7            [ 4]  238 	or	a, a
   62BE 20 F9         [12]  239 	jr	NZ,00105$
                            240 ;src/game.c:102: for (j = 0; j < TABLE_HEIGHT; j++) {
   62C0 0C            [ 4]  241 	inc	c
   62C1 79            [ 4]  242 	ld	a,c
   62C2 D6 06         [ 7]  243 	sub	a, #0x06
   62C4 38 F1         [12]  244 	jr	C,00106$
   62C6 C9            [10]  245 	ret
                            246 ;src/game.c:108: void insertCardUser(u8 col) {
                            247 ;	---------------------------------
                            248 ; Function insertCardUser
                            249 ; ---------------------------------
   62C7                     250 _insertCardUser::
   62C7 DD E5         [15]  251 	push	ix
   62C9 DD 21 00 00   [14]  252 	ld	ix,#0
   62CD DD 39         [15]  253 	add	ix,sp
   62CF 21 FA FF      [10]  254 	ld	hl,#-6
   62D2 39            [11]  255 	add	hl,sp
   62D3 F9            [ 6]  256 	ld	sp,hl
                            257 ;src/game.c:111: u8 stopped = 0;
   62D4 0E 00         [ 7]  258 	ld	c,#0x00
                            259 ;src/game.c:114: row = 5;
   62D6 1E 05         [ 7]  260 	ld	e,#0x05
                            261 ;src/game.c:115: card = (cpct_rand() / 64) + 1;
   62D8 C5            [11]  262 	push	bc
   62D9 D5            [11]  263 	push	de
   62DA CD 40 55      [17]  264 	call	_cpct_getRandom_mxor_u8
   62DD D1            [10]  265 	pop	de
   62DE C1            [10]  266 	pop	bc
   62DF 7D            [ 4]  267 	ld	a,l
   62E0 07            [ 4]  268 	rlca
   62E1 07            [ 4]  269 	rlca
   62E2 E6 03         [ 7]  270 	and	a,#0x03
   62E4 3C            [ 4]  271 	inc	a
   62E5 DD 77 FA      [19]  272 	ld	-6 (ix),a
                            273 ;src/game.c:117: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X + (col * (TILE_W + 2)), USER_TABLE_Y + (row * (TILE_H + 3)));
   62E8 D5            [11]  274 	push	de
   62E9 DD 7E 04      [19]  275 	ld	a,4 (ix)
   62EC 5F            [ 4]  276 	ld	e,a
   62ED 87            [ 4]  277 	add	a, a
   62EE 83            [ 4]  278 	add	a, e
   62EF 87            [ 4]  279 	add	a, a
   62F0 83            [ 4]  280 	add	a, e
   62F1 D1            [10]  281 	pop	de
   62F2 C6 02         [ 7]  282 	add	a, #0x02
   62F4 DD 77 FF      [19]  283 	ld	-1 (ix),a
   62F7 C5            [11]  284 	push	bc
   62F8 D5            [11]  285 	push	de
   62F9 3E AD         [ 7]  286 	ld	a,#0xAD
   62FB F5            [11]  287 	push	af
   62FC 33            [ 6]  288 	inc	sp
   62FD DD 7E FF      [19]  289 	ld	a,-1 (ix)
   6300 F5            [11]  290 	push	af
   6301 33            [ 6]  291 	inc	sp
   6302 21 00 C0      [10]  292 	ld	hl,#0xC000
   6305 E5            [11]  293 	push	hl
   6306 CD D0 5F      [17]  294 	call	_cpct_getScreenPtr
   6309 D1            [10]  295 	pop	de
   630A C1            [10]  296 	pop	bc
   630B 45            [ 4]  297 	ld	b,l
   630C 54            [ 4]  298 	ld	d,h
                            299 ;src/game.c:118: cpc_GetSp((u8*) tile_buffer_1, 10, 5, (int) pvmem);
   630D DD 70 FD      [19]  300 	ld	-3 (ix),b
   6310 DD 72 FE      [19]  301 	ld	-2 (ix),d
   6313 C5            [11]  302 	push	bc
   6314 D5            [11]  303 	push	de
   6315 DD 6E FD      [19]  304 	ld	l,-3 (ix)
   6318 DD 66 FE      [19]  305 	ld	h,-2 (ix)
   631B E5            [11]  306 	push	hl
   631C 21 0A 05      [10]  307 	ld	hl,#0x050A
   631F E5            [11]  308 	push	hl
   6320 21 9C 61      [10]  309 	ld	hl,#_tile_buffer_1
   6323 E5            [11]  310 	push	hl
   6324 CD 9A 53      [17]  311 	call	_cpc_GetSp
   6327 D1            [10]  312 	pop	de
   6328 C1            [10]  313 	pop	bc
                            314 ;src/game.c:119: cpct_drawSpriteMaskedAlignedTable(cards[card], pvmem, TILE_W, TILE_H, hc_tablatrans);
   6329 DD 6E FA      [19]  315 	ld	l,-6 (ix)
   632C 26 00         [ 7]  316 	ld	h,#0x00
   632E 29            [11]  317 	add	hl, hl
   632F 3E 55         [ 7]  318 	ld	a,#<(_cards)
   6331 85            [ 4]  319 	add	a, l
   6332 DD 77 FD      [19]  320 	ld	-3 (ix),a
   6335 3E 62         [ 7]  321 	ld	a,#>(_cards)
   6337 8C            [ 4]  322 	adc	a, h
   6338 DD 77 FE      [19]  323 	ld	-2 (ix),a
   633B DD 6E FD      [19]  324 	ld	l,-3 (ix)
   633E DD 66 FE      [19]  325 	ld	h,-2 (ix)
   6341 7E            [ 7]  326 	ld	a, (hl)
   6342 23            [ 6]  327 	inc	hl
   6343 66            [ 7]  328 	ld	h,(hl)
   6344 6F            [ 4]  329 	ld	l,a
   6345 E5            [11]  330 	push	hl
   6346 FD E1         [14]  331 	pop	iy
   6348 C5            [11]  332 	push	bc
   6349 D5            [11]  333 	push	de
   634A 21 00 01      [10]  334 	ld	hl,#_hc_tablatrans
   634D E5            [11]  335 	push	hl
   634E 21 05 0A      [10]  336 	ld	hl,#0x0A05
   6351 E5            [11]  337 	push	hl
   6352 58            [ 4]  338 	ld	e,b
   6353 D5            [11]  339 	push	de
   6354 FD E5         [15]  340 	push	iy
   6356 CD F0 5F      [17]  341 	call	_cpct_drawSpriteMaskedAlignedTable
   6359 D1            [10]  342 	pop	de
   635A C1            [10]  343 	pop	bc
                            344 ;src/game.c:121: while (!stopped) {
   635B D5            [11]  345 	push	de
   635C DD 5E 04      [19]  346 	ld	e,4 (ix)
   635F 16 00         [ 7]  347 	ld	d,#0x00
   6361 6B            [ 4]  348 	ld	l, e
   6362 62            [ 4]  349 	ld	h, d
   6363 29            [11]  350 	add	hl, hl
   6364 19            [11]  351 	add	hl, de
   6365 29            [11]  352 	add	hl, hl
   6366 D1            [10]  353 	pop	de
   6367 3E F2         [ 7]  354 	ld	a,#<(_userTable)
   6369 85            [ 4]  355 	add	a, l
   636A DD 77 FB      [19]  356 	ld	-5 (ix),a
   636D 3E 60         [ 7]  357 	ld	a,#>(_userTable)
   636F 8C            [ 4]  358 	adc	a, h
   6370 DD 77 FC      [19]  359 	ld	-4 (ix),a
   6373                     360 00107$:
   6373 79            [ 4]  361 	ld	a,c
   6374 B7            [ 4]  362 	or	a, a
   6375 C2 25 64      [10]  363 	jp	NZ,00109$
                            364 ;src/game.c:122: delay(10);
   6378 C5            [11]  365 	push	bc
   6379 D5            [11]  366 	push	de
   637A 21 00 00      [10]  367 	ld	hl,#0x0000
   637D E5            [11]  368 	push	hl
   637E 21 0A 00      [10]  369 	ld	hl,#0x000A
   6381 E5            [11]  370 	push	hl
   6382 CD 32 62      [17]  371 	call	_delay
   6385 F1            [10]  372 	pop	af
   6386 F1            [10]  373 	pop	af
   6387 D1            [10]  374 	pop	de
   6388 C1            [10]  375 	pop	bc
                            376 ;src/game.c:123: if ((row > 0) && (userTable[col][row - 1] == 0)) {
   6389 7B            [ 4]  377 	ld	a,e
   638A B7            [ 4]  378 	or	a, a
   638B CA 20 64      [10]  379 	jp	Z,00104$
   638E 43            [ 4]  380 	ld	b,e
   638F 05            [ 4]  381 	dec	b
   6390 DD 7E FB      [19]  382 	ld	a,-5 (ix)
   6393 80            [ 4]  383 	add	a, b
   6394 6F            [ 4]  384 	ld	l,a
   6395 DD 7E FC      [19]  385 	ld	a,-4 (ix)
   6398 CE 00         [ 7]  386 	adc	a, #0x00
   639A 67            [ 4]  387 	ld	h,a
   639B 7E            [ 7]  388 	ld	a,(hl)
   639C B7            [ 4]  389 	or	a, a
   639D C2 20 64      [10]  390 	jp	NZ,00104$
                            391 ;src/game.c:124: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X + (col * (TILE_W + 2)), USER_TABLE_Y + (row * (TILE_H + 3)));
   63A0 7B            [ 4]  392 	ld	a,e
   63A1 87            [ 4]  393 	add	a, a
   63A2 83            [ 4]  394 	add	a, e
   63A3 87            [ 4]  395 	add	a, a
   63A4 87            [ 4]  396 	add	a, a
   63A5 83            [ 4]  397 	add	a, e
   63A6 C6 6C         [ 7]  398 	add	a, #0x6C
   63A8 57            [ 4]  399 	ld	d,a
   63A9 C5            [11]  400 	push	bc
   63AA D5            [11]  401 	push	de
   63AB 33            [ 6]  402 	inc	sp
   63AC DD 7E FF      [19]  403 	ld	a,-1 (ix)
   63AF F5            [11]  404 	push	af
   63B0 33            [ 6]  405 	inc	sp
   63B1 21 00 C0      [10]  406 	ld	hl,#0xC000
   63B4 E5            [11]  407 	push	hl
   63B5 CD D0 5F      [17]  408 	call	_cpct_getScreenPtr
   63B8 EB            [ 4]  409 	ex	de,hl
   63B9 21 05 0A      [10]  410 	ld	hl,#0x0A05
   63BC E5            [11]  411 	push	hl
   63BD D5            [11]  412 	push	de
   63BE 21 9C 61      [10]  413 	ld	hl,#_tile_buffer_1
   63C1 E5            [11]  414 	push	hl
   63C2 CD 6A 54      [17]  415 	call	_cpct_drawSprite
   63C5 C1            [10]  416 	pop	bc
                            417 ;src/game.c:126: row--;
   63C6 58            [ 4]  418 	ld	e,b
                            419 ;src/game.c:127: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X + (col * (TILE_W + 2)), USER_TABLE_Y + (row * (TILE_H + 3)));
   63C7 D5            [11]  420 	push	de
   63C8 7B            [ 4]  421 	ld	a,e
   63C9 87            [ 4]  422 	add	a, a
   63CA 83            [ 4]  423 	add	a, e
   63CB 87            [ 4]  424 	add	a, a
   63CC 87            [ 4]  425 	add	a, a
   63CD 83            [ 4]  426 	add	a, e
   63CE D1            [10]  427 	pop	de
   63CF C6 6C         [ 7]  428 	add	a, #0x6C
   63D1 47            [ 4]  429 	ld	b,a
   63D2 C5            [11]  430 	push	bc
   63D3 D5            [11]  431 	push	de
   63D4 C5            [11]  432 	push	bc
   63D5 33            [ 6]  433 	inc	sp
   63D6 DD 7E FF      [19]  434 	ld	a,-1 (ix)
   63D9 F5            [11]  435 	push	af
   63DA 33            [ 6]  436 	inc	sp
   63DB 21 00 C0      [10]  437 	ld	hl,#0xC000
   63DE E5            [11]  438 	push	hl
   63DF CD D0 5F      [17]  439 	call	_cpct_getScreenPtr
   63E2 D1            [10]  440 	pop	de
   63E3 C1            [10]  441 	pop	bc
                            442 ;src/game.c:128: cpc_GetSp((u8*) tile_buffer_1, 10, 5, (int) pvmem);
   63E4 45            [ 4]  443 	ld	b,l
   63E5 54            [ 4]  444 	ld	d,h
   63E6 C5            [11]  445 	push	bc
   63E7 D5            [11]  446 	push	de
   63E8 E5            [11]  447 	push	hl
   63E9 21 0A 05      [10]  448 	ld	hl,#0x050A
   63EC E5            [11]  449 	push	hl
   63ED 21 9C 61      [10]  450 	ld	hl,#_tile_buffer_1
   63F0 E5            [11]  451 	push	hl
   63F1 CD 9A 53      [17]  452 	call	_cpc_GetSp
   63F4 D1            [10]  453 	pop	de
   63F5 C1            [10]  454 	pop	bc
                            455 ;src/game.c:129: cpct_drawSpriteMaskedAlignedTable(cards[card], pvmem, TILE_W, TILE_H, hc_tablatrans);
   63F6 DD 6E FD      [19]  456 	ld	l,-3 (ix)
   63F9 DD 66 FE      [19]  457 	ld	h,-2 (ix)
   63FC 7E            [ 7]  458 	ld	a, (hl)
   63FD 23            [ 6]  459 	inc	hl
   63FE 66            [ 7]  460 	ld	h,(hl)
   63FF 6F            [ 4]  461 	ld	l,a
   6400 E5            [11]  462 	push	hl
   6401 FD E1         [14]  463 	pop	iy
   6403 C5            [11]  464 	push	bc
   6404 D5            [11]  465 	push	de
   6405 21 00 01      [10]  466 	ld	hl,#_hc_tablatrans
   6408 E5            [11]  467 	push	hl
   6409 21 05 0A      [10]  468 	ld	hl,#0x0A05
   640C E5            [11]  469 	push	hl
   640D 58            [ 4]  470 	ld	e,b
   640E D5            [11]  471 	push	de
   640F FD E5         [15]  472 	push	iy
   6411 CD F0 5F      [17]  473 	call	_cpct_drawSpriteMaskedAlignedTable
   6414 D1            [10]  474 	pop	de
   6415 C1            [10]  475 	pop	bc
                            476 ;src/game.c:130: if (row == 0)
   6416 7B            [ 4]  477 	ld	a,e
   6417 B7            [ 4]  478 	or	a, a
   6418 C2 73 63      [10]  479 	jp	NZ,00107$
                            480 ;src/game.c:131: stopped = 1;
   641B 0E 01         [ 7]  481 	ld	c,#0x01
   641D C3 73 63      [10]  482 	jp	00107$
   6420                     483 00104$:
                            484 ;src/game.c:133: stopped = 1;
   6420 0E 01         [ 7]  485 	ld	c,#0x01
   6422 C3 73 63      [10]  486 	jp	00107$
   6425                     487 00109$:
                            488 ;src/game.c:136: userTable[col][row] = card;
   6425 DD 6E FB      [19]  489 	ld	l,-5 (ix)
   6428 DD 66 FC      [19]  490 	ld	h,-4 (ix)
   642B 16 00         [ 7]  491 	ld	d,#0x00
   642D 19            [11]  492 	add	hl, de
   642E DD 7E FA      [19]  493 	ld	a,-6 (ix)
   6431 77            [ 7]  494 	ld	(hl),a
   6432 DD F9         [10]  495 	ld	sp, ix
   6434 DD E1         [14]  496 	pop	ix
   6436 C9            [10]  497 	ret
                            498 ;src/game.c:139: void insertCardEnemy(u8 col) {
                            499 ;	---------------------------------
                            500 ; Function insertCardEnemy
                            501 ; ---------------------------------
   6437                     502 _insertCardEnemy::
   6437 DD E5         [15]  503 	push	ix
   6439 DD 21 00 00   [14]  504 	ld	ix,#0
   643D DD 39         [15]  505 	add	ix,sp
   643F 21 FA FF      [10]  506 	ld	hl,#-6
   6442 39            [11]  507 	add	hl,sp
   6443 F9            [ 6]  508 	ld	sp,hl
                            509 ;src/game.c:142: u8 stopped = 0;
   6444 0E 00         [ 7]  510 	ld	c,#0x00
                            511 ;src/game.c:145: row = 0;
   6446 1E 00         [ 7]  512 	ld	e,#0x00
                            513 ;src/game.c:146: card = (cpct_rand() / 64) + 1;
   6448 C5            [11]  514 	push	bc
   6449 D5            [11]  515 	push	de
   644A CD 40 55      [17]  516 	call	_cpct_getRandom_mxor_u8
   644D D1            [10]  517 	pop	de
   644E C1            [10]  518 	pop	bc
   644F 7D            [ 4]  519 	ld	a,l
   6450 07            [ 4]  520 	rlca
   6451 07            [ 4]  521 	rlca
   6452 E6 03         [ 7]  522 	and	a,#0x03
   6454 3C            [ 4]  523 	inc	a
   6455 DD 77 FA      [19]  524 	ld	-6 (ix),a
                            525 ;src/game.c:148: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, ENEMY_TABLE_X + (col * (TILE_W + 2)), ENEMY_TABLE_Y + (row * (TILE_H + 3)));
   6458 D5            [11]  526 	push	de
   6459 DD 7E 04      [19]  527 	ld	a,4 (ix)
   645C 5F            [ 4]  528 	ld	e,a
   645D 87            [ 4]  529 	add	a, a
   645E 83            [ 4]  530 	add	a, e
   645F 87            [ 4]  531 	add	a, a
   6460 83            [ 4]  532 	add	a, e
   6461 D1            [10]  533 	pop	de
   6462 C6 02         [ 7]  534 	add	a, #0x02
   6464 DD 77 FB      [19]  535 	ld	-5 (ix),a
   6467 C5            [11]  536 	push	bc
   6468 D5            [11]  537 	push	de
   6469 3E 14         [ 7]  538 	ld	a,#0x14
   646B F5            [11]  539 	push	af
   646C 33            [ 6]  540 	inc	sp
   646D DD 7E FB      [19]  541 	ld	a,-5 (ix)
   6470 F5            [11]  542 	push	af
   6471 33            [ 6]  543 	inc	sp
   6472 21 00 C0      [10]  544 	ld	hl,#0xC000
   6475 E5            [11]  545 	push	hl
   6476 CD D0 5F      [17]  546 	call	_cpct_getScreenPtr
   6479 D1            [10]  547 	pop	de
   647A C1            [10]  548 	pop	bc
   647B 45            [ 4]  549 	ld	b,l
   647C 54            [ 4]  550 	ld	d,h
                            551 ;src/game.c:149: cpc_GetSp((u8*) tile_buffer_1, 10, 5, (int) pvmem);
   647D DD 70 FE      [19]  552 	ld	-2 (ix),b
   6480 DD 72 FF      [19]  553 	ld	-1 (ix),d
   6483 C5            [11]  554 	push	bc
   6484 D5            [11]  555 	push	de
   6485 DD 6E FE      [19]  556 	ld	l,-2 (ix)
   6488 DD 66 FF      [19]  557 	ld	h,-1 (ix)
   648B E5            [11]  558 	push	hl
   648C 21 0A 05      [10]  559 	ld	hl,#0x050A
   648F E5            [11]  560 	push	hl
   6490 21 9C 61      [10]  561 	ld	hl,#_tile_buffer_1
   6493 E5            [11]  562 	push	hl
   6494 CD 9A 53      [17]  563 	call	_cpc_GetSp
   6497 D1            [10]  564 	pop	de
   6498 C1            [10]  565 	pop	bc
                            566 ;src/game.c:150: cpct_drawSpriteMaskedAlignedTable(cards[card], pvmem, TILE_W, TILE_H, hc_tablatrans);
   6499 DD 6E FA      [19]  567 	ld	l,-6 (ix)
   649C 26 00         [ 7]  568 	ld	h,#0x00
   649E 29            [11]  569 	add	hl, hl
   649F 3E 55         [ 7]  570 	ld	a,#<(_cards)
   64A1 85            [ 4]  571 	add	a, l
   64A2 DD 77 FE      [19]  572 	ld	-2 (ix),a
   64A5 3E 62         [ 7]  573 	ld	a,#>(_cards)
   64A7 8C            [ 4]  574 	adc	a, h
   64A8 DD 77 FF      [19]  575 	ld	-1 (ix),a
   64AB DD 6E FE      [19]  576 	ld	l,-2 (ix)
   64AE DD 66 FF      [19]  577 	ld	h,-1 (ix)
   64B1 7E            [ 7]  578 	ld	a, (hl)
   64B2 23            [ 6]  579 	inc	hl
   64B3 66            [ 7]  580 	ld	h,(hl)
   64B4 6F            [ 4]  581 	ld	l,a
   64B5 E5            [11]  582 	push	hl
   64B6 FD E1         [14]  583 	pop	iy
   64B8 C5            [11]  584 	push	bc
   64B9 D5            [11]  585 	push	de
   64BA 21 00 01      [10]  586 	ld	hl,#_hc_tablatrans
   64BD E5            [11]  587 	push	hl
   64BE 21 05 0A      [10]  588 	ld	hl,#0x0A05
   64C1 E5            [11]  589 	push	hl
   64C2 58            [ 4]  590 	ld	e,b
   64C3 D5            [11]  591 	push	de
   64C4 FD E5         [15]  592 	push	iy
   64C6 CD F0 5F      [17]  593 	call	_cpct_drawSpriteMaskedAlignedTable
   64C9 D1            [10]  594 	pop	de
   64CA C1            [10]  595 	pop	bc
                            596 ;src/game.c:152: while (!stopped) {
   64CB D5            [11]  597 	push	de
   64CC DD 5E 04      [19]  598 	ld	e,4 (ix)
   64CF 16 00         [ 7]  599 	ld	d,#0x00
   64D1 6B            [ 4]  600 	ld	l, e
   64D2 62            [ 4]  601 	ld	h, d
   64D3 29            [11]  602 	add	hl, hl
   64D4 19            [11]  603 	add	hl, de
   64D5 29            [11]  604 	add	hl, hl
   64D6 D1            [10]  605 	pop	de
   64D7 3E 22         [ 7]  606 	ld	a,#<(_enemyTable)
   64D9 85            [ 4]  607 	add	a, l
   64DA DD 77 FC      [19]  608 	ld	-4 (ix),a
   64DD 3E 61         [ 7]  609 	ld	a,#>(_enemyTable)
   64DF 8C            [ 4]  610 	adc	a, h
   64E0 DD 77 FD      [19]  611 	ld	-3 (ix),a
   64E3                     612 00107$:
   64E3 79            [ 4]  613 	ld	a,c
   64E4 B7            [ 4]  614 	or	a, a
   64E5 C2 97 65      [10]  615 	jp	NZ,00109$
                            616 ;src/game.c:153: delay(10);
   64E8 C5            [11]  617 	push	bc
   64E9 D5            [11]  618 	push	de
   64EA 21 00 00      [10]  619 	ld	hl,#0x0000
   64ED E5            [11]  620 	push	hl
   64EE 21 0A 00      [10]  621 	ld	hl,#0x000A
   64F1 E5            [11]  622 	push	hl
   64F2 CD 32 62      [17]  623 	call	_delay
   64F5 F1            [10]  624 	pop	af
   64F6 F1            [10]  625 	pop	af
   64F7 D1            [10]  626 	pop	de
   64F8 C1            [10]  627 	pop	bc
                            628 ;src/game.c:154: if ((row < 5) && (enemyTable[col][row + 1] == 0)) {
   64F9 7B            [ 4]  629 	ld	a,e
   64FA D6 05         [ 7]  630 	sub	a, #0x05
   64FC D2 92 65      [10]  631 	jp	NC,00104$
   64FF 43            [ 4]  632 	ld	b,e
   6500 04            [ 4]  633 	inc	b
   6501 DD 7E FC      [19]  634 	ld	a,-4 (ix)
   6504 80            [ 4]  635 	add	a, b
   6505 6F            [ 4]  636 	ld	l,a
   6506 DD 7E FD      [19]  637 	ld	a,-3 (ix)
   6509 CE 00         [ 7]  638 	adc	a, #0x00
   650B 67            [ 4]  639 	ld	h,a
   650C 7E            [ 7]  640 	ld	a,(hl)
   650D B7            [ 4]  641 	or	a, a
   650E C2 92 65      [10]  642 	jp	NZ,00104$
                            643 ;src/game.c:155: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, ENEMY_TABLE_X + (col * (TILE_W + 2)), ENEMY_TABLE_Y + (row * (TILE_H + 3)));
   6511 7B            [ 4]  644 	ld	a,e
   6512 87            [ 4]  645 	add	a, a
   6513 83            [ 4]  646 	add	a, e
   6514 87            [ 4]  647 	add	a, a
   6515 87            [ 4]  648 	add	a, a
   6516 83            [ 4]  649 	add	a, e
   6517 C6 14         [ 7]  650 	add	a, #0x14
   6519 57            [ 4]  651 	ld	d,a
   651A C5            [11]  652 	push	bc
   651B D5            [11]  653 	push	de
   651C 33            [ 6]  654 	inc	sp
   651D DD 7E FB      [19]  655 	ld	a,-5 (ix)
   6520 F5            [11]  656 	push	af
   6521 33            [ 6]  657 	inc	sp
   6522 21 00 C0      [10]  658 	ld	hl,#0xC000
   6525 E5            [11]  659 	push	hl
   6526 CD D0 5F      [17]  660 	call	_cpct_getScreenPtr
   6529 EB            [ 4]  661 	ex	de,hl
   652A 21 05 0A      [10]  662 	ld	hl,#0x0A05
   652D E5            [11]  663 	push	hl
   652E D5            [11]  664 	push	de
   652F 21 9C 61      [10]  665 	ld	hl,#_tile_buffer_1
   6532 E5            [11]  666 	push	hl
   6533 CD 6A 54      [17]  667 	call	_cpct_drawSprite
   6536 C1            [10]  668 	pop	bc
                            669 ;src/game.c:157: row++;
   6537 58            [ 4]  670 	ld	e,b
                            671 ;src/game.c:158: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, ENEMY_TABLE_X + (col * (TILE_W + 2)), ENEMY_TABLE_Y + (row * (TILE_H + 3)));
   6538 D5            [11]  672 	push	de
   6539 7B            [ 4]  673 	ld	a,e
   653A 87            [ 4]  674 	add	a, a
   653B 83            [ 4]  675 	add	a, e
   653C 87            [ 4]  676 	add	a, a
   653D 87            [ 4]  677 	add	a, a
   653E 83            [ 4]  678 	add	a, e
   653F D1            [10]  679 	pop	de
   6540 C6 14         [ 7]  680 	add	a, #0x14
   6542 47            [ 4]  681 	ld	b,a
   6543 C5            [11]  682 	push	bc
   6544 D5            [11]  683 	push	de
   6545 C5            [11]  684 	push	bc
   6546 33            [ 6]  685 	inc	sp
   6547 DD 7E FB      [19]  686 	ld	a,-5 (ix)
   654A F5            [11]  687 	push	af
   654B 33            [ 6]  688 	inc	sp
   654C 21 00 C0      [10]  689 	ld	hl,#0xC000
   654F E5            [11]  690 	push	hl
   6550 CD D0 5F      [17]  691 	call	_cpct_getScreenPtr
   6553 D1            [10]  692 	pop	de
   6554 C1            [10]  693 	pop	bc
                            694 ;src/game.c:159: cpc_GetSp((u8*) tile_buffer_1, 10, 5, (int) pvmem);
   6555 45            [ 4]  695 	ld	b,l
   6556 54            [ 4]  696 	ld	d,h
   6557 C5            [11]  697 	push	bc
   6558 D5            [11]  698 	push	de
   6559 E5            [11]  699 	push	hl
   655A 21 0A 05      [10]  700 	ld	hl,#0x050A
   655D E5            [11]  701 	push	hl
   655E 21 9C 61      [10]  702 	ld	hl,#_tile_buffer_1
   6561 E5            [11]  703 	push	hl
   6562 CD 9A 53      [17]  704 	call	_cpc_GetSp
   6565 D1            [10]  705 	pop	de
   6566 C1            [10]  706 	pop	bc
                            707 ;src/game.c:160: cpct_drawSpriteMaskedAlignedTable(cards[card], pvmem, TILE_W, TILE_H, hc_tablatrans);
   6567 DD 6E FE      [19]  708 	ld	l,-2 (ix)
   656A DD 66 FF      [19]  709 	ld	h,-1 (ix)
   656D 7E            [ 7]  710 	ld	a, (hl)
   656E 23            [ 6]  711 	inc	hl
   656F 66            [ 7]  712 	ld	h,(hl)
   6570 6F            [ 4]  713 	ld	l,a
   6571 E5            [11]  714 	push	hl
   6572 FD E1         [14]  715 	pop	iy
   6574 C5            [11]  716 	push	bc
   6575 D5            [11]  717 	push	de
   6576 21 00 01      [10]  718 	ld	hl,#_hc_tablatrans
   6579 E5            [11]  719 	push	hl
   657A 21 05 0A      [10]  720 	ld	hl,#0x0A05
   657D E5            [11]  721 	push	hl
   657E 58            [ 4]  722 	ld	e,b
   657F D5            [11]  723 	push	de
   6580 FD E5         [15]  724 	push	iy
   6582 CD F0 5F      [17]  725 	call	_cpct_drawSpriteMaskedAlignedTable
   6585 D1            [10]  726 	pop	de
   6586 C1            [10]  727 	pop	bc
                            728 ;src/game.c:161: if (row == 5)
   6587 7B            [ 4]  729 	ld	a,e
   6588 D6 05         [ 7]  730 	sub	a, #0x05
   658A C2 E3 64      [10]  731 	jp	NZ,00107$
                            732 ;src/game.c:162: stopped = 1;
   658D 0E 01         [ 7]  733 	ld	c,#0x01
   658F C3 E3 64      [10]  734 	jp	00107$
   6592                     735 00104$:
                            736 ;src/game.c:164: stopped = 1;
   6592 0E 01         [ 7]  737 	ld	c,#0x01
   6594 C3 E3 64      [10]  738 	jp	00107$
   6597                     739 00109$:
                            740 ;src/game.c:167: enemyTable[col][row] = card;
   6597 DD 6E FC      [19]  741 	ld	l,-4 (ix)
   659A DD 66 FD      [19]  742 	ld	h,-3 (ix)
   659D 16 00         [ 7]  743 	ld	d,#0x00
   659F 19            [11]  744 	add	hl, de
   65A0 DD 7E FA      [19]  745 	ld	a,-6 (ix)
   65A3 77            [ 7]  746 	ld	(hl),a
   65A4 DD F9         [10]  747 	ld	sp, ix
   65A6 DD E1         [14]  748 	pop	ix
   65A8 C9            [10]  749 	ret
                            750 ;src/game.c:170: void newHand(u8 side) {
                            751 ;	---------------------------------
                            752 ; Function newHand
                            753 ; ---------------------------------
   65A9                     754 _newHand::
   65A9 DD E5         [15]  755 	push	ix
   65AB DD 21 00 00   [14]  756 	ld	ix,#0
   65AF DD 39         [15]  757 	add	ix,sp
   65B1 3B            [ 6]  758 	dec	sp
                            759 ;src/game.c:174: for (i = 0; i < 8; i++) {
   65B2 DD 36 FF 00   [19]  760 	ld	-1 (ix),#0x00
   65B6                     761 00111$:
                            762 ;src/game.c:175: if (side) {
   65B6 DD 7E 04      [19]  763 	ld	a,4 (ix)
   65B9 B7            [ 4]  764 	or	a, a
   65BA 28 32         [12]  765 	jr	Z,00108$
                            766 ;src/game.c:176: col = (cpct_rand() / 32);
   65BC CD 40 55      [17]  767 	call	_cpct_getRandom_mxor_u8
   65BF 7D            [ 4]  768 	ld	a,l
   65C0 07            [ 4]  769 	rlca
   65C1 07            [ 4]  770 	rlca
   65C2 07            [ 4]  771 	rlca
   65C3 E6 07         [ 7]  772 	and	a,#0x07
   65C5 4F            [ 4]  773 	ld	c,a
                            774 ;src/game.c:177: while (userTable[col][5] != 0) {
   65C6                     775 00101$:
   65C6 06 00         [ 7]  776 	ld	b,#0x00
   65C8 69            [ 4]  777 	ld	l, c
   65C9 60            [ 4]  778 	ld	h, b
   65CA 29            [11]  779 	add	hl, hl
   65CB 09            [11]  780 	add	hl, bc
   65CC 29            [11]  781 	add	hl, hl
   65CD 11 F2 60      [10]  782 	ld	de,#_userTable
   65D0 19            [11]  783 	add	hl,de
   65D1 11 05 00      [10]  784 	ld	de, #0x0005
   65D4 19            [11]  785 	add	hl, de
   65D5 7E            [ 7]  786 	ld	a,(hl)
   65D6 B7            [ 4]  787 	or	a, a
   65D7 28 0C         [12]  788 	jr	Z,00103$
                            789 ;src/game.c:178: col = (cpct_rand() / 32);
   65D9 CD 40 55      [17]  790 	call	_cpct_getRandom_mxor_u8
   65DC 7D            [ 4]  791 	ld	a,l
   65DD 07            [ 4]  792 	rlca
   65DE 07            [ 4]  793 	rlca
   65DF 07            [ 4]  794 	rlca
   65E0 E6 07         [ 7]  795 	and	a,#0x07
   65E2 4F            [ 4]  796 	ld	c,a
   65E3 18 E1         [12]  797 	jr	00101$
   65E5                     798 00103$:
                            799 ;src/game.c:180: insertCardUser(col);
   65E5 79            [ 4]  800 	ld	a,c
   65E6 F5            [11]  801 	push	af
   65E7 33            [ 6]  802 	inc	sp
   65E8 CD C7 62      [17]  803 	call	_insertCardUser
   65EB 33            [ 6]  804 	inc	sp
   65EC 18 2C         [12]  805 	jr	00112$
   65EE                     806 00108$:
                            807 ;src/game.c:182: col = (cpct_rand() / 32);
   65EE CD 40 55      [17]  808 	call	_cpct_getRandom_mxor_u8
   65F1 7D            [ 4]  809 	ld	a,l
   65F2 07            [ 4]  810 	rlca
   65F3 07            [ 4]  811 	rlca
   65F4 07            [ 4]  812 	rlca
   65F5 E6 07         [ 7]  813 	and	a,#0x07
   65F7 47            [ 4]  814 	ld	b,a
                            815 ;src/game.c:183: while (enemyTable[col][0] != 0) {
   65F8                     816 00104$:
   65F8 58            [ 4]  817 	ld	e,b
   65F9 16 00         [ 7]  818 	ld	d,#0x00
   65FB 6B            [ 4]  819 	ld	l, e
   65FC 62            [ 4]  820 	ld	h, d
   65FD 29            [11]  821 	add	hl, hl
   65FE 19            [11]  822 	add	hl, de
   65FF 29            [11]  823 	add	hl, hl
   6600 11 22 61      [10]  824 	ld	de,#_enemyTable
   6603 19            [11]  825 	add	hl,de
   6604 7E            [ 7]  826 	ld	a,(hl)
   6605 B7            [ 4]  827 	or	a, a
   6606 28 0C         [12]  828 	jr	Z,00106$
                            829 ;src/game.c:184: col = (cpct_rand() / 32);
   6608 CD 40 55      [17]  830 	call	_cpct_getRandom_mxor_u8
   660B 7D            [ 4]  831 	ld	a,l
   660C 07            [ 4]  832 	rlca
   660D 07            [ 4]  833 	rlca
   660E 07            [ 4]  834 	rlca
   660F E6 07         [ 7]  835 	and	a,#0x07
   6611 47            [ 4]  836 	ld	b,a
   6612 18 E4         [12]  837 	jr	00104$
   6614                     838 00106$:
                            839 ;src/game.c:186: insertCardEnemy(col);
   6614 C5            [11]  840 	push	bc
   6615 33            [ 6]  841 	inc	sp
   6616 CD 37 64      [17]  842 	call	_insertCardEnemy
   6619 33            [ 6]  843 	inc	sp
   661A                     844 00112$:
                            845 ;src/game.c:174: for (i = 0; i < 8; i++) {
   661A DD 34 FF      [23]  846 	inc	-1 (ix)
   661D DD 7E FF      [19]  847 	ld	a,-1 (ix)
   6620 D6 08         [ 7]  848 	sub	a, #0x08
   6622 38 92         [12]  849 	jr	C,00111$
   6624 33            [ 6]  850 	inc	sp
   6625 DD E1         [14]  851 	pop	ix
   6627 C9            [10]  852 	ret
                            853 ;src/game.c:191: void drawUser() {
                            854 ;	---------------------------------
                            855 ; Function drawUser
                            856 ; ---------------------------------
   6628                     857 _drawUser::
                            858 ;src/game.c:204: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X - 1 + (user.px * (TILE_W + 2)), USER_TABLE_Y - 2 + (user.py * (TILE_H + 3)));
   6628 3A 63 61      [13]  859 	ld	a, (#(_user + 0x0003) + 0)
   662B 4F            [ 4]  860 	ld	c,a
   662C 87            [ 4]  861 	add	a, a
   662D 81            [ 4]  862 	add	a, c
   662E 87            [ 4]  863 	add	a, a
   662F 87            [ 4]  864 	add	a, a
   6630 81            [ 4]  865 	add	a, c
   6631 C6 6A         [ 7]  866 	add	a, #0x6A
   6633 57            [ 4]  867 	ld	d,a
   6634 3A 62 61      [13]  868 	ld	a, (#(_user + 0x0002) + 0)
   6637 4F            [ 4]  869 	ld	c,a
   6638 87            [ 4]  870 	add	a, a
   6639 81            [ 4]  871 	add	a, c
   663A 87            [ 4]  872 	add	a, a
   663B 81            [ 4]  873 	add	a, c
   663C 47            [ 4]  874 	ld	b,a
   663D 04            [ 4]  875 	inc	b
   663E D5            [11]  876 	push	de
   663F 33            [ 6]  877 	inc	sp
   6640 C5            [11]  878 	push	bc
   6641 33            [ 6]  879 	inc	sp
   6642 21 00 C0      [10]  880 	ld	hl,#0xC000
   6645 E5            [11]  881 	push	hl
   6646 CD D0 5F      [17]  882 	call	_cpct_getScreenPtr
   6649 4D            [ 4]  883 	ld	c,l
   664A 44            [ 4]  884 	ld	b,h
                            885 ;src/game.c:205: cpct_drawSpriteBlended(pvmem, HC_MARKER_H, HC_MARKER_W, hc_marker);
   664B 11 C2 41      [10]  886 	ld	de,#_hc_marker
   664E D5            [11]  887 	push	de
   664F 21 0E 07      [10]  888 	ld	hl,#0x070E
   6652 E5            [11]  889 	push	hl
   6653 C5            [11]  890 	push	bc
   6654 CD 73 5F      [17]  891 	call	_cpct_drawSpriteBlended
                            892 ;src/game.c:206: if (user.cardTaken!=0){
   6657 3A 65 61      [13]  893 	ld	a, (#(_user + 0x0005) + 0)
   665A B7            [ 4]  894 	or	a, a
   665B 28 5A         [12]  895 	jr	Z,00102$
                            896 ;src/game.c:207: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X + (user.px * (TILE_W + 2)), USER_TABLE_Y + (6 * (TILE_H + 3)));
   665D 3A 62 61      [13]  897 	ld	a, (#(_user + 0x0002) + 0)
   6660 4F            [ 4]  898 	ld	c,a
   6661 87            [ 4]  899 	add	a, a
   6662 81            [ 4]  900 	add	a, c
   6663 87            [ 4]  901 	add	a, a
   6664 81            [ 4]  902 	add	a, c
   6665 47            [ 4]  903 	ld	b,a
   6666 04            [ 4]  904 	inc	b
   6667 04            [ 4]  905 	inc	b
   6668 3E BA         [ 7]  906 	ld	a,#0xBA
   666A F5            [11]  907 	push	af
   666B 33            [ 6]  908 	inc	sp
   666C C5            [11]  909 	push	bc
   666D 33            [ 6]  910 	inc	sp
   666E 21 00 C0      [10]  911 	ld	hl,#0xC000
   6671 E5            [11]  912 	push	hl
   6672 CD D0 5F      [17]  913 	call	_cpct_getScreenPtr
   6675 4D            [ 4]  914 	ld	c,l
   6676 44            [ 4]  915 	ld	b,h
                            916 ;src/game.c:208: cpct_drawSprite(tile_buffer_0, pvmem, TILE_W, TILE_H);
   6677 21 05 0A      [10]  917 	ld	hl,#0x0A05
   667A E5            [11]  918 	push	hl
   667B C5            [11]  919 	push	bc
   667C 21 6A 61      [10]  920 	ld	hl,#_tile_buffer_0
   667F E5            [11]  921 	push	hl
   6680 CD 6A 54      [17]  922 	call	_cpct_drawSprite
                            923 ;src/game.c:209: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X + (user.x * (TILE_W + 2)), USER_TABLE_Y + (6 * (TILE_H + 3)));
   6683 3A 60 61      [13]  924 	ld	a, (#_user + 0)
   6686 4F            [ 4]  925 	ld	c,a
   6687 87            [ 4]  926 	add	a, a
   6688 81            [ 4]  927 	add	a, c
   6689 87            [ 4]  928 	add	a, a
   668A 81            [ 4]  929 	add	a, c
   668B 47            [ 4]  930 	ld	b,a
   668C 04            [ 4]  931 	inc	b
   668D 04            [ 4]  932 	inc	b
   668E 3E BA         [ 7]  933 	ld	a,#0xBA
   6690 F5            [11]  934 	push	af
   6691 33            [ 6]  935 	inc	sp
   6692 C5            [11]  936 	push	bc
   6693 33            [ 6]  937 	inc	sp
   6694 21 00 C0      [10]  938 	ld	hl,#0xC000
   6697 E5            [11]  939 	push	hl
   6698 CD D0 5F      [17]  940 	call	_cpct_getScreenPtr
   669B EB            [ 4]  941 	ex	de,hl
                            942 ;src/game.c:210: cpct_drawSpriteMaskedAlignedTable(cards[user.cardTaken], pvmem, TILE_W, TILE_H, hc_tablatrans);
   669C 01 55 62      [10]  943 	ld	bc,#_cards+0
   669F 21 65 61      [10]  944 	ld	hl, #(_user + 0x0005) + 0
   66A2 6E            [ 7]  945 	ld	l,(hl)
   66A3 26 00         [ 7]  946 	ld	h,#0x00
   66A5 29            [11]  947 	add	hl, hl
   66A6 09            [11]  948 	add	hl,bc
   66A7 4E            [ 7]  949 	ld	c,(hl)
   66A8 23            [ 6]  950 	inc	hl
   66A9 46            [ 7]  951 	ld	b,(hl)
   66AA 21 00 01      [10]  952 	ld	hl,#_hc_tablatrans
   66AD E5            [11]  953 	push	hl
   66AE 21 05 0A      [10]  954 	ld	hl,#0x0A05
   66B1 E5            [11]  955 	push	hl
   66B2 D5            [11]  956 	push	de
   66B3 C5            [11]  957 	push	bc
   66B4 CD F0 5F      [17]  958 	call	_cpct_drawSpriteMaskedAlignedTable
   66B7                     959 00102$:
                            960 ;src/game.c:212: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X - 1 + (user.x * (TILE_W + 2)), USER_TABLE_Y - 2 + (user.y * (TILE_H + 3)));
   66B7 3A 61 61      [13]  961 	ld	a, (#(_user + 0x0001) + 0)
   66BA 4F            [ 4]  962 	ld	c,a
   66BB 87            [ 4]  963 	add	a, a
   66BC 81            [ 4]  964 	add	a, c
   66BD 87            [ 4]  965 	add	a, a
   66BE 87            [ 4]  966 	add	a, a
   66BF 81            [ 4]  967 	add	a, c
   66C0 C6 6A         [ 7]  968 	add	a, #0x6A
   66C2 57            [ 4]  969 	ld	d,a
   66C3 3A 60 61      [13]  970 	ld	a, (#_user + 0)
   66C6 4F            [ 4]  971 	ld	c,a
   66C7 87            [ 4]  972 	add	a, a
   66C8 81            [ 4]  973 	add	a, c
   66C9 87            [ 4]  974 	add	a, a
   66CA 81            [ 4]  975 	add	a, c
   66CB 47            [ 4]  976 	ld	b,a
   66CC 04            [ 4]  977 	inc	b
   66CD D5            [11]  978 	push	de
   66CE 33            [ 6]  979 	inc	sp
   66CF C5            [11]  980 	push	bc
   66D0 33            [ 6]  981 	inc	sp
   66D1 21 00 C0      [10]  982 	ld	hl,#0xC000
   66D4 E5            [11]  983 	push	hl
   66D5 CD D0 5F      [17]  984 	call	_cpct_getScreenPtr
   66D8 4D            [ 4]  985 	ld	c,l
   66D9 44            [ 4]  986 	ld	b,h
                            987 ;src/game.c:213: cpct_drawSpriteBlended(pvmem, HC_MARKER_H, HC_MARKER_W, hc_marker);
   66DA 11 C2 41      [10]  988 	ld	de,#_hc_marker
   66DD D5            [11]  989 	push	de
   66DE 21 0E 07      [10]  990 	ld	hl,#0x070E
   66E1 E5            [11]  991 	push	hl
   66E2 C5            [11]  992 	push	bc
   66E3 CD 73 5F      [17]  993 	call	_cpct_drawSpriteBlended
                            994 ;src/game.c:216: user.px = user.x;
   66E6 3A 60 61      [13]  995 	ld	a, (#_user + 0)
   66E9 32 62 61      [13]  996 	ld	(#(_user + 0x0002)),a
                            997 ;src/game.c:217: user.py = user.y;
   66EC 3A 61 61      [13]  998 	ld	a, (#(_user + 0x0001) + 0)
   66EF 32 63 61      [13]  999 	ld	(#(_user + 0x0003)),a
   66F2 C9            [10] 1000 	ret
                           1001 ;src/game.c:220: void userTakeCard(u8 col) {
                           1002 ;	---------------------------------
                           1003 ; Function userTakeCard
                           1004 ; ---------------------------------
   66F3                    1005 _userTakeCard::
   66F3 DD E5         [15] 1006 	push	ix
   66F5 DD 21 00 00   [14] 1007 	ld	ix,#0
   66F9 DD 39         [15] 1008 	add	ix,sp
   66FB 21 F5 FF      [10] 1009 	ld	hl,#-11
   66FE 39            [11] 1010 	add	hl,sp
   66FF F9            [ 6] 1011 	ld	sp,hl
                           1012 ;src/game.c:223: i = 5;
   6700 DD 36 FF 05   [19] 1013 	ld	-1 (ix),#0x05
                           1014 ;src/game.c:224: while (i <= 5) {
   6704 DD 36 F7 05   [19] 1015 	ld	-9 (ix),#0x05
   6708                    1016 00105$:
   6708 3E 05         [ 7] 1017 	ld	a,#0x05
   670A DD 96 F7      [19] 1018 	sub	a, -9 (ix)
   670D DA 16 68      [10] 1019 	jp	C,00111$
                           1020 ;src/game.c:225: if (userTable[col][i] != 0) {
   6710 01 F2 60      [10] 1021 	ld	bc,#_userTable+0
   6713 DD 5E 04      [19] 1022 	ld	e,4 (ix)
   6716 16 00         [ 7] 1023 	ld	d,#0x00
   6718 6B            [ 4] 1024 	ld	l, e
   6719 62            [ 4] 1025 	ld	h, d
   671A 29            [11] 1026 	add	hl, hl
   671B 19            [11] 1027 	add	hl, de
   671C 29            [11] 1028 	add	hl, hl
   671D 09            [11] 1029 	add	hl,bc
   671E DD 5E F7      [19] 1030 	ld	e,-9 (ix)
   6721 16 00         [ 7] 1031 	ld	d,#0x00
   6723 19            [11] 1032 	add	hl,de
   6724 4E            [ 7] 1033 	ld	c,(hl)
   6725 79            [ 4] 1034 	ld	a,c
   6726 B7            [ 4] 1035 	or	a, a
   6727 CA 0A 68      [10] 1036 	jp	Z,00103$
                           1037 ;src/game.c:226: user.cardTaken = userTable[col][i];
   672A 21 65 61      [10] 1038 	ld	hl,#(_user + 0x0005)
   672D 71            [ 7] 1039 	ld	(hl),c
   672E DD 7E 04      [19] 1040 	ld	a,4 (ix)
   6731 4F            [ 4] 1041 	ld	c,a
   6732 87            [ 4] 1042 	add	a, a
   6733 81            [ 4] 1043 	add	a, c
   6734 87            [ 4] 1044 	add	a, a
   6735 81            [ 4] 1045 	add	a, c
   6736 C6 02         [ 7] 1046 	add	a, #0x02
   6738 DD 77 FE      [19] 1047 	ld	-2 (ix),a
   673B                    1048 00109$:
                           1049 ;src/game.c:227: for (; i<6; i++){
   673B DD 7E FF      [19] 1050 	ld	a,-1 (ix)
   673E D6 06         [ 7] 1051 	sub	a, #0x06
   6740 D2 16 68      [10] 1052 	jp	NC,00111$
                           1053 ;src/game.c:228: delay(20);
   6743 21 00 00      [10] 1054 	ld	hl,#0x0000
   6746 E5            [11] 1055 	push	hl
   6747 21 14 00      [10] 1056 	ld	hl,#0x0014
   674A E5            [11] 1057 	push	hl
   674B CD 32 62      [17] 1058 	call	_delay
   674E F1            [10] 1059 	pop	af
   674F F1            [10] 1060 	pop	af
                           1061 ;src/game.c:229: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X + (col * (TILE_W + 2)), USER_TABLE_Y + (i * (TILE_H + 3)));
   6750 DD 7E FF      [19] 1062 	ld	a,-1 (ix)
   6753 4F            [ 4] 1063 	ld	c,a
   6754 87            [ 4] 1064 	add	a, a
   6755 81            [ 4] 1065 	add	a, c
   6756 87            [ 4] 1066 	add	a, a
   6757 87            [ 4] 1067 	add	a, a
   6758 81            [ 4] 1068 	add	a, c
   6759 C6 6C         [ 7] 1069 	add	a, #0x6C
   675B 47            [ 4] 1070 	ld	b,a
   675C C5            [11] 1071 	push	bc
   675D 33            [ 6] 1072 	inc	sp
   675E DD 7E FE      [19] 1073 	ld	a,-2 (ix)
   6761 F5            [11] 1074 	push	af
   6762 33            [ 6] 1075 	inc	sp
   6763 21 00 C0      [10] 1076 	ld	hl,#0xC000
   6766 E5            [11] 1077 	push	hl
   6767 CD D0 5F      [17] 1078 	call	_cpct_getScreenPtr
   676A 4D            [ 4] 1079 	ld	c,l
   676B 44            [ 4] 1080 	ld	b,h
                           1081 ;src/game.c:230: cpct_drawSprite(tile_buffer_0, pvmem, TILE_W, TILE_H);
   676C 21 05 0A      [10] 1082 	ld	hl,#0x0A05
   676F E5            [11] 1083 	push	hl
   6770 C5            [11] 1084 	push	bc
   6771 21 6A 61      [10] 1085 	ld	hl,#_tile_buffer_0
   6774 E5            [11] 1086 	push	hl
   6775 CD 6A 54      [17] 1087 	call	_cpct_drawSprite
                           1088 ;src/game.c:231: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X + (col * (TILE_W + 2)), USER_TABLE_Y + ((i+1) * (TILE_H + 3)));
   6778 DD 7E FF      [19] 1089 	ld	a,-1 (ix)
   677B 3C            [ 4] 1090 	inc	a
   677C DD 77 FD      [19] 1091 	ld	-3 (ix), a
   677F 4F            [ 4] 1092 	ld	c,a
   6780 87            [ 4] 1093 	add	a, a
   6781 81            [ 4] 1094 	add	a, c
   6782 87            [ 4] 1095 	add	a, a
   6783 87            [ 4] 1096 	add	a, a
   6784 81            [ 4] 1097 	add	a, c
   6785 C6 6C         [ 7] 1098 	add	a, #0x6C
   6787 47            [ 4] 1099 	ld	b,a
   6788 C5            [11] 1100 	push	bc
   6789 33            [ 6] 1101 	inc	sp
   678A DD 7E FE      [19] 1102 	ld	a,-2 (ix)
   678D F5            [11] 1103 	push	af
   678E 33            [ 6] 1104 	inc	sp
   678F 21 00 C0      [10] 1105 	ld	hl,#0xC000
   6792 E5            [11] 1106 	push	hl
   6793 CD D0 5F      [17] 1107 	call	_cpct_getScreenPtr
   6796 DD 74 FC      [19] 1108 	ld	-4 (ix),h
   6799 DD 75 FB      [19] 1109 	ld	-5 (ix), l
   679C DD 75 F5      [19] 1110 	ld	-11 (ix), l
   679F DD 7E FC      [19] 1111 	ld	a,-4 (ix)
   67A2 DD 77 F6      [19] 1112 	ld	-10 (ix),a
                           1113 ;src/game.c:232: cpct_drawSpriteMaskedAlignedTable(cards[user.cardTaken], pvmem, TILE_W, TILE_H, hc_tablatrans);
   67A5 DD 7E F5      [19] 1114 	ld	a,-11 (ix)
   67A8 DD 77 FB      [19] 1115 	ld	-5 (ix),a
   67AB DD 7E F6      [19] 1116 	ld	a,-10 (ix)
   67AE DD 77 FC      [19] 1117 	ld	-4 (ix),a
   67B1 3A 65 61      [13] 1118 	ld	a,(#(_user + 0x0005) + 0)
   67B4 DD 77 FA      [19] 1119 	ld	-6 (ix), a
   67B7 DD 77 F8      [19] 1120 	ld	-8 (ix),a
   67BA DD 36 F9 00   [19] 1121 	ld	-7 (ix),#0x00
   67BE DD CB F8 26   [23] 1122 	sla	-8 (ix)
   67C2 DD CB F9 16   [23] 1123 	rl	-7 (ix)
   67C6 3E 55         [ 7] 1124 	ld	a,#<(_cards)
   67C8 DD 86 F8      [19] 1125 	add	a, -8 (ix)
   67CB DD 77 F8      [19] 1126 	ld	-8 (ix),a
   67CE 3E 62         [ 7] 1127 	ld	a,#>(_cards)
   67D0 DD 8E F9      [19] 1128 	adc	a, -7 (ix)
   67D3 DD 77 F9      [19] 1129 	ld	-7 (ix),a
   67D6 DD 6E F8      [19] 1130 	ld	l,-8 (ix)
   67D9 DD 66 F9      [19] 1131 	ld	h,-7 (ix)
   67DC 7E            [ 7] 1132 	ld	a,(hl)
   67DD DD 77 F8      [19] 1133 	ld	-8 (ix),a
   67E0 23            [ 6] 1134 	inc	hl
   67E1 7E            [ 7] 1135 	ld	a,(hl)
   67E2 DD 77 F9      [19] 1136 	ld	-7 (ix),a
   67E5 21 00 01      [10] 1137 	ld	hl,#_hc_tablatrans
   67E8 E5            [11] 1138 	push	hl
   67E9 21 05 0A      [10] 1139 	ld	hl,#0x0A05
   67EC E5            [11] 1140 	push	hl
   67ED DD 6E FB      [19] 1141 	ld	l,-5 (ix)
   67F0 DD 66 FC      [19] 1142 	ld	h,-4 (ix)
   67F3 E5            [11] 1143 	push	hl
   67F4 DD 6E F8      [19] 1144 	ld	l,-8 (ix)
   67F7 DD 66 F9      [19] 1145 	ld	h,-7 (ix)
   67FA E5            [11] 1146 	push	hl
   67FB CD F0 5F      [17] 1147 	call	_cpct_drawSpriteMaskedAlignedTable
                           1148 ;src/game.c:227: for (; i<6; i++){
   67FE DD 7E FD      [19] 1149 	ld	a,-3 (ix)
   6801 DD 77 F7      [19] 1150 	ld	-9 (ix), a
   6804 DD 77 FF      [19] 1151 	ld	-1 (ix),a
   6807 C3 3B 67      [10] 1152 	jp	00109$
                           1153 ;src/game.c:236: break;
   680A                    1154 00103$:
                           1155 ;src/game.c:239: i--;
   680A DD 35 F7      [23] 1156 	dec	-9 (ix)
   680D DD 7E F7      [19] 1157 	ld	a,-9 (ix)
   6810 DD 77 FF      [19] 1158 	ld	-1 (ix),a
   6813 C3 08 67      [10] 1159 	jp	00105$
   6816                    1160 00111$:
   6816 DD F9         [10] 1161 	ld	sp, ix
   6818 DD E1         [14] 1162 	pop	ix
   681A C9            [10] 1163 	ret
                           1164 ;src/game.c:244: void checkUserMovement() {
                           1165 ;	---------------------------------
                           1166 ; Function checkUserMovement
                           1167 ; ---------------------------------
   681B                    1168 _checkUserMovement::
                           1169 ;src/game.c:247: if ((user.x < (TABLE_WIDTH - 1)) && (cpct_isKeyPressed(keys.right))) {
   681B 3A 60 61      [13] 1170 	ld	a,(#_user + 0)
   681E D6 07         [ 7] 1171 	sub	a, #0x07
   6820 30 1B         [12] 1172 	jr	NC,00105$
   6822 2A 58 61      [16] 1173 	ld	hl, (#(_keys + 0x0006) + 0)
   6825 CD 52 54      [17] 1174 	call	_cpct_isKeyPressed
   6828 7D            [ 4] 1175 	ld	a,l
   6829 B7            [ 4] 1176 	or	a, a
   682A 28 11         [12] 1177 	jr	Z,00105$
                           1178 ;src/game.c:248: user.px = user.x;
   682C 01 60 61      [10] 1179 	ld	bc,#_user+0
   682F 0A            [ 7] 1180 	ld	a,(bc)
   6830 32 62 61      [13] 1181 	ld	(#(_user + 0x0002)),a
                           1182 ;src/game.c:249: user.x++;
   6833 0A            [ 7] 1183 	ld	a,(bc)
   6834 3C            [ 4] 1184 	inc	a
   6835 02            [ 7] 1185 	ld	(bc),a
                           1186 ;src/game.c:250: user.moved = 1;
   6836 21 64 61      [10] 1187 	ld	hl,#(_user + 0x0004)
   6839 36 01         [10] 1188 	ld	(hl),#0x01
   683B 18 20         [12] 1189 	jr	00106$
   683D                    1190 00105$:
                           1191 ;src/game.c:251: } else if ((user.x > 0) && (cpct_isKeyPressed(keys.left))) {
   683D 3A 60 61      [13] 1192 	ld	a, (#_user + 0)
   6840 B7            [ 4] 1193 	or	a, a
   6841 28 1A         [12] 1194 	jr	Z,00106$
   6843 2A 56 61      [16] 1195 	ld	hl, (#(_keys + 0x0004) + 0)
   6846 CD 52 54      [17] 1196 	call	_cpct_isKeyPressed
   6849 7D            [ 4] 1197 	ld	a,l
   684A B7            [ 4] 1198 	or	a, a
   684B 28 10         [12] 1199 	jr	Z,00106$
                           1200 ;src/game.c:252: user.px = user.x;
   684D 01 60 61      [10] 1201 	ld	bc,#_user+0
   6850 0A            [ 7] 1202 	ld	a,(bc)
   6851 32 62 61      [13] 1203 	ld	(#(_user + 0x0002)),a
                           1204 ;src/game.c:253: user.x--;
   6854 0A            [ 7] 1205 	ld	a,(bc)
   6855 C6 FF         [ 7] 1206 	add	a,#0xFF
   6857 02            [ 7] 1207 	ld	(bc),a
                           1208 ;src/game.c:254: user.moved = 1;
   6858 21 64 61      [10] 1209 	ld	hl,#(_user + 0x0004)
   685B 36 01         [10] 1210 	ld	(hl),#0x01
   685D                    1211 00106$:
                           1212 ;src/game.c:257: if ((user.y < (TABLE_HEIGHT - 1)) && (cpct_isKeyPressed(keys.down))) {
   685D 01 61 61      [10] 1213 	ld	bc,#_user + 1
   6860 0A            [ 7] 1214 	ld	a,(bc)
                           1215 ;src/game.c:258: user.py = user.y;
                           1216 ;src/game.c:260: user.moved = 1;
                           1217 ;src/game.c:257: if ((user.y < (TABLE_HEIGHT - 1)) && (cpct_isKeyPressed(keys.down))) {
   6861 5F            [ 4] 1218 	ld	e,a
   6862 D6 05         [ 7] 1219 	sub	a, #0x05
   6864 30 1D         [12] 1220 	jr	NC,00112$
   6866 2A 54 61      [16] 1221 	ld	hl, (#(_keys + 0x0002) + 0)
   6869 C5            [11] 1222 	push	bc
   686A CD 52 54      [17] 1223 	call	_cpct_isKeyPressed
   686D 55            [ 4] 1224 	ld	d,l
   686E C1            [10] 1225 	pop	bc
   686F 0A            [ 7] 1226 	ld	a,(bc)
   6870 5F            [ 4] 1227 	ld	e,a
   6871 7A            [ 4] 1228 	ld	a,d
   6872 B7            [ 4] 1229 	or	a, a
   6873 28 0E         [12] 1230 	jr	Z,00112$
                           1231 ;src/game.c:258: user.py = user.y;
   6875 21 63 61      [10] 1232 	ld	hl,#(_user + 0x0003)
   6878 73            [ 7] 1233 	ld	(hl),e
                           1234 ;src/game.c:259: user.y++;
   6879 0A            [ 7] 1235 	ld	a,(bc)
   687A 3C            [ 4] 1236 	inc	a
   687B 02            [ 7] 1237 	ld	(bc),a
                           1238 ;src/game.c:260: user.moved = 1;
   687C 21 64 61      [10] 1239 	ld	hl,#(_user + 0x0004)
   687F 36 01         [10] 1240 	ld	(hl),#0x01
   6881 18 1D         [12] 1241 	jr	00113$
   6883                    1242 00112$:
                           1243 ;src/game.c:261: } else if ((user.y > 0) && (cpct_isKeyPressed(keys.up))) {
   6883 7B            [ 4] 1244 	ld	a,e
   6884 B7            [ 4] 1245 	or	a, a
   6885 28 19         [12] 1246 	jr	Z,00113$
   6887 2A 52 61      [16] 1247 	ld	hl, (#_keys + 0)
   688A C5            [11] 1248 	push	bc
   688B CD 52 54      [17] 1249 	call	_cpct_isKeyPressed
   688E C1            [10] 1250 	pop	bc
   688F 7D            [ 4] 1251 	ld	a,l
   6890 B7            [ 4] 1252 	or	a, a
   6891 28 0D         [12] 1253 	jr	Z,00113$
                           1254 ;src/game.c:262: user.py = user.y;
   6893 0A            [ 7] 1255 	ld	a,(bc)
   6894 32 63 61      [13] 1256 	ld	(#(_user + 0x0003)),a
                           1257 ;src/game.c:263: user.y--;
   6897 0A            [ 7] 1258 	ld	a,(bc)
   6898 C6 FF         [ 7] 1259 	add	a,#0xFF
   689A 02            [ 7] 1260 	ld	(bc),a
                           1261 ;src/game.c:264: user.moved = 1;
   689B 21 64 61      [10] 1262 	ld	hl,#(_user + 0x0004)
   689E 36 01         [10] 1263 	ld	(hl),#0x01
   68A0                    1264 00113$:
                           1265 ;src/game.c:266: if ((userTable[user.x][5] == 0) && (cpct_isKeyPressed(keys.fire))) {
   68A0 3A 60 61      [13] 1266 	ld	a, (#_user + 0)
   68A3 4F            [ 4] 1267 	ld	c,a
   68A4 06 00         [ 7] 1268 	ld	b,#0x00
   68A6 69            [ 4] 1269 	ld	l, c
   68A7 60            [ 4] 1270 	ld	h, b
   68A8 29            [11] 1271 	add	hl, hl
   68A9 09            [11] 1272 	add	hl, bc
   68AA 29            [11] 1273 	add	hl, hl
   68AB 11 F2 60      [10] 1274 	ld	de,#_userTable
   68AE 19            [11] 1275 	add	hl,de
   68AF 11 05 00      [10] 1276 	ld	de, #0x0005
   68B2 19            [11] 1277 	add	hl, de
   68B3 7E            [ 7] 1278 	ld	a,(hl)
   68B4 B7            [ 4] 1279 	or	a, a
   68B5 20 14         [12] 1280 	jr	NZ,00116$
   68B7 2A 5A 61      [16] 1281 	ld	hl, (#(_keys + 0x0008) + 0)
   68BA CD 52 54      [17] 1282 	call	_cpct_isKeyPressed
   68BD 7D            [ 4] 1283 	ld	a,l
   68BE B7            [ 4] 1284 	or	a, a
   68BF 28 0A         [12] 1285 	jr	Z,00116$
                           1286 ;src/game.c:268: userTakeCard(user.x);
   68C1 21 60 61      [10] 1287 	ld	hl, #_user + 0
   68C4 46            [ 7] 1288 	ld	b,(hl)
   68C5 C5            [11] 1289 	push	bc
   68C6 33            [ 6] 1290 	inc	sp
   68C7 CD F3 66      [17] 1291 	call	_userTakeCard
   68CA 33            [ 6] 1292 	inc	sp
   68CB                    1293 00116$:
                           1294 ;src/game.c:271: if (cpct_isKeyPressed(keys.abort)) {
   68CB 2A 5E 61      [16] 1295 	ld	hl, (#(_keys + 0x000c) + 0)
   68CE CD 52 54      [17] 1296 	call	_cpct_isKeyPressed
   68D1 7D            [ 4] 1297 	ld	a,l
   68D2 B7            [ 4] 1298 	or	a, a
   68D3 C8            [11] 1299 	ret	Z
                           1300 ;src/game.c:273: reset_cpc();
   68D4 C3 96 53      [10] 1301 	jp  _reset_cpc
                           1302 ;src/game.c:277: void game() {
                           1303 ;	---------------------------------
                           1304 ; Function game
                           1305 ; ---------------------------------
   68D7                    1306 _game::
                           1307 ;src/game.c:280: initGame();
   68D7 CD 5F 62      [17] 1308 	call	_initGame
                           1309 ;src/game.c:281: drawScreen();
   68DA CD B5 62      [17] 1310 	call	_drawScreen
                           1311 ;src/game.c:282: newHand(0);  //0 for Enemy 1 for User
   68DD AF            [ 4] 1312 	xor	a, a
   68DE F5            [11] 1313 	push	af
   68DF 33            [ 6] 1314 	inc	sp
   68E0 CD A9 65      [17] 1315 	call	_newHand
   68E3 33            [ 6] 1316 	inc	sp
                           1317 ;src/game.c:283: newHand(1);  //0 for Enemy 1 for User
   68E4 3E 01         [ 7] 1318 	ld	a,#0x01
   68E6 F5            [11] 1319 	push	af
   68E7 33            [ 6] 1320 	inc	sp
   68E8 CD A9 65      [17] 1321 	call	_newHand
   68EB 33            [ 6] 1322 	inc	sp
                           1323 ;src/game.c:286: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X - 1 + (user.x * (TILE_W + 2)), USER_TABLE_Y - 2 + (user.y * (TILE_H + 3)));
   68EC 3A 61 61      [13] 1324 	ld	a, (#_user + 1)
   68EF 4F            [ 4] 1325 	ld	c,a
   68F0 87            [ 4] 1326 	add	a, a
   68F1 81            [ 4] 1327 	add	a, c
   68F2 87            [ 4] 1328 	add	a, a
   68F3 87            [ 4] 1329 	add	a, a
   68F4 81            [ 4] 1330 	add	a, c
   68F5 C6 6A         [ 7] 1331 	add	a, #0x6A
   68F7 57            [ 4] 1332 	ld	d,a
   68F8 3A 60 61      [13] 1333 	ld	a, (#_user + 0)
   68FB 4F            [ 4] 1334 	ld	c,a
   68FC 87            [ 4] 1335 	add	a, a
   68FD 81            [ 4] 1336 	add	a, c
   68FE 87            [ 4] 1337 	add	a, a
   68FF 81            [ 4] 1338 	add	a, c
   6900 47            [ 4] 1339 	ld	b,a
   6901 04            [ 4] 1340 	inc	b
   6902 D5            [11] 1341 	push	de
   6903 33            [ 6] 1342 	inc	sp
   6904 C5            [11] 1343 	push	bc
   6905 33            [ 6] 1344 	inc	sp
   6906 21 00 C0      [10] 1345 	ld	hl,#0xC000
   6909 E5            [11] 1346 	push	hl
   690A CD D0 5F      [17] 1347 	call	_cpct_getScreenPtr
   690D 4D            [ 4] 1348 	ld	c,l
   690E 44            [ 4] 1349 	ld	b,h
                           1350 ;src/game.c:287: cpct_drawSpriteBlended(pvmem, HC_MARKER_H, HC_MARKER_W, hc_marker);
   690F 11 C2 41      [10] 1351 	ld	de,#_hc_marker+0
   6912 D5            [11] 1352 	push	de
   6913 21 0E 07      [10] 1353 	ld	hl,#0x070E
   6916 E5            [11] 1354 	push	hl
   6917 C5            [11] 1355 	push	bc
   6918 CD 73 5F      [17] 1356 	call	_cpct_drawSpriteBlended
                           1357 ;src/game.c:288: drawUser();
   691B CD 28 66      [17] 1358 	call	_drawUser
                           1359 ;src/game.c:289: while (1) {
   691E                    1360 00106$:
                           1361 ;src/game.c:290: checkUserMovement();
   691E CD 1B 68      [17] 1362 	call	_checkUserMovement
                           1363 ;src/game.c:291: if (user.moved) {
   6921 3A 64 61      [13] 1364 	ld	a, (#(_user + 0x0004) + 0)
   6924 B7            [ 4] 1365 	or	a, a
   6925 28 08         [12] 1366 	jr	Z,00102$
                           1367 ;src/game.c:292: drawUser();
   6927 CD 28 66      [17] 1368 	call	_drawUser
                           1369 ;src/game.c:293: user.moved = 0;
   692A 21 64 61      [10] 1370 	ld	hl,#(_user + 0x0004)
   692D 36 00         [10] 1371 	ld	(hl),#0x00
   692F                    1372 00102$:
                           1373 ;src/game.c:295: if (abort)
   692F 3A 68 61      [13] 1374 	ld	a,(#_abort + 0)
   6932 B7            [ 4] 1375 	or	a, a
   6933 C0            [11] 1376 	ret	NZ
                           1377 ;src/game.c:297: delay(20);
   6934 21 00 00      [10] 1378 	ld	hl,#0x0000
   6937 E5            [11] 1379 	push	hl
   6938 21 14 00      [10] 1380 	ld	hl,#0x0014
   693B E5            [11] 1381 	push	hl
   693C CD 32 62      [17] 1382 	call	_delay
   693F F1            [10] 1383 	pop	af
   6940 F1            [10] 1384 	pop	af
   6941 18 DB         [12] 1385 	jr	00106$
                           1386 	.area _CODE
                           1387 	.area _INITIALIZER
   61CE                    1388 __xinit__tile_buffer_0:
   61CE 00                 1389 	.db #0x00	; 0
   61CF 00                 1390 	.db #0x00	; 0
   61D0 00                 1391 	.db #0x00	; 0
   61D1 00                 1392 	.db #0x00	; 0
   61D2 00                 1393 	.db #0x00	; 0
   61D3 00                 1394 	.db #0x00	; 0
   61D4 00                 1395 	.db #0x00	; 0
   61D5 00                 1396 	.db #0x00	; 0
   61D6 00                 1397 	.db #0x00	; 0
   61D7 00                 1398 	.db #0x00	; 0
   61D8 00                 1399 	.db #0x00	; 0
   61D9 00                 1400 	.db #0x00	; 0
   61DA 00                 1401 	.db #0x00	; 0
   61DB 00                 1402 	.db #0x00	; 0
   61DC 00                 1403 	.db #0x00	; 0
   61DD 00                 1404 	.db #0x00	; 0
   61DE 00                 1405 	.db #0x00	; 0
   61DF 00                 1406 	.db #0x00	; 0
   61E0 00                 1407 	.db #0x00	; 0
   61E1 00                 1408 	.db #0x00	; 0
   61E2 00                 1409 	.db #0x00	; 0
   61E3 00                 1410 	.db #0x00	; 0
   61E4 00                 1411 	.db #0x00	; 0
   61E5 00                 1412 	.db #0x00	; 0
   61E6 00                 1413 	.db #0x00	; 0
   61E7 00                 1414 	.db #0x00	; 0
   61E8 00                 1415 	.db #0x00	; 0
   61E9 00                 1416 	.db #0x00	; 0
   61EA 00                 1417 	.db #0x00	; 0
   61EB 00                 1418 	.db #0x00	; 0
   61EC 00                 1419 	.db #0x00	; 0
   61ED 00                 1420 	.db #0x00	; 0
   61EE 00                 1421 	.db #0x00	; 0
   61EF 00                 1422 	.db #0x00	; 0
   61F0 00                 1423 	.db #0x00	; 0
   61F1 00                 1424 	.db #0x00	; 0
   61F2 00                 1425 	.db #0x00	; 0
   61F3 00                 1426 	.db #0x00	; 0
   61F4 00                 1427 	.db #0x00	; 0
   61F5 00                 1428 	.db #0x00	; 0
   61F6 00                 1429 	.db #0x00	; 0
   61F7 00                 1430 	.db #0x00	; 0
   61F8 00                 1431 	.db #0x00	; 0
   61F9 00                 1432 	.db #0x00	; 0
   61FA 00                 1433 	.db #0x00	; 0
   61FB 00                 1434 	.db #0x00	; 0
   61FC 00                 1435 	.db #0x00	; 0
   61FD 00                 1436 	.db #0x00	; 0
   61FE 00                 1437 	.db #0x00	; 0
   61FF 00                 1438 	.db #0x00	; 0
   6200                    1439 __xinit__tile_buffer_1:
   6200 00                 1440 	.db #0x00	; 0
   6201 00                 1441 	.db #0x00	; 0
   6202 00                 1442 	.db #0x00	; 0
   6203 00                 1443 	.db #0x00	; 0
   6204 00                 1444 	.db #0x00	; 0
   6205 00                 1445 	.db #0x00	; 0
   6206 00                 1446 	.db #0x00	; 0
   6207 00                 1447 	.db #0x00	; 0
   6208 00                 1448 	.db #0x00	; 0
   6209 00                 1449 	.db #0x00	; 0
   620A 00                 1450 	.db #0x00	; 0
   620B 00                 1451 	.db #0x00	; 0
   620C 00                 1452 	.db #0x00	; 0
   620D 00                 1453 	.db #0x00	; 0
   620E 00                 1454 	.db #0x00	; 0
   620F 00                 1455 	.db #0x00	; 0
   6210 00                 1456 	.db #0x00	; 0
   6211 00                 1457 	.db #0x00	; 0
   6212 00                 1458 	.db #0x00	; 0
   6213 00                 1459 	.db #0x00	; 0
   6214 00                 1460 	.db #0x00	; 0
   6215 00                 1461 	.db #0x00	; 0
   6216 00                 1462 	.db #0x00	; 0
   6217 00                 1463 	.db #0x00	; 0
   6218 00                 1464 	.db #0x00	; 0
   6219 00                 1465 	.db #0x00	; 0
   621A 00                 1466 	.db #0x00	; 0
   621B 00                 1467 	.db #0x00	; 0
   621C 00                 1468 	.db #0x00	; 0
   621D 00                 1469 	.db #0x00	; 0
   621E 00                 1470 	.db #0x00	; 0
   621F 00                 1471 	.db #0x00	; 0
   6220 00                 1472 	.db #0x00	; 0
   6221 00                 1473 	.db #0x00	; 0
   6222 00                 1474 	.db #0x00	; 0
   6223 00                 1475 	.db #0x00	; 0
   6224 00                 1476 	.db #0x00	; 0
   6225 00                 1477 	.db #0x00	; 0
   6226 00                 1478 	.db #0x00	; 0
   6227 00                 1479 	.db #0x00	; 0
   6228 00                 1480 	.db #0x00	; 0
   6229 00                 1481 	.db #0x00	; 0
   622A 00                 1482 	.db #0x00	; 0
   622B 00                 1483 	.db #0x00	; 0
   622C 00                 1484 	.db #0x00	; 0
   622D 00                 1485 	.db #0x00	; 0
   622E 00                 1486 	.db #0x00	; 0
   622F 00                 1487 	.db #0x00	; 0
   6230 00                 1488 	.db #0x00	; 0
   6231 00                 1489 	.db #0x00	; 0
                           1490 	.area _CABS (ABS)
