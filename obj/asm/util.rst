ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 ;*************************************
                              2 ; RESET
                              3 ;*************************************
                              4 
                              5 .globl _reset_cpc
   5364                       6 _reset_cpc::
   5364 CD 00 00      [17]    7 	call #0000
   5367 C9            [10]    8 	ret
                              9 
                             10 ;*************************************
                             11 ;;cpc_GetSP
                             12 ;; 
                             13 ;;void cpc_GetSp(int *buffer, char height, char width, int *origin)
                             14 ;; 
                             15 ;;Captures a screen area starting from origin and sized by width and height and copy it to buffer.
                             16 ;; 
                             17 ;;Parameters:
                             18 ;;buffer: captured data destination.
                             19 ;;height: capture height.
                             20 ;;width:  capture width.
                             21 ;;origin: capture starting address.
                             22 ;*************************************
                             23 
                             24 .globl _cpc_GetSp
   5368                      25 _cpc_GetSp::
                             26 
   5368 F1            [10]   27 	pop af
                             28 	
   5369 D1            [10]   29 	pop de
   536A C1            [10]   30 	pop bc
   536B E1            [10]   31 	pop hl
                             32 	
   536C F5            [11]   33 	push af
                             34 	
   536D 78            [ 4]   35 	ld a,b
                             36 
   536E 32 84 53      [13]   37 	LD (#loop_alto_2x_GetSp0+1),A
                             38 
   5371 D6 01         [ 7]   39 	SUB #1
   5373 2F            [ 4]   40 	CPL
   5374 32 91 53      [13]   41 	LD (#salto_lineax_GetSp0+1),A    ;comparten los 2 los mismos valores.
                             42 
   5377 FD E5         [15]   43 	push iy
   5379 CD 7F 53      [17]   44 	call _cpc_GetSp0
   537C FD E1         [14]   45 	pop iy
   537E C9            [10]   46 	ret
                             47 
   537F                      48 _cpc_GetSp0::
   537F FD                   49 	.DB #0XFD
   5380 61            [ 4]   50 	LD H,c		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   5381 06 07         [ 7]   51 	LD B,#7
   5383                      52 loop_alto_2x_GetSp0:
   5383 0E 00         [ 7]   53 	LD C,#0
   5385                      54 loop_ancho_2x_GetSp0:
   5385 7E            [ 7]   55 	LD A,(HL)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



   5386 12            [ 7]   56 	LD (DE),A
   5387 13            [ 6]   57 	INC DE
   5388 23            [ 6]   58 	INC HL
   5389 0D            [ 4]   59 	DEC C
   538A C2 85 53      [10]   60 	JP NZ,loop_ancho_2x_GetSp0
   538D FD                   61 	.DB #0XFD
   538E 25            [ 4]   62 	DEC H
   538F C8            [11]   63 	RET Z
   5390                      64 salto_lineax_GetSp0:
   5390 0E FF         [ 7]   65 	LD C,#0XFF					;salto linea menos ancho
   5392 09            [11]   66 	ADD HL,BC
   5393 D2 83 53      [10]   67 	JP NC,loop_alto_2x_GetSp0 			;si no desborda va a la siguiente linea
   5396 01 50 C0      [10]   68 	LD BC,#0XC050
   5399 09            [11]   69 	ADD HL,BC
   539A 06 07         [ 7]   70 	LD B,#7						;sólo se daría una de cada 8 veces en un sprite
   539C C3 83 53      [10]   71 	JP loop_alto_2x_GetSp0
