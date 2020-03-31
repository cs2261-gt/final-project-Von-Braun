
//{{BLOCK(mountains)

//======================================================================
//
//	mountains, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 18 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 576 + 4096 = 5184
//
//	Time-stamp: 2020-03-26, 23:45:27
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_MOUNTAINS_H
#define GRIT_MOUNTAINS_H

#define mountainsTilesLen 576
extern const unsigned short mountainsTiles[288];

#define mountainsMapLen 4096
extern const unsigned short mountainsMap[2048];

#define mountainsPalLen 512
extern const unsigned short mountainsPal[256];

#endif // GRIT_MOUNTAINS_H

//}}BLOCK(mountains)
