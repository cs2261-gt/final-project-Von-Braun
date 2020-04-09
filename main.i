# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef char s8;
typedef short s16;
typedef int s32;
typedef volatile u8 vu8;
typedef volatile u16 vu16;
typedef volatile u32 vu32;
typedef volatile s8 vs8;
typedef volatile s16 vs16;
typedef volatile s32 vs32;
# 41 "myLib.h"
typedef u16 Tile[32];
typedef Tile TileBlock[256];

typedef u8 Tile8x8[32];
typedef Tile8x8 TileBlock8x8[512];
typedef u16 BG_tile[16];
# 64 "myLib.h"
typedef struct BG_AFFINE {
    s16 pa, pb;
    s16 pc, pd;
    s32 dx, dy
} __attribute__((aligned(4))) BG_AFFINE;
# 112 "myLib.h"
extern unsigned short *videoBuffer;
# 133 "myLib.h"
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
void overwrite_BG_tile(u32 spritesheet_index, u32 BG0_index, u32 sprite_start_line, u32 BG0_start_line, u32 lines_to_copy);


typedef struct OBJ_SHIP {
    char height;
    short horizontal_speed;
    short vertical_speed;
    short heading;
    char docking_type;
} OBJ_SHIP;



typedef void (*fnptr)(void);
# 183 "myLib.h"
typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;


typedef struct OBJ_AFFINE {
 u16 fill0[3]; s16 pa;
 u16 fill1[3]; s16 pb;
 u16 fill2[3]; s16 pc;
 u16 fill3[3]; s16 pd;
} __attribute__((aligned(4))) OBJ_AFFINE;



extern OBJ_ATTR shadowOAM[];
extern u8 sprite_count;
# 233 "myLib.h"
void hideSprites();
void obj_aff_rotate(OBJ_AFFINE *oaff, u16 alpha);
void obj_aff_identity(OBJ_AFFINE *oaff);
void write_sprite_data(char count);
void set_sprite_location(char sprite_index, short x, short y);
void hide_all_sprites();
void hide_sprite(char sprite_index);
void show_all_sprites();
void show_sprite(u8 sprite_index);






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
# 284 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 295 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 335 "myLib.h"
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
# 1 "TiledMaps\\Splash_border.h" 1
# 22 "TiledMaps\\Splash_border.h"
extern const unsigned short Splash_borderTiles[1360];


extern const unsigned short Splash_borderMap[1024];


extern const unsigned short Splash_borderPal[64];
# 12 "main.c" 2
# 1 "TiledMaps\\Spash_checkers.h" 1
# 22 "TiledMaps\\Spash_checkers.h"
extern const unsigned short Spash_checkersTiles[48];


extern const unsigned short Spash_checkersMap[1024];


extern const unsigned short Spash_checkersPal[256];
# 13 "main.c" 2
# 1 "TiledMaps\\Splash_title_text.h" 1
# 22 "TiledMaps\\Splash_title_text.h"
extern const unsigned short Splash_title_textTiles[1920];


extern const unsigned short Splash_title_textMap[1024];


extern const unsigned short Splash_title_textPal[256];
# 14 "main.c" 2
# 1 "TiledMaps\\spash_checkers_affine.h" 1
# 22 "TiledMaps\\spash_checkers_affine.h"
extern const unsigned short spash_checkers_affineTiles[96];


extern const unsigned short spash_checkers_affineMap[512];


extern const unsigned short spash_checkers_affinePal[64];
# 15 "main.c" 2
# 1 "Sprites\\spritesheet.h" 1
# 21 "Sprites\\spritesheet.h"
extern const unsigned short spritesheetTiles[2048];


extern const unsigned short spritesheetPal[256];
# 16 "main.c" 2
# 1 "Sprites\\ship_000.h" 1
# 21 "Sprites\\ship_000.h"
extern const unsigned short ship_000Tiles[16384];


