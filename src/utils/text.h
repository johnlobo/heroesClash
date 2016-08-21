//-----------------------------LICENSE NOTICE------------------------------------
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//------------------------------------------------------------------------------


#include <types.h>
#include "../defines.h"

#ifndef _TEXT_H_
#define _TEXT_H_

// Font Sprites Size
#define FONT_W 3
#define FONT_H 11
//#define FONT_H 8
//#define FONT_W 2

//FALLING TEXT
#define FALLING_TEXT_SPEED  3
#define FALLING_TEXT_MAX_BOUNCES 6
#define FALLING_TEXT_MAX_LENGHT  20


u8 strLenght(u8 str[]);
void strCopy(i8* to, const i8* from);
void drawNumber(u16 aNumber, u8 length, u8 xPos, u8 yPos);
void drawText(u8 text[], u8 xPos, u8 yPos, u8 centered);
u8 moveFallingText(FChar *text, u8 lenght);
void drawFallingText(u8 text[], u8 xPos, u8 yPos, u8 destinationyPos);


#endif