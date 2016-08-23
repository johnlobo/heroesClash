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
   4B73                      47 _g_tile_symbols_1:
   4B73 F0                   48 	.db #0xF0	; 240
   4B74 78                   49 	.db #0x78	; 120	'x'
   4B75 F0                   50 	.db #0xF0	; 240
   4B76 F0                   51 	.db #0xF0	; 240
   4B77 78                   52 	.db #0x78	; 120	'x'
   4B78 F0                   53 	.db #0xF0	; 240
   4B79 F0                   54 	.db #0xF0	; 240
   4B7A 78                   55 	.db #0x78	; 120	'x'
   4B7B F0                   56 	.db #0xF0	; 240
   4B7C B4                   57 	.db #0xB4	; 180
   4B7D 3C                   58 	.db #0x3C	; 60
   4B7E F0                   59 	.db #0xF0	; 240
   4B7F B4                   60 	.db #0xB4	; 180
   4B80 3C                   61 	.db #0x3C	; 60
   4B81 F0                   62 	.db #0xF0	; 240
   4B82 3C                   63 	.db #0x3C	; 60
   4B83 3C                   64 	.db #0x3C	; 60
   4B84 78                   65 	.db #0x78	; 120	'x'
   4B85 0C                   66 	.db #0x0C	; 12
   4B86 0C                   67 	.db #0x0C	; 12
   4B87 58                   68 	.db #0x58	; 88	'X'
   4B88 F0                   69 	.db #0xF0	; 240
   4B89 58                   70 	.db #0x58	; 88	'X'
   4B8A F0                   71 	.db #0xF0	; 240
   4B8B F0                   72 	.db #0xF0	; 240
   4B8C 58                   73 	.db #0x58	; 88	'X'
   4B8D F0                   74 	.db #0xF0	; 240
   4B8E F0                   75 	.db #0xF0	; 240
   4B8F 58                   76 	.db #0x58	; 88	'X'
   4B90 F0                   77 	.db #0xF0	; 240
   4B91 F0                   78 	.db #0xF0	; 240
   4B92 58                   79 	.db #0x58	; 88	'X'
   4B93 F0                   80 	.db #0xF0	; 240
   4B94                      81 _g_tile_symbols_2:
   4B94 F0                   82 	.db #0xF0	; 240
   4B95 58                   83 	.db #0x58	; 88	'X'
   4B96 F0                   84 	.db #0xF0	; 240
   4B97 F0                   85 	.db #0xF0	; 240
   4B98 58                   86 	.db #0x58	; 88	'X'
   4B99 F0                   87 	.db #0xF0	; 240
   4B9A F0                   88 	.db #0xF0	; 240
   4B9B 58                   89 	.db #0x58	; 88	'X'
   4B9C F0                   90 	.db #0xF0	; 240
   4B9D F0                   91 	.db #0xF0	; 240
   4B9E 58                   92 	.db #0x58	; 88	'X'
   4B9F F0                   93 	.db #0xF0	; 240
   4BA0 0C                   94 	.db #0x0C	; 12
   4BA1 0C                   95 	.db #0x0C	; 12
   4BA2 58                   96 	.db #0x58	; 88	'X'
   4BA3 3C                   97 	.db #0x3C	; 60
   4BA4 3C                   98 	.db #0x3C	; 60
   4BA5 78                   99 	.db #0x78	; 120	'x'
   4BA6 B4                  100 	.db #0xB4	; 180
   4BA7 3C                  101 	.db #0x3C	; 60
   4BA8 F0                  102 	.db #0xF0	; 240
   4BA9 B4                  103 	.db #0xB4	; 180
   4BAA 3C                  104 	.db #0x3C	; 60
   4BAB F0                  105 	.db #0xF0	; 240
   4BAC F0                  106 	.db #0xF0	; 240
   4BAD 78                  107 	.db #0x78	; 120	'x'
   4BAE F0                  108 	.db #0xF0	; 240
   4BAF F0                  109 	.db #0xF0	; 240
   4BB0 78                  110 	.db #0x78	; 120	'x'
   4BB1 F0                  111 	.db #0xF0	; 240
   4BB2 F0                  112 	.db #0xF0	; 240
   4BB3 78                  113 	.db #0x78	; 120	'x'
   4BB4 F0                  114 	.db #0xF0	; 240
   4BB5                     115 _g_tile_symbols_3:
   4BB5 F0                  116 	.db #0xF0	; 240
   4BB6 F0                  117 	.db #0xF0	; 240
   4BB7 F0                  118 	.db #0xF0	; 240
   4BB8 F0                  119 	.db #0xF0	; 240
   4BB9 F0                  120 	.db #0xF0	; 240
   4BBA F0                  121 	.db #0xF0	; 240
   4BBB F0                  122 	.db #0xF0	; 240
   4BBC 78                  123 	.db #0x78	; 120	'x'
   4BBD F0                  124 	.db #0xF0	; 240
   4BBE F0                  125 	.db #0xF0	; 240
   4BBF 3C                  126 	.db #0x3C	; 60
   4BC0 F0                  127 	.db #0xF0	; 240
   4BC1 F0                  128 	.db #0xF0	; 240
   4BC2 3C                  129 	.db #0x3C	; 60
   4BC3 78                  130 	.db #0x78	; 120	'x'
   4BC4 3C                  131 	.db #0x3C	; 60
   4BC5 3C                  132 	.db #0x3C	; 60
   4BC6 3C                  133 	.db #0x3C	; 60
   4BC7 F0                  134 	.db #0xF0	; 240
   4BC8 0C                  135 	.db #0x0C	; 12
   4BC9 58                  136 	.db #0x58	; 88	'X'
   4BCA F0                  137 	.db #0xF0	; 240
   4BCB 0C                  138 	.db #0x0C	; 12
   4BCC F0                  139 	.db #0xF0	; 240
   4BCD F0                  140 	.db #0xF0	; 240
   4BCE 58                  141 	.db #0x58	; 88	'X'
   4BCF F0                  142 	.db #0xF0	; 240
   4BD0 F0                  143 	.db #0xF0	; 240
   4BD1 F0                  144 	.db #0xF0	; 240
   4BD2 F0                  145 	.db #0xF0	; 240
   4BD3 F0                  146 	.db #0xF0	; 240
   4BD4 F0                  147 	.db #0xF0	; 240
   4BD5 F0                  148 	.db #0xF0	; 240
   4BD6                     149 _g_tile_symbols_4:
   4BD6 F0                  150 	.db #0xF0	; 240
   4BD7 F0                  151 	.db #0xF0	; 240
   4BD8 F0                  152 	.db #0xF0	; 240
   4BD9 F0                  153 	.db #0xF0	; 240
   4BDA F0                  154 	.db #0xF0	; 240
   4BDB F0                  155 	.db #0xF0	; 240
   4BDC F0                  156 	.db #0xF0	; 240
   4BDD B4                  157 	.db #0xB4	; 180
   4BDE F0                  158 	.db #0xF0	; 240
   4BDF F0                  159 	.db #0xF0	; 240
   4BE0 3C                  160 	.db #0x3C	; 60
   4BE1 F0                  161 	.db #0xF0	; 240
   4BE2 B4                  162 	.db #0xB4	; 180
   4BE3 3C                  163 	.db #0x3C	; 60
   4BE4 F0                  164 	.db #0xF0	; 240
   4BE5 3C                  165 	.db #0x3C	; 60
   4BE6 3C                  166 	.db #0x3C	; 60
   4BE7 3C                  167 	.db #0x3C	; 60
   4BE8 A4                  168 	.db #0xA4	; 164
   4BE9 0C                  169 	.db #0x0C	; 12
   4BEA F0                  170 	.db #0xF0	; 240
   4BEB F0                  171 	.db #0xF0	; 240
   4BEC 0C                  172 	.db #0x0C	; 12
   4BED F0                  173 	.db #0xF0	; 240
   4BEE F0                  174 	.db #0xF0	; 240
   4BEF A4                  175 	.db #0xA4	; 164
   4BF0 F0                  176 	.db #0xF0	; 240
   4BF1 F0                  177 	.db #0xF0	; 240
   4BF2 F0                  178 	.db #0xF0	; 240
   4BF3 F0                  179 	.db #0xF0	; 240
   4BF4 F0                  180 	.db #0xF0	; 240
   4BF5 F0                  181 	.db #0xF0	; 240
   4BF6 F0                  182 	.db #0xF0	; 240
                            183 	.area _INITIALIZER
                            184 	.area _CABS (ABS)
