#include "myLib.h"
#include "bitmaps\splashscreen.h"
#include "bitmaps\Instructions.h"
#include "bitmaps\win.h"
#include "bitmaps\lose.h"
#include "TiledMaps\ship_ui.h"
#include "TiledMaps\stars.h"
#include "TiledMaps\mountains.h"
#include "TiledMaps\craters.h"
#include "TiledMaps\PauseMenu.h"
#include "TiledMaps\Splash_border.h"
#include "TiledMaps\Spash_checkers.h"
#include "TiledMaps\Splash_title_text.h"
#include "TiledMaps\spash_checkers_affine.h"
#include "Sprites\spritesheet.h"
#include "Sprites\ship_000.h"

// Global Variables
volatile u16* scanlineCounter = (u16*) 0x04000006;
unsigned int frameCount = 0;
unsigned short buttons;
unsigned short oldButtons;
enum STATE_TYPES {SPLASHSCREEN_STATE, INSTRUCTION_STATE, GAME_STATE, PAUSE_STATE, WIN_STATE, LOSE_STATE};
enum STATE_TYPES STATE = -1;
enum STATE_TYPES oldSTATE;
short temp_pal = 0; //used when swapping palettes
s16 game_counter = 0;
u8 game_level = 1;
u32 game_score = 0;
u8 game_target_station = 1; //[Z Y N L]
char station_visable = 0; //station_visable 2(moving left) 0(on screen) 1(moving right)
short current_station = 1;
u8 station_order[5] = {255, 3, 0, 2, 1}; //how the stations are placed in the world
s32 world_offset = 0;
int mothership_world_x_coord = 0;
u32 mothership_world_y_coord = 24;
char turning_speed = 4;
u8 resource_amount[4] = { 0, 0, 0, 0 }; //Z Y N L
u8 resource_counter = 0; //used by mothership
OBJ_AFFINE *obj_aff_buffer = (OBJ_AFFINE*)shadowOAM;
OBJ_SHIP player_ship;
s16 directions[16] = {0, 32, 64, 96, 128, 160, 192, 224, 256, 288, 320, 352, 384, 416, 448, 480};
BG_AFFINE bg_aff_current =  { 256, 0, 0, 256, 0, 0 };



void switch_graphics_mode(char new_mode) {
    if (new_mode == 4 && (STATE==GAME_STATE || STATE==SPLASHSCREEN_STATE || STATE==PAUSE_STATE )) {
        for (int i = 0; i < 256; i++) { //clear palette
                PALETTE[i] = 0;
        }
        REG_BG2CNT = 0x00000000;
        REG_BG2HOFF = 0;
        REG_BG2VOFF = 0;
        bg_aff_current.pa = 256;
        bg_aff_current.pb = 0;
        bg_aff_current.pc = 0;
        bg_aff_current.pd = 256;
        bg_aff_current.dx = 0;
        bg_aff_current.dy = 0;
        REG_BG_AFFINE[2] = bg_aff_current;
        REG_DISPCTL = MODE4 | BG2_ENABLE | DISP_BACKBUFFER;
    } else if (new_mode == 0) {
        /* Mode 0 Initialization Code */
    } else if (new_mode == 1) {
        /* Mode 1 Initialization Code */
    }
}
void clear_screen_M4() {
    drawRect4(0, 0, 160, 240, 250);
}

void change_state(enum STATE_TYPES new_state) {
    oldSTATE = STATE;
    if (new_state == GAME_STATE) {
        switch_graphics_mode(0);
    } else if (new_state == PAUSE_STATE) {
        begin_interupts_vcount();
        switch_graphics_mode(0);
    } else {
        stop_interupts();
        switch_graphics_mode(4);
    }
    STATE = new_state;
}

void initialize_GAME() {
    stop_interupts();
    clear_screen_M4();
    flipPage();
    switch (game_level)
    {
    case 1:
        game_counter = 900;
        break;
    case 2:
        game_counter = 750;
        break;
    case 3:
        game_counter = 600;
        break;
    case 4:
        game_counter = 500;
        break;
    }
    sprite_count = 0;
    game_level = 1;
    game_score = 0;
    game_target_station = 1; //Z Y N L
    mothership_world_x_coord = 0;
    station_visable = 1;
    current_station = 1;
    resource_counter = 0;
    temp_pal = 0;
    for (char i = 0; i < 4; i++) { // Zero collected resources
        resource_amount[i] = 0; //Z Y N L
    }
    station_order[0] = 255;
    station_order[1] = 3;
    station_order[2] = 0;
    station_order[3] = 2;
    station_order[4] = 1;
    world_offset = 0;
    player_ship.height = 103;
    player_ship.horizontal_speed = 0;
    player_ship.vertical_speed = 0;
    player_ship.heading = 0;
    player_ship.docking_type = 0; //0 = none, 1 = station, 2 = motheship
}

