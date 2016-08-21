;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.5 #9498 (Mac OS X x86_64)
;--------------------------------------------------------
	.module itoa
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _itoa
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/utils/itoa.c:6: char* itoa(int value, char* result, int base) {
;	---------------------------------
; Function itoa
; ---------------------------------
_itoa::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-7
	add	hl,sp
	ld	sp,hl
;src/utils/itoa.c:9: char* ptr = result, *ptr1 = result, tmp_char;
	ld	e,6 (ix)
	ld	d,7 (ix)
	ld	-6 (ix),e
	ld	-5 (ix),d
;src/utils/itoa.c:12: if (base < 2 || base > 36) { *result = '\0'; return result; }
	ld	a,8 (ix)
	sub	a, #0x02
	ld	a,9 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00101$
	ld	a,#0x24
	cp	a, 8 (ix)
	ld	a,#0x00
	sbc	a, 9 (ix)
	jp	PO, 00140$
	xor	a, #0x80
00140$:
	jp	P,00115$
00101$:
	xor	a, a
	ld	(de),a
	ex	de,hl
	jp	00112$
;src/utils/itoa.c:14: do {
00115$:
	ld	-2 (ix),e
	ld	-1 (ix),d
00104$:
;src/utils/itoa.c:15: tmp_value = value;
	ld	a,4 (ix)
	ld	-4 (ix),a
	ld	a,5 (ix)
	ld	-3 (ix),a
;src/utils/itoa.c:16: value /= base;
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	call	__divsint
	pop	af
	pop	af
	ld	4 (ix),l
	ld	5 (ix),h
;src/utils/itoa.c:17: *ptr++ = "zyxwvutsrqponmlkjihgfedcba9876543210123456789abcdefghijklmnopqrstuvwxyz" [35 + (tmp_value - value * base)];
	ld	c,-4 (ix)
	ld	e,4 (ix)
	ld	h,8 (ix)
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00141$:
	add	hl,hl
	jr	NC,00142$
	add	hl,de
00142$:
	djnz	00141$
	ld	a,c
	sub	a, l
	add	a, #0x23
	ld	c,a
	ld	hl,#___str_0
	ld	b,#0x00
	add	hl, bc
	ld	c,(hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),c
	inc	-2 (ix)
	jr	NZ,00143$
	inc	-1 (ix)
00143$:
;src/utils/itoa.c:18: } while ( value );
	ld	a,5 (ix)
	or	a,4 (ix)
	jr	NZ,00104$
;src/utils/itoa.c:21: if (tmp_value < 0) *ptr++ = '-';
	ld	c,-2 (ix)
	ld	b,-1 (ix)
	bit	7, -3 (ix)
	jr	Z,00108$
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x2D
	ld	c,-2 (ix)
	ld	b,-1 (ix)
	inc	bc
00108$:
;src/utils/itoa.c:22: *ptr-- = '\0';
	xor	a, a
	ld	(bc),a
	dec	bc
;src/utils/itoa.c:23: while(ptr1 < ptr) {
	ld	e,-6 (ix)
	ld	d,-5 (ix)
00109$:
	ld	a,e
	sub	a, c
	ld	a,d
	sbc	a, b
	jr	NC,00111$
;src/utils/itoa.c:24: tmp_char = *ptr;
	ld	a,(bc)
	ld	-7 (ix),a
;src/utils/itoa.c:25: *ptr--= *ptr1;
	ld	a,(de)
	ld	(bc),a
	dec	bc
;src/utils/itoa.c:26: *ptr1++ = tmp_char;
	ld	a,-7 (ix)
	ld	(de),a
	inc	de
	jr	00109$
00111$:
;src/utils/itoa.c:28: return result;
	ld	l,6 (ix)
	ld	h,7 (ix)
00112$:
	ld	sp, ix
	pop	ix
	ret
___str_0:
	.ascii "zyxwvutsrqponmlkjihgfedcba9876543210123456789abcdefghijklmno"
	.ascii "pqrstuvwxyz"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
