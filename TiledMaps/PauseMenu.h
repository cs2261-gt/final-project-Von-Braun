
//{{BLOCK(PauseMenu)

//======================================================================
//
//	PauseMenu, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 80 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 2560 + 2048 = 5120
//
//	Time-stamp: 2020-03-26, 20:59:18
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PAUSEMENU_H
#define GRIT_PAUSEMENU_H

#define PauseMenuTilesLen 2560
extern const unsigned short PauseMenuTiles[1280];

#define PauseMenuMapLen 2048
extern const unsigned short PauseMenuMap[1024];

#define PauseMenuPalLen 512
extern const unsigned short PauseMenuPal[256];

#endif // GRIT_PAUSEMENU_H

//}}BLOCK(PauseMenu)