u8 next_station(){
    u8 next = station_order[game_target_station];
    if (next==255) { //next level
        change_state(WIN_STATE);
    }
    return next;
}

//===================================== INTERUPTS =====================================================================
void hbl_pal_invert_vcnt() {  //Switches to different palette for 62 scanlines, allows 16+ colours for 4bpp background
    DMANow(3, PALETTE, PALETTE+16, 16);
    DMANow(3, PauseMenuPal, PALETTE, 16);
    if (temp_pal == 1) { // Keep current LED state active
        temp_pal = PALETTE[0x8];
        PALETTE[0x8] = PALETTE[0xa];
        PALETTE[0xa] = temp_pal;
        temp_pal = 1;
    }
    while(REG_VCOUNT<90);
    DMANow(3, PALETTE+16, PALETTE, 16); // Restore palette
    REG_IF = IRQ_VCOUNT;
}
void begin_interupts_vcount() {
    REG_ISR_MAIN = hbl_pal_invert_vcnt;
    REG_DISPSTAT = (REG_DISPSTAT & 0xFF) | (28<<8); //set VCT to trigger at 28
    REG_DISPSTAT |= DSTAT_VCT_IRQ;
    REG_IE |= IRQ_VCOUNT;          // Tell the GBA to catch Vcount interrupts
    REG_IME= 1;                   // Tell the GBA to enable interrupts;
}
void stop_interupts() {
    REG_IME = 0;
}

