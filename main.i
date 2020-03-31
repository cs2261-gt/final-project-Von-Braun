# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef short s16;
typedef int s32;
# 32 "myLib.h"
typedef u16 Tile[32];
typedef Tile TileBlock[256];

typedef u8 Tile8x8[32];
typedef Tile8x8 TileBlock8x8[512];
typedef u16 BG_tile[16];
# 86 "myLib.h"
extern unsigned short *videoBuffer;
# 107 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 179 "myLib.h"
void hideSprites();






typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} ANISPRITE;
# 222 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 233 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 273 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "main.c" 2
# 1 "bitmaps\\splashscreen.h" 1
# 21 "bitmaps\\splashscreen.h"
extern const unsigned short splashscreenBitmap[19200];


extern const unsigned short splashscreenPal[256];
# 3 "main.c" 2
# 1 "bitmaps\\Instructions.h" 1
# 21 "bitmaps\\Instructions.h"
extern const unsigned short InstructionsBitmap[19200];


extern const unsigned short InstructionsPal[256];
# 4 "main.c" 2
# 1 "bitmaps\\win.h" 1
# 21 "bitmaps\\win.h"
extern const unsigned short winBitmap[19200];


extern const unsigned short winPal[256];
# 5 "main.c" 2
# 1 "bitmaps\\lose.h" 1
# 21 "bitmaps\\lose.h"
extern const unsigned short loseBitmap[19200];


extern const unsigned short losePal[256];
# 6 "main.c" 2
# 1 "TiledMaps\\ship_ui.h" 1
# 22 "TiledMaps\\ship_ui.h"
extern const unsigned short ship_uiTiles[2448];


extern const unsigned short ship_uiMap[1024];


extern const unsigned short ship_uiPal[256];
# 7 "main.c" 2
# 1 "TiledMaps\\stars.h" 1
# 22 "TiledMaps\\stars.h"
extern const unsigned short starsTiles[304];


extern const unsigned short starsMap[4096];


extern const unsigned short starsPal[256];
# 8 "main.c" 2
# 1 "TiledMaps\\mountains.h" 1
# 22 "TiledMaps\\mountains.h"
extern const unsigned short mountainsTiles[288];


extern const unsigned short mountainsMap[2048];


extern const unsigned short mountainsPal[256];
# 9 "main.c" 2
# 1 "TiledMaps\\craters.h" 1
# 22 "TiledMaps\\craters.h"
extern const unsigned short cratersTiles[352];


extern const unsigned short cratersMap[2048];


extern const unsigned short cratersPal[256];
# 10 "main.c" 2
# 1 "TiledMaps\\PauseMenu.h" 1
# 22 "TiledMaps\\PauseMenu.h"
extern const unsigned short PauseMenuTiles[1280];


extern const unsigned short PauseMenuMap[1024];


extern const unsigned short PauseMenuPal[256];
# 11 "main.c" 2
# 1 "Sprites\\spritesheet.h" 1
# 21 "Sprites\\spritesheet.h"
extern const unsigned short spritesheetTiles[2048];


extern const unsigned short spritesheetPal[256];
# 12 "main.c" 2
# 1 "Sprites\\ship_000.h" 1
# 21 "Sprites\\ship_000.h"
extern const unsigned short ship_000Tiles[16384];


extern const unsigned short ship_000Pal[256];
# 13 "main.c" 2



volatile u16* scanlineCounter = (u16*) 0x04000006;
unsigned int frameCount = 0;
unsigned short buttons;
unsigned short oldButtons;
short heading = 0;
enum STATE_TYPES {SPLASHSCREEN_STATE, INSTRUCTION_STATE, GAME_STATE, PAUSE_STATE, WIN_STATE, LOSE_STATE};
enum STATE_TYPES STATE = -1;
enum STATE_TYPES oldSTATE;
int mountain_hoff;
short temp_pal = 0;
char video_initialized = 0;
int sprite_count = 0;
s16 game_counter = 0;
u8 game_level = 1;
u32 game_score = 0;
u8 game_target_station = 1;



