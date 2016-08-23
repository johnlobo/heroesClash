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
#include "defines.h"
#include "utils/video.h"
#include "utils/keyboard.h"
#include "music/song.h"


void playmusic() {
   __asm
      exx
      .db #0x08
      push af
      push bc
      push de
      push hl
      call _cpct_akp_musicPlay
      pop hl
      pop de
      pop bc
      pop af
      .db #0x08
      exx
   __endasm;
}


void interruptHandler() {
   static u8 i;

   i++;
   switch(i) {
      case 5: 
         cpct_scanKeyboard_if();
         break;
      case 6:
         // Play music
         playmusic();
         break;
      case 9:
         i=0;
   }
}

void init() {
   u32 seed;    // Value to initialize the random seed
   cpct_disableFirmware();
   cpct_setVideoMode(0);
   cpct_fw2hw(hc_graphics_palette, 16);
   cpct_setPalette(hc_graphics_palette, 16);
   cpct_setBorder(HW_BLACK);
   cpct_akp_musicInit(hc_smoke);
   cpct_setInterruptHandler(interruptHandler);


    //cpct_akp_musicInit(G_Smoke);
    //cpct_akp_musicInit(G_Menu);
    cpct_akp_musicPlay();

    drawText("HERO QUEST IS READY", 31, 76, 1);
    drawText("PRESS ANY KEY", 20, 90, 1);

    seed = wait4UserKeypress();
    // Random seed may never be 0, so check first and add 1 if it was 0
    if (!seed)
        seed++;
    cpct_srand(seed);

    clearScreen();

}

void main(void) {

   // Clear Screen
   cpct_memset(CPCT_VMEM_START, 0, 0x4000);

   init();

   game();
}
