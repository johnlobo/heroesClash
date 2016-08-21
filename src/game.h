//-----------------------------LICENSE NOTICE------------------------------------
//
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

#ifndef _GAME_H_
#define _GAME_H_

#include <types.h>
#include "defines.h"
#include "utils/text.h"

#define TABLE_WIDTH 8
#define TABLE_HEIGHT 6
#define TILE_W 5
#define TILE_H 10
#define ENEMY_TABLE_X 2
#define ENEMY_TABLE_Y 2
#define USER_TABLE_X 2
#define USER_TABLE_Y 92

typedef u8 TTable[8][6];
typedef struct {
	u8 x,y;
	u8 px, py;
	u8 moved;
	u8* buffer; 
} TUser;

extern const u8 G_graphics_palette[16];


void game();

#endif
