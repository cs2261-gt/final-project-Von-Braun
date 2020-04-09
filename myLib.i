# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
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
# 2 "myLib.c" 2


unsigned short *videoBuffer = (unsigned short *)0x6000000;


DMA *dma = (DMA *)0x40000B0;


OBJ_ATTR shadowOAM[128];


void setPixel3(int col, int row, unsigned short color) {
    videoBuffer[((row)*(240)+(col))] = color;
}


void setPixel4(int col, int row, unsigned char colorIndex) {
    unsigned short pixelData = videoBuffer[((row)*(240)+(col)) / 2];
    if (col & 1) {
        pixelData &= 0x00FF;
        pixelData |= (colorIndex << 8);
    } else {
        pixelData &= 0xFF00;
        pixelData |= colorIndex;
    }
    videoBuffer[((row)*(240)+(col)) / 2] = pixelData;
}


void drawRect3(int col, int row, int width, int height, volatile unsigned short color) {
    for(int r = 0; r < height; r++) {
        DMANow(3, &color, &videoBuffer[((row+r)*(240)+(col))], (2 << 23) | width);
    }
}


void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex) {
    volatile unsigned short pixelData = colorIndex | (colorIndex << 8);
    for (int i = 0; i < height; i++) {
        if ((!(col & 1)) && (!(width & 1))) {

            DMANow(3, &pixelData, &videoBuffer[((row + i)*(240)+(col)) / 2], (2 << 23) | (width / 2));
        } else if ((!(col & 1)) && (width & 1)) {

            if (!(width - 1 <= 0)) {

                DMANow(3, &pixelData, &videoBuffer[((row + i)*(240)+(col)) / 2], (2 << 23) | ((width - 1) / 2));
            }
            setPixel4(col + width - 1, row + i, colorIndex);
        } else if ((col & 1) && (width & 1)) {

            if (!(width - 1 <= 0)) {

                DMANow(3, &pixelData, &videoBuffer[((row + i)*(240)+(col + 1)) / 2], (2 << 23) | ((width - 1) / 2));
            }
            setPixel4(col, row + i, colorIndex);
        } else if ((col & 1) && (!(width & 1))) {

            if (!(width - 2 <= 0)) {

                DMANow(3, &pixelData, &videoBuffer[((row + i)*(240)+(col + 1)) / 2], (2 << 23) | ((width - 2) / 2));
            }
            setPixel4(col + width - 1, row + i, colorIndex);
            setPixel4(col, row + i, colorIndex);
        }
    }
}


void fillScreen3(volatile unsigned short color) {
    DMANow(3, &color, videoBuffer, (2 << 23) | (240 * 160));
}


void fillScreen4(volatile unsigned char colorIndex) {
    volatile unsigned short pixelData = colorIndex | (colorIndex << 8);
    DMANow(3, &pixelData, videoBuffer, (2 << 23) | (240 * 160) / 2);
}


void drawImage3(int col, int row, int height, int width, const unsigned short *image) {
    for(int r = 0; r < height; r++) {
        DMANow(3, &image[((r)*(width)+(0))], &videoBuffer[((col)*(240)+(row+r))], width);
    }
}


void drawImage4(int col, int row, int height, int width, const unsigned short *image) {
    for (int i = 0; i < height; i++) {
        DMANow(3, &image[((i)*(width / 2)+(0))], &videoBuffer[((row + i)*(240)+(col)) / 2], width / 2);
    }

}


void drawFullscreenImage3(const unsigned short *image) {
    DMANow(3, image, videoBuffer, 240 * 160);
}


void drawFullscreenImage4(const unsigned short *image) {
    DMANow(3, image, videoBuffer, 240 * 160 / 2);
}


void waitForVBlank() {
    while((*(volatile unsigned short *)0x4000006) > 160);
    while((*(volatile unsigned short *)0x4000006) < 160);
}


void flipPage() {

    if ((*(unsigned short *)0x4000000) & (1<<4)) {
        videoBuffer = ((unsigned short *)0x600A000);
    } else {
        videoBuffer = ((unsigned short *)0x6000000);
    }
    (*(unsigned short *)0x4000000) ^= (1<<4);
}


void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {


    dma[channel].cnt = 0;


    dma[channel].src = src;
    dma[channel].dst = dst;


    dma[channel].cnt = cnt | (1 << 31);
}


int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {
    return rowA < rowB + heightB - 1 && rowA + heightA - 1 > rowB
        && colA < colB + widthB - 1 && colA + widthA - 1 > colB;
}

void hideSprites() {
    for (int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = (2<<8);
    }
}


extern s16 sin_lut[514];

s32 lu_sin(u32 theta){ return sin_lut[(theta>>7)&0x1FF]; }
s32 lu_cos(u32 theta){ return sin_lut[((theta>>7)+128)&0x1FF]; }

void obj_aff_rotate(OBJ_AFFINE *oaff, u16 alpha) {
 int ss= lu_sin(alpha)>>4, cc= lu_cos(alpha)>>4;
 oaff->pa= cc; oaff->pb= -ss;
 oaff->pc= ss; oaff->pd= cc;
}
void obj_aff_identity(OBJ_AFFINE *oaff) {
 oaff->pa= 0x0100l; oaff->pb= 0;
 oaff->pc= 0; oaff->pd= 0x0100;
}


void overwrite_BG_tile(u32 spritesheet_index, u32 BG0_index, u32 sprite_start_line, u32 BG0_start_line, u32 lines_to_copy) {
    u32 BG0_tile_address = ((BG_tile*)&((screenblock *)0x6000000)[0]) + BG0_index;
    BG0_tile_address = ((u32*)BG0_tile_address) + BG0_start_line;
    u32 sprite_address = &((TileBlock*)0x6000000)[4][spritesheet_index];
    sprite_address = ((u32*)sprite_address) + sprite_start_line;
    DMANow(3, (void*)sprite_address, (void*)BG0_tile_address, lines_to_copy*2);
}



u8 sprite_count = 0;

void write_sprite_data(char count) {
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), count*4);
}
void set_sprite_location(char sprite_index, short x, short y) {
    if (sprite_index == 12) {
        x-=8;
        y-=8;
    }
    x &= 0x1FF;
    y &= 0xFF;
    shadowOAM[sprite_index].attr0 &= ~0xFF;
    shadowOAM[sprite_index].attr0 |= y;
    shadowOAM[sprite_index].attr1 &= ~0x1FF;
    shadowOAM[sprite_index].attr1 |= x;
}
void hide_all_sprites() {
    for (int i = 0; i < 128; i++) {
        hide_sprite(i);
    }
}
void hide_sprite(char sprite_index) {
    shadowOAM[sprite_index].attr0 &= ~0x300;
    shadowOAM[sprite_index].attr0 |= (2<<8);
}
void show_all_sprites() {
    for (u8 i = 0; i < sprite_count; i++) {
        show_sprite(i);
    }
}
void show_sprite(u8 sprite_index) {
    shadowOAM[sprite_index].attr0 &= ~0x300;
    if (sprite_index == 12) {
        shadowOAM[sprite_index].attr0 |= (3<<8);
    } else {
        shadowOAM[sprite_index].attr0 |= 0x000;
    }
}
