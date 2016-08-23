                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.5 #9498 (Mac OS X x86_64)
                              4 ;--------------------------------------------------------
                              5 	.module keyboard
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _drawText
                             12 	.globl _strlen
                             13 	.globl _cpct_getScreenPtr
                             14 	.globl _cpct_drawSolidBox
                             15 	.globl _cpct_px2byteM0
                             16 	.globl _cpct_isAnyKeyPressed_f
                             17 	.globl _cpct_isAnyKeyPressed
                             18 	.globl _cpct_isKeyPressed
                             19 	.globl _cpct_scanKeyboard_f
                             20 	.globl _cpct_scanKeyboard
                             21 	.globl _wait4UserKeypress
                             22 	.globl _esperaUnaTecla
                             23 	.globl _waitKeyUp
                             24 	.globl _wait4Key
                             25 	.globl _redefineKey
                             26 ;--------------------------------------------------------
                             27 ; special function registers
                             28 ;--------------------------------------------------------
                             29 ;--------------------------------------------------------
                             30 ; ram data
                             31 ;--------------------------------------------------------
                             32 	.area _DATA
                             33 ;--------------------------------------------------------
                             34 ; ram data
                             35 ;--------------------------------------------------------
                             36 	.area _INITIALIZED
                             37 ;--------------------------------------------------------
                             38 ; absolute external ram data
                             39 ;--------------------------------------------------------
                             40 	.area _DABS (ABS)
                             41 ;--------------------------------------------------------
                             42 ; global & static initialisations
                             43 ;--------------------------------------------------------
                             44 	.area _HOME
                             45 	.area _GSINIT
                             46 	.area _GSFINAL
                             47 	.area _GSINIT
                             48 ;--------------------------------------------------------
                             49 ; Home
                             50 ;--------------------------------------------------------
                             51 	.area _HOME
                             52 	.area _HOME
                             53 ;--------------------------------------------------------
                             54 ; code
                             55 ;--------------------------------------------------------
                             56 	.area _CODE
                             57 ;src/utils/keyboard.c:32: u32 wait4UserKeypress() {
                             58 ;	---------------------------------
                             59 ; Function wait4UserKeypress
                             60 ; ---------------------------------
   4D54                      61 _wait4UserKeypress::
                             62 ;src/utils/keyboard.c:36: do {
   4D54 21 00 00      [10]   63 	ld	hl,#0x0000
   4D57 5D            [ 4]   64 	ld	e,l
   4D58 54            [ 4]   65 	ld	d,h
   4D59                      66 00101$:
                             67 ;src/utils/keyboard.c:37: c++;                       // One more cycle
   4D59 2C            [ 4]   68 	inc	l
   4D5A 20 07         [12]   69 	jr	NZ,00115$
   4D5C 24            [ 4]   70 	inc	h
   4D5D 20 04         [12]   71 	jr	NZ,00115$
   4D5F 1C            [ 4]   72 	inc	e
   4D60 20 01         [12]   73 	jr	NZ,00115$
   4D62 14            [ 4]   74 	inc	d
   4D63                      75 00115$:
                             76 ;src/utils/keyboard.c:38: cpct_scanKeyboard_f();     // Scan the scan the keyboard
   4D63 E5            [11]   77 	push	hl
   4D64 D5            [11]   78 	push	de
   4D65 CD D1 53      [17]   79 	call	_cpct_scanKeyboard_f
   4D68 CD 20 56      [17]   80 	call	_cpct_isAnyKeyPressed_f
   4D6B 7D            [ 4]   81 	ld	a,l
   4D6C D1            [10]   82 	pop	de
   4D6D E1            [10]   83 	pop	hl
   4D6E B7            [ 4]   84 	or	a, a
   4D6F 28 E8         [12]   85 	jr	Z,00101$
                             86 ;src/utils/keyboard.c:41: return c;
   4D71 C9            [10]   87 	ret
                             88 ;src/utils/keyboard.c:45: cpct_keyID esperaUnaTecla() {
                             89 ;	---------------------------------
                             90 ; Function esperaUnaTecla
                             91 ; ---------------------------------
   4D72                      92 _esperaUnaTecla::
   4D72 DD E5         [15]   93 	push	ix
   4D74 DD 21 00 00   [14]   94 	ld	ix,#0
   4D78 DD 39         [15]   95 	add	ix,sp
   4D7A F5            [11]   96 	push	af
                             97 ;src/utils/keyboard.c:48: u8 i = 10, *keys = cpct_keyboardStatusBuffer + 9;
   4D7B 16 0A         [ 7]   98 	ld	d,#0x0A
                             99 ;src/utils/keyboard.c:52: do { cpct_scanKeyboard(); } while ( ! cpct_isAnyKeyPressed() );
   4D7D                     100 00101$:
   4D7D D5            [11]  101 	push	de
   4D7E CD 9F 5F      [17]  102 	call	_cpct_scanKeyboard
   4D81 CD A3 55      [17]  103 	call	_cpct_isAnyKeyPressed
   4D84 D1            [10]  104 	pop	de
   4D85 7D            [ 4]  105 	ld	a,l
   4D86 B7            [ 4]  106 	or	a, a
   4D87 28 F4         [12]  107 	jr	Z,00101$
                            108 ;src/utils/keyboard.c:55: do {
   4D89 01 2B 55      [10]  109 	ld	bc,#(_cpct_keyboardStatusBuffer + 0x0009)
   4D8C 1E 0A         [ 7]  110 	ld	e,#0x0A
   4D8E                     111 00106$:
                            112 ;src/utils/keyboard.c:58: keypressed = *keys ^ 0xFF;
   4D8E 0A            [ 7]  113 	ld	a,(bc)
   4D8F EE FF         [ 7]  114 	xor	a, #0xFF
   4D91 DD 77 FE      [19]  115 	ld	-2 (ix),a
   4D94 DD 36 FF 00   [19]  116 	ld	-1 (ix),#0x00
                            117 ;src/utils/keyboard.c:60: return (keypressed << 8) + (i - 1);  // Formato cpct_keyID: 8 primeros bits = máscara de tecla, 8 siguientes fila del teclado (0-9)
   4D98 DD 66 FE      [19]  118 	ld	h,-2 (ix)
   4D9B 2E 00         [ 7]  119 	ld	l,#0x00
                            120 ;src/utils/keyboard.c:59: if (keypressed)
   4D9D DD 7E FF      [19]  121 	ld	a,-1 (ix)
   4DA0 DD B6 FE      [19]  122 	or	a,-2 (ix)
   4DA3 28 07         [12]  123 	jr	Z,00105$
                            124 ;src/utils/keyboard.c:60: return (keypressed << 8) + (i - 1);  // Formato cpct_keyID: 8 primeros bits = máscara de tecla, 8 siguientes fila del teclado (0-9)
   4DA5 4A            [ 4]  125 	ld	c,d
   4DA6 06 00         [ 7]  126 	ld	b,#0x00
   4DA8 0B            [ 6]  127 	dec	bc
   4DA9 09            [11]  128 	add	hl,bc
   4DAA 18 0A         [12]  129 	jr	00109$
   4DAC                     130 00105$:
                            131 ;src/utils/keyboard.c:61: keys--;
   4DAC 0B            [ 6]  132 	dec	bc
                            133 ;src/utils/keyboard.c:62: } while (--i);
   4DAD 1D            [ 4]  134 	dec	e
   4DAE 7B            [ 4]  135 	ld	a,e
   4DAF 57            [ 4]  136 	ld	d,a
                            137 ;src/utils/keyboard.c:63: return (keypressed << 8) + (i - 1);
   4DB0 B7            [ 4]  138 	or	a,a
   4DB1 20 DB         [12]  139 	jr	NZ,00106$
   4DB3 57            [ 4]  140 	ld	d,a
   4DB4 1B            [ 6]  141 	dec	de
   4DB5 19            [11]  142 	add	hl,de
   4DB6                     143 00109$:
   4DB6 DD F9         [10]  144 	ld	sp, ix
   4DB8 DD E1         [14]  145 	pop	ix
   4DBA C9            [10]  146 	ret
                            147 ;src/utils/keyboard.c:66: void waitKeyUp(cpct_keyID key) {
                            148 ;	---------------------------------
                            149 ; Function waitKeyUp
                            150 ; ---------------------------------
   4DBB                     151 _waitKeyUp::
                            152 ;src/utils/keyboard.c:68: while (cpct_isKeyPressed(key)) {
   4DBB                     153 00101$:
   4DBB C1            [10]  154 	pop	bc
   4DBC E1            [10]  155 	pop	hl
   4DBD E5            [11]  156 	push	hl
   4DBE C5            [11]  157 	push	bc
   4DBF CD 52 54      [17]  158 	call	_cpct_isKeyPressed
   4DC2 7D            [ 4]  159 	ld	a,l
   4DC3 B7            [ 4]  160 	or	a, a
   4DC4 C8            [11]  161 	ret	Z
                            162 ;src/utils/keyboard.c:69: cpct_scanKeyboard_f();
   4DC5 CD D1 53      [17]  163 	call	_cpct_scanKeyboard_f
   4DC8 18 F1         [12]  164 	jr	00101$
                            165 ;src/utils/keyboard.c:73: void wait4Key(cpct_keyID key) {
                            166 ;	---------------------------------
                            167 ; Function wait4Key
                            168 ; ---------------------------------
   4DCA                     169 _wait4Key::
                            170 ;src/utils/keyboard.c:74: do
   4DCA                     171 00101$:
                            172 ;src/utils/keyboard.c:75: cpct_scanKeyboard_f();
   4DCA CD D1 53      [17]  173 	call	_cpct_scanKeyboard_f
                            174 ;src/utils/keyboard.c:76: while ( ! cpct_isKeyPressed(key) );
   4DCD C1            [10]  175 	pop	bc
   4DCE E1            [10]  176 	pop	hl
   4DCF E5            [11]  177 	push	hl
   4DD0 C5            [11]  178 	push	bc
   4DD1 CD 52 54      [17]  179 	call	_cpct_isKeyPressed
   4DD4 7D            [ 4]  180 	ld	a,l
   4DD5 B7            [ 4]  181 	or	a, a
   4DD6 28 F2         [12]  182 	jr	Z,00101$
                            183 ;src/utils/keyboard.c:77: do
   4DD8                     184 00104$:
                            185 ;src/utils/keyboard.c:78: cpct_scanKeyboard_f();
   4DD8 CD D1 53      [17]  186 	call	_cpct_scanKeyboard_f
                            187 ;src/utils/keyboard.c:79: while ( cpct_isKeyPressed(key) );
   4DDB C1            [10]  188 	pop	bc
   4DDC E1            [10]  189 	pop	hl
   4DDD E5            [11]  190 	push	hl
   4DDE C5            [11]  191 	push	bc
   4DDF CD 52 54      [17]  192 	call	_cpct_isKeyPressed
   4DE2 7D            [ 4]  193 	ld	a,l
   4DE3 B7            [ 4]  194 	or	a, a
   4DE4 20 F2         [12]  195 	jr	NZ,00104$
   4DE6 C9            [10]  196 	ret
                            197 ;src/utils/keyboard.c:82: cpct_keyID redefineKey(u8 text[]) {
                            198 ;	---------------------------------
                            199 ; Function redefineKey
                            200 ; ---------------------------------
   4DE7                     201 _redefineKey::
                            202 ;src/utils/keyboard.c:87: u8* pvideo = cpct_getScreenPtr(CPCT_VMEM_START, 39 - 10 * FONT_W, 144);
   4DE7 21 09 90      [10]  203 	ld	hl,#0x9009
   4DEA E5            [11]  204 	push	hl
   4DEB 21 00 C0      [10]  205 	ld	hl,#0xC000
   4DEE E5            [11]  206 	push	hl
   4DEF CD D0 5F      [17]  207 	call	_cpct_getScreenPtr
                            208 ;src/utils/keyboard.c:88: cpct_drawSolidBox(pvideo, cpct_px2byteM0(5,5), 15 * FONT_W, FONT_H);
   4DF2 E5            [11]  209 	push	hl
   4DF3 21 05 05      [10]  210 	ld	hl,#0x0505
   4DF6 E5            [11]  211 	push	hl
   4DF7 CD 49 56      [17]  212 	call	_cpct_px2byteM0
   4DFA 55            [ 4]  213 	ld	d,l
   4DFB C1            [10]  214 	pop	bc
   4DFC 21 2D 0B      [10]  215 	ld	hl,#0x0B2D
   4DFF E5            [11]  216 	push	hl
   4E00 D5            [11]  217 	push	de
   4E01 33            [ 6]  218 	inc	sp
   4E02 C5            [11]  219 	push	bc
   4E03 CD BB 5E      [17]  220 	call	_cpct_drawSolidBox
   4E06 F1            [10]  221 	pop	af
   4E07 F1            [10]  222 	pop	af
   4E08 33            [ 6]  223 	inc	sp
                            224 ;src/utils/keyboard.c:90: x = strlen(text);
   4E09 C1            [10]  225 	pop	bc
   4E0A E1            [10]  226 	pop	hl
   4E0B E5            [11]  227 	push	hl
   4E0C C5            [11]  228 	push	bc
   4E0D E5            [11]  229 	push	hl
   4E0E CD 73 56      [17]  230 	call	_strlen
   4E11 F1            [10]  231 	pop	af
                            232 ;src/utils/keyboard.c:92: drawText(text, 39 - ((x / 2) * FONT_W), 144,1);
   4E12 CB 3D         [ 8]  233 	srl	l
   4E14 4D            [ 4]  234 	ld	c,l
   4E15 29            [11]  235 	add	hl, hl
   4E16 09            [11]  236 	add	hl, bc
   4E17 4D            [ 4]  237 	ld	c,l
   4E18 3E 27         [ 7]  238 	ld	a,#0x27
   4E1A 91            [ 4]  239 	sub	a, c
   4E1B 47            [ 4]  240 	ld	b,a
   4E1C 21 90 01      [10]  241 	ld	hl,#0x0190
   4E1F E5            [11]  242 	push	hl
   4E20 C5            [11]  243 	push	bc
   4E21 33            [ 6]  244 	inc	sp
   4E22 21 05 00      [10]  245 	ld	hl, #5
   4E25 39            [11]  246 	add	hl, sp
   4E26 4E            [ 7]  247 	ld	c, (hl)
   4E27 23            [ 6]  248 	inc	hl
   4E28 46            [ 7]  249 	ld	b, (hl)
   4E29 C5            [11]  250 	push	bc
   4E2A CD 1C 4F      [17]  251 	call	_drawText
   4E2D F1            [10]  252 	pop	af
   4E2E F1            [10]  253 	pop	af
   4E2F 33            [ 6]  254 	inc	sp
                            255 ;src/utils/keyboard.c:94: key = esperaUnaTecla();
   4E30 CD 72 4D      [17]  256 	call	_esperaUnaTecla
                            257 ;src/utils/keyboard.c:95: waitKeyUp(key);
   4E33 E5            [11]  258 	push	hl
   4E34 E5            [11]  259 	push	hl
   4E35 CD BB 4D      [17]  260 	call	_waitKeyUp
   4E38 F1            [10]  261 	pop	af
   4E39 E1            [10]  262 	pop	hl
                            263 ;src/utils/keyboard.c:97: return key;
   4E3A C9            [10]  264 	ret
                            265 	.area _CODE
                            266 	.area _INITIALIZER
                            267 	.area _CABS (ABS)
