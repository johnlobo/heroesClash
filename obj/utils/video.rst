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
   52D9                      59 _setUpVideo::
                             60 ;src/utils/video.c:41: cpct_disableFirmware();
   52D9 CD 73 5E      [17]   61 	call	_cpct_disableFirmware
                             62 ;src/utils/video.c:43: cpct_fw2hw(hc_graphics_palette, 16);
   52DC 21 10 00      [10]   63 	ld	hl,#0x0010
   52DF E5            [11]   64 	push	hl
   52E0 21 08 53      [10]   65 	ld	hl,#_hc_graphics_palette
   52E3 E5            [11]   66 	push	hl
   52E4 CD DD 54      [17]   67 	call	_cpct_fw2hw
                             68 ;src/utils/video.c:44: cpct_setPalette  (hc_graphics_palette, 16);
   52E7 21 10 00      [10]   69 	ld	hl,#0x0010
   52EA E5            [11]   70 	push	hl
   52EB 21 08 53      [10]   71 	ld	hl,#_hc_graphics_palette
   52EE E5            [11]   72 	push	hl
   52EF CD 09 54      [17]   73 	call	_cpct_setPalette
                             74 ;src/utils/video.c:45: cpct_setBorder(hc_graphics_palette[0]);
   52F2 21 08 53      [10]   75 	ld	hl, #_hc_graphics_palette + 0
   52F5 46            [ 7]   76 	ld	b,(hl)
   52F6 C5            [11]   77 	push	bc
   52F7 33            [ 6]   78 	inc	sp
   52F8 3E 10         [ 7]   79 	ld	a,#0x10
   52FA F5            [11]   80 	push	af
   52FB 33            [ 6]   81 	inc	sp
   52FC CD 2C 54      [17]   82 	call	_cpct_setPALColour
                             83 ;src/utils/video.c:46: cpct_setVideoMode(0);
   52FF 2E 00         [ 7]   84 	ld	l,#0x00
   5301 CD 03 56      [17]   85 	call	_cpct_setVideoMode
                             86 ;src/utils/video.c:47: clearScreen();
   5304 CD 18 53      [17]   87 	call	_clearScreen
   5307 C9            [10]   88 	ret
   5308                      89 _hc_graphics_palette:
   5308 00                   90 	.db #0x00	; 0
   5309 01                   91 	.db #0x01	; 1
   530A 0F                   92 	.db #0x0F	; 15
   530B 14                   93 	.db #0x14	; 20
   530C 06                   94 	.db #0x06	; 6
   530D 02                   95 	.db #0x02	; 2
   530E 08                   96 	.db #0x08	; 8
   530F 0A                   97 	.db #0x0A	; 10
   5310 0C                   98 	.db #0x0C	; 12
   5311 0E                   99 	.db #0x0E	; 14
   5312 10                  100 	.db #0x10	; 16
   5313 12                  101 	.db #0x12	; 18
   5314 03                  102 	.db #0x03	; 3
   5315 18                  103 	.db #0x18	; 24
   5316 0B                  104 	.db #0x0B	; 11
   5317 1A                  105 	.db #0x1A	; 26
                            106 ;src/utils/video.c:59: void clearScreen() {
                            107 ;	---------------------------------
                            108 ; Function clearScreen
                            109 ; ---------------------------------
   5318                     110 _clearScreen::
                            111 ;src/utils/video.c:61: cpct_memset(CPCT_VMEM_START, cpct_px2byteM0(0,0), 0x4000);
   5318 21 00 00      [10]  112 	ld	hl,#0x0000
   531B E5            [11]  113 	push	hl
   531C CD 11 56      [17]  114 	call	_cpct_px2byteM0
   531F 45            [ 4]  115 	ld	b,l
   5320 21 00 40      [10]  116 	ld	hl,#0x4000
   5323 E5            [11]  117 	push	hl
   5324 C5            [11]  118 	push	bc
   5325 33            [ 6]  119 	inc	sp
   5326 26 C0         [ 7]  120 	ld	h, #0xC0
   5328 E5            [11]  121 	push	hl
   5329 CD 2D 56      [17]  122 	call	_cpct_memset
   532C C9            [10]  123 	ret
                            124 ;src/utils/video.c:72: void clearWindow(u8 xPos, u8 yPos, u8 width, u8 height) {
                            125 ;	---------------------------------
                            126 ; Function clearWindow
                            127 ; ---------------------------------
   532D                     128 _clearWindow::
                            129 ;src/utils/video.c:74: u8* pvideo = cpct_getScreenPtr(CPCT_VMEM_START, xPos, yPos);
   532D 21 03 00      [10]  130 	ld	hl, #3+0
   5330 39            [11]  131 	add	hl, sp
   5331 7E            [ 7]  132 	ld	a, (hl)
   5332 F5            [11]  133 	push	af
   5333 33            [ 6]  134 	inc	sp
   5334 21 03 00      [10]  135 	ld	hl, #3+0
   5337 39            [11]  136 	add	hl, sp
   5338 7E            [ 7]  137 	ld	a, (hl)
   5339 F5            [11]  138 	push	af
   533A 33            [ 6]  139 	inc	sp
   533B 21 00 C0      [10]  140 	ld	hl,#0xC000
   533E E5            [11]  141 	push	hl
   533F CD 6D 5F      [17]  142 	call	_cpct_getScreenPtr
                            143 ;src/utils/video.c:75: cpct_drawSolidBox(pvideo, cpct_px2byteM0(0,0), width, height);
   5342 E5            [11]  144 	push	hl
   5343 21 00 00      [10]  145 	ld	hl,#0x0000
   5346 E5            [11]  146 	push	hl
   5347 CD 11 56      [17]  147 	call	_cpct_px2byteM0
   534A 55            [ 4]  148 	ld	d,l
   534B C1            [10]  149 	pop	bc
   534C 21 05 00      [10]  150 	ld	hl, #5+0
   534F 39            [11]  151 	add	hl, sp
   5350 7E            [ 7]  152 	ld	a, (hl)
   5351 F5            [11]  153 	push	af
   5352 33            [ 6]  154 	inc	sp
   5353 21 05 00      [10]  155 	ld	hl, #5+0
   5356 39            [11]  156 	add	hl, sp
   5357 7E            [ 7]  157 	ld	a, (hl)
   5358 F5            [11]  158 	push	af
   5359 33            [ 6]  159 	inc	sp
   535A D5            [11]  160 	push	de
   535B 33            [ 6]  161 	inc	sp
   535C C5            [11]  162 	push	bc
   535D CD 83 5E      [17]  163 	call	_cpct_drawSolidBox
   5360 F1            [10]  164 	pop	af
   5361 F1            [10]  165 	pop	af
   5362 33            [ 6]  166 	inc	sp
   5363 C9            [10]  167 	ret
                            168 	.area _CODE
                            169 	.area _INITIALIZER
                            170 	.area _CABS (ABS)