extern const unsigned short ship_000Pal[256];
# 17 "main.c" 2


volatile u16* scanlineCounter = (u16*) 0x04000006;
unsigned int frameCount = 0;
unsigned short buttons;
unsigned short oldButtons;
enum STATE_TYPES {SPLASHSCREEN_STATE, INSTRUCTION_STATE, GAME_STATE, PAUSE_STATE, WIN_STATE, LOSE_STATE};
enum STATE_TYPES STATE = -1;
enum STATE_TYPES oldSTATE;
short temp_pal = 0;
s16 game_counter = 0;
u8 game_level = 1;
u32 game_score = 0;
u8 game_target_station = 1;
char station_visable = 0;
short current_station = 1;
u8 station_order[5] = {255, 3, 0, 2, 1};
s32 world_offset = 0;
int mothership_world_x_coord = 0;
u32 mothership_world_y_coord = 24;
char turning_speed = 4;
u8 resource_amount[4] = { 0, 0, 0, 0 };
u8 resource_counter = 0;
OBJ_AFFINE *obj_aff_buffer = (OBJ_AFFINE*)shadowOAM;
OBJ_SHIP player_ship;
s16 directions[16] = {0, 32, 64, 96, 128, 160, 192, 224, 256, 288, 320, 352, 384, 416, 448, 480};
BG_AFFINE bg_aff_current = { 256, 0, 0, 256, 0, 0 };