void switch_graphics_mode(char new_mode) {
    if ( video_initialized == 0 || (new_mode == 4 && (STATE==GAME_STATE || STATE==PAUSE_STATE ))) {
        video_initialized = 1;
        for (int i = 0; i < 256; i++) {
                ((unsigned short *)0x5000000)[i] = 0;
        }
        (*(volatile unsigned short*)0x400000C) = 0x00000000;
        (*(volatile unsigned short *)0x04000018) = 0;
        (*(volatile unsigned short *)0x0400001A) = 0;
        (*(unsigned short *)0x4000000) = 4 | (1<<10) | (1<<4);
    } else if (new_mode == 0) {


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
    mountain_hoff = 0;
}


void hbl_pal_invert() {
    ((unsigned short *)0x5000000)[0x6] ^= 0x7FFF;

    (*(volatile unsigned short *)0x4000202) = 0x0002;
}
void hbl_pal_invert_vcnt() {
    DMANow(3, ((unsigned short *)0x5000000), ((unsigned short *)0x5000000)+16, 16);
    DMANow(3, PauseMenuPal, ((unsigned short *)0x5000000), 16);

    if (temp_pal == 1) {
        temp_pal = ((unsigned short *)0x5000000)[0x8];
        ((unsigned short *)0x5000000)[0x8] = ((unsigned short *)0x5000000)[0xa];
        ((unsigned short *)0x5000000)[0xa] = temp_pal;
        temp_pal = 1;
    }
    while((*(volatile unsigned short *)0x4000006)<90);
    DMANow(3, ((unsigned short *)0x5000000)+16, ((unsigned short *)0x5000000), 16);


    (*(volatile unsigned short *)0x4000202) = 0x0004;
}
typedef void (*fnptr)(void);

void begin_interupts_hblank() {
    *(fnptr*)(0x03007FFC)= hbl_pal_invert;
    (*(volatile unsigned short *)0x4000004) |= 0x0010;
    (*(volatile unsigned short *)0x4000200) |= 0x0002;
    (*(volatile unsigned short *)0x4000208)= 1;
}

void begin_interupts_vcount() {
    *(fnptr*)(0x03007FFC) = hbl_pal_invert_vcnt;
    (*(volatile unsigned short *)0x4000004) = ((*(volatile unsigned short *)0x4000004) & 0xFF) | (28<<8);
    (*(volatile unsigned short *)0x4000004) |= 0x0020;

    (*(volatile unsigned short *)0x4000200) |= 0x0004;
    (*(volatile unsigned short *)0x4000208)= 1;
}
void stop_interupts() {
    (*(volatile unsigned short *)0x4000208) = 0;
}




void write_sprite_data(OBJ_ATTR* shadow, char count) {
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), count*4);
}
void set_sprite_location(OBJ_ATTR *shadow, char sprite_index, short x, short y) {
    x &= 0x1FF;
    y &= 0xFF;
    (shadow+sprite_index)->attr0 &= ~0xFF;
    (shadow+sprite_index)->attr0 |= y;
    (shadow+sprite_index)->attr1 &= ~0x1FF;
    (shadow+sprite_index)->attr1 |= x;
}

void hide_all_sprites(OBJ_ATTR *shadow) {
    char sprite_index = sprite_count;
    while(sprite_index--) {
        hide_sprite(shadow, sprite_index);
    }
}
void hide_sprite(OBJ_ATTR *shadow, char sprite_index) {
        (shadow+sprite_index)->attr0 &= ~0x300;
        (shadow+sprite_index)->attr0 |= (2<<8);
}
void show_all_sprites(OBJ_ATTR *shadow) {
    char sprite_index = sprite_count;
    while(sprite_index--) {
        show_sprite(shadow, sprite_index);
    }
}
void show_sprite(OBJ_ATTR *shadow, char sprite_index) {
    (shadow+sprite_index)->attr0 &= ~0x300;
    if (sprite_index == 10) {
        (shadow+sprite_index)->attr0 |= (1<<8);
    } else {
        (shadow+sprite_index)->attr0 |= 0x000;
    }

}


