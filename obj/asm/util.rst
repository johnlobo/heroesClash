ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 ;*************************************
                              2 ; RESET
                              3 ;*************************************
                              4 
                              5 .globl _reset_cpc
   5396                       6 _reset_cpc::
   5396 CD 00 00      [17]    7 	call #0000
   5399 C9            [10]    8 	ret
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
   539A                      25 _cpc_GetSp::
                             26 
   539A F1            [10]   27 	pop af
                             28 	
   539B D1            [10]   29 	pop de
   539C C1            [10]   30 	pop bc
   539D E1            [10]   31 	pop hl
                             32 	
   539E F5            [11]   33 	push af
                             34 	
   539F 78            [ 4]   35 	ld a,b
                             36 
   53A0 32 B6 53      [13]   37 	LD (#loop_alto_2x_GetSp0+1),A
                             38 
   53A3 D6 01         [ 7]   39 	SUB #1
   53A5 2F            [ 4]   40 	CPL
   53A6 32 C3 53      [13]   41 	LD (#salto_lineax_GetSp0+1),A    ;comparten los 2 los mismos valores.
                             42 
   53A9 FD E5         [15]   43 	push iy
   53AB CD B1 53      [17]   44 	call _cpc_GetSp0
   53AE FD E1         [14]   45 	pop iy
   53B0 C9            [10]   46 	ret
                             47 
   53B1                      48 _cpc_GetSp0::
   53B1 FD                   49 	.DB #0XFD
   53B2 61            [ 4]   50 	LD H,c		;ALTO, SE PUEDE TRABAJAR CON HX DIRECTAMENTE
   53B3 06 07         [ 7]   51 	LD B,#7
   53B5                      52 loop_alto_2x_GetSp0:
   53B5 0E 00         [ 7]   53 	LD C,#0
   53B7                      54 loop_ancho_2x_GetSp0:
   53B7 7E            [ 7]   55 	LD A,(HL)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



   53B8 12            [ 7]   56 	LD (DE),A
   53B9 13            [ 6]   57 	INC DE
   53BA 23            [ 6]   58 	INC HL
   53BB 0D            [ 4]   59 	DEC C
   53BC C2 B7 53      [10]   60 	JP NZ,loop_ancho_2x_GetSp0
   53BF FD                   61 	.DB #0XFD
   53C0 25            [ 4]   62 	DEC H
   53C1 C8            [11]   63 	RET Z
   53C2                      64 salto_lineax_GetSp0:
   53C2 0E FF         [ 7]   65 	LD C,#0XFF					;salto linea menos ancho
   53C4 09            [11]   66 	ADD HL,BC
   53C5 D2 B5 53      [10]   67 	JP NC,loop_alto_2x_GetSp0 			;si no desborda va a la siguiente linea
   53C8 01 50 C0      [10]   68 	LD BC,#0XC050
   53CB 09            [11]   69 	ADD HL,BC
   53CC 06 07         [ 7]   70 	LD B,#7						;sólo se daría una de cada 8 veces en un sprite
   53CE C3 B5 53      [10]   71 	JP loop_alto_2x_GetSp0
