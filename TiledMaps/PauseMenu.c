
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

const unsigned short PauseMenuTiles[1280] __attribute__((aligned(4)))=
{
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x5551,0x5555,0x3351,0x3333,0x3351,0x3333,0x3351,0x3333,
	0x3351,0x3333,0x3351,0x3333,0x3351,0x3333,0x3351,0x3333,
	0x5555,0x5555,0x3333,0x3333,0x3333,0x3333,0x3333,0x3333,
	0x3333,0x5555,0x5533,0x4444,0x4453,0x4444,0x4453,0x2244,
	0x5555,0x5555,0x3333,0x3333,0x3333,0x3333,0x3333,0x3333,
	0x5555,0x5555,0x4444,0x4444,0x4444,0x4444,0x2222,0x2222,

	0x5555,0x5555,0x3333,0x3333,0x3333,0x3333,0x3333,0x3333,
	0x5555,0x3333,0x4444,0x3355,0x4444,0x3144,0x4422,0x3144,
	0x5555,0x1155,0x3333,0x1133,0x3333,0x1133,0x3333,0x1133,
	0x3333,0x1133,0x3333,0x1133,0x3333,0x1133,0x3333,0x1133,
	0x3351,0x3333,0x3351,0x3333,0x3351,0x3333,0x3351,0x3333,
	0x3351,0x3333,0x3351,0x3333,0x3351,0x3333,0x3351,0x3333,
	0x4445,0x2224,0x4445,0x6622,0x4445,0x6622,0x4445,0x6622,
	0x4445,0x6622,0x4445,0x6622,0x4445,0x6622,0x4445,0x6622,

	0x2222,0x2222,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,
	0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,
	0x2222,0x2222,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,
	0x6666,0x6666,0x6666,0x6666,0x6666,0x2266,0x6666,0x5522,
	0x2222,0x2222,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,
	0x6666,0x2222,0x2226,0x7777,0x7772,0x7777,0x7777,0x7777,
	0x2222,0x2222,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,
	0x6666,0x6666,0x6222,0x6666,0x2555,0x6622,0x5557,0x2255,

	0x4222,0x1444,0x5266,0x1444,0x5266,0x1444,0x5266,0x1444,
	0x5266,0x1444,0x5266,0x1444,0x5266,0x1444,0x5266,0x1444,
	0x3333,0x1133,0x3333,0x1133,0x3333,0x1133,0x3333,0x1133,
	0x3333,0x1133,0x3333,0x1133,0x3333,0x1133,0x3333,0x1133,
	0x4445,0x6622,0x4445,0x6622,0x4445,0x6622,0x4445,0x6622,
	0x4445,0x6622,0x4445,0x6622,0x4445,0x6622,0x4445,0x6622,
	0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,
	0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,

	0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,
	0x6666,0x6666,0x6666,0x6666,0x6666,0x2666,0x6666,0x2666,
	0x2666,0x5555,0x5266,0x5555,0x5526,0x7555,0x5726,0x7755,
	0x7772,0x7777,0x7772,0x7777,0x7777,0x7777,0x7755,0x7777,
	0x7777,0x7772,0x7777,0x7772,0x7777,0x5442,0x7777,0x4542,
	0x7777,0x2222,0x2777,0x4444,0x2777,0x4444,0x2777,0x4444,
	0x5577,0x7775,0x7777,0x7777,0x7777,0x2227,0x2225,0x5552,
	0x5442,0x5554,0x4444,0x5555,0x5444,0x5554,0x4544,0x5555,

	0x6622,0x6666,0x6277,0x6666,0x2222,0x6666,0x5555,0x6622,
	0x5555,0x6255,0x5555,0x2555,0x5555,0x5555,0x5555,0x5555,
	0x5266,0x1444,0x5266,0x1444,0x5266,0x1444,0x5266,0x1444,
	0x5266,0x1444,0x5266,0x1444,0x5266,0x1444,0x5266,0x1444,
	0x6666,0x2666,0x6666,0x5266,0x6666,0x5266,0x6666,0x5266,
	0x6666,0x5266,0x6666,0x5266,0x6666,0x2226,0x2666,0x2BB2,
	0x7555,0x7777,0x5555,0x7777,0x5555,0x7777,0x5555,0x5777,
	0x5555,0x5777,0x7555,0x5577,0x7755,0x5557,0x7777,0x5557,

	0x4277,0x4444,0x4277,0x4444,0x4277,0x5444,0x4425,0x2244,
	0x4425,0x2244,0x4425,0xDD22,0x2225,0xDDDD,0xDD25,0xEDDD,
	0x5454,0x5555,0x4545,0x2255,0x2254,0xEE22,0xEE22,0xEEEE,
	0xEE22,0xEEEE,0xEEED,0xEEEE,0xEEDE,0xEEEE,0xEEED,0xEEEE,
	0x5555,0x5555,0x5222,0x5555,0x2EEE,0x5522,0xEEEE,0x52EE,
	0xEEEE,0x52EE,0xEEEE,0x2EEE,0xEEEE,0xEEEE,0xEEEE,0xEEEE,
	0x6625,0x6666,0x6625,0x6666,0x6255,0x6666,0x6255,0x6666,
	0x6255,0x6666,0x6625,0x6666,0x6662,0x6666,0x6662,0x6666,

	0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,
	0x6666,0x2666,0x6666,0x2666,0x6666,0x2666,0x6666,0x6666,
	0xB266,0x2BBB,0xBB26,0xBBBB,0xBBB2,0xBBBB,0xBBB2,0xBBBB,
	0xBBBB,0xBBBB,0xBBBB,0xBBBB,0xBBBB,0xBBBB,0xBBB2,0xBBBB,
	0x7777,0x5557,0x7772,0x5577,0x7772,0x2222,0x272B,0x5555,
	0x52BB,0x5555,0x552B,0x5555,0x552B,0x5555,0x552B,0x5555,
	0xDD25,0xDEDD,0xDD25,0xEDED,0xDD22,0xDEDE,0xDD25,0xEDED,
	0xD255,0xDEDD,0x2555,0x22DD,0x2555,0xDDDD,0x2555,0xDDDD,

	0xEEEE,0xEEEE,0x2EEE,0x2222,0xEEEE,0xEEEE,0xCCCE,0xEEEC,
	0xCCCE,0xEEEC,0xEEE2,0xEEEE,0xEE2D,0xEEEE,0xE2DD,0xEEEE,
	0xEEEE,0xEEEE,0x2EEE,0x2222,0xEEEE,0xEEEE,0xEEEE,0xCEEE,
	0xE2EE,0xCEEE,0xEEEE,0xEEEE,0xEEEE,0xEEEE,0xEEEE,0xEEEE,
	0x662E,0x6666,0x662E,0x6666,0x662E,0x6666,0x62CC,0x6666,
	0x62CC,0x6666,0x22EE,0x6622,0xD2EE,0x62ED,0xD2EE,0x2EDE,
	0xBBB2,0xBBBB,0xBB26,0xBBBB,0x2266,0xBBBB,0x3366,0x2222,
	0x3336,0x3333,0x3336,0x3333,0x3336,0x3333,0x3366,0x3333,

	0x552B,0x5555,0x552B,0x5555,0x52BB,0x5555,0x2322,0x5555,
	0x3333,0x2222,0x3333,0x3333,0x3333,0x3333,0x3333,0x3333,
	0x2555,0xDDDD,0x2555,0xDDDD,0xD255,0xDDDD,0xDD25,0xDDDD,
	0x2222,0x2222,0x3333,0x3333,0x3333,0x3333,0x3333,0x3333,
	0x2DDD,0xEEEE,0x2DDD,0xEEEE,0x2DDD,0xEEEE,0xE2DD,0xEEEE,
	0x2322,0x2222,0x3333,0x3333,0x3333,0x3333,0x3333,0x3333,
	0xEEEE,0xEEEE,0xEEEE,0xEEEE,0xEEEE,0xEEEE,0xEEEE,0xEEEE,
	0x2222,0x2222,0x3333,0x3333,0x3333,0x3333,0x3333,0x3333,

	0xD2EE,0xEEED,0xDD2E,0xEEDE,0xED2E,0xEEED,0xDED2,0x2EEE,
	0x2223,0x3222,0x3333,0x3333,0x3333,0x3333,0x3333,0x3333,
	0x6662,0x6666,0x6662,0x6666,0x6662,0x6666,0x6663,0x6666,
	0x6633,0x6666,0x6633,0x6666,0x6633,0x6666,0x6663,0x6666,
	0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,
	0x6666,0x6666,0x6666,0xAAA6,0x6666,0x66AA,0xA666,0x666A,
	0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,
	0x6666,0x6666,0x666A,0xAAA6,0x66AA,0xA6AA,0xA6AA,0x666A,

	0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,
	0x6666,0x6666,0xA666,0x666A,0xA66A,0x666A,0xA6AA,0x66AA,
	0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,
	0x6666,0x6666,0xA6AA,0xAAAA,0xA6AA,0x6AA6,0x66AA,0x6AA6,
	0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,
	0x6666,0x6666,0x666A,0xAAAA,0x666A,0x6AA6,0x6666,0x6AA6,
	0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,
	0x6666,0x6666,0xA666,0x666A,0xA666,0x666A,0xA666,0x66AA,

	0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,
	0x6666,0x6666,0xA6AA,0xA66A,0xA6AA,0xA66A,0xA6AA,0xA66A,
	0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,
	0x6666,0x6666,0xA66A,0xAAAA,0x666A,0x66AA,0x666A,0x66AA,
	0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,
	0x6666,0x6666,0x66AA,0x6666,0x66A6,0x6666,0x6666,0x6666,
	0xA666,0x666A,0xA666,0x666A,0xA666,0x666A,0xA666,0x666A,
	0x6666,0x66AA,0x6666,0xAAA6,0x6666,0x6666,0x6666,0x6666,

	0xA666,0x666A,0xA666,0x666A,0xA666,0x666A,0xA6AA,0x666A,
	0x66AA,0xA6AA,0x666A,0xAAA6,0x6666,0x6666,0x6666,0x6666,
	0xA6AA,0x6AAA,0xA6AA,0xAAAA,0xA6AA,0xAA6A,0xA6AA,0xA66A,
	0xA66A,0x666A,0xA666,0x666A,0x6666,0x6666,0x6666,0x6666,
	0x66AA,0x6AA6,0x66AA,0x6AA6,0x66AA,0x6AA6,0x66AA,0x6AA6,
	0x66AA,0x6AA6,0x66AA,0xAAAA,0x6666,0x6666,0x6666,0x6666,
	0x6666,0x6AA6,0x6666,0x6AA6,0x6666,0x6AA6,0x6666,0x6AA6,
	0x6666,0x6AA6,0x6666,0xAAAA,0x6666,0x6666,0x6666,0x6666,

	0xA666,0x6AAA,0xA666,0xAAAA,0xA666,0xAA6A,0xA666,0xA66A,
	0xA666,0x666A,0xA666,0x666A,0x6666,0x6666,0x6666,0x6666,
	0xA6AA,0xA66A,0xA6AA,0xA66A,0xA6AA,0xA66A,0xA6AA,0xA66A,
	0xA6AA,0xA66A,0x66AA,0xAAAA,0x6666,0x6666,0x6666,0x6666,
	0x666A,0x66AA,0x666A,0xAAAA,0x666A,0x66AA,0x666A,0x66AA,
	0x666A,0x66AA,0xA666,0xAAAA,0x6666,0x6666,0x6666,0x6666,
	0x666A,0x6666,0x666A,0x6666,0x666A,0x6666,0x6666,0x6666,
	0x66A6,0x6666,0x66AA,0x6666,0x6666,0x6666,0x6666,0x6666,

	0x6666,0x6666,0x8666,0x8888,0x6666,0x6688,0x6666,0x6688,
	0x6666,0x6688,0x6666,0x8888,0x6666,0x8688,0x6666,0x6688,
	0x6666,0x6666,0x8668,0x8888,0x6688,0x6688,0x6688,0x6688,
	0x6688,0x6688,0x6668,0x8888,0x6668,0x6688,0x6688,0x6688,
	0x6666,0x6666,0x8688,0x8888,0x6686,0x6688,0x6666,0x6688,
	0x6668,0x6688,0x6668,0x8888,0x6668,0x6688,0x6666,0x6688,
	0x6666,0x6666,0x6668,0x8886,0x6688,0x8688,0x8688,0x6668,
	0x8688,0x6668,0x8668,0x6668,0x8688,0x6668,0x8688,0x6668,

	0x6666,0x6666,0x6666,0x8886,0x6668,0x8688,0x8688,0x6668,
	0x8688,0x6668,0x8688,0x6668,0x8688,0x6668,0x8688,0x6668,
	0x6666,0x6666,0x8666,0x8888,0x8668,0x6886,0x6688,0x6886,
	0x6688,0x6886,0x6688,0x6886,0x6688,0x6886,0x6688,0x6886,
	0x6666,0x6666,0x6668,0x6666,0x6668,0x6666,0x6666,0x6666,
	0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,
	0x6666,0x6688,0x8666,0x6688,0x6666,0x6666,0x6666,0x6666,
	0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,

	0x6688,0x6688,0x8688,0x8888,0x6666,0x6666,0x6666,0x6666,
	0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,
	0x6686,0x6688,0x8688,0x8888,0x6666,0x6666,0x6666,0x6666,
	0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,
	0x6688,0x8688,0x6668,0x8886,0x6666,0x6666,0x6666,0x6666,
	0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,
	0x6668,0x8688,0x6666,0x8886,0x6666,0x6666,0x6666,0x6666,
	0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,

	0x6668,0x6886,0x6666,0x8888,0x6666,0x6666,0x6666,0x6666,
	0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,0x6666,
	0x4445,0x6622,0x4445,0x6622,0x4445,0x6622,0x4445,0x6622,
	0x4445,0x6622,0x4445,0x6622,0x4445,0x6622,0x4445,0x6222,
	0x5266,0x1444,0x5266,0x1444,0x5266,0x1444,0x5266,0x1444,
	0x5266,0x1444,0x5266,0x1444,0x5266,0x1444,0x5226,0x1444,
	0x3351,0x3333,0x3351,0x3333,0x3351,0x3333,0x3351,0x3333,
	0x3351,0x3333,0x3351,0x3333,0x1151,0x1111,0x1111,0x1111,

	0x4445,0x2224,0x4455,0x5544,0x4453,0x4444,0x1153,0x4444,
	0x3333,0x1111,0x3333,0x3333,0x1111,0x1111,0x1111,0x1111,
	0x2222,0x2222,0x5555,0x5555,0x4444,0x4444,0x4444,0x4444,
	0x1111,0x1111,0x3333,0x3333,0x1111,0x1111,0x1111,0x1111,
	0x4522,0x1444,0x4455,0x3144,0x4444,0x3144,0x4444,0x3311,
	0x1111,0x3333,0x3333,0x3333,0x1111,0x1111,0x1111,0x1111,
	0x3333,0x1133,0x3333,0x1133,0x3333,0x1133,0x3333,0x1133,
	0x3333,0x1133,0x3333,0x1133,0x1111,0x1111,0x1111,0x1111,
};

