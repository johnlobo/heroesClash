;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.5 #9498 (Mac OS X x86_64)
;--------------------------------------------------------
	.module walls
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _hc_walls_2
	.globl _hc_walls_1
	.globl _hc_walls_0
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
	.area _CODE
_hc_walls_0:
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x45	; 69	'E'
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0xCF	; 207
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x82	; 130
	.db #0x00	; 0
	.db #0x8A	; 138
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x82	; 130
	.db #0x45	; 69	'E'
	.db #0x8A	; 138
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0xC3	; 195
	.db #0xCF	; 207
	.db #0x8A	; 138
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0xCF	; 207
	.db #0xCF	; 207
	.db #0x8A	; 138
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0xCF	; 207
	.db #0xCF	; 207
	.db #0x00	; 0
	.db #0x45	; 69	'E'
	.db #0x03	; 3
	.db #0xCB	; 203
	.db #0xCF	; 207
	.db #0x00	; 0
	.db #0xCF	; 207
	.db #0x03	; 3
	.db #0x47	; 71	'G'
	.db #0xCF	; 207
	.db #0x8A	; 138
	.db #0xCF	; 207
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x47	; 71	'G'
	.db #0xCF	; 207
_hc_walls_1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x8A	; 138
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x82	; 130
	.db #0x45	; 69	'E'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xC3	; 195
	.db #0xCF	; 207
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x45	; 69	'E'
	.db #0x8A	; 138
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xCF	; 207
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xCB	; 203
	.db #0x8A	; 138
	.db #0x00	; 0
	.db #0xCF	; 207
	.db #0x03	; 3
	.db #0x47	; 71	'G'
	.db #0xCF	; 207
	.db #0x00	; 0
	.db #0x8A	; 138
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0xCF	; 207
_hc_walls_2:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x45	; 69	'E'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x82	; 130
	.db #0x8A	; 138
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x8A	; 138
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x45	; 69	'E'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x41	; 65	'A'
	.db #0x8A	; 138
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x47	; 71	'G'
	.db #0x8A	; 138
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.area _INITIALIZER
	.area _CABS (ABS)