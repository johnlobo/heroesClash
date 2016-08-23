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
   4E3B                      58 _strLength::
                             59 ;src/utils/text.c:27: while (str[result] != '\0') {
   4E3B 0E 00         [ 7]   60 	ld	c,#0x00
   4E3D                      61 00101$:
   4E3D 21 02 00      [10]   62 	ld	hl, #2
   4E40 39            [11]   63 	add	hl, sp
   4E41 7E            [ 7]   64 	ld	a, (hl)
   4E42 23            [ 6]   65 	inc	hl
   4E43 66            [ 7]   66 	ld	h, (hl)
   4E44 6F            [ 4]   67 	ld	l, a
   4E45 06 00         [ 7]   68 	ld	b,#0x00
   4E47 09            [11]   69 	add	hl, bc
   4E48 7E            [ 7]   70 	ld	a,(hl)
   4E49 B7            [ 4]   71 	or	a, a
   4E4A 28 03         [12]   72 	jr	Z,00103$
                             73 ;src/utils/text.c:28: result++;
   4E4C 0C            [ 4]   74 	inc	c
   4E4D 18 EE         [12]   75 	jr	00101$
   4E4F                      76 00103$:
                             77 ;src/utils/text.c:30: return result;
   4E4F 69            [ 4]   78 	ld	l,c
   4E50 C9            [10]   79 	ret
                             80 ;src/utils/text.c:36: void strCopy(i8* to, const i8* from) {
                             81 ;	---------------------------------
                             82 ; Function strCopy
                             83 ; ---------------------------------
   4E51                      84 _strCopy::
   4E51 DD E5         [15]   85 	push	ix
   4E53 DD 21 00 00   [14]   86 	ld	ix,#0
   4E57 DD 39         [15]   87 	add	ix,sp
   4E59 3B            [ 6]   88 	dec	sp
                             89 ;src/utils/text.c:39: while (i) {
   4E5A DD 4E 06      [19]   90 	ld	c,6 (ix)
   4E5D DD 46 07      [19]   91 	ld	b,7 (ix)
   4E60 DD 5E 04      [19]   92 	ld	e,4 (ix)
   4E63 DD 56 05      [19]   93 	ld	d,5 (ix)
   4E66 DD 36 FF 1E   [19]   94 	ld	-1 (ix),#0x1E
   4E6A                      95 00101$:
   4E6A DD 7E FF      [19]   96 	ld	a,-1 (ix)
   4E6D B7            [ 4]   97 	or	a, a
   4E6E 28 09         [12]   98 	jr	Z,00104$
                             99 ;src/utils/text.c:40: *to++ = *from++;
   4E70 0A            [ 7]  100 	ld	a,(bc)
   4E71 03            [ 6]  101 	inc	bc
   4E72 12            [ 7]  102 	ld	(de),a
   4E73 13            [ 6]  103 	inc	de
                            104 ;src/utils/text.c:41: i--;
   4E74 DD 35 FF      [23]  105 	dec	-1 (ix)
   4E77 18 F1         [12]  106 	jr	00101$
   4E79                     107 00104$:
   4E79 33            [ 6]  108 	inc	sp
   4E7A DD E1         [14]  109 	pop	ix
   4E7C C9            [10]  110 	ret
                            111 ;src/utils/text.c:45: void drawNumber(u16 aNumber, u8 length, u8 xPos, u8 yPos) {
                            112 ;	---------------------------------
                            113 ; Function drawNumber
                            114 ; ---------------------------------
   4E7D                     115 _drawNumber::
   4E7D DD E5         [15]  116 	push	ix
   4E7F DD 21 00 00   [14]  117 	ld	ix,#0
   4E83 DD 39         [15]  118 	add	ix,sp
   4E85 21 F8 FF      [10]  119 	ld	hl,#-8
   4E88 39            [11]  120 	add	hl,sp
   4E89 F9            [ 6]  121 	ld	sp,hl
                            122 ;src/utils/text.c:53: itoa(aNumber, str, 10);
   4E8A 21 00 00      [10]  123 	ld	hl,#0x0000
   4E8D 39            [11]  124 	add	hl,sp
   4E8E 4D            [ 4]  125 	ld	c,l
   4E8F 44            [ 4]  126 	ld	b,h
   4E90 59            [ 4]  127 	ld	e, c
   4E91 50            [ 4]  128 	ld	d, b
   4E92 C5            [11]  129 	push	bc
   4E93 21 0A 00      [10]  130 	ld	hl,#0x000A
   4E96 E5            [11]  131 	push	hl
   4E97 D5            [11]  132 	push	de
   4E98 DD 6E 04      [19]  133 	ld	l,4 (ix)
   4E9B DD 66 05      [19]  134 	ld	h,5 (ix)
   4E9E E5            [11]  135 	push	hl
   4E9F CD 27 4C      [17]  136 	call	_itoa
   4EA2 21 06 00      [10]  137 	ld	hl,#6
   4EA5 39            [11]  138 	add	hl,sp
   4EA6 F9            [ 6]  139 	ld	sp,hl
   4EA7 C1            [10]  140 	pop	bc
                            141 ;src/utils/text.c:55: zeros = length - strLength(str);
   4EA8 59            [ 4]  142 	ld	e, c
   4EA9 50            [ 4]  143 	ld	d, b
   4EAA C5            [11]  144 	push	bc
   4EAB D5            [11]  145 	push	de
   4EAC CD 3B 4E      [17]  146 	call	_strLength
   4EAF F1            [10]  147 	pop	af
   4EB0 C1            [10]  148 	pop	bc
   4EB1 DD 7E 06      [19]  149 	ld	a,6 (ix)
   4EB4 95            [ 4]  150 	sub	a, l
   4EB5 DD 77 FE      [19]  151 	ld	-2 (ix),a
                            152 ;src/utils/text.c:57: number = str[x];
   4EB8 0A            [ 7]  153 	ld	a,(bc)
   4EB9 5F            [ 4]  154 	ld	e,a
                            155 ;src/utils/text.c:59: while (number != '\0') {
   4EBA DD 36 FF 00   [19]  156 	ld	-1 (ix),#0x00
   4EBE                     157 00101$:
   4EBE 7B            [ 4]  158 	ld	a,e
   4EBF B7            [ 4]  159 	or	a, a
   4EC0 28 55         [12]  160 	jr	Z,00104$
                            161 ;src/utils/text.c:61: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, (zeros + x) * FONT_W + xPos, yPos);
   4EC2 DD 7E FE      [19]  162 	ld	a,-2 (ix)
   4EC5 DD 86 FF      [19]  163 	add	a, -1 (ix)
   4EC8 6F            [ 4]  164 	ld	l,a
   4EC9 D5            [11]  165 	push	de
   4ECA 5D            [ 4]  166 	ld	e,l
   4ECB 29            [11]  167 	add	hl, hl
   4ECC 19            [11]  168 	add	hl, de
   4ECD D1            [10]  169 	pop	de
   4ECE 7D            [ 4]  170 	ld	a,l
   4ECF DD 86 07      [19]  171 	add	a, 7 (ix)
   4ED2 57            [ 4]  172 	ld	d,a
   4ED3 C5            [11]  173 	push	bc
   4ED4 D5            [11]  174 	push	de
   4ED5 DD 7E 08      [19]  175 	ld	a,8 (ix)
   4ED8 F5            [11]  176 	push	af
   4ED9 33            [ 6]  177 	inc	sp
   4EDA D5            [11]  178 	push	de
   4EDB 33            [ 6]  179 	inc	sp
   4EDC 21 00 C0      [10]  180 	ld	hl,#0xC000
   4EDF E5            [11]  181 	push	hl
   4EE0 CD D0 5F      [17]  182 	call	_cpct_getScreenPtr
   4EE3 D1            [10]  183 	pop	de
   4EE4 C1            [10]  184 	pop	bc
                            185 ;src/utils/text.c:62: cpct_drawSprite(G_numbers_big[number - 48], pvideo, FONT_W, FONT_H);
   4EE5 E5            [11]  186 	push	hl
   4EE6 FD E1         [14]  187 	pop	iy
   4EE8 16 00         [ 7]  188 	ld	d,#0x00
   4EEA 7B            [ 4]  189 	ld	a,e
   4EEB C6 D0         [ 7]  190 	add	a,#0xD0
   4EED 5F            [ 4]  191 	ld	e,a
   4EEE 7A            [ 4]  192 	ld	a,d
   4EEF CE FF         [ 7]  193 	adc	a,#0xFF
   4EF1 57            [ 4]  194 	ld	d,a
   4EF2 6B            [ 4]  195 	ld	l, e
   4EF3 62            [ 4]  196 	ld	h, d
   4EF4 29            [11]  197 	add	hl, hl
   4EF5 29            [11]  198 	add	hl, hl
   4EF6 29            [11]  199 	add	hl, hl
   4EF7 29            [11]  200 	add	hl, hl
   4EF8 29            [11]  201 	add	hl, hl
   4EF9 19            [11]  202 	add	hl, de
   4EFA 11 B9 49      [10]  203 	ld	de,#_G_numbers_big
   4EFD 19            [11]  204 	add	hl,de
   4EFE EB            [ 4]  205 	ex	de,hl
   4EFF C5            [11]  206 	push	bc
   4F00 21 03 0B      [10]  207 	ld	hl,#0x0B03
   4F03 E5            [11]  208 	push	hl
   4F04 FD E5         [15]  209 	push	iy
   4F06 D5            [11]  210 	push	de
   4F07 CD 6A 54      [17]  211 	call	_cpct_drawSprite
   4F0A C1            [10]  212 	pop	bc
                            213 ;src/utils/text.c:64: number = str[++x];
   4F0B DD 34 FF      [23]  214 	inc	-1 (ix)
   4F0E DD 6E FF      [19]  215 	ld	l,-1 (ix)
   4F11 26 00         [ 7]  216 	ld	h,#0x00
   4F13 09            [11]  217 	add	hl,bc
   4F14 5E            [ 7]  218 	ld	e,(hl)
   4F15 18 A7         [12]  219 	jr	00101$
   4F17                     220 00104$:
   4F17 DD F9         [10]  221 	ld	sp, ix
   4F19 DD E1         [14]  222 	pop	ix
   4F1B C9            [10]  223 	ret
                            224 ;src/utils/text.c:70: void drawText(u8 text[], u8 xPos, u8 yPos, u8 centered) {
                            225 ;	---------------------------------
                            226 ; Function drawText
                            227 ; ---------------------------------
   4F1C                     228 _drawText::
   4F1C DD E5         [15]  229 	push	ix
   4F1E DD 21 00 00   [14]  230 	ld	ix,#0
   4F22 DD 39         [15]  231 	add	ix,sp
   4F24 F5            [11]  232 	push	af
   4F25 F5            [11]  233 	push	af
   4F26 3B            [ 6]  234 	dec	sp
                            235 ;src/utils/text.c:76: if (centered) {
   4F27 DD 7E 08      [19]  236 	ld	a,8 (ix)
   4F2A B7            [ 4]  237 	or	a, a
   4F2B 28 16         [12]  238 	jr	Z,00102$
                            239 ;src/utils/text.c:77: x = strLength(text);
   4F2D DD 6E 04      [19]  240 	ld	l,4 (ix)
   4F30 DD 66 05      [19]  241 	ld	h,5 (ix)
   4F33 E5            [11]  242 	push	hl
   4F34 CD 3B 4E      [17]  243 	call	_strLength
   4F37 F1            [10]  244 	pop	af
                            245 ;src/utils/text.c:78: xPos = 39 - (x / 2) * FONT_W;
   4F38 CB 3D         [ 8]  246 	srl	l
   4F3A 4D            [ 4]  247 	ld	c,l
   4F3B 29            [11]  248 	add	hl, hl
   4F3C 09            [11]  249 	add	hl, bc
   4F3D 3E 27         [ 7]  250 	ld	a,#0x27
   4F3F 95            [ 4]  251 	sub	a, l
   4F40 DD 77 06      [19]  252 	ld	6 (ix),a
   4F43                     253 00102$:
                            254 ;src/utils/text.c:82: character = text[x];
   4F43 DD 4E 04      [19]  255 	ld	c,4 (ix)
   4F46 DD 46 05      [19]  256 	ld	b,5 (ix)
   4F49 0A            [ 7]  257 	ld	a,(bc)
   4F4A DD 77 FB      [19]  258 	ld	-5 (ix),a
                            259 ;src/utils/text.c:84: while (character != '\0') {
   4F4D DD 36 FC 00   [19]  260 	ld	-4 (ix),#0x00
   4F51 DD 36 FF 00   [19]  261 	ld	-1 (ix),#0x00
   4F55                     262 00109$:
   4F55 DD 7E FB      [19]  263 	ld	a,-5 (ix)
   4F58 B7            [ 4]  264 	or	a, a
   4F59 CA FA 4F      [10]  265 	jp	Z,00112$
                            266 ;src/utils/text.c:86: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, (x * FONT_W) + xPos, yPos);
   4F5C DD 7E FF      [19]  267 	ld	a,-1 (ix)
   4F5F DD 86 06      [19]  268 	add	a, 6 (ix)
   4F62 57            [ 4]  269 	ld	d,a
   4F63 C5            [11]  270 	push	bc
   4F64 DD 7E 07      [19]  271 	ld	a,7 (ix)
   4F67 F5            [11]  272 	push	af
   4F68 33            [ 6]  273 	inc	sp
   4F69 D5            [11]  274 	push	de
   4F6A 33            [ 6]  275 	inc	sp
   4F6B 21 00 C0      [10]  276 	ld	hl,#0xC000
   4F6E E5            [11]  277 	push	hl
   4F6F CD D0 5F      [17]  278 	call	_cpct_getScreenPtr
   4F72 C1            [10]  279 	pop	bc
                            280 ;src/utils/text.c:91: cpct_drawSprite(G_numbers_big[character - 48], pvideo, FONT_W, FONT_H);
   4F73 DD 75 FD      [19]  281 	ld	-3 (ix),l
   4F76 DD 74 FE      [19]  282 	ld	-2 (ix),h
   4F79 DD 5E FB      [19]  283 	ld	e,-5 (ix)
   4F7C 16 00         [ 7]  284 	ld	d,#0x00
                            285 ;src/utils/text.c:89: if (character >= 48 && character <= 57) {
   4F7E DD 7E FB      [19]  286 	ld	a,-5 (ix)
   4F81 D6 30         [ 7]  287 	sub	a, #0x30
   4F83 38 2F         [12]  288 	jr	C,00106$
   4F85 3E 39         [ 7]  289 	ld	a,#0x39
   4F87 DD 96 FB      [19]  290 	sub	a, -5 (ix)
   4F8A 38 28         [12]  291 	jr	C,00106$
                            292 ;src/utils/text.c:91: cpct_drawSprite(G_numbers_big[character - 48], pvideo, FONT_W, FONT_H);
   4F8C 7B            [ 4]  293 	ld	a,e
   4F8D C6 D0         [ 7]  294 	add	a,#0xD0
   4F8F 5F            [ 4]  295 	ld	e,a
   4F90 7A            [ 4]  296 	ld	a,d
   4F91 CE FF         [ 7]  297 	adc	a,#0xFF
   4F93 57            [ 4]  298 	ld	d,a
   4F94 6B            [ 4]  299 	ld	l, e
   4F95 62            [ 4]  300 	ld	h, d
   4F96 29            [11]  301 	add	hl, hl
   4F97 29            [11]  302 	add	hl, hl
   4F98 29            [11]  303 	add	hl, hl
   4F99 29            [11]  304 	add	hl, hl
   4F9A 29            [11]  305 	add	hl, hl
   4F9B 19            [11]  306 	add	hl, de
   4F9C 11 B9 49      [10]  307 	ld	de,#_G_numbers_big
   4F9F 19            [11]  308 	add	hl,de
   4FA0 EB            [ 4]  309 	ex	de,hl
   4FA1 C5            [11]  310 	push	bc
   4FA2 21 03 0B      [10]  311 	ld	hl,#0x0B03
   4FA5 E5            [11]  312 	push	hl
   4FA6 DD 6E FD      [19]  313 	ld	l,-3 (ix)
   4FA9 DD 66 FE      [19]  314 	ld	h,-2 (ix)
   4FAC E5            [11]  315 	push	hl
   4FAD D5            [11]  316 	push	de
   4FAE CD 6A 54      [17]  317 	call	_cpct_drawSprite
   4FB1 C1            [10]  318 	pop	bc
   4FB2 18 2D         [12]  319 	jr	00107$
   4FB4                     320 00106$:
                            321 ;src/utils/text.c:94: else if (character != 32) { //32 = SPACE
   4FB4 DD 7E FB      [19]  322 	ld	a,-5 (ix)
   4FB7 D6 20         [ 7]  323 	sub	a, #0x20
   4FB9 28 26         [12]  324 	jr	Z,00107$
                            325 ;src/utils/text.c:96: cpct_drawSprite(g_font_big[character - 64], pvideo, FONT_W, FONT_H);
   4FBB 7B            [ 4]  326 	ld	a,e
   4FBC C6 C0         [ 7]  327 	add	a,#0xC0
   4FBE 5F            [ 4]  328 	ld	e,a
   4FBF 7A            [ 4]  329 	ld	a,d
   4FC0 CE FF         [ 7]  330 	adc	a,#0xFF
   4FC2 57            [ 4]  331 	ld	d,a
   4FC3 6B            [ 4]  332 	ld	l, e
   4FC4 62            [ 4]  333 	ld	h, d
   4FC5 29            [11]  334 	add	hl, hl
   4FC6 29            [11]  335 	add	hl, hl
   4FC7 29            [11]  336 	add	hl, hl
   4FC8 29            [11]  337 	add	hl, hl
   4FC9 29            [11]  338 	add	hl, hl
   4FCA 19            [11]  339 	add	hl, de
   4FCB 11 B2 44      [10]  340 	ld	de,#_g_font_big
   4FCE 19            [11]  341 	add	hl,de
   4FCF EB            [ 4]  342 	ex	de,hl
   4FD0 C5            [11]  343 	push	bc
   4FD1 21 03 0B      [10]  344 	ld	hl,#0x0B03
   4FD4 E5            [11]  345 	push	hl
   4FD5 DD 6E FD      [19]  346 	ld	l,-3 (ix)
   4FD8 DD 66 FE      [19]  347 	ld	h,-2 (ix)
   4FDB E5            [11]  348 	push	hl
   4FDC D5            [11]  349 	push	de
   4FDD CD 6A 54      [17]  350 	call	_cpct_drawSprite
   4FE0 C1            [10]  351 	pop	bc
   4FE1                     352 00107$:
                            353 ;src/utils/text.c:99: character = text[++x];
   4FE1 DD 34 FF      [23]  354 	inc	-1 (ix)
   4FE4 DD 34 FF      [23]  355 	inc	-1 (ix)
   4FE7 DD 34 FF      [23]  356 	inc	-1 (ix)
   4FEA DD 34 FC      [23]  357 	inc	-4 (ix)
   4FED DD 6E FC      [19]  358 	ld	l,-4 (ix)
   4FF0 26 00         [ 7]  359 	ld	h,#0x00
   4FF2 09            [11]  360 	add	hl,bc
   4FF3 7E            [ 7]  361 	ld	a,(hl)
   4FF4 DD 77 FB      [19]  362 	ld	-5 (ix),a
   4FF7 C3 55 4F      [10]  363 	jp	00109$
   4FFA                     364 00112$:
   4FFA DD F9         [10]  365 	ld	sp, ix
   4FFC DD E1         [14]  366 	pop	ix
   4FFE C9            [10]  367 	ret
                            368 ;src/utils/text.c:103: void moveCharacter(FChar *character) {
                            369 ;	---------------------------------
                            370 ; Function moveCharacter
                            371 ; ---------------------------------
   4FFF                     372 _moveCharacter::
   4FFF DD E5         [15]  373 	push	ix
   5001 DD 21 00 00   [14]  374 	ld	ix,#0
   5005 DD 39         [15]  375 	add	ix,sp
   5007 21 F3 FF      [10]  376 	ld	hl,#-13
   500A 39            [11]  377 	add	hl,sp
   500B F9            [ 6]  378 	ld	sp,hl
                            379 ;src/utils/text.c:105: if (character->phase != FALLING_TEXT_MAX_BOUNCES) {
   500C DD 4E 04      [19]  380 	ld	c,4 (ix)
   500F DD 46 05      [19]  381 	ld	b,5 (ix)
   5012 0A            [ 7]  382 	ld	a,(bc)
   5013 57            [ 4]  383 	ld	d,a
                            384 ;src/utils/text.c:110: if (character->yPos != character->startyPos) {
   5014 21 02 00      [10]  385 	ld	hl,#0x0002
   5017 09            [11]  386 	add	hl,bc
   5018 DD 75 FE      [19]  387 	ld	-2 (ix),l
   501B DD 74 FF      [19]  388 	ld	-1 (ix),h
   501E DD 6E FE      [19]  389 	ld	l,-2 (ix)
   5021 DD 66 FF      [19]  390 	ld	h,-1 (ix)
   5024 5E            [ 7]  391 	ld	e,(hl)
                            392 ;src/utils/text.c:112: clearWindow(character->xPos, character->yPos + (character->phase % 2 != 0 ? - FALLING_TEXT_SPEED : FALLING_TEXT_SPEED), FONT_W, FONT_H);
   5025 21 01 00      [10]  393 	ld	hl,#0x0001
   5028 09            [11]  394 	add	hl,bc
   5029 DD 75 FC      [19]  395 	ld	-4 (ix),l
   502C DD 74 FD      [19]  396 	ld	-3 (ix),h
                            397 ;src/utils/text.c:144: drawText(character->character, character->xPos, character->yPos, 0);
   502F 21 06 00      [10]  398 	ld	hl,#0x0006
   5032 09            [11]  399 	add	hl,bc
   5033 DD 75 FA      [19]  400 	ld	-6 (ix),l
   5036 DD 74 FB      [19]  401 	ld	-5 (ix),h
                            402 ;src/utils/text.c:105: if (character->phase != FALLING_TEXT_MAX_BOUNCES) {
   5039 7A            [ 4]  403 	ld	a,d
   503A D6 06         [ 7]  404 	sub	a, #0x06
   503C CA 2B 51      [10]  405 	jp	Z,00111$
                            406 ;src/utils/text.c:110: if (character->yPos != character->startyPos) {
   503F 21 03 00      [10]  407 	ld	hl,#0x0003
   5042 09            [11]  408 	add	hl,bc
   5043 DD 75 F8      [19]  409 	ld	-8 (ix),l
   5046 DD 74 F9      [19]  410 	ld	-7 (ix),h
   5049 DD 6E F8      [19]  411 	ld	l,-8 (ix)
   504C DD 66 F9      [19]  412 	ld	h,-7 (ix)
   504F 7E            [ 7]  413 	ld	a,(hl)
   5050 DD 77 F7      [19]  414 	ld	-9 (ix),a
   5053 7B            [ 4]  415 	ld	a,e
   5054 DD 96 F7      [19]  416 	sub	a, -9 (ix)
   5057 28 24         [12]  417 	jr	Z,00102$
                            418 ;src/utils/text.c:112: clearWindow(character->xPos, character->yPos + (character->phase % 2 != 0 ? - FALLING_TEXT_SPEED : FALLING_TEXT_SPEED), FONT_W, FONT_H);
   5059 CB 42         [ 8]  419 	bit	0, d
   505B 28 04         [12]  420 	jr	Z,00115$
   505D 2E FD         [ 7]  421 	ld	l,#0xFD
   505F 18 02         [12]  422 	jr	00116$
   5061                     423 00115$:
   5061 2E 03         [ 7]  424 	ld	l,#0x03
   5063                     425 00116$:
   5063 7B            [ 4]  426 	ld	a,e
   5064 85            [ 4]  427 	add	a, l
   5065 5F            [ 4]  428 	ld	e,a
   5066 DD 6E FC      [19]  429 	ld	l,-4 (ix)
   5069 DD 66 FD      [19]  430 	ld	h,-3 (ix)
   506C 56            [ 7]  431 	ld	d,(hl)
   506D C5            [11]  432 	push	bc
   506E 21 03 0B      [10]  433 	ld	hl,#0x0B03
   5071 E5            [11]  434 	push	hl
   5072 7B            [ 4]  435 	ld	a,e
   5073 F5            [11]  436 	push	af
   5074 33            [ 6]  437 	inc	sp
   5075 D5            [11]  438 	push	de
   5076 33            [ 6]  439 	inc	sp
   5077 CD 5F 53      [17]  440 	call	_clearWindow
   507A F1            [10]  441 	pop	af
   507B F1            [10]  442 	pop	af
   507C C1            [10]  443 	pop	bc
   507D                     444 00102$:
                            445 ;src/utils/text.c:117: if (character->phase % 2 != 0) {
   507D 0A            [ 7]  446 	ld	a,(bc)
   507E E6 01         [ 7]  447 	and	a, #0x01
   5080 DD 77 F7      [19]  448 	ld	-9 (ix),a
                            449 ;src/utils/text.c:110: if (character->yPos != character->startyPos) {
   5083 DD 6E FE      [19]  450 	ld	l,-2 (ix)
   5086 DD 66 FF      [19]  451 	ld	h,-1 (ix)
   5089 5E            [ 7]  452 	ld	e,(hl)
                            453 ;src/utils/text.c:121: if (character->yPos >= character->destinationyPos) {
   508A 21 05 00      [10]  454 	ld	hl,#0x0005
   508D 09            [11]  455 	add	hl,bc
   508E DD 75 F5      [19]  456 	ld	-11 (ix),l
   5091 DD 74 F6      [19]  457 	ld	-10 (ix),h
                            458 ;src/utils/text.c:125: character->destinationyPos = character->endyPos - ((character->endyPos - character->startyPos) / character->phase);
   5094 21 04 00      [10]  459 	ld	hl,#0x0004
   5097 09            [11]  460 	add	hl,bc
   5098 E3            [19]  461 	ex	(sp), hl
                            462 ;src/utils/text.c:117: if (character->phase % 2 != 0) {
   5099 DD 7E F7      [19]  463 	ld	a,-9 (ix)
   509C B7            [ 4]  464 	or	a, a
   509D 28 48         [12]  465 	jr	Z,00108$
                            466 ;src/utils/text.c:119: character->yPos += FALLING_TEXT_SPEED;
   509F 1C            [ 4]  467 	inc	e
   50A0 1C            [ 4]  468 	inc	e
   50A1 1C            [ 4]  469 	inc	e
   50A2 DD 6E FE      [19]  470 	ld	l,-2 (ix)
   50A5 DD 66 FF      [19]  471 	ld	h,-1 (ix)
   50A8 73            [ 7]  472 	ld	(hl),e
                            473 ;src/utils/text.c:121: if (character->yPos >= character->destinationyPos) {
   50A9 DD 6E F5      [19]  474 	ld	l,-11 (ix)
   50AC DD 66 F6      [19]  475 	ld	h,-10 (ix)
   50AF 56            [ 7]  476 	ld	d,(hl)
   50B0 7B            [ 4]  477 	ld	a,e
   50B1 92            [ 4]  478 	sub	a, d
   50B2 38 55         [12]  479 	jr	C,00109$
                            480 ;src/utils/text.c:123: character->phase++;
   50B4 0A            [ 7]  481 	ld	a,(bc)
   50B5 5F            [ 4]  482 	ld	e,a
   50B6 1C            [ 4]  483 	inc	e
   50B7 7B            [ 4]  484 	ld	a,e
   50B8 02            [ 7]  485 	ld	(bc),a
                            486 ;src/utils/text.c:125: character->destinationyPos = character->endyPos - ((character->endyPos - character->startyPos) / character->phase);
   50B9 E1            [10]  487 	pop	hl
   50BA E5            [11]  488 	push	hl
   50BB 7E            [ 7]  489 	ld	a,(hl)
   50BC DD 77 F7      [19]  490 	ld	-9 (ix), a
   50BF 4F            [ 4]  491 	ld	c, a
   50C0 06 00         [ 7]  492 	ld	b,#0x00
   50C2 DD 6E F8      [19]  493 	ld	l,-8 (ix)
   50C5 DD 66 F9      [19]  494 	ld	h,-7 (ix)
   50C8 6E            [ 7]  495 	ld	l,(hl)
   50C9 16 00         [ 7]  496 	ld	d,#0x00
   50CB 79            [ 4]  497 	ld	a,c
   50CC 95            [ 4]  498 	sub	a, l
   50CD 4F            [ 4]  499 	ld	c,a
   50CE 78            [ 4]  500 	ld	a,b
   50CF 9A            [ 4]  501 	sbc	a, d
   50D0 47            [ 4]  502 	ld	b,a
   50D1 16 00         [ 7]  503 	ld	d,#0x00
   50D3 D5            [11]  504 	push	de
   50D4 C5            [11]  505 	push	bc
   50D5 CD 2B 60      [17]  506 	call	__divsint
   50D8 F1            [10]  507 	pop	af
   50D9 F1            [10]  508 	pop	af
   50DA DD 7E F7      [19]  509 	ld	a, -9 (ix)
   50DD 95            [ 4]  510 	sub	a, l
   50DE DD 6E F5      [19]  511 	ld	l,-11 (ix)
   50E1 DD 66 F6      [19]  512 	ld	h,-10 (ix)
   50E4 77            [ 7]  513 	ld	(hl),a
   50E5 18 22         [12]  514 	jr	00109$
   50E7                     515 00108$:
                            516 ;src/utils/text.c:132: character->yPos -= FALLING_TEXT_SPEED;
   50E7 7B            [ 4]  517 	ld	a,e
   50E8 C6 FD         [ 7]  518 	add	a,#0xFD
   50EA 5F            [ 4]  519 	ld	e,a
   50EB DD 6E FE      [19]  520 	ld	l,-2 (ix)
   50EE DD 66 FF      [19]  521 	ld	h,-1 (ix)
   50F1 73            [ 7]  522 	ld	(hl),e
                            523 ;src/utils/text.c:134: if (character->yPos <= character->destinationyPos) {
   50F2 DD 6E F5      [19]  524 	ld	l,-11 (ix)
   50F5 DD 66 F6      [19]  525 	ld	h,-10 (ix)
   50F8 7E            [ 7]  526 	ld	a, (hl)
   50F9 93            [ 4]  527 	sub	a, e
   50FA 38 0D         [12]  528 	jr	C,00109$
                            529 ;src/utils/text.c:136: character->phase++;
   50FC 0A            [ 7]  530 	ld	a,(bc)
   50FD 3C            [ 4]  531 	inc	a
   50FE 02            [ 7]  532 	ld	(bc),a
                            533 ;src/utils/text.c:138: character->destinationyPos = character->endyPos;
   50FF E1            [10]  534 	pop	hl
   5100 E5            [11]  535 	push	hl
   5101 4E            [ 7]  536 	ld	c,(hl)
   5102 DD 6E F5      [19]  537 	ld	l,-11 (ix)
   5105 DD 66 F6      [19]  538 	ld	h,-10 (ix)
   5108 71            [ 7]  539 	ld	(hl),c
   5109                     540 00109$:
                            541 ;src/utils/text.c:144: drawText(character->character, character->xPos, character->yPos, 0);
   5109 DD 6E FE      [19]  542 	ld	l,-2 (ix)
   510C DD 66 FF      [19]  543 	ld	h,-1 (ix)
   510F 46            [ 7]  544 	ld	b,(hl)
   5110 DD 6E FC      [19]  545 	ld	l,-4 (ix)
   5113 DD 66 FD      [19]  546 	ld	h,-3 (ix)
   5116 56            [ 7]  547 	ld	d,(hl)
   5117 AF            [ 4]  548 	xor	a, a
   5118 F5            [11]  549 	push	af
   5119 33            [ 6]  550 	inc	sp
   511A 4A            [ 4]  551 	ld	c, d
   511B C5            [11]  552 	push	bc
   511C DD 6E FA      [19]  553 	ld	l,-6 (ix)
   511F DD 66 FB      [19]  554 	ld	h,-5 (ix)
   5122 E5            [11]  555 	push	hl
   5123 CD 1C 4F      [17]  556 	call	_drawText
   5126 F1            [10]  557 	pop	af
   5127 F1            [10]  558 	pop	af
   5128 33            [ 6]  559 	inc	sp
   5129 18 3A         [12]  560 	jr	00113$
   512B                     561 00111$:
                            562 ;src/utils/text.c:148: clearWindow(character->xPos, character->yPos - FALLING_TEXT_SPEED, FONT_W, FONT_H);
   512B 7B            [ 4]  563 	ld	a,e
   512C C6 FD         [ 7]  564 	add	a,#0xFD
   512E 57            [ 4]  565 	ld	d,a
   512F DD 6E FC      [19]  566 	ld	l,-4 (ix)
   5132 DD 66 FD      [19]  567 	ld	h,-3 (ix)
   5135 46            [ 7]  568 	ld	b,(hl)
   5136 21 03 0B      [10]  569 	ld	hl,#0x0B03
   5139 E5            [11]  570 	push	hl
   513A D5            [11]  571 	push	de
   513B 33            [ 6]  572 	inc	sp
   513C C5            [11]  573 	push	bc
   513D 33            [ 6]  574 	inc	sp
   513E CD 5F 53      [17]  575 	call	_clearWindow
   5141 F1            [10]  576 	pop	af
   5142 F1            [10]  577 	pop	af
                            578 ;src/utils/text.c:149: drawText(character->character, character->xPos, character->yPos, 0);
   5143 DD 6E FE      [19]  579 	ld	l,-2 (ix)
   5146 DD 66 FF      [19]  580 	ld	h,-1 (ix)
   5149 56            [ 7]  581 	ld	d,(hl)
   514A DD 6E FC      [19]  582 	ld	l,-4 (ix)
   514D DD 66 FD      [19]  583 	ld	h,-3 (ix)
   5150 46            [ 7]  584 	ld	b,(hl)
   5151 AF            [ 4]  585 	xor	a, a
   5152 F5            [11]  586 	push	af
   5153 33            [ 6]  587 	inc	sp
   5154 D5            [11]  588 	push	de
   5155 33            [ 6]  589 	inc	sp
   5156 C5            [11]  590 	push	bc
   5157 33            [ 6]  591 	inc	sp
   5158 DD 6E FA      [19]  592 	ld	l,-6 (ix)
   515B DD 66 FB      [19]  593 	ld	h,-5 (ix)
   515E E5            [11]  594 	push	hl
   515F CD 1C 4F      [17]  595 	call	_drawText
   5162 F1            [10]  596 	pop	af
   5163 F1            [10]  597 	pop	af
   5164 33            [ 6]  598 	inc	sp
   5165                     599 00113$:
   5165 DD F9         [10]  600 	ld	sp, ix
   5167 DD E1         [14]  601 	pop	ix
   5169 C9            [10]  602 	ret
                            603 ;src/utils/text.c:154: u8 moveFallingText(FChar *text, u8 lenght) {
                            604 ;	---------------------------------
                            605 ; Function moveFallingText
                            606 ; ---------------------------------
   516A                     607 _moveFallingText::
   516A DD E5         [15]  608 	push	ix
   516C DD 21 00 00   [14]  609 	ld	ix,#0
   5170 DD 39         [15]  610 	add	ix,sp
   5172 F5            [11]  611 	push	af
                            612 ;src/utils/text.c:158: for (x = 0; x < lenght; x++) {
   5173 0E 00         [ 7]  613 	ld	c,#0x00
   5175                     614 00109$:
   5175 79            [ 4]  615 	ld	a,c
   5176 DD 96 06      [19]  616 	sub	a, 6 (ix)
   5179 30 69         [12]  617 	jr	NC,00107$
                            618 ;src/utils/text.c:160: if (x == 0 || (x > 0 && text[x - 1].phase == 1 && text[x - 1].yPos >= text[x].yPos + 15) || text[x - 1].phase > 1) moveCharacter(&text[x]);
   517B 69            [ 4]  619 	ld	l,c
   517C 26 00         [ 7]  620 	ld	h,#0x00
   517E 5D            [ 4]  621 	ld	e, l
   517F 54            [ 4]  622 	ld	d, h
   5180 CB 23         [ 8]  623 	sla	e
   5182 CB 12         [ 8]  624 	rl	d
   5184 CB 23         [ 8]  625 	sla	e
   5186 CB 12         [ 8]  626 	rl	d
   5188 CB 23         [ 8]  627 	sla	e
   518A CB 12         [ 8]  628 	rl	d
   518C DD 7E 04      [19]  629 	ld	a,4 (ix)
   518F 83            [ 4]  630 	add	a, e
   5190 DD 77 FE      [19]  631 	ld	-2 (ix),a
   5193 DD 7E 05      [19]  632 	ld	a,5 (ix)
   5196 8A            [ 4]  633 	adc	a, d
   5197 DD 77 FF      [19]  634 	ld	-1 (ix),a
   519A 79            [ 4]  635 	ld	a,c
   519B B7            [ 4]  636 	or	a, a
   519C 28 38         [12]  637 	jr	Z,00101$
   519E 2B            [ 6]  638 	dec	hl
   519F 29            [11]  639 	add	hl, hl
   51A0 29            [11]  640 	add	hl, hl
   51A1 29            [11]  641 	add	hl, hl
   51A2 EB            [ 4]  642 	ex	de,hl
   51A3 DD 6E 04      [19]  643 	ld	l,4 (ix)
   51A6 DD 66 05      [19]  644 	ld	h,5 (ix)
   51A9 19            [11]  645 	add	hl,de
   51AA 46            [ 7]  646 	ld	b,(hl)
   51AB 79            [ 4]  647 	ld	a,c
   51AC B7            [ 4]  648 	or	a, a
   51AD 28 22         [12]  649 	jr	Z,00106$
   51AF 78            [ 4]  650 	ld	a,b
   51B0 3D            [ 4]  651 	dec	a
   51B1 20 1E         [12]  652 	jr	NZ,00106$
   51B3 23            [ 6]  653 	inc	hl
   51B4 23            [ 6]  654 	inc	hl
   51B5 5E            [ 7]  655 	ld	e,(hl)
   51B6 E1            [10]  656 	pop	hl
   51B7 E5            [11]  657 	push	hl
   51B8 23            [ 6]  658 	inc	hl
   51B9 23            [ 6]  659 	inc	hl
   51BA 6E            [ 7]  660 	ld	l,(hl)
   51BB 26 00         [ 7]  661 	ld	h,#0x00
   51BD D5            [11]  662 	push	de
   51BE 11 0F 00      [10]  663 	ld	de,#0x000F
   51C1 19            [11]  664 	add	hl, de
   51C2 D1            [10]  665 	pop	de
   51C3 16 00         [ 7]  666 	ld	d,#0x00
   51C5 7B            [ 4]  667 	ld	a,e
   51C6 95            [ 4]  668 	sub	a, l
   51C7 7A            [ 4]  669 	ld	a,d
   51C8 9C            [ 4]  670 	sbc	a, h
   51C9 E2 CE 51      [10]  671 	jp	PO, 00138$
   51CC EE 80         [ 7]  672 	xor	a, #0x80
   51CE                     673 00138$:
   51CE F2 D6 51      [10]  674 	jp	P,00101$
   51D1                     675 00106$:
   51D1 3E 01         [ 7]  676 	ld	a,#0x01
   51D3 90            [ 4]  677 	sub	a, b
   51D4 30 0B         [12]  678 	jr	NC,00110$
   51D6                     679 00101$:
   51D6 C5            [11]  680 	push	bc
   51D7 D1            [10]  681 	pop	de
   51D8 E1            [10]  682 	pop	hl
   51D9 E5            [11]  683 	push	hl
   51DA D5            [11]  684 	push	de
   51DB E5            [11]  685 	push	hl
   51DC CD FF 4F      [17]  686 	call	_moveCharacter
   51DF F1            [10]  687 	pop	af
   51E0 C1            [10]  688 	pop	bc
   51E1                     689 00110$:
                            690 ;src/utils/text.c:158: for (x = 0; x < lenght; x++) {
   51E1 0C            [ 4]  691 	inc	c
   51E2 18 91         [12]  692 	jr	00109$
   51E4                     693 00107$:
                            694 ;src/utils/text.c:163: return text[lenght - 1].phase == FALLING_TEXT_MAX_BOUNCES;
   51E4 DD 6E 06      [19]  695 	ld	l,6 (ix)
   51E7 26 00         [ 7]  696 	ld	h,#0x00
   51E9 2B            [ 6]  697 	dec	hl
   51EA 29            [11]  698 	add	hl, hl
   51EB 29            [11]  699 	add	hl, hl
   51EC 29            [11]  700 	add	hl, hl
   51ED 4D            [ 4]  701 	ld	c, l
   51EE 44            [ 4]  702 	ld	b, h
   51EF DD 6E 04      [19]  703 	ld	l,4 (ix)
   51F2 DD 66 05      [19]  704 	ld	h,5 (ix)
   51F5 09            [11]  705 	add	hl,bc
   51F6 7E            [ 7]  706 	ld	a,(hl)
   51F7 D6 06         [ 7]  707 	sub	a, #0x06
   51F9 20 04         [12]  708 	jr	NZ,00139$
   51FB 3E 01         [ 7]  709 	ld	a,#0x01
   51FD 18 01         [12]  710 	jr	00140$
   51FF                     711 00139$:
   51FF AF            [ 4]  712 	xor	a,a
   5200                     713 00140$:
   5200 6F            [ 4]  714 	ld	l,a
   5201 DD F9         [10]  715 	ld	sp, ix
   5203 DD E1         [14]  716 	pop	ix
   5205 C9            [10]  717 	ret
                            718 ;src/utils/text.c:169: void drawFallingText(u8 text[], u8 xPos, u8 yPos, u8 destinationyPos) {
                            719 ;	---------------------------------
                            720 ; Function drawFallingText
                            721 ; ---------------------------------
   5206                     722 _drawFallingText::
   5206 DD E5         [15]  723 	push	ix
   5208 DD 21 00 00   [14]  724 	ld	ix,#0
   520C DD 39         [15]  725 	add	ix,sp
   520E 21 5A FF      [10]  726 	ld	hl,#-166
   5211 39            [11]  727 	add	hl,sp
   5212 F9            [ 6]  728 	ld	sp,hl
                            729 ;src/utils/text.c:175: for (x = 0; x < strLength(text) && x < FALLING_TEXT_MAX_LENGHT; x++) {
   5213 21 01 00      [10]  730 	ld	hl,#0x0001
   5216 39            [11]  731 	add	hl,sp
   5217 DD 75 FE      [19]  732 	ld	-2 (ix),l
   521A DD 74 FF      [19]  733 	ld	-1 (ix),h
   521D FD 21 00 00   [14]  734 	ld	iy,#0
   5221 FD 39         [15]  735 	add	iy,sp
   5223 FD 36 00 00   [19]  736 	ld	0 (iy),#0x00
   5227 DD 36 FD 00   [19]  737 	ld	-3 (ix),#0x00
   522B                     738 00109$:
   522B DD 6E 04      [19]  739 	ld	l,4 (ix)
   522E DD 66 05      [19]  740 	ld	h,5 (ix)
   5231 E5            [11]  741 	push	hl
   5232 CD 3B 4E      [17]  742 	call	_strLength
   5235 F1            [10]  743 	pop	af
   5236 4D            [ 4]  744 	ld	c,l
   5237 FD 21 00 00   [14]  745 	ld	iy,#0
   523B FD 39         [15]  746 	add	iy,sp
   523D FD 7E 00      [19]  747 	ld	a,0 (iy)
   5240 91            [ 4]  748 	sub	a, c
   5241 D2 C3 52      [10]  749 	jp	NC,00120$
   5244 FD 7E 00      [19]  750 	ld	a,0 (iy)
   5247 D6 14         [ 7]  751 	sub	a, #0x14
   5249 30 78         [12]  752 	jr	NC,00120$
                            753 ;src/utils/text.c:177: ftext[x].phase = 1;
   524B FD 6E 00      [19]  754 	ld	l,0 (iy)
   524E 26 00         [ 7]  755 	ld	h,#0x00
   5250 29            [11]  756 	add	hl, hl
   5251 29            [11]  757 	add	hl, hl
   5252 29            [11]  758 	add	hl, hl
   5253 4D            [ 4]  759 	ld	c, l
   5254 44            [ 4]  760 	ld	b, h
   5255 DD 7E FE      [19]  761 	ld	a,-2 (ix)
   5258 81            [ 4]  762 	add	a, c
   5259 4F            [ 4]  763 	ld	c,a
   525A DD 7E FF      [19]  764 	ld	a,-1 (ix)
   525D 88            [ 4]  765 	adc	a, b
   525E 47            [ 4]  766 	ld	b,a
   525F 3E 01         [ 7]  767 	ld	a,#0x01
   5261 02            [ 7]  768 	ld	(bc),a
                            769 ;src/utils/text.c:178: ftext[x].xPos = xPos + (x * FONT_W);
   5262 59            [ 4]  770 	ld	e, c
   5263 50            [ 4]  771 	ld	d, b
   5264 13            [ 6]  772 	inc	de
   5265 DD 7E 06      [19]  773 	ld	a,6 (ix)
   5268 DD 86 FD      [19]  774 	add	a, -3 (ix)
   526B 12            [ 7]  775 	ld	(de),a
                            776 ;src/utils/text.c:179: ftext[x].yPos = yPos;
   526C 59            [ 4]  777 	ld	e, c
   526D 50            [ 4]  778 	ld	d, b
   526E 13            [ 6]  779 	inc	de
   526F 13            [ 6]  780 	inc	de
   5270 DD 7E 07      [19]  781 	ld	a,7 (ix)
   5273 12            [ 7]  782 	ld	(de),a
                            783 ;src/utils/text.c:180: ftext[x].startyPos = yPos;
   5274 59            [ 4]  784 	ld	e, c
   5275 50            [ 4]  785 	ld	d, b
   5276 13            [ 6]  786 	inc	de
   5277 13            [ 6]  787 	inc	de
   5278 13            [ 6]  788 	inc	de
   5279 DD 7E 07      [19]  789 	ld	a,7 (ix)
   527C 12            [ 7]  790 	ld	(de),a
                            791 ;src/utils/text.c:181: ftext[x].endyPos = destinationyPos;
   527D 21 04 00      [10]  792 	ld	hl,#0x0004
   5280 09            [11]  793 	add	hl,bc
   5281 DD 7E 08      [19]  794 	ld	a,8 (ix)
   5284 77            [ 7]  795 	ld	(hl),a
                            796 ;src/utils/text.c:182: ftext[x].destinationyPos = destinationyPos;
   5285 21 05 00      [10]  797 	ld	hl,#0x0005
   5288 09            [11]  798 	add	hl,bc
   5289 DD 7E 08      [19]  799 	ld	a,8 (ix)
   528C 77            [ 7]  800 	ld	(hl),a
                            801 ;src/utils/text.c:183: ftext[x].character[0] = text[x];
   528D 21 06 00      [10]  802 	ld	hl,#0x0006
   5290 09            [11]  803 	add	hl,bc
   5291 DD 75 FB      [19]  804 	ld	-5 (ix),l
   5294 DD 74 FC      [19]  805 	ld	-4 (ix),h
   5297 DD 7E 04      [19]  806 	ld	a,4 (ix)
   529A 21 00 00      [10]  807 	ld	hl,#0
   529D 39            [11]  808 	add	hl,sp
   529E 86            [ 7]  809 	add	a, (hl)
   529F 5F            [ 4]  810 	ld	e,a
   52A0 DD 7E 05      [19]  811 	ld	a,5 (ix)
   52A3 CE 00         [ 7]  812 	adc	a, #0x00
   52A5 57            [ 4]  813 	ld	d,a
   52A6 1A            [ 7]  814 	ld	a,(de)
   52A7 DD 6E FB      [19]  815 	ld	l,-5 (ix)
   52AA DD 66 FC      [19]  816 	ld	h,-4 (ix)
   52AD 77            [ 7]  817 	ld	(hl),a
                            818 ;src/utils/text.c:184: ftext[x].character[1] = '\0';
   52AE 21 07 00      [10]  819 	ld	hl,#0x0007
   52B1 09            [11]  820 	add	hl,bc
   52B2 36 00         [10]  821 	ld	(hl),#0x00
                            822 ;src/utils/text.c:175: for (x = 0; x < strLength(text) && x < FALLING_TEXT_MAX_LENGHT; x++) {
   52B4 DD 34 FD      [23]  823 	inc	-3 (ix)
   52B7 DD 34 FD      [23]  824 	inc	-3 (ix)
   52BA DD 34 FD      [23]  825 	inc	-3 (ix)
   52BD FD 34 00      [23]  826 	inc	0 (iy)
   52C0 C3 2B 52      [10]  827 	jp	00109$
                            828 ;src/utils/text.c:187: while (1) {
   52C3                     829 00120$:
   52C3 DD 7E FE      [19]  830 	ld	a,-2 (ix)
   52C6 DD 77 FB      [19]  831 	ld	-5 (ix),a
   52C9 DD 7E FF      [19]  832 	ld	a,-1 (ix)
   52CC DD 77 FC      [19]  833 	ld	-4 (ix),a
   52CF                     834 00105$:
                            835 ;src/utils/text.c:190: if (moveFallingText(ftext, strLength(text) <= FALLING_TEXT_MAX_LENGHT ? strLength(text) : FALLING_TEXT_MAX_LENGHT)) {
   52CF DD 6E 04      [19]  836 	ld	l,4 (ix)
   52D2 DD 66 05      [19]  837 	ld	h,5 (ix)
   52D5 E5            [11]  838 	push	hl
   52D6 CD 3B 4E      [17]  839 	call	_strLength
   52D9 F1            [10]  840 	pop	af
   52DA 3E 14         [ 7]  841 	ld	a,#0x14
   52DC 95            [ 4]  842 	sub	a, l
   52DD 38 0E         [12]  843 	jr	C,00113$
   52DF DD 6E 04      [19]  844 	ld	l,4 (ix)
   52E2 DD 66 05      [19]  845 	ld	h,5 (ix)
   52E5 E5            [11]  846 	push	hl
   52E6 CD 3B 4E      [17]  847 	call	_strLength
   52E9 F1            [10]  848 	pop	af
   52EA 45            [ 4]  849 	ld	b,l
   52EB 18 02         [12]  850 	jr	00114$
   52ED                     851 00113$:
   52ED 06 14         [ 7]  852 	ld	b,#0x14
   52EF                     853 00114$:
   52EF DD 5E FB      [19]  854 	ld	e,-5 (ix)
   52F2 DD 56 FC      [19]  855 	ld	d,-4 (ix)
   52F5 C5            [11]  856 	push	bc
   52F6 33            [ 6]  857 	inc	sp
   52F7 D5            [11]  858 	push	de
   52F8 CD 6A 51      [17]  859 	call	_moveFallingText
   52FB F1            [10]  860 	pop	af
   52FC 33            [ 6]  861 	inc	sp
   52FD 7D            [ 4]  862 	ld	a,l
   52FE B7            [ 4]  863 	or	a, a
                            864 ;src/utils/text.c:192: return;
   52FF 20 05         [12]  865 	jr	NZ,00111$
                            866 ;src/utils/text.c:196: cpct_waitVSYNC();
   5301 CD 18 56      [17]  867 	call	_cpct_waitVSYNC
   5304 18 C9         [12]  868 	jr	00105$
   5306                     869 00111$:
   5306 DD F9         [10]  870 	ld	sp, ix
   5308 DD E1         [14]  871 	pop	ix
   530A C9            [10]  872 	ret
                            873 	.area _CODE
                            874 	.area _INITIALIZER
                            875 	.area _CABS (ABS)