extern s16 sin_lut[514];

s32 lu_sin(u32 theta){ return sin_lut[(theta>>7)&0x1FF]; }
s32 lu_cos(u32 theta){ return sin_lut[((theta>>7)+128)&0x1FF]; }

typedef struct OBJ_AFFINE {
 u16 fill0[3]; s16 pa;
 u16 fill1[3]; s16 pb;
 u16 fill2[3]; s16 pc;
 u16 fill3[3]; s16 pd;
} __attribute__((aligned(4))) OBJ_AFFINE;

static inline void obj_aff_rotate(OBJ_AFFINE *oaff, u16 alpha) {

 int ss= lu_sin(alpha)>>4, cc= lu_cos(alpha)>>4;
 oaff->pa= cc; oaff->pb= -ss;
 oaff->pc= ss; oaff->pd= cc;
}
static inline void obj_aff_identity(OBJ_AFFINE *oaff)
{
 oaff->pa= 0x0100l; oaff->pb= 0;
 oaff->pc= 0; oaff->pd= 0x0100;
}





s32 world_offset = 0;
s32 old_world_offset = 0;



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
        player_ship.horizontal_speed = (((player_ship.horizontal_speed-2) > (0)) ? (player_ship.horizontal_speed-2) : (0));
    } else if (player_ship.horizontal_speed < 0) {
        player_ship.horizontal_speed = (((player_ship.horizontal_speed+2) < (0)) ? (player_ship.horizontal_speed+2) : (0));
    }

    if (frameCount%(16 - abs(player_ship.vertical_speed)/15) == 0) {
        if (player_ship.vertical_speed < 0) {
            player_ship.height = (((103) < (player_ship.height - 1)) ? (103) : (player_ship.height - 1));
        } else if (player_ship.vertical_speed > 0) {
            player_ship.height = (((103) < (player_ship.height + 1)) ? (103) : (player_ship.height + 1));
        }
    }
    if (player_ship.height < 103) {
        player_ship.vertical_speed = (((-240) > ((((240) < (player_ship.vertical_speed + 1)) ? (240) : (player_ship.vertical_speed + 1)))) ? (-240) : ((((240) < (player_ship.vertical_speed + 1)) ? (240) : (player_ship.vertical_speed + 1))));
    } else {
        player_ship.vertical_speed = 0;
    }
# 252 "main.c"
}
void turn_player(short delta) {

    if (player_ship.heading + delta < 0) {
        player_ship.heading += 511;
    }
    player_ship.heading = ( player_ship.heading + delta ) % 512;
}
void activate_thrusters() {

    char horizontal_delta = 8;
    short horizontal_limit = 800;
    short vertical_delta = 4;
    short vertical_limit = 240;
    char dir = (player_ship.heading/32) % 16;
    if (dir==0 || dir==8) {

        player_ship.vertical_speed += ((dir-4)/4) * vertical_delta;
    } else if (dir==4 || dir==12) {
        player_ship.horizontal_speed += ((dir-8)/4) * horizontal_delta;
    } else if (dir==1 || dir==15) {
        player_ship.vertical_speed -= vertical_delta;
        player_ship.horizontal_speed += ((dir-8)/7) * horizontal_delta/2;
    } else if (dir==3 || dir==5) {
        player_ship.vertical_speed += (dir-4) * vertical_delta/2;
        player_ship.horizontal_speed += -horizontal_delta;
    } else if (dir==11 || dir==13) {
        player_ship.vertical_speed -= (dir-12) * vertical_delta/2;
        player_ship.horizontal_speed += horizontal_delta;
    } else if (dir==7 || dir==9) {
        player_ship.vertical_speed += vertical_delta;
        player_ship.horizontal_speed += (dir-8) * horizontal_delta/2;
    } else if (dir==2 || dir==14) {
        player_ship.vertical_speed -= vertical_delta;
        player_ship.horizontal_speed += (dir-8)/6 * horizontal_delta;
    } else if (dir==6 || dir==10) {
        player_ship.vertical_speed += vertical_delta;
        player_ship.horizontal_speed += (dir-8)/2 * horizontal_delta;
    }
    player_ship.vertical_speed = (((-vertical_limit) > ((((vertical_limit) < (player_ship.vertical_speed)) ? (vertical_limit) : (player_ship.vertical_speed)))) ? (-vertical_limit) : ((((vertical_limit) < (player_ship.vertical_speed)) ? (vertical_limit) : (player_ship.vertical_speed))));
    player_ship.horizontal_speed = (((-horizontal_limit) > ((((horizontal_limit) < (player_ship.horizontal_speed)) ? (horizontal_limit) : (player_ship.horizontal_speed)))) ? (-horizontal_limit) : ((((horizontal_limit) < (player_ship.horizontal_speed)) ? (horizontal_limit) : (player_ship.horizontal_speed))));
}

