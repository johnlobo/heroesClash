;*************************************
; RESET
;*************************************

.globl _reset_cpc
_reset_cpc::
	call #0000
	ret

;*************************************
;;cpc_GetSP
;; 
;;void cpc_GetSp(int *buffer, char height, char width, int *origin)
;; 
;;Captures a screen area starting from origin and sized by width and height and copy it to buffer.
;; 
;;Parameters:
;;buffer: captured data destination.
;;height: capture height.
;;width:  capture width.
;;origin: capture starting address.
;*************************************

.globl _cpc_GetSp
_cpc_GetSp::

	pop af
	
	pop de
	pop bc
	pop hl
	
	push af
	
	ld a,b

	LD (#loop_alto_2x_GetSp0+1),A

	SUB #1
	CPL
	LD (#salto_lineax_GetSp0+1),A    ;comparten los 2 los mismos valores.

	push iy
	call _cpc_GetSp0
	pop iy
	ret

_cpc_GetSp0::
	.DB #0XFD
	LD H,c		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
	LD B,#7
loop_alto_2x_GetSp0:
	LD C,#0
loop_ancho_2x_GetSp0:
	LD A,(HL)
	LD (DE),A
	INC DE
	INC HL
	DEC C
	JP NZ,loop_ancho_2x_GetSp0
	.DB #0XFD
	DEC H
	RET Z
salto_lineax_GetSp0:
	LD C,#0XFF					;salto linea menos ancho
	ADD HL,BC
	JP NC,loop_alto_2x_GetSp0 			;si no desborda va a la siguiente linea
	LD BC,#0XC050
	ADD HL,BC
	LD B,#7						;sólo se daría una de cada 8 veces en un sprite
	JP loop_alto_2x_GetSp0