//============================================ PLAYER SHIP ==============================================================
void move_player() {
    world_offset += player_ship.horizontal_speed/60;
    // Make horizontal speed tend towards zero
    if (player_ship.horizontal_speed > 0) {
        player_ship.horizontal_speed = MAX(player_ship.horizontal_speed-2, 0);
    } else if (player_ship.horizontal_speed < 0) {
        player_ship.horizontal_speed = MIN(player_ship.horizontal_speed+2, 0);
    }
    // Simulate gravity with constant acceleration down
    if (frameCount%(16 - abs(player_ship.vertical_speed)/15) == 0) {
        if (player_ship.vertical_speed < 0) {
            player_ship.height = MIN( 103, player_ship.height - 1 );
        } else if (player_ship.vertical_speed > 0) {
            player_ship.height = MIN( 103, player_ship.height + 1 );
        }
        //TODO upper space
        if (player_ship.height < 8) {
            player_ship.height = 8;
            player_ship.vertical_speed = 0;
        }
    }
    // Stop players vertical movement when he hits the ground
    if (player_ship.height < 103) {
        player_ship.vertical_speed =  MAX( -240, MIN( 240, player_ship.vertical_speed + 1 ) );
    } else {
        player_ship.vertical_speed = 0;
    }
}
void turn_player(short delta) { //delta range is 0 - 511
    if (player_ship.heading + delta < 0) {
        player_ship.heading += 511;
    }
    player_ship.heading = ( player_ship.heading + delta ) % 512;
}
void activate_thrusters() {
    // Setup gravity / friction constants
    u8 const horizontal_delta = 8;
    u16 const horizontal_limit = 800;
    u8 const vertical_delta = 4;
    u16 const vertical_limit = 240;
    u8 dir = (player_ship.heading/32) % 16;
    if (dir==0 || dir==8) { //0 - 180
        player_ship.vertical_speed += ((dir-4)/4) * vertical_delta;
    } else if (dir==4 || dir==12) { //90 - 270
        player_ship.horizontal_speed += ((dir-8)/4) * horizontal_delta;
    } else if (dir==1 || dir==15) { //22.5* up
        player_ship.vertical_speed -= vertical_delta;
        player_ship.horizontal_speed += ((dir-8)/7) * horizontal_delta/2;
    }  else if (dir==3 || dir==5) { //22.5* left
        player_ship.vertical_speed += (dir-4) * vertical_delta/2;
        player_ship.horizontal_speed += -horizontal_delta;
    }  else if (dir==11 || dir==13) { //22.5* right
        player_ship.vertical_speed -= (dir-12) * vertical_delta/2;
        player_ship.horizontal_speed += horizontal_delta;
    } else if (dir==7 || dir==9) { //22.5* down
        player_ship.vertical_speed += vertical_delta;
        player_ship.horizontal_speed += (dir-8) * horizontal_delta/2;
    } else if (dir==2 || dir==14) { //45* up
        player_ship.vertical_speed -= vertical_delta;
        player_ship.horizontal_speed += (dir-8)/6 * horizontal_delta;
    } else if (dir==6 || dir==10) { //45* down
        player_ship.vertical_speed += vertical_delta;
        player_ship.horizontal_speed += (dir-8)/2 * horizontal_delta;
    }
    player_ship.vertical_speed = MAX( -vertical_limit, MIN( vertical_limit, player_ship.vertical_speed ));
    player_ship.horizontal_speed = MAX( -horizontal_limit, MIN( horizontal_limit, player_ship.horizontal_speed ));
}
//======================================== BG TILE REPLACEMENT ==================================================================
void set_counter(short counter) {
    char digits[3] = {  (counter/100)%10, (counter/10)%10, counter%10 };
    for (char i = 0; i < 3; i++) {
        overwrite_BG_tile(8+16*digits[i], 126+i, 0, 5, 3);
        overwrite_BG_tile(8+16*digits[i], 145+i, 3, 0, 5);
    }
}
void set_score(u32 score) {
    char digits[6] = {  (score/100000)%10, (score/10000)%10, (score/1000)%10, (score/100)%10, (score/10)%10, score%10 };
    for (char i = 0; i < 6; i++) {
        overwrite_BG_tile(8+16*digits[i], 13+i, 0, 5, 3);
        overwrite_BG_tile(8+16*digits[i], 40+i, 3, 0, 5);
    }
}
void set_level(char game_level) {
    overwrite_BG_tile(9+16*game_level, 26, 0, 5, 3);
    overwrite_BG_tile(9+16*game_level, 54, 3, 0, 5);
}
void set_compass(u8 letter, char arrow_direction) {   
    overwrite_BG_tile(10+16*letter, 9, 0, 5, 3); //letter = Z Y N L 
    overwrite_BG_tile(10+16*letter, 36, 3, 0, 5);
    overwrite_BG_tile(11+16*arrow_direction, 10, 0, 5, 3); //arrow_direction = right left Down Blank
    overwrite_BG_tile(11+16*arrow_direction, 37, 3, 0, 5);
}
void set_compass_target(char current_station, char target) { //Z Y N L
    if (target > current_station) { //target to the right
        set_compass(target, 0);
    } else if (target < current_station) { //target to the left
        set_compass(target, 1);
    }    
}



