
//{{BLOCK(ship_ui)

//======================================================================
//
//	ship_ui, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 153 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 4896 + 2048 = 7456
//
//	Time-stamp: 2020-03-29, 14:31:29
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_SHIP_UI_H
#define GRIT_SHIP_UI_H

#define ship_uiTilesLen 4896
extern const unsigned short ship_uiTiles[2448];

#define ship_uiMapLen 2048
extern const unsigned short ship_uiMap[1024];

#define ship_uiPalLen 512
extern const unsigned short ship_uiPal[256];

#endif // GRIT_SHIP_UI_H

//}}BLOCK(ship_ui)
