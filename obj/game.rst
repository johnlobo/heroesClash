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
                             13 	.globl _insertCard
                             14 	.globl _drawScreen
                             15 	.globl _initGame
                             16 	.globl _delay
                             17 	.globl _cpc_GetSp
                             18 	.globl _reset_cpc
                             19 	.globl _cpct_getRandom_mxor_u8
                             20 	.globl _cpct_getScreenPtr
                             21 	.globl _cpct_drawSpriteMaskedAlignedTable
                             22 	.globl _cpct_drawSprite
                             23 	.globl _cpct_isKeyPressed
                             24 	.globl _cpct_scanKeyboard_f
                             25 	.globl _tile_buffer_1
                             26 	.globl _tile_buffer_0
                             27 	.globl _abort
                             28 	.globl _user
                             29 	.globl _keys
                             30 	.globl _enemyTable
                             31 	.globl _userTable
                             32 	.globl _enemyY
                             33 	.globl _enemyX
                             34 	.globl _cards
                             35 	.globl _game
                             36 ;--------------------------------------------------------
                             37 ; special function registers
                             38 ;--------------------------------------------------------
                             39 ;--------------------------------------------------------
                             40 ; ram data
                             41 ;--------------------------------------------------------
                             42 	.area _DATA
   580C                      43 _enemyX::
   580C                      44 	.ds 1
   580D                      45 _enemyY::
   580D                      46 	.ds 1
   580E                      47 _userTable::
   580E                      48 	.ds 48
   583E                      49 _enemyTable::
   583E                      50 	.ds 48
   586E                      51 _keys::
   586E                      52 	.ds 14
   587C                      53 _user::
   587C                      54 	.ds 7
   5883                      55 _abort::
   5883                      56 	.ds 1
                             57 ;--------------------------------------------------------
                             58 ; ram data
                             59 ;--------------------------------------------------------
                             60 	.area _INITIALIZED
   5885                      61 _tile_buffer_0::
   5885                      62 	.ds 50
   58B7                      63 _tile_buffer_1::
   58B7                      64 	.ds 50
                             65 ;--------------------------------------------------------
                             66 ; absolute external ram data
                             67 ;--------------------------------------------------------
                             68 	.area _DABS (ABS)
                             69 ;--------------------------------------------------------
                             70 ; global & static initialisations
                             71 ;--------------------------------------------------------
                             72 	.area _HOME
                             73 	.area _GSINIT
                             74 	.area _GSFINAL
                             75 	.area _GSINIT
                             76 ;--------------------------------------------------------
                             77 ; Home
                             78 ;--------------------------------------------------------
                             79 	.area _HOME
                             80 	.area _HOME
                             81 ;--------------------------------------------------------
                             82 ; code
                             83 ;--------------------------------------------------------
                             84 	.area _CODE
                             85 ;src/game.c:56: cpctm_createTransparentMaskTable(hc_tablatrans, 0x100, M0, 0);
                             86 ;	---------------------------------
                             87 ; Function dummy_cpct_transparentMaskTable0M0_container
                             88 ; ---------------------------------
   41F4                      89 _dummy_cpct_transparentMaskTable0M0_container::
                             90 	.area _hc_tablatrans_ (ABS) 
   0100                      91 	.org 0x100 
   0100                      92 	 _hc_tablatrans::
   0100 FF AA 55 00 AA AA    93 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0108 55 00 55 00 00 00    94 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0110 AA AA 00 00 AA AA    95 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0118 00 00 00 00 00 00    96 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0120 55 00 55 00 00 00    97 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0128 55 00 55 00 00 00    98 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0130 00 00 00 00 00 00    99 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0138 00 00 00 00 00 00   100 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0140 AA AA 00 00 AA AA   101 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0148 00 00 00 00 00 00   102 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0150 AA AA 00 00 AA AA   103 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0158 00 00 00 00 00 00   104 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0160 00 00 00 00 00 00   105 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0168 00 00 00 00 00 00   106 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0170 00 00 00 00 00 00   107 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0178 00 00 00 00 00 00   108 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0180 55 00 55 00 00 00   109 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0188 55 00 55 00 00 00   110 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0190 00 00 00 00 00 00   111 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0198 00 00 00 00 00 00   112 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A0 55 00 55 00 00 00   113 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A8 55 00 55 00 00 00   114 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B0 00 00 00 00 00 00   115 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B8 00 00 00 00 00 00   116 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C0 00 00 00 00 00 00   117 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C8 00 00 00 00 00 00   118 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D0 00 00 00 00 00 00   119 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D8 00 00 00 00 00 00   120 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E0 00 00 00 00 00 00   121 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E8 00 00 00 00 00 00   122 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F0 00 00 00 00 00 00   123 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F8 00 00 00 00 00 00   124 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            125 	.area _CSEG (REL, CON) 
                            126 ;src/game.c:67: void delay(u32 cycles) {
                            127 ;	---------------------------------
                            128 ; Function delay
                            129 ; ---------------------------------
   594D                     130 _delay::
                            131 ;src/game.c:69: for (i = 0; i < cycles; i++) {
   594D 01 00 00      [10]  132 	ld	bc,#0x0000
   5950 11 00 00      [10]  133 	ld	de,#0x0000
   5953                     134 00103$:
   5953 21 02 00      [10]  135 	ld	hl,#2
   5956 39            [11]  136 	add	hl,sp
   5957 79            [ 4]  137 	ld	a,c
   5958 96            [ 7]  138 	sub	a, (hl)
   5959 78            [ 4]  139 	ld	a,b
   595A 23            [ 6]  140 	inc	hl
   595B 9E            [ 7]  141 	sbc	a, (hl)
   595C 7B            [ 4]  142 	ld	a,e
   595D 23            [ 6]  143 	inc	hl
   595E 9E            [ 7]  144 	sbc	a, (hl)
   595F 7A            [ 4]  145 	ld	a,d
   5960 23            [ 6]  146 	inc	hl
   5961 9E            [ 7]  147 	sbc	a, (hl)
   5962 D0            [11]  148 	ret	NC
                            149 ;src/game.c:72: __endasm;
   5963 76            [ 4]  150 	halt
                            151 ;src/game.c:69: for (i = 0; i < cycles; i++) {
   5964 0C            [ 4]  152 	inc	c
   5965 20 EC         [12]  153 	jr	NZ,00103$
   5967 04            [ 4]  154 	inc	b
   5968 20 E9         [12]  155 	jr	NZ,00103$
   596A 1C            [ 4]  156 	inc	e
   596B 20 E6         [12]  157 	jr	NZ,00103$
   596D 14            [ 4]  158 	inc	d
   596E 18 E3         [12]  159 	jr	00103$
   5970                     160 _cards:
   5970 FA 40               161 	.dw _hc_figures_0
   5972 2C 41               162 	.dw _hc_figures_1
   5974 5E 41               163 	.dw _hc_figures_2
   5976 90 41               164 	.dw _hc_figures_3
                            165 ;src/game.c:77: void initGame(){
                            166 ;	---------------------------------
                            167 ; Function initGame
                            168 ; ---------------------------------
   5978                     169 _initGame::
                            170 ;src/game.c:78: abort = 0;
   5978 21 83 58      [10]  171 	ld	hl,#_abort + 0
   597B 36 00         [10]  172 	ld	(hl), #0x00
                            173 ;src/game.c:80: user.x = 0;
   597D 21 7C 58      [10]  174 	ld	hl,#_user
   5980 36 00         [10]  175 	ld	(hl),#0x00
                            176 ;src/game.c:81: user.y = 0;
   5982 21 7D 58      [10]  177 	ld	hl,#(_user + 0x0001)
   5985 36 00         [10]  178 	ld	(hl),#0x00
                            179 ;src/game.c:82: user.px = 0;
   5987 21 7E 58      [10]  180 	ld	hl,#(_user + 0x0002)
   598A 36 00         [10]  181 	ld	(hl),#0x00
                            182 ;src/game.c:83: user.py = 0;
   598C 21 7F 58      [10]  183 	ld	hl,#(_user + 0x0003)
   598F 36 00         [10]  184 	ld	(hl),#0x00
                            185 ;src/game.c:84: user.moved = 0;
   5991 21 80 58      [10]  186 	ld	hl,#(_user + 0x0004)
   5994 36 00         [10]  187 	ld	(hl),#0x00
                            188 ;src/game.c:85: user.buffer = tile_buffer_0;
   5996 21 85 58      [10]  189 	ld	hl,#_tile_buffer_0
   5999 22 81 58      [16]  190 	ld	((_user + 0x0005)), hl
                            191 ;src/game.c:87: keys.up    = Key_CursorUp;
   599C 21 00 01      [10]  192 	ld	hl,#0x0100
   599F 22 6E 58      [16]  193 	ld	(_keys), hl
                            194 ;src/game.c:88: keys.down  = Key_CursorDown;
   59A2 26 04         [ 7]  195 	ld	h, #0x04
   59A4 22 70 58      [16]  196 	ld	((_keys + 0x0002)), hl
                            197 ;src/game.c:89: keys.left  = Key_CursorLeft;
   59A7 21 01 01      [10]  198 	ld	hl,#0x0101
   59AA 22 72 58      [16]  199 	ld	((_keys + 0x0004)), hl
                            200 ;src/game.c:90: keys.right = Key_CursorRight;
   59AD 21 00 02      [10]  201 	ld	hl,#0x0200
   59B0 22 74 58      [16]  202 	ld	((_keys + 0x0006)), hl
                            203 ;src/game.c:91: keys.fire  = Key_Space;
   59B3 21 05 80      [10]  204 	ld	hl,#0x8005
   59B6 22 76 58      [16]  205 	ld	((_keys + 0x0008)), hl
                            206 ;src/game.c:92: keys.pause = Key_Del;
   59B9 2E 09         [ 7]  207 	ld	l, #0x09
   59BB 22 78 58      [16]  208 	ld	((_keys + 0x000a)), hl
                            209 ;src/game.c:93: keys.abort = Key_Esc;
   59BE 21 08 04      [10]  210 	ld	hl,#0x0408
   59C1 22 7A 58      [16]  211 	ld	((_keys + 0x000c)), hl
   59C4 C9            [10]  212 	ret
                            213 ;src/game.c:96: void drawScreen(){
                            214 ;	---------------------------------
                            215 ; Function drawScreen
                            216 ; ---------------------------------
   59C5                     217 _drawScreen::
                            218 ;src/game.c:99: for (j=0;j<TABLE_HEIGHT;j++){
   59C5 0E 00         [ 7]  219 	ld	c,#0x00
   59C7                     220 00106$:
                            221 ;src/game.c:100: for (i=0;i<TABLE_WIDTH;i++){
   59C7 06 08         [ 7]  222 	ld	b,#0x08
   59C9                     223 00105$:
   59C9 58            [ 4]  224 	ld	e,b
   59CA 1D            [ 4]  225 	dec	e
   59CB 7B            [ 4]  226 	ld	a,e
   59CC 47            [ 4]  227 	ld	b,a
   59CD B7            [ 4]  228 	or	a, a
   59CE 20 F9         [12]  229 	jr	NZ,00105$
                            230 ;src/game.c:99: for (j=0;j<TABLE_HEIGHT;j++){
   59D0 0C            [ 4]  231 	inc	c
   59D1 79            [ 4]  232 	ld	a,c
   59D2 D6 06         [ 7]  233 	sub	a, #0x06
   59D4 38 F1         [12]  234 	jr	C,00106$
   59D6 C9            [10]  235 	ret
                            236 ;src/game.c:105: void insertCard(){
                            237 ;	---------------------------------
                            238 ; Function insertCard
                            239 ; ---------------------------------
   59D7                     240 _insertCard::
   59D7 DD E5         [15]  241 	push	ix
   59D9 DD 21 00 00   [14]  242 	ld	ix,#0
   59DD DD 39         [15]  243 	add	ix,sp
   59DF 21 F9 FF      [10]  244 	ld	hl,#-7
   59E2 39            [11]  245 	add	hl,sp
   59E3 F9            [ 6]  246 	ld	sp,hl
                            247 ;src/game.c:108: u8 stopped = 0;
   59E4 0E 00         [ 7]  248 	ld	c,#0x00
                            249 ;src/game.c:111: row = 5;
   59E6 1E 05         [ 7]  250 	ld	e,#0x05
                            251 ;src/game.c:112: col = user.x;
   59E8 3A 7C 58      [13]  252 	ld	a,(#_user+0)
   59EB DD 77 FA      [19]  253 	ld	-6 (ix),a
                            254 ;src/game.c:113: card = (cpct_rand() / 85) + 1;
   59EE C5            [11]  255 	push	bc
   59EF D5            [11]  256 	push	de
   59F0 CD 19 55      [17]  257 	call	_cpct_getRandom_mxor_u8
   59F3 45            [ 4]  258 	ld	b,l
   59F4 D1            [10]  259 	pop	de
   59F5 78            [ 4]  260 	ld	a,b
   59F6 C1            [10]  261 	pop	bc
   59F7 47            [ 4]  262 	ld	b,a
   59F8 C5            [11]  263 	push	bc
   59F9 D5            [11]  264 	push	de
   59FA 3E 55         [ 7]  265 	ld	a,#0x55
   59FC F5            [11]  266 	push	af
   59FD 33            [ 6]  267 	inc	sp
   59FE C5            [11]  268 	push	bc
   59FF 33            [ 6]  269 	inc	sp
   5A00 CD B5 54      [17]  270 	call	__divuchar
   5A03 F1            [10]  271 	pop	af
   5A04 D1            [10]  272 	pop	de
   5A05 C1            [10]  273 	pop	bc
   5A06 7D            [ 4]  274 	ld	a,l
   5A07 3C            [ 4]  275 	inc	a
   5A08 DD 77 F9      [19]  276 	ld	-7 (ix),a
                            277 ;src/game.c:115: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X+(col*TILE_W), USER_TABLE_Y+(row*TILE_H));
   5A0B D5            [11]  278 	push	de
   5A0C DD 7E FA      [19]  279 	ld	a,-6 (ix)
   5A0F 5F            [ 4]  280 	ld	e,a
   5A10 87            [ 4]  281 	add	a, a
   5A11 87            [ 4]  282 	add	a, a
   5A12 83            [ 4]  283 	add	a, e
   5A13 D1            [10]  284 	pop	de
   5A14 C6 02         [ 7]  285 	add	a, #0x02
   5A16 DD 77 FF      [19]  286 	ld	-1 (ix),a
   5A19 C5            [11]  287 	push	bc
   5A1A D5            [11]  288 	push	de
   5A1B 3E 8E         [ 7]  289 	ld	a,#0x8E
   5A1D F5            [11]  290 	push	af
   5A1E 33            [ 6]  291 	inc	sp
   5A1F DD 7E FF      [19]  292 	ld	a,-1 (ix)
   5A22 F5            [11]  293 	push	af
   5A23 33            [ 6]  294 	inc	sp
   5A24 21 00 C0      [10]  295 	ld	hl,#0xC000
   5A27 E5            [11]  296 	push	hl
   5A28 CD 55 57      [17]  297 	call	_cpct_getScreenPtr
   5A2B D1            [10]  298 	pop	de
   5A2C C1            [10]  299 	pop	bc
   5A2D 45            [ 4]  300 	ld	b,l
   5A2E 54            [ 4]  301 	ld	d,h
                            302 ;src/game.c:116: cpc_GetSp((u8*) tile_buffer_1, 10, 10, (int) pvmem);
   5A2F DD 70 FD      [19]  303 	ld	-3 (ix),b
   5A32 DD 72 FE      [19]  304 	ld	-2 (ix),d
   5A35 C5            [11]  305 	push	bc
   5A36 D5            [11]  306 	push	de
   5A37 DD 6E FD      [19]  307 	ld	l,-3 (ix)
   5A3A DD 66 FE      [19]  308 	ld	h,-2 (ix)
   5A3D E5            [11]  309 	push	hl
   5A3E 21 0A 0A      [10]  310 	ld	hl,#0x0A0A
   5A41 E5            [11]  311 	push	hl
   5A42 21 B7 58      [10]  312 	ld	hl,#_tile_buffer_1
   5A45 E5            [11]  313 	push	hl
   5A46 CD 38 53      [17]  314 	call	_cpc_GetSp
   5A49 D1            [10]  315 	pop	de
   5A4A C1            [10]  316 	pop	bc
                            317 ;src/game.c:117: cpct_drawSpriteMaskedAlignedTable(cards[card], pvmem, TILE_W, TILE_H, hc_tablatrans);
   5A4B DD 6E F9      [19]  318 	ld	l,-7 (ix)
   5A4E 26 00         [ 7]  319 	ld	h,#0x00
   5A50 29            [11]  320 	add	hl, hl
   5A51 3E 70         [ 7]  321 	ld	a,#<(_cards)
   5A53 85            [ 4]  322 	add	a, l
   5A54 DD 77 FD      [19]  323 	ld	-3 (ix),a
   5A57 3E 59         [ 7]  324 	ld	a,#>(_cards)
   5A59 8C            [ 4]  325 	adc	a, h
   5A5A DD 77 FE      [19]  326 	ld	-2 (ix),a
   5A5D DD 6E FD      [19]  327 	ld	l,-3 (ix)
   5A60 DD 66 FE      [19]  328 	ld	h,-2 (ix)
   5A63 7E            [ 7]  329 	ld	a, (hl)
   5A64 23            [ 6]  330 	inc	hl
   5A65 66            [ 7]  331 	ld	h,(hl)
   5A66 6F            [ 4]  332 	ld	l,a
   5A67 E5            [11]  333 	push	hl
   5A68 FD E1         [14]  334 	pop	iy
   5A6A C5            [11]  335 	push	bc
   5A6B D5            [11]  336 	push	de
   5A6C 21 00 01      [10]  337 	ld	hl,#_hc_tablatrans
   5A6F E5            [11]  338 	push	hl
   5A70 21 05 0A      [10]  339 	ld	hl,#0x0A05
   5A73 E5            [11]  340 	push	hl
   5A74 58            [ 4]  341 	ld	e,b
   5A75 D5            [11]  342 	push	de
   5A76 FD E5         [15]  343 	push	iy
   5A78 CD 75 57      [17]  344 	call	_cpct_drawSpriteMaskedAlignedTable
   5A7B D1            [10]  345 	pop	de
   5A7C C1            [10]  346 	pop	bc
                            347 ;src/game.c:119: while (!stopped){
   5A7D D5            [11]  348 	push	de
   5A7E DD 5E FA      [19]  349 	ld	e,-6 (ix)
   5A81 16 00         [ 7]  350 	ld	d,#0x00
   5A83 6B            [ 4]  351 	ld	l, e
   5A84 62            [ 4]  352 	ld	h, d
   5A85 29            [11]  353 	add	hl, hl
   5A86 19            [11]  354 	add	hl, de
   5A87 29            [11]  355 	add	hl, hl
   5A88 D1            [10]  356 	pop	de
   5A89 3E 0E         [ 7]  357 	ld	a,#<(_userTable)
   5A8B 85            [ 4]  358 	add	a, l
   5A8C DD 77 FB      [19]  359 	ld	-5 (ix),a
   5A8F 3E 58         [ 7]  360 	ld	a,#>(_userTable)
   5A91 8C            [ 4]  361 	adc	a, h
   5A92 DD 77 FC      [19]  362 	ld	-4 (ix),a
   5A95                     363 00107$:
   5A95 79            [ 4]  364 	ld	a,c
   5A96 B7            [ 4]  365 	or	a, a
   5A97 C2 45 5B      [10]  366 	jp	NZ,00109$
                            367 ;src/game.c:120: delay(10);
   5A9A C5            [11]  368 	push	bc
   5A9B D5            [11]  369 	push	de
   5A9C 21 00 00      [10]  370 	ld	hl,#0x0000
   5A9F E5            [11]  371 	push	hl
   5AA0 21 0A 00      [10]  372 	ld	hl,#0x000A
   5AA3 E5            [11]  373 	push	hl
   5AA4 CD 4D 59      [17]  374 	call	_delay
   5AA7 F1            [10]  375 	pop	af
   5AA8 F1            [10]  376 	pop	af
   5AA9 D1            [10]  377 	pop	de
   5AAA C1            [10]  378 	pop	bc
                            379 ;src/game.c:121: if ((row>0) && (userTable[col][row-1]==0)){
   5AAB 7B            [ 4]  380 	ld	a,e
   5AAC B7            [ 4]  381 	or	a, a
   5AAD CA 40 5B      [10]  382 	jp	Z,00104$
   5AB0 43            [ 4]  383 	ld	b,e
   5AB1 05            [ 4]  384 	dec	b
   5AB2 DD 7E FB      [19]  385 	ld	a,-5 (ix)
   5AB5 80            [ 4]  386 	add	a, b
   5AB6 6F            [ 4]  387 	ld	l,a
   5AB7 DD 7E FC      [19]  388 	ld	a,-4 (ix)
   5ABA CE 00         [ 7]  389 	adc	a, #0x00
   5ABC 67            [ 4]  390 	ld	h,a
   5ABD 7E            [ 7]  391 	ld	a,(hl)
   5ABE B7            [ 4]  392 	or	a, a
   5ABF C2 40 5B      [10]  393 	jp	NZ,00104$
                            394 ;src/game.c:122: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X+(col*TILE_W), USER_TABLE_Y+(row*TILE_H));
   5AC2 7B            [ 4]  395 	ld	a,e
   5AC3 87            [ 4]  396 	add	a, a
   5AC4 87            [ 4]  397 	add	a, a
   5AC5 83            [ 4]  398 	add	a, e
   5AC6 87            [ 4]  399 	add	a, a
   5AC7 C6 5C         [ 7]  400 	add	a, #0x5C
   5AC9 57            [ 4]  401 	ld	d,a
   5ACA C5            [11]  402 	push	bc
   5ACB D5            [11]  403 	push	de
   5ACC 33            [ 6]  404 	inc	sp
   5ACD DD 7E FF      [19]  405 	ld	a,-1 (ix)
   5AD0 F5            [11]  406 	push	af
   5AD1 33            [ 6]  407 	inc	sp
   5AD2 21 00 C0      [10]  408 	ld	hl,#0xC000
   5AD5 E5            [11]  409 	push	hl
   5AD6 CD 55 57      [17]  410 	call	_cpct_getScreenPtr
   5AD9 EB            [ 4]  411 	ex	de,hl
   5ADA 21 05 0A      [10]  412 	ld	hl,#0x0A05
   5ADD E5            [11]  413 	push	hl
   5ADE D5            [11]  414 	push	de
   5ADF 21 B7 58      [10]  415 	ld	hl,#_tile_buffer_1
   5AE2 E5            [11]  416 	push	hl
   5AE3 CD 08 54      [17]  417 	call	_cpct_drawSprite
   5AE6 C1            [10]  418 	pop	bc
                            419 ;src/game.c:124: row--;
   5AE7 58            [ 4]  420 	ld	e,b
                            421 ;src/game.c:125: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X+(col*TILE_W), USER_TABLE_Y+(row*TILE_H));
   5AE8 D5            [11]  422 	push	de
   5AE9 7B            [ 4]  423 	ld	a,e
   5AEA 87            [ 4]  424 	add	a, a
   5AEB 87            [ 4]  425 	add	a, a
   5AEC 83            [ 4]  426 	add	a, e
   5AED 87            [ 4]  427 	add	a, a
   5AEE D1            [10]  428 	pop	de
   5AEF C6 5C         [ 7]  429 	add	a, #0x5C
   5AF1 47            [ 4]  430 	ld	b,a
   5AF2 C5            [11]  431 	push	bc
   5AF3 D5            [11]  432 	push	de
   5AF4 C5            [11]  433 	push	bc
   5AF5 33            [ 6]  434 	inc	sp
   5AF6 DD 7E FF      [19]  435 	ld	a,-1 (ix)
   5AF9 F5            [11]  436 	push	af
   5AFA 33            [ 6]  437 	inc	sp
   5AFB 21 00 C0      [10]  438 	ld	hl,#0xC000
   5AFE E5            [11]  439 	push	hl
   5AFF CD 55 57      [17]  440 	call	_cpct_getScreenPtr
   5B02 D1            [10]  441 	pop	de
   5B03 C1            [10]  442 	pop	bc
                            443 ;src/game.c:126: cpc_GetSp((u8*) tile_buffer_1, 10, 10, (int) pvmem);
   5B04 45            [ 4]  444 	ld	b,l
   5B05 54            [ 4]  445 	ld	d,h
   5B06 C5            [11]  446 	push	bc
   5B07 D5            [11]  447 	push	de
   5B08 E5            [11]  448 	push	hl
   5B09 21 0A 0A      [10]  449 	ld	hl,#0x0A0A
   5B0C E5            [11]  450 	push	hl
   5B0D 21 B7 58      [10]  451 	ld	hl,#_tile_buffer_1
   5B10 E5            [11]  452 	push	hl
   5B11 CD 38 53      [17]  453 	call	_cpc_GetSp
   5B14 D1            [10]  454 	pop	de
   5B15 C1            [10]  455 	pop	bc
                            456 ;src/game.c:127: cpct_drawSpriteMaskedAlignedTable(cards[card], pvmem, TILE_W, TILE_H, hc_tablatrans);
   5B16 DD 6E FD      [19]  457 	ld	l,-3 (ix)
   5B19 DD 66 FE      [19]  458 	ld	h,-2 (ix)
   5B1C 7E            [ 7]  459 	ld	a, (hl)
   5B1D 23            [ 6]  460 	inc	hl
   5B1E 66            [ 7]  461 	ld	h,(hl)
   5B1F 6F            [ 4]  462 	ld	l,a
   5B20 E5            [11]  463 	push	hl
   5B21 FD E1         [14]  464 	pop	iy
   5B23 C5            [11]  465 	push	bc
   5B24 D5            [11]  466 	push	de
   5B25 21 00 01      [10]  467 	ld	hl,#_hc_tablatrans
   5B28 E5            [11]  468 	push	hl
   5B29 21 05 0A      [10]  469 	ld	hl,#0x0A05
   5B2C E5            [11]  470 	push	hl
   5B2D 58            [ 4]  471 	ld	e,b
   5B2E D5            [11]  472 	push	de
   5B2F FD E5         [15]  473 	push	iy
   5B31 CD 75 57      [17]  474 	call	_cpct_drawSpriteMaskedAlignedTable
   5B34 D1            [10]  475 	pop	de
   5B35 C1            [10]  476 	pop	bc
                            477 ;src/game.c:128: if (row == 0)
   5B36 7B            [ 4]  478 	ld	a,e
   5B37 B7            [ 4]  479 	or	a, a
   5B38 C2 95 5A      [10]  480 	jp	NZ,00107$
                            481 ;src/game.c:129: stopped = 1;
   5B3B 0E 01         [ 7]  482 	ld	c,#0x01
   5B3D C3 95 5A      [10]  483 	jp	00107$
   5B40                     484 00104$:
                            485 ;src/game.c:131: stopped = 1;
   5B40 0E 01         [ 7]  486 	ld	c,#0x01
   5B42 C3 95 5A      [10]  487 	jp	00107$
   5B45                     488 00109$:
                            489 ;src/game.c:134: userTable[col][row]= card;
   5B45 DD 6E FB      [19]  490 	ld	l,-5 (ix)
   5B48 DD 66 FC      [19]  491 	ld	h,-4 (ix)
   5B4B 16 00         [ 7]  492 	ld	d,#0x00
   5B4D 19            [11]  493 	add	hl, de
   5B4E DD 7E F9      [19]  494 	ld	a,-7 (ix)
   5B51 77            [ 7]  495 	ld	(hl),a
   5B52 DD F9         [10]  496 	ld	sp, ix
   5B54 DD E1         [14]  497 	pop	ix
   5B56 C9            [10]  498 	ret
                            499 ;src/game.c:137: void drawUser(){
                            500 ;	---------------------------------
                            501 ; Function drawUser
                            502 ; ---------------------------------
   5B57                     503 _drawUser::
                            504 ;src/game.c:144: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X+(user.px*TILE_W), USER_TABLE_Y+(user.py*TILE_H));
   5B57 3A 7F 58      [13]  505 	ld	a, (#(_user + 0x0003) + 0)
   5B5A 4F            [ 4]  506 	ld	c,a
   5B5B 87            [ 4]  507 	add	a, a
   5B5C 87            [ 4]  508 	add	a, a
   5B5D 81            [ 4]  509 	add	a, c
   5B5E 87            [ 4]  510 	add	a, a
   5B5F C6 5C         [ 7]  511 	add	a, #0x5C
   5B61 57            [ 4]  512 	ld	d,a
   5B62 3A 7E 58      [13]  513 	ld	a, (#(_user + 0x0002) + 0)
   5B65 4F            [ 4]  514 	ld	c,a
   5B66 87            [ 4]  515 	add	a, a
   5B67 87            [ 4]  516 	add	a, a
   5B68 81            [ 4]  517 	add	a, c
   5B69 47            [ 4]  518 	ld	b,a
   5B6A 04            [ 4]  519 	inc	b
   5B6B 04            [ 4]  520 	inc	b
   5B6C D5            [11]  521 	push	de
   5B6D 33            [ 6]  522 	inc	sp
   5B6E C5            [11]  523 	push	bc
   5B6F 33            [ 6]  524 	inc	sp
   5B70 21 00 C0      [10]  525 	ld	hl,#0xC000
   5B73 E5            [11]  526 	push	hl
   5B74 CD 55 57      [17]  527 	call	_cpct_getScreenPtr
   5B77 4D            [ 4]  528 	ld	c,l
   5B78 44            [ 4]  529 	ld	b,h
                            530 ;src/game.c:145: cpct_drawSprite(tile_buffer_0, pvmem, HC_MARKER_W, HC_MARKER_H);
   5B79 21 05 0A      [10]  531 	ld	hl,#0x0A05
   5B7C E5            [11]  532 	push	hl
   5B7D C5            [11]  533 	push	bc
   5B7E 21 85 58      [10]  534 	ld	hl,#_tile_buffer_0
   5B81 E5            [11]  535 	push	hl
   5B82 CD 08 54      [17]  536 	call	_cpct_drawSprite
                            537 ;src/game.c:146: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X+(user.x*TILE_W), USER_TABLE_Y+(user.y*TILE_H));
   5B85 3A 7D 58      [13]  538 	ld	a, (#(_user + 0x0001) + 0)
   5B88 4F            [ 4]  539 	ld	c,a
   5B89 87            [ 4]  540 	add	a, a
   5B8A 87            [ 4]  541 	add	a, a
   5B8B 81            [ 4]  542 	add	a, c
   5B8C 87            [ 4]  543 	add	a, a
   5B8D C6 5C         [ 7]  544 	add	a, #0x5C
   5B8F 57            [ 4]  545 	ld	d,a
   5B90 3A 7C 58      [13]  546 	ld	a, (#_user + 0)
   5B93 4F            [ 4]  547 	ld	c,a
   5B94 87            [ 4]  548 	add	a, a
   5B95 87            [ 4]  549 	add	a, a
   5B96 81            [ 4]  550 	add	a, c
   5B97 47            [ 4]  551 	ld	b,a
   5B98 04            [ 4]  552 	inc	b
   5B99 04            [ 4]  553 	inc	b
   5B9A D5            [11]  554 	push	de
   5B9B 33            [ 6]  555 	inc	sp
   5B9C C5            [11]  556 	push	bc
   5B9D 33            [ 6]  557 	inc	sp
   5B9E 21 00 C0      [10]  558 	ld	hl,#0xC000
   5BA1 E5            [11]  559 	push	hl
   5BA2 CD 55 57      [17]  560 	call	_cpct_getScreenPtr
   5BA5 4D            [ 4]  561 	ld	c,l
   5BA6 44            [ 4]  562 	ld	b,h
                            563 ;src/game.c:147: cpc_GetSp((u8*) tile_buffer_0, 10, 10, (int) pvmem);
   5BA7 59            [ 4]  564 	ld	e, c
   5BA8 50            [ 4]  565 	ld	d, b
   5BA9 C5            [11]  566 	push	bc
   5BAA D5            [11]  567 	push	de
   5BAB 21 0A 0A      [10]  568 	ld	hl,#0x0A0A
   5BAE E5            [11]  569 	push	hl
   5BAF 21 85 58      [10]  570 	ld	hl,#_tile_buffer_0
   5BB2 E5            [11]  571 	push	hl
   5BB3 CD 38 53      [17]  572 	call	_cpc_GetSp
   5BB6 C1            [10]  573 	pop	bc
                            574 ;src/game.c:148: cpct_drawSpriteMaskedAlignedTable(hc_marker, pvmem, HC_MARKER_W, HC_MARKER_H, hc_tablatrans);
   5BB7 11 00 01      [10]  575 	ld	de,#_hc_tablatrans+0
   5BBA D5            [11]  576 	push	de
   5BBB 21 05 0A      [10]  577 	ld	hl,#0x0A05
   5BBE E5            [11]  578 	push	hl
   5BBF C5            [11]  579 	push	bc
   5BC0 21 C2 41      [10]  580 	ld	hl,#_hc_marker
   5BC3 E5            [11]  581 	push	hl
   5BC4 CD 75 57      [17]  582 	call	_cpct_drawSpriteMaskedAlignedTable
                            583 ;src/game.c:151: user.px = user.x;
   5BC7 3A 7C 58      [13]  584 	ld	a, (#_user + 0)
   5BCA 32 7E 58      [13]  585 	ld	(#(_user + 0x0002)),a
                            586 ;src/game.c:152: user.py = user.y;
   5BCD 3A 7D 58      [13]  587 	ld	a, (#(_user + 0x0001) + 0)
   5BD0 32 7F 58      [13]  588 	ld	(#(_user + 0x0003)),a
   5BD3 C9            [10]  589 	ret
                            590 ;src/game.c:155: void checkUserMovement(){
                            591 ;	---------------------------------
                            592 ; Function checkUserMovement
                            593 ; ---------------------------------
   5BD4                     594 _checkUserMovement::
                            595 ;src/game.c:156: cpct_scanKeyboard_f();
   5BD4 CD 92 53      [17]  596 	call	_cpct_scanKeyboard_f
                            597 ;src/game.c:158: if ((user.x<(TABLE_WIDTH-1)) && (cpct_isKeyPressed(keys.right))) {
   5BD7 3A 7C 58      [13]  598 	ld	a,(#_user + 0)
   5BDA D6 07         [ 7]  599 	sub	a, #0x07
   5BDC 30 1B         [12]  600 	jr	NC,00105$
   5BDE 2A 74 58      [16]  601 	ld	hl, (#(_keys + 0x0006) + 0)
   5BE1 CD 86 53      [17]  602 	call	_cpct_isKeyPressed
   5BE4 7D            [ 4]  603 	ld	a,l
   5BE5 B7            [ 4]  604 	or	a, a
   5BE6 28 11         [12]  605 	jr	Z,00105$
                            606 ;src/game.c:159: user.px = user.x;
   5BE8 01 7C 58      [10]  607 	ld	bc,#_user+0
   5BEB 0A            [ 7]  608 	ld	a,(bc)
   5BEC 32 7E 58      [13]  609 	ld	(#(_user + 0x0002)),a
                            610 ;src/game.c:160: user.x++;
   5BEF 0A            [ 7]  611 	ld	a,(bc)
   5BF0 3C            [ 4]  612 	inc	a
   5BF1 02            [ 7]  613 	ld	(bc),a
                            614 ;src/game.c:161: user.moved = 1;
   5BF2 21 80 58      [10]  615 	ld	hl,#(_user + 0x0004)
   5BF5 36 01         [10]  616 	ld	(hl),#0x01
   5BF7 18 20         [12]  617 	jr	00106$
   5BF9                     618 00105$:
                            619 ;src/game.c:162: } else if ((user.x>0) && (cpct_isKeyPressed(keys.left))) {
   5BF9 3A 7C 58      [13]  620 	ld	a, (#_user + 0)
   5BFC B7            [ 4]  621 	or	a, a
   5BFD 28 1A         [12]  622 	jr	Z,00106$
   5BFF 2A 72 58      [16]  623 	ld	hl, (#(_keys + 0x0004) + 0)
   5C02 CD 86 53      [17]  624 	call	_cpct_isKeyPressed
   5C05 7D            [ 4]  625 	ld	a,l
   5C06 B7            [ 4]  626 	or	a, a
   5C07 28 10         [12]  627 	jr	Z,00106$
                            628 ;src/game.c:163: user.px = user.x;
   5C09 01 7C 58      [10]  629 	ld	bc,#_user+0
   5C0C 0A            [ 7]  630 	ld	a,(bc)
   5C0D 32 7E 58      [13]  631 	ld	(#(_user + 0x0002)),a
                            632 ;src/game.c:164: user.x--;
   5C10 0A            [ 7]  633 	ld	a,(bc)
   5C11 C6 FF         [ 7]  634 	add	a,#0xFF
   5C13 02            [ 7]  635 	ld	(bc),a
                            636 ;src/game.c:165: user.moved = 1;
   5C14 21 80 58      [10]  637 	ld	hl,#(_user + 0x0004)
   5C17 36 01         [10]  638 	ld	(hl),#0x01
   5C19                     639 00106$:
                            640 ;src/game.c:168: if ((user.y<(TABLE_HEIGHT-1)) && (cpct_isKeyPressed(keys.down))) {
   5C19 01 7D 58      [10]  641 	ld	bc,#_user + 1
   5C1C 0A            [ 7]  642 	ld	a,(bc)
                            643 ;src/game.c:169: user.py = user.y;
                            644 ;src/game.c:171: user.moved = 1;
                            645 ;src/game.c:168: if ((user.y<(TABLE_HEIGHT-1)) && (cpct_isKeyPressed(keys.down))) {
   5C1D 5F            [ 4]  646 	ld	e,a
   5C1E D6 05         [ 7]  647 	sub	a, #0x05
   5C20 30 1D         [12]  648 	jr	NC,00112$
   5C22 2A 70 58      [16]  649 	ld	hl, (#(_keys + 0x0002) + 0)
   5C25 C5            [11]  650 	push	bc
   5C26 CD 86 53      [17]  651 	call	_cpct_isKeyPressed
   5C29 55            [ 4]  652 	ld	d,l
   5C2A C1            [10]  653 	pop	bc
   5C2B 0A            [ 7]  654 	ld	a,(bc)
   5C2C 5F            [ 4]  655 	ld	e,a
   5C2D 7A            [ 4]  656 	ld	a,d
   5C2E B7            [ 4]  657 	or	a, a
   5C2F 28 0E         [12]  658 	jr	Z,00112$
                            659 ;src/game.c:169: user.py = user.y;
   5C31 21 7F 58      [10]  660 	ld	hl,#(_user + 0x0003)
   5C34 73            [ 7]  661 	ld	(hl),e
                            662 ;src/game.c:170: user.y++;
   5C35 0A            [ 7]  663 	ld	a,(bc)
   5C36 3C            [ 4]  664 	inc	a
   5C37 02            [ 7]  665 	ld	(bc),a
                            666 ;src/game.c:171: user.moved = 1;
   5C38 21 80 58      [10]  667 	ld	hl,#(_user + 0x0004)
   5C3B 36 01         [10]  668 	ld	(hl),#0x01
   5C3D 18 1D         [12]  669 	jr	00113$
   5C3F                     670 00112$:
                            671 ;src/game.c:172: } else if ((user.y>0) && (cpct_isKeyPressed(keys.up))) {
   5C3F 7B            [ 4]  672 	ld	a,e
   5C40 B7            [ 4]  673 	or	a, a
   5C41 28 19         [12]  674 	jr	Z,00113$
   5C43 2A 6E 58      [16]  675 	ld	hl, (#_keys + 0)
   5C46 C5            [11]  676 	push	bc
   5C47 CD 86 53      [17]  677 	call	_cpct_isKeyPressed
   5C4A C1            [10]  678 	pop	bc
   5C4B 7D            [ 4]  679 	ld	a,l
   5C4C B7            [ 4]  680 	or	a, a
   5C4D 28 0D         [12]  681 	jr	Z,00113$
                            682 ;src/game.c:173: user.py = user.y;
   5C4F 0A            [ 7]  683 	ld	a,(bc)
   5C50 32 7F 58      [13]  684 	ld	(#(_user + 0x0003)),a
                            685 ;src/game.c:174: user.y--;
   5C53 0A            [ 7]  686 	ld	a,(bc)
   5C54 C6 FF         [ 7]  687 	add	a,#0xFF
   5C56 02            [ 7]  688 	ld	(bc),a
                            689 ;src/game.c:175: user.moved = 1;
   5C57 21 80 58      [10]  690 	ld	hl,#(_user + 0x0004)
   5C5A 36 01         [10]  691 	ld	(hl),#0x01
   5C5C                     692 00113$:
                            693 ;src/game.c:177: if ((userTable[user.x][user.y]==0) && (cpct_isKeyPressed(keys.fire))){
   5C5C 3A 7C 58      [13]  694 	ld	a, (#_user + 0)
   5C5F 5F            [ 4]  695 	ld	e,a
   5C60 16 00         [ 7]  696 	ld	d,#0x00
   5C62 6B            [ 4]  697 	ld	l, e
   5C63 62            [ 4]  698 	ld	h, d
   5C64 29            [11]  699 	add	hl, hl
   5C65 19            [11]  700 	add	hl, de
   5C66 29            [11]  701 	add	hl, hl
   5C67 EB            [ 4]  702 	ex	de,hl
   5C68 21 0E 58      [10]  703 	ld	hl,#_userTable
   5C6B 19            [11]  704 	add	hl,de
   5C6C EB            [ 4]  705 	ex	de,hl
   5C6D 0A            [ 7]  706 	ld	a,(bc)
   5C6E 4F            [ 4]  707 	ld	c,a
   5C6F 69            [ 4]  708 	ld	l,c
   5C70 26 00         [ 7]  709 	ld	h,#0x00
   5C72 19            [11]  710 	add	hl,de
   5C73 7E            [ 7]  711 	ld	a,(hl)
   5C74 B7            [ 4]  712 	or	a, a
   5C75 20 0D         [12]  713 	jr	NZ,00116$
   5C77 2A 76 58      [16]  714 	ld	hl, (#(_keys + 0x0008) + 0)
   5C7A CD 86 53      [17]  715 	call	_cpct_isKeyPressed
   5C7D 7D            [ 4]  716 	ld	a,l
   5C7E B7            [ 4]  717 	or	a, a
   5C7F 28 03         [12]  718 	jr	Z,00116$
                            719 ;src/game.c:178: insertCard();
   5C81 CD D7 59      [17]  720 	call	_insertCard
   5C84                     721 00116$:
                            722 ;src/game.c:181: if (cpct_isKeyPressed(keys.abort)){
   5C84 2A 7A 58      [16]  723 	ld	hl, (#(_keys + 0x000c) + 0)
   5C87 CD 86 53      [17]  724 	call	_cpct_isKeyPressed
   5C8A 7D            [ 4]  725 	ld	a,l
   5C8B B7            [ 4]  726 	or	a, a
   5C8C C8            [11]  727 	ret	Z
                            728 ;src/game.c:183: reset_cpc();
   5C8D C3 34 53      [10]  729 	jp  _reset_cpc
                            730 ;src/game.c:187: void game(){
                            731 ;	---------------------------------
                            732 ; Function game
                            733 ; ---------------------------------
   5C90                     734 _game::
                            735 ;src/game.c:188: initGame();
   5C90 CD 78 59      [17]  736 	call	_initGame
                            737 ;src/game.c:189: drawScreen();
   5C93 CD C5 59      [17]  738 	call	_drawScreen
                            739 ;src/game.c:190: drawUser();
   5C96 CD 57 5B      [17]  740 	call	_drawUser
                            741 ;src/game.c:191: while (1){
   5C99                     742 00106$:
                            743 ;src/game.c:192: checkUserMovement();
   5C99 CD D4 5B      [17]  744 	call	_checkUserMovement
                            745 ;src/game.c:193: if (user.moved){
   5C9C 3A 80 58      [13]  746 	ld	a, (#(_user + 0x0004) + 0)
   5C9F B7            [ 4]  747 	or	a, a
   5CA0 28 08         [12]  748 	jr	Z,00102$
                            749 ;src/game.c:194: drawUser();
   5CA2 CD 57 5B      [17]  750 	call	_drawUser
                            751 ;src/game.c:195: user.moved = 0;
   5CA5 21 80 58      [10]  752 	ld	hl,#(_user + 0x0004)
   5CA8 36 00         [10]  753 	ld	(hl),#0x00
   5CAA                     754 00102$:
                            755 ;src/game.c:197: if (abort)
   5CAA 3A 83 58      [13]  756 	ld	a,(#_abort + 0)
   5CAD B7            [ 4]  757 	or	a, a
   5CAE C0            [11]  758 	ret	NZ
                            759 ;src/game.c:199: delay(20);
   5CAF 21 00 00      [10]  760 	ld	hl,#0x0000
   5CB2 E5            [11]  761 	push	hl
   5CB3 21 14 00      [10]  762 	ld	hl,#0x0014
   5CB6 E5            [11]  763 	push	hl
   5CB7 CD 4D 59      [17]  764 	call	_delay
   5CBA F1            [10]  765 	pop	af
   5CBB F1            [10]  766 	pop	af
   5CBC 18 DB         [12]  767 	jr	00106$
                            768 	.area _CODE
                            769 	.area _INITIALIZER
   58E9                     770 __xinit__tile_buffer_0:
   58E9 00                  771 	.db #0x00	; 0
   58EA 00                  772 	.db #0x00	; 0
   58EB 00                  773 	.db #0x00	; 0
   58EC 00                  774 	.db #0x00	; 0
   58ED 00                  775 	.db #0x00	; 0
   58EE 00                  776 	.db #0x00	; 0
   58EF 00                  777 	.db #0x00	; 0
   58F0 00                  778 	.db #0x00	; 0
   58F1 00                  779 	.db #0x00	; 0
   58F2 00                  780 	.db #0x00	; 0
   58F3 00                  781 	.db #0x00	; 0
   58F4 00                  782 	.db #0x00	; 0
   58F5 00                  783 	.db #0x00	; 0
   58F6 00                  784 	.db #0x00	; 0
   58F7 00                  785 	.db #0x00	; 0
   58F8 00                  786 	.db #0x00	; 0
   58F9 00                  787 	.db #0x00	; 0
   58FA 00                  788 	.db #0x00	; 0
   58FB 00                  789 	.db #0x00	; 0
   58FC 00                  790 	.db #0x00	; 0
   58FD 00                  791 	.db #0x00	; 0
   58FE 00                  792 	.db #0x00	; 0
   58FF 00                  793 	.db #0x00	; 0
   5900 00                  794 	.db #0x00	; 0
   5901 00                  795 	.db #0x00	; 0
   5902 00                  796 	.db #0x00	; 0
   5903 00                  797 	.db #0x00	; 0
   5904 00                  798 	.db #0x00	; 0
   5905 00                  799 	.db #0x00	; 0
   5906 00                  800 	.db #0x00	; 0
   5907 00                  801 	.db #0x00	; 0
   5908 00                  802 	.db #0x00	; 0
   5909 00                  803 	.db #0x00	; 0
   590A 00                  804 	.db #0x00	; 0
   590B 00                  805 	.db #0x00	; 0
   590C 00                  806 	.db #0x00	; 0
   590D 00                  807 	.db #0x00	; 0
   590E 00                  808 	.db #0x00	; 0
   590F 00                  809 	.db #0x00	; 0
   5910 00                  810 	.db #0x00	; 0
   5911 00                  811 	.db #0x00	; 0
   5912 00                  812 	.db #0x00	; 0
   5913 00                  813 	.db #0x00	; 0
   5914 00                  814 	.db #0x00	; 0
   5915 00                  815 	.db #0x00	; 0
   5916 00                  816 	.db #0x00	; 0
   5917 00                  817 	.db #0x00	; 0
   5918 00                  818 	.db #0x00	; 0
   5919 00                  819 	.db #0x00	; 0
   591A 00                  820 	.db #0x00	; 0
   591B                     821 __xinit__tile_buffer_1:
   591B 00                  822 	.db #0x00	; 0
   591C 00                  823 	.db #0x00	; 0
   591D 00                  824 	.db #0x00	; 0
   591E 00                  825 	.db #0x00	; 0
   591F 00                  826 	.db #0x00	; 0
   5920 00                  827 	.db #0x00	; 0
   5921 00                  828 	.db #0x00	; 0
   5922 00                  829 	.db #0x00	; 0
   5923 00                  830 	.db #0x00	; 0
   5924 00                  831 	.db #0x00	; 0
   5925 00                  832 	.db #0x00	; 0
   5926 00                  833 	.db #0x00	; 0
   5927 00                  834 	.db #0x00	; 0
   5928 00                  835 	.db #0x00	; 0
   5929 00                  836 	.db #0x00	; 0
   592A 00                  837 	.db #0x00	; 0
   592B 00                  838 	.db #0x00	; 0
   592C 00                  839 	.db #0x00	; 0
   592D 00                  840 	.db #0x00	; 0
   592E 00                  841 	.db #0x00	; 0
   592F 00                  842 	.db #0x00	; 0
   5930 00                  843 	.db #0x00	; 0
   5931 00                  844 	.db #0x00	; 0
   5932 00                  845 	.db #0x00	; 0
   5933 00                  846 	.db #0x00	; 0
   5934 00                  847 	.db #0x00	; 0
   5935 00                  848 	.db #0x00	; 0
   5936 00                  849 	.db #0x00	; 0
   5937 00                  850 	.db #0x00	; 0
   5938 00                  851 	.db #0x00	; 0
   5939 00                  852 	.db #0x00	; 0
   593A 00                  853 	.db #0x00	; 0
   593B 00                  854 	.db #0x00	; 0
   593C 00                  855 	.db #0x00	; 0
   593D 00                  856 	.db #0x00	; 0
   593E 00                  857 	.db #0x00	; 0
   593F 00                  858 	.db #0x00	; 0
   5940 00                  859 	.db #0x00	; 0
   5941 00                  860 	.db #0x00	; 0
   5942 00                  861 	.db #0x00	; 0
   5943 00                  862 	.db #0x00	; 0
   5944 00                  863 	.db #0x00	; 0
   5945 00                  864 	.db #0x00	; 0
   5946 00                  865 	.db #0x00	; 0
   5947 00                  866 	.db #0x00	; 0
   5948 00                  867 	.db #0x00	; 0
   5949 00                  868 	.db #0x00	; 0
   594A 00                  869 	.db #0x00	; 0
   594B 00                  870 	.db #0x00	; 0
   594C 00                  871 	.db #0x00	; 0
                            872 	.area _CABS (ABS)
