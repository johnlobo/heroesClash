                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.5 #9498 (Mac OS X x86_64)
                              4 ;--------------------------------------------------------
                              5 	.module main
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _main
                             12 	.globl _init
                             13 	.globl _interrupcion
                             14 	.globl _wait4UserKeypress
                             15 	.globl _clearScreen
                             16 	.globl _game
                             17 	.globl _drawText
                             18 	.globl _cpct_restoreState_mxor_u8
                             19 	.globl _cpct_setSeed_mxor
                             20 	.globl _cpct_setPALColour
                             21 	.globl _cpct_setPalette
                             22 	.globl _cpct_fw2hw
                             23 	.globl _cpct_setVideoMode
                             24 	.globl _cpct_scanKeyboard_if
                             25 	.globl _cpct_memset
                             26 	.globl _cpct_disableFirmware
                             27 ;--------------------------------------------------------
                             28 ; special function registers
                             29 ;--------------------------------------------------------
                             30 ;--------------------------------------------------------
                             31 ; ram data
                             32 ;--------------------------------------------------------
                             33 	.area _DATA
   5884                      34 _interrupcion_kk_1_106:
   5884                      35 	.ds 1
                             36 ;--------------------------------------------------------
                             37 ; ram data
                             38 ;--------------------------------------------------------
                             39 	.area _INITIALIZED
                             40 ;--------------------------------------------------------
                             41 ; absolute external ram data
                             42 ;--------------------------------------------------------
                             43 	.area _DABS (ABS)
                             44 ;--------------------------------------------------------
                             45 ; global & static initialisations
                             46 ;--------------------------------------------------------
                             47 	.area _HOME
                             48 	.area _GSINIT
                             49 	.area _GSFINAL
                             50 	.area _GSINIT
                             51 ;--------------------------------------------------------
                             52 ; Home
                             53 ;--------------------------------------------------------
                             54 	.area _HOME
                             55 	.area _HOME
                             56 ;--------------------------------------------------------
                             57 ; code
                             58 ;--------------------------------------------------------
                             59 	.area _CODE
                             60 ;src/main.c:43: void interrupcion() {
                             61 ;	---------------------------------
                             62 ; Function interrupcion
                             63 ; ---------------------------------
   41F4                      64 _interrupcion::
                             65 ;src/main.c:46: if (++kk == 5) {
   41F4 21 84 58      [10]   66 	ld	hl, #_interrupcion_kk_1_106+0
   41F7 34            [11]   67 	inc	(hl)
   41F8 3A 84 58      [13]   68 	ld	a,(#_interrupcion_kk_1_106 + 0)
   41FB D6 05         [ 7]   69 	sub	a, #0x05
   41FD C0            [11]   70 	ret	NZ
                             71 ;src/main.c:48: cpct_scanKeyboard_if();
   41FE CD 48 55      [17]   72 	call	_cpct_scanKeyboard_if
                             73 ;src/main.c:49: kk = 0;
   4201 21 84 58      [10]   74 	ld	hl,#_interrupcion_kk_1_106 + 0
   4204 36 00         [10]   75 	ld	(hl), #0x00
   4206 C9            [10]   76 	ret
                             77 ;src/main.c:53: void init() {
                             78 ;	---------------------------------
                             79 ; Function init
                             80 ; ---------------------------------
   4207                      81 _init::
                             82 ;src/main.c:55: cpct_disableFirmware();
   4207 CD 1A 56      [17]   83 	call	_cpct_disableFirmware
                             84 ;src/main.c:56: cpct_setVideoMode(0);
   420A 2E 00         [ 7]   85 	ld	l,#0x00
   420C CD D3 55      [17]   86 	call	_cpct_setVideoMode
                             87 ;src/main.c:57: cpct_fw2hw(hc_graphics_palette, 16);
   420F 21 10 00      [10]   88 	ld	hl,#0x0010
   4212 E5            [11]   89 	push	hl
   4213 21 D8 52      [10]   90 	ld	hl,#_hc_graphics_palette
   4216 E5            [11]   91 	push	hl
   4217 CD AD 54      [17]   92 	call	_cpct_fw2hw
                             93 ;src/main.c:58: cpct_setPalette(hc_graphics_palette, 16);
   421A 21 10 00      [10]   94 	ld	hl,#0x0010
   421D E5            [11]   95 	push	hl
   421E 21 D8 52      [10]   96 	ld	hl,#_hc_graphics_palette
   4221 E5            [11]   97 	push	hl
   4222 CD 6F 53      [17]   98 	call	_cpct_setPalette
                             99 ;src/main.c:59: cpct_setBorder(HW_BLACK);
   4225 21 10 14      [10]  100 	ld	hl,#0x1410
   4228 E5            [11]  101 	push	hl
   4229 CD FC 53      [17]  102 	call	_cpct_setPALColour
                            103 ;src/main.c:68: drawText("HERO QUEST IS READY", 31, 76, 1);
   422C 21 4C 01      [10]  104 	ld	hl,#0x014C
   422F E5            [11]  105 	push	hl
   4230 3E 1F         [ 7]  106 	ld	a,#0x1F
   4232 F5            [11]  107 	push	af
   4233 33            [ 6]  108 	inc	sp
   4234 21 6C 42      [10]  109 	ld	hl,#___str_0
   4237 E5            [11]  110 	push	hl
   4238 CD BA 4E      [17]  111 	call	_drawText
   423B F1            [10]  112 	pop	af
                            113 ;src/main.c:69: drawText("PRESS ANY KEY", 20, 90, 1);
   423C 33            [ 6]  114 	inc	sp
   423D 21 5A 01      [10]  115 	ld	hl,#0x015A
   4240 E3            [19]  116 	ex	(sp),hl
   4241 3E 14         [ 7]  117 	ld	a,#0x14
   4243 F5            [11]  118 	push	af
   4244 33            [ 6]  119 	inc	sp
   4245 21 80 42      [10]  120 	ld	hl,#___str_1
   4248 E5            [11]  121 	push	hl
   4249 CD BA 4E      [17]  122 	call	_drawText
   424C F1            [10]  123 	pop	af
   424D F1            [10]  124 	pop	af
   424E 33            [ 6]  125 	inc	sp
                            126 ;src/main.c:71: seed = wait4UserKeypress();
   424F CD F4 4C      [17]  127 	call	_wait4UserKeypress
                            128 ;src/main.c:73: if (!seed)
   4252 7A            [ 4]  129 	ld	a,d
   4253 B3            [ 4]  130 	or	a, e
   4254 B4            [ 4]  131 	or	a, h
   4255 B5            [ 4]  132 	or	a,l
   4256 20 0A         [12]  133 	jr	NZ,00102$
                            134 ;src/main.c:74: seed++;
   4258 2C            [ 4]  135 	inc	l
   4259 20 07         [12]  136 	jr	NZ,00109$
   425B 24            [ 4]  137 	inc	h
   425C 20 04         [12]  138 	jr	NZ,00109$
   425E 1C            [ 4]  139 	inc	e
   425F 20 01         [12]  140 	jr	NZ,00109$
   4261 14            [ 4]  141 	inc	d
   4262                     142 00109$:
   4262                     143 00102$:
                            144 ;src/main.c:75: cpct_srand(seed);
   4262 CD CA 54      [17]  145 	call	_cpct_setSeed_mxor
   4265 CD D2 54      [17]  146 	call	_cpct_restoreState_mxor_u8
                            147 ;src/main.c:77: clearScreen();
   4268 CD E8 52      [17]  148 	call	_clearScreen
   426B C9            [10]  149 	ret
   426C                     150 ___str_0:
   426C 48 45 52 4F 20 51   151 	.ascii "HERO QUEST IS READY"
        55 45 53 54 20 49
        53 20 52 45 41 44
        59
   427F 00                  152 	.db 0x00
   4280                     153 ___str_1:
   4280 50 52 45 53 53 20   154 	.ascii "PRESS ANY KEY"
        41 4E 59 20 4B 45
        59
   428D 00                  155 	.db 0x00
                            156 ;src/main.c:81: void main(void) {
                            157 ;	---------------------------------
                            158 ; Function main
                            159 ; ---------------------------------
   428E                     160 _main::
                            161 ;src/main.c:85: cpct_memset(CPCT_VMEM_START, 0, 0x4000);
   428E 21 00 40      [10]  162 	ld	hl,#0x4000
   4291 E5            [11]  163 	push	hl
   4292 AF            [ 4]  164 	xor	a, a
   4293 F5            [11]  165 	push	af
   4294 33            [ 6]  166 	inc	sp
   4295 26 C0         [ 7]  167 	ld	h, #0xC0
   4297 E5            [11]  168 	push	hl
   4298 CD FD 55      [17]  169 	call	_cpct_memset
                            170 ;src/main.c:87: init();
   429B CD 07 42      [17]  171 	call	_init
                            172 ;src/main.c:89: game();
   429E CD 3C 5E      [17]  173 	call	_game
   42A1 C9            [10]  174 	ret
                            175 	.area _CODE
                            176 	.area _INITIALIZER
                            177 	.area _CABS (ABS)
