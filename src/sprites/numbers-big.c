//-----------------------------LICENSE NOTICE------------------------------------
//  This file is part of Space Moves
//  Copyright (C) 2015 Toni Ramírez (@AmstradGamer)
//
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

#include "numbers-big.h"

const u8 G_numbers_big[10][3 * 11] = {
//0
    {
    0x11, 0x33, 0x00,
    0x33, 0x33, 0x22,
    0x22, 0x00, 0x22,
    0x22, 0x11, 0x22,
    0x22, 0x11, 0x22,
    0x20, 0x20, 0x20,
    0x20, 0x20, 0x20,
    0x30, 0x00, 0x20,
    0x30, 0x00, 0x20,
    0x10, 0x30, 0x00,
    0x10, 0x30, 0x00
    },
//1
    {
    0x00, 0x22, 0x00,
    0x11, 0x22, 0x00,
    0x22, 0x22, 0x00,
    0x00, 0x22, 0x00,
    0x00, 0x22, 0x00,
    0x00, 0x20, 0x00,
    0x00, 0x20, 0x00,
    0x00, 0x20, 0x00,
    0x00, 0x20, 0x00,
    0x30, 0x30, 0x20,
    0x30, 0x30, 0x20
    },
//2
    {
    0x11, 0x33, 0x00,
    0x33, 0x33, 0x22,
    0x22, 0x00, 0x22,
    0x00, 0x00, 0x22,
    0x00, 0x11, 0x22,
    0x00, 0x30, 0x00,
    0x10, 0x20, 0x00,
    0x30, 0x00, 0x00,
    0x20, 0x00, 0x00,
    0x30, 0x30, 0x20,
    0x30, 0x30, 0x20
    },
//3
    {
    0x11, 0x33, 0x00,
    0x33, 0x33, 0x22,
    0x22, 0x00, 0x22,
    0x00, 0x00, 0x22,
    0x00, 0x33, 0x22,
    0x00, 0x30, 0x00,
    0x00, 0x00, 0x20,
    0x20, 0x00, 0x20,
    0x20, 0x00, 0x20,
    0x10, 0x30, 0x00,
    0x10, 0x30, 0x00
    },
//4
    {
    0x00, 0x11, 0x22,
    0x00, 0x33, 0x22,
    0x11, 0x22, 0x22,
    0x11, 0x00, 0x22,
    0x22, 0x00, 0x22,
    0x20, 0x00, 0x20,
    0x30, 0x30, 0x20,
    0x30, 0x30, 0x20,
    0x00, 0x00, 0x20,
    0x00, 0x00, 0x20,
    0x00, 0x00, 0x20
    },
//5
    {
    0x33, 0x33, 0x22,
    0x33, 0x33, 0x22,
    0x22, 0x00, 0x00,
    0x33, 0x33, 0x00,
    0x33, 0x33, 0x22,
    0x00, 0x00, 0x20,
    0x00, 0x00, 0x20,
    0x20, 0x00, 0x20,
    0x20, 0x00, 0x20,
    0x10, 0x30, 0x00,
    0x10, 0x30, 0x00
    },
//6
    {
    0x11, 0x33, 0x22,
    0x33, 0x33, 0x22,
    0x22, 0x00, 0x00,
    0x22, 0x00, 0x00,
    0x33, 0x33, 0x00,
    0x30, 0x30, 0x00,
    0x20, 0x00, 0x20,
    0x20, 0x00, 0x20,
    0x20, 0x00, 0x20,
    0x10, 0x30, 0x00,
    0x10, 0x30, 0x00
    },
//7
    {
    0x33, 0x33, 0x22,
    0x33, 0x33, 0x22,
    0x22, 0x00, 0x22,
    0x00, 0x00, 0x22,
    0x00, 0x11, 0x22,
    0x00, 0x10, 0x00,
    0x00, 0x30, 0x00,
    0x10, 0x20, 0x00,
    0x10, 0x00, 0x00,
    0x10, 0x00, 0x00,
    0x10, 0x00, 0x00
    },
//8
    {
    0x11, 0x33, 0x00,
    0x33, 0x33, 0x22,
    0x22, 0x00, 0x22,
    0x22, 0x00, 0x22,
    0x33, 0x33, 0x22,
    0x10, 0x30, 0x00,
    0x30, 0x30, 0x20,
    0x20, 0x00, 0x20,
    0x20, 0x00, 0x20,
    0x10, 0x30, 0x00,
    0x10, 0x30, 0x00
    },
//9
    {
    0x11, 0x33, 0x00,
    0x33, 0x33, 0x22,
    0x22, 0x00, 0x22,
    0x22, 0x00, 0x22,
    0x33, 0x33, 0x22,
    0x10, 0x30, 0x20,
    0x00, 0x10, 0x20,
    0x00, 0x10, 0x20,
    0x00, 0x30, 0x00,
    0x10, 0x20, 0x00,
    0x10, 0x00, 0x00
    }
};