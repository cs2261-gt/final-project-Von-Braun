
//{{BLOCK(craters)

//======================================================================
//
//	craters, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 22 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 704 + 4096 = 5312
//
//	Time-stamp: 2020-03-28, 02:10:12
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_CRATERS_H
#define GRIT_CRATERS_H

#define cratersTilesLen 704
extern const unsigned short cratersTiles[352];

#define cratersMapLen 4096
extern const unsigned short cratersMap[2048];

#define cratersPalLen 512
extern const unsigned short cratersPal[256];

#endif // GRIT_CRATERS_H

//}}BLOCK(craters)