int main() {
    oldButtons = 0xFFFF;
    buttons = BUTTONS;
    u8 splash_current_direction = 0; //right left
    u8 splash_scale_direction = 0;
    u8 splash_palette_bank = 0;
    double cubic_equation = 0;  //Used on splashscreen so speed doesn't matter
    s32 integer_dx;
    change_state(SPLASHSCREEN_STATE);
    //Clear OAM
    hide_all_sprites();
    write_sprite_data(128);
    //Main game loop
    while(1) {
        waitForVBlank();
        if (sprite_count != 0) {
            write_sprite_data(sprite_count);
        }
        buttons = BUTTONS;


        if (STATE==SPLASHSCREEN_STATE) { //start
            if (oldSTATE != STATE) {
               oldSTATE = STATE;
                REG_DISPCTL = MODE1 | BG0_ENABLE | BG1_ENABLE | BG2_ENABLE ;
                DMANow(3, Splash_borderPal, PALETTE, 64);

                // INITIALIZE BACKGROUNDS
                // Border
                REG_BG0CNT = BG_CHARBLOCK(2) | BG_SCREENBLOCK(25) | BG_4BPP | BG_SIZE_SMALL | BG_PRIORITY(0);
                DMANow(3, Splash_borderTiles, &CHARBLOCK[2], Splash_borderTilesLen / 2);
                DMANow(3, Splash_borderMap, &SCREENBLOCK[25], Splash_borderMapLen / 2);
                REG_BG0HOFF = 0;
                REG_BG0VOFF = 0;
                // Title Text
                REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(22) | BG_4BPP | BG_SIZE_SMALL | BG_PRIORITY(1);
                DMANow(3, Splash_title_textTiles, &CHARBLOCK[1], Splash_title_textTilesLen / 2);
                DMANow(3, Splash_title_textMap, &SCREENBLOCK[22], Splash_title_textMapLen / 2);                
                REG_BG1HOFF = 0;
                REG_BG1VOFF = 0;
                // Checkered Affine Tiles
                REG_BG2CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(30) | BG_AFF_32x32 | BG_PRIORITY(2) | BG_WRAP;
                DMANow(3, spash_checkers_affineTiles, &CHARBLOCK[0], spash_checkers_affineTilesLen / 2);
                DMANow(3, spash_checkers_affineMap, &SCREENBLOCK[30], spash_checkers_affineMapLen  / 2);
                bg_aff_current.pa = 64;
                bg_aff_current.pb = 0;
                bg_aff_current.pc = 0;
                bg_aff_current.pd = 64;
                bg_aff_current.dx = 0;
                bg_aff_current.dy = 0;
                REG_BG_AFFINE[2] = bg_aff_current;
                splash_current_direction = 0;
                splash_palette_bank = 2;
                // Save palette
                PALETTE[16*4+1] = PALETTE[16*1+1];
                PALETTE[16*4+2] = PALETTE[16*1+2];
            }
            if (splash_current_direction==0) {
                bg_aff_current.dx+=512;
                if (bg_aff_current.dx >= 1<<16) { //reached the end
                    splash_current_direction = 1;
                    splash_palette_bank = (splash_palette_bank+1)%3;
                    PALETTE[16*1+1] = PALETTE[16*(2+splash_palette_bank)+1];
                    PALETTE[16*1+2] = PALETTE[16*(2+splash_palette_bank)+2];
                }
            } else if (splash_current_direction==1) {
                bg_aff_current.dx-=512;
                if (bg_aff_current.dx <= 0) {  //reached the start
                    splash_current_direction = 0;
                }
            }
            //convert dx to an integer in the range -50..50
            integer_dx = ((bg_aff_current.dx*100)>>16)-50;
            //The cubic function for converting x to a scale
            cubic_equation = 0.0006*(integer_dx*integer_dx*integer_dx) - 0.8*integer_dx + 60;
            //Convert range 0..100 to fixed point range 0..1
            bg_aff_current.pa = ((u32)(83886*cubic_equation))>>15;
            bg_aff_current.pd = bg_aff_current.pa;
            REG_BG_AFFINE[2] = bg_aff_current;
            

            if (BUTTON_PRESSED(BUTTON_A)) {
                initialize_GAME();
                change_state(GAME_STATE);
            }
            if (BUTTON_PRESSED(BUTTON_B)) {
                change_state(INSTRUCTION_STATE);
            }
        


        } else if (STATE == INSTRUCTION_STATE) {
            if (oldSTATE != STATE) {
               oldSTATE = STATE;
                DMANow(3, InstructionsPal, PALETTE, 256);
                drawFullscreenImage4(InstructionsBitmap);
                flipPage();
                drawFullscreenImage4(InstructionsBitmap);
                flipPage();
            }
            if (BUTTON_PRESSED(BUTTON_A)) {
                initialize_GAME();
                change_state(GAME_STATE);
            }
            if (BUTTON_PRESSED(BUTTON_B)) {
                change_state(SPLASHSCREEN_STATE);
            }



        } else if (STATE==GAME_STATE) { //game
            if (oldSTATE == PAUSE_STATE) {
                // Change Pause screen to Craters
                show_all_sprites();
                REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(22) | BG_4BPP | BG_SIZE_WIDE | BG_PRIORITY(1);
                DMANow(3, cratersTiles, &CHARBLOCK[1], cratersTilesLen / 2);
                DMANow(3, cratersMap, &SCREENBLOCK[22], cratersMapLen / 2);
                REG_BG1HOFF = 0;
                REG_BG1VOFF = -112;
            } else if (oldSTATE != STATE) {
                oldSTATE = STATE;
                
                /*Backgrounds Memory Map
                            8192   8192   8192   8192
                            CHAR0  CHAR1  CHAR2  CHAR3
                SCREENBLOCK 00-07  08-15  16-23  24-31
                
                Layout      :0 01 02 03 04 05 06 07      :num = charblock num
                            :1 09 10 11 12 13 14 15      ;num = screenblock num
                            :2 17 18 19 20 21 ;1 ;1 
                            :3 ;0 ;2 ;2 ;3 ;3 ;3 ;3
                */

                // Load Palette and enable Mode 0 video
                REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | BG2_ENABLE | BG3_ENABLE | SPRITE_ENABLE | SPRITE_MODE_2D;
                DMANow(3, ship_uiPal, PALETTE, 256);

                // INITIALIZE BACKGROUNDS
                // Ship UI
                REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(25) | BG_4BPP | BG_SIZE_SMALL | BG_PRIORITY(0);
                DMANow(3, ship_uiTiles, &CHARBLOCK[0], ship_uiTilesLen / 2);
                DMANow(3, ship_uiMap, &SCREENBLOCK[25], ship_uiMapLen / 2);
                REG_BG0HOFF = 0;
                REG_BG0VOFF = 0;
                // Pause screen / Craters
                REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(22) | BG_4BPP | BG_SIZE_WIDE | BG_PRIORITY(1);
                DMANow(3, cratersTiles, &CHARBLOCK[1], cratersTilesLen / 2);
                DMANow(3, cratersMap, &SCREENBLOCK[22], cratersMapLen / 2);
                REG_BG1HOFF = 0;
                REG_BG1VOFF = -112;
                // Mountains
                REG_BG2CNT = BG_CHARBLOCK(2) | BG_SCREENBLOCK(26) | BG_4BPP | BG_SIZE_WIDE | BG_PRIORITY(2);
                DMANow(3, mountainsTiles, &CHARBLOCK[2], mountainsTilesLen / 2);
                DMANow(3, mountainsMap, &SCREENBLOCK[26], mountainsMapLen / 2);
                REG_BG2HOFF = 0;
                REG_BG2VOFF = -96;
                // Stars
                REG_BG3CNT = BG_CHARBLOCK(3) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_LARGE | BG_PRIORITY(3);
                DMANow(3, starsTiles, &CHARBLOCK[3], starsTilesLen / 2);
                DMANow(3, starsMap, &SCREENBLOCK[28], starsMapLen / 2);
                REG_BG3HOFF = 0;
                REG_BG3VOFF = 0;

                // INITIALIZE SPRITES
                sprite_count = 13;
                DMANow(3, ship_000Tiles, &MEM_TILE[4][0], ship_000TilesLen / 2);
                DMANow(3, ship_000Pal, SPRITEPALETTE, 256);
                // Station sprite
                shadowOAM[0].attr0 = (90-8) | ATTR0_4BPP | ATTR0_WIDE;
                shadowOAM[0].attr1 = 40 | ATTR1_LARGE;
                shadowOAM[0].attr2 = 2 | ATTR2_PRIORITY(2);
                //Affine player sprite
                shadowOAM[PLAYER_SPRITE_INDEX].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_DOUBLEAFFINE;
                shadowOAM[PLAYER_SPRITE_INDEX].attr1 = ATTR1_SMALL | ATTR1_AFF_ID(1);
                shadowOAM[PLAYER_SPRITE_INDEX].attr2 = 64 | ATTR2_PRIORITY(1);
                obj_aff_rotate(&obj_aff_buffer[1], (128+64+32)<<7);
                // Mothership sprite
                shadowOAM[MOTHERSHIP_SPRITE_INDEX].attr0 = ATTR0_4BPP | ATTR0_SQUARE;
                shadowOAM[MOTHERSHIP_SPRITE_INDEX].attr1 = ATTR1_MEDIUM;
                shadowOAM[MOTHERSHIP_SPRITE_INDEX].attr2 = 24 | ATTR2_PRIORITY(1) | ATTR2_PALROW(1);
                // Resource bar sprites
                // Resource Z
                shadowOAM[2].attr0 = 132+6*3 | ATTR0_4BPP | ATTR0_WIDE;
                shadowOAM[2].attr1 = (13-62)&0x1FF | ATTR1_LARGE;
                shadowOAM[2].attr2 = 136 | ATTR2_PRIORITY(2) | ATTR2_PALROW(0);
                shadowOAM[6].attr0 = 132+6*3 | ATTR0_4BPP | ATTR0_WIDE;
                shadowOAM[6].attr1 = (13-62)&0x1FF | ATTR1_LARGE;
                shadowOAM[6].attr2 = 136 | ATTR2_PRIORITY(2) | ATTR2_PALROW(2);
                // Resource Y
                shadowOAM[3].attr0 = 132 | ATTR0_4BPP | ATTR0_WIDE;
                shadowOAM[3].attr1 = (13-62)&0x1FF | ATTR1_LARGE;
                shadowOAM[3].attr2 = 136 | ATTR2_PRIORITY(2) | ATTR2_PALROW(0);
                shadowOAM[7].attr0 = 132+6*3 | ATTR0_4BPP | ATTR0_WIDE;
                shadowOAM[7].attr1 = (13-62)&0x1FF | ATTR1_LARGE;
                shadowOAM[7].attr2 = 136 | ATTR2_PRIORITY(2) | ATTR2_PALROW(2);
                // Resource N
                shadowOAM[4].attr0 = 132+6*2 | ATTR0_4BPP | ATTR0_WIDE;
                shadowOAM[4].attr1 = (13-62)&0x1FF | ATTR1_LARGE;
                shadowOAM[4].attr2 = 136 | ATTR2_PRIORITY(2) | ATTR2_PALROW(0);
                shadowOAM[8].attr0 = 132+6*3 | ATTR0_4BPP | ATTR0_WIDE;
                shadowOAM[8].attr1 = (13-62)&0x1FF | ATTR1_LARGE;
                shadowOAM[8].attr2 = 136 | ATTR2_PRIORITY(2) | ATTR2_PALROW(2);
                // Resource L
                shadowOAM[5].attr0 = 132+6 | ATTR0_4BPP | ATTR0_WIDE;
                shadowOAM[5].attr1 = (13-62)&0x1FF | ATTR1_LARGE;
                shadowOAM[5].attr2 = 136 | ATTR2_PRIORITY(2) | ATTR2_PALROW(0);
                shadowOAM[9].attr0 = 132+6*3 | ATTR0_4BPP | ATTR0_WIDE;
                shadowOAM[9].attr1 = (13-62)&0x1FF | ATTR1_LARGE;
                shadowOAM[9].attr2 = 136 | ATTR2_PRIORITY(2) | ATTR2_PALROW(2);
                
                // Set various UI displays
                set_counter(game_counter);
                set_score(game_score);
                set_level(game_level);
                set_compass_target(current_station, game_target_station);

                REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | BG2_ENABLE | BG3_ENABLE | SPRITE_ENABLE | SPRITE_MODE_2D;
                //stop_interupts();
            }
            // Make LED blink
            if (frameCount%30==0) {
                if (temp_pal == 0) {
                    temp_pal = 1;
                    PALETTE[0xd] = 0x0380;
                    SPRITEPALETTE[0x9] = 0x0380;
                } else {
                    temp_pal = 0;
                    PALETTE[0xd] = 0x0000;
                    SPRITEPALETTE[0x9] = 0x0000;
                }
            }
            // Update game counter
            if (frameCount%60==0) { //One second has passed!
                if (game_counter < 0) {
                    change_state(LOSE_STATE);
                }
                set_counter(game_counter);
                game_counter--;
            }
            // Inputs
            if (player_ship.docking_type == 0) {
                if (BUTTON_HELD(BUTTON_UP)) {activate_thrusters();}
                if (BUTTON_HELD(BUTTON_DOWN)) {activate_thrusters();}
                if (BUTTON_HELD(BUTTON_LEFT)) {turn_player(turning_speed);}
                else if (BUTTON_HELD(BUTTON_RIGHT)) {turn_player(-turning_speed);}
            }
            if (BUTTON_PRESSED(BUTTON_A)) {change_state(WIN_STATE);}
            if (BUTTON_PRESSED(BUTTON_B)) {change_state(LOSE_STATE);}
            if (BUTTON_PRESSED(BUTTON_START)) {
                hide_all_sprites();
                //Don't hide resource bars
                for (u8 i = 2; i <= 9; i++) {
                   show_sprite(i);
                }
                change_state(PAUSE_STATE);
            }
            // Lock player and perform docking if necessary
            if(player_ship.docking_type == 0) {  // Player is free
                move_player();
                REG_BG2HOFF = world_offset >> 3;
                REG_BG1HOFF = world_offset >> 2;
            } else if (player_ship.docking_type == 1) { // Player is docked at station
                /* TODO Lock player when docked at station */
                /* TODO Allow player to abort docking(can come back) */
            } else if (player_ship.docking_type == 2) { // Player is docked at mothership
                /* TODO Allow player to abort docking(but losses resources) */
                //Move player with mothership
                world_offset = ((mothership_world_x_coord- 120 + 16)<<2);
                REG_BG2HOFF = world_offset >> 3;
                REG_BG1HOFF = world_offset >> 2;
                // Rotate player to north
                if ((player_ship.heading/32) % 16 != 0) {
                    turn_player(turning_speed);
                }
                // Bring player towards mothership
                if (player_ship.height != 35 && frameCount%10==0) {
                    player_ship.height--;
                }
                // Transfer resources once docked
                if (frameCount%10==0 && player_ship.height==35) {
                    u8 sprite_heights[4] = {132+6*3, 132, 132+6*2, 132+6};
                    resource_counter = MIN(resource_amount[game_target_station], resource_counter + 1);
                    set_sprite_location(2+game_target_station, 13-62 + resource_counter, sprite_heights[game_target_station]);
                }
                // Increase score while docked & Release player when done
                if (resource_counter != resource_amount[game_target_station] && resource_counter > 0) {
                    game_score++;
                    set_score(game_score);
                } else if (resource_counter == resource_amount[game_target_station]) {
                    player_ship.docking_type = 0;
                    game_target_station = next_station();
                    set_compass_target(current_station, game_target_station);
                    resource_counter = 0;
                }
            } 
            // Set player coord and rotation matrix
            set_sprite_location(PLAYER_SPRITE_INDEX, 120 - 8, player_ship.height);
            obj_aff_rotate(&obj_aff_buffer[1], directions[(player_ship.heading/32) % 16]<<7);

            // Translate mothership world coord to screen coord
            s32 mothership_screen_x_coord = mothership_world_x_coord-(world_offset>>2); //mothership_world_x_coord
            if (frameCount%5==0) {
                mothership_world_x_coord++;
            }
            // Display mothership if visible on screen. Store of screen otherwise
            if (mothership_screen_x_coord > -255 && mothership_screen_x_coord < 255) {
                set_sprite_location(MOTHERSHIP_SPRITE_INDEX, mothership_screen_x_coord, mothership_world_y_coord);
            } else {
                set_sprite_location(MOTHERSHIP_SPRITE_INDEX, -254, mothership_world_y_coord);
            }
            // Capture player ship if he has the required resources
            if (player_ship.height > mothership_world_y_coord+21 && player_ship.height < 65 && (mothership_screen_x_coord >= 100) && (mothership_screen_x_coord <= 108) && resource_amount[game_target_station]>0) {
                if (mothership_screen_x_coord < 104) {
                    player_ship.horizontal_speed = -120;
                    player_ship.vertical_speed = 0;
                } else if (mothership_screen_x_coord > 104) {
                    player_ship.horizontal_speed = 120;
                    player_ship.vertical_speed = 0;
                } else {
                    player_ship.horizontal_speed = 0;
                    player_ship.vertical_speed = 0;
                    player_ship.docking_type = 2;
                }
            }
            
            // Calculate station screen coord
            short station_offset = 128+16;
            short station_x_coord = (station_offset-(world_offset >> 2)) & 0x1FF;
            station_x_coord |= (~0x1FF) * (station_x_coord>>8);
            set_sprite_location(0, station_x_coord, 86);
            // Point compass arrow down if this is the target station. Add resources if player has landed on the pad.
            if (station_x_coord < 120-5 && station_x_coord > 120-5-18 && current_station >=0 && current_station < 4 && current_station==game_target_station) {
                // Player has landed
                if (player_ship.height >= 103) {
                    // Add resources
                    if (frameCount%10==0) {
                        u8 sprite_heights[4] = {132+6*3, 132, 132+6*2, 132+6};
                        resource_amount[current_station] = MIN(62, resource_amount[current_station] + 1);
                        set_sprite_location(6+current_station, 13-62 + resource_amount[current_station], sprite_heights[current_station]);
                    }
                    // Increase game score
                    if (resource_amount[current_station] != 62) {
                        game_score++;
                        set_score(game_score);
                    }
                }
                // Remove compass arrow if resources have been collected
                if (current_station == game_target_station && frameCount%10==0) {
                    if (resource_amount[game_target_station]==0) {
                        set_compass(game_target_station, 2);
                    } else {
                        set_compass(game_target_station, 3);
                    }
                }
            }
            // Swap station letter to next stations if necessary
            if (station_x_coord <= -64 && station_visable != 1 && (player_ship.horizontal_speed > 0 || player_ship.docking_type == 2)) {  //station is off screen to left, while moving right
                current_station = MIN(4, current_station + 1);
                station_visable = 1;
            } else if (station_x_coord <= -64 && station_visable != 2 && player_ship.horizontal_speed < 0) {  //station is off screen to left, while moving left
                current_station = MAX(-1, current_station - 1);
                station_visable = 2;
            } else if (station_x_coord > -64 && station_x_coord < 240) { //station is on screen
                station_visable = 0;
            }
            // Point compass towards target station
            if (station_visable==0 && current_station == game_target_station && station_x_coord < 120-22 && resource_amount[game_target_station]==0) {
                set_compass(game_target_station, 1); //Z Y N L, (R)ight (L)eft (D)own (B)lank
            } else if (station_visable==0 && current_station == game_target_station && station_x_coord > 120 -  4 && resource_amount[game_target_station]==0) {
                set_compass(game_target_station, 0); //Z Y N L, (R)ight (L)eft (D)own (B)lank
            }
            // Decide which station to show
            if (current_station == -1) {
                hide_sprite(0);
            } else if (current_station == 0) {
                show_sprite(0);
                DMANow(3, &MEM_TILE[4][5+48], &MEM_TILE[4][3+32], 16); //Z
            } else if (current_station == 1) {
                DMANow(3, &MEM_TILE[4][5+0], &MEM_TILE[4][3+32], 16); //Y
            } else if (current_station == 2) {
                DMANow(3, &MEM_TILE[4][5+32], &MEM_TILE[4][3+32], 16); //N
            } else if (current_station == 3) {
                show_sprite(0);
                DMANow(3, &MEM_TILE[4][5+16], &MEM_TILE[4][3+32], 16); //L
            } else if (current_station == 4) {
                hide_sprite(0);
            }



        } else if (STATE==PAUSE_STATE) {
            if (oldSTATE != STATE) {
                oldSTATE = STATE;
                REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(22) | BG_4BPP | BG_SIZE_SMALL | BG_PRIORITY(0);
                DMANow(3, PauseMenuTiles, &CHARBLOCK[1], PauseMenuTilesLen / 2);
                DMANow(3, PauseMenuMap, &SCREENBLOCK[22], PauseMenuMapLen / 2);
                REG_BG1HOFF = -16;
                REG_BG1VOFF = -16;
                temp_pal = 0;
            }
            if (BUTTON_PRESSED(BUTTON_A) || BUTTON_PRESSED(BUTTON_START)) {
                if (temp_pal == 0) {change_state(GAME_STATE);}
                if (temp_pal == 1) {change_state(SPLASHSCREEN_STATE);}
            }
            if (BUTTON_PRESSED(BUTTON_UP)) {
                if (temp_pal == 1) {
                    temp_pal = 0;
                }
            }
            if (BUTTON_PRESSED(BUTTON_DOWN)) {
                if (temp_pal == 0) {
                    temp_pal = 1;
                }
            }



        } else if (STATE==WIN_STATE) {
            DMANow(3, winPal, PALETTE, 256);
            drawFullscreenImage4(winBitmap);
            flipPage();
            drawFullscreenImage4(winBitmap);
            flipPage();
            if (BUTTON_PRESSED(BUTTON_A)) {
                change_state(SPLASHSCREEN_STATE);
            }
        } else if (STATE==LOSE_STATE) {
            DMANow(3, losePal, PALETTE, 256);
            drawFullscreenImage4(loseBitmap);
            flipPage();
            drawFullscreenImage4(loseBitmap);
            flipPage();
            if (BUTTON_PRESSED(BUTTON_A)) {
                change_state(SPLASHSCREEN_STATE);
            }
        }



        frameCount++;
        oldButtons = buttons;
    }
}
