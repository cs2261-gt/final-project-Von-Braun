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
#include "Sprites\spritesheet.h"
#include "Sprites\ship_000.h"
//#include "splashscreen.h"

// Global Variables
volatile u16* scanlineCounter = (u16*) 0x04000006;
unsigned int frameCount = 0;
unsigned short buttons;
unsigned short oldButtons;
short heading = 0; //0-359
enum STATE_TYPES {SPLASHSCREEN_STATE, INSTRUCTION_STATE, GAME_STATE, PAUSE_STATE, WIN_STATE, LOSE_STATE};
enum STATE_TYPES STATE = -1;
enum STATE_TYPES oldSTATE;
int mountain_hoff;
short temp_pal = 0; //used when swapping palettes
char video_initialized = 0;
int sprite_count = 0;
s16 game_counter = 0;
u8 game_level = 1;
u32 game_score = 0;
u8 game_target_station = 1; //Z Y N L
#define PLAYER_SPRITE_INDEX 10
#define MOTHERSHIP_SPRITE_INDEX 6

void switch_graphics_mode(char new_mode) {
    if ( video_initialized == 0 || (new_mode == 4 && (STATE==GAME_STATE || STATE==PAUSE_STATE ))) {
        video_initialized = 1;
        for (int i = 0; i < 256; i++) { //clear palete
                PALETTE[i] = 0;
        }
        REG_BG2CNT = 0x00000000;
        REG_BG2HOFF = 0;
        REG_BG2VOFF = 0;
        REG_DISPCTL = MODE4 | BG2_ENABLE | DISP_BACKBUFFER;
    } else if (new_mode == 0) {
        //REG_DISPCTL = MODE0 | BG1_ENABLE | BG0_ENABLE | SPRITE_ENABLE | SPRITE_MODE_1D;
        //setup background/sprites ?
    }
}
void clear_screen_M4() {
    drawRect4(0, 0, 160, 240, 250);
}