const unsigned short PauseMenuMap[1024] __attribute__((aligned(4)))=
{
	0x0001,0x0002,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
	0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
	0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,
	0x0004,0x0005,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0006,0x0007,0x0008,0x0008,0x0008,0x0008,0x0008,0x0008,
	0x0008,0x0008,0x0008,0x0009,0x000A,0x000B,0x0008,0x0008,
	0x0008,0x0008,0x0008,0x0008,0x0008,0x0008,0x0008,0x0008,
	0x000C,0x000D,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0006,0x000E,0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,
	0x000F,0x000F,0x0010,0x0011,0x0012,0x0013,0x0014,0x0410,
	0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,
	0x0015,0x000D,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0006,0x000E,0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,
	0x000F,0x000F,0x0016,0x0017,0x0018,0x0019,0x001A,0x001B,
	0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,
	0x0015,0x000D,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0006,0x000E,0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,
	0x000F,0x001C,0x001D,0x001E,0x001F,0x0020,0x0021,0x0022,
	0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,
	0x0015,0x000D,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0006,0x000E,0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,
	0x000F,0x000F,0x0023,0x0024,0x0025,0x0026,0x0027,0x0028,
	0x0029,0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,
	0x0015,0x000D,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0006,0x000E,0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,
	0x000F,0x002A,0x002B,0x002C,0x002D,0x002E,0x002F,0x0030,
	0x0031,0x0032,0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,
	0x0015,0x000D,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0006,0x000E,0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,
	0x000F,0x0033,0x0034,0x0035,0x0036,0x0037,0x0038,0x0039,
	0x003A,0x003B,0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,
	0x0015,0x000D,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0006,0x000E,0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,
	0x000F,0x000F,0x003C,0x003D,0x003E,0x003F,0x0040,0x0041,
	0x0042,0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,
	0x0015,0x000D,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0006,0x000E,0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,
	0x000F,0x000F,0x0043,0x0044,0x0045,0x0046,0x0047,0x0048,
	0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,
	0x0015,0x000D,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0006,0x000E,0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,
	0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,
	0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,
	0x0015,0x000D,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0006,0x000E,0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,
	0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,
	0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,
	0x0015,0x000D,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0006,0x0049,0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,
	0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,
	0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,0x000F,
	0x004A,0x000D,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x004B,0x004C,0x004D,0x004D,0x004D,0x004D,0x004D,0x004D,
	0x004D,0x004D,0x004D,0x004D,0x004D,0x004D,0x004D,0x004D,
	0x004D,0x004D,0x004D,0x004D,0x004D,0x004D,0x004D,0x004D,
	0x004E,0x004F,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
};

const unsigned short PauseMenuPal[256] __attribute__((aligned(4)))=
{
	0x7C1F,0x0000,0x1084,0x4210,0x5294,0x739C,0x3000,0x7288,
	0x4200,0x0380,0x039C,0x0014,0x001C,0x4A5F,0x62FF,0x0000,
	0x4200,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
};

//}}BLOCK(PauseMenu)