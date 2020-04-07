#include "myLib.h"

// The start of the video memory
unsigned short *videoBuffer = (unsigned short *)0x6000000;

// The start of DMA registers
DMA *dma = (DMA *)0x40000B0;

// Define shadowOAM
OBJ_ATTR shadowOAM[128];

// Set a pixel on the screen in Mode 3
void setPixel3(int col, int row, unsigned short color) {
    videoBuffer[OFFSET(col, row, SCREENWIDTH)] = color;
}

// Set a pixel on the screen in Mode 4
void setPixel4(int col, int row, unsigned char colorIndex) {
    unsigned short pixelData = videoBuffer[OFFSET(col, row, SCREENWIDTH) / 2];
    if (col & 1) {
        pixelData &= 0x00FF;
        pixelData |= (colorIndex << 8);
    } else {
        pixelData &= 0xFF00;
        pixelData |= colorIndex;
    }
    videoBuffer[OFFSET(col, row, SCREENWIDTH) / 2] = pixelData;
}

// Draw a rectangle at the specified location and size in Mode 3
void drawRect3(int col, int row, int width, int height, volatile unsigned short color) {
    for(int r = 0; r < height; r++) {
        DMANow(3, &color, &videoBuffer[OFFSET(col, row+r, SCREENWIDTH)], DMA_SOURCE_FIXED | width);
    }
}

// Draw a rectangle at the specified location and size in Mode 4
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex) {
    volatile unsigned short pixelData = colorIndex | (colorIndex << 8);
    for (int i = 0; i < height; i++) {
        if ((!(col & 1)) && (!(width & 1))) {
            // even column, even width
            DMANow(3, &pixelData, &videoBuffer[OFFSET(col, row + i, SCREENWIDTH) / 2], DMA_SOURCE_FIXED | (width / 2));
        } else if ((!(col & 1)) && (width & 1)) {
            // even column, odd width
            if (!(width - 1 <= 0)) {
                // DMA only if number of transfers is > 0
                DMANow(3, &pixelData, &videoBuffer[OFFSET(col, row + i, SCREENWIDTH) / 2], DMA_SOURCE_FIXED | ((width - 1) / 2));
            }
            setPixel4(col + width - 1, row + i, colorIndex);
        } else if ((col & 1) && (width & 1)) {
            // odd column, odd width
            if (!(width - 1 <= 0)) {
                // DMA only if number of transfers is > 0
                DMANow(3, &pixelData, &videoBuffer[OFFSET(col + 1, row + i, SCREENWIDTH) / 2], DMA_SOURCE_FIXED | ((width - 1) / 2));
            }
            setPixel4(col, row + i, colorIndex);
        } else if ((col & 1) && (!(width & 1))) {
            // odd column, even width
            if (!(width - 2 <= 0)) {
                // DMA only if number of transfers is > 0
                DMANow(3, &pixelData, &videoBuffer[OFFSET(col + 1, row + i, SCREENWIDTH) / 2], DMA_SOURCE_FIXED | ((width - 2) / 2));
            }
            setPixel4(col + width - 1, row + i, colorIndex);
            setPixel4(col, row + i, colorIndex);
        }
    }
}

// Fill the entire screen with a single color in Mode 3
void fillScreen3(volatile unsigned short color) {
    DMANow(3, &color, videoBuffer, DMA_SOURCE_FIXED | (SCREENWIDTH * SCREENHEIGHT));
}

// Fill the entire screen with a single color in Mode 4
void fillScreen4(volatile unsigned char colorIndex) {
    volatile unsigned short pixelData = colorIndex | (colorIndex << 8);
    DMANow(3, &pixelData, videoBuffer, DMA_SOURCE_FIXED | (SCREENWIDTH * SCREENHEIGHT) / 2);
}

// Draw an image at the specified location and size in Mode 3
void drawImage3(int col, int row, int height, int width, const unsigned short *image) {
    for(int r = 0; r < height; r++) {
        DMANow(3, &image[OFFSET(0, r, width)], &videoBuffer[OFFSET(row+r, col, SCREENWIDTH)], width);
    }
}

