
//{{BLOCK(stars)

//======================================================================
//
//	stars, 512x512@4, 
//	+ palette 256 entries, not compressed
//	+ 19 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 608 + 8192 = 9312
//
//	Time-stamp: 2020-03-26, 21:12:08
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_STARS_H
#define GRIT_STARS_H

#define starsTilesLen 608
extern const unsigned short starsTiles[304];

#define starsMapLen 8192
extern const unsigned short starsMap[4096];

#define starsPalLen 512
extern const unsigned short starsPal[256];

#endif // GRIT_STARS_H

//}}BLOCK(stars)
