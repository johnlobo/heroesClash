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


#ifndef _DEFINES_H_
#define _DEFINES_H_

#include <cpctelera.h>

typedef struct FChar{
    
    u8 phase;
    u8 xPos;
    u8 yPos;
    u8 startyPos;
    u8 endyPos;
    u8 destinationyPos;
    u8 character[2];
    
} FChar;

typedef struct Keys{
    
    cpct_keyID up;
    cpct_keyID down;
    cpct_keyID left;
    cpct_keyID right;
    cpct_keyID fire;
    cpct_keyID pause;
    cpct_keyID abort;
    
} Keys;

#endif