//-----------------------------LICENSE NOTICE------------------------------------
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU Lesser General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Lesser General Public License for more details.
//
//  You should have received a copy of the GNU Lesser General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//------------------------------------------------------------------------------

#include <cpctelera.h>
#include "game.h"
#include "sprites/marker.h"
#include "sprites/figures.h"
#include "asm/util.h"

u8 enemyX, enemyY;
TTable userTable;
TTable enemyTable;
Keys keys;
TUser user;
u8 abort;
u8* const cards[4] = { hc_figures_0, hc_figures_1, hc_figures_2, hc_figures_3};

u8 tile_buffer_0[50] = {
    0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00
};
u8 tile_buffer_1[50] = {
    0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00
};

// Máscara de transparencia
cpctm_createTransparentMaskTable(hc_tablatrans, 0x100, M0, 0);


//////////////////////////////////////////////////////////////////
// delay
//    Count the number of zeroes that still remains in the cells
//
//
// Returns:
//    <u8> Number of zeroes in cells
//
void delay(u32 cycles) {
    u32 i;
    for (i = 0; i < cycles; i++) {
        __asm
        halt
        __endasm;
    }
}


void initGame(){
    abort = 0;

    user.x = 0;
    user.y = 0;
    user.px = 0;
    user.py = 0;
    user.moved = 0;
    user.buffer = tile_buffer_0;

    keys.up    = Key_CursorUp;
    keys.down  = Key_CursorDown;
    keys.left  = Key_CursorLeft;
    keys.right = Key_CursorRight;
    keys.fire  = Key_Space;
    keys.pause = Key_Del;
    keys.abort = Key_Esc;
}

void drawScreen(){
    u8 i,j;

    for (j=0;j<TABLE_HEIGHT;j++){
        for (i=0;i<TABLE_WIDTH;i++){
        }
    }
}

void insertCard(){
    u8 row,col;
    u8* pvmem;
    u8 stopped = 0;
    u8 card;

    row = 5;
    col = user.x;
    card = (cpct_rand() / 85) + 1;

    pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X+(col*TILE_W), USER_TABLE_Y+(row*TILE_H));
    cpc_GetSp((u8*) tile_buffer_1, 10, 10, (int) pvmem);
    cpct_drawSpriteMaskedAlignedTable(cards[card], pvmem, TILE_W, TILE_H, hc_tablatrans);

    while (!stopped){
        delay(10);
        if ((row>0) && (userTable[col][row-1]==0)){
            pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X+(col*TILE_W), USER_TABLE_Y+(row*TILE_H));
            cpct_drawSprite(tile_buffer_1, pvmem, HC_MARKER_W, HC_MARKER_H);
            row--;
            pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X+(col*TILE_W), USER_TABLE_Y+(row*TILE_H));
            cpc_GetSp((u8*) tile_buffer_1, 10, 10, (int) pvmem);
            cpct_drawSpriteMaskedAlignedTable(cards[card], pvmem, TILE_W, TILE_H, hc_tablatrans);
            if (row == 0)
                stopped = 1;
        } else
            stopped = 1;

    }
    userTable[col][row]= card;
}

void drawUser(){
    //u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X+(user.px*TILE_W), USER_TABLE_Y+(user.py*TILE_H));
    //cpct_drawSolidBox(pvmem,#0,HC_MARKER_W,HC_MARKER_H);
    //pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X+(user.x*TILE_W), USER_TABLE_Y+(user.y*TILE_H));
    //cpct_drawSpriteMaskedAlignedTable(hc_marker, pvmem, HC_MARKER_W, HC_MARKER_H, hc_tablatrans);
    //---cpct_drawSprite(hc_marker, pvmem, HC_MARKER_W, HC_MARKER_H);

    u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X+(user.px*TILE_W), USER_TABLE_Y+(user.py*TILE_H));
    cpct_drawSprite(tile_buffer_0, pvmem, HC_MARKER_W, HC_MARKER_H);
    pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X+(user.x*TILE_W), USER_TABLE_Y+(user.y*TILE_H));
    cpc_GetSp((u8*) tile_buffer_0, 10, 10, (int) pvmem);
    cpct_drawSpriteMaskedAlignedTable(hc_marker, pvmem, HC_MARKER_W, HC_MARKER_H, hc_tablatrans);

    
    user.px = user.x;
    user.py = user.y;
}

void checkUserMovement(){
	cpct_scanKeyboard_f();

    if ((user.x<(TABLE_WIDTH-1)) && (cpct_isKeyPressed(keys.right))) {
        user.px = user.x;
        user.x++;
    	user.moved = 1;
    } else if ((user.x>0) && (cpct_isKeyPressed(keys.left))) {
    	user.px = user.x;
        user.x--;
        user.moved = 1;
    	}

    if ((user.y<(TABLE_HEIGHT-1)) && (cpct_isKeyPressed(keys.down))) {
        user.py = user.y;
        user.y++;
        user.moved = 1;
    } else if ((user.y>0) && (cpct_isKeyPressed(keys.up))) {
        user.py = user.y;
        user.y--;
        user.moved = 1;
        }
    if ((userTable[user.x][user.y]==0) && (cpct_isKeyPressed(keys.fire))){
        insertCard();
    }
    
    if (cpct_isKeyPressed(keys.abort)){
        //abort = 1;
        reset_cpc();
    }
}

void game(){
	initGame();
	drawScreen();
	drawUser();
	while (1){
		checkUserMovement();
		if (user.moved){
			drawUser();
			user.moved = 0;
		}
        if (abort)
            break;
        delay(20);
	}
}