void overwrite_BG_tile(int spritesheet_index, int BG0_index, int sprite_start_line, int BG0_start_line, int lines_to_copy) {



    int BG0_tile_address = ((BG_tile*)&((screenblock *)0x6000000)[0]) + BG0_index;
    BG0_tile_address = ((u32*)BG0_tile_address) + BG0_start_line;
    int sprite_address = &((TileBlock*)0x6000000)[4][spritesheet_index];
    sprite_address = ((u32*)sprite_address) + sprite_start_line;
    DMANow(3, sprite_address, BG0_tile_address, lines_to_copy*2);
}

void set_counter(short counter) {
    char digits[3] = { (counter/100)%10, (counter/10)%10, counter%10 };
    for (char i = 0; i < 3; i++) {
        overwrite_BG_tile(8+16*digits[i], 126+i, 0, 5, 3);
        overwrite_BG_tile(8+16*digits[i], 145+i, 3, 0, 5);
    }
}
void set_score(u32 score) {
    char digits[6] = { (score/100000)%10, (score/10000)%10, (score/1000)%10, (score/100)%10, (score/10)%10, score%10 };
    for (char i = 0; i < 6; i++) {
        overwrite_BG_tile(8+16*digits[i], 13+i, 0, 5, 3);
        overwrite_BG_tile(8+16*digits[i], 40+i, 3, 0, 5);
    }
}
void set_level(u8 game_level) {
    overwrite_BG_tile(9+16*game_level, 26, 0, 5, 3);
    overwrite_BG_tile(9+16*game_level, 54, 3, 0, 5);
}
void set_compass(u8 letter, char arrow_direction) {

    overwrite_BG_tile(10+16*letter, 9, 0, 5, 3);
    overwrite_BG_tile(10+16*letter, 36, 3, 0, 5);

    overwrite_BG_tile(11+16*arrow_direction, 10, 0, 5, 3);
    overwrite_BG_tile(11+16*arrow_direction, 37, 3, 0, 5);
}
void set_compass_target(char current_station, char target) {
    if (target > current_station) {
        set_compass(target, 0);
    } else if (target < current_station) {
        set_compass(target, 1);
    } else {

    }

}