void switch_graphics_mode(char new_mode) {
    if (new_mode == 4 && (STATE==GAME_STATE || STATE==SPLASHSCREEN_STATE || STATE==PAUSE_STATE )) {
        for (int i = 0; i < 256; i++) {
                ((unsigned short *)0x5000000)[i] = 0;
        }
        (*(volatile unsigned short*)0x400000C) = 0x00000000;
        (*(volatile unsigned short *)0x04000018) = 0;
        (*(volatile unsigned short *)0x0400001A) = 0;
        bg_aff_current.pa = 256;
        bg_aff_current.pb = 0;
        bg_aff_current.pc = 0;
        bg_aff_current.pd = 256;
        bg_aff_current.dx = 0;
        bg_aff_current.dy = 0;
        ((BG_AFFINE*)(0x04000000+0x0000))[2] = bg_aff_current;
        (*(unsigned short *)0x4000000) = 4 | (1<<10) | (1<<4);
    } else if (new_mode == 0) {

    } else if (new_mode == 1) {

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
    game_target_station = 1;
    mothership_world_x_coord = 0;
    station_visable = 1;
    current_station = 1;
    resource_counter = 0;
    temp_pal = 0;
    for (char i = 0; i < 4; i++) {
        resource_amount[i] = 0;
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
    player_ship.docking_type = 0;
}

u8 next_station(){
    u8 next = station_order[game_target_station];
    if (next==255) {
        change_state(WIN_STATE);
    }
    return next;
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

        if (player_ship.height < 8) {
            player_ship.height = 8;
            player_ship.vertical_speed = 0;
        }
    }

    if (player_ship.height < 103) {
        player_ship.vertical_speed = (((-240) > ((((240) < (player_ship.vertical_speed + 1)) ? (240) : (player_ship.vertical_speed + 1)))) ? (-240) : ((((240) < (player_ship.vertical_speed + 1)) ? (240) : (player_ship.vertical_speed + 1))));
    } else {
        player_ship.vertical_speed = 0;
    }
}
void turn_player(short delta) {
    if (player_ship.heading + delta < 0) {
        player_ship.heading += 511;
    }
    player_ship.heading = ( player_ship.heading + delta ) % 512;
}
void activate_thrusters() {

    u8 const horizontal_delta = 8;
    u16 const horizontal_limit = 800;
    u8 const vertical_delta = 4;
    u16 const vertical_limit = 240;
    u8 dir = (player_ship.heading/32) % 16;
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
void set_level(char game_level) {
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
    }
}



int main() {
    oldButtons = 0xFFFF;
    buttons = (*(volatile unsigned short *)0x04000130);
    u8 splash_current_direction = 0;
    u8 splash_scale_direction = 0;
    u8 splash_palette_bank = 0;
    double cubic_equation = 0;
    s32 integer_dx;
    change_state(SPLASHSCREEN_STATE);

    hide_all_sprites();
    write_sprite_data(128);

    while(1) {
        waitForVBlank();
        if (sprite_count != 0) {
            write_sprite_data(sprite_count);
        }
        buttons = (*(volatile unsigned short *)0x04000130);


        if (STATE==SPLASHSCREEN_STATE) {
            if (oldSTATE != STATE) {
               oldSTATE = STATE;
                (*(unsigned short *)0x4000000) = 1 | (1<<8) | (1<<9) | (1<<10) ;
                DMANow(3, Splash_borderPal, ((unsigned short *)0x5000000), 64);



                (*(volatile unsigned short*)0x4000008) = ((2)<<2) | ((25)<<8) | (0<<7) | (0<<14) | (0);
                DMANow(3, Splash_borderTiles, &((charblock *)0x6000000)[2], 2720 / 2);
                DMANow(3, Splash_borderMap, &((screenblock *)0x6000000)[25], 2048 / 2);
                (*(volatile unsigned short *)0x04000010) = 0;
                (*(volatile unsigned short *)0x04000012) = 0;

                (*(volatile unsigned short*)0x400000A) = ((1)<<2) | ((22)<<8) | (0<<7) | (0<<14) | (1);
                DMANow(3, Splash_title_textTiles, &((charblock *)0x6000000)[1], 3840 / 2);
                DMANow(3, Splash_title_textMap, &((screenblock *)0x6000000)[22], 2048 / 2);
                (*(volatile unsigned short *)0x04000014) = 0;
                (*(volatile unsigned short *)0x04000016) = 0;

                (*(volatile unsigned short*)0x400000C) = ((0)<<2) | ((30)<<8) | 0x4000 | (2) | 0x2000;
                DMANow(3, spash_checkers_affineTiles, &((charblock *)0x6000000)[0], 192 / 2);
                DMANow(3, spash_checkers_affineMap, &((screenblock *)0x6000000)[30], 1024 / 2);
                bg_aff_current.pa = 64;
                bg_aff_current.pb = 0;
                bg_aff_current.pc = 0;
                bg_aff_current.pd = 64;
                bg_aff_current.dx = 0;
                bg_aff_current.dy = 0;
                ((BG_AFFINE*)(0x04000000+0x0000))[2] = bg_aff_current;
                splash_current_direction = 0;
                splash_palette_bank = 2;

                ((unsigned short *)0x5000000)[16*4+1] = ((unsigned short *)0x5000000)[16*1+1];
                ((unsigned short *)0x5000000)[16*4+2] = ((unsigned short *)0x5000000)[16*1+2];
            }
            if (splash_current_direction==0) {
                bg_aff_current.dx+=512;
                if (bg_aff_current.dx >= 1<<16) {
                    splash_current_direction = 1;
                    splash_palette_bank = (splash_palette_bank+1)%3;
                    ((unsigned short *)0x5000000)[16*1+1] = ((unsigned short *)0x5000000)[16*(2+splash_palette_bank)+1];
                    ((unsigned short *)0x5000000)[16*1+2] = ((unsigned short *)0x5000000)[16*(2+splash_palette_bank)+2];
                }
            } else if (splash_current_direction==1) {
                bg_aff_current.dx-=512;
                if (bg_aff_current.dx <= 0) {
                    splash_current_direction = 0;
                }
            }

            integer_dx = ((bg_aff_current.dx*100)>>16)-50;

            cubic_equation = 0.0006*(integer_dx*integer_dx*integer_dx) - 0.8*integer_dx + 60;

            bg_aff_current.pa = ((u32)(83886*cubic_equation))>>15;
            bg_aff_current.pd = bg_aff_current.pa;
            ((BG_AFFINE*)(0x04000000+0x0000))[2] = bg_aff_current;


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
            if (oldSTATE == PAUSE_STATE) {

                show_all_sprites();
                (*(volatile unsigned short*)0x400000A) = ((1)<<2) | ((22)<<8) | (0<<7) | (1<<14) | (1);
                DMANow(3, cratersTiles, &((charblock *)0x6000000)[1], 704 / 2);
                DMANow(3, cratersMap, &((screenblock *)0x6000000)[22], 4096 / 2);
                (*(volatile unsigned short *)0x04000014) = 0;
                (*(volatile unsigned short *)0x04000016) = -112;
            } else if (oldSTATE != STATE) {
                oldSTATE = STATE;
# 401 "main.c"
                (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<9) | (1<<10) | (1<<11) | (1<<12) | (0<<6);
                DMANow(3, ship_uiPal, ((unsigned short *)0x5000000), 256);



                (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((25)<<8) | (0<<7) | (0<<14) | (0);
                DMANow(3, ship_uiTiles, &((charblock *)0x6000000)[0], 4896 / 2);
                DMANow(3, ship_uiMap, &((screenblock *)0x6000000)[25], 2048 / 2);
                (*(volatile unsigned short *)0x04000010) = 0;
                (*(volatile unsigned short *)0x04000012) = 0;

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
                (*(volatile unsigned short *)0x0400001E) = 0;


                sprite_count = 13;
                DMANow(3, ship_000Tiles, &((TileBlock*)0x6000000)[4][0], 32768 / 2);
                DMANow(3, ship_000Pal, ((unsigned short *)0x5000200), 256);

                shadowOAM[0].attr0 = (90-8) | (0<<13) | (1<<14);
                shadowOAM[0].attr1 = 40 | (3<<14);
                shadowOAM[0].attr2 = 2 | ((2)<<10);

                shadowOAM[12].attr0 = (0<<13) | (0<<14) | (3<<8);
                shadowOAM[12].attr1 = (1<<14) | ((1)<<9);
                shadowOAM[12].attr2 = 64 | ((1)<<10);
                obj_aff_rotate(&obj_aff_buffer[1], (128+64+32)<<7);

                shadowOAM[11].attr0 = (0<<13) | (0<<14);
                shadowOAM[11].attr1 = (2<<14);
                shadowOAM[11].attr2 = 24 | ((1)<<10) | ((1)<<12);


                shadowOAM[2].attr0 = 132+6*3 | (0<<13) | (1<<14);
                shadowOAM[2].attr1 = (13-62)&0x1FF | (3<<14);
                shadowOAM[2].attr2 = 136 | ((2)<<10) | ((0)<<12);
                shadowOAM[6].attr0 = 132+6*3 | (0<<13) | (1<<14);
                shadowOAM[6].attr1 = (13-62)&0x1FF | (3<<14);
                shadowOAM[6].attr2 = 136 | ((2)<<10) | ((2)<<12);

                shadowOAM[3].attr0 = 132 | (0<<13) | (1<<14);
                shadowOAM[3].attr1 = (13-62)&0x1FF | (3<<14);
                shadowOAM[3].attr2 = 136 | ((2)<<10) | ((0)<<12);
                shadowOAM[7].attr0 = 132+6*3 | (0<<13) | (1<<14);
                shadowOAM[7].attr1 = (13-62)&0x1FF | (3<<14);
                shadowOAM[7].attr2 = 136 | ((2)<<10) | ((2)<<12);

                shadowOAM[4].attr0 = 132+6*2 | (0<<13) | (1<<14);
                shadowOAM[4].attr1 = (13-62)&0x1FF | (3<<14);
                shadowOAM[4].attr2 = 136 | ((2)<<10) | ((0)<<12);
                shadowOAM[8].attr0 = 132+6*3 | (0<<13) | (1<<14);
                shadowOAM[8].attr1 = (13-62)&0x1FF | (3<<14);
                shadowOAM[8].attr2 = 136 | ((2)<<10) | ((2)<<12);

                shadowOAM[5].attr0 = 132+6 | (0<<13) | (1<<14);
                shadowOAM[5].attr1 = (13-62)&0x1FF | (3<<14);
                shadowOAM[5].attr2 = 136 | ((2)<<10) | ((0)<<12);
                shadowOAM[9].attr0 = 132+6*3 | (0<<13) | (1<<14);
                shadowOAM[9].attr1 = (13-62)&0x1FF | (3<<14);
                shadowOAM[9].attr2 = 136 | ((2)<<10) | ((2)<<12);


                set_counter(game_counter);
                set_score(game_score);
                set_level(game_level);
                set_compass_target(current_station, game_target_station);

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

            if (player_ship.docking_type == 0) {
                if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<6)))) {activate_thrusters();}
                if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<7)))) {activate_thrusters();}
                if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {turn_player(turning_speed);}
                else if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {turn_player(-turning_speed);}
            }
            if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {change_state(WIN_STATE);}
            if ((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1))))) {change_state(LOSE_STATE);}
            if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
                hide_all_sprites();

                for (u8 i = 2; i <= 9; i++) {
                   show_sprite(i);
                }
                change_state(PAUSE_STATE);
            }

            if(player_ship.docking_type == 0) {
                move_player();
                (*(volatile unsigned short *)0x04000018) = world_offset >> 3;
                (*(volatile unsigned short *)0x04000014) = world_offset >> 2;
            } else if (player_ship.docking_type == 1) {


            } else if (player_ship.docking_type == 2) {


                world_offset = ((mothership_world_x_coord- 120 + 16)<<2);
                (*(volatile unsigned short *)0x04000018) = world_offset >> 3;
                (*(volatile unsigned short *)0x04000014) = world_offset >> 2;

                if ((player_ship.heading/32) % 16 != 0) {
                    turn_player(turning_speed);
                }

                if (player_ship.height != 35 && frameCount%10==0) {
                    player_ship.height--;
                }

                if (frameCount%10==0 && player_ship.height==35) {
                    u8 sprite_heights[4] = {132+6*3, 132, 132+6*2, 132+6};
                    resource_counter = (((resource_amount[game_target_station]) < (resource_counter + 1)) ? (resource_amount[game_target_station]) : (resource_counter + 1));
                    set_sprite_location(2+game_target_station, 13-62 + resource_counter, sprite_heights[game_target_station]);
                }

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

            set_sprite_location(12, 120 - 8, player_ship.height);
            obj_aff_rotate(&obj_aff_buffer[1], directions[(player_ship.heading/32) % 16]<<7);


            s32 mothership_screen_x_coord = mothership_world_x_coord-(world_offset>>2);
            if (frameCount%5==0) {
                mothership_world_x_coord++;
            }

            if (mothership_screen_x_coord > -255 && mothership_screen_x_coord < 255) {
                set_sprite_location(11, mothership_screen_x_coord, mothership_world_y_coord);
            } else {
                set_sprite_location(11, -254, mothership_world_y_coord);
            }

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


            short station_offset = 128+16;
            short station_x_coord = (station_offset-(world_offset >> 2)) & 0x1FF;
            station_x_coord |= (~0x1FF) * (station_x_coord>>8);
            set_sprite_location(0, station_x_coord, 86);

            if (station_x_coord < 120-5 && station_x_coord > 120-5-18 && current_station >=0 && current_station < 4 && current_station==game_target_station) {

                if (player_ship.height >= 103) {

                    if (frameCount%10==0) {
                        u8 sprite_heights[4] = {132+6*3, 132, 132+6*2, 132+6};
                        resource_amount[current_station] = (((62) < (resource_amount[current_station] + 1)) ? (62) : (resource_amount[current_station] + 1));
                        set_sprite_location(6+current_station, 13-62 + resource_amount[current_station], sprite_heights[current_station]);
                    }

                    if (resource_amount[current_station] != 62) {
                        game_score++;
                        set_score(game_score);
                    }
                }

                if (current_station == game_target_station && frameCount%10==0) {
                    if (resource_amount[game_target_station]==0) {
                        set_compass(game_target_station, 2);
                    } else {
                        set_compass(game_target_station, 3);
                    }
                }
            }

            if (station_x_coord <= -64 && station_visable != 1 && (player_ship.horizontal_speed > 0 || player_ship.docking_type == 2)) {
                current_station = (((4) < (current_station + 1)) ? (4) : (current_station + 1));
                station_visable = 1;
            } else if (station_x_coord <= -64 && station_visable != 2 && player_ship.horizontal_speed < 0) {
                current_station = (((-1) > (current_station - 1)) ? (-1) : (current_station - 1));
                station_visable = 2;
            } else if (station_x_coord > -64 && station_x_coord < 240) {
                station_visable = 0;
            }

            if (station_visable==0 && current_station == game_target_station && station_x_coord < 120-22 && resource_amount[game_target_station]==0) {
                set_compass(game_target_station, 1);
            } else if (station_visable==0 && current_station == game_target_station && station_x_coord > 120 - 4 && resource_amount[game_target_station]==0) {
                set_compass(game_target_station, 0);
            }

            if (current_station == -1) {
                hide_sprite(0);
            } else if (current_station == 0) {
                show_sprite(0);
                DMANow(3, &((TileBlock*)0x6000000)[4][5+48], &((TileBlock*)0x6000000)[4][3+32], 16);
            } else if (current_station == 1) {
                DMANow(3, &((TileBlock*)0x6000000)[4][5+0], &((TileBlock*)0x6000000)[4][3+32], 16);
            } else if (current_station == 2) {
                DMANow(3, &((TileBlock*)0x6000000)[4][5+32], &((TileBlock*)0x6000000)[4][3+32], 16);
            } else if (current_station == 3) {
                show_sprite(0);
                DMANow(3, &((TileBlock*)0x6000000)[4][5+16], &((TileBlock*)0x6000000)[4][3+32], 16);
            } else if (current_station == 4) {
                hide_sprite(0);
            }



        } else if (STATE==PAUSE_STATE) {
            if (oldSTATE != STATE) {
                oldSTATE = STATE;
                (*(volatile unsigned short*)0x400000A) = ((1)<<2) | ((22)<<8) | (0<<7) | (0<<14) | (0);
                DMANow(3, PauseMenuTiles, &((charblock *)0x6000000)[1], 2560 / 2);
                DMANow(3, PauseMenuMap, &((screenblock *)0x6000000)[22], 2048 / 2);
                (*(volatile unsigned short *)0x04000014) = -16;
                (*(volatile unsigned short *)0x04000016) = -16;
                temp_pal = 0;
            }
            if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0)))) || (!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
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
            DMANow(3, winPal, ((unsigned short *)0x5000000), 256);
            drawFullscreenImage4(winBitmap);
            flipPage();
            drawFullscreenImage4(winBitmap);
            flipPage();
            if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
                change_state(SPLASHSCREEN_STATE);
            }
        } else if (STATE==LOSE_STATE) {
            DMANow(3, losePal, ((unsigned short *)0x5000000), 256);
            drawFullscreenImage4(loseBitmap);
            flipPage();
            drawFullscreenImage4(loseBitmap);
            flipPage();
            if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
                change_state(SPLASHSCREEN_STATE);
            }
        }



        frameCount++;
        oldButtons = buttons;
    }
}
