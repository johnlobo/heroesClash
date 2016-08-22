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
   4CF4                      61 _wait4UserKeypress::
                             62 ;src/utils/keyboard.c:36: do {
   4CF4 21 00 00      [10]   63 	ld	hl,#0x0000
   4CF7 5D            [ 4]   64 	ld	e,l
   4CF8 54            [ 4]   65 	ld	d,h
   4CF9                      66 00101$:
                             67 ;src/utils/keyboard.c:37: c++;                       // One more cycle
   4CF9 2C            [ 4]   68 	inc	l
   4CFA 20 07         [12]   69 	jr	NZ,00115$
   4CFC 24            [ 4]   70 	inc	h
   4CFD 20 04         [12]   71 	jr	NZ,00115$
   4CFF 1C            [ 4]   72 	inc	e
   4D00 20 01         [12]   73 	jr	NZ,00115$
   4D02 14            [ 4]   74 	inc	d
   4D03                      75 00115$:
                             76 ;src/utils/keyboard.c:38: cpct_scanKeyboard_f();     // Scan the scan the keyboard
   4D03 E5            [11]   77 	push	hl
   4D04 D5            [11]   78 	push	de
   4D05 CD 92 53      [17]   79 	call	_cpct_scanKeyboard_f
   4D08 CD B8 55      [17]   80 	call	_cpct_isAnyKeyPressed_f
   4D0B 7D            [ 4]   81 	ld	a,l
   4D0C D1            [10]   82 	pop	de
   4D0D E1            [10]   83 	pop	hl
   4D0E B7            [ 4]   84 	or	a, a
   4D0F 28 E8         [12]   85 	jr	Z,00101$
                             86 ;src/utils/keyboard.c:41: return c;
   4D11 C9            [10]   87 	ret
                             88 ;src/utils/keyboard.c:45: cpct_keyID esperaUnaTecla() {
                             89 ;	---------------------------------
                             90 ; Function esperaUnaTecla
                             91 ; ---------------------------------
   4D12                      92 _esperaUnaTecla::
   4D12 DD E5         [15]   93 	push	ix
   4D14 DD 21 00 00   [14]   94 	ld	ix,#0
   4D18 DD 39         [15]   95 	add	ix,sp
   4D1A F5            [11]   96 	push	af
                             97 ;src/utils/keyboard.c:48: u8 i = 10, *keys = cpct_keyboardStatusBuffer + 9;
   4D1B 16 0A         [ 7]   98 	ld	d,#0x0A
                             99 ;src/utils/keyboard.c:52: do { cpct_scanKeyboard(); } while ( ! cpct_isAnyKeyPressed() );
   4D1D                     100 00101$:
   4D1D D5            [11]  101 	push	de
   4D1E CD E3 56      [17]  102 	call	_cpct_scanKeyboard
   4D21 CD 3B 55      [17]  103 	call	_cpct_isAnyKeyPressed
   4D24 D1            [10]  104 	pop	de
   4D25 7D            [ 4]  105 	ld	a,l
   4D26 B7            [ 4]  106 	or	a, a
   4D27 28 F4         [12]  107 	jr	Z,00101$
                            108 ;src/utils/keyboard.c:55: do {
   4D29 01 C9 54      [10]  109 	ld	bc,#(_cpct_keyboardStatusBuffer + 0x0009)
   4D2C 1E 0A         [ 7]  110 	ld	e,#0x0A
   4D2E                     111 00106$:
                            112 ;src/utils/keyboard.c:58: keypressed = *keys ^ 0xFF;
   4D2E 0A            [ 7]  113 	ld	a,(bc)
   4D2F EE FF         [ 7]  114 	xor	a, #0xFF
   4D31 DD 77 FE      [19]  115 	ld	-2 (ix),a
   4D34 DD 36 FF 00   [19]  116 	ld	-1 (ix),#0x00
                            117 ;src/utils/keyboard.c:60: return (keypressed << 8) + (i - 1);  // Formato cpct_keyID: 8 primeros bits = máscara de tecla, 8 siguientes fila del teclado (0-9)
   4D38 DD 66 FE      [19]  118 	ld	h,-2 (ix)
   4D3B 2E 00         [ 7]  119 	ld	l,#0x00
                            120 ;src/utils/keyboard.c:59: if (keypressed)
   4D3D DD 7E FF      [19]  121 	ld	a,-1 (ix)
   4D40 DD B6 FE      [19]  122 	or	a,-2 (ix)
   4D43 28 07         [12]  123 	jr	Z,00105$
                            124 ;src/utils/keyboard.c:60: return (keypressed << 8) + (i - 1);  // Formato cpct_keyID: 8 primeros bits = máscara de tecla, 8 siguientes fila del teclado (0-9)
   4D45 4A            [ 4]  125 	ld	c,d
   4D46 06 00         [ 7]  126 	ld	b,#0x00
   4D48 0B            [ 6]  127 	dec	bc
   4D49 09            [11]  128 	add	hl,bc
   4D4A 18 0A         [12]  129 	jr	00109$
   4D4C                     130 00105$:
                            131 ;src/utils/keyboard.c:61: keys--;
   4D4C 0B            [ 6]  132 	dec	bc
                            133 ;src/utils/keyboard.c:62: } while (--i);
   4D4D 1D            [ 4]  134 	dec	e
   4D4E 7B            [ 4]  135 	ld	a,e
   4D4F 57            [ 4]  136 	ld	d,a
                            137 ;src/utils/keyboard.c:63: return (keypressed << 8) + (i - 1);
   4D50 B7            [ 4]  138 	or	a,a
   4D51 20 DB         [12]  139 	jr	NZ,00106$
   4D53 57            [ 4]  140 	ld	d,a
   4D54 1B            [ 6]  141 	dec	de
   4D55 19            [11]  142 	add	hl,de
   4D56                     143 00109$:
   4D56 DD F9         [10]  144 	ld	sp, ix
   4D58 DD E1         [14]  145 	pop	ix
   4D5A C9            [10]  146 	ret
                            147 ;src/utils/keyboard.c:66: void waitKeyUp(cpct_keyID key) {
                            148 ;	---------------------------------
                            149 ; Function waitKeyUp
                            150 ; ---------------------------------
   4D5B                     151 _waitKeyUp::
                            152 ;src/utils/keyboard.c:68: while (cpct_isKeyPressed(key)) {
   4D5B                     153 00101$:
   4D5B C1            [10]  154 	pop	bc
   4D5C E1            [10]  155 	pop	hl
   4D5D E5            [11]  156 	push	hl
   4D5E C5            [11]  157 	push	bc
   4D5F CD 86 53      [17]  158 	call	_cpct_isKeyPressed
   4D62 7D            [ 4]  159 	ld	a,l
   4D63 B7            [ 4]  160 	or	a, a
   4D64 C8            [11]  161 	ret	Z
                            162 ;src/utils/keyboard.c:69: cpct_scanKeyboard_f();
   4D65 CD 92 53      [17]  163 	call	_cpct_scanKeyboard_f
   4D68 18 F1         [12]  164 	jr	00101$
                            165 ;src/utils/keyboard.c:73: void wait4Key(cpct_keyID key) {
                            166 ;	---------------------------------
                            167 ; Function wait4Key
                            168 ; ---------------------------------
   4D6A                     169 _wait4Key::
                            170 ;src/utils/keyboard.c:74: do
   4D6A                     171 00101$:
                            172 ;src/utils/keyboard.c:75: cpct_scanKeyboard_f();
   4D6A CD 92 53      [17]  173 	call	_cpct_scanKeyboard_f
                            174 ;src/utils/keyboard.c:76: while ( ! cpct_isKeyPressed(key) );
   4D6D C1            [10]  175 	pop	bc
   4D6E E1            [10]  176 	pop	hl
   4D6F E5            [11]  177 	push	hl
   4D70 C5            [11]  178 	push	bc
   4D71 CD 86 53      [17]  179 	call	_cpct_isKeyPressed
   4D74 7D            [ 4]  180 	ld	a,l
   4D75 B7            [ 4]  181 	or	a, a
   4D76 28 F2         [12]  182 	jr	Z,00101$
                            183 ;src/utils/keyboard.c:77: do
   4D78                     184 00104$:
                            185 ;src/utils/keyboard.c:78: cpct_scanKeyboard_f();
   4D78 CD 92 53      [17]  186 	call	_cpct_scanKeyboard_f
                            187 ;src/utils/keyboard.c:79: while ( cpct_isKeyPressed(key) );
   4D7B C1            [10]  188 	pop	bc
   4D7C E1            [10]  189 	pop	hl
   4D7D E5            [11]  190 	push	hl
   4D7E C5            [11]  191 	push	bc
   4D7F CD 86 53      [17]  192 	call	_cpct_isKeyPressed
   4D82 7D            [ 4]  193 	ld	a,l
   4D83 B7            [ 4]  194 	or	a, a
   4D84 20 F2         [12]  195 	jr	NZ,00104$
   4D86 C9            [10]  196 	ret
                            197 ;src/utils/keyboard.c:82: cpct_keyID redefineKey(u8 text[]) {
                            198 ;	---------------------------------
                            199 ; Function redefineKey
                            200 ; ---------------------------------
   4D87                     201 _redefineKey::
                            202 ;src/utils/keyboard.c:87: u8* pvideo = cpct_getScreenPtr(CPCT_VMEM_START, 39 - 10 * FONT_W, 144);
   4D87 21 09 90      [10]  203 	ld	hl,#0x9009
   4D8A E5            [11]  204 	push	hl
   4D8B 21 00 C0      [10]  205 	ld	hl,#0xC000
   4D8E E5            [11]  206 	push	hl
   4D8F CD 14 57      [17]  207 	call	_cpct_getScreenPtr
                            208 ;src/utils/keyboard.c:88: cpct_drawSolidBox(pvideo, cpct_px2byteM0(5,5), 15 * FONT_W, FONT_H);
   4D92 E5            [11]  209 	push	hl
   4D93 21 05 05      [10]  210 	ld	hl,#0x0505
   4D96 E5            [11]  211 	push	hl
   4D97 CD E1 55      [17]  212 	call	_cpct_px2byteM0
   4D9A 55            [ 4]  213 	ld	d,l
   4D9B C1            [10]  214 	pop	bc
   4D9C 21 2D 0B      [10]  215 	ld	hl,#0x0B2D
   4D9F E5            [11]  216 	push	hl
   4DA0 D5            [11]  217 	push	de
   4DA1 33            [ 6]  218 	inc	sp
   4DA2 C5            [11]  219 	push	bc
   4DA3 CD 2A 56      [17]  220 	call	_cpct_drawSolidBox
   4DA6 F1            [10]  221 	pop	af
   4DA7 F1            [10]  222 	pop	af
   4DA8 33            [ 6]  223 	inc	sp
                            224 ;src/utils/keyboard.c:90: x = strlen(text);
   4DA9 C1            [10]  225 	pop	bc
   4DAA E1            [10]  226 	pop	hl
   4DAB E5            [11]  227 	push	hl
   4DAC C5            [11]  228 	push	bc
   4DAD E5            [11]  229 	push	hl
   4DAE CD 0B 56      [17]  230 	call	_strlen
   4DB1 F1            [10]  231 	pop	af
                            232 ;src/utils/keyboard.c:92: drawText(text, 39 - ((x / 2) * FONT_W), 144,1);
   4DB2 CB 3D         [ 8]  233 	srl	l
   4DB4 4D            [ 4]  234 	ld	c,l
   4DB5 29            [11]  235 	add	hl, hl
   4DB6 09            [11]  236 	add	hl, bc
   4DB7 4D            [ 4]  237 	ld	c,l
   4DB8 3E 27         [ 7]  238 	ld	a,#0x27
   4DBA 91            [ 4]  239 	sub	a, c
   4DBB 47            [ 4]  240 	ld	b,a
   4DBC 21 90 01      [10]  241 	ld	hl,#0x0190
   4DBF E5            [11]  242 	push	hl
   4DC0 C5            [11]  243 	push	bc
   4DC1 33            [ 6]  244 	inc	sp
   4DC2 21 05 00      [10]  245 	ld	hl, #5
   4DC5 39            [11]  246 	add	hl, sp
   4DC6 4E            [ 7]  247 	ld	c, (hl)
   4DC7 23            [ 6]  248 	inc	hl
   4DC8 46            [ 7]  249 	ld	b, (hl)
   4DC9 C5            [11]  250 	push	bc
   4DCA CD BA 4E      [17]  251 	call	_drawText
   4DCD F1            [10]  252 	pop	af
   4DCE F1            [10]  253 	pop	af
   4DCF 33            [ 6]  254 	inc	sp
                            255 ;src/utils/keyboard.c:94: key = esperaUnaTecla();
   4DD0 CD 12 4D      [17]  256 	call	_esperaUnaTecla
                            257 ;src/utils/keyboard.c:95: waitKeyUp(key);
   4DD3 E5            [11]  258 	push	hl
   4DD4 E5            [11]  259 	push	hl
   4DD5 CD 5B 4D      [17]  260 	call	_waitKeyUp
   4DD8 F1            [10]  261 	pop	af
   4DD9 E1            [10]  262 	pop	hl
                            263 ;src/utils/keyboard.c:97: return key;
   4DDA C9            [10]  264 	ret
                            265 	.area _CODE
                            266 	.area _INITIALIZER
                            267 	.area _CABS (ABS)