int main() {
    int mothership_world_x_coord = 0;
    oldButtons = 0xFFFF;
    buttons = (*(volatile unsigned short *)0x04000130);
    int cursor_positionX = 20;
    int cursor_positionY = 20;
    int cursor_speed = 1;
    char station_visable = 1;
    short current_station = 1;
    u8 resource_amount[4] = { 0, 0, 0, 0 };
    OBJ_ATTR shadowOAM[128];
    OBJ_ATTR *spriteAttribs = &shadowOAM[0];

    OBJ_AFFINE *obj_aff_buffer = (OBJ_AFFINE*)shadowOAM;
    s16 directions[16];
    change_state(SPLASHSCREEN_STATE);
    while(1) {
        waitForVBlank();

        DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128*4);
        buttons = (*(volatile unsigned short *)0x04000130);



        if (STATE==SPLASHSCREEN_STATE) {
           if (oldSTATE != STATE) {
               oldSTATE = STATE;
                DMANow(3, splashscreenPal, ((unsigned short *)0x5000000), 256);
                drawFullscreenImage4(splashscreenBitmap);
                flipPage();

                drawFullscreenImage4(splashscreenBitmap);
                flipPage();
            }
            if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
                initialize_GAME();
                change_state(GAME_STATE);
            }
            if ((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1))))) {
                change_state(INSTRUCTION_STATE);
            }



        } else if (STATE == INSTRUCTION_STATE) {
            if (oldSTATE != STATE) {
               oldSTATE = STATE;
                DMANow(3, InstructionsPal, ((unsigned short *)0x5000000), 256);
                drawFullscreenImage4(InstructionsBitmap);
                flipPage();
                drawFullscreenImage4(InstructionsBitmap);
                flipPage();
            }
            if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
                initialize_GAME();
                change_state(GAME_STATE);
            }
            if ((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1))))) {
                change_state(SPLASHSCREEN_STATE);
            }



        } else if (STATE==GAME_STATE) {
            if (oldSTATE != STATE) {
                oldSTATE = STATE;
                temp_pal = 0;
# 492 "main.c"
                DMANow(3, ship_uiPal, ((unsigned short *)0x5000000), 256);
# 509 "main.c"
                (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((25)<<8) | (0<<7) | (0<<14) | (0);
                DMANow(3, ship_uiTiles, &((charblock *)0x6000000)[0], 4896 / 2);
                DMANow(3, ship_uiMap, &((screenblock *)0x6000000)[25], 2048 / 2);

                (*(volatile unsigned short *)0x04000010) = 0;

                (*(volatile unsigned short*)0x400000A) = ((1)<<2) | ((22)<<8) | (0<<7) | (1<<14) | (1);
                DMANow(3, cratersTiles, &((charblock *)0x6000000)[1], 704 / 2);
                DMANow(3, cratersMap, &((screenblock *)0x6000000)[22], 4096 / 2);
                (*(volatile unsigned short *)0x04000014) = 0;
                (*(volatile unsigned short *)0x04000016) = -112;

                (*(volatile unsigned short*)0x400000C) = ((2)<<2) | ((26)<<8) | (0<<7) | (1<<14) | (2);
                DMANow(3, mountainsTiles, &((charblock *)0x6000000)[2], 576 / 2);
                DMANow(3, mountainsMap, &((screenblock *)0x6000000)[26], 4096 / 2);
                (*(volatile unsigned short *)0x04000018) = 0;
                (*(volatile unsigned short *)0x0400001A) = -96;

                (*(volatile unsigned short*)0x400000E) = ((3)<<2) | ((28)<<8) | (0<<7) | (3<<14) | (3);
                DMANow(3, starsTiles, &((charblock *)0x6000000)[3], 608 / 2);
                DMANow(3, starsMap, &((screenblock *)0x6000000)[28], 8192 / 2);
                (*(volatile unsigned short *)0x0400001C) = 0;


                sprite_count = 1;
                DMANow(3, ship_000Tiles, &((TileBlock*)0x6000000)[4][0], 32768 / 2);
                DMANow(3, ship_000Pal, ((unsigned short *)0x5000200), 256);





                shadowOAM[0].attr0 = (90-8) | (0<<13) | (1<<14);
                shadowOAM[0].attr1 = 40 | (3<<14);
                shadowOAM[0].attr2 = 2 | ((2)<<10);


                shadowOAM[10].attr0 = (90) | (0<<13) | (0<<14) | (1<<8);
                shadowOAM[10].attr1 = 40 | (1<<14) | ((1)<<9);
                shadowOAM[10].attr2 = 64 | ((1)<<10);

                obj_aff_rotate(&obj_aff_buffer[1], (128+64+32)<<7);
                for (char i = 0; i < 16; i++) {
                    if (i == 0) {
                        directions[0] = 0;
                    } else {
                        directions[i] = directions[i-1] + 32;
                    }
                }

                shadowOAM[6].attr0 = 30 | (0<<13) | (0<<14);
                shadowOAM[6].attr1 = 104 | (2<<14);
                shadowOAM[6].attr2 = 24 | ((1)<<10) | ((1)<<12);




                shadowOAM[2].attr0 = 132+6*3 | (0<<13) | (1<<14);
                shadowOAM[2].attr1 = (13-62)&0x1FF | (3<<14);
                shadowOAM[2].attr2 = 136 | ((2)<<10) | ((2)<<12);

                shadowOAM[3].attr0 = 132 | (0<<13) | (1<<14);
                shadowOAM[3].attr1 = (13-62)&0x1FF | (3<<14);
                shadowOAM[3].attr2 = 136 | ((2)<<10) | ((2)<<12);

                shadowOAM[4].attr0 = 132+6*2 | (0<<13) | (1<<14);
                shadowOAM[4].attr1 = (13-62)&0x1FF | (3<<14);
                shadowOAM[4].attr2 = 136 | ((2)<<10) | ((2)<<12);

                shadowOAM[5].attr0 = 132+6 | (0<<13) | (1<<14);
                shadowOAM[5].attr1 = (13-62)&0x1FF | (3<<14);
                shadowOAM[5].attr2 = 136 | ((2)<<10) | ((2)<<12);


                set_counter(game_counter);
                set_score(game_score);
                set_level(game_level);

                set_compass_target(current_station, game_target_station);

                show_sprite(&shadowOAM, -1);

                (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<9) | (1<<10) | (1<<11) | (1<<12) | (0<<6);
            }

            if (frameCount%30==0) {
                if (temp_pal == 0) {
                    temp_pal = 1;
                    ((unsigned short *)0x5000000)[0xd] = 0x0380;
                    ((unsigned short *)0x5000200)[0x9] = 0x0380;
                } else {
                    temp_pal = 0;
                    ((unsigned short *)0x5000000)[0xd] = 0x0000;
                    ((unsigned short *)0x5000200)[0x9] = 0x0000;
                }
            }
            if (frameCount%60==0) {
                if (game_counter < 0) {
                    change_state(LOSE_STATE);
                }
                set_counter(game_counter);
                game_counter--;
            }

            if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<6)))) {activate_thrusters();}
            if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<7)))) {activate_thrusters();}
            if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {mountain_hoff = -1;turn_player(4);}
            else if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {mountain_hoff = 1;turn_player(-4);}
            move_player();
            set_sprite_location(&shadowOAM, 10, 120 - 8, player_ship.height);
