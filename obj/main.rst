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
                             13 	.globl _interruptHandler
                             14 	.globl _playmusic
                             15 	.globl _wait4UserKeypress
                             16 	.globl _clearScreen
                             17 	.globl _game
                             18 	.globl _drawText
                             19 	.globl _cpct_restoreState_mxor_u8
                             20 	.globl _cpct_setSeed_mxor
                             21 	.globl _cpct_akp_musicPlay
                             22 	.globl _cpct_akp_musicInit
                             23 	.globl _cpct_setPALColour
                             24 	.globl _cpct_setPalette
                             25 	.globl _cpct_fw2hw
                             26 	.globl _cpct_setVideoMode
                             27 	.globl _cpct_scanKeyboard_if
                             28 	.globl _cpct_memset
                             29 	.globl _cpct_setInterruptHandler
                             30 	.globl _cpct_disableFirmware
                             31 ;--------------------------------------------------------
                             32 ; special function registers
                             33 ;--------------------------------------------------------
                             34 ;--------------------------------------------------------
                             35 ; ram data
                             36 ;--------------------------------------------------------
                             37 	.area _DATA
   6169                      38 _interruptHandler_i_1_107:
   6169                      39 	.ds 1
                             40 ;--------------------------------------------------------
                             41 ; ram data
                             42 ;--------------------------------------------------------
                             43 	.area _INITIALIZED
                             44 ;--------------------------------------------------------
                             45 ; absolute external ram data
                             46 ;--------------------------------------------------------
                             47 	.area _DABS (ABS)
                             48 ;--------------------------------------------------------
                             49 ; global & static initialisations
                             50 ;--------------------------------------------------------
                             51 	.area _HOME
                             52 	.area _GSINIT
                             53 	.area _GSFINAL
                             54 	.area _GSINIT
                             55 ;--------------------------------------------------------
                             56 ; Home
                             57 ;--------------------------------------------------------
                             58 	.area _HOME
                             59 	.area _HOME
                             60 ;--------------------------------------------------------
                             61 ; code
                             62 ;--------------------------------------------------------
                             63 	.area _CODE
                             64 ;src/main.c:24: void playmusic() {
                             65 ;	---------------------------------
                             66 ; Function playmusic
                             67 ; ---------------------------------
   4224                      68 _playmusic::
                             69 ;src/main.c:39: __endasm;
   4224 D9            [ 4]   70 	exx
   4225 08                   71 	.db	#0x08
   4226 F5            [11]   72 	push	af
   4227 C5            [11]   73 	push	bc
   4228 D5            [11]   74 	push	de
   4229 E5            [11]   75 	push	hl
   422A CD 84 56      [17]   76 	call	_cpct_akp_musicPlay
   422D E1            [10]   77 	pop	hl
   422E D1            [10]   78 	pop	de
   422F C1            [10]   79 	pop	bc
   4230 F1            [10]   80 	pop	af
   4231 08                   81 	.db	#0x08
   4232 D9            [ 4]   82 	exx
   4233 C9            [10]   83 	ret
                             84 ;src/main.c:43: void interruptHandler() {
                             85 ;	---------------------------------
                             86 ; Function interruptHandler
                             87 ; ---------------------------------
   4234                      88 _interruptHandler::
                             89 ;src/main.c:46: i++;
   4234 21 69 61      [10]   90 	ld	hl, #_interruptHandler_i_1_107+0
   4237 34            [11]   91 	inc	(hl)
                             92 ;src/main.c:47: switch(i) {
   4238 3A 69 61      [13]   93 	ld	a,(#_interruptHandler_i_1_107 + 0)
   423B FE 05         [ 7]   94 	cp	a,#0x05
   423D CA B0 55      [10]   95 	jp	Z,_cpct_scanKeyboard_if
   4240 FE 06         [ 7]   96 	cp	a,#0x06
   4242 CA 24 42      [10]   97 	jp	Z,_playmusic
   4245 D6 09         [ 7]   98 	sub	a, #0x09
   4247 28 07         [12]   99 	jr	Z,00103$
   4249 C9            [10]  100 	ret
                            101 ;src/main.c:48: case 5: 
                            102 ;src/main.c:49: cpct_scanKeyboard_if();
                            103 ;src/main.c:50: break;
   424A C3 B0 55      [10]  104 	jp  _cpct_scanKeyboard_if
                            105 ;src/main.c:51: case 6:
                            106 ;src/main.c:53: playmusic();
                            107 ;src/main.c:54: break;
   424D C3 24 42      [10]  108 	jp  _playmusic
                            109 ;src/main.c:55: case 9:
   4250                     110 00103$:
                            111 ;src/main.c:56: i=0;
   4250 21 69 61      [10]  112 	ld	hl,#_interruptHandler_i_1_107 + 0
   4253 36 00         [10]  113 	ld	(hl), #0x00
                            114 ;src/main.c:57: }
   4255 C9            [10]  115 	ret
                            116 ;src/main.c:60: void init() {
                            117 ;	---------------------------------
                            118 ; Function init
                            119 ; ---------------------------------
   4256                     120 _init::
                            121 ;src/main.c:62: cpct_disableFirmware();
   4256 CD AB 5E      [17]  122 	call	_cpct_disableFirmware
                            123 ;src/main.c:63: cpct_setVideoMode(0);
   4259 2E 00         [ 7]  124 	ld	l,#0x00
   425B CD 3B 56      [17]  125 	call	_cpct_setVideoMode
                            126 ;src/main.c:64: cpct_fw2hw(hc_graphics_palette, 16);
   425E 21 10 00      [10]  127 	ld	hl,#0x0010
   4261 E5            [11]  128 	push	hl
   4262 21 3A 53      [10]  129 	ld	hl,#_hc_graphics_palette
   4265 E5            [11]  130 	push	hl
   4266 CD 0F 55      [17]  131 	call	_cpct_fw2hw
                            132 ;src/main.c:65: cpct_setPalette(hc_graphics_palette, 16);
   4269 21 10 00      [10]  133 	ld	hl,#0x0010
   426C E5            [11]  134 	push	hl
   426D 21 3A 53      [10]  135 	ld	hl,#_hc_graphics_palette
   4270 E5            [11]  136 	push	hl
   4271 CD 3B 54      [17]  137 	call	_cpct_setPalette
                            138 ;src/main.c:66: cpct_setBorder(HW_BLACK);
   4274 21 10 14      [10]  139 	ld	hl,#0x1410
   4277 E5            [11]  140 	push	hl
   4278 CD 5E 54      [17]  141 	call	_cpct_setPALColour
                            142 ;src/main.c:67: cpct_akp_musicInit(hc_smoke);
   427B 21 00 02      [10]  143 	ld	hl,#_hc_smoke
   427E E5            [11]  144 	push	hl
   427F CD 87 5D      [17]  145 	call	_cpct_akp_musicInit
   4282 F1            [10]  146 	pop	af
                            147 ;src/main.c:68: cpct_setInterruptHandler(interruptHandler);
   4283 21 34 42      [10]  148 	ld	hl,#_interruptHandler
   4286 CD 73 60      [17]  149 	call	_cpct_setInterruptHandler
                            150 ;src/main.c:73: cpct_akp_musicPlay();
   4289 CD 84 56      [17]  151 	call	_cpct_akp_musicPlay
                            152 ;src/main.c:75: drawText("HERO QUEST IS READY", 31, 76, 1);
   428C 21 4C 01      [10]  153 	ld	hl,#0x014C
   428F E5            [11]  154 	push	hl
   4290 3E 1F         [ 7]  155 	ld	a,#0x1F
   4292 F5            [11]  156 	push	af
   4293 33            [ 6]  157 	inc	sp
   4294 21 CC 42      [10]  158 	ld	hl,#___str_0
   4297 E5            [11]  159 	push	hl
   4298 CD 1C 4F      [17]  160 	call	_drawText
   429B F1            [10]  161 	pop	af
                            162 ;src/main.c:76: drawText("PRESS ANY KEY", 20, 90, 1);
   429C 33            [ 6]  163 	inc	sp
   429D 21 5A 01      [10]  164 	ld	hl,#0x015A
   42A0 E3            [19]  165 	ex	(sp),hl
   42A1 3E 14         [ 7]  166 	ld	a,#0x14
   42A3 F5            [11]  167 	push	af
   42A4 33            [ 6]  168 	inc	sp
   42A5 21 E0 42      [10]  169 	ld	hl,#___str_1
   42A8 E5            [11]  170 	push	hl
   42A9 CD 1C 4F      [17]  171 	call	_drawText
   42AC F1            [10]  172 	pop	af
   42AD F1            [10]  173 	pop	af
   42AE 33            [ 6]  174 	inc	sp
                            175 ;src/main.c:78: seed = wait4UserKeypress();
   42AF CD 54 4D      [17]  176 	call	_wait4UserKeypress
                            177 ;src/main.c:80: if (!seed)
   42B2 7A            [ 4]  178 	ld	a,d
   42B3 B3            [ 4]  179 	or	a, e
   42B4 B4            [ 4]  180 	or	a, h
   42B5 B5            [ 4]  181 	or	a,l
   42B6 20 0A         [12]  182 	jr	NZ,00102$
                            183 ;src/main.c:81: seed++;
   42B8 2C            [ 4]  184 	inc	l
   42B9 20 07         [12]  185 	jr	NZ,00109$
   42BB 24            [ 4]  186 	inc	h
   42BC 20 04         [12]  187 	jr	NZ,00109$
   42BE 1C            [ 4]  188 	inc	e
   42BF 20 01         [12]  189 	jr	NZ,00109$
   42C1 14            [ 4]  190 	inc	d
   42C2                     191 00109$:
   42C2                     192 00102$:
                            193 ;src/main.c:82: cpct_srand(seed);
   42C2 CD 2C 55      [17]  194 	call	_cpct_setSeed_mxor
   42C5 CD 34 55      [17]  195 	call	_cpct_restoreState_mxor_u8
                            196 ;src/main.c:84: clearScreen();
   42C8 CD 4A 53      [17]  197 	call	_clearScreen
   42CB C9            [10]  198 	ret
   42CC                     199 ___str_0:
   42CC 48 45 52 4F 20 51   200 	.ascii "HERO QUEST IS READY"
        55 45 53 54 20 49
        53 20 52 45 41 44
        59
   42DF 00                  201 	.db 0x00
   42E0                     202 ___str_1:
   42E0 50 52 45 53 53 20   203 	.ascii "PRESS ANY KEY"
        41 4E 59 20 4B 45
        59
   42ED 00                  204 	.db 0x00
                            205 ;src/main.c:88: void main(void) {
                            206 ;	---------------------------------
                            207 ; Function main
                            208 ; ---------------------------------
   42EE                     209 _main::
                            210 ;src/main.c:91: cpct_memset(CPCT_VMEM_START, 0, 0x4000);
   42EE 21 00 40      [10]  211 	ld	hl,#0x4000
   42F1 E5            [11]  212 	push	hl
   42F2 AF            [ 4]  213 	xor	a, a
   42F3 F5            [11]  214 	push	af
   42F4 33            [ 6]  215 	inc	sp
   42F5 26 C0         [ 7]  216 	ld	h, #0xC0
   42F7 E5            [11]  217 	push	hl
   42F8 CD 65 56      [17]  218 	call	_cpct_memset
                            219 ;src/main.c:93: init();
   42FB CD 56 42      [17]  220 	call	_init
                            221 ;src/main.c:95: game();
   42FE CD D7 68      [17]  222 	call	_game
   4301 C9            [10]  223 	ret
                            224 	.area _CODE
                            225 	.area _INITIALIZER
                            226 	.area _CABS (ABS)
