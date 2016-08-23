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
                             26 	.globl _tile_buffer_1
                             27 	.globl _tile_buffer_0
                             28 	.globl _abort
                             29 	.globl _user
                             30 	.globl _keys
                             31 	.globl _enemyTable
                             32 	.globl _userTable
                             33 	.globl _enemyY
                             34 	.globl _enemyX
                             35 	.globl _cards
                             36 	.globl _game
                             37 ;--------------------------------------------------------
                             38 ; special function registers
                             39 ;--------------------------------------------------------
                             40 ;--------------------------------------------------------
                             41 ; ram data
                             42 ;--------------------------------------------------------
                             43 	.area _DATA
   608D                      44 _enemyX::
   608D                      45 	.ds 1
   608E                      46 _enemyY::
   608E                      47 	.ds 1
   608F                      48 _userTable::
   608F                      49 	.ds 48
   60BF                      50 _enemyTable::
   60BF                      51 	.ds 48
   60EF                      52 _keys::
   60EF                      53 	.ds 14
   60FD                      54 _user::
   60FD                      55 	.ds 7
   6104                      56 _abort::
   6104                      57 	.ds 1
                             58 ;--------------------------------------------------------
                             59 ; ram data
                             60 ;--------------------------------------------------------
                             61 	.area _INITIALIZED
   6106                      62 _tile_buffer_0::
   6106                      63 	.ds 50
   6138                      64 _tile_buffer_1::
   6138                      65 	.ds 50
                             66 ;--------------------------------------------------------
                             67 ; absolute external ram data
                             68 ;--------------------------------------------------------
                             69 	.area _DABS (ABS)
                             70 ;--------------------------------------------------------
                             71 ; global & static initialisations
                             72 ;--------------------------------------------------------
                             73 	.area _HOME
                             74 	.area _GSINIT
                             75 	.area _GSFINAL
                             76 	.area _GSINIT
                             77 ;--------------------------------------------------------
                             78 ; Home
                             79 ;--------------------------------------------------------
                             80 	.area _HOME
                             81 	.area _HOME
                             82 ;--------------------------------------------------------
                             83 ; code
                             84 ;--------------------------------------------------------
                             85 	.area _CODE
                             86 ;src/game.c:56: cpctm_createTransparentMaskTable(hc_tablatrans, 0x100, M0, 0);
                             87 ;	---------------------------------
                             88 ; Function dummy_cpct_transparentMaskTable0M0_container
                             89 ; ---------------------------------
   41F4                      90 _dummy_cpct_transparentMaskTable0M0_container::
                             91 	.area _hc_tablatrans_ (ABS) 
   0100                      92 	.org 0x100 
   0100                      93 	 _hc_tablatrans::
   0100 FF AA 55 00 AA AA    94 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0108 55 00 55 00 00 00    95 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0110 AA AA 00 00 AA AA    96 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0118 00 00 00 00 00 00    97 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0120 55 00 55 00 00 00    98 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0128 55 00 55 00 00 00    99 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0130 00 00 00 00 00 00   100 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0138 00 00 00 00 00 00   101 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0140 AA AA 00 00 AA AA   102 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0148 00 00 00 00 00 00   103 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0150 AA AA 00 00 AA AA   104 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0158 00 00 00 00 00 00   105 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0160 00 00 00 00 00 00   106 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0168 00 00 00 00 00 00   107 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0170 00 00 00 00 00 00   108 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0178 00 00 00 00 00 00   109 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0180 55 00 55 00 00 00   110 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0188 55 00 55 00 00 00   111 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0190 00 00 00 00 00 00   112 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0198 00 00 00 00 00 00   113 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A0 55 00 55 00 00 00   114 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A8 55 00 55 00 00 00   115 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B0 00 00 00 00 00 00   116 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B8 00 00 00 00 00 00   117 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C0 00 00 00 00 00 00   118 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C8 00 00 00 00 00 00   119 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D0 00 00 00 00 00 00   120 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D8 00 00 00 00 00 00   121 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E0 00 00 00 00 00 00   122 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E8 00 00 00 00 00 00   123 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F0 00 00 00 00 00 00   124 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F8 00 00 00 00 00 00   125 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            126 	.area _CSEG (REL, CON) 
                            127 ;src/game.c:67: void delay(u32 cycles) {
                            128 ;	---------------------------------
                            129 ; Function delay
                            130 ; ---------------------------------
   61CE                     131 _delay::
                            132 ;src/game.c:69: for (i = 0; i < cycles; i++) {
   61CE 01 00 00      [10]  133 	ld	bc,#0x0000
   61D1 11 00 00      [10]  134 	ld	de,#0x0000
   61D4                     135 00103$:
   61D4 21 02 00      [10]  136 	ld	hl,#2
   61D7 39            [11]  137 	add	hl,sp
   61D8 79            [ 4]  138 	ld	a,c
   61D9 96            [ 7]  139 	sub	a, (hl)
   61DA 78            [ 4]  140 	ld	a,b
   61DB 23            [ 6]  141 	inc	hl
   61DC 9E            [ 7]  142 	sbc	a, (hl)
   61DD 7B            [ 4]  143 	ld	a,e
   61DE 23            [ 6]  144 	inc	hl
   61DF 9E            [ 7]  145 	sbc	a, (hl)
   61E0 7A            [ 4]  146 	ld	a,d
   61E1 23            [ 6]  147 	inc	hl
   61E2 9E            [ 7]  148 	sbc	a, (hl)
   61E3 D0            [11]  149 	ret	NC
                            150 ;src/game.c:72: __endasm;
   61E4 76            [ 4]  151 	halt
                            152 ;src/game.c:69: for (i = 0; i < cycles; i++) {
   61E5 0C            [ 4]  153 	inc	c
   61E6 20 EC         [12]  154 	jr	NZ,00103$
   61E8 04            [ 4]  155 	inc	b
   61E9 20 E9         [12]  156 	jr	NZ,00103$
   61EB 1C            [ 4]  157 	inc	e
   61EC 20 E6         [12]  158 	jr	NZ,00103$
   61EE 14            [ 4]  159 	inc	d
   61EF 18 E3         [12]  160 	jr	00103$
   61F1                     161 _cards:
   61F1 FA 40               162 	.dw _hc_figures_0
   61F3 FA 40               163 	.dw _hc_figures_0
   61F5 2C 41               164 	.dw _hc_figures_1
   61F7 5E 41               165 	.dw _hc_figures_2
   61F9 90 41               166 	.dw _hc_figures_3
                            167 ;src/game.c:77: void initGame() {
                            168 ;	---------------------------------
                            169 ; Function initGame
                            170 ; ---------------------------------
   61FB                     171 _initGame::
                            172 ;src/game.c:78: abort = 0;
   61FB 21 04 61      [10]  173 	ld	hl,#_abort + 0
   61FE 36 00         [10]  174 	ld	(hl), #0x00
                            175 ;src/game.c:80: user.x = 0;
   6200 21 FD 60      [10]  176 	ld	hl,#_user
   6203 36 00         [10]  177 	ld	(hl),#0x00
                            178 ;src/game.c:81: user.y = 0;
   6205 21 FE 60      [10]  179 	ld	hl,#(_user + 0x0001)
   6208 36 00         [10]  180 	ld	(hl),#0x00
                            181 ;src/game.c:82: user.px = 0;
   620A 21 FF 60      [10]  182 	ld	hl,#(_user + 0x0002)
   620D 36 00         [10]  183 	ld	(hl),#0x00
                            184 ;src/game.c:83: user.py = 0;
   620F 21 00 61      [10]  185 	ld	hl,#(_user + 0x0003)
   6212 36 00         [10]  186 	ld	(hl),#0x00
                            187 ;src/game.c:84: user.moved = 0;
   6214 21 01 61      [10]  188 	ld	hl,#(_user + 0x0004)
   6217 36 00         [10]  189 	ld	(hl),#0x00
                            190 ;src/game.c:85: user.buffer = tile_buffer_0;
   6219 21 06 61      [10]  191 	ld	hl,#_tile_buffer_0
   621C 22 02 61      [16]  192 	ld	((_user + 0x0005)), hl
                            193 ;src/game.c:87: keys.up    = Key_CursorUp;
   621F 21 00 01      [10]  194 	ld	hl,#0x0100
   6222 22 EF 60      [16]  195 	ld	(_keys), hl
                            196 ;src/game.c:88: keys.down  = Key_CursorDown;
   6225 26 04         [ 7]  197 	ld	h, #0x04
   6227 22 F1 60      [16]  198 	ld	((_keys + 0x0002)), hl
                            199 ;src/game.c:89: keys.left  = Key_CursorLeft;
   622A 21 01 01      [10]  200 	ld	hl,#0x0101
   622D 22 F3 60      [16]  201 	ld	((_keys + 0x0004)), hl
                            202 ;src/game.c:90: keys.right = Key_CursorRight;
   6230 21 00 02      [10]  203 	ld	hl,#0x0200
   6233 22 F5 60      [16]  204 	ld	((_keys + 0x0006)), hl
                            205 ;src/game.c:91: keys.fire  = Key_Space;
   6236 21 05 80      [10]  206 	ld	hl,#0x8005
   6239 22 F7 60      [16]  207 	ld	((_keys + 0x0008)), hl
                            208 ;src/game.c:92: keys.pause = Key_Del;
   623C 2E 09         [ 7]  209 	ld	l, #0x09
   623E 22 F9 60      [16]  210 	ld	((_keys + 0x000a)), hl
                            211 ;src/game.c:93: keys.abort = Key_Esc;
   6241 21 08 04      [10]  212 	ld	hl,#0x0408
   6244 22 FB 60      [16]  213 	ld	((_keys + 0x000c)), hl
   6247 C9            [10]  214 	ret
                            215 ;src/game.c:96: void drawScreen() {
                            216 ;	---------------------------------
                            217 ; Function drawScreen
                            218 ; ---------------------------------
   6248                     219 _drawScreen::
                            220 ;src/game.c:99: for (j = 0; j < TABLE_HEIGHT; j++) {
   6248 0E 00         [ 7]  221 	ld	c,#0x00
   624A                     222 00106$:
                            223 ;src/game.c:100: for (i = 0; i < TABLE_WIDTH; i++) {
   624A 06 08         [ 7]  224 	ld	b,#0x08
   624C                     225 00105$:
   624C 58            [ 4]  226 	ld	e,b
   624D 1D            [ 4]  227 	dec	e
   624E 7B            [ 4]  228 	ld	a,e
   624F 47            [ 4]  229 	ld	b,a
   6250 B7            [ 4]  230 	or	a, a
   6251 20 F9         [12]  231 	jr	NZ,00105$
                            232 ;src/game.c:99: for (j = 0; j < TABLE_HEIGHT; j++) {
   6253 0C            [ 4]  233 	inc	c
   6254 79            [ 4]  234 	ld	a,c
   6255 D6 06         [ 7]  235 	sub	a, #0x06
   6257 38 F1         [12]  236 	jr	C,00106$
   6259 C9            [10]  237 	ret
                            238 ;src/game.c:105: void insertCardUser(u8 col) {
                            239 ;	---------------------------------
                            240 ; Function insertCardUser
                            241 ; ---------------------------------
   625A                     242 _insertCardUser::
   625A DD E5         [15]  243 	push	ix
   625C DD 21 00 00   [14]  244 	ld	ix,#0
   6260 DD 39         [15]  245 	add	ix,sp
   6262 21 F6 FF      [10]  246 	ld	hl,#-10
   6265 39            [11]  247 	add	hl,sp
   6266 F9            [ 6]  248 	ld	sp,hl
                            249 ;src/game.c:108: u8 stopped = 0;
   6267 DD 36 F7 00   [19]  250 	ld	-9 (ix),#0x00
                            251 ;src/game.c:111: row = 5;
   626B DD 36 F8 05   [19]  252 	ld	-8 (ix),#0x05
                            253 ;src/game.c:112: card = (cpct_rand() / 64) + 1;
   626F CD 08 55      [17]  254 	call	_cpct_getRandom_mxor_u8
   6272 7D            [ 4]  255 	ld	a,l
   6273 07            [ 4]  256 	rlca
   6274 07            [ 4]  257 	rlca
   6275 E6 03         [ 7]  258 	and	a,#0x03
   6277 3C            [ 4]  259 	inc	a
   6278 DD 77 F6      [19]  260 	ld	-10 (ix),a
                            261 ;src/game.c:114: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X + (col * (TILE_W + 1)), USER_TABLE_Y + (row * (TILE_H + 2)));
   627B DD 7E 04      [19]  262 	ld	a,4 (ix)
   627E 4F            [ 4]  263 	ld	c,a
   627F 87            [ 4]  264 	add	a, a
   6280 81            [ 4]  265 	add	a, c
   6281 87            [ 4]  266 	add	a, a
   6282 C6 02         [ 7]  267 	add	a, #0x02
   6284 DD 77 FF      [19]  268 	ld	-1 (ix),a
   6287 3E 98         [ 7]  269 	ld	a,#0x98
   6289 F5            [11]  270 	push	af
   628A 33            [ 6]  271 	inc	sp
   628B DD 7E FF      [19]  272 	ld	a,-1 (ix)
   628E F5            [11]  273 	push	af
   628F 33            [ 6]  274 	inc	sp
   6290 21 00 C0      [10]  275 	ld	hl,#0xC000
   6293 E5            [11]  276 	push	hl
   6294 CD 6D 5F      [17]  277 	call	_cpct_getScreenPtr
   6297 EB            [ 4]  278 	ex	de,hl
                            279 ;src/game.c:115: cpc_GetSp((u8*) tile_buffer_1, 10, 5, (int) pvmem);
   6298 4B            [ 4]  280 	ld	c, e
   6299 42            [ 4]  281 	ld	b, d
   629A D5            [11]  282 	push	de
   629B C5            [11]  283 	push	bc
   629C 21 0A 05      [10]  284 	ld	hl,#0x050A
   629F E5            [11]  285 	push	hl
   62A0 21 38 61      [10]  286 	ld	hl,#_tile_buffer_1
   62A3 E5            [11]  287 	push	hl
   62A4 CD 68 53      [17]  288 	call	_cpc_GetSp
   62A7 D1            [10]  289 	pop	de
                            290 ;src/game.c:116: cpct_drawSpriteMaskedAlignedTable(cards[card], pvmem, TILE_W, TILE_H, hc_tablatrans);
   62A8 01 F1 61      [10]  291 	ld	bc,#_cards+0
   62AB DD 6E F6      [19]  292 	ld	l,-10 (ix)
   62AE 26 00         [ 7]  293 	ld	h,#0x00
   62B0 29            [11]  294 	add	hl, hl
   62B1 09            [11]  295 	add	hl,bc
   62B2 DD 75 FD      [19]  296 	ld	-3 (ix),l
   62B5 DD 74 FE      [19]  297 	ld	-2 (ix),h
   62B8 DD 6E FD      [19]  298 	ld	l,-3 (ix)
   62BB DD 66 FE      [19]  299 	ld	h,-2 (ix)
   62BE 4E            [ 7]  300 	ld	c,(hl)
   62BF 23            [ 6]  301 	inc	hl
   62C0 46            [ 7]  302 	ld	b,(hl)
   62C1 21 00 01      [10]  303 	ld	hl,#_hc_tablatrans
   62C4 E5            [11]  304 	push	hl
   62C5 21 05 0A      [10]  305 	ld	hl,#0x0A05
   62C8 E5            [11]  306 	push	hl
   62C9 D5            [11]  307 	push	de
   62CA C5            [11]  308 	push	bc
   62CB CD 8D 5F      [17]  309 	call	_cpct_drawSpriteMaskedAlignedTable
                            310 ;src/game.c:118: while (!stopped) {
   62CE 01 8F 60      [10]  311 	ld	bc,#_userTable+0
   62D1 DD 5E 04      [19]  312 	ld	e,4 (ix)
   62D4 16 00         [ 7]  313 	ld	d,#0x00
   62D6 6B            [ 4]  314 	ld	l, e
   62D7 62            [ 4]  315 	ld	h, d
   62D8 29            [11]  316 	add	hl, hl
   62D9 19            [11]  317 	add	hl, de
   62DA 29            [11]  318 	add	hl, hl
   62DB 09            [11]  319 	add	hl,bc
   62DC DD 75 FB      [19]  320 	ld	-5 (ix),l
   62DF DD 74 FC      [19]  321 	ld	-4 (ix),h
   62E2 DD 7E FB      [19]  322 	ld	a,-5 (ix)
   62E5 DD 77 F9      [19]  323 	ld	-7 (ix),a
   62E8 DD 7E FC      [19]  324 	ld	a,-4 (ix)
   62EB DD 77 FA      [19]  325 	ld	-6 (ix),a
   62EE                     326 00107$:
   62EE DD 7E F7      [19]  327 	ld	a,-9 (ix)
   62F1 B7            [ 4]  328 	or	a, a
   62F2 C2 98 63      [10]  329 	jp	NZ,00109$
                            330 ;src/game.c:119: delay(10);
   62F5 21 00 00      [10]  331 	ld	hl,#0x0000
   62F8 E5            [11]  332 	push	hl
   62F9 21 0A 00      [10]  333 	ld	hl,#0x000A
   62FC E5            [11]  334 	push	hl
   62FD CD CE 61      [17]  335 	call	_delay
   6300 F1            [10]  336 	pop	af
   6301 F1            [10]  337 	pop	af
                            338 ;src/game.c:120: if ((row > 0) && (userTable[col][row - 1] == 0)) {
   6302 DD 7E F8      [19]  339 	ld	a,-8 (ix)
   6305 B7            [ 4]  340 	or	a, a
   6306 CA 91 63      [10]  341 	jp	Z,00104$
   6309 DD 4E F8      [19]  342 	ld	c,-8 (ix)
   630C 0D            [ 4]  343 	dec	c
   630D DD 6E F9      [19]  344 	ld	l,-7 (ix)
   6310 DD 66 FA      [19]  345 	ld	h,-6 (ix)
   6313 06 00         [ 7]  346 	ld	b,#0x00
   6315 09            [11]  347 	add	hl, bc
   6316 7E            [ 7]  348 	ld	a,(hl)
   6317 B7            [ 4]  349 	or	a, a
   6318 20 77         [12]  350 	jr	NZ,00104$
                            351 ;src/game.c:121: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X + (col * (TILE_W + 1)), USER_TABLE_Y + (row * (TILE_H + 2)));
   631A DD 7E F8      [19]  352 	ld	a,-8 (ix)
   631D 5F            [ 4]  353 	ld	e,a
   631E 87            [ 4]  354 	add	a, a
   631F 83            [ 4]  355 	add	a, e
   6320 87            [ 4]  356 	add	a, a
   6321 87            [ 4]  357 	add	a, a
   6322 C6 5C         [ 7]  358 	add	a, #0x5C
   6324 47            [ 4]  359 	ld	b,a
   6325 C5            [11]  360 	push	bc
   6326 C5            [11]  361 	push	bc
   6327 33            [ 6]  362 	inc	sp
   6328 DD 7E FF      [19]  363 	ld	a,-1 (ix)
   632B F5            [11]  364 	push	af
   632C 33            [ 6]  365 	inc	sp
   632D 21 00 C0      [10]  366 	ld	hl,#0xC000
   6330 E5            [11]  367 	push	hl
   6331 CD 6D 5F      [17]  368 	call	_cpct_getScreenPtr
   6334 EB            [ 4]  369 	ex	de,hl
   6335 21 05 0A      [10]  370 	ld	hl,#0x0A05
   6338 E5            [11]  371 	push	hl
   6339 D5            [11]  372 	push	de
   633A 21 38 61      [10]  373 	ld	hl,#_tile_buffer_1
   633D E5            [11]  374 	push	hl
   633E CD 38 54      [17]  375 	call	_cpct_drawSprite
   6341 C1            [10]  376 	pop	bc
                            377 ;src/game.c:123: row--;
                            378 ;src/game.c:124: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X + (col * (TILE_W + 1)), USER_TABLE_Y + (row * (TILE_H + 2)));
   6342 DD 71 F8      [19]  379 	ld	-8 (ix), c
   6345 79            [ 4]  380 	ld	a,c
   6346 87            [ 4]  381 	add	a, a
   6347 81            [ 4]  382 	add	a, c
   6348 87            [ 4]  383 	add	a, a
   6349 87            [ 4]  384 	add	a, a
   634A C6 5C         [ 7]  385 	add	a, #0x5C
   634C 47            [ 4]  386 	ld	b,a
   634D C5            [11]  387 	push	bc
   634E 33            [ 6]  388 	inc	sp
   634F DD 7E FF      [19]  389 	ld	a,-1 (ix)
   6352 F5            [11]  390 	push	af
   6353 33            [ 6]  391 	inc	sp
   6354 21 00 C0      [10]  392 	ld	hl,#0xC000
   6357 E5            [11]  393 	push	hl
   6358 CD 6D 5F      [17]  394 	call	_cpct_getScreenPtr
   635B 4D            [ 4]  395 	ld	c,l
   635C 44            [ 4]  396 	ld	b,h
                            397 ;src/game.c:125: cpc_GetSp((u8*) tile_buffer_1, 10, 5, (int) pvmem);
   635D 59            [ 4]  398 	ld	e, c
   635E 50            [ 4]  399 	ld	d, b
   635F C5            [11]  400 	push	bc
   6360 D5            [11]  401 	push	de
   6361 21 0A 05      [10]  402 	ld	hl,#0x050A
   6364 E5            [11]  403 	push	hl
   6365 21 38 61      [10]  404 	ld	hl,#_tile_buffer_1
   6368 E5            [11]  405 	push	hl
   6369 CD 68 53      [17]  406 	call	_cpc_GetSp
   636C C1            [10]  407 	pop	bc
                            408 ;src/game.c:126: cpct_drawSpriteMaskedAlignedTable(cards[card], pvmem, TILE_W, TILE_H, hc_tablatrans);
   636D DD 6E FD      [19]  409 	ld	l,-3 (ix)
   6370 DD 66 FE      [19]  410 	ld	h,-2 (ix)
   6373 5E            [ 7]  411 	ld	e,(hl)
   6374 23            [ 6]  412 	inc	hl
   6375 56            [ 7]  413 	ld	d,(hl)
   6376 21 00 01      [10]  414 	ld	hl,#_hc_tablatrans
   6379 E5            [11]  415 	push	hl
   637A 21 05 0A      [10]  416 	ld	hl,#0x0A05
   637D E5            [11]  417 	push	hl
   637E C5            [11]  418 	push	bc
   637F D5            [11]  419 	push	de
   6380 CD 8D 5F      [17]  420 	call	_cpct_drawSpriteMaskedAlignedTable
                            421 ;src/game.c:127: if (row == 0)
   6383 DD 7E F8      [19]  422 	ld	a,-8 (ix)
   6386 B7            [ 4]  423 	or	a, a
   6387 C2 EE 62      [10]  424 	jp	NZ,00107$
                            425 ;src/game.c:128: stopped = 1;
   638A DD 36 F7 01   [19]  426 	ld	-9 (ix),#0x01
   638E C3 EE 62      [10]  427 	jp	00107$
   6391                     428 00104$:
                            429 ;src/game.c:130: stopped = 1;
   6391 DD 36 F7 01   [19]  430 	ld	-9 (ix),#0x01
   6395 C3 EE 62      [10]  431 	jp	00107$
   6398                     432 00109$:
                            433 ;src/game.c:133: userTable[col][row] = card;
   6398 DD 7E FB      [19]  434 	ld	a,-5 (ix)
   639B DD 86 F8      [19]  435 	add	a, -8 (ix)
   639E 4F            [ 4]  436 	ld	c,a
   639F DD 7E FC      [19]  437 	ld	a,-4 (ix)
   63A2 CE 00         [ 7]  438 	adc	a, #0x00
   63A4 47            [ 4]  439 	ld	b,a
   63A5 DD 7E F6      [19]  440 	ld	a,-10 (ix)
   63A8 02            [ 7]  441 	ld	(bc),a
   63A9 DD F9         [10]  442 	ld	sp, ix
   63AB DD E1         [14]  443 	pop	ix
   63AD C9            [10]  444 	ret
                            445 ;src/game.c:136: void insertCardEnemy(u8 col) {
                            446 ;	---------------------------------
                            447 ; Function insertCardEnemy
                            448 ; ---------------------------------
   63AE                     449 _insertCardEnemy::
   63AE DD E5         [15]  450 	push	ix
   63B0 DD 21 00 00   [14]  451 	ld	ix,#0
   63B4 DD 39         [15]  452 	add	ix,sp
   63B6 21 F6 FF      [10]  453 	ld	hl,#-10
   63B9 39            [11]  454 	add	hl,sp
   63BA F9            [ 6]  455 	ld	sp,hl
                            456 ;src/game.c:139: u8 stopped = 0;
   63BB DD 36 F6 00   [19]  457 	ld	-10 (ix),#0x00
                            458 ;src/game.c:142: row = 0;
   63BF DD 36 F8 00   [19]  459 	ld	-8 (ix),#0x00
                            460 ;src/game.c:143: card = (cpct_rand() / 64) + 1;
   63C3 CD 08 55      [17]  461 	call	_cpct_getRandom_mxor_u8
   63C6 7D            [ 4]  462 	ld	a,l
   63C7 07            [ 4]  463 	rlca
   63C8 07            [ 4]  464 	rlca
   63C9 E6 03         [ 7]  465 	and	a,#0x03
   63CB 3C            [ 4]  466 	inc	a
   63CC DD 77 F7      [19]  467 	ld	-9 (ix),a
                            468 ;src/game.c:145: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, ENEMY_TABLE_X + (col * (TILE_W + 1)), ENEMY_TABLE_Y + (row * (TILE_H + 2)));
   63CF DD 7E 04      [19]  469 	ld	a,4 (ix)
   63D2 4F            [ 4]  470 	ld	c,a
   63D3 87            [ 4]  471 	add	a, a
   63D4 81            [ 4]  472 	add	a, c
   63D5 87            [ 4]  473 	add	a, a
   63D6 C6 02         [ 7]  474 	add	a, #0x02
   63D8 DD 77 F9      [19]  475 	ld	-7 (ix),a
   63DB 3E 02         [ 7]  476 	ld	a,#0x02
   63DD F5            [11]  477 	push	af
   63DE 33            [ 6]  478 	inc	sp
   63DF DD 7E F9      [19]  479 	ld	a,-7 (ix)
   63E2 F5            [11]  480 	push	af
   63E3 33            [ 6]  481 	inc	sp
   63E4 21 00 C0      [10]  482 	ld	hl,#0xC000
   63E7 E5            [11]  483 	push	hl
   63E8 CD 6D 5F      [17]  484 	call	_cpct_getScreenPtr
   63EB EB            [ 4]  485 	ex	de,hl
                            486 ;src/game.c:146: cpc_GetSp((u8*) tile_buffer_1, 10, 5, (int) pvmem);
   63EC 4B            [ 4]  487 	ld	c, e
   63ED 42            [ 4]  488 	ld	b, d
   63EE D5            [11]  489 	push	de
   63EF C5            [11]  490 	push	bc
   63F0 21 0A 05      [10]  491 	ld	hl,#0x050A
   63F3 E5            [11]  492 	push	hl
   63F4 21 38 61      [10]  493 	ld	hl,#_tile_buffer_1
   63F7 E5            [11]  494 	push	hl
   63F8 CD 68 53      [17]  495 	call	_cpc_GetSp
   63FB D1            [10]  496 	pop	de
                            497 ;src/game.c:147: cpct_drawSpriteMaskedAlignedTable(cards[card], pvmem, TILE_W, TILE_H, hc_tablatrans);
   63FC 01 F1 61      [10]  498 	ld	bc,#_cards+0
   63FF DD 6E F7      [19]  499 	ld	l,-9 (ix)
   6402 26 00         [ 7]  500 	ld	h,#0x00
   6404 29            [11]  501 	add	hl, hl
   6405 09            [11]  502 	add	hl,bc
   6406 DD 75 FE      [19]  503 	ld	-2 (ix),l
   6409 DD 74 FF      [19]  504 	ld	-1 (ix),h
   640C DD 6E FE      [19]  505 	ld	l,-2 (ix)
   640F DD 66 FF      [19]  506 	ld	h,-1 (ix)
   6412 4E            [ 7]  507 	ld	c,(hl)
   6413 23            [ 6]  508 	inc	hl
   6414 46            [ 7]  509 	ld	b,(hl)
   6415 21 00 01      [10]  510 	ld	hl,#_hc_tablatrans
   6418 E5            [11]  511 	push	hl
   6419 21 05 0A      [10]  512 	ld	hl,#0x0A05
   641C E5            [11]  513 	push	hl
   641D D5            [11]  514 	push	de
   641E C5            [11]  515 	push	bc
   641F CD 8D 5F      [17]  516 	call	_cpct_drawSpriteMaskedAlignedTable
                            517 ;src/game.c:149: while (!stopped) {
   6422 01 BF 60      [10]  518 	ld	bc,#_enemyTable+0
   6425 DD 5E 04      [19]  519 	ld	e,4 (ix)
   6428 16 00         [ 7]  520 	ld	d,#0x00
   642A 6B            [ 4]  521 	ld	l, e
   642B 62            [ 4]  522 	ld	h, d
   642C 29            [11]  523 	add	hl, hl
   642D 19            [11]  524 	add	hl, de
   642E 29            [11]  525 	add	hl, hl
   642F 09            [11]  526 	add	hl,bc
   6430 DD 75 FC      [19]  527 	ld	-4 (ix),l
   6433 DD 74 FD      [19]  528 	ld	-3 (ix),h
   6436 DD 7E FC      [19]  529 	ld	a,-4 (ix)
   6439 DD 77 FA      [19]  530 	ld	-6 (ix),a
   643C DD 7E FD      [19]  531 	ld	a,-3 (ix)
   643F DD 77 FB      [19]  532 	ld	-5 (ix),a
   6442                     533 00107$:
   6442 DD 7E F6      [19]  534 	ld	a,-10 (ix)
   6445 B7            [ 4]  535 	or	a, a
   6446 C2 EE 64      [10]  536 	jp	NZ,00109$
                            537 ;src/game.c:150: delay(10);
   6449 21 00 00      [10]  538 	ld	hl,#0x0000
   644C E5            [11]  539 	push	hl
   644D 21 0A 00      [10]  540 	ld	hl,#0x000A
   6450 E5            [11]  541 	push	hl
   6451 CD CE 61      [17]  542 	call	_delay
   6454 F1            [10]  543 	pop	af
   6455 F1            [10]  544 	pop	af
                            545 ;src/game.c:151: if ((row < 5) && (enemyTable[col][row + 1] == 0)) {
   6456 DD 7E F8      [19]  546 	ld	a,-8 (ix)
   6459 D6 05         [ 7]  547 	sub	a, #0x05
   645B D2 E7 64      [10]  548 	jp	NC,00104$
   645E DD 4E F8      [19]  549 	ld	c,-8 (ix)
   6461 0C            [ 4]  550 	inc	c
   6462 DD 6E FA      [19]  551 	ld	l,-6 (ix)
   6465 DD 66 FB      [19]  552 	ld	h,-5 (ix)
   6468 06 00         [ 7]  553 	ld	b,#0x00
   646A 09            [11]  554 	add	hl, bc
   646B 7E            [ 7]  555 	ld	a,(hl)
   646C B7            [ 4]  556 	or	a, a
   646D 20 78         [12]  557 	jr	NZ,00104$
                            558 ;src/game.c:152: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, ENEMY_TABLE_X + (col * (TILE_W + 1)), ENEMY_TABLE_Y + (row * (TILE_H + 2)));
   646F DD 7E F8      [19]  559 	ld	a,-8 (ix)
   6472 5F            [ 4]  560 	ld	e,a
   6473 87            [ 4]  561 	add	a, a
   6474 83            [ 4]  562 	add	a, e
   6475 87            [ 4]  563 	add	a, a
   6476 87            [ 4]  564 	add	a, a
   6477 47            [ 4]  565 	ld	b,a
   6478 04            [ 4]  566 	inc	b
   6479 04            [ 4]  567 	inc	b
   647A C5            [11]  568 	push	bc
   647B C5            [11]  569 	push	bc
   647C 33            [ 6]  570 	inc	sp
   647D DD 7E F9      [19]  571 	ld	a,-7 (ix)
   6480 F5            [11]  572 	push	af
   6481 33            [ 6]  573 	inc	sp
   6482 21 00 C0      [10]  574 	ld	hl,#0xC000
   6485 E5            [11]  575 	push	hl
   6486 CD 6D 5F      [17]  576 	call	_cpct_getScreenPtr
   6489 EB            [ 4]  577 	ex	de,hl
   648A 21 05 0A      [10]  578 	ld	hl,#0x0A05
   648D E5            [11]  579 	push	hl
   648E D5            [11]  580 	push	de
   648F 21 38 61      [10]  581 	ld	hl,#_tile_buffer_1
   6492 E5            [11]  582 	push	hl
   6493 CD 38 54      [17]  583 	call	_cpct_drawSprite
   6496 C1            [10]  584 	pop	bc
                            585 ;src/game.c:154: row++;
                            586 ;src/game.c:155: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, ENEMY_TABLE_X + (col * (TILE_W + 1)), ENEMY_TABLE_Y + (row * (TILE_H + 2)));
   6497 DD 71 F8      [19]  587 	ld	-8 (ix), c
   649A 79            [ 4]  588 	ld	a,c
   649B 87            [ 4]  589 	add	a, a
   649C 81            [ 4]  590 	add	a, c
   649D 87            [ 4]  591 	add	a, a
   649E 87            [ 4]  592 	add	a, a
   649F 47            [ 4]  593 	ld	b,a
   64A0 04            [ 4]  594 	inc	b
   64A1 04            [ 4]  595 	inc	b
   64A2 C5            [11]  596 	push	bc
   64A3 33            [ 6]  597 	inc	sp
   64A4 DD 7E F9      [19]  598 	ld	a,-7 (ix)
   64A7 F5            [11]  599 	push	af
   64A8 33            [ 6]  600 	inc	sp
   64A9 21 00 C0      [10]  601 	ld	hl,#0xC000
   64AC E5            [11]  602 	push	hl
   64AD CD 6D 5F      [17]  603 	call	_cpct_getScreenPtr
   64B0 4D            [ 4]  604 	ld	c,l
   64B1 44            [ 4]  605 	ld	b,h
                            606 ;src/game.c:156: cpc_GetSp((u8*) tile_buffer_1, 10, 5, (int) pvmem);
   64B2 59            [ 4]  607 	ld	e, c
   64B3 50            [ 4]  608 	ld	d, b
   64B4 C5            [11]  609 	push	bc
   64B5 D5            [11]  610 	push	de
   64B6 21 0A 05      [10]  611 	ld	hl,#0x050A
   64B9 E5            [11]  612 	push	hl
   64BA 21 38 61      [10]  613 	ld	hl,#_tile_buffer_1
   64BD E5            [11]  614 	push	hl
   64BE CD 68 53      [17]  615 	call	_cpc_GetSp
   64C1 C1            [10]  616 	pop	bc
                            617 ;src/game.c:157: cpct_drawSpriteMaskedAlignedTable(cards[card], pvmem, TILE_W, TILE_H, hc_tablatrans);
   64C2 DD 6E FE      [19]  618 	ld	l,-2 (ix)
   64C5 DD 66 FF      [19]  619 	ld	h,-1 (ix)
   64C8 5E            [ 7]  620 	ld	e,(hl)
   64C9 23            [ 6]  621 	inc	hl
   64CA 56            [ 7]  622 	ld	d,(hl)
   64CB 21 00 01      [10]  623 	ld	hl,#_hc_tablatrans
   64CE E5            [11]  624 	push	hl
   64CF 21 05 0A      [10]  625 	ld	hl,#0x0A05
   64D2 E5            [11]  626 	push	hl
   64D3 C5            [11]  627 	push	bc
   64D4 D5            [11]  628 	push	de
   64D5 CD 8D 5F      [17]  629 	call	_cpct_drawSpriteMaskedAlignedTable
                            630 ;src/game.c:158: if (row == 5)
   64D8 DD 7E F8      [19]  631 	ld	a,-8 (ix)
   64DB D6 05         [ 7]  632 	sub	a, #0x05
   64DD C2 42 64      [10]  633 	jp	NZ,00107$
                            634 ;src/game.c:159: stopped = 1;
   64E0 DD 36 F6 01   [19]  635 	ld	-10 (ix),#0x01
   64E4 C3 42 64      [10]  636 	jp	00107$
   64E7                     637 00104$:
                            638 ;src/game.c:161: stopped = 1;
   64E7 DD 36 F6 01   [19]  639 	ld	-10 (ix),#0x01
   64EB C3 42 64      [10]  640 	jp	00107$
   64EE                     641 00109$:
                            642 ;src/game.c:164: enemyTable[col][row] = card;
   64EE DD 7E FC      [19]  643 	ld	a,-4 (ix)
   64F1 DD 86 F8      [19]  644 	add	a, -8 (ix)
   64F4 4F            [ 4]  645 	ld	c,a
   64F5 DD 7E FD      [19]  646 	ld	a,-3 (ix)
   64F8 CE 00         [ 7]  647 	adc	a, #0x00
   64FA 47            [ 4]  648 	ld	b,a
   64FB DD 7E F7      [19]  649 	ld	a,-9 (ix)
   64FE 02            [ 7]  650 	ld	(bc),a
   64FF DD F9         [10]  651 	ld	sp, ix
   6501 DD E1         [14]  652 	pop	ix
   6503 C9            [10]  653 	ret
                            654 ;src/game.c:167: void newHand(u8 side) {
                            655 ;	---------------------------------
                            656 ; Function newHand
                            657 ; ---------------------------------
   6504                     658 _newHand::
   6504 DD E5         [15]  659 	push	ix
   6506 DD 21 00 00   [14]  660 	ld	ix,#0
   650A DD 39         [15]  661 	add	ix,sp
   650C 3B            [ 6]  662 	dec	sp
                            663 ;src/game.c:171: for (i = 0; i < 8; i++) {
   650D DD 36 FF 00   [19]  664 	ld	-1 (ix),#0x00
   6511                     665 00111$:
                            666 ;src/game.c:172: if (side) {
   6511 DD 7E 04      [19]  667 	ld	a,4 (ix)
   6514 B7            [ 4]  668 	or	a, a
   6515 28 32         [12]  669 	jr	Z,00108$
                            670 ;src/game.c:173: col = (cpct_rand() / 32);
   6517 CD 08 55      [17]  671 	call	_cpct_getRandom_mxor_u8
   651A 7D            [ 4]  672 	ld	a,l
   651B 07            [ 4]  673 	rlca
   651C 07            [ 4]  674 	rlca
   651D 07            [ 4]  675 	rlca
   651E E6 07         [ 7]  676 	and	a,#0x07
   6520 4F            [ 4]  677 	ld	c,a
                            678 ;src/game.c:174: while (userTable[col][5] != 0) {
   6521                     679 00101$:
   6521 06 00         [ 7]  680 	ld	b,#0x00
   6523 69            [ 4]  681 	ld	l, c
   6524 60            [ 4]  682 	ld	h, b
   6525 29            [11]  683 	add	hl, hl
   6526 09            [11]  684 	add	hl, bc
   6527 29            [11]  685 	add	hl, hl
   6528 11 8F 60      [10]  686 	ld	de,#_userTable
   652B 19            [11]  687 	add	hl,de
   652C 11 05 00      [10]  688 	ld	de, #0x0005
   652F 19            [11]  689 	add	hl, de
   6530 7E            [ 7]  690 	ld	a,(hl)
   6531 B7            [ 4]  691 	or	a, a
   6532 28 0C         [12]  692 	jr	Z,00103$
                            693 ;src/game.c:175: col = (cpct_rand() / 32);
   6534 CD 08 55      [17]  694 	call	_cpct_getRandom_mxor_u8
   6537 7D            [ 4]  695 	ld	a,l
   6538 07            [ 4]  696 	rlca
   6539 07            [ 4]  697 	rlca
   653A 07            [ 4]  698 	rlca
   653B E6 07         [ 7]  699 	and	a,#0x07
   653D 4F            [ 4]  700 	ld	c,a
   653E 18 E1         [12]  701 	jr	00101$
   6540                     702 00103$:
                            703 ;src/game.c:177: insertCardUser(col);
   6540 79            [ 4]  704 	ld	a,c
   6541 F5            [11]  705 	push	af
   6542 33            [ 6]  706 	inc	sp
   6543 CD 5A 62      [17]  707 	call	_insertCardUser
   6546 33            [ 6]  708 	inc	sp
   6547 18 2C         [12]  709 	jr	00112$
   6549                     710 00108$:
                            711 ;src/game.c:179: col = (cpct_rand() / 32);
   6549 CD 08 55      [17]  712 	call	_cpct_getRandom_mxor_u8
   654C 7D            [ 4]  713 	ld	a,l
   654D 07            [ 4]  714 	rlca
   654E 07            [ 4]  715 	rlca
   654F 07            [ 4]  716 	rlca
   6550 E6 07         [ 7]  717 	and	a,#0x07
   6552 47            [ 4]  718 	ld	b,a
                            719 ;src/game.c:180: while (enemyTable[col][0] != 0) {
   6553                     720 00104$:
   6553 58            [ 4]  721 	ld	e,b
   6554 16 00         [ 7]  722 	ld	d,#0x00
   6556 6B            [ 4]  723 	ld	l, e
   6557 62            [ 4]  724 	ld	h, d
   6558 29            [11]  725 	add	hl, hl
   6559 19            [11]  726 	add	hl, de
   655A 29            [11]  727 	add	hl, hl
   655B 11 BF 60      [10]  728 	ld	de,#_enemyTable
   655E 19            [11]  729 	add	hl,de
   655F 7E            [ 7]  730 	ld	a,(hl)
   6560 B7            [ 4]  731 	or	a, a
   6561 28 0C         [12]  732 	jr	Z,00106$
                            733 ;src/game.c:181: col = (cpct_rand() / 32);
   6563 CD 08 55      [17]  734 	call	_cpct_getRandom_mxor_u8
   6566 7D            [ 4]  735 	ld	a,l
   6567 07            [ 4]  736 	rlca
   6568 07            [ 4]  737 	rlca
   6569 07            [ 4]  738 	rlca
   656A E6 07         [ 7]  739 	and	a,#0x07
   656C 47            [ 4]  740 	ld	b,a
   656D 18 E4         [12]  741 	jr	00104$
   656F                     742 00106$:
                            743 ;src/game.c:183: insertCardEnemy(col);
   656F C5            [11]  744 	push	bc
   6570 33            [ 6]  745 	inc	sp
   6571 CD AE 63      [17]  746 	call	_insertCardEnemy
   6574 33            [ 6]  747 	inc	sp
   6575                     748 00112$:
                            749 ;src/game.c:171: for (i = 0; i < 8; i++) {
   6575 DD 34 FF      [23]  750 	inc	-1 (ix)
   6578 DD 7E FF      [19]  751 	ld	a,-1 (ix)
   657B D6 08         [ 7]  752 	sub	a, #0x08
   657D 38 92         [12]  753 	jr	C,00111$
   657F 33            [ 6]  754 	inc	sp
   6580 DD E1         [14]  755 	pop	ix
   6582 C9            [10]  756 	ret
                            757 ;src/game.c:188: void drawUser() {
                            758 ;	---------------------------------
                            759 ; Function drawUser
                            760 ; ---------------------------------
   6583                     761 _drawUser::
                            762 ;src/game.c:195: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X + (user.px * (TILE_W + 1)), USER_TABLE_Y + (user.py * (TILE_H + 2)));
   6583 3A 00 61      [13]  763 	ld	a, (#(_user + 0x0003) + 0)
   6586 4F            [ 4]  764 	ld	c,a
   6587 87            [ 4]  765 	add	a, a
   6588 81            [ 4]  766 	add	a, c
   6589 87            [ 4]  767 	add	a, a
   658A 87            [ 4]  768 	add	a, a
   658B C6 5C         [ 7]  769 	add	a, #0x5C
   658D 57            [ 4]  770 	ld	d,a
   658E 3A FF 60      [13]  771 	ld	a, (#(_user + 0x0002) + 0)
   6591 4F            [ 4]  772 	ld	c,a
   6592 87            [ 4]  773 	add	a, a
   6593 81            [ 4]  774 	add	a, c
   6594 87            [ 4]  775 	add	a, a
   6595 47            [ 4]  776 	ld	b,a
   6596 04            [ 4]  777 	inc	b
   6597 04            [ 4]  778 	inc	b
   6598 D5            [11]  779 	push	de
   6599 33            [ 6]  780 	inc	sp
   659A C5            [11]  781 	push	bc
   659B 33            [ 6]  782 	inc	sp
   659C 21 00 C0      [10]  783 	ld	hl,#0xC000
   659F E5            [11]  784 	push	hl
   65A0 CD 6D 5F      [17]  785 	call	_cpct_getScreenPtr
   65A3 4D            [ 4]  786 	ld	c,l
   65A4 44            [ 4]  787 	ld	b,h
                            788 ;src/game.c:196: cpct_drawSprite(tile_buffer_0, pvmem, HC_MARKER_W, HC_MARKER_H);
   65A5 21 05 0A      [10]  789 	ld	hl,#0x0A05
   65A8 E5            [11]  790 	push	hl
   65A9 C5            [11]  791 	push	bc
   65AA 21 06 61      [10]  792 	ld	hl,#_tile_buffer_0
   65AD E5            [11]  793 	push	hl
   65AE CD 38 54      [17]  794 	call	_cpct_drawSprite
                            795 ;src/game.c:197: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X + (user.x * (TILE_W + 1)), USER_TABLE_Y + (user.y * (TILE_H + 2)));
   65B1 3A FE 60      [13]  796 	ld	a, (#(_user + 0x0001) + 0)
   65B4 4F            [ 4]  797 	ld	c,a
   65B5 87            [ 4]  798 	add	a, a
   65B6 81            [ 4]  799 	add	a, c
   65B7 87            [ 4]  800 	add	a, a
   65B8 87            [ 4]  801 	add	a, a
   65B9 C6 5C         [ 7]  802 	add	a, #0x5C
   65BB 57            [ 4]  803 	ld	d,a
   65BC 3A FD 60      [13]  804 	ld	a, (#_user + 0)
   65BF 4F            [ 4]  805 	ld	c,a
   65C0 87            [ 4]  806 	add	a, a
   65C1 81            [ 4]  807 	add	a, c
   65C2 87            [ 4]  808 	add	a, a
   65C3 47            [ 4]  809 	ld	b,a
   65C4 04            [ 4]  810 	inc	b
   65C5 04            [ 4]  811 	inc	b
   65C6 D5            [11]  812 	push	de
   65C7 33            [ 6]  813 	inc	sp
   65C8 C5            [11]  814 	push	bc
   65C9 33            [ 6]  815 	inc	sp
   65CA 21 00 C0      [10]  816 	ld	hl,#0xC000
   65CD E5            [11]  817 	push	hl
   65CE CD 6D 5F      [17]  818 	call	_cpct_getScreenPtr
   65D1 4D            [ 4]  819 	ld	c,l
   65D2 44            [ 4]  820 	ld	b,h
                            821 ;src/game.c:198: cpc_GetSp((u8*) tile_buffer_0, 10, 5, (int) pvmem);
   65D3 59            [ 4]  822 	ld	e, c
   65D4 50            [ 4]  823 	ld	d, b
   65D5 C5            [11]  824 	push	bc
   65D6 D5            [11]  825 	push	de
   65D7 21 0A 05      [10]  826 	ld	hl,#0x050A
   65DA E5            [11]  827 	push	hl
   65DB 21 06 61      [10]  828 	ld	hl,#_tile_buffer_0
   65DE E5            [11]  829 	push	hl
   65DF CD 68 53      [17]  830 	call	_cpc_GetSp
   65E2 C1            [10]  831 	pop	bc
                            832 ;src/game.c:199: cpct_drawSpriteMaskedAlignedTable(hc_marker, pvmem, HC_MARKER_W, HC_MARKER_H, hc_tablatrans);
   65E3 11 00 01      [10]  833 	ld	de,#_hc_tablatrans+0
   65E6 D5            [11]  834 	push	de
   65E7 21 05 0A      [10]  835 	ld	hl,#0x0A05
   65EA E5            [11]  836 	push	hl
   65EB C5            [11]  837 	push	bc
   65EC 21 C2 41      [10]  838 	ld	hl,#_hc_marker
   65EF E5            [11]  839 	push	hl
   65F0 CD 8D 5F      [17]  840 	call	_cpct_drawSpriteMaskedAlignedTable
                            841 ;src/game.c:202: user.px = user.x;
   65F3 3A FD 60      [13]  842 	ld	a, (#_user + 0)
   65F6 32 FF 60      [13]  843 	ld	(#(_user + 0x0002)),a
                            844 ;src/game.c:203: user.py = user.y;
   65F9 3A FE 60      [13]  845 	ld	a, (#(_user + 0x0001) + 0)
   65FC 32 00 61      [13]  846 	ld	(#(_user + 0x0003)),a
   65FF C9            [10]  847 	ret
                            848 ;src/game.c:206: void checkUserMovement() {
                            849 ;	---------------------------------
                            850 ; Function checkUserMovement
                            851 ; ---------------------------------
   6600                     852 _checkUserMovement::
                            853 ;src/game.c:209: if ((user.x < (TABLE_WIDTH - 1)) && (cpct_isKeyPressed(keys.right))) {
   6600 3A FD 60      [13]  854 	ld	a,(#_user + 0)
   6603 D6 07         [ 7]  855 	sub	a, #0x07
   6605 30 1B         [12]  856 	jr	NC,00105$
   6607 2A F5 60      [16]  857 	ld	hl, (#(_keys + 0x0006) + 0)
   660A CD 20 54      [17]  858 	call	_cpct_isKeyPressed
   660D 7D            [ 4]  859 	ld	a,l
   660E B7            [ 4]  860 	or	a, a
   660F 28 11         [12]  861 	jr	Z,00105$
                            862 ;src/game.c:210: user.px = user.x;
   6611 01 FD 60      [10]  863 	ld	bc,#_user+0
   6614 0A            [ 7]  864 	ld	a,(bc)
   6615 32 FF 60      [13]  865 	ld	(#(_user + 0x0002)),a
                            866 ;src/game.c:211: user.x++;
   6618 0A            [ 7]  867 	ld	a,(bc)
   6619 3C            [ 4]  868 	inc	a
   661A 02            [ 7]  869 	ld	(bc),a
                            870 ;src/game.c:212: user.moved = 1;
   661B 21 01 61      [10]  871 	ld	hl,#(_user + 0x0004)
   661E 36 01         [10]  872 	ld	(hl),#0x01
   6620 18 20         [12]  873 	jr	00106$
   6622                     874 00105$:
                            875 ;src/game.c:213: } else if ((user.x > 0) && (cpct_isKeyPressed(keys.left))) {
   6622 3A FD 60      [13]  876 	ld	a, (#_user + 0)
   6625 B7            [ 4]  877 	or	a, a
   6626 28 1A         [12]  878 	jr	Z,00106$
   6628 2A F3 60      [16]  879 	ld	hl, (#(_keys + 0x0004) + 0)
   662B CD 20 54      [17]  880 	call	_cpct_isKeyPressed
   662E 7D            [ 4]  881 	ld	a,l
   662F B7            [ 4]  882 	or	a, a
   6630 28 10         [12]  883 	jr	Z,00106$
                            884 ;src/game.c:214: user.px = user.x;
   6632 01 FD 60      [10]  885 	ld	bc,#_user+0
   6635 0A            [ 7]  886 	ld	a,(bc)
   6636 32 FF 60      [13]  887 	ld	(#(_user + 0x0002)),a
                            888 ;src/game.c:215: user.x--;
   6639 0A            [ 7]  889 	ld	a,(bc)
   663A C6 FF         [ 7]  890 	add	a,#0xFF
   663C 02            [ 7]  891 	ld	(bc),a
                            892 ;src/game.c:216: user.moved = 1;
   663D 21 01 61      [10]  893 	ld	hl,#(_user + 0x0004)
   6640 36 01         [10]  894 	ld	(hl),#0x01
   6642                     895 00106$:
                            896 ;src/game.c:219: if ((user.y < (TABLE_HEIGHT - 1)) && (cpct_isKeyPressed(keys.down))) {
   6642 01 FE 60      [10]  897 	ld	bc,#_user + 1
   6645 0A            [ 7]  898 	ld	a,(bc)
                            899 ;src/game.c:220: user.py = user.y;
                            900 ;src/game.c:222: user.moved = 1;
                            901 ;src/game.c:219: if ((user.y < (TABLE_HEIGHT - 1)) && (cpct_isKeyPressed(keys.down))) {
   6646 5F            [ 4]  902 	ld	e,a
   6647 D6 05         [ 7]  903 	sub	a, #0x05
   6649 30 1D         [12]  904 	jr	NC,00112$
   664B 2A F1 60      [16]  905 	ld	hl, (#(_keys + 0x0002) + 0)
   664E C5            [11]  906 	push	bc
   664F CD 20 54      [17]  907 	call	_cpct_isKeyPressed
   6652 55            [ 4]  908 	ld	d,l
   6653 C1            [10]  909 	pop	bc
   6654 0A            [ 7]  910 	ld	a,(bc)
   6655 5F            [ 4]  911 	ld	e,a
   6656 7A            [ 4]  912 	ld	a,d
   6657 B7            [ 4]  913 	or	a, a
   6658 28 0E         [12]  914 	jr	Z,00112$
                            915 ;src/game.c:220: user.py = user.y;
   665A 21 00 61      [10]  916 	ld	hl,#(_user + 0x0003)
   665D 73            [ 7]  917 	ld	(hl),e
                            918 ;src/game.c:221: user.y++;
   665E 0A            [ 7]  919 	ld	a,(bc)
   665F 3C            [ 4]  920 	inc	a
   6660 02            [ 7]  921 	ld	(bc),a
                            922 ;src/game.c:222: user.moved = 1;
   6661 21 01 61      [10]  923 	ld	hl,#(_user + 0x0004)
   6664 36 01         [10]  924 	ld	(hl),#0x01
   6666 18 1D         [12]  925 	jr	00113$
   6668                     926 00112$:
                            927 ;src/game.c:223: } else if ((user.y > 0) && (cpct_isKeyPressed(keys.up))) {
   6668 7B            [ 4]  928 	ld	a,e
   6669 B7            [ 4]  929 	or	a, a
   666A 28 19         [12]  930 	jr	Z,00113$
   666C 2A EF 60      [16]  931 	ld	hl, (#_keys + 0)
   666F C5            [11]  932 	push	bc
   6670 CD 20 54      [17]  933 	call	_cpct_isKeyPressed
   6673 C1            [10]  934 	pop	bc
   6674 7D            [ 4]  935 	ld	a,l
   6675 B7            [ 4]  936 	or	a, a
   6676 28 0D         [12]  937 	jr	Z,00113$
                            938 ;src/game.c:224: user.py = user.y;
   6678 0A            [ 7]  939 	ld	a,(bc)
   6679 32 00 61      [13]  940 	ld	(#(_user + 0x0003)),a
                            941 ;src/game.c:225: user.y--;
   667C 0A            [ 7]  942 	ld	a,(bc)
   667D C6 FF         [ 7]  943 	add	a,#0xFF
   667F 02            [ 7]  944 	ld	(bc),a
                            945 ;src/game.c:226: user.moved = 1;
   6680 21 01 61      [10]  946 	ld	hl,#(_user + 0x0004)
   6683 36 01         [10]  947 	ld	(hl),#0x01
   6685                     948 00113$:
                            949 ;src/game.c:228: if ((userTable[user.x][5] == 0) && (cpct_isKeyPressed(keys.fire))) {
   6685 3A FD 60      [13]  950 	ld	a, (#_user + 0)
   6688 4F            [ 4]  951 	ld	c,a
   6689 06 00         [ 7]  952 	ld	b,#0x00
   668B 69            [ 4]  953 	ld	l, c
   668C 60            [ 4]  954 	ld	h, b
   668D 29            [11]  955 	add	hl, hl
   668E 09            [11]  956 	add	hl, bc
   668F 29            [11]  957 	add	hl, hl
   6690 11 8F 60      [10]  958 	ld	de,#_userTable
   6693 19            [11]  959 	add	hl,de
   6694 11 05 00      [10]  960 	ld	de, #0x0005
   6697 19            [11]  961 	add	hl, de
   6698 7E            [ 7]  962 	ld	a,(hl)
   6699 B7            [ 4]  963 	or	a, a
   669A 20 12         [12]  964 	jr	NZ,00116$
   669C 2A F7 60      [16]  965 	ld	hl, (#(_keys + 0x0008) + 0)
   669F CD 20 54      [17]  966 	call	_cpct_isKeyPressed
   66A2 7D            [ 4]  967 	ld	a,l
   66A3 B7            [ 4]  968 	or	a, a
   66A4 28 08         [12]  969 	jr	Z,00116$
                            970 ;src/game.c:229: newHand(1);
   66A6 3E 01         [ 7]  971 	ld	a,#0x01
   66A8 F5            [11]  972 	push	af
   66A9 33            [ 6]  973 	inc	sp
   66AA CD 04 65      [17]  974 	call	_newHand
   66AD 33            [ 6]  975 	inc	sp
   66AE                     976 00116$:
                            977 ;src/game.c:232: if (cpct_isKeyPressed(keys.abort)) {
   66AE 2A FB 60      [16]  978 	ld	hl, (#(_keys + 0x000c) + 0)
   66B1 CD 20 54      [17]  979 	call	_cpct_isKeyPressed
   66B4 7D            [ 4]  980 	ld	a,l
   66B5 B7            [ 4]  981 	or	a, a
   66B6 C8            [11]  982 	ret	Z
                            983 ;src/game.c:234: reset_cpc();
   66B7 C3 64 53      [10]  984 	jp  _reset_cpc
                            985 ;src/game.c:238: void game() {
                            986 ;	---------------------------------
                            987 ; Function game
                            988 ; ---------------------------------
   66BA                     989 _game::
                            990 ;src/game.c:241: initGame();
   66BA CD FB 61      [17]  991 	call	_initGame
                            992 ;src/game.c:242: drawScreen();
   66BD CD 48 62      [17]  993 	call	_drawScreen
                            994 ;src/game.c:243: newHand(0);  //0 for Enemy 1 for User
   66C0 AF            [ 4]  995 	xor	a, a
   66C1 F5            [11]  996 	push	af
   66C2 33            [ 6]  997 	inc	sp
   66C3 CD 04 65      [17]  998 	call	_newHand
   66C6 33            [ 6]  999 	inc	sp
                           1000 ;src/game.c:244: newHand(1);  //0 for Enemy 1 for User
   66C7 3E 01         [ 7] 1001 	ld	a,#0x01
   66C9 F5            [11] 1002 	push	af
   66CA 33            [ 6] 1003 	inc	sp
   66CB CD 04 65      [17] 1004 	call	_newHand
   66CE 33            [ 6] 1005 	inc	sp
                           1006 ;src/game.c:245: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X + (user.x * (TILE_W + 1)), USER_TABLE_Y + (user.y * (TILE_H + 2)));
   66CF 3A FE 60      [13] 1007 	ld	a, (#_user + 1)
   66D2 4F            [ 4] 1008 	ld	c,a
   66D3 87            [ 4] 1009 	add	a, a
   66D4 81            [ 4] 1010 	add	a, c
   66D5 87            [ 4] 1011 	add	a, a
   66D6 87            [ 4] 1012 	add	a, a
   66D7 C6 5C         [ 7] 1013 	add	a, #0x5C
   66D9 57            [ 4] 1014 	ld	d,a
   66DA 3A FD 60      [13] 1015 	ld	a, (#_user + 0)
   66DD 4F            [ 4] 1016 	ld	c,a
   66DE 87            [ 4] 1017 	add	a, a
   66DF 81            [ 4] 1018 	add	a, c
   66E0 87            [ 4] 1019 	add	a, a
   66E1 47            [ 4] 1020 	ld	b,a
   66E2 04            [ 4] 1021 	inc	b
   66E3 04            [ 4] 1022 	inc	b
   66E4 D5            [11] 1023 	push	de
   66E5 33            [ 6] 1024 	inc	sp
   66E6 C5            [11] 1025 	push	bc
   66E7 33            [ 6] 1026 	inc	sp
   66E8 21 00 C0      [10] 1027 	ld	hl,#0xC000
   66EB E5            [11] 1028 	push	hl
   66EC CD 6D 5F      [17] 1029 	call	_cpct_getScreenPtr
                           1030 ;src/game.c:246: cpc_GetSp((u8*) tile_buffer_0, 10, 5, (int) pvmem);
   66EF E5            [11] 1031 	push	hl
   66F0 21 0A 05      [10] 1032 	ld	hl,#0x050A
   66F3 E5            [11] 1033 	push	hl
   66F4 21 06 61      [10] 1034 	ld	hl,#_tile_buffer_0
   66F7 E5            [11] 1035 	push	hl
   66F8 CD 68 53      [17] 1036 	call	_cpc_GetSp
                           1037 ;src/game.c:247: drawUser();
   66FB CD 83 65      [17] 1038 	call	_drawUser
                           1039 ;src/game.c:248: while (1) {
   66FE                    1040 00106$:
                           1041 ;src/game.c:249: checkUserMovement();
   66FE CD 00 66      [17] 1042 	call	_checkUserMovement
                           1043 ;src/game.c:250: if (user.moved) {
   6701 3A 01 61      [13] 1044 	ld	a, (#(_user + 0x0004) + 0)
   6704 B7            [ 4] 1045 	or	a, a
   6705 28 08         [12] 1046 	jr	Z,00102$
                           1047 ;src/game.c:251: drawUser();
   6707 CD 83 65      [17] 1048 	call	_drawUser
                           1049 ;src/game.c:252: user.moved = 0;
   670A 21 01 61      [10] 1050 	ld	hl,#(_user + 0x0004)
   670D 36 00         [10] 1051 	ld	(hl),#0x00
   670F                    1052 00102$:
                           1053 ;src/game.c:254: if (abort)
   670F 3A 04 61      [13] 1054 	ld	a,(#_abort + 0)
   6712 B7            [ 4] 1055 	or	a, a
   6713 C0            [11] 1056 	ret	NZ
                           1057 ;src/game.c:256: delay(20);
   6714 21 00 00      [10] 1058 	ld	hl,#0x0000
   6717 E5            [11] 1059 	push	hl
   6718 21 14 00      [10] 1060 	ld	hl,#0x0014
   671B E5            [11] 1061 	push	hl
   671C CD CE 61      [17] 1062 	call	_delay
   671F F1            [10] 1063 	pop	af
   6720 F1            [10] 1064 	pop	af
   6721 18 DB         [12] 1065 	jr	00106$
                           1066 	.area _CODE
                           1067 	.area _INITIALIZER
   616A                    1068 __xinit__tile_buffer_0:
   616A 00                 1069 	.db #0x00	; 0
   616B 00                 1070 	.db #0x00	; 0
   616C 00                 1071 	.db #0x00	; 0
   616D 00                 1072 	.db #0x00	; 0
   616E 00                 1073 	.db #0x00	; 0
   616F 00                 1074 	.db #0x00	; 0
   6170 00                 1075 	.db #0x00	; 0
   6171 00                 1076 	.db #0x00	; 0
   6172 00                 1077 	.db #0x00	; 0
   6173 00                 1078 	.db #0x00	; 0
   6174 00                 1079 	.db #0x00	; 0
   6175 00                 1080 	.db #0x00	; 0
   6176 00                 1081 	.db #0x00	; 0
   6177 00                 1082 	.db #0x00	; 0
   6178 00                 1083 	.db #0x00	; 0
   6179 00                 1084 	.db #0x00	; 0
   617A 00                 1085 	.db #0x00	; 0
   617B 00                 1086 	.db #0x00	; 0
   617C 00                 1087 	.db #0x00	; 0
   617D 00                 1088 	.db #0x00	; 0
   617E 00                 1089 	.db #0x00	; 0
   617F 00                 1090 	.db #0x00	; 0
   6180 00                 1091 	.db #0x00	; 0
   6181 00                 1092 	.db #0x00	; 0
   6182 00                 1093 	.db #0x00	; 0
   6183 00                 1094 	.db #0x00	; 0
   6184 00                 1095 	.db #0x00	; 0
   6185 00                 1096 	.db #0x00	; 0
   6186 00                 1097 	.db #0x00	; 0
   6187 00                 1098 	.db #0x00	; 0
   6188 00                 1099 	.db #0x00	; 0
   6189 00                 1100 	.db #0x00	; 0
   618A 00                 1101 	.db #0x00	; 0
   618B 00                 1102 	.db #0x00	; 0
   618C 00                 1103 	.db #0x00	; 0
   618D 00                 1104 	.db #0x00	; 0
   618E 00                 1105 	.db #0x00	; 0
   618F 00                 1106 	.db #0x00	; 0
   6190 00                 1107 	.db #0x00	; 0
   6191 00                 1108 	.db #0x00	; 0
   6192 00                 1109 	.db #0x00	; 0
   6193 00                 1110 	.db #0x00	; 0
   6194 00                 1111 	.db #0x00	; 0
   6195 00                 1112 	.db #0x00	; 0
   6196 00                 1113 	.db #0x00	; 0
   6197 00                 1114 	.db #0x00	; 0
   6198 00                 1115 	.db #0x00	; 0
   6199 00                 1116 	.db #0x00	; 0
   619A 00                 1117 	.db #0x00	; 0
   619B 00                 1118 	.db #0x00	; 0
   619C                    1119 __xinit__tile_buffer_1:
   619C 00                 1120 	.db #0x00	; 0
   619D 00                 1121 	.db #0x00	; 0
   619E 00                 1122 	.db #0x00	; 0
   619F 00                 1123 	.db #0x00	; 0
   61A0 00                 1124 	.db #0x00	; 0
   61A1 00                 1125 	.db #0x00	; 0
   61A2 00                 1126 	.db #0x00	; 0
   61A3 00                 1127 	.db #0x00	; 0
   61A4 00                 1128 	.db #0x00	; 0
   61A5 00                 1129 	.db #0x00	; 0
   61A6 00                 1130 	.db #0x00	; 0
   61A7 00                 1131 	.db #0x00	; 0
   61A8 00                 1132 	.db #0x00	; 0
   61A9 00                 1133 	.db #0x00	; 0
   61AA 00                 1134 	.db #0x00	; 0
   61AB 00                 1135 	.db #0x00	; 0
   61AC 00                 1136 	.db #0x00	; 0
   61AD 00                 1137 	.db #0x00	; 0
   61AE 00                 1138 	.db #0x00	; 0
   61AF 00                 1139 	.db #0x00	; 0
   61B0 00                 1140 	.db #0x00	; 0
   61B1 00                 1141 	.db #0x00	; 0
   61B2 00                 1142 	.db #0x00	; 0
   61B3 00                 1143 	.db #0x00	; 0
   61B4 00                 1144 	.db #0x00	; 0
   61B5 00                 1145 	.db #0x00	; 0
   61B6 00                 1146 	.db #0x00	; 0
   61B7 00                 1147 	.db #0x00	; 0
   61B8 00                 1148 	.db #0x00	; 0
   61B9 00                 1149 	.db #0x00	; 0
   61BA 00                 1150 	.db #0x00	; 0
   61BB 00                 1151 	.db #0x00	; 0
   61BC 00                 1152 	.db #0x00	; 0
   61BD 00                 1153 	.db #0x00	; 0
   61BE 00                 1154 	.db #0x00	; 0
   61BF 00                 1155 	.db #0x00	; 0
   61C0 00                 1156 	.db #0x00	; 0
   61C1 00                 1157 	.db #0x00	; 0
   61C2 00                 1158 	.db #0x00	; 0
   61C3 00                 1159 	.db #0x00	; 0
   61C4 00                 1160 	.db #0x00	; 0
   61C5 00                 1161 	.db #0x00	; 0
   61C6 00                 1162 	.db #0x00	; 0
   61C7 00                 1163 	.db #0x00	; 0
   61C8 00                 1164 	.db #0x00	; 0
   61C9 00                 1165 	.db #0x00	; 0
   61CA 00                 1166 	.db #0x00	; 0
   61CB 00                 1167 	.db #0x00	; 0
   61CC 00                 1168 	.db #0x00	; 0
   61CD 00                 1169 	.db #0x00	; 0
                           1170 	.area _CABS (ABS)
