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
                             12 	.globl _drawUser
                             13 	.globl _newHand
                             14 	.globl _insertCardEnemy
                             15 	.globl _insertCardUser
                             16 	.globl _drawScreen
                             17 	.globl _initGame
                             18 	.globl _delay
                             19 	.globl _cpc_GetSp
                             20 	.globl _reset_cpc
                             21 	.globl _cpct_getRandom_mxor_u8
                             22 	.globl _cpct_getScreenPtr
                             23 	.globl _cpct_drawSpriteMaskedAlignedTable
                             24 	.globl _cpct_drawSprite
                             25 	.globl _cpct_isKeyPressed
                             26 	.globl _cpct_scanKeyboard_f
                             27 	.globl _tile_buffer_1
                             28 	.globl _tile_buffer_0
                             29 	.globl _abort
                             30 	.globl _user
                             31 	.globl _keys
                             32 	.globl _enemyTable
                             33 	.globl _userTable
                             34 	.globl _enemyY
                             35 	.globl _enemyX
                             36 	.globl _cards
                             37 	.globl _game
                             38 ;--------------------------------------------------------
                             39 ; special function registers
                             40 ;--------------------------------------------------------
                             41 ;--------------------------------------------------------
                             42 ; ram data
                             43 ;--------------------------------------------------------
                             44 	.area _DATA
   580C                      45 _enemyX::
   580C                      46 	.ds 1
   580D                      47 _enemyY::
   580D                      48 	.ds 1
   580E                      49 _userTable::
   580E                      50 	.ds 48
   583E                      51 _enemyTable::
   583E                      52 	.ds 48
   586E                      53 _keys::
   586E                      54 	.ds 14
   587C                      55 _user::
   587C                      56 	.ds 7
   5883                      57 _abort::
   5883                      58 	.ds 1
                             59 ;--------------------------------------------------------
                             60 ; ram data
                             61 ;--------------------------------------------------------
                             62 	.area _INITIALIZED
   5885                      63 _tile_buffer_0::
   5885                      64 	.ds 50
   58B7                      65 _tile_buffer_1::
   58B7                      66 	.ds 50
                             67 ;--------------------------------------------------------
                             68 ; absolute external ram data
                             69 ;--------------------------------------------------------
                             70 	.area _DABS (ABS)
                             71 ;--------------------------------------------------------
                             72 ; global & static initialisations
                             73 ;--------------------------------------------------------
                             74 	.area _HOME
                             75 	.area _GSINIT
                             76 	.area _GSFINAL
                             77 	.area _GSINIT
                             78 ;--------------------------------------------------------
                             79 ; Home
                             80 ;--------------------------------------------------------
                             81 	.area _HOME
                             82 	.area _HOME
                             83 ;--------------------------------------------------------
                             84 ; code
                             85 ;--------------------------------------------------------
                             86 	.area _CODE
                             87 ;src/game.c:56: cpctm_createTransparentMaskTable(hc_tablatrans, 0x100, M0, 0);
                             88 ;	---------------------------------
                             89 ; Function dummy_cpct_transparentMaskTable0M0_container
                             90 ; ---------------------------------
   41F4                      91 _dummy_cpct_transparentMaskTable0M0_container::
                             92 	.area _hc_tablatrans_ (ABS) 
   0100                      93 	.org 0x100 
   0100                      94 	 _hc_tablatrans::
   0100 FF AA 55 00 AA AA    95 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0108 55 00 55 00 00 00    96 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0110 AA AA 00 00 AA AA    97 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0118 00 00 00 00 00 00    98 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0120 55 00 55 00 00 00    99 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0128 55 00 55 00 00 00   100 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0130 00 00 00 00 00 00   101 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0138 00 00 00 00 00 00   102 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0140 AA AA 00 00 AA AA   103 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0148 00 00 00 00 00 00   104 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0150 AA AA 00 00 AA AA   105 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0158 00 00 00 00 00 00   106 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0160 00 00 00 00 00 00   107 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0168 00 00 00 00 00 00   108 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0170 00 00 00 00 00 00   109 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0178 00 00 00 00 00 00   110 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0180 55 00 55 00 00 00   111 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0188 55 00 55 00 00 00   112 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0190 00 00 00 00 00 00   113 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0198 00 00 00 00 00 00   114 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A0 55 00 55 00 00 00   115 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A8 55 00 55 00 00 00   116 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B0 00 00 00 00 00 00   117 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B8 00 00 00 00 00 00   118 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C0 00 00 00 00 00 00   119 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C8 00 00 00 00 00 00   120 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D0 00 00 00 00 00 00   121 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D8 00 00 00 00 00 00   122 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E0 00 00 00 00 00 00   123 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E8 00 00 00 00 00 00   124 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F0 00 00 00 00 00 00   125 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F8 00 00 00 00 00 00   126 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            127 	.area _CSEG (REL, CON) 
                            128 ;src/game.c:67: void delay(u32 cycles) {
                            129 ;	---------------------------------
                            130 ; Function delay
                            131 ; ---------------------------------
   594D                     132 _delay::
                            133 ;src/game.c:69: for (i = 0; i < cycles; i++) {
   594D 01 00 00      [10]  134 	ld	bc,#0x0000
   5950 11 00 00      [10]  135 	ld	de,#0x0000
   5953                     136 00103$:
   5953 21 02 00      [10]  137 	ld	hl,#2
   5956 39            [11]  138 	add	hl,sp
   5957 79            [ 4]  139 	ld	a,c
   5958 96            [ 7]  140 	sub	a, (hl)
   5959 78            [ 4]  141 	ld	a,b
   595A 23            [ 6]  142 	inc	hl
   595B 9E            [ 7]  143 	sbc	a, (hl)
   595C 7B            [ 4]  144 	ld	a,e
   595D 23            [ 6]  145 	inc	hl
   595E 9E            [ 7]  146 	sbc	a, (hl)
   595F 7A            [ 4]  147 	ld	a,d
   5960 23            [ 6]  148 	inc	hl
   5961 9E            [ 7]  149 	sbc	a, (hl)
   5962 D0            [11]  150 	ret	NC
                            151 ;src/game.c:72: __endasm;
   5963 76            [ 4]  152 	halt
                            153 ;src/game.c:69: for (i = 0; i < cycles; i++) {
   5964 0C            [ 4]  154 	inc	c
   5965 20 EC         [12]  155 	jr	NZ,00103$
   5967 04            [ 4]  156 	inc	b
   5968 20 E9         [12]  157 	jr	NZ,00103$
   596A 1C            [ 4]  158 	inc	e
   596B 20 E6         [12]  159 	jr	NZ,00103$
   596D 14            [ 4]  160 	inc	d
   596E 18 E3         [12]  161 	jr	00103$
   5970                     162 _cards:
   5970 FA 40               163 	.dw _hc_figures_0
   5972 FA 40               164 	.dw _hc_figures_0
   5974 2C 41               165 	.dw _hc_figures_1
   5976 5E 41               166 	.dw _hc_figures_2
   5978 90 41               167 	.dw _hc_figures_3
                            168 ;src/game.c:77: void initGame() {
                            169 ;	---------------------------------
                            170 ; Function initGame
                            171 ; ---------------------------------
   597A                     172 _initGame::
                            173 ;src/game.c:78: abort = 0;
   597A 21 83 58      [10]  174 	ld	hl,#_abort + 0
   597D 36 00         [10]  175 	ld	(hl), #0x00
                            176 ;src/game.c:80: user.x = 0;
   597F 21 7C 58      [10]  177 	ld	hl,#_user
   5982 36 00         [10]  178 	ld	(hl),#0x00
                            179 ;src/game.c:81: user.y = 0;
   5984 21 7D 58      [10]  180 	ld	hl,#(_user + 0x0001)
   5987 36 00         [10]  181 	ld	(hl),#0x00
                            182 ;src/game.c:82: user.px = 0;
   5989 21 7E 58      [10]  183 	ld	hl,#(_user + 0x0002)
   598C 36 00         [10]  184 	ld	(hl),#0x00
                            185 ;src/game.c:83: user.py = 0;
   598E 21 7F 58      [10]  186 	ld	hl,#(_user + 0x0003)
   5991 36 00         [10]  187 	ld	(hl),#0x00
                            188 ;src/game.c:84: user.moved = 0;
   5993 21 80 58      [10]  189 	ld	hl,#(_user + 0x0004)
   5996 36 00         [10]  190 	ld	(hl),#0x00
                            191 ;src/game.c:85: user.buffer = tile_buffer_0;
   5998 21 85 58      [10]  192 	ld	hl,#_tile_buffer_0
   599B 22 81 58      [16]  193 	ld	((_user + 0x0005)), hl
                            194 ;src/game.c:87: keys.up    = Key_CursorUp;
   599E 21 00 01      [10]  195 	ld	hl,#0x0100
   59A1 22 6E 58      [16]  196 	ld	(_keys), hl
                            197 ;src/game.c:88: keys.down  = Key_CursorDown;
   59A4 26 04         [ 7]  198 	ld	h, #0x04
   59A6 22 70 58      [16]  199 	ld	((_keys + 0x0002)), hl
                            200 ;src/game.c:89: keys.left  = Key_CursorLeft;
   59A9 21 01 01      [10]  201 	ld	hl,#0x0101
   59AC 22 72 58      [16]  202 	ld	((_keys + 0x0004)), hl
                            203 ;src/game.c:90: keys.right = Key_CursorRight;
   59AF 21 00 02      [10]  204 	ld	hl,#0x0200
   59B2 22 74 58      [16]  205 	ld	((_keys + 0x0006)), hl
                            206 ;src/game.c:91: keys.fire  = Key_Space;
   59B5 21 05 80      [10]  207 	ld	hl,#0x8005
   59B8 22 76 58      [16]  208 	ld	((_keys + 0x0008)), hl
                            209 ;src/game.c:92: keys.pause = Key_Del;
   59BB 2E 09         [ 7]  210 	ld	l, #0x09
   59BD 22 78 58      [16]  211 	ld	((_keys + 0x000a)), hl
                            212 ;src/game.c:93: keys.abort = Key_Esc;
   59C0 21 08 04      [10]  213 	ld	hl,#0x0408
   59C3 22 7A 58      [16]  214 	ld	((_keys + 0x000c)), hl
   59C6 C9            [10]  215 	ret
                            216 ;src/game.c:96: void drawScreen() {
                            217 ;	---------------------------------
                            218 ; Function drawScreen
                            219 ; ---------------------------------
   59C7                     220 _drawScreen::
                            221 ;src/game.c:99: for (j = 0; j < TABLE_HEIGHT; j++) {
   59C7 0E 00         [ 7]  222 	ld	c,#0x00
   59C9                     223 00106$:
                            224 ;src/game.c:100: for (i = 0; i < TABLE_WIDTH; i++) {
   59C9 06 08         [ 7]  225 	ld	b,#0x08
   59CB                     226 00105$:
   59CB 58            [ 4]  227 	ld	e,b
   59CC 1D            [ 4]  228 	dec	e
   59CD 7B            [ 4]  229 	ld	a,e
   59CE 47            [ 4]  230 	ld	b,a
   59CF B7            [ 4]  231 	or	a, a
   59D0 20 F9         [12]  232 	jr	NZ,00105$
                            233 ;src/game.c:99: for (j = 0; j < TABLE_HEIGHT; j++) {
   59D2 0C            [ 4]  234 	inc	c
   59D3 79            [ 4]  235 	ld	a,c
   59D4 D6 06         [ 7]  236 	sub	a, #0x06
   59D6 38 F1         [12]  237 	jr	C,00106$
   59D8 C9            [10]  238 	ret
                            239 ;src/game.c:105: void insertCardUser(u8 col) {
                            240 ;	---------------------------------
                            241 ; Function insertCardUser
                            242 ; ---------------------------------
   59D9                     243 _insertCardUser::
   59D9 DD E5         [15]  244 	push	ix
   59DB DD 21 00 00   [14]  245 	ld	ix,#0
   59DF DD 39         [15]  246 	add	ix,sp
   59E1 21 F6 FF      [10]  247 	ld	hl,#-10
   59E4 39            [11]  248 	add	hl,sp
   59E5 F9            [ 6]  249 	ld	sp,hl
                            250 ;src/game.c:108: u8 stopped = 0;
   59E6 DD 36 F7 00   [19]  251 	ld	-9 (ix),#0x00
                            252 ;src/game.c:111: row = 5;
   59EA DD 36 F8 05   [19]  253 	ld	-8 (ix),#0x05
                            254 ;src/game.c:112: card = (cpct_rand() / 64) + 1;
   59EE CD D8 54      [17]  255 	call	_cpct_getRandom_mxor_u8
   59F1 7D            [ 4]  256 	ld	a,l
   59F2 07            [ 4]  257 	rlca
   59F3 07            [ 4]  258 	rlca
   59F4 E6 03         [ 7]  259 	and	a,#0x03
   59F6 3C            [ 4]  260 	inc	a
   59F7 DD 77 F6      [19]  261 	ld	-10 (ix),a
                            262 ;src/game.c:114: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X + (col * (TILE_W + 1)), USER_TABLE_Y + (row * (TILE_H + 2)));
   59FA DD 7E 04      [19]  263 	ld	a,4 (ix)
   59FD 4F            [ 4]  264 	ld	c,a
   59FE 87            [ 4]  265 	add	a, a
   59FF 81            [ 4]  266 	add	a, c
   5A00 87            [ 4]  267 	add	a, a
   5A01 C6 02         [ 7]  268 	add	a, #0x02
   5A03 DD 77 FF      [19]  269 	ld	-1 (ix),a
   5A06 3E 98         [ 7]  270 	ld	a,#0x98
   5A08 F5            [11]  271 	push	af
   5A09 33            [ 6]  272 	inc	sp
   5A0A DD 7E FF      [19]  273 	ld	a,-1 (ix)
   5A0D F5            [11]  274 	push	af
   5A0E 33            [ 6]  275 	inc	sp
   5A0F 21 00 C0      [10]  276 	ld	hl,#0xC000
   5A12 E5            [11]  277 	push	hl
   5A13 CD 14 57      [17]  278 	call	_cpct_getScreenPtr
   5A16 EB            [ 4]  279 	ex	de,hl
                            280 ;src/game.c:115: cpc_GetSp((u8*) tile_buffer_1, 10, 5, (int) pvmem);
   5A17 4B            [ 4]  281 	ld	c, e
   5A18 42            [ 4]  282 	ld	b, d
   5A19 D5            [11]  283 	push	de
   5A1A C5            [11]  284 	push	bc
   5A1B 21 0A 05      [10]  285 	ld	hl,#0x050A
   5A1E E5            [11]  286 	push	hl
   5A1F 21 B7 58      [10]  287 	ld	hl,#_tile_buffer_1
   5A22 E5            [11]  288 	push	hl
   5A23 CD 38 53      [17]  289 	call	_cpc_GetSp
   5A26 D1            [10]  290 	pop	de
                            291 ;src/game.c:116: cpct_drawSpriteMaskedAlignedTable(cards[card], pvmem, TILE_W, TILE_H, hc_tablatrans);
   5A27 01 70 59      [10]  292 	ld	bc,#_cards+0
   5A2A DD 6E F6      [19]  293 	ld	l,-10 (ix)
   5A2D 26 00         [ 7]  294 	ld	h,#0x00
   5A2F 29            [11]  295 	add	hl, hl
   5A30 09            [11]  296 	add	hl,bc
   5A31 DD 75 FD      [19]  297 	ld	-3 (ix),l
   5A34 DD 74 FE      [19]  298 	ld	-2 (ix),h
   5A37 DD 6E FD      [19]  299 	ld	l,-3 (ix)
   5A3A DD 66 FE      [19]  300 	ld	h,-2 (ix)
   5A3D 4E            [ 7]  301 	ld	c,(hl)
   5A3E 23            [ 6]  302 	inc	hl
   5A3F 46            [ 7]  303 	ld	b,(hl)
   5A40 21 00 01      [10]  304 	ld	hl,#_hc_tablatrans
   5A43 E5            [11]  305 	push	hl
   5A44 21 05 0A      [10]  306 	ld	hl,#0x0A05
   5A47 E5            [11]  307 	push	hl
   5A48 D5            [11]  308 	push	de
   5A49 C5            [11]  309 	push	bc
   5A4A CD 34 57      [17]  310 	call	_cpct_drawSpriteMaskedAlignedTable
                            311 ;src/game.c:118: while (!stopped) {
   5A4D 01 0E 58      [10]  312 	ld	bc,#_userTable+0
   5A50 DD 5E 04      [19]  313 	ld	e,4 (ix)
   5A53 16 00         [ 7]  314 	ld	d,#0x00
   5A55 6B            [ 4]  315 	ld	l, e
   5A56 62            [ 4]  316 	ld	h, d
   5A57 29            [11]  317 	add	hl, hl
   5A58 19            [11]  318 	add	hl, de
   5A59 29            [11]  319 	add	hl, hl
   5A5A 09            [11]  320 	add	hl,bc
   5A5B DD 75 FB      [19]  321 	ld	-5 (ix),l
   5A5E DD 74 FC      [19]  322 	ld	-4 (ix),h
   5A61 DD 7E FB      [19]  323 	ld	a,-5 (ix)
   5A64 DD 77 F9      [19]  324 	ld	-7 (ix),a
   5A67 DD 7E FC      [19]  325 	ld	a,-4 (ix)
   5A6A DD 77 FA      [19]  326 	ld	-6 (ix),a
   5A6D                     327 00107$:
   5A6D DD 7E F7      [19]  328 	ld	a,-9 (ix)
   5A70 B7            [ 4]  329 	or	a, a
   5A71 C2 17 5B      [10]  330 	jp	NZ,00109$
                            331 ;src/game.c:119: delay(10);
   5A74 21 00 00      [10]  332 	ld	hl,#0x0000
   5A77 E5            [11]  333 	push	hl
   5A78 21 0A 00      [10]  334 	ld	hl,#0x000A
   5A7B E5            [11]  335 	push	hl
   5A7C CD 4D 59      [17]  336 	call	_delay
   5A7F F1            [10]  337 	pop	af
   5A80 F1            [10]  338 	pop	af
                            339 ;src/game.c:120: if ((row > 0) && (userTable[col][row - 1] == 0)) {
   5A81 DD 7E F8      [19]  340 	ld	a,-8 (ix)
   5A84 B7            [ 4]  341 	or	a, a
   5A85 CA 10 5B      [10]  342 	jp	Z,00104$
   5A88 DD 4E F8      [19]  343 	ld	c,-8 (ix)
   5A8B 0D            [ 4]  344 	dec	c
   5A8C DD 6E F9      [19]  345 	ld	l,-7 (ix)
   5A8F DD 66 FA      [19]  346 	ld	h,-6 (ix)
   5A92 06 00         [ 7]  347 	ld	b,#0x00
   5A94 09            [11]  348 	add	hl, bc
   5A95 7E            [ 7]  349 	ld	a,(hl)
   5A96 B7            [ 4]  350 	or	a, a
   5A97 20 77         [12]  351 	jr	NZ,00104$
                            352 ;src/game.c:121: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X + (col * (TILE_W + 1)), USER_TABLE_Y + (row * (TILE_H + 2)));
   5A99 DD 7E F8      [19]  353 	ld	a,-8 (ix)
   5A9C 5F            [ 4]  354 	ld	e,a
   5A9D 87            [ 4]  355 	add	a, a
   5A9E 83            [ 4]  356 	add	a, e
   5A9F 87            [ 4]  357 	add	a, a
   5AA0 87            [ 4]  358 	add	a, a
   5AA1 C6 5C         [ 7]  359 	add	a, #0x5C
   5AA3 47            [ 4]  360 	ld	b,a
   5AA4 C5            [11]  361 	push	bc
   5AA5 C5            [11]  362 	push	bc
   5AA6 33            [ 6]  363 	inc	sp
   5AA7 DD 7E FF      [19]  364 	ld	a,-1 (ix)
   5AAA F5            [11]  365 	push	af
   5AAB 33            [ 6]  366 	inc	sp
   5AAC 21 00 C0      [10]  367 	ld	hl,#0xC000
   5AAF E5            [11]  368 	push	hl
   5AB0 CD 14 57      [17]  369 	call	_cpct_getScreenPtr
   5AB3 EB            [ 4]  370 	ex	de,hl
   5AB4 21 05 0A      [10]  371 	ld	hl,#0x0A05
   5AB7 E5            [11]  372 	push	hl
   5AB8 D5            [11]  373 	push	de
   5AB9 21 B7 58      [10]  374 	ld	hl,#_tile_buffer_1
   5ABC E5            [11]  375 	push	hl
   5ABD CD 08 54      [17]  376 	call	_cpct_drawSprite
   5AC0 C1            [10]  377 	pop	bc
                            378 ;src/game.c:123: row--;
                            379 ;src/game.c:124: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X + (col * (TILE_W + 1)), USER_TABLE_Y + (row * (TILE_H + 2)));
   5AC1 DD 71 F8      [19]  380 	ld	-8 (ix), c
   5AC4 79            [ 4]  381 	ld	a,c
   5AC5 87            [ 4]  382 	add	a, a
   5AC6 81            [ 4]  383 	add	a, c
   5AC7 87            [ 4]  384 	add	a, a
   5AC8 87            [ 4]  385 	add	a, a
   5AC9 C6 5C         [ 7]  386 	add	a, #0x5C
   5ACB 47            [ 4]  387 	ld	b,a
   5ACC C5            [11]  388 	push	bc
   5ACD 33            [ 6]  389 	inc	sp
   5ACE DD 7E FF      [19]  390 	ld	a,-1 (ix)
   5AD1 F5            [11]  391 	push	af
   5AD2 33            [ 6]  392 	inc	sp
   5AD3 21 00 C0      [10]  393 	ld	hl,#0xC000
   5AD6 E5            [11]  394 	push	hl
   5AD7 CD 14 57      [17]  395 	call	_cpct_getScreenPtr
   5ADA 4D            [ 4]  396 	ld	c,l
   5ADB 44            [ 4]  397 	ld	b,h
                            398 ;src/game.c:125: cpc_GetSp((u8*) tile_buffer_1, 10, 5, (int) pvmem);
   5ADC 59            [ 4]  399 	ld	e, c
   5ADD 50            [ 4]  400 	ld	d, b
   5ADE C5            [11]  401 	push	bc
   5ADF D5            [11]  402 	push	de
   5AE0 21 0A 05      [10]  403 	ld	hl,#0x050A
   5AE3 E5            [11]  404 	push	hl
   5AE4 21 B7 58      [10]  405 	ld	hl,#_tile_buffer_1
   5AE7 E5            [11]  406 	push	hl
   5AE8 CD 38 53      [17]  407 	call	_cpc_GetSp
   5AEB C1            [10]  408 	pop	bc
                            409 ;src/game.c:126: cpct_drawSpriteMaskedAlignedTable(cards[card], pvmem, TILE_W, TILE_H, hc_tablatrans);
   5AEC DD 6E FD      [19]  410 	ld	l,-3 (ix)
   5AEF DD 66 FE      [19]  411 	ld	h,-2 (ix)
   5AF2 5E            [ 7]  412 	ld	e,(hl)
   5AF3 23            [ 6]  413 	inc	hl
   5AF4 56            [ 7]  414 	ld	d,(hl)
   5AF5 21 00 01      [10]  415 	ld	hl,#_hc_tablatrans
   5AF8 E5            [11]  416 	push	hl
   5AF9 21 05 0A      [10]  417 	ld	hl,#0x0A05
   5AFC E5            [11]  418 	push	hl
   5AFD C5            [11]  419 	push	bc
   5AFE D5            [11]  420 	push	de
   5AFF CD 34 57      [17]  421 	call	_cpct_drawSpriteMaskedAlignedTable
                            422 ;src/game.c:127: if (row == 0)
   5B02 DD 7E F8      [19]  423 	ld	a,-8 (ix)
   5B05 B7            [ 4]  424 	or	a, a
   5B06 C2 6D 5A      [10]  425 	jp	NZ,00107$
                            426 ;src/game.c:128: stopped = 1;
   5B09 DD 36 F7 01   [19]  427 	ld	-9 (ix),#0x01
   5B0D C3 6D 5A      [10]  428 	jp	00107$
   5B10                     429 00104$:
                            430 ;src/game.c:130: stopped = 1;
   5B10 DD 36 F7 01   [19]  431 	ld	-9 (ix),#0x01
   5B14 C3 6D 5A      [10]  432 	jp	00107$
   5B17                     433 00109$:
                            434 ;src/game.c:133: userTable[col][row] = card;
   5B17 DD 7E FB      [19]  435 	ld	a,-5 (ix)
   5B1A DD 86 F8      [19]  436 	add	a, -8 (ix)
   5B1D 4F            [ 4]  437 	ld	c,a
   5B1E DD 7E FC      [19]  438 	ld	a,-4 (ix)
   5B21 CE 00         [ 7]  439 	adc	a, #0x00
   5B23 47            [ 4]  440 	ld	b,a
   5B24 DD 7E F6      [19]  441 	ld	a,-10 (ix)
   5B27 02            [ 7]  442 	ld	(bc),a
   5B28 DD F9         [10]  443 	ld	sp, ix
   5B2A DD E1         [14]  444 	pop	ix
   5B2C C9            [10]  445 	ret
                            446 ;src/game.c:136: void insertCardEnemy(u8 col) {
                            447 ;	---------------------------------
                            448 ; Function insertCardEnemy
                            449 ; ---------------------------------
   5B2D                     450 _insertCardEnemy::
   5B2D DD E5         [15]  451 	push	ix
   5B2F DD 21 00 00   [14]  452 	ld	ix,#0
   5B33 DD 39         [15]  453 	add	ix,sp
   5B35 21 F6 FF      [10]  454 	ld	hl,#-10
   5B38 39            [11]  455 	add	hl,sp
   5B39 F9            [ 6]  456 	ld	sp,hl
                            457 ;src/game.c:139: u8 stopped = 0;
   5B3A DD 36 F7 00   [19]  458 	ld	-9 (ix),#0x00
                            459 ;src/game.c:142: row = 0;
   5B3E DD 36 F8 00   [19]  460 	ld	-8 (ix),#0x00
                            461 ;src/game.c:143: card = (cpct_rand() / 64) + 1;
   5B42 CD D8 54      [17]  462 	call	_cpct_getRandom_mxor_u8
   5B45 7D            [ 4]  463 	ld	a,l
   5B46 07            [ 4]  464 	rlca
   5B47 07            [ 4]  465 	rlca
   5B48 E6 03         [ 7]  466 	and	a,#0x03
   5B4A 3C            [ 4]  467 	inc	a
   5B4B DD 77 F6      [19]  468 	ld	-10 (ix),a
                            469 ;src/game.c:145: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, ENEMY_TABLE_X + (col * (TILE_W + 1)), ENEMY_TABLE_Y + (row * (TILE_H + 2)));
   5B4E DD 7E 04      [19]  470 	ld	a,4 (ix)
   5B51 4F            [ 4]  471 	ld	c,a
   5B52 87            [ 4]  472 	add	a, a
   5B53 81            [ 4]  473 	add	a, c
   5B54 87            [ 4]  474 	add	a, a
   5B55 C6 02         [ 7]  475 	add	a, #0x02
   5B57 DD 77 FF      [19]  476 	ld	-1 (ix),a
   5B5A 3E 02         [ 7]  477 	ld	a,#0x02
   5B5C F5            [11]  478 	push	af
   5B5D 33            [ 6]  479 	inc	sp
   5B5E DD 7E FF      [19]  480 	ld	a,-1 (ix)
   5B61 F5            [11]  481 	push	af
   5B62 33            [ 6]  482 	inc	sp
   5B63 21 00 C0      [10]  483 	ld	hl,#0xC000
   5B66 E5            [11]  484 	push	hl
   5B67 CD 14 57      [17]  485 	call	_cpct_getScreenPtr
   5B6A EB            [ 4]  486 	ex	de,hl
                            487 ;src/game.c:146: cpc_GetSp((u8*) tile_buffer_1, 10, 5, (int) pvmem);
   5B6B 4B            [ 4]  488 	ld	c, e
   5B6C 42            [ 4]  489 	ld	b, d
   5B6D D5            [11]  490 	push	de
   5B6E C5            [11]  491 	push	bc
   5B6F 21 0A 05      [10]  492 	ld	hl,#0x050A
   5B72 E5            [11]  493 	push	hl
   5B73 21 B7 58      [10]  494 	ld	hl,#_tile_buffer_1
   5B76 E5            [11]  495 	push	hl
   5B77 CD 38 53      [17]  496 	call	_cpc_GetSp
   5B7A D1            [10]  497 	pop	de
                            498 ;src/game.c:147: cpct_drawSpriteMaskedAlignedTable(cards[card], pvmem, TILE_W, TILE_H, hc_tablatrans);
   5B7B 01 70 59      [10]  499 	ld	bc,#_cards+0
   5B7E DD 6E F6      [19]  500 	ld	l,-10 (ix)
   5B81 26 00         [ 7]  501 	ld	h,#0x00
   5B83 29            [11]  502 	add	hl, hl
   5B84 09            [11]  503 	add	hl,bc
   5B85 DD 75 FD      [19]  504 	ld	-3 (ix),l
   5B88 DD 74 FE      [19]  505 	ld	-2 (ix),h
   5B8B DD 6E FD      [19]  506 	ld	l,-3 (ix)
   5B8E DD 66 FE      [19]  507 	ld	h,-2 (ix)
   5B91 4E            [ 7]  508 	ld	c,(hl)
   5B92 23            [ 6]  509 	inc	hl
   5B93 46            [ 7]  510 	ld	b,(hl)
   5B94 21 00 01      [10]  511 	ld	hl,#_hc_tablatrans
   5B97 E5            [11]  512 	push	hl
   5B98 21 05 0A      [10]  513 	ld	hl,#0x0A05
   5B9B E5            [11]  514 	push	hl
   5B9C D5            [11]  515 	push	de
   5B9D C5            [11]  516 	push	bc
   5B9E CD 34 57      [17]  517 	call	_cpct_drawSpriteMaskedAlignedTable
                            518 ;src/game.c:149: while (!stopped) {
   5BA1 01 3E 58      [10]  519 	ld	bc,#_enemyTable+0
   5BA4 DD 5E 04      [19]  520 	ld	e,4 (ix)
   5BA7 16 00         [ 7]  521 	ld	d,#0x00
   5BA9 6B            [ 4]  522 	ld	l, e
   5BAA 62            [ 4]  523 	ld	h, d
   5BAB 29            [11]  524 	add	hl, hl
   5BAC 19            [11]  525 	add	hl, de
   5BAD 29            [11]  526 	add	hl, hl
   5BAE 09            [11]  527 	add	hl,bc
   5BAF DD 75 FB      [19]  528 	ld	-5 (ix),l
   5BB2 DD 74 FC      [19]  529 	ld	-4 (ix),h
   5BB5 DD 7E FB      [19]  530 	ld	a,-5 (ix)
   5BB8 DD 77 F9      [19]  531 	ld	-7 (ix),a
   5BBB DD 7E FC      [19]  532 	ld	a,-4 (ix)
   5BBE DD 77 FA      [19]  533 	ld	-6 (ix),a
   5BC1                     534 00107$:
   5BC1 DD 7E F7      [19]  535 	ld	a,-9 (ix)
   5BC4 B7            [ 4]  536 	or	a, a
   5BC5 C2 6D 5C      [10]  537 	jp	NZ,00109$
                            538 ;src/game.c:150: delay(10);
   5BC8 21 00 00      [10]  539 	ld	hl,#0x0000
   5BCB E5            [11]  540 	push	hl
   5BCC 21 0A 00      [10]  541 	ld	hl,#0x000A
   5BCF E5            [11]  542 	push	hl
   5BD0 CD 4D 59      [17]  543 	call	_delay
   5BD3 F1            [10]  544 	pop	af
   5BD4 F1            [10]  545 	pop	af
                            546 ;src/game.c:151: if ((row < 5) && (enemyTable[col][row + 1] == 0)) {
   5BD5 DD 7E F8      [19]  547 	ld	a,-8 (ix)
   5BD8 D6 05         [ 7]  548 	sub	a, #0x05
   5BDA D2 66 5C      [10]  549 	jp	NC,00104$
   5BDD DD 4E F8      [19]  550 	ld	c,-8 (ix)
   5BE0 0C            [ 4]  551 	inc	c
   5BE1 DD 6E F9      [19]  552 	ld	l,-7 (ix)
   5BE4 DD 66 FA      [19]  553 	ld	h,-6 (ix)
   5BE7 06 00         [ 7]  554 	ld	b,#0x00
   5BE9 09            [11]  555 	add	hl, bc
   5BEA 7E            [ 7]  556 	ld	a,(hl)
   5BEB B7            [ 4]  557 	or	a, a
   5BEC 20 78         [12]  558 	jr	NZ,00104$
                            559 ;src/game.c:152: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, ENEMY_TABLE_X + (col * (TILE_W + 1)), ENEMY_TABLE_Y + (row * (TILE_H + 2)));
   5BEE DD 7E F8      [19]  560 	ld	a,-8 (ix)
   5BF1 5F            [ 4]  561 	ld	e,a
   5BF2 87            [ 4]  562 	add	a, a
   5BF3 83            [ 4]  563 	add	a, e
   5BF4 87            [ 4]  564 	add	a, a
   5BF5 87            [ 4]  565 	add	a, a
   5BF6 47            [ 4]  566 	ld	b,a
   5BF7 04            [ 4]  567 	inc	b
   5BF8 04            [ 4]  568 	inc	b
   5BF9 C5            [11]  569 	push	bc
   5BFA C5            [11]  570 	push	bc
   5BFB 33            [ 6]  571 	inc	sp
   5BFC DD 7E FF      [19]  572 	ld	a,-1 (ix)
   5BFF F5            [11]  573 	push	af
   5C00 33            [ 6]  574 	inc	sp
   5C01 21 00 C0      [10]  575 	ld	hl,#0xC000
   5C04 E5            [11]  576 	push	hl
   5C05 CD 14 57      [17]  577 	call	_cpct_getScreenPtr
   5C08 EB            [ 4]  578 	ex	de,hl
   5C09 21 05 0A      [10]  579 	ld	hl,#0x0A05
   5C0C E5            [11]  580 	push	hl
   5C0D D5            [11]  581 	push	de
   5C0E 21 B7 58      [10]  582 	ld	hl,#_tile_buffer_1
   5C11 E5            [11]  583 	push	hl
   5C12 CD 08 54      [17]  584 	call	_cpct_drawSprite
   5C15 C1            [10]  585 	pop	bc
                            586 ;src/game.c:154: row++;
                            587 ;src/game.c:155: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, ENEMY_TABLE_X + (col * (TILE_W + 1)), ENEMY_TABLE_Y + (row * (TILE_H + 2)));
   5C16 DD 71 F8      [19]  588 	ld	-8 (ix), c
   5C19 79            [ 4]  589 	ld	a,c
   5C1A 87            [ 4]  590 	add	a, a
   5C1B 81            [ 4]  591 	add	a, c
   5C1C 87            [ 4]  592 	add	a, a
   5C1D 87            [ 4]  593 	add	a, a
   5C1E 47            [ 4]  594 	ld	b,a
   5C1F 04            [ 4]  595 	inc	b
   5C20 04            [ 4]  596 	inc	b
   5C21 C5            [11]  597 	push	bc
   5C22 33            [ 6]  598 	inc	sp
   5C23 DD 7E FF      [19]  599 	ld	a,-1 (ix)
   5C26 F5            [11]  600 	push	af
   5C27 33            [ 6]  601 	inc	sp
   5C28 21 00 C0      [10]  602 	ld	hl,#0xC000
   5C2B E5            [11]  603 	push	hl
   5C2C CD 14 57      [17]  604 	call	_cpct_getScreenPtr
   5C2F 4D            [ 4]  605 	ld	c,l
   5C30 44            [ 4]  606 	ld	b,h
                            607 ;src/game.c:156: cpc_GetSp((u8*) tile_buffer_1, 10, 5, (int) pvmem);
   5C31 59            [ 4]  608 	ld	e, c
   5C32 50            [ 4]  609 	ld	d, b
   5C33 C5            [11]  610 	push	bc
   5C34 D5            [11]  611 	push	de
   5C35 21 0A 05      [10]  612 	ld	hl,#0x050A
   5C38 E5            [11]  613 	push	hl
   5C39 21 B7 58      [10]  614 	ld	hl,#_tile_buffer_1
   5C3C E5            [11]  615 	push	hl
   5C3D CD 38 53      [17]  616 	call	_cpc_GetSp
   5C40 C1            [10]  617 	pop	bc
                            618 ;src/game.c:157: cpct_drawSpriteMaskedAlignedTable(cards[card], pvmem, TILE_W, TILE_H, hc_tablatrans);
   5C41 DD 6E FD      [19]  619 	ld	l,-3 (ix)
   5C44 DD 66 FE      [19]  620 	ld	h,-2 (ix)
   5C47 5E            [ 7]  621 	ld	e,(hl)
   5C48 23            [ 6]  622 	inc	hl
   5C49 56            [ 7]  623 	ld	d,(hl)
   5C4A 21 00 01      [10]  624 	ld	hl,#_hc_tablatrans
   5C4D E5            [11]  625 	push	hl
   5C4E 21 05 0A      [10]  626 	ld	hl,#0x0A05
   5C51 E5            [11]  627 	push	hl
   5C52 C5            [11]  628 	push	bc
   5C53 D5            [11]  629 	push	de
   5C54 CD 34 57      [17]  630 	call	_cpct_drawSpriteMaskedAlignedTable
                            631 ;src/game.c:158: if (row == 5)
   5C57 DD 7E F8      [19]  632 	ld	a,-8 (ix)
   5C5A D6 05         [ 7]  633 	sub	a, #0x05
   5C5C C2 C1 5B      [10]  634 	jp	NZ,00107$
                            635 ;src/game.c:159: stopped = 1;
   5C5F DD 36 F7 01   [19]  636 	ld	-9 (ix),#0x01
   5C63 C3 C1 5B      [10]  637 	jp	00107$
   5C66                     638 00104$:
                            639 ;src/game.c:161: stopped = 1;
   5C66 DD 36 F7 01   [19]  640 	ld	-9 (ix),#0x01
   5C6A C3 C1 5B      [10]  641 	jp	00107$
   5C6D                     642 00109$:
                            643 ;src/game.c:164: enemyTable[col][row] = card;
   5C6D DD 7E FB      [19]  644 	ld	a,-5 (ix)
   5C70 DD 86 F8      [19]  645 	add	a, -8 (ix)
   5C73 4F            [ 4]  646 	ld	c,a
   5C74 DD 7E FC      [19]  647 	ld	a,-4 (ix)
   5C77 CE 00         [ 7]  648 	adc	a, #0x00
   5C79 47            [ 4]  649 	ld	b,a
   5C7A DD 7E F6      [19]  650 	ld	a,-10 (ix)
   5C7D 02            [ 7]  651 	ld	(bc),a
   5C7E DD F9         [10]  652 	ld	sp, ix
   5C80 DD E1         [14]  653 	pop	ix
   5C82 C9            [10]  654 	ret
                            655 ;src/game.c:167: void newHand(u8 side) {
                            656 ;	---------------------------------
                            657 ; Function newHand
                            658 ; ---------------------------------
   5C83                     659 _newHand::
   5C83 DD E5         [15]  660 	push	ix
   5C85 DD 21 00 00   [14]  661 	ld	ix,#0
   5C89 DD 39         [15]  662 	add	ix,sp
   5C8B 3B            [ 6]  663 	dec	sp
                            664 ;src/game.c:171: for (i = 0; i < 8; i++) {
   5C8C DD 36 FF 00   [19]  665 	ld	-1 (ix),#0x00
   5C90                     666 00111$:
                            667 ;src/game.c:172: if (side) {
   5C90 DD 7E 04      [19]  668 	ld	a,4 (ix)
   5C93 B7            [ 4]  669 	or	a, a
   5C94 28 32         [12]  670 	jr	Z,00108$
                            671 ;src/game.c:173: col = (cpct_rand() / 32);
   5C96 CD D8 54      [17]  672 	call	_cpct_getRandom_mxor_u8
   5C99 7D            [ 4]  673 	ld	a,l
   5C9A 07            [ 4]  674 	rlca
   5C9B 07            [ 4]  675 	rlca
   5C9C 07            [ 4]  676 	rlca
   5C9D E6 07         [ 7]  677 	and	a,#0x07
   5C9F 4F            [ 4]  678 	ld	c,a
                            679 ;src/game.c:174: while (userTable[col][5] != 0) {
   5CA0                     680 00101$:
   5CA0 06 00         [ 7]  681 	ld	b,#0x00
   5CA2 69            [ 4]  682 	ld	l, c
   5CA3 60            [ 4]  683 	ld	h, b
   5CA4 29            [11]  684 	add	hl, hl
   5CA5 09            [11]  685 	add	hl, bc
   5CA6 29            [11]  686 	add	hl, hl
   5CA7 11 0E 58      [10]  687 	ld	de,#_userTable
   5CAA 19            [11]  688 	add	hl,de
   5CAB 11 05 00      [10]  689 	ld	de, #0x0005
   5CAE 19            [11]  690 	add	hl, de
   5CAF 7E            [ 7]  691 	ld	a,(hl)
   5CB0 B7            [ 4]  692 	or	a, a
   5CB1 28 0C         [12]  693 	jr	Z,00103$
                            694 ;src/game.c:175: col = (cpct_rand() / 32);
   5CB3 CD D8 54      [17]  695 	call	_cpct_getRandom_mxor_u8
   5CB6 7D            [ 4]  696 	ld	a,l
   5CB7 07            [ 4]  697 	rlca
   5CB8 07            [ 4]  698 	rlca
   5CB9 07            [ 4]  699 	rlca
   5CBA E6 07         [ 7]  700 	and	a,#0x07
   5CBC 4F            [ 4]  701 	ld	c,a
   5CBD 18 E1         [12]  702 	jr	00101$
   5CBF                     703 00103$:
                            704 ;src/game.c:177: insertCardUser(col);
   5CBF 79            [ 4]  705 	ld	a,c
   5CC0 F5            [11]  706 	push	af
   5CC1 33            [ 6]  707 	inc	sp
   5CC2 CD D9 59      [17]  708 	call	_insertCardUser
   5CC5 33            [ 6]  709 	inc	sp
   5CC6 18 2C         [12]  710 	jr	00112$
   5CC8                     711 00108$:
                            712 ;src/game.c:179: col = (cpct_rand() / 32);
   5CC8 CD D8 54      [17]  713 	call	_cpct_getRandom_mxor_u8
   5CCB 7D            [ 4]  714 	ld	a,l
   5CCC 07            [ 4]  715 	rlca
   5CCD 07            [ 4]  716 	rlca
   5CCE 07            [ 4]  717 	rlca
   5CCF E6 07         [ 7]  718 	and	a,#0x07
   5CD1 47            [ 4]  719 	ld	b,a
                            720 ;src/game.c:180: while (enemyTable[col][0] != 0) {
   5CD2                     721 00104$:
   5CD2 58            [ 4]  722 	ld	e,b
   5CD3 16 00         [ 7]  723 	ld	d,#0x00
   5CD5 6B            [ 4]  724 	ld	l, e
   5CD6 62            [ 4]  725 	ld	h, d
   5CD7 29            [11]  726 	add	hl, hl
   5CD8 19            [11]  727 	add	hl, de
   5CD9 29            [11]  728 	add	hl, hl
   5CDA 11 3E 58      [10]  729 	ld	de,#_enemyTable
   5CDD 19            [11]  730 	add	hl,de
   5CDE 7E            [ 7]  731 	ld	a,(hl)
   5CDF B7            [ 4]  732 	or	a, a
   5CE0 28 0C         [12]  733 	jr	Z,00106$
                            734 ;src/game.c:181: col = (cpct_rand() / 32);
   5CE2 CD D8 54      [17]  735 	call	_cpct_getRandom_mxor_u8
   5CE5 7D            [ 4]  736 	ld	a,l
   5CE6 07            [ 4]  737 	rlca
   5CE7 07            [ 4]  738 	rlca
   5CE8 07            [ 4]  739 	rlca
   5CE9 E6 07         [ 7]  740 	and	a,#0x07
   5CEB 47            [ 4]  741 	ld	b,a
   5CEC 18 E4         [12]  742 	jr	00104$
   5CEE                     743 00106$:
                            744 ;src/game.c:183: insertCardEnemy(col);
   5CEE C5            [11]  745 	push	bc
   5CEF 33            [ 6]  746 	inc	sp
   5CF0 CD 2D 5B      [17]  747 	call	_insertCardEnemy
   5CF3 33            [ 6]  748 	inc	sp
   5CF4                     749 00112$:
                            750 ;src/game.c:171: for (i = 0; i < 8; i++) {
   5CF4 DD 34 FF      [23]  751 	inc	-1 (ix)
   5CF7 DD 7E FF      [19]  752 	ld	a,-1 (ix)
   5CFA D6 08         [ 7]  753 	sub	a, #0x08
   5CFC 38 92         [12]  754 	jr	C,00111$
   5CFE 33            [ 6]  755 	inc	sp
   5CFF DD E1         [14]  756 	pop	ix
   5D01 C9            [10]  757 	ret
                            758 ;src/game.c:188: void drawUser() {
                            759 ;	---------------------------------
                            760 ; Function drawUser
                            761 ; ---------------------------------
   5D02                     762 _drawUser::
                            763 ;src/game.c:195: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X + (user.px * (TILE_W + 1)), USER_TABLE_Y + (user.py * (TILE_H + 2)));
   5D02 3A 7F 58      [13]  764 	ld	a, (#(_user + 0x0003) + 0)
   5D05 4F            [ 4]  765 	ld	c,a
   5D06 87            [ 4]  766 	add	a, a
   5D07 81            [ 4]  767 	add	a, c
   5D08 87            [ 4]  768 	add	a, a
   5D09 87            [ 4]  769 	add	a, a
   5D0A C6 5C         [ 7]  770 	add	a, #0x5C
   5D0C 57            [ 4]  771 	ld	d,a
   5D0D 3A 7E 58      [13]  772 	ld	a, (#(_user + 0x0002) + 0)
   5D10 4F            [ 4]  773 	ld	c,a
   5D11 87            [ 4]  774 	add	a, a
   5D12 81            [ 4]  775 	add	a, c
   5D13 87            [ 4]  776 	add	a, a
   5D14 47            [ 4]  777 	ld	b,a
   5D15 04            [ 4]  778 	inc	b
   5D16 04            [ 4]  779 	inc	b
   5D17 D5            [11]  780 	push	de
   5D18 33            [ 6]  781 	inc	sp
   5D19 C5            [11]  782 	push	bc
   5D1A 33            [ 6]  783 	inc	sp
   5D1B 21 00 C0      [10]  784 	ld	hl,#0xC000
   5D1E E5            [11]  785 	push	hl
   5D1F CD 14 57      [17]  786 	call	_cpct_getScreenPtr
   5D22 4D            [ 4]  787 	ld	c,l
   5D23 44            [ 4]  788 	ld	b,h
                            789 ;src/game.c:196: cpct_drawSprite(tile_buffer_0, pvmem, HC_MARKER_W, HC_MARKER_H);
   5D24 21 05 0A      [10]  790 	ld	hl,#0x0A05
   5D27 E5            [11]  791 	push	hl
   5D28 C5            [11]  792 	push	bc
   5D29 21 85 58      [10]  793 	ld	hl,#_tile_buffer_0
   5D2C E5            [11]  794 	push	hl
   5D2D CD 08 54      [17]  795 	call	_cpct_drawSprite
                            796 ;src/game.c:197: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X + (user.x * (TILE_W + 1)), USER_TABLE_Y + (user.y * (TILE_H + 2)));
   5D30 3A 7D 58      [13]  797 	ld	a, (#(_user + 0x0001) + 0)
   5D33 4F            [ 4]  798 	ld	c,a
   5D34 87            [ 4]  799 	add	a, a
   5D35 81            [ 4]  800 	add	a, c
   5D36 87            [ 4]  801 	add	a, a
   5D37 87            [ 4]  802 	add	a, a
   5D38 C6 5C         [ 7]  803 	add	a, #0x5C
   5D3A 57            [ 4]  804 	ld	d,a
   5D3B 3A 7C 58      [13]  805 	ld	a, (#_user + 0)
   5D3E 4F            [ 4]  806 	ld	c,a
   5D3F 87            [ 4]  807 	add	a, a
   5D40 81            [ 4]  808 	add	a, c
   5D41 87            [ 4]  809 	add	a, a
   5D42 47            [ 4]  810 	ld	b,a
   5D43 04            [ 4]  811 	inc	b
   5D44 04            [ 4]  812 	inc	b
   5D45 D5            [11]  813 	push	de
   5D46 33            [ 6]  814 	inc	sp
   5D47 C5            [11]  815 	push	bc
   5D48 33            [ 6]  816 	inc	sp
   5D49 21 00 C0      [10]  817 	ld	hl,#0xC000
   5D4C E5            [11]  818 	push	hl
   5D4D CD 14 57      [17]  819 	call	_cpct_getScreenPtr
   5D50 4D            [ 4]  820 	ld	c,l
   5D51 44            [ 4]  821 	ld	b,h
                            822 ;src/game.c:198: cpc_GetSp((u8*) tile_buffer_0, 10, 5, (int) pvmem);
   5D52 59            [ 4]  823 	ld	e, c
   5D53 50            [ 4]  824 	ld	d, b
   5D54 C5            [11]  825 	push	bc
   5D55 D5            [11]  826 	push	de
   5D56 21 0A 05      [10]  827 	ld	hl,#0x050A
   5D59 E5            [11]  828 	push	hl
   5D5A 21 85 58      [10]  829 	ld	hl,#_tile_buffer_0
   5D5D E5            [11]  830 	push	hl
   5D5E CD 38 53      [17]  831 	call	_cpc_GetSp
   5D61 C1            [10]  832 	pop	bc
                            833 ;src/game.c:199: cpct_drawSpriteMaskedAlignedTable(hc_marker, pvmem, HC_MARKER_W, HC_MARKER_H, hc_tablatrans);
   5D62 11 00 01      [10]  834 	ld	de,#_hc_tablatrans+0
   5D65 D5            [11]  835 	push	de
   5D66 21 05 0A      [10]  836 	ld	hl,#0x0A05
   5D69 E5            [11]  837 	push	hl
   5D6A C5            [11]  838 	push	bc
   5D6B 21 C2 41      [10]  839 	ld	hl,#_hc_marker
   5D6E E5            [11]  840 	push	hl
   5D6F CD 34 57      [17]  841 	call	_cpct_drawSpriteMaskedAlignedTable
                            842 ;src/game.c:202: user.px = user.x;
   5D72 3A 7C 58      [13]  843 	ld	a, (#_user + 0)
   5D75 32 7E 58      [13]  844 	ld	(#(_user + 0x0002)),a
                            845 ;src/game.c:203: user.py = user.y;
   5D78 3A 7D 58      [13]  846 	ld	a, (#(_user + 0x0001) + 0)
   5D7B 32 7F 58      [13]  847 	ld	(#(_user + 0x0003)),a
   5D7E C9            [10]  848 	ret
                            849 ;src/game.c:206: void checkUserMovement() {
                            850 ;	---------------------------------
                            851 ; Function checkUserMovement
                            852 ; ---------------------------------
   5D7F                     853 _checkUserMovement::
                            854 ;src/game.c:207: cpct_scanKeyboard_f();
   5D7F CD 92 53      [17]  855 	call	_cpct_scanKeyboard_f
                            856 ;src/game.c:209: if ((user.x < (TABLE_WIDTH - 1)) && (cpct_isKeyPressed(keys.right))) {
   5D82 3A 7C 58      [13]  857 	ld	a,(#_user + 0)
   5D85 D6 07         [ 7]  858 	sub	a, #0x07
   5D87 30 1B         [12]  859 	jr	NC,00105$
   5D89 2A 74 58      [16]  860 	ld	hl, (#(_keys + 0x0006) + 0)
   5D8C CD 86 53      [17]  861 	call	_cpct_isKeyPressed
   5D8F 7D            [ 4]  862 	ld	a,l
   5D90 B7            [ 4]  863 	or	a, a
   5D91 28 11         [12]  864 	jr	Z,00105$
                            865 ;src/game.c:210: user.px = user.x;
   5D93 01 7C 58      [10]  866 	ld	bc,#_user+0
   5D96 0A            [ 7]  867 	ld	a,(bc)
   5D97 32 7E 58      [13]  868 	ld	(#(_user + 0x0002)),a
                            869 ;src/game.c:211: user.x++;
   5D9A 0A            [ 7]  870 	ld	a,(bc)
   5D9B 3C            [ 4]  871 	inc	a
   5D9C 02            [ 7]  872 	ld	(bc),a
                            873 ;src/game.c:212: user.moved = 1;
   5D9D 21 80 58      [10]  874 	ld	hl,#(_user + 0x0004)
   5DA0 36 01         [10]  875 	ld	(hl),#0x01
   5DA2 18 20         [12]  876 	jr	00106$
   5DA4                     877 00105$:
                            878 ;src/game.c:213: } else if ((user.x > 0) && (cpct_isKeyPressed(keys.left))) {
   5DA4 3A 7C 58      [13]  879 	ld	a, (#_user + 0)
   5DA7 B7            [ 4]  880 	or	a, a
   5DA8 28 1A         [12]  881 	jr	Z,00106$
   5DAA 2A 72 58      [16]  882 	ld	hl, (#(_keys + 0x0004) + 0)
   5DAD CD 86 53      [17]  883 	call	_cpct_isKeyPressed
   5DB0 7D            [ 4]  884 	ld	a,l
   5DB1 B7            [ 4]  885 	or	a, a
   5DB2 28 10         [12]  886 	jr	Z,00106$
                            887 ;src/game.c:214: user.px = user.x;
   5DB4 01 7C 58      [10]  888 	ld	bc,#_user+0
   5DB7 0A            [ 7]  889 	ld	a,(bc)
   5DB8 32 7E 58      [13]  890 	ld	(#(_user + 0x0002)),a
                            891 ;src/game.c:215: user.x--;
   5DBB 0A            [ 7]  892 	ld	a,(bc)
   5DBC C6 FF         [ 7]  893 	add	a,#0xFF
   5DBE 02            [ 7]  894 	ld	(bc),a
                            895 ;src/game.c:216: user.moved = 1;
   5DBF 21 80 58      [10]  896 	ld	hl,#(_user + 0x0004)
   5DC2 36 01         [10]  897 	ld	(hl),#0x01
   5DC4                     898 00106$:
                            899 ;src/game.c:219: if ((user.y < (TABLE_HEIGHT - 1)) && (cpct_isKeyPressed(keys.down))) {
   5DC4 01 7D 58      [10]  900 	ld	bc,#_user + 1
   5DC7 0A            [ 7]  901 	ld	a,(bc)
                            902 ;src/game.c:220: user.py = user.y;
                            903 ;src/game.c:222: user.moved = 1;
                            904 ;src/game.c:219: if ((user.y < (TABLE_HEIGHT - 1)) && (cpct_isKeyPressed(keys.down))) {
   5DC8 5F            [ 4]  905 	ld	e,a
   5DC9 D6 05         [ 7]  906 	sub	a, #0x05
   5DCB 30 1D         [12]  907 	jr	NC,00112$
   5DCD 2A 70 58      [16]  908 	ld	hl, (#(_keys + 0x0002) + 0)
   5DD0 C5            [11]  909 	push	bc
   5DD1 CD 86 53      [17]  910 	call	_cpct_isKeyPressed
   5DD4 55            [ 4]  911 	ld	d,l
   5DD5 C1            [10]  912 	pop	bc
   5DD6 0A            [ 7]  913 	ld	a,(bc)
   5DD7 5F            [ 4]  914 	ld	e,a
   5DD8 7A            [ 4]  915 	ld	a,d
   5DD9 B7            [ 4]  916 	or	a, a
   5DDA 28 0E         [12]  917 	jr	Z,00112$
                            918 ;src/game.c:220: user.py = user.y;
   5DDC 21 7F 58      [10]  919 	ld	hl,#(_user + 0x0003)
   5DDF 73            [ 7]  920 	ld	(hl),e
                            921 ;src/game.c:221: user.y++;
   5DE0 0A            [ 7]  922 	ld	a,(bc)
   5DE1 3C            [ 4]  923 	inc	a
   5DE2 02            [ 7]  924 	ld	(bc),a
                            925 ;src/game.c:222: user.moved = 1;
   5DE3 21 80 58      [10]  926 	ld	hl,#(_user + 0x0004)
   5DE6 36 01         [10]  927 	ld	(hl),#0x01
   5DE8 18 1D         [12]  928 	jr	00113$
   5DEA                     929 00112$:
                            930 ;src/game.c:223: } else if ((user.y > 0) && (cpct_isKeyPressed(keys.up))) {
   5DEA 7B            [ 4]  931 	ld	a,e
   5DEB B7            [ 4]  932 	or	a, a
   5DEC 28 19         [12]  933 	jr	Z,00113$
   5DEE 2A 6E 58      [16]  934 	ld	hl, (#_keys + 0)
   5DF1 C5            [11]  935 	push	bc
   5DF2 CD 86 53      [17]  936 	call	_cpct_isKeyPressed
   5DF5 C1            [10]  937 	pop	bc
   5DF6 7D            [ 4]  938 	ld	a,l
   5DF7 B7            [ 4]  939 	or	a, a
   5DF8 28 0D         [12]  940 	jr	Z,00113$
                            941 ;src/game.c:224: user.py = user.y;
   5DFA 0A            [ 7]  942 	ld	a,(bc)
   5DFB 32 7F 58      [13]  943 	ld	(#(_user + 0x0003)),a
                            944 ;src/game.c:225: user.y--;
   5DFE 0A            [ 7]  945 	ld	a,(bc)
   5DFF C6 FF         [ 7]  946 	add	a,#0xFF
   5E01 02            [ 7]  947 	ld	(bc),a
                            948 ;src/game.c:226: user.moved = 1;
   5E02 21 80 58      [10]  949 	ld	hl,#(_user + 0x0004)
   5E05 36 01         [10]  950 	ld	(hl),#0x01
   5E07                     951 00113$:
                            952 ;src/game.c:228: if ((userTable[user.x][5] == 0) && (cpct_isKeyPressed(keys.fire))) {
   5E07 3A 7C 58      [13]  953 	ld	a, (#_user + 0)
   5E0A 4F            [ 4]  954 	ld	c,a
   5E0B 06 00         [ 7]  955 	ld	b,#0x00
   5E0D 69            [ 4]  956 	ld	l, c
   5E0E 60            [ 4]  957 	ld	h, b
   5E0F 29            [11]  958 	add	hl, hl
   5E10 09            [11]  959 	add	hl, bc
   5E11 29            [11]  960 	add	hl, hl
   5E12 11 0E 58      [10]  961 	ld	de,#_userTable
   5E15 19            [11]  962 	add	hl,de
   5E16 11 05 00      [10]  963 	ld	de, #0x0005
   5E19 19            [11]  964 	add	hl, de
   5E1A 7E            [ 7]  965 	ld	a,(hl)
   5E1B B7            [ 4]  966 	or	a, a
   5E1C 20 12         [12]  967 	jr	NZ,00116$
   5E1E 2A 76 58      [16]  968 	ld	hl, (#(_keys + 0x0008) + 0)
   5E21 CD 86 53      [17]  969 	call	_cpct_isKeyPressed
   5E24 7D            [ 4]  970 	ld	a,l
   5E25 B7            [ 4]  971 	or	a, a
   5E26 28 08         [12]  972 	jr	Z,00116$
                            973 ;src/game.c:229: newHand(1);
   5E28 3E 01         [ 7]  974 	ld	a,#0x01
   5E2A F5            [11]  975 	push	af
   5E2B 33            [ 6]  976 	inc	sp
   5E2C CD 83 5C      [17]  977 	call	_newHand
   5E2F 33            [ 6]  978 	inc	sp
   5E30                     979 00116$:
                            980 ;src/game.c:232: if (cpct_isKeyPressed(keys.abort)) {
   5E30 2A 7A 58      [16]  981 	ld	hl, (#(_keys + 0x000c) + 0)
   5E33 CD 86 53      [17]  982 	call	_cpct_isKeyPressed
   5E36 7D            [ 4]  983 	ld	a,l
   5E37 B7            [ 4]  984 	or	a, a
   5E38 C8            [11]  985 	ret	Z
                            986 ;src/game.c:234: reset_cpc();
   5E39 C3 34 53      [10]  987 	jp  _reset_cpc
                            988 ;src/game.c:238: void game() {
                            989 ;	---------------------------------
                            990 ; Function game
                            991 ; ---------------------------------
   5E3C                     992 _game::
                            993 ;src/game.c:241: initGame();
   5E3C CD 7A 59      [17]  994 	call	_initGame
                            995 ;src/game.c:242: drawScreen();
   5E3F CD C7 59      [17]  996 	call	_drawScreen
                            997 ;src/game.c:243: newHand(0);  //0 for Enemy 1 for User
   5E42 AF            [ 4]  998 	xor	a, a
   5E43 F5            [11]  999 	push	af
   5E44 33            [ 6] 1000 	inc	sp
   5E45 CD 83 5C      [17] 1001 	call	_newHand
   5E48 33            [ 6] 1002 	inc	sp
                           1003 ;src/game.c:244: newHand(1);  //0 for Enemy 1 for User
   5E49 3E 01         [ 7] 1004 	ld	a,#0x01
   5E4B F5            [11] 1005 	push	af
   5E4C 33            [ 6] 1006 	inc	sp
   5E4D CD 83 5C      [17] 1007 	call	_newHand
   5E50 33            [ 6] 1008 	inc	sp
                           1009 ;src/game.c:245: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X + (user.x * (TILE_W + 1)), USER_TABLE_Y + (user.y * (TILE_H + 2)));
   5E51 3A 7D 58      [13] 1010 	ld	a, (#_user + 1)
   5E54 4F            [ 4] 1011 	ld	c,a
   5E55 87            [ 4] 1012 	add	a, a
   5E56 81            [ 4] 1013 	add	a, c
   5E57 87            [ 4] 1014 	add	a, a
   5E58 87            [ 4] 1015 	add	a, a
   5E59 C6 5C         [ 7] 1016 	add	a, #0x5C
   5E5B 57            [ 4] 1017 	ld	d,a
   5E5C 3A 7C 58      [13] 1018 	ld	a, (#_user + 0)
   5E5F 4F            [ 4] 1019 	ld	c,a
   5E60 87            [ 4] 1020 	add	a, a
   5E61 81            [ 4] 1021 	add	a, c
   5E62 87            [ 4] 1022 	add	a, a
   5E63 47            [ 4] 1023 	ld	b,a
   5E64 04            [ 4] 1024 	inc	b
   5E65 04            [ 4] 1025 	inc	b
   5E66 D5            [11] 1026 	push	de
   5E67 33            [ 6] 1027 	inc	sp
   5E68 C5            [11] 1028 	push	bc
   5E69 33            [ 6] 1029 	inc	sp
   5E6A 21 00 C0      [10] 1030 	ld	hl,#0xC000
   5E6D E5            [11] 1031 	push	hl
   5E6E CD 14 57      [17] 1032 	call	_cpct_getScreenPtr
                           1033 ;src/game.c:246: cpc_GetSp((u8*) tile_buffer_0, 10, 5, (int) pvmem);
   5E71 E5            [11] 1034 	push	hl
   5E72 21 0A 05      [10] 1035 	ld	hl,#0x050A
   5E75 E5            [11] 1036 	push	hl
   5E76 21 85 58      [10] 1037 	ld	hl,#_tile_buffer_0
   5E79 E5            [11] 1038 	push	hl
   5E7A CD 38 53      [17] 1039 	call	_cpc_GetSp
                           1040 ;src/game.c:247: drawUser();
   5E7D CD 02 5D      [17] 1041 	call	_drawUser
                           1042 ;src/game.c:248: while (1) {
   5E80                    1043 00106$:
                           1044 ;src/game.c:249: checkUserMovement();
   5E80 CD 7F 5D      [17] 1045 	call	_checkUserMovement
                           1046 ;src/game.c:250: if (user.moved) {
   5E83 3A 80 58      [13] 1047 	ld	a, (#(_user + 0x0004) + 0)
   5E86 B7            [ 4] 1048 	or	a, a
   5E87 28 08         [12] 1049 	jr	Z,00102$
                           1050 ;src/game.c:251: drawUser();
   5E89 CD 02 5D      [17] 1051 	call	_drawUser
                           1052 ;src/game.c:252: user.moved = 0;
   5E8C 21 80 58      [10] 1053 	ld	hl,#(_user + 0x0004)
   5E8F 36 00         [10] 1054 	ld	(hl),#0x00
   5E91                    1055 00102$:
                           1056 ;src/game.c:254: if (abort)
   5E91 3A 83 58      [13] 1057 	ld	a,(#_abort + 0)
   5E94 B7            [ 4] 1058 	or	a, a
   5E95 C0            [11] 1059 	ret	NZ
                           1060 ;src/game.c:256: delay(20);
   5E96 21 00 00      [10] 1061 	ld	hl,#0x0000
   5E99 E5            [11] 1062 	push	hl
   5E9A 21 14 00      [10] 1063 	ld	hl,#0x0014
   5E9D E5            [11] 1064 	push	hl
   5E9E CD 4D 59      [17] 1065 	call	_delay
   5EA1 F1            [10] 1066 	pop	af
   5EA2 F1            [10] 1067 	pop	af
   5EA3 18 DB         [12] 1068 	jr	00106$
                           1069 	.area _CODE
                           1070 	.area _INITIALIZER
   58E9                    1071 __xinit__tile_buffer_0:
   58E9 00                 1072 	.db #0x00	; 0
   58EA 00                 1073 	.db #0x00	; 0
   58EB 00                 1074 	.db #0x00	; 0
   58EC 00                 1075 	.db #0x00	; 0
   58ED 00                 1076 	.db #0x00	; 0
   58EE 00                 1077 	.db #0x00	; 0
   58EF 00                 1078 	.db #0x00	; 0
   58F0 00                 1079 	.db #0x00	; 0
   58F1 00                 1080 	.db #0x00	; 0
   58F2 00                 1081 	.db #0x00	; 0
   58F3 00                 1082 	.db #0x00	; 0
   58F4 00                 1083 	.db #0x00	; 0
   58F5 00                 1084 	.db #0x00	; 0
   58F6 00                 1085 	.db #0x00	; 0
   58F7 00                 1086 	.db #0x00	; 0
   58F8 00                 1087 	.db #0x00	; 0
   58F9 00                 1088 	.db #0x00	; 0
   58FA 00                 1089 	.db #0x00	; 0
   58FB 00                 1090 	.db #0x00	; 0
   58FC 00                 1091 	.db #0x00	; 0
   58FD 00                 1092 	.db #0x00	; 0
   58FE 00                 1093 	.db #0x00	; 0
   58FF 00                 1094 	.db #0x00	; 0
   5900 00                 1095 	.db #0x00	; 0
   5901 00                 1096 	.db #0x00	; 0
   5902 00                 1097 	.db #0x00	; 0
   5903 00                 1098 	.db #0x00	; 0
   5904 00                 1099 	.db #0x00	; 0
   5905 00                 1100 	.db #0x00	; 0
   5906 00                 1101 	.db #0x00	; 0
   5907 00                 1102 	.db #0x00	; 0
   5908 00                 1103 	.db #0x00	; 0
   5909 00                 1104 	.db #0x00	; 0
   590A 00                 1105 	.db #0x00	; 0
   590B 00                 1106 	.db #0x00	; 0
   590C 00                 1107 	.db #0x00	; 0
   590D 00                 1108 	.db #0x00	; 0
   590E 00                 1109 	.db #0x00	; 0
   590F 00                 1110 	.db #0x00	; 0
   5910 00                 1111 	.db #0x00	; 0
   5911 00                 1112 	.db #0x00	; 0
   5912 00                 1113 	.db #0x00	; 0
   5913 00                 1114 	.db #0x00	; 0
   5914 00                 1115 	.db #0x00	; 0
   5915 00                 1116 	.db #0x00	; 0
   5916 00                 1117 	.db #0x00	; 0
   5917 00                 1118 	.db #0x00	; 0
   5918 00                 1119 	.db #0x00	; 0
   5919 00                 1120 	.db #0x00	; 0
   591A 00                 1121 	.db #0x00	; 0
   591B                    1122 __xinit__tile_buffer_1:
   591B 00                 1123 	.db #0x00	; 0
   591C 00                 1124 	.db #0x00	; 0
   591D 00                 1125 	.db #0x00	; 0
   591E 00                 1126 	.db #0x00	; 0
   591F 00                 1127 	.db #0x00	; 0
   5920 00                 1128 	.db #0x00	; 0
   5921 00                 1129 	.db #0x00	; 0
   5922 00                 1130 	.db #0x00	; 0
   5923 00                 1131 	.db #0x00	; 0
   5924 00                 1132 	.db #0x00	; 0
   5925 00                 1133 	.db #0x00	; 0
   5926 00                 1134 	.db #0x00	; 0
   5927 00                 1135 	.db #0x00	; 0
   5928 00                 1136 	.db #0x00	; 0
   5929 00                 1137 	.db #0x00	; 0
   592A 00                 1138 	.db #0x00	; 0
   592B 00                 1139 	.db #0x00	; 0
   592C 00                 1140 	.db #0x00	; 0
   592D 00                 1141 	.db #0x00	; 0
   592E 00                 1142 	.db #0x00	; 0
   592F 00                 1143 	.db #0x00	; 0
   5930 00                 1144 	.db #0x00	; 0
   5931 00                 1145 	.db #0x00	; 0
   5932 00                 1146 	.db #0x00	; 0
   5933 00                 1147 	.db #0x00	; 0
   5934 00                 1148 	.db #0x00	; 0
   5935 00                 1149 	.db #0x00	; 0
   5936 00                 1150 	.db #0x00	; 0
   5937 00                 1151 	.db #0x00	; 0
   5938 00                 1152 	.db #0x00	; 0
   5939 00                 1153 	.db #0x00	; 0
   593A 00                 1154 	.db #0x00	; 0
   593B 00                 1155 	.db #0x00	; 0
   593C 00                 1156 	.db #0x00	; 0
   593D 00                 1157 	.db #0x00	; 0
   593E 00                 1158 	.db #0x00	; 0
   593F 00                 1159 	.db #0x00	; 0
   5940 00                 1160 	.db #0x00	; 0
   5941 00                 1161 	.db #0x00	; 0
   5942 00                 1162 	.db #0x00	; 0
   5943 00                 1163 	.db #0x00	; 0
   5944 00                 1164 	.db #0x00	; 0
   5945 00                 1165 	.db #0x00	; 0
   5946 00                 1166 	.db #0x00	; 0
   5947 00                 1167 	.db #0x00	; 0
   5948 00                 1168 	.db #0x00	; 0
   5949 00                 1169 	.db #0x00	; 0
   594A 00                 1170 	.db #0x00	; 0
   594B 00                 1171 	.db #0x00	; 0
   594C 00                 1172 	.db #0x00	; 0
                           1173 	.area _CABS (ABS)
