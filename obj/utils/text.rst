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
   4E0B                      58 _strLength::
                             59 ;src/utils/text.c:27: while (str[result] != '\0') {
   4E0B 0E 00         [ 7]   60 	ld	c,#0x00
   4E0D                      61 00101$:
   4E0D 21 02 00      [10]   62 	ld	hl, #2
   4E10 39            [11]   63 	add	hl, sp
   4E11 7E            [ 7]   64 	ld	a, (hl)
   4E12 23            [ 6]   65 	inc	hl
   4E13 66            [ 7]   66 	ld	h, (hl)
   4E14 6F            [ 4]   67 	ld	l, a
   4E15 06 00         [ 7]   68 	ld	b,#0x00
   4E17 09            [11]   69 	add	hl, bc
   4E18 7E            [ 7]   70 	ld	a,(hl)
   4E19 B7            [ 4]   71 	or	a, a
   4E1A 28 03         [12]   72 	jr	Z,00103$
                             73 ;src/utils/text.c:28: result++;
   4E1C 0C            [ 4]   74 	inc	c
   4E1D 18 EE         [12]   75 	jr	00101$
   4E1F                      76 00103$:
                             77 ;src/utils/text.c:30: return result;
   4E1F 69            [ 4]   78 	ld	l,c
   4E20 C9            [10]   79 	ret
                             80 ;src/utils/text.c:36: void strCopy(i8* to, const i8* from) {
                             81 ;	---------------------------------
                             82 ; Function strCopy
                             83 ; ---------------------------------
   4E21                      84 _strCopy::
   4E21 DD E5         [15]   85 	push	ix
   4E23 DD 21 00 00   [14]   86 	ld	ix,#0
   4E27 DD 39         [15]   87 	add	ix,sp
   4E29 3B            [ 6]   88 	dec	sp
                             89 ;src/utils/text.c:39: while (i) {
   4E2A DD 4E 06      [19]   90 	ld	c,6 (ix)
   4E2D DD 46 07      [19]   91 	ld	b,7 (ix)
   4E30 DD 5E 04      [19]   92 	ld	e,4 (ix)
   4E33 DD 56 05      [19]   93 	ld	d,5 (ix)
   4E36 DD 36 FF 1E   [19]   94 	ld	-1 (ix),#0x1E
   4E3A                      95 00101$:
   4E3A DD 7E FF      [19]   96 	ld	a,-1 (ix)
   4E3D B7            [ 4]   97 	or	a, a
   4E3E 28 09         [12]   98 	jr	Z,00104$
                             99 ;src/utils/text.c:40: *to++ = *from++;
   4E40 0A            [ 7]  100 	ld	a,(bc)
   4E41 03            [ 6]  101 	inc	bc
   4E42 12            [ 7]  102 	ld	(de),a
   4E43 13            [ 6]  103 	inc	de
                            104 ;src/utils/text.c:41: i--;
   4E44 DD 35 FF      [23]  105 	dec	-1 (ix)
   4E47 18 F1         [12]  106 	jr	00101$
   4E49                     107 00104$:
   4E49 33            [ 6]  108 	inc	sp
   4E4A DD E1         [14]  109 	pop	ix
   4E4C C9            [10]  110 	ret
                            111 ;src/utils/text.c:45: void drawNumber(u16 aNumber, u8 length, u8 xPos, u8 yPos) {
                            112 ;	---------------------------------
                            113 ; Function drawNumber
                            114 ; ---------------------------------
   4E4D                     115 _drawNumber::
   4E4D DD E5         [15]  116 	push	ix
   4E4F DD 21 00 00   [14]  117 	ld	ix,#0
   4E53 DD 39         [15]  118 	add	ix,sp
   4E55 21 F8 FF      [10]  119 	ld	hl,#-8
   4E58 39            [11]  120 	add	hl,sp
                            121 ;src/utils/text.c:53: itoa(aNumber, str, 10);
   4E59 F9            [ 6]  122 	ld	sp, hl
   4E5A 23            [ 6]  123 	inc	hl
   4E5B 23            [ 6]  124 	inc	hl
   4E5C 4D            [ 4]  125 	ld	c,l
   4E5D 44            [ 4]  126 	ld	b,h
   4E5E 59            [ 4]  127 	ld	e, c
   4E5F 50            [ 4]  128 	ld	d, b
   4E60 C5            [11]  129 	push	bc
   4E61 21 0A 00      [10]  130 	ld	hl,#0x000A
   4E64 E5            [11]  131 	push	hl
   4E65 D5            [11]  132 	push	de
   4E66 DD 6E 04      [19]  133 	ld	l,4 (ix)
   4E69 DD 66 05      [19]  134 	ld	h,5 (ix)
   4E6C E5            [11]  135 	push	hl
   4E6D CD F7 4B      [17]  136 	call	_itoa
   4E70 21 06 00      [10]  137 	ld	hl,#6
   4E73 39            [11]  138 	add	hl,sp
   4E74 F9            [ 6]  139 	ld	sp,hl
   4E75 C1            [10]  140 	pop	bc
                            141 ;src/utils/text.c:55: zeros = length - strLength(str);
   4E76 59            [ 4]  142 	ld	e, c
   4E77 50            [ 4]  143 	ld	d, b
   4E78 C5            [11]  144 	push	bc
   4E79 D5            [11]  145 	push	de
   4E7A CD 0B 4E      [17]  146 	call	_strLength
   4E7D F1            [10]  147 	pop	af
   4E7E C1            [10]  148 	pop	bc
   4E7F DD 7E 06      [19]  149 	ld	a,6 (ix)
   4E82 95            [ 4]  150 	sub	a, l
   4E83 DD 77 F9      [19]  151 	ld	-7 (ix),a
                            152 ;src/utils/text.c:57: number = str[x];
   4E86 0A            [ 7]  153 	ld	a,(bc)
   4E87 5F            [ 4]  154 	ld	e,a
                            155 ;src/utils/text.c:59: while (number != '\0') {
   4E88 DD 36 F8 00   [19]  156 	ld	-8 (ix),#0x00
   4E8C                     157 00101$:
   4E8C 7B            [ 4]  158 	ld	a,e
   4E8D B7            [ 4]  159 	or	a, a
   4E8E 28 55         [12]  160 	jr	Z,00104$
                            161 ;src/utils/text.c:61: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, (zeros + x) * FONT_W + xPos, yPos);
   4E90 DD 7E F9      [19]  162 	ld	a,-7 (ix)
   4E93 DD 86 F8      [19]  163 	add	a, -8 (ix)
   4E96 6F            [ 4]  164 	ld	l,a
   4E97 D5            [11]  165 	push	de
   4E98 5D            [ 4]  166 	ld	e,l
   4E99 29            [11]  167 	add	hl, hl
   4E9A 19            [11]  168 	add	hl, de
   4E9B D1            [10]  169 	pop	de
   4E9C 7D            [ 4]  170 	ld	a,l
   4E9D DD 86 07      [19]  171 	add	a, 7 (ix)
   4EA0 57            [ 4]  172 	ld	d,a
   4EA1 C5            [11]  173 	push	bc
   4EA2 D5            [11]  174 	push	de
   4EA3 DD 7E 08      [19]  175 	ld	a,8 (ix)
   4EA6 F5            [11]  176 	push	af
   4EA7 33            [ 6]  177 	inc	sp
   4EA8 D5            [11]  178 	push	de
   4EA9 33            [ 6]  179 	inc	sp
   4EAA 21 00 C0      [10]  180 	ld	hl,#0xC000
   4EAD E5            [11]  181 	push	hl
   4EAE CD 6D 5F      [17]  182 	call	_cpct_getScreenPtr
   4EB1 D1            [10]  183 	pop	de
   4EB2 C1            [10]  184 	pop	bc
                            185 ;src/utils/text.c:62: cpct_drawSprite(G_numbers_big[number - 48], pvideo, FONT_W, FONT_H);
   4EB3 E5            [11]  186 	push	hl
   4EB4 FD E1         [14]  187 	pop	iy
   4EB6 16 00         [ 7]  188 	ld	d,#0x00
   4EB8 7B            [ 4]  189 	ld	a,e
   4EB9 C6 D0         [ 7]  190 	add	a,#0xD0
   4EBB 5F            [ 4]  191 	ld	e,a
   4EBC 7A            [ 4]  192 	ld	a,d
   4EBD CE FF         [ 7]  193 	adc	a,#0xFF
   4EBF 57            [ 4]  194 	ld	d,a
   4EC0 6B            [ 4]  195 	ld	l, e
   4EC1 62            [ 4]  196 	ld	h, d
   4EC2 29            [11]  197 	add	hl, hl
   4EC3 29            [11]  198 	add	hl, hl
   4EC4 29            [11]  199 	add	hl, hl
   4EC5 29            [11]  200 	add	hl, hl
   4EC6 29            [11]  201 	add	hl, hl
   4EC7 19            [11]  202 	add	hl, de
   4EC8 11 89 49      [10]  203 	ld	de,#_G_numbers_big
   4ECB 19            [11]  204 	add	hl,de
   4ECC EB            [ 4]  205 	ex	de,hl
   4ECD C5            [11]  206 	push	bc
   4ECE 21 03 0B      [10]  207 	ld	hl,#0x0B03
   4ED1 E5            [11]  208 	push	hl
   4ED2 FD E5         [15]  209 	push	iy
   4ED4 D5            [11]  210 	push	de
   4ED5 CD 38 54      [17]  211 	call	_cpct_drawSprite
   4ED8 C1            [10]  212 	pop	bc
                            213 ;src/utils/text.c:64: number = str[++x];
   4ED9 DD 34 F8      [23]  214 	inc	-8 (ix)
   4EDC DD 6E F8      [19]  215 	ld	l,-8 (ix)
   4EDF 26 00         [ 7]  216 	ld	h,#0x00
   4EE1 09            [11]  217 	add	hl,bc
   4EE2 5E            [ 7]  218 	ld	e,(hl)
   4EE3 18 A7         [12]  219 	jr	00101$
   4EE5                     220 00104$:
   4EE5 DD F9         [10]  221 	ld	sp, ix
   4EE7 DD E1         [14]  222 	pop	ix
   4EE9 C9            [10]  223 	ret
                            224 ;src/utils/text.c:70: void drawText(u8 text[], u8 xPos, u8 yPos, u8 centered) {
                            225 ;	---------------------------------
                            226 ; Function drawText
                            227 ; ---------------------------------
   4EEA                     228 _drawText::
   4EEA DD E5         [15]  229 	push	ix
   4EEC DD 21 00 00   [14]  230 	ld	ix,#0
   4EF0 DD 39         [15]  231 	add	ix,sp
   4EF2 F5            [11]  232 	push	af
   4EF3 F5            [11]  233 	push	af
   4EF4 3B            [ 6]  234 	dec	sp
                            235 ;src/utils/text.c:76: if (centered) {
   4EF5 DD 7E 08      [19]  236 	ld	a,8 (ix)
   4EF8 B7            [ 4]  237 	or	a, a
   4EF9 28 16         [12]  238 	jr	Z,00102$
                            239 ;src/utils/text.c:77: x = strLength(text);
   4EFB DD 6E 04      [19]  240 	ld	l,4 (ix)
   4EFE DD 66 05      [19]  241 	ld	h,5 (ix)
   4F01 E5            [11]  242 	push	hl
   4F02 CD 0B 4E      [17]  243 	call	_strLength
   4F05 F1            [10]  244 	pop	af
                            245 ;src/utils/text.c:78: xPos = 39 - (x / 2) * FONT_W;
   4F06 CB 3D         [ 8]  246 	srl	l
   4F08 4D            [ 4]  247 	ld	c,l
   4F09 29            [11]  248 	add	hl, hl
   4F0A 09            [11]  249 	add	hl, bc
   4F0B 3E 27         [ 7]  250 	ld	a,#0x27
   4F0D 95            [ 4]  251 	sub	a, l
   4F0E DD 77 06      [19]  252 	ld	6 (ix),a
   4F11                     253 00102$:
                            254 ;src/utils/text.c:82: character = text[x];
   4F11 DD 4E 04      [19]  255 	ld	c,4 (ix)
   4F14 DD 46 05      [19]  256 	ld	b,5 (ix)
   4F17 0A            [ 7]  257 	ld	a,(bc)
   4F18 DD 77 FB      [19]  258 	ld	-5 (ix),a
                            259 ;src/utils/text.c:84: while (character != '\0') {
   4F1B DD 36 FC 00   [19]  260 	ld	-4 (ix),#0x00
   4F1F DD 36 FF 00   [19]  261 	ld	-1 (ix),#0x00
   4F23                     262 00109$:
   4F23 DD 7E FB      [19]  263 	ld	a,-5 (ix)
   4F26 B7            [ 4]  264 	or	a, a
   4F27 CA C8 4F      [10]  265 	jp	Z,00112$
                            266 ;src/utils/text.c:86: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, (x * FONT_W) + xPos, yPos);
   4F2A DD 7E FF      [19]  267 	ld	a,-1 (ix)
   4F2D DD 86 06      [19]  268 	add	a, 6 (ix)
   4F30 57            [ 4]  269 	ld	d,a
   4F31 C5            [11]  270 	push	bc
   4F32 DD 7E 07      [19]  271 	ld	a,7 (ix)
   4F35 F5            [11]  272 	push	af
   4F36 33            [ 6]  273 	inc	sp
   4F37 D5            [11]  274 	push	de
   4F38 33            [ 6]  275 	inc	sp
   4F39 21 00 C0      [10]  276 	ld	hl,#0xC000
   4F3C E5            [11]  277 	push	hl
   4F3D CD 6D 5F      [17]  278 	call	_cpct_getScreenPtr
   4F40 C1            [10]  279 	pop	bc
                            280 ;src/utils/text.c:91: cpct_drawSprite(G_numbers_big[character - 48], pvideo, FONT_W, FONT_H);
   4F41 DD 75 FD      [19]  281 	ld	-3 (ix),l
   4F44 DD 74 FE      [19]  282 	ld	-2 (ix),h
   4F47 DD 5E FB      [19]  283 	ld	e,-5 (ix)
   4F4A 16 00         [ 7]  284 	ld	d,#0x00
                            285 ;src/utils/text.c:89: if (character >= 48 && character <= 57) {
   4F4C DD 7E FB      [19]  286 	ld	a,-5 (ix)
   4F4F D6 30         [ 7]  287 	sub	a, #0x30
   4F51 38 2F         [12]  288 	jr	C,00106$
   4F53 3E 39         [ 7]  289 	ld	a,#0x39
   4F55 DD 96 FB      [19]  290 	sub	a, -5 (ix)
   4F58 38 28         [12]  291 	jr	C,00106$
                            292 ;src/utils/text.c:91: cpct_drawSprite(G_numbers_big[character - 48], pvideo, FONT_W, FONT_H);
   4F5A 7B            [ 4]  293 	ld	a,e
   4F5B C6 D0         [ 7]  294 	add	a,#0xD0
   4F5D 5F            [ 4]  295 	ld	e,a
   4F5E 7A            [ 4]  296 	ld	a,d
   4F5F CE FF         [ 7]  297 	adc	a,#0xFF
   4F61 57            [ 4]  298 	ld	d,a
   4F62 6B            [ 4]  299 	ld	l, e
   4F63 62            [ 4]  300 	ld	h, d
   4F64 29            [11]  301 	add	hl, hl
   4F65 29            [11]  302 	add	hl, hl
   4F66 29            [11]  303 	add	hl, hl
   4F67 29            [11]  304 	add	hl, hl
   4F68 29            [11]  305 	add	hl, hl
   4F69 19            [11]  306 	add	hl, de
   4F6A 11 89 49      [10]  307 	ld	de,#_G_numbers_big
   4F6D 19            [11]  308 	add	hl,de
   4F6E EB            [ 4]  309 	ex	de,hl
   4F6F C5            [11]  310 	push	bc
   4F70 21 03 0B      [10]  311 	ld	hl,#0x0B03
   4F73 E5            [11]  312 	push	hl
   4F74 DD 6E FD      [19]  313 	ld	l,-3 (ix)
   4F77 DD 66 FE      [19]  314 	ld	h,-2 (ix)
   4F7A E5            [11]  315 	push	hl
   4F7B D5            [11]  316 	push	de
   4F7C CD 38 54      [17]  317 	call	_cpct_drawSprite
   4F7F C1            [10]  318 	pop	bc
   4F80 18 2D         [12]  319 	jr	00107$
   4F82                     320 00106$:
                            321 ;src/utils/text.c:94: else if (character != 32) { //32 = SPACE
   4F82 DD 7E FB      [19]  322 	ld	a,-5 (ix)
   4F85 D6 20         [ 7]  323 	sub	a, #0x20
   4F87 28 26         [12]  324 	jr	Z,00107$
                            325 ;src/utils/text.c:96: cpct_drawSprite(g_font_big[character - 64], pvideo, FONT_W, FONT_H);
   4F89 7B            [ 4]  326 	ld	a,e
   4F8A C6 C0         [ 7]  327 	add	a,#0xC0
   4F8C 5F            [ 4]  328 	ld	e,a
   4F8D 7A            [ 4]  329 	ld	a,d
   4F8E CE FF         [ 7]  330 	adc	a,#0xFF
   4F90 57            [ 4]  331 	ld	d,a
   4F91 6B            [ 4]  332 	ld	l, e
   4F92 62            [ 4]  333 	ld	h, d
   4F93 29            [11]  334 	add	hl, hl
   4F94 29            [11]  335 	add	hl, hl
   4F95 29            [11]  336 	add	hl, hl
   4F96 29            [11]  337 	add	hl, hl
   4F97 29            [11]  338 	add	hl, hl
   4F98 19            [11]  339 	add	hl, de
   4F99 11 82 44      [10]  340 	ld	de,#_g_font_big
   4F9C 19            [11]  341 	add	hl,de
   4F9D EB            [ 4]  342 	ex	de,hl
   4F9E C5            [11]  343 	push	bc
   4F9F 21 03 0B      [10]  344 	ld	hl,#0x0B03
   4FA2 E5            [11]  345 	push	hl
   4FA3 DD 6E FD      [19]  346 	ld	l,-3 (ix)
   4FA6 DD 66 FE      [19]  347 	ld	h,-2 (ix)
   4FA9 E5            [11]  348 	push	hl
   4FAA D5            [11]  349 	push	de
   4FAB CD 38 54      [17]  350 	call	_cpct_drawSprite
   4FAE C1            [10]  351 	pop	bc
   4FAF                     352 00107$:
                            353 ;src/utils/text.c:99: character = text[++x];
   4FAF DD 34 FF      [23]  354 	inc	-1 (ix)
   4FB2 DD 34 FF      [23]  355 	inc	-1 (ix)
   4FB5 DD 34 FF      [23]  356 	inc	-1 (ix)
   4FB8 DD 34 FC      [23]  357 	inc	-4 (ix)
   4FBB DD 6E FC      [19]  358 	ld	l,-4 (ix)
   4FBE 26 00         [ 7]  359 	ld	h,#0x00
   4FC0 09            [11]  360 	add	hl,bc
   4FC1 7E            [ 7]  361 	ld	a,(hl)
   4FC2 DD 77 FB      [19]  362 	ld	-5 (ix),a
   4FC5 C3 23 4F      [10]  363 	jp	00109$
   4FC8                     364 00112$:
   4FC8 DD F9         [10]  365 	ld	sp, ix
   4FCA DD E1         [14]  366 	pop	ix
   4FCC C9            [10]  367 	ret
                            368 ;src/utils/text.c:103: void moveCharacter(FChar *character) {
                            369 ;	---------------------------------
                            370 ; Function moveCharacter
                            371 ; ---------------------------------
   4FCD                     372 _moveCharacter::
   4FCD DD E5         [15]  373 	push	ix
   4FCF DD 21 00 00   [14]  374 	ld	ix,#0
   4FD3 DD 39         [15]  375 	add	ix,sp
   4FD5 21 F3 FF      [10]  376 	ld	hl,#-13
   4FD8 39            [11]  377 	add	hl,sp
   4FD9 F9            [ 6]  378 	ld	sp,hl
                            379 ;src/utils/text.c:105: if (character->phase != FALLING_TEXT_MAX_BOUNCES) {
   4FDA DD 4E 04      [19]  380 	ld	c,4 (ix)
   4FDD DD 46 05      [19]  381 	ld	b,5 (ix)
   4FE0 0A            [ 7]  382 	ld	a,(bc)
   4FE1 57            [ 4]  383 	ld	d,a
                            384 ;src/utils/text.c:110: if (character->yPos != character->startyPos) {
   4FE2 21 02 00      [10]  385 	ld	hl,#0x0002
   4FE5 09            [11]  386 	add	hl,bc
   4FE6 DD 75 FE      [19]  387 	ld	-2 (ix),l
   4FE9 DD 74 FF      [19]  388 	ld	-1 (ix),h
   4FEC DD 6E FE      [19]  389 	ld	l,-2 (ix)
   4FEF DD 66 FF      [19]  390 	ld	h,-1 (ix)
   4FF2 5E            [ 7]  391 	ld	e,(hl)
                            392 ;src/utils/text.c:112: clearWindow(character->xPos, character->yPos + (character->phase % 2 != 0 ? - FALLING_TEXT_SPEED : FALLING_TEXT_SPEED), FONT_W, FONT_H);
   4FF3 21 01 00      [10]  393 	ld	hl,#0x0001
   4FF6 09            [11]  394 	add	hl,bc
   4FF7 DD 75 FC      [19]  395 	ld	-4 (ix),l
   4FFA DD 74 FD      [19]  396 	ld	-3 (ix),h
                            397 ;src/utils/text.c:144: drawText(character->character, character->xPos, character->yPos, 0);
   4FFD 21 06 00      [10]  398 	ld	hl,#0x0006
   5000 09            [11]  399 	add	hl,bc
   5001 DD 75 FA      [19]  400 	ld	-6 (ix),l
   5004 DD 74 FB      [19]  401 	ld	-5 (ix),h
                            402 ;src/utils/text.c:105: if (character->phase != FALLING_TEXT_MAX_BOUNCES) {
   5007 7A            [ 4]  403 	ld	a,d
   5008 D6 06         [ 7]  404 	sub	a, #0x06
   500A CA F9 50      [10]  405 	jp	Z,00111$
                            406 ;src/utils/text.c:110: if (character->yPos != character->startyPos) {
   500D 21 03 00      [10]  407 	ld	hl,#0x0003
   5010 09            [11]  408 	add	hl,bc
   5011 DD 75 F8      [19]  409 	ld	-8 (ix),l
   5014 DD 74 F9      [19]  410 	ld	-7 (ix),h
   5017 DD 6E F8      [19]  411 	ld	l,-8 (ix)
   501A DD 66 F9      [19]  412 	ld	h,-7 (ix)
   501D 7E            [ 7]  413 	ld	a,(hl)
   501E DD 77 F7      [19]  414 	ld	-9 (ix),a
   5021 7B            [ 4]  415 	ld	a,e
   5022 DD 96 F7      [19]  416 	sub	a, -9 (ix)
   5025 28 24         [12]  417 	jr	Z,00102$
                            418 ;src/utils/text.c:112: clearWindow(character->xPos, character->yPos + (character->phase % 2 != 0 ? - FALLING_TEXT_SPEED : FALLING_TEXT_SPEED), FONT_W, FONT_H);
   5027 CB 42         [ 8]  419 	bit	0, d
   5029 28 04         [12]  420 	jr	Z,00115$
   502B 2E FD         [ 7]  421 	ld	l,#0xFD
   502D 18 02         [12]  422 	jr	00116$
   502F                     423 00115$:
   502F 2E 03         [ 7]  424 	ld	l,#0x03
   5031                     425 00116$:
   5031 7B            [ 4]  426 	ld	a,e
   5032 85            [ 4]  427 	add	a, l
   5033 5F            [ 4]  428 	ld	e,a
   5034 DD 6E FC      [19]  429 	ld	l,-4 (ix)
   5037 DD 66 FD      [19]  430 	ld	h,-3 (ix)
   503A 56            [ 7]  431 	ld	d,(hl)
   503B C5            [11]  432 	push	bc
   503C 21 03 0B      [10]  433 	ld	hl,#0x0B03
   503F E5            [11]  434 	push	hl
   5040 7B            [ 4]  435 	ld	a,e
   5041 F5            [11]  436 	push	af
   5042 33            [ 6]  437 	inc	sp
   5043 D5            [11]  438 	push	de
   5044 33            [ 6]  439 	inc	sp
   5045 CD 2D 53      [17]  440 	call	_clearWindow
   5048 F1            [10]  441 	pop	af
   5049 F1            [10]  442 	pop	af
   504A C1            [10]  443 	pop	bc
   504B                     444 00102$:
                            445 ;src/utils/text.c:117: if (character->phase % 2 != 0) {
   504B 0A            [ 7]  446 	ld	a,(bc)
   504C E6 01         [ 7]  447 	and	a, #0x01
   504E DD 77 F7      [19]  448 	ld	-9 (ix),a
                            449 ;src/utils/text.c:110: if (character->yPos != character->startyPos) {
   5051 DD 6E FE      [19]  450 	ld	l,-2 (ix)
   5054 DD 66 FF      [19]  451 	ld	h,-1 (ix)
   5057 5E            [ 7]  452 	ld	e,(hl)
                            453 ;src/utils/text.c:121: if (character->yPos >= character->destinationyPos) {
   5058 21 05 00      [10]  454 	ld	hl,#0x0005
   505B 09            [11]  455 	add	hl,bc
   505C DD 75 F5      [19]  456 	ld	-11 (ix),l
   505F DD 74 F6      [19]  457 	ld	-10 (ix),h
                            458 ;src/utils/text.c:125: character->destinationyPos = character->endyPos - ((character->endyPos - character->startyPos) / character->phase);
   5062 21 04 00      [10]  459 	ld	hl,#0x0004
   5065 09            [11]  460 	add	hl,bc
   5066 E3            [19]  461 	ex	(sp), hl
                            462 ;src/utils/text.c:117: if (character->phase % 2 != 0) {
   5067 DD 7E F7      [19]  463 	ld	a,-9 (ix)
   506A B7            [ 4]  464 	or	a, a
   506B 28 48         [12]  465 	jr	Z,00108$
                            466 ;src/utils/text.c:119: character->yPos += FALLING_TEXT_SPEED;
   506D 1C            [ 4]  467 	inc	e
   506E 1C            [ 4]  468 	inc	e
   506F 1C            [ 4]  469 	inc	e
   5070 DD 6E FE      [19]  470 	ld	l,-2 (ix)
   5073 DD 66 FF      [19]  471 	ld	h,-1 (ix)
   5076 73            [ 7]  472 	ld	(hl),e
                            473 ;src/utils/text.c:121: if (character->yPos >= character->destinationyPos) {
   5077 DD 6E F5      [19]  474 	ld	l,-11 (ix)
   507A DD 66 F6      [19]  475 	ld	h,-10 (ix)
   507D 56            [ 7]  476 	ld	d,(hl)
   507E 7B            [ 4]  477 	ld	a,e
   507F 92            [ 4]  478 	sub	a, d
   5080 38 55         [12]  479 	jr	C,00109$
                            480 ;src/utils/text.c:123: character->phase++;
   5082 0A            [ 7]  481 	ld	a,(bc)
   5083 5F            [ 4]  482 	ld	e,a
   5084 1C            [ 4]  483 	inc	e
   5085 7B            [ 4]  484 	ld	a,e
   5086 02            [ 7]  485 	ld	(bc),a
                            486 ;src/utils/text.c:125: character->destinationyPos = character->endyPos - ((character->endyPos - character->startyPos) / character->phase);
   5087 E1            [10]  487 	pop	hl
   5088 E5            [11]  488 	push	hl
   5089 7E            [ 7]  489 	ld	a,(hl)
   508A DD 77 F7      [19]  490 	ld	-9 (ix), a
   508D 4F            [ 4]  491 	ld	c, a
   508E 06 00         [ 7]  492 	ld	b,#0x00
   5090 DD 6E F8      [19]  493 	ld	l,-8 (ix)
   5093 DD 66 F9      [19]  494 	ld	h,-7 (ix)
   5096 6E            [ 7]  495 	ld	l,(hl)
   5097 16 00         [ 7]  496 	ld	d,#0x00
   5099 79            [ 4]  497 	ld	a,c
   509A 95            [ 4]  498 	sub	a, l
   509B 4F            [ 4]  499 	ld	c,a
   509C 78            [ 4]  500 	ld	a,b
   509D 9A            [ 4]  501 	sbc	a, d
   509E 47            [ 4]  502 	ld	b,a
   509F 16 00         [ 7]  503 	ld	d,#0x00
   50A1 D5            [11]  504 	push	de
   50A2 C5            [11]  505 	push	bc
   50A3 CD C8 5F      [17]  506 	call	__divsint
   50A6 F1            [10]  507 	pop	af
   50A7 F1            [10]  508 	pop	af
   50A8 DD 7E F7      [19]  509 	ld	a, -9 (ix)
   50AB 95            [ 4]  510 	sub	a, l
   50AC DD 6E F5      [19]  511 	ld	l,-11 (ix)
   50AF DD 66 F6      [19]  512 	ld	h,-10 (ix)
   50B2 77            [ 7]  513 	ld	(hl),a
   50B3 18 22         [12]  514 	jr	00109$
   50B5                     515 00108$:
                            516 ;src/utils/text.c:132: character->yPos -= FALLING_TEXT_SPEED;
   50B5 7B            [ 4]  517 	ld	a,e
   50B6 C6 FD         [ 7]  518 	add	a,#0xFD
   50B8 5F            [ 4]  519 	ld	e,a
   50B9 DD 6E FE      [19]  520 	ld	l,-2 (ix)
   50BC DD 66 FF      [19]  521 	ld	h,-1 (ix)
   50BF 73            [ 7]  522 	ld	(hl),e
                            523 ;src/utils/text.c:134: if (character->yPos <= character->destinationyPos) {
   50C0 DD 6E F5      [19]  524 	ld	l,-11 (ix)
   50C3 DD 66 F6      [19]  525 	ld	h,-10 (ix)
   50C6 7E            [ 7]  526 	ld	a, (hl)
   50C7 93            [ 4]  527 	sub	a, e
   50C8 38 0D         [12]  528 	jr	C,00109$
                            529 ;src/utils/text.c:136: character->phase++;
   50CA 0A            [ 7]  530 	ld	a,(bc)
   50CB 3C            [ 4]  531 	inc	a
   50CC 02            [ 7]  532 	ld	(bc),a
                            533 ;src/utils/text.c:138: character->destinationyPos = character->endyPos;
   50CD E1            [10]  534 	pop	hl
   50CE E5            [11]  535 	push	hl
   50CF 4E            [ 7]  536 	ld	c,(hl)
   50D0 DD 6E F5      [19]  537 	ld	l,-11 (ix)
   50D3 DD 66 F6      [19]  538 	ld	h,-10 (ix)
   50D6 71            [ 7]  539 	ld	(hl),c
   50D7                     540 00109$:
                            541 ;src/utils/text.c:144: drawText(character->character, character->xPos, character->yPos, 0);
   50D7 DD 6E FE      [19]  542 	ld	l,-2 (ix)
   50DA DD 66 FF      [19]  543 	ld	h,-1 (ix)
   50DD 46            [ 7]  544 	ld	b,(hl)
   50DE DD 6E FC      [19]  545 	ld	l,-4 (ix)
   50E1 DD 66 FD      [19]  546 	ld	h,-3 (ix)
   50E4 56            [ 7]  547 	ld	d,(hl)
   50E5 AF            [ 4]  548 	xor	a, a
   50E6 F5            [11]  549 	push	af
   50E7 33            [ 6]  550 	inc	sp
   50E8 4A            [ 4]  551 	ld	c, d
   50E9 C5            [11]  552 	push	bc
   50EA DD 6E FA      [19]  553 	ld	l,-6 (ix)
   50ED DD 66 FB      [19]  554 	ld	h,-5 (ix)
   50F0 E5            [11]  555 	push	hl
   50F1 CD EA 4E      [17]  556 	call	_drawText
   50F4 F1            [10]  557 	pop	af
   50F5 F1            [10]  558 	pop	af
   50F6 33            [ 6]  559 	inc	sp
   50F7 18 3A         [12]  560 	jr	00113$
   50F9                     561 00111$:
                            562 ;src/utils/text.c:148: clearWindow(character->xPos, character->yPos - FALLING_TEXT_SPEED, FONT_W, FONT_H);
   50F9 7B            [ 4]  563 	ld	a,e
   50FA C6 FD         [ 7]  564 	add	a,#0xFD
   50FC 57            [ 4]  565 	ld	d,a
   50FD DD 6E FC      [19]  566 	ld	l,-4 (ix)
   5100 DD 66 FD      [19]  567 	ld	h,-3 (ix)
   5103 46            [ 7]  568 	ld	b,(hl)
   5104 21 03 0B      [10]  569 	ld	hl,#0x0B03
   5107 E5            [11]  570 	push	hl
   5108 D5            [11]  571 	push	de
   5109 33            [ 6]  572 	inc	sp
   510A C5            [11]  573 	push	bc
   510B 33            [ 6]  574 	inc	sp
   510C CD 2D 53      [17]  575 	call	_clearWindow
   510F F1            [10]  576 	pop	af
   5110 F1            [10]  577 	pop	af
                            578 ;src/utils/text.c:149: drawText(character->character, character->xPos, character->yPos, 0);
   5111 DD 6E FE      [19]  579 	ld	l,-2 (ix)
   5114 DD 66 FF      [19]  580 	ld	h,-1 (ix)
   5117 56            [ 7]  581 	ld	d,(hl)
   5118 DD 6E FC      [19]  582 	ld	l,-4 (ix)
   511B DD 66 FD      [19]  583 	ld	h,-3 (ix)
   511E 46            [ 7]  584 	ld	b,(hl)
   511F AF            [ 4]  585 	xor	a, a
   5120 F5            [11]  586 	push	af
   5121 33            [ 6]  587 	inc	sp
   5122 D5            [11]  588 	push	de
   5123 33            [ 6]  589 	inc	sp
   5124 C5            [11]  590 	push	bc
   5125 33            [ 6]  591 	inc	sp
   5126 DD 6E FA      [19]  592 	ld	l,-6 (ix)
   5129 DD 66 FB      [19]  593 	ld	h,-5 (ix)
   512C E5            [11]  594 	push	hl
   512D CD EA 4E      [17]  595 	call	_drawText
   5130 F1            [10]  596 	pop	af
   5131 F1            [10]  597 	pop	af
   5132 33            [ 6]  598 	inc	sp
   5133                     599 00113$:
   5133 DD F9         [10]  600 	ld	sp, ix
   5135 DD E1         [14]  601 	pop	ix
   5137 C9            [10]  602 	ret
                            603 ;src/utils/text.c:154: u8 moveFallingText(FChar *text, u8 lenght) {
                            604 ;	---------------------------------
                            605 ; Function moveFallingText
                            606 ; ---------------------------------
   5138                     607 _moveFallingText::
   5138 DD E5         [15]  608 	push	ix
   513A DD 21 00 00   [14]  609 	ld	ix,#0
   513E DD 39         [15]  610 	add	ix,sp
   5140 F5            [11]  611 	push	af
                            612 ;src/utils/text.c:158: for (x = 0; x < lenght; x++) {
   5141 0E 00         [ 7]  613 	ld	c,#0x00
   5143                     614 00109$:
   5143 79            [ 4]  615 	ld	a,c
   5144 DD 96 06      [19]  616 	sub	a, 6 (ix)
   5147 30 69         [12]  617 	jr	NC,00107$
                            618 ;src/utils/text.c:160: if (x == 0 || (x > 0 && text[x - 1].phase == 1 && text[x - 1].yPos >= text[x].yPos + 15) || text[x - 1].phase > 1) moveCharacter(&text[x]);
   5149 69            [ 4]  619 	ld	l,c
   514A 26 00         [ 7]  620 	ld	h,#0x00
   514C 5D            [ 4]  621 	ld	e, l
   514D 54            [ 4]  622 	ld	d, h
   514E CB 23         [ 8]  623 	sla	e
   5150 CB 12         [ 8]  624 	rl	d
   5152 CB 23         [ 8]  625 	sla	e
   5154 CB 12         [ 8]  626 	rl	d
   5156 CB 23         [ 8]  627 	sla	e
   5158 CB 12         [ 8]  628 	rl	d
   515A DD 7E 04      [19]  629 	ld	a,4 (ix)
   515D 83            [ 4]  630 	add	a, e
   515E DD 77 FE      [19]  631 	ld	-2 (ix),a
   5161 DD 7E 05      [19]  632 	ld	a,5 (ix)
   5164 8A            [ 4]  633 	adc	a, d
   5165 DD 77 FF      [19]  634 	ld	-1 (ix),a
   5168 79            [ 4]  635 	ld	a,c
   5169 B7            [ 4]  636 	or	a, a
   516A 28 38         [12]  637 	jr	Z,00101$
   516C 2B            [ 6]  638 	dec	hl
   516D 29            [11]  639 	add	hl, hl
   516E 29            [11]  640 	add	hl, hl
   516F 29            [11]  641 	add	hl, hl
   5170 EB            [ 4]  642 	ex	de,hl
   5171 DD 6E 04      [19]  643 	ld	l,4 (ix)
   5174 DD 66 05      [19]  644 	ld	h,5 (ix)
   5177 19            [11]  645 	add	hl,de
   5178 46            [ 7]  646 	ld	b,(hl)
   5179 79            [ 4]  647 	ld	a,c
   517A B7            [ 4]  648 	or	a, a
   517B 28 22         [12]  649 	jr	Z,00106$
   517D 78            [ 4]  650 	ld	a,b
   517E 3D            [ 4]  651 	dec	a
   517F 20 1E         [12]  652 	jr	NZ,00106$
   5181 23            [ 6]  653 	inc	hl
   5182 23            [ 6]  654 	inc	hl
   5183 5E            [ 7]  655 	ld	e,(hl)
   5184 E1            [10]  656 	pop	hl
   5185 E5            [11]  657 	push	hl
   5186 23            [ 6]  658 	inc	hl
   5187 23            [ 6]  659 	inc	hl
   5188 6E            [ 7]  660 	ld	l,(hl)
   5189 26 00         [ 7]  661 	ld	h,#0x00
   518B D5            [11]  662 	push	de
   518C 11 0F 00      [10]  663 	ld	de,#0x000F
   518F 19            [11]  664 	add	hl, de
   5190 D1            [10]  665 	pop	de
   5191 16 00         [ 7]  666 	ld	d,#0x00
   5193 7B            [ 4]  667 	ld	a,e
   5194 95            [ 4]  668 	sub	a, l
   5195 7A            [ 4]  669 	ld	a,d
   5196 9C            [ 4]  670 	sbc	a, h
   5197 E2 9C 51      [10]  671 	jp	PO, 00138$
   519A EE 80         [ 7]  672 	xor	a, #0x80
   519C                     673 00138$:
   519C F2 A4 51      [10]  674 	jp	P,00101$
   519F                     675 00106$:
   519F 3E 01         [ 7]  676 	ld	a,#0x01
   51A1 90            [ 4]  677 	sub	a, b
   51A2 30 0B         [12]  678 	jr	NC,00110$
   51A4                     679 00101$:
   51A4 C5            [11]  680 	push	bc
   51A5 D1            [10]  681 	pop	de
   51A6 E1            [10]  682 	pop	hl
   51A7 E5            [11]  683 	push	hl
   51A8 D5            [11]  684 	push	de
   51A9 E5            [11]  685 	push	hl
   51AA CD CD 4F      [17]  686 	call	_moveCharacter
   51AD F1            [10]  687 	pop	af
   51AE C1            [10]  688 	pop	bc
   51AF                     689 00110$:
                            690 ;src/utils/text.c:158: for (x = 0; x < lenght; x++) {
   51AF 0C            [ 4]  691 	inc	c
   51B0 18 91         [12]  692 	jr	00109$
   51B2                     693 00107$:
                            694 ;src/utils/text.c:163: return text[lenght - 1].phase == FALLING_TEXT_MAX_BOUNCES;
   51B2 DD 6E 06      [19]  695 	ld	l,6 (ix)
   51B5 26 00         [ 7]  696 	ld	h,#0x00
   51B7 2B            [ 6]  697 	dec	hl
   51B8 29            [11]  698 	add	hl, hl
   51B9 29            [11]  699 	add	hl, hl
   51BA 29            [11]  700 	add	hl, hl
   51BB 4D            [ 4]  701 	ld	c, l
   51BC 44            [ 4]  702 	ld	b, h
   51BD DD 6E 04      [19]  703 	ld	l,4 (ix)
   51C0 DD 66 05      [19]  704 	ld	h,5 (ix)
   51C3 09            [11]  705 	add	hl,bc
   51C4 7E            [ 7]  706 	ld	a,(hl)
   51C5 D6 06         [ 7]  707 	sub	a, #0x06
   51C7 20 04         [12]  708 	jr	NZ,00139$
   51C9 3E 01         [ 7]  709 	ld	a,#0x01
   51CB 18 01         [12]  710 	jr	00140$
   51CD                     711 00139$:
   51CD AF            [ 4]  712 	xor	a,a
   51CE                     713 00140$:
   51CE 6F            [ 4]  714 	ld	l,a
   51CF DD F9         [10]  715 	ld	sp, ix
   51D1 DD E1         [14]  716 	pop	ix
   51D3 C9            [10]  717 	ret
                            718 ;src/utils/text.c:169: void drawFallingText(u8 text[], u8 xPos, u8 yPos, u8 destinationyPos) {
                            719 ;	---------------------------------
                            720 ; Function drawFallingText
                            721 ; ---------------------------------
   51D4                     722 _drawFallingText::
   51D4 DD E5         [15]  723 	push	ix
   51D6 DD 21 00 00   [14]  724 	ld	ix,#0
   51DA DD 39         [15]  725 	add	ix,sp
   51DC 21 5A FF      [10]  726 	ld	hl,#-166
   51DF 39            [11]  727 	add	hl,sp
   51E0 F9            [ 6]  728 	ld	sp,hl
                            729 ;src/utils/text.c:175: for (x = 0; x < strLength(text) && x < FALLING_TEXT_MAX_LENGHT; x++) {
   51E1 21 01 00      [10]  730 	ld	hl,#0x0001
   51E4 39            [11]  731 	add	hl,sp
   51E5 DD 75 FE      [19]  732 	ld	-2 (ix),l
   51E8 DD 74 FF      [19]  733 	ld	-1 (ix),h
   51EB FD 21 00 00   [14]  734 	ld	iy,#0
   51EF FD 39         [15]  735 	add	iy,sp
   51F1 FD 36 00 00   [19]  736 	ld	0 (iy),#0x00
   51F5 DD 36 FD 00   [19]  737 	ld	-3 (ix),#0x00
   51F9                     738 00109$:
   51F9 DD 6E 04      [19]  739 	ld	l,4 (ix)
   51FC DD 66 05      [19]  740 	ld	h,5 (ix)
   51FF E5            [11]  741 	push	hl
   5200 CD 0B 4E      [17]  742 	call	_strLength
   5203 F1            [10]  743 	pop	af
   5204 4D            [ 4]  744 	ld	c,l
   5205 FD 21 00 00   [14]  745 	ld	iy,#0
   5209 FD 39         [15]  746 	add	iy,sp
   520B FD 7E 00      [19]  747 	ld	a,0 (iy)
   520E 91            [ 4]  748 	sub	a, c
   520F D2 91 52      [10]  749 	jp	NC,00120$
   5212 FD 7E 00      [19]  750 	ld	a,0 (iy)
   5215 D6 14         [ 7]  751 	sub	a, #0x14
   5217 30 78         [12]  752 	jr	NC,00120$
                            753 ;src/utils/text.c:177: ftext[x].phase = 1;
   5219 FD 6E 00      [19]  754 	ld	l,0 (iy)
   521C 26 00         [ 7]  755 	ld	h,#0x00
   521E 29            [11]  756 	add	hl, hl
   521F 29            [11]  757 	add	hl, hl
   5220 29            [11]  758 	add	hl, hl
   5221 4D            [ 4]  759 	ld	c, l
   5222 44            [ 4]  760 	ld	b, h
   5223 DD 7E FE      [19]  761 	ld	a,-2 (ix)
   5226 81            [ 4]  762 	add	a, c
   5227 4F            [ 4]  763 	ld	c,a
   5228 DD 7E FF      [19]  764 	ld	a,-1 (ix)
   522B 88            [ 4]  765 	adc	a, b
   522C 47            [ 4]  766 	ld	b,a
   522D 3E 01         [ 7]  767 	ld	a,#0x01
   522F 02            [ 7]  768 	ld	(bc),a
                            769 ;src/utils/text.c:178: ftext[x].xPos = xPos + (x * FONT_W);
   5230 59            [ 4]  770 	ld	e, c
   5231 50            [ 4]  771 	ld	d, b
   5232 13            [ 6]  772 	inc	de
   5233 DD 7E 06      [19]  773 	ld	a,6 (ix)
   5236 DD 86 FD      [19]  774 	add	a, -3 (ix)
   5239 12            [ 7]  775 	ld	(de),a
                            776 ;src/utils/text.c:179: ftext[x].yPos = yPos;
   523A 59            [ 4]  777 	ld	e, c
   523B 50            [ 4]  778 	ld	d, b
   523C 13            [ 6]  779 	inc	de
   523D 13            [ 6]  780 	inc	de
   523E DD 7E 07      [19]  781 	ld	a,7 (ix)
   5241 12            [ 7]  782 	ld	(de),a
                            783 ;src/utils/text.c:180: ftext[x].startyPos = yPos;
   5242 59            [ 4]  784 	ld	e, c
   5243 50            [ 4]  785 	ld	d, b
   5244 13            [ 6]  786 	inc	de
   5245 13            [ 6]  787 	inc	de
   5246 13            [ 6]  788 	inc	de
   5247 DD 7E 07      [19]  789 	ld	a,7 (ix)
   524A 12            [ 7]  790 	ld	(de),a
                            791 ;src/utils/text.c:181: ftext[x].endyPos = destinationyPos;
   524B 21 04 00      [10]  792 	ld	hl,#0x0004
   524E 09            [11]  793 	add	hl,bc
   524F DD 7E 08      [19]  794 	ld	a,8 (ix)
   5252 77            [ 7]  795 	ld	(hl),a
                            796 ;src/utils/text.c:182: ftext[x].destinationyPos = destinationyPos;
   5253 21 05 00      [10]  797 	ld	hl,#0x0005
   5256 09            [11]  798 	add	hl,bc
   5257 DD 7E 08      [19]  799 	ld	a,8 (ix)
   525A 77            [ 7]  800 	ld	(hl),a
                            801 ;src/utils/text.c:183: ftext[x].character[0] = text[x];
   525B 21 06 00      [10]  802 	ld	hl,#0x0006
   525E 09            [11]  803 	add	hl,bc
   525F DD 75 FB      [19]  804 	ld	-5 (ix),l
   5262 DD 74 FC      [19]  805 	ld	-4 (ix),h
   5265 DD 7E 04      [19]  806 	ld	a,4 (ix)
   5268 21 00 00      [10]  807 	ld	hl,#0
   526B 39            [11]  808 	add	hl,sp
   526C 86            [ 7]  809 	add	a, (hl)
   526D 5F            [ 4]  810 	ld	e,a
   526E DD 7E 05      [19]  811 	ld	a,5 (ix)
   5271 CE 00         [ 7]  812 	adc	a, #0x00
   5273 57            [ 4]  813 	ld	d,a
   5274 1A            [ 7]  814 	ld	a,(de)
   5275 DD 6E FB      [19]  815 	ld	l,-5 (ix)
   5278 DD 66 FC      [19]  816 	ld	h,-4 (ix)
   527B 77            [ 7]  817 	ld	(hl),a
                            818 ;src/utils/text.c:184: ftext[x].character[1] = '\0';
   527C 21 07 00      [10]  819 	ld	hl,#0x0007
   527F 09            [11]  820 	add	hl,bc
   5280 36 00         [10]  821 	ld	(hl),#0x00
                            822 ;src/utils/text.c:175: for (x = 0; x < strLength(text) && x < FALLING_TEXT_MAX_LENGHT; x++) {
   5282 DD 34 FD      [23]  823 	inc	-3 (ix)
   5285 DD 34 FD      [23]  824 	inc	-3 (ix)
   5288 DD 34 FD      [23]  825 	inc	-3 (ix)
   528B FD 34 00      [23]  826 	inc	0 (iy)
   528E C3 F9 51      [10]  827 	jp	00109$
                            828 ;src/utils/text.c:187: while (1) {
   5291                     829 00120$:
   5291 DD 7E FE      [19]  830 	ld	a,-2 (ix)
   5294 DD 77 FB      [19]  831 	ld	-5 (ix),a
   5297 DD 7E FF      [19]  832 	ld	a,-1 (ix)
   529A DD 77 FC      [19]  833 	ld	-4 (ix),a
   529D                     834 00105$:
                            835 ;src/utils/text.c:190: if (moveFallingText(ftext, strLength(text) <= FALLING_TEXT_MAX_LENGHT ? strLength(text) : FALLING_TEXT_MAX_LENGHT)) {
   529D DD 6E 04      [19]  836 	ld	l,4 (ix)
   52A0 DD 66 05      [19]  837 	ld	h,5 (ix)
   52A3 E5            [11]  838 	push	hl
   52A4 CD 0B 4E      [17]  839 	call	_strLength
   52A7 F1            [10]  840 	pop	af
   52A8 3E 14         [ 7]  841 	ld	a,#0x14
   52AA 95            [ 4]  842 	sub	a, l
   52AB 38 0E         [12]  843 	jr	C,00113$
   52AD DD 6E 04      [19]  844 	ld	l,4 (ix)
   52B0 DD 66 05      [19]  845 	ld	h,5 (ix)
   52B3 E5            [11]  846 	push	hl
   52B4 CD 0B 4E      [17]  847 	call	_strLength
   52B7 F1            [10]  848 	pop	af
   52B8 45            [ 4]  849 	ld	b,l
   52B9 18 02         [12]  850 	jr	00114$
   52BB                     851 00113$:
   52BB 06 14         [ 7]  852 	ld	b,#0x14
   52BD                     853 00114$:
   52BD DD 5E FB      [19]  854 	ld	e,-5 (ix)
   52C0 DD 56 FC      [19]  855 	ld	d,-4 (ix)
   52C3 C5            [11]  856 	push	bc
   52C4 33            [ 6]  857 	inc	sp
   52C5 D5            [11]  858 	push	de
   52C6 CD 38 51      [17]  859 	call	_moveFallingText
   52C9 F1            [10]  860 	pop	af
   52CA 33            [ 6]  861 	inc	sp
   52CB 7D            [ 4]  862 	ld	a,l
   52CC B7            [ 4]  863 	or	a, a
                            864 ;src/utils/text.c:192: return;
   52CD 20 05         [12]  865 	jr	NZ,00111$
                            866 ;src/utils/text.c:196: cpct_waitVSYNC();
   52CF CD E0 55      [17]  867 	call	_cpct_waitVSYNC
   52D2 18 C9         [12]  868 	jr	00105$
   52D4                     869 00111$:
   52D4 DD F9         [10]  870 	ld	sp, ix
   52D6 DD E1         [14]  871 	pop	ix
   52D8 C9            [10]  872 	ret
                            873 	.area _CODE
                            874 	.area _INITIALIZER
                            875 	.area _CABS (ABS)