// Draw an image at the specified location and size in Mode 4 (must be even col and width)
void drawImage4(int col, int row, int height, int width, const unsigned short *image) {
    for (int i = 0; i < height; i++) {
        DMANow(3, &image[OFFSET(0, i, width / 2)], &videoBuffer[OFFSET(col, row + i, SCREENWIDTH) / 2], width / 2);
    }

}

// Fill the entire screen with an image in Mode 3
void drawFullscreenImage3(const unsigned short *image) {
    DMANow(3, image, videoBuffer, SCREENWIDTH * SCREENHEIGHT);
}

// Fill the entire screen with an image in Mode 4
void drawFullscreenImage4(const unsigned short *image) {
    DMANow(3, image, videoBuffer, SCREENWIDTH * SCREENHEIGHT / 2);
}

// Pause code execution until vertical blank begins
void waitForVBlank() {
    while(SCANLINECOUNTER > 160);
    while(SCANLINECOUNTER < 160);
}

// Flips the page
void flipPage() {

    if (REG_DISPCTL & DISP_BACKBUFFER) {
        videoBuffer = BACKBUFFER;
    } else {
        videoBuffer = FRONTBUFFER;
    }
    REG_DISPCTL ^= DISP_BACKBUFFER;
}

// Set up and begin a DMA transfer
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {

    // Turn DMA off
    dma[channel].cnt = 0;

    // Set source and destination
    dma[channel].src = src;
    dma[channel].dst = dst;

    // Set control and begin
    dma[channel].cnt = cnt | DMA_ON;
}

// Return true if the two rectangular areas are overlapping
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {
    return rowA < rowB + heightB - 1 && rowA + heightA - 1 > rowB
        && colA < colB + widthB - 1 && colA + widthA - 1 > colB;
}

void hideSprites() {
    for (int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = ATTR0_HIDE;
    }
}

// ====================================== AFFINE ====================================================================
extern s16 sin_lut[514];	// .12f

s32 lu_sin(u32 theta){	return sin_lut[(theta>>7)&0x1FF];	}
s32 lu_cos(u32 theta){	return sin_lut[((theta>>7)+128)&0x1FF];	}

void obj_aff_rotate(OBJ_AFFINE *oaff, u16 alpha) {
	int ss= lu_sin(alpha)>>4, cc= lu_cos(alpha)>>4;
	oaff->pa= cc;	oaff->pb= -ss;
	oaff->pc= ss;	oaff->pd= cc;
}
void obj_aff_identity(OBJ_AFFINE *oaff) {
	oaff->pa= 0x0100l;	oaff->pb= 0;
	oaff->pc= 0;		oaff->pd= 0x0100;
}

// ====================================== BACKGROUND =====================================
void overwrite_BG_tile(u32 spritesheet_index, u32 BG0_index, u32 sprite_start_line, u32 BG0_start_line, u32 lines_to_copy) {
    u32 BG0_tile_address =  ((BG_tile*)&SCREENBLOCK[0]) + BG0_index;
    BG0_tile_address = ((u32*)BG0_tile_address) + BG0_start_line;
    u32 sprite_address = &MEM_TILE[4][spritesheet_index];
    sprite_address = ((u32*)sprite_address) + sprite_start_line;
    DMANow(3, (void*)sprite_address, (void*)BG0_tile_address, lines_to_copy*2);
}

//=========================================== SPRITES ===============================================================

u8 sprite_count = 0;

void write_sprite_data(char count) {
    DMANow(3, shadowOAM, OAM, count*4);
}
void set_sprite_location(char sprite_index, short x, short y) {
    if (sprite_index == PLAYER_SPRITE_INDEX) {
        x-=8;
        y-=8;
    }
    x &= 0x1FF; //9 bits
    y &= 0xFF; //8 bits
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
    shadowOAM[sprite_index].attr0 |= ATTR0_HIDE;
}
void show_all_sprites() {
    for (u8 i = 0; i < sprite_count; i++) {
        show_sprite(i);
    }
}
void show_sprite(u8 sprite_index) {
    shadowOAM[sprite_index].attr0 &= ~0x300;
    if (sprite_index == PLAYER_SPRITE_INDEX) {
        shadowOAM[sprite_index].attr0 |= ATTR0_DOUBLEAFFINE;
    } else {
        shadowOAM[sprite_index].attr0 |= 0x000;
    }
}