void change_state(enum STATE_TYPES new_state) {
    oldSTATE = STATE;
    if (new_state == GAME_STATE) {
        //stop_interupts();
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
    clear_screen_M4();
    flipPage();
    //REG_DISPCTL = DCNT_BLANK;
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
    mountain_hoff = 0;
}

//==========================================================================================================
void hbl_pal_invert() {
    PALETTE[0x6] ^= 0x7FFF;
    //PALETTE[0x9] = 0xff;
    REG_IF = IRQ_HBLANK;
}
void hbl_pal_invert_vcnt() {
    DMANow(3, PALETTE, PALETTE+16, 16);
    DMANow(3, PauseMenuPal, PALETTE, 16);
    //PALETTE[0x6] ^= 0x7FFF;
    if (temp_pal == 1) {
        temp_pal = PALETTE[0x8];
        PALETTE[0x8] = PALETTE[0xa];
        PALETTE[0xa] = temp_pal;
        temp_pal = 1;
    }
    while(REG_VCOUNT<90);
    DMANow(3, PALETTE+16, PALETTE, 16);
    //PALETTE[0x6] ^= 0x7FFF;
    //PALETTE[0x9] = 0xff;
    REG_IF = IRQ_VCOUNT;
}
typedef void (*fnptr)(void);
#define REG_ISR_MAIN *(fnptr*)(0x03007FFC)
void begin_interupts_hblank() {
    REG_ISR_MAIN= hbl_pal_invert;  // tell the GBA where my isr is
    REG_DISPSTAT |= DSTAT_HBL_IRQ;  // Tell the display to fire HBlank interrupts
    REG_IE |= IRQ_HBLANK;          // Tell the GBA to catch HBlank interrupts
    REG_IME= 1;                   // Tell the GBA to enable interrupts;
}

void begin_interupts_vcount() {
    REG_ISR_MAIN = hbl_pal_invert_vcnt;
    REG_DISPSTAT = (REG_DISPSTAT & 0xFF) | (28<<8); //set VCT to trigger at 80
    REG_DISPSTAT |= DSTAT_VCT_IRQ;
    //REG_IE = DSTAT_VCT_IRQ;
    REG_IE |= IRQ_VCOUNT;          // Tell the GBA to catch HBlank interrupts
    REG_IME= 1;                   // Tell the GBA to enable interrupts;
}
void stop_interupts() {
    REG_IME = 0;
}
//BFN_SET(REG_DISPSTAT, 80, DSTAT_VCT);
//#define DSTAT_VCT(n)	((n)<<8)
//==========================================================================================================
//SPRITES
void write_sprite_data(OBJ_ATTR* shadow, char count) {
    DMANow(3, shadowOAM, OAM, count*4);
}
void set_sprite_location(OBJ_ATTR *shadow, char sprite_index, short x, short y) {
    x &= 0x1FF; //9 bits
    y &= 0xFF; //8 bits
    (shadow+sprite_index)->attr0 &= ~0xFF;
    (shadow+sprite_index)->attr0 |= y;
    (shadow+sprite_index)->attr1 &= ~0x1FF;
    (shadow+sprite_index)->attr1 |= x;
}
//OBJ_ATTR savedOAM[128];
void hide_all_sprites(OBJ_ATTR *shadow) {
    char sprite_index = sprite_count;
    while(sprite_index--) {
        hide_sprite(shadow, sprite_index);
    }
}
void hide_sprite(OBJ_ATTR *shadow, char sprite_index) {
        (shadow+sprite_index)->attr0 &= ~0x300;
        (shadow+sprite_index)->attr0 |= ATTR0_HIDE;
}
void show_all_sprites(OBJ_ATTR *shadow) {
    char sprite_index = sprite_count;
    while(sprite_index--) {
        show_sprite(shadow, sprite_index);
    }
}
void show_sprite(OBJ_ATTR *shadow, char sprite_index) {
    (shadow+sprite_index)->attr0 &= ~0x300;
    if (sprite_index == PLAYER_SPRITE_INDEX) {
        (shadow+sprite_index)->attr0 |= ATTR0_AFFINE;
    } else {
        (shadow+sprite_index)->attr0 |= 0x000;
    }
    
}
//==========================================================================================================
//AFFINE
extern s16 sin_lut[514];	// .12f

s32 lu_sin(u32 theta){	return sin_lut[(theta>>7)&0x1FF];	}
s32 lu_cos(u32 theta){	return sin_lut[((theta>>7)+128)&0x1FF];	}
#define ALIGN4		__attribute__((aligned(4)))
typedef struct OBJ_AFFINE {
	u16 fill0[3];	s16 pa;
	u16 fill1[3];	s16 pb;
	u16 fill2[3];	s16 pc;
	u16 fill3[3];	s16 pd;
} ALIGN4 OBJ_AFFINE;

static inline void obj_aff_rotate(OBJ_AFFINE *oaff, u16 alpha) {
    //alpha &= 511;
	int ss= lu_sin(alpha)>>4, cc= lu_cos(alpha)>>4;
	oaff->pa= cc;	oaff->pb= -ss;
	oaff->pc= ss;	oaff->pd= cc;
}
static inline void obj_aff_identity(OBJ_AFFINE *oaff)
{
	oaff->pa= 0x0100l;	oaff->pb= 0;
	oaff->pc= 0;		oaff->pd= 0x0100;
}
#define ATTR1_AFF_ID_MASK	0x3E00
#define ATTR1_AFF_ID_SHIFT		 9
#define ATTR1_AFF_ID(n)		((n)<<ATTR1_AFF_ID_SHIFT)
//==========================================================================================================
//WORLD MAP
s32 world_offset = 0;
s32 old_world_offset = 0;

//==========================================================================================================
//PLAYER SHIP
typedef struct OBJ_SHIP {
    char height;
    short horizontal_speed;
    short vertical_speed;
    short heading;
} OBJ_SHIP;
OBJ_SHIP player_ship;
void move_player() {
    world_offset += player_ship.horizontal_speed/60;
    if (player_ship.horizontal_speed > 0) {
        player_ship.horizontal_speed = MAX(player_ship.horizontal_speed-2, 0);
    } else if (player_ship.horizontal_speed < 0) {
        player_ship.horizontal_speed = MIN(player_ship.horizontal_speed+2, 0);
    }

    if (frameCount%(16 - abs(player_ship.vertical_speed)/15) == 0) {
        if (player_ship.vertical_speed < 0) {
            player_ship.height = MIN( 103, player_ship.height - 1 ); //0 per frame, 1/frame, 2/frame     -->     1/(20 frames)
        } else if (player_ship.vertical_speed > 0) {
            player_ship.height = MIN( 103, player_ship.height + 1 );
        }
    }
    if (player_ship.height < 103) {
        player_ship.vertical_speed =  MAX( -240, MIN( 240, player_ship.vertical_speed + 1 ) );
    } else {
        player_ship.vertical_speed = 0;
    }
    /*player_ship.height = MIN( 103, player_ship.height + (player_ship.vertical_speed/30) );
    if (frameCount%30 == 0) {
        if (player_ship.height < 103) {
        // if (player_ship.vertical_speed < 900) {
                player_ship.vertical_speed = MIN(player_ship.vertical_speed+1, 30);
            //}
        } else {
            player_ship.vertical_speed = 0;
        }
    }*/

    /*player_ship.vertical_speed -= 1;
    if (player_ship.height >= 110) {
        player_ship.height = 110;
        player_ship.vertical_speed = 0;
    }*/
}
void turn_player(short delta) {
    //0 - 511
    if (player_ship.heading + delta < 0) {
        player_ship.heading += 511;
    }
    player_ship.heading = ( player_ship.heading + delta ) % 512;
}
void activate_thrusters() {
    //directions[(player_ship.heading/32) % 16]
    char horizontal_delta = 8;
    short horizontal_limit = 800;
    short vertical_delta = 4;
    short vertical_limit = 240;
    char dir = (player_ship.heading/32) % 16;
    if (dir==0 || dir==8) { //0 - 180
        //-60 / second
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
//==========================================================================================================
void overwrite_BG_tile(int spritesheet_index, int BG0_index, int sprite_start_line, int BG0_start_line, int lines_to_copy) {
    //1 line = 2 shorts, u32
    //126, tile = 16*u16
    //DMANow(3, &MEM_TILE[4][6+16], ((BG_tile*)&SCREENBLOCK[0])+126, 16); //Z
    int BG0_tile_address =  ((BG_tile*)&SCREENBLOCK[0]) + BG0_index;
    BG0_tile_address = ((u32*)BG0_tile_address) + BG0_start_line;
    int sprite_address = &MEM_TILE[4][spritesheet_index];
    sprite_address = ((u32*)sprite_address) + sprite_start_line;
    DMANow(3, sprite_address, BG0_tile_address, lines_to_copy*2); //Z
}
                
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
void set_level(u8 game_level) {
    overwrite_BG_tile(9+16*game_level, 26, 0, 5, 3);
    overwrite_BG_tile(9+16*game_level, 54, 3, 0, 5);
}
void set_compass(u8 letter, char arrow_direction) { //Z Y N L, 0 right 1 left 2 Down 3 Blank

    overwrite_BG_tile(10+16*letter, 9, 0, 5, 3); //letter
    overwrite_BG_tile(10+16*letter, 36, 3, 0, 5);

    overwrite_BG_tile(11+16*arrow_direction, 10, 0, 5, 3); //compass
    overwrite_BG_tile(11+16*arrow_direction, 37, 3, 0, 5);
}
void set_compass_target(char current_station, char target) { //Z Y N L
    if (target > current_station) { //target to the right
        set_compass(target, 0);
    } else if (target < current_station) { //target to the left
        set_compass(target, 1);
    } else { //target is on screen

    }
    
}

int main() {
    int mothership_world_x_coord = 0;
    oldButtons = 0xFFFF;
    buttons = BUTTONS;
    int cursor_positionX = 20;
    int cursor_positionY = 20;
    int cursor_speed = 1;
    char station_visable = 1;
    short current_station = 1;
    u8 resource_amount[4] = { 0, 0, 0, 0 }; //Z Y N L
    OBJ_ATTR shadowOAM[128];
    OBJ_ATTR *spriteAttribs = &shadowOAM[0];
    //OBJ_ATTR obj_buffer[128];
    OBJ_AFFINE *obj_aff_buffer = (OBJ_AFFINE*)shadowOAM;
    s16 directions[16];
    change_state(SPLASHSCREEN_STATE);
    while(1) {
        waitForVBlank();
        //write_sprite_data(&shadowOAM, 128);
        DMANow(3, shadowOAM, OAM, 128*4);
        buttons = BUTTONS;



        if (STATE==SPLASHSCREEN_STATE) { //start
           if (oldSTATE != STATE) {
               oldSTATE = STATE;
                DMANow(3, splashscreenPal, PALETTE, 256);
                drawFullscreenImage4(splashscreenBitmap);
                flipPage();
                
                drawFullscreenImage4(splashscreenBitmap);
                flipPage();
            }
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
            if (oldSTATE != STATE) {
                oldSTATE = STATE;
                temp_pal = 0;
                /*DMANow(3, InstructionsPal, PALETTE, 256);
                
                clear_screen_M4();
                flipPage();
                clear_screen_M4();
                flipPage();
                clear_screen_M4();
                flipPage();*/

                /*Backgrounds Memory Map
                BG3 stars, moon surface
                BG2 mountains
                BG1 Crators, depots, SPRITE LEVEL         //Sprites cover backgrounds of the same priority
                BG0 UI, UI-Data
                CHAR[8192] = tile data, SCREENBLOCK[1024] = where to place indexed tiles
                            8192   8192   8192   8192
                            CHAR0  CHAR1  CHAR2  CHAR3
                SCREENBLOCK 00-07  08-15  16-23  24-31

                SCREENBLOCK 00 01 02 03 04 05 06 07
                            08 09 10 11 12 13 14 15 
                            16 17 18 19 20 21 22 23 
                            24 25 26 27 28 29 30 31
                
                SCREENBLOCK :0 01 02 03 04 05 06 07
                            :1 09 10 11 12 13 14 15 
                            :2 17 18 19 20 21 ;1 ;1 
                            :3 ;0 ;2 ;2 ;3 ;3 ;3 ;3

                CHAR0 ( SCREENBLOCK_00 ) = BG0 Charblock
                CHAR1 ( SCREENBLOCK_08 ) = BG1 Charblock
                CHAR2 ( SCREENBLOCK_16 ) = BG2 Charblock
                CHAR3 ( SCREENBLOCK_24 ) = BG3 Charblock
                SCREENBLOCK_22-23 = BG1 Tilemap 2x1
                SCREENBLOCK_25    = BG0 Tilemap 1x1
                SCREENBLOCK_26-27 = BG2 Tilemap 2x1
                SCREENBLOCK_28-31 = BG3 Tilemap 2x2
                */

                /*Background Palette Memory Map
                0 = transparent (31, 0, 31)
                1 = blue (8, 20, 28)              only used by LEDs
                2 = teal (0, 16, 16)              For resource gauge background
                3 = black (0, 0, 0)
                4 = dark red (20, 0, 0)           Fuel gauge
                5 = gray (16, 16, 16)
                6 = 
                7 = white (28, 28, 28)
                8 = yellow (28, 28, 0)            UI resource letters
                9 = 
                A = red (28, 0, 0)                UI score / counter
                B = light gray (20, 20, 20)
                C = green (0, 28, 12)             UI arrow / level number
                D = dark gray (4, 4, 4)
                E = 
                F = dark blue (0, 0, 12)          Space
                */
               /*Background Palette Memory Map
                0 = transparent (31, 0, 31)
                3 = black (0, 0, 0)
                D = dark gray (4, 4, 4)
                5 = gray (16, 16, 16)
                B = light gray (20, 20, 20)
                7 = white (28, 28, 28)
                F = dark blue (0, 0, 12)          Space
                1 = blue (8, 20, 28)              only used by LEDs
                2 = teal (0, 16, 16)              For resource gauge background
                C = green (0, 28, 0)             UI arrow / level number
                8 = yellow (28, 28, 0)            UI resource letters
                4 = dark red (20, 0, 0)           Fuel gauge
                A = red (28, 0, 0)                UI score / counter
                9 = dark pink                     PAUSE SCREEN(KIRBY)    GAME(LEDs)=green
                6 = pink                          PAUSE SCREEN(KIRBY)    GAME(LEDs)=black
                E = 

                craters
                mountains
                pauseMenu
                ship_ui
                stars

                */
                DMANow(3, ship_uiPal, PALETTE, 256);
                //PALETTE[0x9] = 0x0000; 
                //PALETTE[0x6] = 0x00FF; 
                //3 = UI black + 2 UI LEDs
                //e = A single pixel on the crators
                //9 = green UI LEDs
                //c = green UI text
                //6 = the blue on the crator
                //f = space background

                //1 = blue LEDs

                //3 e black
                //6 f blue
                //9 c green

                //Initialize Backgrounds
                REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(25) | BG_4BPP | BG_SIZE_SMALL | BG_PRIORITY(0);
                DMANow(3, ship_uiTiles, &CHARBLOCK[0], ship_uiTilesLen / 2);
                DMANow(3, ship_uiMap, &SCREENBLOCK[25], ship_uiMapLen / 2);
                
                REG_BG0HOFF = 0;

                REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(22) | BG_4BPP | BG_SIZE_WIDE | BG_PRIORITY(1);
                DMANow(3, cratersTiles, &CHARBLOCK[1], cratersTilesLen / 2);
                DMANow(3, cratersMap, &SCREENBLOCK[22], cratersMapLen / 2);
                REG_BG1HOFF = 0;
                REG_BG1VOFF = -112;
                
                REG_BG2CNT = BG_CHARBLOCK(2) | BG_SCREENBLOCK(26) | BG_4BPP | BG_SIZE_WIDE | BG_PRIORITY(2);
                DMANow(3, mountainsTiles, &CHARBLOCK[2], mountainsTilesLen / 2);
                DMANow(3, mountainsMap, &SCREENBLOCK[26], mountainsMapLen / 2);
                REG_BG2HOFF = 0;
                REG_BG2VOFF = -96;

                REG_BG3CNT = BG_CHARBLOCK(3) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_LARGE | BG_PRIORITY(3);
                DMANow(3, starsTiles, &CHARBLOCK[3], starsTilesLen / 2);
                DMANow(3, starsMap, &SCREENBLOCK[28], starsMapLen / 2);
                REG_BG3HOFF = 0;

                //Initialize sprites
                sprite_count = 1;
                DMANow(3, ship_000Tiles, &MEM_TILE[4][0], ship_000TilesLen / 2);  //&MEM_TILE[4][0],  (void*)0x06014000
                DMANow(3, ship_000Pal, SPRITEPALETTE, 256);
                /*shadowOAM[0].attr0 = (30) | ATTR0_4BPP | ATTR0_SQUARE;
                shadowOAM[0].attr1 = 40 | ATTR1_SMALL;
                shadowOAM[0].attr2 &= ~0x0C00;
                shadowOAM[0].attr2 |= ATTR2_PRIORITY(1);*/
                
                shadowOAM[0].attr0 = (90-8) | ATTR0_4BPP | ATTR0_WIDE;
                shadowOAM[0].attr1 = 40 | ATTR1_LARGE;
                shadowOAM[0].attr2 = 2 | ATTR2_PRIORITY(2);

                //AFFINE SPRITE
                shadowOAM[PLAYER_SPRITE_INDEX].attr0 = (90) | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_AFFINE;
                shadowOAM[PLAYER_SPRITE_INDEX].attr1 = 40 | ATTR1_SMALL | ATTR1_AFF_ID(1);
                shadowOAM[PLAYER_SPRITE_INDEX].attr2 = 64 | ATTR2_PRIORITY(1);
                //shadowOAM[1].attr2 = 64+11 | ATTR2_PRIORITY(1);
                obj_aff_rotate(&obj_aff_buffer[1], (128+64+32)<<7);
                for (char i = 0; i < 16; i++) {
                    if (i == 0) {
                        directions[0] = 0;
                    } else {
                        directions[i] = directions[i-1] + 32;
                    }
                }
                
                shadowOAM[MOTHERSHIP_SPRITE_INDEX].attr0 = 30 | ATTR0_4BPP | ATTR0_SQUARE;
                shadowOAM[MOTHERSHIP_SPRITE_INDEX].attr1 = 104 | ATTR1_MEDIUM;
                shadowOAM[MOTHERSHIP_SPRITE_INDEX].attr2 = 24 | ATTR2_PRIORITY(1) | ATTR2_PALROW(1);

                
                //u8 resource_amount[4] = { 0, 0, 0, 0 }; //Z Y N L
                //resource Z
                shadowOAM[2].attr0 = 132+6*3 | ATTR0_4BPP | ATTR0_WIDE;
                shadowOAM[2].attr1 = (13-62)&0x1FF | ATTR1_LARGE;
                shadowOAM[2].attr2 = 136 | ATTR2_PRIORITY(2) | ATTR2_PALROW(2);
                //resource Y
                shadowOAM[3].attr0 = 132 | ATTR0_4BPP | ATTR0_WIDE;
                shadowOAM[3].attr1 = (13-62)&0x1FF | ATTR1_LARGE;
                shadowOAM[3].attr2 = 136 | ATTR2_PRIORITY(2) | ATTR2_PALROW(2);
                //resource N
                shadowOAM[4].attr0 = 132+6*2 | ATTR0_4BPP | ATTR0_WIDE;
                shadowOAM[4].attr1 = (13-62)&0x1FF | ATTR1_LARGE;
                shadowOAM[4].attr2 = 136 | ATTR2_PRIORITY(2) | ATTR2_PALROW(2);
                //resource L
                shadowOAM[5].attr0 = 132+6 | ATTR0_4BPP | ATTR0_WIDE;
                shadowOAM[5].attr1 = (13-62)&0x1FF | ATTR1_LARGE;
                shadowOAM[5].attr2 = 136 | ATTR2_PRIORITY(2) | ATTR2_PALROW(2);
                
                //obj_aff_identity(&obj_aff_buffer[1]);
                set_counter(game_counter);
                set_score(game_score);
                set_level(game_level);
                //set_compass(game_target_station, 2); //Z Y N L, (L)eft (R)ight (D)own (B)lank
                set_compass_target(current_station, game_target_station);

                show_sprite(&shadowOAM, -1);

                REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | BG2_ENABLE | BG3_ENABLE | SPRITE_ENABLE | SPRITE_MODE_2D;
            }
            //LED blink
            if (frameCount%30==0) {
                if (temp_pal == 0) {
                    temp_pal = 1;
                    PALETTE[0xd] = 0x0380; //0x1084;
                    SPRITEPALETTE[0x9] = 0x0380;
                } else {
                    temp_pal = 0;
                    PALETTE[0xd] = 0x0000;
                    SPRITEPALETTE[0x9] = 0x0000;
                }
            }
            if (frameCount%60==0) { //One second has passed!
                if (game_counter < 0) {
                    change_state(LOSE_STATE);
                }
                set_counter(game_counter);
                game_counter--;
            }
            //move cursor
            if (BUTTON_HELD(BUTTON_UP)) {activate_thrusters();}
            if (BUTTON_HELD(BUTTON_DOWN)) {activate_thrusters();}
            if (BUTTON_HELD(BUTTON_LEFT)) {mountain_hoff = -1;turn_player(4);}
            else if (BUTTON_HELD(BUTTON_RIGHT)) {mountain_hoff = 1;turn_player(-4);}
            move_player();
            set_sprite_location(&shadowOAM, PLAYER_SPRITE_INDEX, 120 - 8, player_ship.height);



            //z y n l NULL
            //current_station
            //station_visable
            //old_world_offset
            //difference = abs( (u32)old_world_offset - (u32)world_offset )
            //s32 difference = (u32)world_offset - (u32)old_world_offset
            short station_offset = 128+16; //144
            //sprite0 width = 64, 
            //visible screen = 8 - 232
            //x = 0 - 511, signed -256, 255
            //if x < -64: station off left screen 
            //transition points(in offset) = offset+144
            //player_ship.horizontal_speed
            //station_visable -1 0 1
            short station_x_coord = (station_offset-(world_offset >> 2)) & 0x1FF;
            station_x_coord |= (~0x1FF) * (station_x_coord>>8);
            set_sprite_location(&shadowOAM, 0, station_x_coord, 86);
            set_sprite_location(&shadowOAM, MOTHERSHIP_SPRITE_INDEX, mothership_world_x_coord++, 20);

            if (station_x_coord < 120-5 && station_x_coord > 120-5-18 && current_station >=0 && current_station < 4) {
                if (player_ship.height >= 103) {
                    if (frameCount%10==0) {
                        u8 sprite_heights[4] = {132+6*3, 132, 132+6*2, 132+6};
                        resource_amount[current_station] = MIN(62, resource_amount[current_station] + 1);
                        set_sprite_location(&shadowOAM, 2+current_station, 13-62 + resource_amount[current_station], sprite_heights[current_station]);
                    }
                    if (resource_amount[current_station] != 62) {
                        game_score++;
                        set_score(game_score);
                    }
                }
                if (current_station == game_target_station && frameCount%10==0) {
                    set_compass(game_target_station, 2); //Z Y N L, (L)eft (R)ight (D)own (B)lank
                }
                
            }

            if (station_x_coord <= -64 && station_visable != 1 && player_ship.horizontal_speed > 0) {  //station is off screen to left, while moving right
                current_station = MIN(4, current_station + 1);
                station_visable = 1;
            }
            if (station_x_coord <= -64 && station_visable != 2 && player_ship.horizontal_speed < 0) {  //station is off screen to left, while moving left
                current_station = MAX(-1, current_station - 1);
                station_visable = 2;
            }
            if (station_x_coord > -64 && station_x_coord < 240) { //station is on screen
                station_visable = 0;
            }
            if (station_visable==0 && current_station == game_target_station && station_x_coord < 120-22) {
                set_compass(game_target_station, 1); //Z Y N L, (R)ight (L)eft (D)own (B)lank
            } else if (station_visable==0 && current_station == game_target_station && station_x_coord > 120 -  4) {
                set_compass(game_target_station, 0); //Z Y N L, (R)ight (L)eft (D)own (B)lank
            }
            if (current_station == -1) {
                hide_sprite(&shadowOAM, 0);
            } else if (current_station == 0) {
                show_sprite(&shadowOAM, 0);
                DMANow(3, &MEM_TILE[4][5+48], &MEM_TILE[4][3+32], 16); //Z
            } else if (current_station == 1) {
                DMANow(3, &MEM_TILE[4][5+0], &MEM_TILE[4][3+32], 16); //Y
            } else if (current_station == 2) {
                DMANow(3, &MEM_TILE[4][5+32], &MEM_TILE[4][3+32], 16); //N
            } else if (current_station == 3) {
                show_sprite(&shadowOAM, 0);
                DMANow(3, &MEM_TILE[4][5+16], &MEM_TILE[4][3+32], 16); //L
            } else if (current_station == 4) {
                hide_sprite(&shadowOAM, 0);
            }



            obj_aff_rotate(&obj_aff_buffer[1], directions[(player_ship.heading/32) % 16]<<7);
            //REG_BG2HOFF = mountain_hoff >> 3;
            //REG_BG1HOFF = mountain_hoff >> 2;
            REG_BG2HOFF = world_offset >> 3;
            REG_BG1HOFF = world_offset >> 2;
            //buttons
            //collision checks
            //draw stuff
            //fillScreen4(BLACKID);
            //draw_cursor(cursor_positionX, cursor_positionY, REDID, 0);
            
            
            if (BUTTON_PRESSED(BUTTON_SELECT)) {
                int offset = 10;
                DMANow(3, 3, &SCREENBLOCK[31], 10);
            }
            if (BUTTON_PRESSED(BUTTON_START)) {
                hide_all_sprites(&shadowOAM);
                change_state(PAUSE_STATE);
            }
            if (BUTTON_PRESSED(BUTTON_A)) {
                change_state(WIN_STATE);
            }
            if (BUTTON_PRESSED(BUTTON_B)) {
                change_state(LOSE_STATE);
            }



        } else if (STATE==PAUSE_STATE) {
            if (oldSTATE != STATE) {
                oldSTATE = STATE;
                //DMANow(3, PauseMenuPal, PALETTE, 256);
                REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(22) | BG_4BPP | BG_SIZE_SMALL;
                DMANow(3, PauseMenuTiles, &CHARBLOCK[1], PauseMenuTilesLen / 2);
                DMANow(3, PauseMenuMap, &SCREENBLOCK[22], PauseMenuMapLen / 2);
                REG_BG1HOFF = -16;
                REG_BG1VOFF = -16;
                temp_pal = 0;
                
            }
            if (BUTTON_PRESSED(BUTTON_A)) {
                if (temp_pal == 0) {change_state(GAME_STATE);}
                if (temp_pal == 1) {change_state(SPLASHSCREEN_STATE);}
            }
            if (BUTTON_PRESSED(BUTTON_START)) {
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
            flipPage();
            DMANow(3, winPal, PALETTE, 256);
            drawFullscreenImage4(winBitmap);
            if (BUTTON_PRESSED(BUTTON_A)) {
                change_state(SPLASHSCREEN_STATE);
            }
        } else if (STATE==LOSE_STATE) {
            flipPage();
            DMANow(3, losePal, PALETTE, 256);
            drawFullscreenImage4(loseBitmap);
            if (BUTTON_PRESSED(BUTTON_A)) {
                change_state(SPLASHSCREEN_STATE);
            }
        }



        frameCount++;
        oldButtons = buttons;
    }
}
