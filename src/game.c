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
u8* const cards[5] = { hc_figures_0, hc_figures_0, hc_figures_1, hc_figures_2, hc_figures_3};

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


void initGame() {
    abort = 0;

    user.x = 0;
    user.y = 0;
    user.px = 0;
    user.py = 0;
    user.cardTaken = 0;
    user.moved = 0;
    user.buffer = tile_buffer_0;

    keys.up    = Key_CursorUp;
    keys.down  = Key_CursorDown;
    keys.left  = Key_CursorLeft;
    keys.right = Key_CursorRight;
    keys.fire  = Key_Space;
    keys.pause = Key_Del;
    keys.abort = Key_Esc;

    cpct_setBlendMode(CPCT_BLEND_XOR);
}

void drawScreen() {
    u8 i, j;

    for (j = 0; j < TABLE_HEIGHT; j++) {
        for (i = 0; i < TABLE_WIDTH; i++) {
        }
    }
}

void insertCardUser(u8 col) {
    u8 row;
    u8* pvmem;
    u8 stopped = 0;
    u8 card;

    row = 5;
    card = (cpct_rand() / 64) + 1;

    pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X + (col * (TILE_W + 2)), USER_TABLE_Y + (row * (TILE_H + 3)));
    cpc_GetSp((u8*) tile_buffer_1, 10, 5, (int) pvmem);
    cpct_drawSpriteMaskedAlignedTable(cards[card], pvmem, TILE_W, TILE_H, hc_tablatrans);

    while (!stopped) {
        delay(10);
        if ((row > 0) && (userTable[col][row - 1] == 0)) {
            pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X + (col * (TILE_W + 2)), USER_TABLE_Y + (row * (TILE_H + 3)));
            cpct_drawSprite(tile_buffer_1, pvmem, TILE_W, TILE_H);
            row--;
            pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X + (col * (TILE_W + 2)), USER_TABLE_Y + (row * (TILE_H + 3)));
            cpc_GetSp((u8*) tile_buffer_1, 10, 5, (int) pvmem);
            cpct_drawSpriteMaskedAlignedTable(cards[card], pvmem, TILE_W, TILE_H, hc_tablatrans);
            if (row == 0)
                stopped = 1;
        } else
            stopped = 1;

    }
    userTable[col][row] = card;
}

void insertCardEnemy(u8 col) {
    u8 row;
    u8* pvmem;
    u8 stopped = 0;
    u8 card;

    row = 0;
    card = (cpct_rand() / 64) + 1;

    pvmem = cpct_getScreenPtr(CPCT_VMEM_START, ENEMY_TABLE_X + (col * (TILE_W + 2)), ENEMY_TABLE_Y + (row * (TILE_H + 3)));
    cpc_GetSp((u8*) tile_buffer_1, 10, 5, (int) pvmem);
    cpct_drawSpriteMaskedAlignedTable(cards[card], pvmem, TILE_W, TILE_H, hc_tablatrans);

    while (!stopped) {
        delay(10);
        if ((row < 5) && (enemyTable[col][row + 1] == 0)) {
            pvmem = cpct_getScreenPtr(CPCT_VMEM_START, ENEMY_TABLE_X + (col * (TILE_W + 2)), ENEMY_TABLE_Y + (row * (TILE_H + 3)));
            cpct_drawSprite(tile_buffer_1, pvmem, TILE_W, TILE_H);
            row++;
            pvmem = cpct_getScreenPtr(CPCT_VMEM_START, ENEMY_TABLE_X + (col * (TILE_W + 2)), ENEMY_TABLE_Y + (row * (TILE_H + 3)));
            cpc_GetSp((u8*) tile_buffer_1, 10, 5, (int) pvmem);
            cpct_drawSpriteMaskedAlignedTable(cards[card], pvmem, TILE_W, TILE_H, hc_tablatrans);
            if (row == 5)
                stopped = 1;
        } else
            stopped = 1;

    }
    enemyTable[col][row] = card;
}

void newHand(u8 side) {
    u8 i;
    u8 col;

    for (i = 0; i < 8; i++) {
        if (side) {
            col = (cpct_rand() / 32);
            while (userTable[col][5] != 0) {
                col = (cpct_rand() / 32);
            }
            insertCardUser(col);
        } else {
            col = (cpct_rand() / 32);
            while (enemyTable[col][0] != 0) {
                col = (cpct_rand() / 32);
            }
            insertCardEnemy(col);
        }
    }
}

