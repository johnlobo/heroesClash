                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.5 #9498 (Mac OS X x86_64)
                              4 ;--------------------------------------------------------
                              5 	.module itoa
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _itoa
                             12 ;--------------------------------------------------------
                             13 ; special function registers
                             14 ;--------------------------------------------------------
                             15 ;--------------------------------------------------------
                             16 ; ram data
                             17 ;--------------------------------------------------------
                             18 	.area _DATA
                             19 ;--------------------------------------------------------
                             20 ; ram data
                             21 ;--------------------------------------------------------
                             22 	.area _INITIALIZED
                             23 ;--------------------------------------------------------
                             24 ; absolute external ram data
                             25 ;--------------------------------------------------------
                             26 	.area _DABS (ABS)
                             27 ;--------------------------------------------------------
                             28 ; global & static initialisations
                             29 ;--------------------------------------------------------
                             30 	.area _HOME
                             31 	.area _GSINIT
                             32 	.area _GSFINAL
                             33 	.area _GSINIT
                             34 ;--------------------------------------------------------
                             35 ; Home
                             36 ;--------------------------------------------------------
                             37 	.area _HOME
                             38 	.area _HOME
                             39 ;--------------------------------------------------------
                             40 ; code
                             41 ;--------------------------------------------------------
                             42 	.area _CODE
                             43 ;src/utils/itoa.c:6: char* itoa(int value, char* result, int base) {
                             44 ;	---------------------------------
                             45 ; Function itoa
                             46 ; ---------------------------------
   4C27                      47 _itoa::
   4C27 DD E5         [15]   48 	push	ix
   4C29 DD 21 00 00   [14]   49 	ld	ix,#0
   4C2D DD 39         [15]   50 	add	ix,sp
   4C2F 21 F9 FF      [10]   51 	ld	hl,#-7
   4C32 39            [11]   52 	add	hl,sp
   4C33 F9            [ 6]   53 	ld	sp,hl
                             54 ;src/utils/itoa.c:9: char* ptr = result, *ptr1 = result, tmp_char;
   4C34 DD 5E 06      [19]   55 	ld	e,6 (ix)
   4C37 DD 56 07      [19]   56 	ld	d,7 (ix)
   4C3A DD 73 FA      [19]   57 	ld	-6 (ix),e
   4C3D DD 72 FB      [19]   58 	ld	-5 (ix),d
                             59 ;src/utils/itoa.c:12: if (base < 2 || base > 36) { *result = '\0'; return result; }
   4C40 DD 7E 08      [19]   60 	ld	a,8 (ix)
   4C43 D6 02         [ 7]   61 	sub	a, #0x02
   4C45 DD 7E 09      [19]   62 	ld	a,9 (ix)
   4C48 17            [ 4]   63 	rla
   4C49 3F            [ 4]   64 	ccf
   4C4A 1F            [ 4]   65 	rra
   4C4B DE 80         [ 7]   66 	sbc	a, #0x80
   4C4D 38 12         [12]   67 	jr	C,00101$
   4C4F 3E 24         [ 7]   68 	ld	a,#0x24
   4C51 DD BE 08      [19]   69 	cp	a, 8 (ix)
   4C54 3E 00         [ 7]   70 	ld	a,#0x00
   4C56 DD 9E 09      [19]   71 	sbc	a, 9 (ix)
   4C59 E2 5E 4C      [10]   72 	jp	PO, 00140$
   4C5C EE 80         [ 7]   73 	xor	a, #0x80
   4C5E                      74 00140$:
   4C5E F2 67 4C      [10]   75 	jp	P,00115$
   4C61                      76 00101$:
   4C61 AF            [ 4]   77 	xor	a, a
   4C62 12            [ 7]   78 	ld	(de),a
   4C63 EB            [ 4]   79 	ex	de,hl
   4C64 C3 07 4D      [10]   80 	jp	00112$
                             81 ;src/utils/itoa.c:14: do {
   4C67                      82 00115$:
   4C67 DD 73 FE      [19]   83 	ld	-2 (ix),e
   4C6A DD 72 FF      [19]   84 	ld	-1 (ix),d
   4C6D                      85 00104$:
                             86 ;src/utils/itoa.c:15: tmp_value = value;
   4C6D DD 7E 04      [19]   87 	ld	a,4 (ix)
   4C70 DD 77 FC      [19]   88 	ld	-4 (ix),a
   4C73 DD 7E 05      [19]   89 	ld	a,5 (ix)
   4C76 DD 77 FD      [19]   90 	ld	-3 (ix),a
                             91 ;src/utils/itoa.c:16: value /= base;
   4C79 DD 6E 08      [19]   92 	ld	l,8 (ix)
   4C7C DD 66 09      [19]   93 	ld	h,9 (ix)
   4C7F E5            [11]   94 	push	hl
   4C80 DD 6E FC      [19]   95 	ld	l,-4 (ix)
   4C83 DD 66 FD      [19]   96 	ld	h,-3 (ix)
   4C86 E5            [11]   97 	push	hl
   4C87 CD 2B 60      [17]   98 	call	__divsint
   4C8A F1            [10]   99 	pop	af
   4C8B F1            [10]  100 	pop	af
   4C8C DD 75 04      [19]  101 	ld	4 (ix),l
   4C8F DD 74 05      [19]  102 	ld	5 (ix),h
                            103 ;src/utils/itoa.c:17: *ptr++ = "zyxwvutsrqponmlkjihgfedcba9876543210123456789abcdefghijklmnopqrstuvwxyz" [35 + (tmp_value - value * base)];
   4C92 DD 4E FC      [19]  104 	ld	c,-4 (ix)
   4C95 DD 5E 04      [19]  105 	ld	e,4 (ix)
   4C98 DD 66 08      [19]  106 	ld	h,8 (ix)
   4C9B 2E 00         [ 7]  107 	ld	l, #0x00
   4C9D 55            [ 4]  108 	ld	d, l
   4C9E 06 08         [ 7]  109 	ld	b, #0x08
   4CA0                     110 00141$:
   4CA0 29            [11]  111 	add	hl,hl
   4CA1 30 01         [12]  112 	jr	NC,00142$
   4CA3 19            [11]  113 	add	hl,de
   4CA4                     114 00142$:
   4CA4 10 FA         [13]  115 	djnz	00141$
   4CA6 79            [ 4]  116 	ld	a,c
   4CA7 95            [ 4]  117 	sub	a, l
   4CA8 C6 23         [ 7]  118 	add	a, #0x23
   4CAA 4F            [ 4]  119 	ld	c,a
   4CAB 21 0C 4D      [10]  120 	ld	hl,#___str_0
   4CAE 06 00         [ 7]  121 	ld	b,#0x00
   4CB0 09            [11]  122 	add	hl, bc
   4CB1 4E            [ 7]  123 	ld	c,(hl)
   4CB2 DD 6E FE      [19]  124 	ld	l,-2 (ix)
   4CB5 DD 66 FF      [19]  125 	ld	h,-1 (ix)
   4CB8 71            [ 7]  126 	ld	(hl),c
   4CB9 DD 34 FE      [23]  127 	inc	-2 (ix)
   4CBC 20 03         [12]  128 	jr	NZ,00143$
   4CBE DD 34 FF      [23]  129 	inc	-1 (ix)
   4CC1                     130 00143$:
                            131 ;src/utils/itoa.c:18: } while ( value );
   4CC1 DD 7E 05      [19]  132 	ld	a,5 (ix)
   4CC4 DD B6 04      [19]  133 	or	a,4 (ix)
   4CC7 20 A4         [12]  134 	jr	NZ,00104$
                            135 ;src/utils/itoa.c:21: if (tmp_value < 0) *ptr++ = '-';
   4CC9 DD 4E FE      [19]  136 	ld	c,-2 (ix)
   4CCC DD 46 FF      [19]  137 	ld	b,-1 (ix)
   4CCF DD CB FD 7E   [20]  138 	bit	7, -3 (ix)
   4CD3 28 0F         [12]  139 	jr	Z,00108$
   4CD5 DD 6E FE      [19]  140 	ld	l,-2 (ix)
   4CD8 DD 66 FF      [19]  141 	ld	h,-1 (ix)
   4CDB 36 2D         [10]  142 	ld	(hl),#0x2D
   4CDD DD 4E FE      [19]  143 	ld	c,-2 (ix)
   4CE0 DD 46 FF      [19]  144 	ld	b,-1 (ix)
   4CE3 03            [ 6]  145 	inc	bc
   4CE4                     146 00108$:
                            147 ;src/utils/itoa.c:22: *ptr-- = '\0';
   4CE4 AF            [ 4]  148 	xor	a, a
   4CE5 02            [ 7]  149 	ld	(bc),a
   4CE6 0B            [ 6]  150 	dec	bc
                            151 ;src/utils/itoa.c:23: while(ptr1 < ptr) {
   4CE7 DD 5E FA      [19]  152 	ld	e,-6 (ix)
   4CEA DD 56 FB      [19]  153 	ld	d,-5 (ix)
   4CED                     154 00109$:
   4CED 7B            [ 4]  155 	ld	a,e
   4CEE 91            [ 4]  156 	sub	a, c
   4CEF 7A            [ 4]  157 	ld	a,d
   4CF0 98            [ 4]  158 	sbc	a, b
   4CF1 30 0E         [12]  159 	jr	NC,00111$
                            160 ;src/utils/itoa.c:24: tmp_char = *ptr;
   4CF3 0A            [ 7]  161 	ld	a,(bc)
   4CF4 DD 77 F9      [19]  162 	ld	-7 (ix),a
                            163 ;src/utils/itoa.c:25: *ptr--= *ptr1;
   4CF7 1A            [ 7]  164 	ld	a,(de)
   4CF8 02            [ 7]  165 	ld	(bc),a
   4CF9 0B            [ 6]  166 	dec	bc
                            167 ;src/utils/itoa.c:26: *ptr1++ = tmp_char;
   4CFA DD 7E F9      [19]  168 	ld	a,-7 (ix)
   4CFD 12            [ 7]  169 	ld	(de),a
   4CFE 13            [ 6]  170 	inc	de
   4CFF 18 EC         [12]  171 	jr	00109$
   4D01                     172 00111$:
                            173 ;src/utils/itoa.c:28: return result;
   4D01 DD 6E 06      [19]  174 	ld	l,6 (ix)
   4D04 DD 66 07      [19]  175 	ld	h,7 (ix)
   4D07                     176 00112$:
   4D07 DD F9         [10]  177 	ld	sp, ix
   4D09 DD E1         [14]  178 	pop	ix
   4D0B C9            [10]  179 	ret
   4D0C                     180 ___str_0:
   4D0C 7A 79 78 77 76 75   181 	.ascii "zyxwvutsrqponmlkjihgfedcba9876543210123456789abcdefghijklmno"
        74 73 72 71 70 6F
        6E 6D 6C 6B 6A 69
        68 67 66 65 64 63
        62 61 39 38 37 36
        35 34 33 32 31 30
        31 32 33 34 35 36
        37 38 39 61 62 63
        64 65 66 67 68 69
        6A 6B 6C 6D 6E 6F
   4D48 70 71 72 73 74 75   182 	.ascii "pqrstuvwxyz"
        76 77 78 79 7A
   4D53 00                  183 	.db 0x00
                            184 	.area _CODE
                            185 	.area _INITIALIZER
                            186 	.area _CABS (ABS)
