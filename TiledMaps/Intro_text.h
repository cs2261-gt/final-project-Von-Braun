
//{{BLOCK(Intro_text)

//======================================================================
//
//	Intro_text, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 120 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 3840 + 2048 = 6400
//
//	Time-stamp: 2020-04-04, 17:51:58
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INTRO_TEXT_H
#define GRIT_INTRO_TEXT_H

#define Intro_textTilesLen 3840
extern const unsigned short Intro_textTiles[1920];

#define Intro_textMapLen 2048
extern const unsigned short Intro_textMap[1024];

#define Intro_textPalLen 512
extern const unsigned short Intro_textPal[256];

#endif // GRIT_INTRO_TEXT_H

//}}BLOCK(Intro_text)