void drawUser() {
    //u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X+(user.px*TILE_W), USER_TABLE_Y+(user.py*TILE_H));
    //cpct_drawSolidBox(pvmem,#0,HC_MARKER_W,HC_MARKER_H);
    //pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X+(user.x*TILE_W), USER_TABLE_Y+(user.y*TILE_H));
    //cpct_drawSpriteMaskedAlignedTable(hc_marker, pvmem, HC_MARKER_W, HC_MARKER_H, hc_tablatrans);
    //---cpct_drawSprite(hc_marker, pvmem, HC_MARKER_W, HC_MARKER_H);

    //u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X + (user.px * (TILE_W + 1)), USER_TABLE_Y + (user.py * (TILE_H + 2)));
    //cpct_drawSprite(tile_buffer_0, pvmem, HC_MARKER_W, HC_MARKER_H);
    //pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X + (user.x * (TILE_W + 1)), USER_TABLE_Y + (user.y * (TILE_H + 2)));
    //cpc_GetSp((u8*) tile_buffer_0, 10, 5, (int) pvmem);
    //cpct_drawSpriteMaskedAlignedTable(hc_marker, pvmem, HC_MARKER_W, HC_MARKER_H, hc_tablatrans);

    u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X - 1 + (user.px * (TILE_W + 2)), USER_TABLE_Y - 2 + (user.py * (TILE_H + 3)));
    cpct_drawSpriteBlended(pvmem, HC_MARKER_H, HC_MARKER_W, hc_marker);
    if (user.cardTaken!=0){
        pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X + (user.px * (TILE_W + 2)), USER_TABLE_Y + (6 * (TILE_H + 3)));
        cpct_drawSprite(tile_buffer_0, pvmem, TILE_W, TILE_H);
        pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X + (user.x * (TILE_W + 2)), USER_TABLE_Y + (6 * (TILE_H + 3)));
        cpct_drawSpriteMaskedAlignedTable(cards[user.cardTaken], pvmem, TILE_W, TILE_H, hc_tablatrans);
    }
    pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X - 1 + (user.x * (TILE_W + 2)), USER_TABLE_Y - 2 + (user.y * (TILE_H + 3)));
    cpct_drawSpriteBlended(pvmem, HC_MARKER_H, HC_MARKER_W, hc_marker);


    user.px = user.x;
    user.py = user.y;
}

void userTakeCard(u8 col) {
    u8 i;
    u8* pvmem;
    i = 5;
    while (i <= 5) {
        if (userTable[col][i] != 0) {
            user.cardTaken = userTable[col][i];
            for (; i<6; i++){
                delay(20);
                pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X + (col * (TILE_W + 2)), USER_TABLE_Y + (i * (TILE_H + 3)));
                cpct_drawSprite(tile_buffer_0, pvmem, TILE_W, TILE_H);
                pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X + (col * (TILE_W + 2)), USER_TABLE_Y + ((i+1) * (TILE_H + 3)));
                cpct_drawSpriteMaskedAlignedTable(cards[user.cardTaken], pvmem, TILE_W, TILE_H, hc_tablatrans);
            }
            //pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X + (col * (TILE_W + 2)), USER_TABLE_Y + (5 * (TILE_H + 3)));
            //cpct_drawSpriteMaskedAlignedTable(tile_buffer_0, pvmem, TILE_W, TILE_H, hc_tablatrans);
            break;
        }
        else {
            i--;
        }
    }
}

void checkUserMovement() {
    //cpct_scanKeyboard_f();

    if ((user.x < (TABLE_WIDTH - 1)) && (cpct_isKeyPressed(keys.right))) {
        user.px = user.x;
        user.x++;
        user.moved = 1;
    } else if ((user.x > 0) && (cpct_isKeyPressed(keys.left))) {
        user.px = user.x;
        user.x--;
        user.moved = 1;
    }

    if ((user.y < (TABLE_HEIGHT - 1)) && (cpct_isKeyPressed(keys.down))) {
        user.py = user.y;
        user.y++;
        user.moved = 1;
    } else if ((user.y > 0) && (cpct_isKeyPressed(keys.up))) {
        user.py = user.y;
        user.y--;
        user.moved = 1;
    }
    if ((userTable[user.x][5] == 0) && (cpct_isKeyPressed(keys.fire))) {
        //newHand(1);
        userTakeCard(user.x);
    }

    if (cpct_isKeyPressed(keys.abort)) {
        //abort = 1;
        reset_cpc();
    }
}

void game() {
    u8* pvmem;

    initGame();
    drawScreen();
    newHand(0);  //0 for Enemy 1 for User
    newHand(1);  //0 for Enemy 1 for User
    //pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X + (user.x * (TILE_W + 1)), USER_TABLE_Y + (user.y * (TILE_H + 2)));
    //cpc_GetSp((u8*) tile_buffer_0, 10, 5, (int) pvmem);
    pvmem = cpct_getScreenPtr(CPCT_VMEM_START, USER_TABLE_X - 1 + (user.x * (TILE_W + 2)), USER_TABLE_Y - 2 + (user.y * (TILE_H + 3)));
    cpct_drawSpriteBlended(pvmem, HC_MARKER_H, HC_MARKER_W, hc_marker);
    drawUser();
    while (1) {
        checkUserMovement();
        if (user.moved) {
            drawUser();
            user.moved = 0;
        }
        if (abort)
            break;
        delay(20);
    }
}



