                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.5 #9498 (Mac OS X x86_64)
                              4 ;--------------------------------------------------------
                              5 	.module symbols
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _g_tile_symbols_4
                             12 	.globl _g_tile_symbols_3
                             13 	.globl _g_tile_symbols_2
                             14 	.globl _g_tile_symbols_1
                             15 ;--------------------------------------------------------
                             16 ; special function registers
                             17 ;--------------------------------------------------------
                             18 ;--------------------------------------------------------
                             19 ; ram data
                             20 ;--------------------------------------------------------
                             21 	.area _DATA
                             22 ;--------------------------------------------------------
                             23 ; ram data
                             24 ;--------------------------------------------------------
                             25 	.area _INITIALIZED
                             26 ;--------------------------------------------------------
                             27 ; absolute external ram data
                             28 ;--------------------------------------------------------
                             29 	.area _DABS (ABS)
                             30 ;--------------------------------------------------------
                             31 ; global & static initialisations
                             32 ;--------------------------------------------------------
                             33 	.area _HOME
                             34 	.area _GSINIT
                             35 	.area _GSFINAL
                             36 	.area _GSINIT
                             37 ;--------------------------------------------------------
                             38 ; Home
                             39 ;--------------------------------------------------------
                             40 	.area _HOME
                             41 	.area _HOME
                             42 ;--------------------------------------------------------
                             43 ; code
                             44 ;--------------------------------------------------------
                             45 	.area _CODE
                             46 	.area _CODE
   4BA3                      47 _g_tile_symbols_1:
   4BA3 F0                   48 	.db #0xF0	; 240
   4BA4 78                   49 	.db #0x78	; 120	'x'
   4BA5 F0                   50 	.db #0xF0	; 240
   4BA6 F0                   51 	.db #0xF0	; 240
   4BA7 78                   52 	.db #0x78	; 120	'x'
   4BA8 F0                   53 	.db #0xF0	; 240
   4BA9 F0                   54 	.db #0xF0	; 240
   4BAA 78                   55 	.db #0x78	; 120	'x'
   4BAB F0                   56 	.db #0xF0	; 240
   4BAC B4                   57 	.db #0xB4	; 180
   4BAD 3C                   58 	.db #0x3C	; 60
   4BAE F0                   59 	.db #0xF0	; 240
   4BAF B4                   60 	.db #0xB4	; 180
   4BB0 3C                   61 	.db #0x3C	; 60
   4BB1 F0                   62 	.db #0xF0	; 240
   4BB2 3C                   63 	.db #0x3C	; 60
   4BB3 3C                   64 	.db #0x3C	; 60
   4BB4 78                   65 	.db #0x78	; 120	'x'
   4BB5 0C                   66 	.db #0x0C	; 12
   4BB6 0C                   67 	.db #0x0C	; 12
   4BB7 58                   68 	.db #0x58	; 88	'X'
   4BB8 F0                   69 	.db #0xF0	; 240
   4BB9 58                   70 	.db #0x58	; 88	'X'
   4BBA F0                   71 	.db #0xF0	; 240
   4BBB F0                   72 	.db #0xF0	; 240
   4BBC 58                   73 	.db #0x58	; 88	'X'
   4BBD F0                   74 	.db #0xF0	; 240
   4BBE F0                   75 	.db #0xF0	; 240
   4BBF 58                   76 	.db #0x58	; 88	'X'
   4BC0 F0                   77 	.db #0xF0	; 240
   4BC1 F0                   78 	.db #0xF0	; 240
   4BC2 58                   79 	.db #0x58	; 88	'X'
   4BC3 F0                   80 	.db #0xF0	; 240
   4BC4                      81 _g_tile_symbols_2:
   4BC4 F0                   82 	.db #0xF0	; 240
   4BC5 58                   83 	.db #0x58	; 88	'X'
   4BC6 F0                   84 	.db #0xF0	; 240
   4BC7 F0                   85 	.db #0xF0	; 240
   4BC8 58                   86 	.db #0x58	; 88	'X'
   4BC9 F0                   87 	.db #0xF0	; 240
   4BCA F0                   88 	.db #0xF0	; 240
   4BCB 58                   89 	.db #0x58	; 88	'X'
   4BCC F0                   90 	.db #0xF0	; 240
   4BCD F0                   91 	.db #0xF0	; 240
   4BCE 58                   92 	.db #0x58	; 88	'X'
   4BCF F0                   93 	.db #0xF0	; 240
   4BD0 0C                   94 	.db #0x0C	; 12
   4BD1 0C                   95 	.db #0x0C	; 12
   4BD2 58                   96 	.db #0x58	; 88	'X'
   4BD3 3C                   97 	.db #0x3C	; 60
   4BD4 3C                   98 	.db #0x3C	; 60
   4BD5 78                   99 	.db #0x78	; 120	'x'
   4BD6 B4                  100 	.db #0xB4	; 180
   4BD7 3C                  101 	.db #0x3C	; 60
   4BD8 F0                  102 	.db #0xF0	; 240
   4BD9 B4                  103 	.db #0xB4	; 180
   4BDA 3C                  104 	.db #0x3C	; 60
   4BDB F0                  105 	.db #0xF0	; 240
   4BDC F0                  106 	.db #0xF0	; 240
   4BDD 78                  107 	.db #0x78	; 120	'x'
   4BDE F0                  108 	.db #0xF0	; 240
   4BDF F0                  109 	.db #0xF0	; 240
   4BE0 78                  110 	.db #0x78	; 120	'x'
   4BE1 F0                  111 	.db #0xF0	; 240
   4BE2 F0                  112 	.db #0xF0	; 240
   4BE3 78                  113 	.db #0x78	; 120	'x'
   4BE4 F0                  114 	.db #0xF0	; 240
   4BE5                     115 _g_tile_symbols_3:
   4BE5 F0                  116 	.db #0xF0	; 240
   4BE6 F0                  117 	.db #0xF0	; 240
   4BE7 F0                  118 	.db #0xF0	; 240
   4BE8 F0                  119 	.db #0xF0	; 240
   4BE9 F0                  120 	.db #0xF0	; 240
   4BEA F0                  121 	.db #0xF0	; 240
   4BEB F0                  122 	.db #0xF0	; 240
   4BEC 78                  123 	.db #0x78	; 120	'x'
   4BED F0                  124 	.db #0xF0	; 240
   4BEE F0                  125 	.db #0xF0	; 240
   4BEF 3C                  126 	.db #0x3C	; 60
   4BF0 F0                  127 	.db #0xF0	; 240
   4BF1 F0                  128 	.db #0xF0	; 240
   4BF2 3C                  129 	.db #0x3C	; 60
   4BF3 78                  130 	.db #0x78	; 120	'x'
   4BF4 3C                  131 	.db #0x3C	; 60
   4BF5 3C                  132 	.db #0x3C	; 60
   4BF6 3C                  133 	.db #0x3C	; 60
   4BF7 F0                  134 	.db #0xF0	; 240
   4BF8 0C                  135 	.db #0x0C	; 12
   4BF9 58                  136 	.db #0x58	; 88	'X'
   4BFA F0                  137 	.db #0xF0	; 240
   4BFB 0C                  138 	.db #0x0C	; 12
   4BFC F0                  139 	.db #0xF0	; 240
   4BFD F0                  140 	.db #0xF0	; 240
   4BFE 58                  141 	.db #0x58	; 88	'X'
   4BFF F0                  142 	.db #0xF0	; 240
   4C00 F0                  143 	.db #0xF0	; 240
   4C01 F0                  144 	.db #0xF0	; 240
   4C02 F0                  145 	.db #0xF0	; 240
   4C03 F0                  146 	.db #0xF0	; 240
   4C04 F0                  147 	.db #0xF0	; 240
   4C05 F0                  148 	.db #0xF0	; 240
   4C06                     149 _g_tile_symbols_4:
   4C06 F0                  150 	.db #0xF0	; 240
   4C07 F0                  151 	.db #0xF0	; 240
   4C08 F0                  152 	.db #0xF0	; 240
   4C09 F0                  153 	.db #0xF0	; 240
   4C0A F0                  154 	.db #0xF0	; 240
   4C0B F0                  155 	.db #0xF0	; 240
   4C0C F0                  156 	.db #0xF0	; 240
   4C0D B4                  157 	.db #0xB4	; 180
   4C0E F0                  158 	.db #0xF0	; 240
   4C0F F0                  159 	.db #0xF0	; 240
   4C10 3C                  160 	.db #0x3C	; 60
   4C11 F0                  161 	.db #0xF0	; 240
   4C12 B4                  162 	.db #0xB4	; 180
   4C13 3C                  163 	.db #0x3C	; 60
   4C14 F0                  164 	.db #0xF0	; 240
   4C15 3C                  165 	.db #0x3C	; 60
   4C16 3C                  166 	.db #0x3C	; 60
   4C17 3C                  167 	.db #0x3C	; 60
   4C18 A4                  168 	.db #0xA4	; 164
   4C19 0C                  169 	.db #0x0C	; 12
   4C1A F0                  170 	.db #0xF0	; 240
   4C1B F0                  171 	.db #0xF0	; 240
   4C1C 0C                  172 	.db #0x0C	; 12
   4C1D F0                  173 	.db #0xF0	; 240
   4C1E F0                  174 	.db #0xF0	; 240
   4C1F A4                  175 	.db #0xA4	; 164
   4C20 F0                  176 	.db #0xF0	; 240
   4C21 F0                  177 	.db #0xF0	; 240
   4C22 F0                  178 	.db #0xF0	; 240
   4C23 F0                  179 	.db #0xF0	; 240
   4C24 F0                  180 	.db #0xF0	; 240
   4C25 F0                  181 	.db #0xF0	; 240
   4C26 F0                  182 	.db #0xF0	; 240
                            183 	.area _INITIALIZER
                            184 	.area _CABS (ABS)
