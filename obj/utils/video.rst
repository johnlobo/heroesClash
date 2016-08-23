                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.5 #9498 (Mac OS X x86_64)
                              4 ;--------------------------------------------------------
                              5 	.module video
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _cpct_getScreenPtr
                             12 	.globl _cpct_setPALColour
                             13 	.globl _cpct_setPalette
                             14 	.globl _cpct_fw2hw
                             15 	.globl _cpct_setVideoMode
                             16 	.globl _cpct_drawSolidBox
                             17 	.globl _cpct_px2byteM0
                             18 	.globl _cpct_memset
                             19 	.globl _cpct_disableFirmware
                             20 	.globl _hc_graphics_palette
                             21 	.globl _setUpVideo
                             22 	.globl _clearScreen
                             23 	.globl _clearWindow
                             24 ;--------------------------------------------------------
                             25 ; special function registers
                             26 ;--------------------------------------------------------
                             27 ;--------------------------------------------------------
                             28 ; ram data
                             29 ;--------------------------------------------------------
                             30 	.area _DATA
                             31 ;--------------------------------------------------------
                             32 ; ram data
                             33 ;--------------------------------------------------------
                             34 	.area _INITIALIZED
                             35 ;--------------------------------------------------------
                             36 ; absolute external ram data
                             37 ;--------------------------------------------------------
                             38 	.area _DABS (ABS)
                             39 ;--------------------------------------------------------
                             40 ; global & static initialisations
                             41 ;--------------------------------------------------------
                             42 	.area _HOME
                             43 	.area _GSINIT
                             44 	.area _GSFINAL
                             45 	.area _GSINIT
                             46 ;--------------------------------------------------------
                             47 ; Home
                             48 ;--------------------------------------------------------
                             49 	.area _HOME
                             50 	.area _HOME
                             51 ;--------------------------------------------------------
                             52 ; code
                             53 ;--------------------------------------------------------
                             54 	.area _CODE
                             55 ;src/utils/video.c:38: void setUpVideo() {
                             56 ;	---------------------------------
                             57 ; Function setUpVideo
                             58 ; ---------------------------------
   530B                      59 _setUpVideo::
                             60 ;src/utils/video.c:41: cpct_disableFirmware();
   530B CD AB 5E      [17]   61 	call	_cpct_disableFirmware
                             62 ;src/utils/video.c:43: cpct_fw2hw(hc_graphics_palette, 16);
   530E 21 10 00      [10]   63 	ld	hl,#0x0010
   5311 E5            [11]   64 	push	hl
   5312 21 3A 53      [10]   65 	ld	hl,#_hc_graphics_palette
   5315 E5            [11]   66 	push	hl
   5316 CD 0F 55      [17]   67 	call	_cpct_fw2hw
                             68 ;src/utils/video.c:44: cpct_setPalette  (hc_graphics_palette, 16);
   5319 21 10 00      [10]   69 	ld	hl,#0x0010
   531C E5            [11]   70 	push	hl
   531D 21 3A 53      [10]   71 	ld	hl,#_hc_graphics_palette
   5320 E5            [11]   72 	push	hl
   5321 CD 3B 54      [17]   73 	call	_cpct_setPalette
                             74 ;src/utils/video.c:45: cpct_setBorder(hc_graphics_palette[0]);
   5324 21 3A 53      [10]   75 	ld	hl, #_hc_graphics_palette + 0
   5327 46            [ 7]   76 	ld	b,(hl)
   5328 C5            [11]   77 	push	bc
   5329 33            [ 6]   78 	inc	sp
   532A 3E 10         [ 7]   79 	ld	a,#0x10
   532C F5            [11]   80 	push	af
   532D 33            [ 6]   81 	inc	sp
   532E CD 5E 54      [17]   82 	call	_cpct_setPALColour
                             83 ;src/utils/video.c:46: cpct_setVideoMode(0);
   5331 2E 00         [ 7]   84 	ld	l,#0x00
   5333 CD 3B 56      [17]   85 	call	_cpct_setVideoMode
                             86 ;src/utils/video.c:47: clearScreen();
   5336 CD 4A 53      [17]   87 	call	_clearScreen
   5339 C9            [10]   88 	ret
   533A                      89 _hc_graphics_palette:
   533A 00                   90 	.db #0x00	; 0
   533B 01                   91 	.db #0x01	; 1
   533C 0F                   92 	.db #0x0F	; 15
   533D 14                   93 	.db #0x14	; 20
   533E 06                   94 	.db #0x06	; 6
   533F 02                   95 	.db #0x02	; 2
   5340 08                   96 	.db #0x08	; 8
   5341 0A                   97 	.db #0x0A	; 10
   5342 0C                   98 	.db #0x0C	; 12
   5343 0E                   99 	.db #0x0E	; 14
   5344 10                  100 	.db #0x10	; 16
   5345 12                  101 	.db #0x12	; 18
   5346 03                  102 	.db #0x03	; 3
   5347 18                  103 	.db #0x18	; 24
   5348 0B                  104 	.db #0x0B	; 11
   5349 1A                  105 	.db #0x1A	; 26
                            106 ;src/utils/video.c:59: void clearScreen() {
                            107 ;	---------------------------------
                            108 ; Function clearScreen
                            109 ; ---------------------------------
   534A                     110 _clearScreen::
                            111 ;src/utils/video.c:61: cpct_memset(CPCT_VMEM_START, cpct_px2byteM0(0,0), 0x4000);
   534A 21 00 00      [10]  112 	ld	hl,#0x0000
   534D E5            [11]  113 	push	hl
   534E CD 49 56      [17]  114 	call	_cpct_px2byteM0
   5351 45            [ 4]  115 	ld	b,l
   5352 21 00 40      [10]  116 	ld	hl,#0x4000
   5355 E5            [11]  117 	push	hl
   5356 C5            [11]  118 	push	bc
   5357 33            [ 6]  119 	inc	sp
   5358 26 C0         [ 7]  120 	ld	h, #0xC0
   535A E5            [11]  121 	push	hl
   535B CD 65 56      [17]  122 	call	_cpct_memset
   535E C9            [10]  123 	ret
                            124 ;src/utils/video.c:72: void clearWindow(u8 xPos, u8 yPos, u8 width, u8 height) {
                            125 ;	---------------------------------
                            126 ; Function clearWindow
                            127 ; ---------------------------------
   535F                     128 _clearWindow::
                            129 ;src/utils/video.c:74: u8* pvideo = cpct_getScreenPtr(CPCT_VMEM_START, xPos, yPos);
   535F 21 03 00      [10]  130 	ld	hl, #3+0
   5362 39            [11]  131 	add	hl, sp
   5363 7E            [ 7]  132 	ld	a, (hl)
   5364 F5            [11]  133 	push	af
   5365 33            [ 6]  134 	inc	sp
   5366 21 03 00      [10]  135 	ld	hl, #3+0
   5369 39            [11]  136 	add	hl, sp
   536A 7E            [ 7]  137 	ld	a, (hl)
   536B F5            [11]  138 	push	af
   536C 33            [ 6]  139 	inc	sp
   536D 21 00 C0      [10]  140 	ld	hl,#0xC000
   5370 E5            [11]  141 	push	hl
   5371 CD D0 5F      [17]  142 	call	_cpct_getScreenPtr
                            143 ;src/utils/video.c:75: cpct_drawSolidBox(pvideo, cpct_px2byteM0(0,0), width, height);
   5374 E5            [11]  144 	push	hl
   5375 21 00 00      [10]  145 	ld	hl,#0x0000
   5378 E5            [11]  146 	push	hl
   5379 CD 49 56      [17]  147 	call	_cpct_px2byteM0
   537C 55            [ 4]  148 	ld	d,l
   537D C1            [10]  149 	pop	bc
   537E 21 05 00      [10]  150 	ld	hl, #5+0
   5381 39            [11]  151 	add	hl, sp
   5382 7E            [ 7]  152 	ld	a, (hl)
   5383 F5            [11]  153 	push	af
   5384 33            [ 6]  154 	inc	sp
   5385 21 05 00      [10]  155 	ld	hl, #5+0
   5388 39            [11]  156 	add	hl, sp
   5389 7E            [ 7]  157 	ld	a, (hl)
   538A F5            [11]  158 	push	af
   538B 33            [ 6]  159 	inc	sp
   538C D5            [11]  160 	push	de
   538D 33            [ 6]  161 	inc	sp
   538E C5            [11]  162 	push	bc
   538F CD BB 5E      [17]  163 	call	_cpct_drawSolidBox
   5392 F1            [10]  164 	pop	af
   5393 F1            [10]  165 	pop	af
   5394 33            [ 6]  166 	inc	sp
   5395 C9            [10]  167 	ret
                            168 	.area _CODE
                            169 	.area _INITIALIZER
                            170 	.area _CABS (ABS)
