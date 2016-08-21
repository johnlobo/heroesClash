                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.5 #9498 (Mac OS X x86_64)
                              4 ;--------------------------------------------------------
                              5 	.module text
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _moveCharacter
                             12 	.globl _strLength
                             13 	.globl _clearWindow
                             14 	.globl _itoa
                             15 	.globl _cpct_getScreenPtr
                             16 	.globl _cpct_waitVSYNC
                             17 	.globl _cpct_drawSprite
                             18 	.globl _strCopy
                             19 	.globl _drawNumber
                             20 	.globl _drawText
                             21 	.globl _moveFallingText
                             22 	.globl _drawFallingText
                             23 ;--------------------------------------------------------
                             24 ; special function registers
                             25 ;--------------------------------------------------------
                             26 ;--------------------------------------------------------
                             27 ; ram data
                             28 ;--------------------------------------------------------
                             29 	.area _DATA
                             30 ;--------------------------------------------------------
                             31 ; ram data
                             32 ;--------------------------------------------------------
                             33 	.area _INITIALIZED
                             34 ;--------------------------------------------------------
                             35 ; absolute external ram data
                             36 ;--------------------------------------------------------
                             37 	.area _DABS (ABS)
                             38 ;--------------------------------------------------------
                             39 ; global & static initialisations
                             40 ;--------------------------------------------------------
                             41 	.area _HOME
                             42 	.area _GSINIT
                             43 	.area _GSFINAL
                             44 	.area _GSINIT
                             45 ;--------------------------------------------------------
                             46 ; Home
                             47 ;--------------------------------------------------------
                             48 	.area _HOME
                             49 	.area _HOME
                             50 ;--------------------------------------------------------
                             51 ; code
                             52 ;--------------------------------------------------------
                             53 	.area _CODE
                             54 ;src/utils/text.c:23: u8 strLength(u8 str[]) {
                             55 ;	---------------------------------
                             56 ; Function strLength
                             57 ; ---------------------------------
   4DDB                      58 _strLength::
                             59 ;src/utils/text.c:27: while (str[result] != '\0') {
   4DDB 0E 00         [ 7]   60 	ld	c,#0x00
   4DDD                      61 00101$:
   4DDD 21 02 00      [10]   62 	ld	hl, #2
   4DE0 39            [11]   63 	add	hl, sp
   4DE1 7E            [ 7]   64 	ld	a, (hl)
   4DE2 23            [ 6]   65 	inc	hl
   4DE3 66            [ 7]   66 	ld	h, (hl)
   4DE4 6F            [ 4]   67 	ld	l, a
   4DE5 06 00         [ 7]   68 	ld	b,#0x00
   4DE7 09            [11]   69 	add	hl, bc
   4DE8 7E            [ 7]   70 	ld	a,(hl)
   4DE9 B7            [ 4]   71 	or	a, a
   4DEA 28 03         [12]   72 	jr	Z,00103$
                             73 ;src/utils/text.c:28: result++;
   4DEC 0C            [ 4]   74 	inc	c
   4DED 18 EE         [12]   75 	jr	00101$
   4DEF                      76 00103$:
                             77 ;src/utils/text.c:30: return result;
   4DEF 69            [ 4]   78 	ld	l,c
   4DF0 C9            [10]   79 	ret
                             80 ;src/utils/text.c:36: void strCopy(i8* to, const i8* from) {
                             81 ;	---------------------------------
                             82 ; Function strCopy
                             83 ; ---------------------------------
   4DF1                      84 _strCopy::
   4DF1 DD E5         [15]   85 	push	ix
   4DF3 DD 21 00 00   [14]   86 	ld	ix,#0
   4DF7 DD 39         [15]   87 	add	ix,sp
   4DF9 3B            [ 6]   88 	dec	sp
                             89 ;src/utils/text.c:39: while (i) {
   4DFA DD 4E 06      [19]   90 	ld	c,6 (ix)
   4DFD DD 46 07      [19]   91 	ld	b,7 (ix)
   4E00 DD 5E 04      [19]   92 	ld	e,4 (ix)
   4E03 DD 56 05      [19]   93 	ld	d,5 (ix)
   4E06 DD 36 FF 1E   [19]   94 	ld	-1 (ix),#0x1E
   4E0A                      95 00101$:
   4E0A DD 7E FF      [19]   96 	ld	a,-1 (ix)
   4E0D B7            [ 4]   97 	or	a, a
   4E0E 28 09         [12]   98 	jr	Z,00104$
                             99 ;src/utils/text.c:40: *to++ = *from++;
   4E10 0A            [ 7]  100 	ld	a,(bc)
   4E11 03            [ 6]  101 	inc	bc
   4E12 12            [ 7]  102 	ld	(de),a
   4E13 13            [ 6]  103 	inc	de
                            104 ;src/utils/text.c:41: i--;
   4E14 DD 35 FF      [23]  105 	dec	-1 (ix)
   4E17 18 F1         [12]  106 	jr	00101$
   4E19                     107 00104$:
   4E19 33            [ 6]  108 	inc	sp
   4E1A DD E1         [14]  109 	pop	ix
   4E1C C9            [10]  110 	ret
                            111 ;src/utils/text.c:45: void drawNumber(u16 aNumber, u8 length, u8 xPos, u8 yPos) {
                            112 ;	---------------------------------
                            113 ; Function drawNumber
                            114 ; ---------------------------------
   4E1D                     115 _drawNumber::
   4E1D DD E5         [15]  116 	push	ix
   4E1F DD 21 00 00   [14]  117 	ld	ix,#0
   4E23 DD 39         [15]  118 	add	ix,sp
   4E25 21 F8 FF      [10]  119 	ld	hl,#-8
   4E28 39            [11]  120 	add	hl,sp
                            121 ;src/utils/text.c:53: itoa(aNumber, str, 10);
   4E29 F9            [ 6]  122 	ld	sp, hl
   4E2A 23            [ 6]  123 	inc	hl
   4E2B 23            [ 6]  124 	inc	hl
   4E2C 4D            [ 4]  125 	ld	c,l
   4E2D 44            [ 4]  126 	ld	b,h
   4E2E 59            [ 4]  127 	ld	e, c
   4E2F 50            [ 4]  128 	ld	d, b
   4E30 C5            [11]  129 	push	bc
   4E31 21 0A 00      [10]  130 	ld	hl,#0x000A
   4E34 E5            [11]  131 	push	hl
   4E35 D5            [11]  132 	push	de
   4E36 DD 6E 04      [19]  133 	ld	l,4 (ix)
   4E39 DD 66 05      [19]  134 	ld	h,5 (ix)
   4E3C E5            [11]  135 	push	hl
   4E3D CD C7 4B      [17]  136 	call	_itoa
   4E40 21 06 00      [10]  137 	ld	hl,#6
   4E43 39            [11]  138 	add	hl,sp
   4E44 F9            [ 6]  139 	ld	sp,hl
   4E45 C1            [10]  140 	pop	bc
                            141 ;src/utils/text.c:55: zeros = length - strLength(str);
   4E46 59            [ 4]  142 	ld	e, c
   4E47 50            [ 4]  143 	ld	d, b
   4E48 C5            [11]  144 	push	bc
   4E49 D5            [11]  145 	push	de
   4E4A CD DB 4D      [17]  146 	call	_strLength
   4E4D F1            [10]  147 	pop	af
   4E4E C1            [10]  148 	pop	bc
   4E4F DD 7E 06      [19]  149 	ld	a,6 (ix)
   4E52 95            [ 4]  150 	sub	a, l
   4E53 DD 77 F9      [19]  151 	ld	-7 (ix),a
                            152 ;src/utils/text.c:57: number = str[x];
   4E56 0A            [ 7]  153 	ld	a,(bc)
   4E57 5F            [ 4]  154 	ld	e,a
                            155 ;src/utils/text.c:59: while (number != '\0') {
   4E58 DD 36 F8 00   [19]  156 	ld	-8 (ix),#0x00
   4E5C                     157 00101$:
   4E5C 7B            [ 4]  158 	ld	a,e
   4E5D B7            [ 4]  159 	or	a, a
   4E5E 28 55         [12]  160 	jr	Z,00104$
                            161 ;src/utils/text.c:61: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, (zeros + x) * FONT_W + xPos, yPos);
   4E60 DD 7E F9      [19]  162 	ld	a,-7 (ix)
   4E63 DD 86 F8      [19]  163 	add	a, -8 (ix)
   4E66 6F            [ 4]  164 	ld	l,a
   4E67 D5            [11]  165 	push	de
   4E68 5D            [ 4]  166 	ld	e,l
   4E69 29            [11]  167 	add	hl, hl
   4E6A 19            [11]  168 	add	hl, de
   4E6B D1            [10]  169 	pop	de
   4E6C 7D            [ 4]  170 	ld	a,l
   4E6D DD 86 07      [19]  171 	add	a, 7 (ix)
   4E70 57            [ 4]  172 	ld	d,a
   4E71 C5            [11]  173 	push	bc
   4E72 D5            [11]  174 	push	de
   4E73 DD 7E 08      [19]  175 	ld	a,8 (ix)
   4E76 F5            [11]  176 	push	af
   4E77 33            [ 6]  177 	inc	sp
   4E78 D5            [11]  178 	push	de
   4E79 33            [ 6]  179 	inc	sp
   4E7A 21 00 C0      [10]  180 	ld	hl,#0xC000
   4E7D E5            [11]  181 	push	hl
   4E7E CD 55 57      [17]  182 	call	_cpct_getScreenPtr
   4E81 D1            [10]  183 	pop	de
   4E82 C1            [10]  184 	pop	bc
                            185 ;src/utils/text.c:62: cpct_drawSprite(G_numbers_big[number - 48], pvideo, FONT_W, FONT_H);
   4E83 E5            [11]  186 	push	hl
   4E84 FD E1         [14]  187 	pop	iy
   4E86 16 00         [ 7]  188 	ld	d,#0x00
   4E88 7B            [ 4]  189 	ld	a,e
   4E89 C6 D0         [ 7]  190 	add	a,#0xD0
   4E8B 5F            [ 4]  191 	ld	e,a
   4E8C 7A            [ 4]  192 	ld	a,d
   4E8D CE FF         [ 7]  193 	adc	a,#0xFF
   4E8F 57            [ 4]  194 	ld	d,a
   4E90 6B            [ 4]  195 	ld	l, e
   4E91 62            [ 4]  196 	ld	h, d
   4E92 29            [11]  197 	add	hl, hl
   4E93 29            [11]  198 	add	hl, hl
   4E94 29            [11]  199 	add	hl, hl
   4E95 29            [11]  200 	add	hl, hl
   4E96 29            [11]  201 	add	hl, hl
   4E97 19            [11]  202 	add	hl, de
   4E98 11 59 49      [10]  203 	ld	de,#_G_numbers_big
   4E9B 19            [11]  204 	add	hl,de
   4E9C EB            [ 4]  205 	ex	de,hl
   4E9D C5            [11]  206 	push	bc
   4E9E 21 03 0B      [10]  207 	ld	hl,#0x0B03
   4EA1 E5            [11]  208 	push	hl
   4EA2 FD E5         [15]  209 	push	iy
   4EA4 D5            [11]  210 	push	de
   4EA5 CD 08 54      [17]  211 	call	_cpct_drawSprite
   4EA8 C1            [10]  212 	pop	bc
                            213 ;src/utils/text.c:64: number = str[++x];
   4EA9 DD 34 F8      [23]  214 	inc	-8 (ix)
   4EAC DD 6E F8      [19]  215 	ld	l,-8 (ix)
   4EAF 26 00         [ 7]  216 	ld	h,#0x00
   4EB1 09            [11]  217 	add	hl,bc
   4EB2 5E            [ 7]  218 	ld	e,(hl)
   4EB3 18 A7         [12]  219 	jr	00101$
   4EB5                     220 00104$:
   4EB5 DD F9         [10]  221 	ld	sp, ix
   4EB7 DD E1         [14]  222 	pop	ix
   4EB9 C9            [10]  223 	ret
                            224 ;src/utils/text.c:70: void drawText(u8 text[], u8 xPos, u8 yPos, u8 centered) {
                            225 ;	---------------------------------
                            226 ; Function drawText
                            227 ; ---------------------------------
   4EBA                     228 _drawText::
   4EBA DD E5         [15]  229 	push	ix
   4EBC DD 21 00 00   [14]  230 	ld	ix,#0
   4EC0 DD 39         [15]  231 	add	ix,sp
   4EC2 F5            [11]  232 	push	af
   4EC3 F5            [11]  233 	push	af
   4EC4 3B            [ 6]  234 	dec	sp
                            235 ;src/utils/text.c:76: if (centered) {
   4EC5 DD 7E 08      [19]  236 	ld	a,8 (ix)
   4EC8 B7            [ 4]  237 	or	a, a
   4EC9 28 16         [12]  238 	jr	Z,00102$
                            239 ;src/utils/text.c:77: x = strLength(text);
   4ECB DD 6E 04      [19]  240 	ld	l,4 (ix)
   4ECE DD 66 05      [19]  241 	ld	h,5 (ix)
   4ED1 E5            [11]  242 	push	hl
   4ED2 CD DB 4D      [17]  243 	call	_strLength
   4ED5 F1            [10]  244 	pop	af
                            245 ;src/utils/text.c:78: xPos = 39 - (x / 2) * FONT_W;
   4ED6 CB 3D         [ 8]  246 	srl	l
   4ED8 4D            [ 4]  247 	ld	c,l
   4ED9 29            [11]  248 	add	hl, hl
   4EDA 09            [11]  249 	add	hl, bc
   4EDB 3E 27         [ 7]  250 	ld	a,#0x27
   4EDD 95            [ 4]  251 	sub	a, l
   4EDE DD 77 06      [19]  252 	ld	6 (ix),a
   4EE1                     253 00102$:
                            254 ;src/utils/text.c:82: character = text[x];
   4EE1 DD 4E 04      [19]  255 	ld	c,4 (ix)
   4EE4 DD 46 05      [19]  256 	ld	b,5 (ix)
   4EE7 0A            [ 7]  257 	ld	a,(bc)
   4EE8 DD 77 FB      [19]  258 	ld	-5 (ix),a
                            259 ;src/utils/text.c:84: while (character != '\0') {
   4EEB DD 36 FC 00   [19]  260 	ld	-4 (ix),#0x00
   4EEF DD 36 FF 00   [19]  261 	ld	-1 (ix),#0x00
   4EF3                     262 00109$:
   4EF3 DD 7E FB      [19]  263 	ld	a,-5 (ix)
   4EF6 B7            [ 4]  264 	or	a, a
   4EF7 CA 98 4F      [10]  265 	jp	Z,00112$
                            266 ;src/utils/text.c:86: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, (x * FONT_W) + xPos, yPos);
   4EFA DD 7E FF      [19]  267 	ld	a,-1 (ix)
   4EFD DD 86 06      [19]  268 	add	a, 6 (ix)
   4F00 57            [ 4]  269 	ld	d,a
   4F01 C5            [11]  270 	push	bc
   4F02 DD 7E 07      [19]  271 	ld	a,7 (ix)
   4F05 F5            [11]  272 	push	af
   4F06 33            [ 6]  273 	inc	sp
   4F07 D5            [11]  274 	push	de
   4F08 33            [ 6]  275 	inc	sp
   4F09 21 00 C0      [10]  276 	ld	hl,#0xC000
   4F0C E5            [11]  277 	push	hl
   4F0D CD 55 57      [17]  278 	call	_cpct_getScreenPtr
   4F10 C1            [10]  279 	pop	bc
                            280 ;src/utils/text.c:91: cpct_drawSprite(G_numbers_big[character - 48], pvideo, FONT_W, FONT_H);
   4F11 DD 75 FD      [19]  281 	ld	-3 (ix),l
   4F14 DD 74 FE      [19]  282 	ld	-2 (ix),h
   4F17 DD 5E FB      [19]  283 	ld	e,-5 (ix)
   4F1A 16 00         [ 7]  284 	ld	d,#0x00
                            285 ;src/utils/text.c:89: if (character >= 48 && character <= 57) {
   4F1C DD 7E FB      [19]  286 	ld	a,-5 (ix)
   4F1F D6 30         [ 7]  287 	sub	a, #0x30
   4F21 38 2F         [12]  288 	jr	C,00106$
   4F23 3E 39         [ 7]  289 	ld	a,#0x39
   4F25 DD 96 FB      [19]  290 	sub	a, -5 (ix)
   4F28 38 28         [12]  291 	jr	C,00106$
                            292 ;src/utils/text.c:91: cpct_drawSprite(G_numbers_big[character - 48], pvideo, FONT_W, FONT_H);
   4F2A 7B            [ 4]  293 	ld	a,e
   4F2B C6 D0         [ 7]  294 	add	a,#0xD0
   4F2D 5F            [ 4]  295 	ld	e,a
   4F2E 7A            [ 4]  296 	ld	a,d
   4F2F CE FF         [ 7]  297 	adc	a,#0xFF
   4F31 57            [ 4]  298 	ld	d,a
   4F32 6B            [ 4]  299 	ld	l, e
   4F33 62            [ 4]  300 	ld	h, d
   4F34 29            [11]  301 	add	hl, hl
   4F35 29            [11]  302 	add	hl, hl
   4F36 29            [11]  303 	add	hl, hl
   4F37 29            [11]  304 	add	hl, hl
   4F38 29            [11]  305 	add	hl, hl
   4F39 19            [11]  306 	add	hl, de
   4F3A 11 59 49      [10]  307 	ld	de,#_G_numbers_big
   4F3D 19            [11]  308 	add	hl,de
   4F3E EB            [ 4]  309 	ex	de,hl
   4F3F C5            [11]  310 	push	bc
   4F40 21 03 0B      [10]  311 	ld	hl,#0x0B03
   4F43 E5            [11]  312 	push	hl
   4F44 DD 6E FD      [19]  313 	ld	l,-3 (ix)
   4F47 DD 66 FE      [19]  314 	ld	h,-2 (ix)
   4F4A E5            [11]  315 	push	hl
   4F4B D5            [11]  316 	push	de
   4F4C CD 08 54      [17]  317 	call	_cpct_drawSprite
   4F4F C1            [10]  318 	pop	bc
   4F50 18 2D         [12]  319 	jr	00107$
   4F52                     320 00106$:
                            321 ;src/utils/text.c:94: else if (character != 32) { //32 = SPACE
   4F52 DD 7E FB      [19]  322 	ld	a,-5 (ix)
   4F55 D6 20         [ 7]  323 	sub	a, #0x20
   4F57 28 26         [12]  324 	jr	Z,00107$
                            325 ;src/utils/text.c:96: cpct_drawSprite(g_font_big[character - 64], pvideo, FONT_W, FONT_H);
   4F59 7B            [ 4]  326 	ld	a,e
   4F5A C6 C0         [ 7]  327 	add	a,#0xC0
   4F5C 5F            [ 4]  328 	ld	e,a
   4F5D 7A            [ 4]  329 	ld	a,d
   4F5E CE FF         [ 7]  330 	adc	a,#0xFF
   4F60 57            [ 4]  331 	ld	d,a
   4F61 6B            [ 4]  332 	ld	l, e
   4F62 62            [ 4]  333 	ld	h, d
   4F63 29            [11]  334 	add	hl, hl
   4F64 29            [11]  335 	add	hl, hl
   4F65 29            [11]  336 	add	hl, hl
   4F66 29            [11]  337 	add	hl, hl
   4F67 29            [11]  338 	add	hl, hl
   4F68 19            [11]  339 	add	hl, de
   4F69 11 52 44      [10]  340 	ld	de,#_g_font_big
   4F6C 19            [11]  341 	add	hl,de
   4F6D EB            [ 4]  342 	ex	de,hl
   4F6E C5            [11]  343 	push	bc
   4F6F 21 03 0B      [10]  344 	ld	hl,#0x0B03
   4F72 E5            [11]  345 	push	hl
   4F73 DD 6E FD      [19]  346 	ld	l,-3 (ix)
   4F76 DD 66 FE      [19]  347 	ld	h,-2 (ix)
   4F79 E5            [11]  348 	push	hl
   4F7A D5            [11]  349 	push	de
   4F7B CD 08 54      [17]  350 	call	_cpct_drawSprite
   4F7E C1            [10]  351 	pop	bc
   4F7F                     352 00107$:
                            353 ;src/utils/text.c:99: character = text[++x];
   4F7F DD 34 FF      [23]  354 	inc	-1 (ix)
   4F82 DD 34 FF      [23]  355 	inc	-1 (ix)
   4F85 DD 34 FF      [23]  356 	inc	-1 (ix)
   4F88 DD 34 FC      [23]  357 	inc	-4 (ix)
   4F8B DD 6E FC      [19]  358 	ld	l,-4 (ix)
   4F8E 26 00         [ 7]  359 	ld	h,#0x00
   4F90 09            [11]  360 	add	hl,bc
   4F91 7E            [ 7]  361 	ld	a,(hl)
   4F92 DD 77 FB      [19]  362 	ld	-5 (ix),a
   4F95 C3 F3 4E      [10]  363 	jp	00109$
   4F98                     364 00112$:
   4F98 DD F9         [10]  365 	ld	sp, ix
   4F9A DD E1         [14]  366 	pop	ix
   4F9C C9            [10]  367 	ret
                            368 ;src/utils/text.c:103: void moveCharacter(FChar *character) {
                            369 ;	---------------------------------
                            370 ; Function moveCharacter
                            371 ; ---------------------------------
   4F9D                     372 _moveCharacter::
   4F9D DD E5         [15]  373 	push	ix
   4F9F DD 21 00 00   [14]  374 	ld	ix,#0
   4FA3 DD 39         [15]  375 	add	ix,sp
   4FA5 21 F3 FF      [10]  376 	ld	hl,#-13
   4FA8 39            [11]  377 	add	hl,sp
   4FA9 F9            [ 6]  378 	ld	sp,hl
                            379 ;src/utils/text.c:105: if (character->phase != FALLING_TEXT_MAX_BOUNCES) {
   4FAA DD 4E 04      [19]  380 	ld	c,4 (ix)
   4FAD DD 46 05      [19]  381 	ld	b,5 (ix)
   4FB0 0A            [ 7]  382 	ld	a,(bc)
   4FB1 57            [ 4]  383 	ld	d,a
                            384 ;src/utils/text.c:110: if (character->yPos != character->startyPos) {
   4FB2 21 02 00      [10]  385 	ld	hl,#0x0002
   4FB5 09            [11]  386 	add	hl,bc
   4FB6 DD 75 FE      [19]  387 	ld	-2 (ix),l
   4FB9 DD 74 FF      [19]  388 	ld	-1 (ix),h
   4FBC DD 6E FE      [19]  389 	ld	l,-2 (ix)
   4FBF DD 66 FF      [19]  390 	ld	h,-1 (ix)
   4FC2 5E            [ 7]  391 	ld	e,(hl)
                            392 ;src/utils/text.c:112: clearWindow(character->xPos, character->yPos + (character->phase % 2 != 0 ? - FALLING_TEXT_SPEED : FALLING_TEXT_SPEED), FONT_W, FONT_H);
   4FC3 21 01 00      [10]  393 	ld	hl,#0x0001
   4FC6 09            [11]  394 	add	hl,bc
   4FC7 DD 75 FC      [19]  395 	ld	-4 (ix),l
   4FCA DD 74 FD      [19]  396 	ld	-3 (ix),h
                            397 ;src/utils/text.c:144: drawText(character->character, character->xPos, character->yPos, 0);
   4FCD 21 06 00      [10]  398 	ld	hl,#0x0006
   4FD0 09            [11]  399 	add	hl,bc
   4FD1 DD 75 FA      [19]  400 	ld	-6 (ix),l
   4FD4 DD 74 FB      [19]  401 	ld	-5 (ix),h
                            402 ;src/utils/text.c:105: if (character->phase != FALLING_TEXT_MAX_BOUNCES) {
   4FD7 7A            [ 4]  403 	ld	a,d
   4FD8 D6 06         [ 7]  404 	sub	a, #0x06
   4FDA CA C9 50      [10]  405 	jp	Z,00111$
                            406 ;src/utils/text.c:110: if (character->yPos != character->startyPos) {
   4FDD 21 03 00      [10]  407 	ld	hl,#0x0003
   4FE0 09            [11]  408 	add	hl,bc
   4FE1 DD 75 F8      [19]  409 	ld	-8 (ix),l
   4FE4 DD 74 F9      [19]  410 	ld	-7 (ix),h
   4FE7 DD 6E F8      [19]  411 	ld	l,-8 (ix)
   4FEA DD 66 F9      [19]  412 	ld	h,-7 (ix)
   4FED 7E            [ 7]  413 	ld	a,(hl)
   4FEE DD 77 F7      [19]  414 	ld	-9 (ix),a
   4FF1 7B            [ 4]  415 	ld	a,e
   4FF2 DD 96 F7      [19]  416 	sub	a, -9 (ix)
   4FF5 28 24         [12]  417 	jr	Z,00102$
                            418 ;src/utils/text.c:112: clearWindow(character->xPos, character->yPos + (character->phase % 2 != 0 ? - FALLING_TEXT_SPEED : FALLING_TEXT_SPEED), FONT_W, FONT_H);
   4FF7 CB 42         [ 8]  419 	bit	0, d
   4FF9 28 04         [12]  420 	jr	Z,00115$
   4FFB 2E FD         [ 7]  421 	ld	l,#0xFD
   4FFD 18 02         [12]  422 	jr	00116$
   4FFF                     423 00115$:
   4FFF 2E 03         [ 7]  424 	ld	l,#0x03
   5001                     425 00116$:
   5001 7B            [ 4]  426 	ld	a,e
   5002 85            [ 4]  427 	add	a, l
   5003 5F            [ 4]  428 	ld	e,a
   5004 DD 6E FC      [19]  429 	ld	l,-4 (ix)
   5007 DD 66 FD      [19]  430 	ld	h,-3 (ix)
   500A 56            [ 7]  431 	ld	d,(hl)
   500B C5            [11]  432 	push	bc
   500C 21 03 0B      [10]  433 	ld	hl,#0x0B03
   500F E5            [11]  434 	push	hl
   5010 7B            [ 4]  435 	ld	a,e
   5011 F5            [11]  436 	push	af
   5012 33            [ 6]  437 	inc	sp
   5013 D5            [11]  438 	push	de
   5014 33            [ 6]  439 	inc	sp
   5015 CD FD 52      [17]  440 	call	_clearWindow
   5018 F1            [10]  441 	pop	af
   5019 F1            [10]  442 	pop	af
   501A C1            [10]  443 	pop	bc
   501B                     444 00102$:
                            445 ;src/utils/text.c:117: if (character->phase % 2 != 0) {
   501B 0A            [ 7]  446 	ld	a,(bc)
   501C E6 01         [ 7]  447 	and	a, #0x01
   501E DD 77 F7      [19]  448 	ld	-9 (ix),a
                            449 ;src/utils/text.c:110: if (character->yPos != character->startyPos) {
   5021 DD 6E FE      [19]  450 	ld	l,-2 (ix)
   5024 DD 66 FF      [19]  451 	ld	h,-1 (ix)
   5027 5E            [ 7]  452 	ld	e,(hl)
                            453 ;src/utils/text.c:121: if (character->yPos >= character->destinationyPos) {
   5028 21 05 00      [10]  454 	ld	hl,#0x0005
   502B 09            [11]  455 	add	hl,bc
   502C DD 75 F5      [19]  456 	ld	-11 (ix),l
   502F DD 74 F6      [19]  457 	ld	-10 (ix),h
                            458 ;src/utils/text.c:125: character->destinationyPos = character->endyPos - ((character->endyPos - character->startyPos) / character->phase);
   5032 21 04 00      [10]  459 	ld	hl,#0x0004
   5035 09            [11]  460 	add	hl,bc
   5036 E3            [19]  461 	ex	(sp), hl
                            462 ;src/utils/text.c:117: if (character->phase % 2 != 0) {
   5037 DD 7E F7      [19]  463 	ld	a,-9 (ix)
   503A B7            [ 4]  464 	or	a, a
   503B 28 48         [12]  465 	jr	Z,00108$
                            466 ;src/utils/text.c:119: character->yPos += FALLING_TEXT_SPEED;
   503D 1C            [ 4]  467 	inc	e
   503E 1C            [ 4]  468 	inc	e
   503F 1C            [ 4]  469 	inc	e
   5040 DD 6E FE      [19]  470 	ld	l,-2 (ix)
   5043 DD 66 FF      [19]  471 	ld	h,-1 (ix)
   5046 73            [ 7]  472 	ld	(hl),e
                            473 ;src/utils/text.c:121: if (character->yPos >= character->destinationyPos) {
   5047 DD 6E F5      [19]  474 	ld	l,-11 (ix)
   504A DD 66 F6      [19]  475 	ld	h,-10 (ix)
   504D 56            [ 7]  476 	ld	d,(hl)
   504E 7B            [ 4]  477 	ld	a,e
   504F 92            [ 4]  478 	sub	a, d
   5050 38 55         [12]  479 	jr	C,00109$
                            480 ;src/utils/text.c:123: character->phase++;
   5052 0A            [ 7]  481 	ld	a,(bc)
   5053 5F            [ 4]  482 	ld	e,a
   5054 1C            [ 4]  483 	inc	e
   5055 7B            [ 4]  484 	ld	a,e
   5056 02            [ 7]  485 	ld	(bc),a
                            486 ;src/utils/text.c:125: character->destinationyPos = character->endyPos - ((character->endyPos - character->startyPos) / character->phase);
   5057 E1            [10]  487 	pop	hl
   5058 E5            [11]  488 	push	hl
   5059 7E            [ 7]  489 	ld	a,(hl)
   505A DD 77 F7      [19]  490 	ld	-9 (ix), a
   505D 4F            [ 4]  491 	ld	c, a
   505E 06 00         [ 7]  492 	ld	b,#0x00
   5060 DD 6E F8      [19]  493 	ld	l,-8 (ix)
   5063 DD 66 F9      [19]  494 	ld	h,-7 (ix)
   5066 6E            [ 7]  495 	ld	l,(hl)
   5067 16 00         [ 7]  496 	ld	d,#0x00
   5069 79            [ 4]  497 	ld	a,c
   506A 95            [ 4]  498 	sub	a, l
   506B 4F            [ 4]  499 	ld	c,a
   506C 78            [ 4]  500 	ld	a,b
   506D 9A            [ 4]  501 	sbc	a, d
   506E 47            [ 4]  502 	ld	b,a
   506F 16 00         [ 7]  503 	ld	d,#0x00
   5071 D5            [11]  504 	push	de
   5072 C5            [11]  505 	push	bc
   5073 CD B0 57      [17]  506 	call	__divsint
   5076 F1            [10]  507 	pop	af
   5077 F1            [10]  508 	pop	af
   5078 DD 7E F7      [19]  509 	ld	a, -9 (ix)
   507B 95            [ 4]  510 	sub	a, l
   507C DD 6E F5      [19]  511 	ld	l,-11 (ix)
   507F DD 66 F6      [19]  512 	ld	h,-10 (ix)
   5082 77            [ 7]  513 	ld	(hl),a
   5083 18 22         [12]  514 	jr	00109$
   5085                     515 00108$:
                            516 ;src/utils/text.c:132: character->yPos -= FALLING_TEXT_SPEED;
   5085 7B            [ 4]  517 	ld	a,e
   5086 C6 FD         [ 7]  518 	add	a,#0xFD
   5088 5F            [ 4]  519 	ld	e,a
   5089 DD 6E FE      [19]  520 	ld	l,-2 (ix)
   508C DD 66 FF      [19]  521 	ld	h,-1 (ix)
   508F 73            [ 7]  522 	ld	(hl),e
                            523 ;src/utils/text.c:134: if (character->yPos <= character->destinationyPos) {
   5090 DD 6E F5      [19]  524 	ld	l,-11 (ix)
   5093 DD 66 F6      [19]  525 	ld	h,-10 (ix)
   5096 7E            [ 7]  526 	ld	a, (hl)
   5097 93            [ 4]  527 	sub	a, e
   5098 38 0D         [12]  528 	jr	C,00109$
                            529 ;src/utils/text.c:136: character->phase++;
   509A 0A            [ 7]  530 	ld	a,(bc)
   509B 3C            [ 4]  531 	inc	a
   509C 02            [ 7]  532 	ld	(bc),a
                            533 ;src/utils/text.c:138: character->destinationyPos = character->endyPos;
   509D E1            [10]  534 	pop	hl
   509E E5            [11]  535 	push	hl
   509F 4E            [ 7]  536 	ld	c,(hl)
   50A0 DD 6E F5      [19]  537 	ld	l,-11 (ix)
   50A3 DD 66 F6      [19]  538 	ld	h,-10 (ix)
   50A6 71            [ 7]  539 	ld	(hl),c
   50A7                     540 00109$:
                            541 ;src/utils/text.c:144: drawText(character->character, character->xPos, character->yPos, 0);
   50A7 DD 6E FE      [19]  542 	ld	l,-2 (ix)
   50AA DD 66 FF      [19]  543 	ld	h,-1 (ix)
   50AD 46            [ 7]  544 	ld	b,(hl)
   50AE DD 6E FC      [19]  545 	ld	l,-4 (ix)
   50B1 DD 66 FD      [19]  546 	ld	h,-3 (ix)
   50B4 56            [ 7]  547 	ld	d,(hl)
   50B5 AF            [ 4]  548 	xor	a, a
   50B6 F5            [11]  549 	push	af
   50B7 33            [ 6]  550 	inc	sp
   50B8 4A            [ 4]  551 	ld	c, d
   50B9 C5            [11]  552 	push	bc
   50BA DD 6E FA      [19]  553 	ld	l,-6 (ix)
   50BD DD 66 FB      [19]  554 	ld	h,-5 (ix)
   50C0 E5            [11]  555 	push	hl
   50C1 CD BA 4E      [17]  556 	call	_drawText
   50C4 F1            [10]  557 	pop	af
   50C5 F1            [10]  558 	pop	af
   50C6 33            [ 6]  559 	inc	sp
   50C7 18 3A         [12]  560 	jr	00113$
   50C9                     561 00111$:
                            562 ;src/utils/text.c:148: clearWindow(character->xPos, character->yPos - FALLING_TEXT_SPEED, FONT_W, FONT_H);
   50C9 7B            [ 4]  563 	ld	a,e
   50CA C6 FD         [ 7]  564 	add	a,#0xFD
   50CC 57            [ 4]  565 	ld	d,a
   50CD DD 6E FC      [19]  566 	ld	l,-4 (ix)
   50D0 DD 66 FD      [19]  567 	ld	h,-3 (ix)
   50D3 46            [ 7]  568 	ld	b,(hl)
   50D4 21 03 0B      [10]  569 	ld	hl,#0x0B03
   50D7 E5            [11]  570 	push	hl
   50D8 D5            [11]  571 	push	de
   50D9 33            [ 6]  572 	inc	sp
   50DA C5            [11]  573 	push	bc
   50DB 33            [ 6]  574 	inc	sp
   50DC CD FD 52      [17]  575 	call	_clearWindow
   50DF F1            [10]  576 	pop	af
   50E0 F1            [10]  577 	pop	af
                            578 ;src/utils/text.c:149: drawText(character->character, character->xPos, character->yPos, 0);
   50E1 DD 6E FE      [19]  579 	ld	l,-2 (ix)
   50E4 DD 66 FF      [19]  580 	ld	h,-1 (ix)
   50E7 56            [ 7]  581 	ld	d,(hl)
   50E8 DD 6E FC      [19]  582 	ld	l,-4 (ix)
   50EB DD 66 FD      [19]  583 	ld	h,-3 (ix)
   50EE 46            [ 7]  584 	ld	b,(hl)
   50EF AF            [ 4]  585 	xor	a, a
   50F0 F5            [11]  586 	push	af
   50F1 33            [ 6]  587 	inc	sp
   50F2 D5            [11]  588 	push	de
   50F3 33            [ 6]  589 	inc	sp
   50F4 C5            [11]  590 	push	bc
   50F5 33            [ 6]  591 	inc	sp
   50F6 DD 6E FA      [19]  592 	ld	l,-6 (ix)
   50F9 DD 66 FB      [19]  593 	ld	h,-5 (ix)
   50FC E5            [11]  594 	push	hl
   50FD CD BA 4E      [17]  595 	call	_drawText
   5100 F1            [10]  596 	pop	af
   5101 F1            [10]  597 	pop	af
   5102 33            [ 6]  598 	inc	sp
   5103                     599 00113$:
   5103 DD F9         [10]  600 	ld	sp, ix
   5105 DD E1         [14]  601 	pop	ix
   5107 C9            [10]  602 	ret
                            603 ;src/utils/text.c:154: u8 moveFallingText(FChar *text, u8 lenght) {
                            604 ;	---------------------------------
                            605 ; Function moveFallingText
                            606 ; ---------------------------------
   5108                     607 _moveFallingText::
   5108 DD E5         [15]  608 	push	ix
   510A DD 21 00 00   [14]  609 	ld	ix,#0
   510E DD 39         [15]  610 	add	ix,sp
   5110 F5            [11]  611 	push	af
                            612 ;src/utils/text.c:158: for (x = 0; x < lenght; x++) {
   5111 0E 00         [ 7]  613 	ld	c,#0x00
   5113                     614 00109$:
   5113 79            [ 4]  615 	ld	a,c
   5114 DD 96 06      [19]  616 	sub	a, 6 (ix)
   5117 30 69         [12]  617 	jr	NC,00107$
                            618 ;src/utils/text.c:160: if (x == 0 || (x > 0 && text[x - 1].phase == 1 && text[x - 1].yPos >= text[x].yPos + 15) || text[x - 1].phase > 1) moveCharacter(&text[x]);
   5119 69            [ 4]  619 	ld	l,c
   511A 26 00         [ 7]  620 	ld	h,#0x00
   511C 5D            [ 4]  621 	ld	e, l
   511D 54            [ 4]  622 	ld	d, h
   511E CB 23         [ 8]  623 	sla	e
   5120 CB 12         [ 8]  624 	rl	d
   5122 CB 23         [ 8]  625 	sla	e
   5124 CB 12         [ 8]  626 	rl	d
   5126 CB 23         [ 8]  627 	sla	e
   5128 CB 12         [ 8]  628 	rl	d
   512A DD 7E 04      [19]  629 	ld	a,4 (ix)
   512D 83            [ 4]  630 	add	a, e
   512E DD 77 FE      [19]  631 	ld	-2 (ix),a
   5131 DD 7E 05      [19]  632 	ld	a,5 (ix)
   5134 8A            [ 4]  633 	adc	a, d
   5135 DD 77 FF      [19]  634 	ld	-1 (ix),a
   5138 79            [ 4]  635 	ld	a,c
   5139 B7            [ 4]  636 	or	a, a
   513A 28 38         [12]  637 	jr	Z,00101$
   513C 2B            [ 6]  638 	dec	hl
   513D 29            [11]  639 	add	hl, hl
   513E 29            [11]  640 	add	hl, hl
   513F 29            [11]  641 	add	hl, hl
   5140 EB            [ 4]  642 	ex	de,hl
   5141 DD 6E 04      [19]  643 	ld	l,4 (ix)
   5144 DD 66 05      [19]  644 	ld	h,5 (ix)
   5147 19            [11]  645 	add	hl,de
   5148 46            [ 7]  646 	ld	b,(hl)
   5149 79            [ 4]  647 	ld	a,c
   514A B7            [ 4]  648 	or	a, a
   514B 28 22         [12]  649 	jr	Z,00106$
   514D 78            [ 4]  650 	ld	a,b
   514E 3D            [ 4]  651 	dec	a
   514F 20 1E         [12]  652 	jr	NZ,00106$
   5151 23            [ 6]  653 	inc	hl
   5152 23            [ 6]  654 	inc	hl
   5153 5E            [ 7]  655 	ld	e,(hl)
   5154 E1            [10]  656 	pop	hl
   5155 E5            [11]  657 	push	hl
   5156 23            [ 6]  658 	inc	hl
   5157 23            [ 6]  659 	inc	hl
   5158 6E            [ 7]  660 	ld	l,(hl)
   5159 26 00         [ 7]  661 	ld	h,#0x00
   515B D5            [11]  662 	push	de
   515C 11 0F 00      [10]  663 	ld	de,#0x000F
   515F 19            [11]  664 	add	hl, de
   5160 D1            [10]  665 	pop	de
   5161 16 00         [ 7]  666 	ld	d,#0x00
   5163 7B            [ 4]  667 	ld	a,e
   5164 95            [ 4]  668 	sub	a, l
   5165 7A            [ 4]  669 	ld	a,d
   5166 9C            [ 4]  670 	sbc	a, h
   5167 E2 6C 51      [10]  671 	jp	PO, 00138$
   516A EE 80         [ 7]  672 	xor	a, #0x80
   516C                     673 00138$:
   516C F2 74 51      [10]  674 	jp	P,00101$
   516F                     675 00106$:
   516F 3E 01         [ 7]  676 	ld	a,#0x01
   5171 90            [ 4]  677 	sub	a, b
   5172 30 0B         [12]  678 	jr	NC,00110$
   5174                     679 00101$:
   5174 C5            [11]  680 	push	bc
   5175 D1            [10]  681 	pop	de
   5176 E1            [10]  682 	pop	hl
   5177 E5            [11]  683 	push	hl
   5178 D5            [11]  684 	push	de
   5179 E5            [11]  685 	push	hl
   517A CD 9D 4F      [17]  686 	call	_moveCharacter
   517D F1            [10]  687 	pop	af
   517E C1            [10]  688 	pop	bc
   517F                     689 00110$:
                            690 ;src/utils/text.c:158: for (x = 0; x < lenght; x++) {
   517F 0C            [ 4]  691 	inc	c
   5180 18 91         [12]  692 	jr	00109$
   5182                     693 00107$:
                            694 ;src/utils/text.c:163: return text[lenght - 1].phase == FALLING_TEXT_MAX_BOUNCES;
   5182 DD 6E 06      [19]  695 	ld	l,6 (ix)
   5185 26 00         [ 7]  696 	ld	h,#0x00
   5187 2B            [ 6]  697 	dec	hl
   5188 29            [11]  698 	add	hl, hl
   5189 29            [11]  699 	add	hl, hl
   518A 29            [11]  700 	add	hl, hl
   518B 4D            [ 4]  701 	ld	c, l
   518C 44            [ 4]  702 	ld	b, h
   518D DD 6E 04      [19]  703 	ld	l,4 (ix)
   5190 DD 66 05      [19]  704 	ld	h,5 (ix)
   5193 09            [11]  705 	add	hl,bc
   5194 7E            [ 7]  706 	ld	a,(hl)
   5195 D6 06         [ 7]  707 	sub	a, #0x06
   5197 20 04         [12]  708 	jr	NZ,00139$
   5199 3E 01         [ 7]  709 	ld	a,#0x01
   519B 18 01         [12]  710 	jr	00140$
   519D                     711 00139$:
   519D AF            [ 4]  712 	xor	a,a
   519E                     713 00140$:
   519E 6F            [ 4]  714 	ld	l,a
   519F DD F9         [10]  715 	ld	sp, ix
   51A1 DD E1         [14]  716 	pop	ix
   51A3 C9            [10]  717 	ret
                            718 ;src/utils/text.c:169: void drawFallingText(u8 text[], u8 xPos, u8 yPos, u8 destinationyPos) {
                            719 ;	---------------------------------
                            720 ; Function drawFallingText
                            721 ; ---------------------------------
   51A4                     722 _drawFallingText::
   51A4 DD E5         [15]  723 	push	ix
   51A6 DD 21 00 00   [14]  724 	ld	ix,#0
   51AA DD 39         [15]  725 	add	ix,sp
   51AC 21 5A FF      [10]  726 	ld	hl,#-166
   51AF 39            [11]  727 	add	hl,sp
   51B0 F9            [ 6]  728 	ld	sp,hl
                            729 ;src/utils/text.c:175: for (x = 0; x < strLength(text) && x < FALLING_TEXT_MAX_LENGHT; x++) {
   51B1 21 01 00      [10]  730 	ld	hl,#0x0001
   51B4 39            [11]  731 	add	hl,sp
   51B5 DD 75 FE      [19]  732 	ld	-2 (ix),l
   51B8 DD 74 FF      [19]  733 	ld	-1 (ix),h
   51BB FD 21 00 00   [14]  734 	ld	iy,#0
   51BF FD 39         [15]  735 	add	iy,sp
   51C1 FD 36 00 00   [19]  736 	ld	0 (iy),#0x00
   51C5 DD 36 FD 00   [19]  737 	ld	-3 (ix),#0x00
   51C9                     738 00109$:
   51C9 DD 6E 04      [19]  739 	ld	l,4 (ix)
   51CC DD 66 05      [19]  740 	ld	h,5 (ix)
   51CF E5            [11]  741 	push	hl
   51D0 CD DB 4D      [17]  742 	call	_strLength
   51D3 F1            [10]  743 	pop	af
   51D4 4D            [ 4]  744 	ld	c,l
   51D5 FD 21 00 00   [14]  745 	ld	iy,#0
   51D9 FD 39         [15]  746 	add	iy,sp
   51DB FD 7E 00      [19]  747 	ld	a,0 (iy)
   51DE 91            [ 4]  748 	sub	a, c
   51DF D2 61 52      [10]  749 	jp	NC,00120$
   51E2 FD 7E 00      [19]  750 	ld	a,0 (iy)
   51E5 D6 14         [ 7]  751 	sub	a, #0x14
   51E7 30 78         [12]  752 	jr	NC,00120$
                            753 ;src/utils/text.c:177: ftext[x].phase = 1;
   51E9 FD 6E 00      [19]  754 	ld	l,0 (iy)
   51EC 26 00         [ 7]  755 	ld	h,#0x00
   51EE 29            [11]  756 	add	hl, hl
   51EF 29            [11]  757 	add	hl, hl
   51F0 29            [11]  758 	add	hl, hl
   51F1 4D            [ 4]  759 	ld	c, l
   51F2 44            [ 4]  760 	ld	b, h
   51F3 DD 7E FE      [19]  761 	ld	a,-2 (ix)
   51F6 81            [ 4]  762 	add	a, c
   51F7 4F            [ 4]  763 	ld	c,a
   51F8 DD 7E FF      [19]  764 	ld	a,-1 (ix)
   51FB 88            [ 4]  765 	adc	a, b
   51FC 47            [ 4]  766 	ld	b,a
   51FD 3E 01         [ 7]  767 	ld	a,#0x01
   51FF 02            [ 7]  768 	ld	(bc),a
                            769 ;src/utils/text.c:178: ftext[x].xPos = xPos + (x * FONT_W);
   5200 59            [ 4]  770 	ld	e, c
   5201 50            [ 4]  771 	ld	d, b
   5202 13            [ 6]  772 	inc	de
   5203 DD 7E 06      [19]  773 	ld	a,6 (ix)
   5206 DD 86 FD      [19]  774 	add	a, -3 (ix)
   5209 12            [ 7]  775 	ld	(de),a
                            776 ;src/utils/text.c:179: ftext[x].yPos = yPos;
   520A 59            [ 4]  777 	ld	e, c
   520B 50            [ 4]  778 	ld	d, b
   520C 13            [ 6]  779 	inc	de
   520D 13            [ 6]  780 	inc	de
   520E DD 7E 07      [19]  781 	ld	a,7 (ix)
   5211 12            [ 7]  782 	ld	(de),a
                            783 ;src/utils/text.c:180: ftext[x].startyPos = yPos;
   5212 59            [ 4]  784 	ld	e, c
   5213 50            [ 4]  785 	ld	d, b
   5214 13            [ 6]  786 	inc	de
   5215 13            [ 6]  787 	inc	de
   5216 13            [ 6]  788 	inc	de
   5217 DD 7E 07      [19]  789 	ld	a,7 (ix)
   521A 12            [ 7]  790 	ld	(de),a
                            791 ;src/utils/text.c:181: ftext[x].endyPos = destinationyPos;
   521B 21 04 00      [10]  792 	ld	hl,#0x0004
   521E 09            [11]  793 	add	hl,bc
   521F DD 7E 08      [19]  794 	ld	a,8 (ix)
   5222 77            [ 7]  795 	ld	(hl),a
                            796 ;src/utils/text.c:182: ftext[x].destinationyPos = destinationyPos;
   5223 21 05 00      [10]  797 	ld	hl,#0x0005
   5226 09            [11]  798 	add	hl,bc
   5227 DD 7E 08      [19]  799 	ld	a,8 (ix)
   522A 77            [ 7]  800 	ld	(hl),a
                            801 ;src/utils/text.c:183: ftext[x].character[0] = text[x];
   522B 21 06 00      [10]  802 	ld	hl,#0x0006
   522E 09            [11]  803 	add	hl,bc
   522F DD 75 FB      [19]  804 	ld	-5 (ix),l
   5232 DD 74 FC      [19]  805 	ld	-4 (ix),h
   5235 DD 7E 04      [19]  806 	ld	a,4 (ix)
   5238 21 00 00      [10]  807 	ld	hl,#0
   523B 39            [11]  808 	add	hl,sp
   523C 86            [ 7]  809 	add	a, (hl)
   523D 5F            [ 4]  810 	ld	e,a
   523E DD 7E 05      [19]  811 	ld	a,5 (ix)
   5241 CE 00         [ 7]  812 	adc	a, #0x00
   5243 57            [ 4]  813 	ld	d,a
   5244 1A            [ 7]  814 	ld	a,(de)
   5245 DD 6E FB      [19]  815 	ld	l,-5 (ix)
   5248 DD 66 FC      [19]  816 	ld	h,-4 (ix)
   524B 77            [ 7]  817 	ld	(hl),a
                            818 ;src/utils/text.c:184: ftext[x].character[1] = '\0';
   524C 21 07 00      [10]  819 	ld	hl,#0x0007
   524F 09            [11]  820 	add	hl,bc
   5250 36 00         [10]  821 	ld	(hl),#0x00
                            822 ;src/utils/text.c:175: for (x = 0; x < strLength(text) && x < FALLING_TEXT_MAX_LENGHT; x++) {
   5252 DD 34 FD      [23]  823 	inc	-3 (ix)
   5255 DD 34 FD      [23]  824 	inc	-3 (ix)
   5258 DD 34 FD      [23]  825 	inc	-3 (ix)
   525B FD 34 00      [23]  826 	inc	0 (iy)
   525E C3 C9 51      [10]  827 	jp	00109$
                            828 ;src/utils/text.c:187: while (1) {
   5261                     829 00120$:
   5261 DD 7E FE      [19]  830 	ld	a,-2 (ix)
   5264 DD 77 FB      [19]  831 	ld	-5 (ix),a
   5267 DD 7E FF      [19]  832 	ld	a,-1 (ix)
   526A DD 77 FC      [19]  833 	ld	-4 (ix),a
   526D                     834 00105$:
                            835 ;src/utils/text.c:190: if (moveFallingText(ftext, strLength(text) <= FALLING_TEXT_MAX_LENGHT ? strLength(text) : FALLING_TEXT_MAX_LENGHT)) {
   526D DD 6E 04      [19]  836 	ld	l,4 (ix)
   5270 DD 66 05      [19]  837 	ld	h,5 (ix)
   5273 E5            [11]  838 	push	hl
   5274 CD DB 4D      [17]  839 	call	_strLength
   5277 F1            [10]  840 	pop	af
   5278 3E 14         [ 7]  841 	ld	a,#0x14
   527A 95            [ 4]  842 	sub	a, l
   527B 38 0E         [12]  843 	jr	C,00113$
   527D DD 6E 04      [19]  844 	ld	l,4 (ix)
   5280 DD 66 05      [19]  845 	ld	h,5 (ix)
   5283 E5            [11]  846 	push	hl
   5284 CD DB 4D      [17]  847 	call	_strLength
   5287 F1            [10]  848 	pop	af
   5288 45            [ 4]  849 	ld	b,l
   5289 18 02         [12]  850 	jr	00114$
   528B                     851 00113$:
   528B 06 14         [ 7]  852 	ld	b,#0x14
   528D                     853 00114$:
   528D DD 5E FB      [19]  854 	ld	e,-5 (ix)
   5290 DD 56 FC      [19]  855 	ld	d,-4 (ix)
   5293 C5            [11]  856 	push	bc
   5294 33            [ 6]  857 	inc	sp
   5295 D5            [11]  858 	push	de
   5296 CD 08 51      [17]  859 	call	_moveFallingText
   5299 F1            [10]  860 	pop	af
   529A 33            [ 6]  861 	inc	sp
   529B 7D            [ 4]  862 	ld	a,l
   529C B7            [ 4]  863 	or	a, a
                            864 ;src/utils/text.c:192: return;
   529D 20 05         [12]  865 	jr	NZ,00111$
                            866 ;src/utils/text.c:196: cpct_waitVSYNC();
   529F CD F1 55      [17]  867 	call	_cpct_waitVSYNC
   52A2 18 C9         [12]  868 	jr	00105$
   52A4                     869 00111$:
   52A4 DD F9         [10]  870 	ld	sp, ix
   52A6 DD E1         [14]  871 	pop	ix
   52A8 C9            [10]  872 	ret
                            873 	.area _CODE
                            874 	.area _INITIALIZER
                            875 	.area _CABS (ABS)