# 628 "main.c"
            short station_offset = 128+16;







            short station_x_coord = (station_offset-(world_offset >> 2)) & 0x1FF;
            station_x_coord |= (~0x1FF) * (station_x_coord>>8);
            set_sprite_location(&shadowOAM, 0, station_x_coord, 86);
            set_sprite_location(&shadowOAM, 6, mothership_world_x_coord++, 20);

            if (station_x_coord < 120-5 && station_x_coord > 120-5-18 && current_station >=0 && current_station < 4) {
                if (player_ship.height >= 103) {
                    if (frameCount%10==0) {
                        u8 sprite_heights[4] = {132+6*3, 132, 132+6*2, 132+6};
                        resource_amount[current_station] = (((62) < (resource_amount[current_station] + 1)) ? (62) : (resource_amount[current_station] + 1));
                        set_sprite_location(&shadowOAM, 2+current_station, 13-62 + resource_amount[current_station], sprite_heights[current_station]);
                    }
                    if (resource_amount[current_station] != 62) {
                        game_score++;
                        set_score(game_score);
                    }
                }
                if (current_station == game_target_station && frameCount%10==0) {
                    set_compass(game_target_station, 2);
                }

            }

            if (station_x_coord <= -64 && station_visable != 1 && player_ship.horizontal_speed > 0) {
                current_station = (((4) < (current_station + 1)) ? (4) : (current_station + 1));
                station_visable = 1;
            }
            if (station_x_coord <= -64 && station_visable != 2 && player_ship.horizontal_speed < 0) {
                current_station = (((-1) > (current_station - 1)) ? (-1) : (current_station - 1));
                station_visable = 2;
            }
            if (station_x_coord > -64 && station_x_coord < 240) {
                station_visable = 0;
            }
            if (station_visable==0 && current_station == game_target_station && station_x_coord < 120-22) {
                set_compass(game_target_station, 1);
            } else if (station_visable==0 && current_station == game_target_station && station_x_coord > 120 - 4) {
                set_compass(game_target_station, 0);
            }
            if (current_station == -1) {
                hide_sprite(&shadowOAM, 0);
            } else if (current_station == 0) {
                show_sprite(&shadowOAM, 0);
                DMANow(3, &((TileBlock*)0x6000000)[4][5+48], &((TileBlock*)0x6000000)[4][3+32], 16);
            } else if (current_station == 1) {
                DMANow(3, &((TileBlock*)0x6000000)[4][5+0], &((TileBlock*)0x6000000)[4][3+32], 16);
            } else if (current_station == 2) {
                DMANow(3, &((TileBlock*)0x6000000)[4][5+32], &((TileBlock*)0x6000000)[4][3+32], 16);
            } else if (current_station == 3) {
                show_sprite(&shadowOAM, 0);
                DMANow(3, &((TileBlock*)0x6000000)[4][5+16], &((TileBlock*)0x6000000)[4][3+32], 16);
            } else if (current_station == 4) {
                hide_sprite(&shadowOAM, 0);
            }



            obj_aff_rotate(&obj_aff_buffer[1], directions[(player_ship.heading/32) % 16]<<7);


            (*(volatile unsigned short *)0x04000018) = world_offset >> 3;
            (*(volatile unsigned short *)0x04000014) = world_offset >> 2;







            if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
                int offset = 10;
                DMANow(3, 3, &((screenblock *)0x6000000)[31], 10);
            }
            if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
                hide_all_sprites(&shadowOAM);
                change_state(PAUSE_STATE);
            }
            if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
                change_state(WIN_STATE);
            }
            if ((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1))))) {
                change_state(LOSE_STATE);
            }



        } else if (STATE==PAUSE_STATE) {
            if (oldSTATE != STATE) {
                oldSTATE = STATE;

                (*(volatile unsigned short*)0x400000A) = ((1)<<2) | ((22)<<8) | (0<<7) | (0<<14);
                DMANow(3, PauseMenuTiles, &((charblock *)0x6000000)[1], 2560 / 2);
                DMANow(3, PauseMenuMap, &((screenblock *)0x6000000)[22], 2048 / 2);
                (*(volatile unsigned short *)0x04000014) = -16;
                (*(volatile unsigned short *)0x04000016) = -16;
                temp_pal = 0;

            }
            if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
                if (temp_pal == 0) {change_state(GAME_STATE);}
                if (temp_pal == 1) {change_state(SPLASHSCREEN_STATE);}
            }
            if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
                if (temp_pal == 0) {change_state(GAME_STATE);}
                if (temp_pal == 1) {change_state(SPLASHSCREEN_STATE);}
            }
            if ((!(~(oldButtons)&((1<<6))) && (~buttons & ((1<<6))))) {
                if (temp_pal == 1) {
                    temp_pal = 0;
                }
            }
            if ((!(~(oldButtons)&((1<<7))) && (~buttons & ((1<<7))))) {
                if (temp_pal == 0) {
                    temp_pal = 1;
                }
            }



        } else if (STATE==WIN_STATE) {
            flipPage();
            DMANow(3, winPal, ((unsigned short *)0x5000000), 256);
            drawFullscreenImage4(winBitmap);
            if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
                change_state(SPLASHSCREEN_STATE);
            }
        } else if (STATE==LOSE_STATE) {
            flipPage();
            DMANow(3, losePal, ((unsigned short *)0x5000000), 256);
            drawFullscreenImage4(loseBitmap);
            if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
                change_state(SPLASHSCREEN_STATE);
            }
        }



        frameCount++;
        oldButtons = buttons;
    }
}
