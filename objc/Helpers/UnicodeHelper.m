#import "UnicodeHelper.h"


static unsigned TABLE1[] = {
9,
0x00aa, 0x00aa,
0x00b5, 0x00b5,
0x00ba, 0x00ba,
0x00c0, 0x00d6,
0x00d8, 0x00f6,
0x00f8, 0x02c1,
0x02c6, 0x02d1,
0x02e0, 0x02e4,
0x02ee, 0x02ee,
};

static unsigned TABLE2[] = {
134,
0x037a, 0x037d,
0x0386, 0x0386,
0x0388, 0x038a,
0x038c, 0x038c,
0x038e, 0x03a1,
0x03a3, 0x03ce,
0x03d0, 0x03f5,
0x03f7, 0x0481,
0x048a, 0x0513,
0x0531, 0x0556,
0x0559, 0x0559,
0x0561, 0x0587,
0x05d0, 0x05ea,
0x05f0, 0x05f2,
0x0621, 0x063a,
0x0640, 0x064a,
0x066e, 0x066f,
0x0671, 0x06d3,
0x06d5, 0x06d5,
0x06e5, 0x06e6,
0x06ee, 0x06ef,
0x06fa, 0x06fc,
0x06ff, 0x06ff,
0x0710, 0x0710,
0x0712, 0x072f,
0x074d, 0x076d,
0x0780, 0x07a5,
0x07b1, 0x07b1,
0x07ca, 0x07ea,
0x07f4, 0x07f5,
0x07fa, 0x07fa,
0x0904, 0x0939,
0x093d, 0x093d,
0x0950, 0x0950,
0x0958, 0x0961,
0x097b, 0x097f,
0x0985, 0x098c,
0x098f, 0x0990,
0x0993, 0x09a8,
0x09aa, 0x09b0,
0x09b2, 0x09b2,
0x09b6, 0x09b9,
0x09bd, 0x09bd,
0x09ce, 0x09ce,
0x09dc, 0x09dd,
0x09df, 0x09e1,
0x09f0, 0x09f1,
0x0a05, 0x0a0a,
0x0a0f, 0x0a10,
0x0a13, 0x0a28,
0x0a2a, 0x0a30,
0x0a32, 0x0a33,
0x0a35, 0x0a36,
0x0a38, 0x0a39,
0x0a59, 0x0a5c,
0x0a5e, 0x0a5e,
0x0a72, 0x0a74,
0x0a85, 0x0a8d,
0x0a8f, 0x0a91,
0x0a93, 0x0aa8,
0x0aaa, 0x0ab0,
0x0ab2, 0x0ab3,
0x0ab5, 0x0ab9,
0x0abd, 0x0abd,
0x0ad0, 0x0ad0,
0x0ae0, 0x0ae1,
0x0b05, 0x0b0c,
0x0b0f, 0x0b10,
0x0b13, 0x0b28,
0x0b2a, 0x0b30,
0x0b32, 0x0b33,
0x0b35, 0x0b39,
0x0b3d, 0x0b3d,
0x0b5c, 0x0b5d,
0x0b5f, 0x0b61,
0x0b71, 0x0b71,
0x0b83, 0x0b83,
0x0b85, 0x0b8a,
0x0b8e, 0x0b90,
0x0b92, 0x0b95,
0x0b99, 0x0b9a,
0x0b9c, 0x0b9c,
0x0b9e, 0x0b9f,
0x0ba3, 0x0ba4,
0x0ba8, 0x0baa,
0x0bae, 0x0bb9,
0x0c05, 0x0c0c,
0x0c0e, 0x0c10,
0x0c12, 0x0c28,
0x0c2a, 0x0c33,
0x0c35, 0x0c39,
0x0c60, 0x0c61,
0x0c85, 0x0c8c,
0x0c8e, 0x0c90,
0x0c92, 0x0ca8,
0x0caa, 0x0cb3,
0x0cb5, 0x0cb9,
0x0cbd, 0x0cbd,
0x0cde, 0x0cde,
0x0ce0, 0x0ce1,
0x0d05, 0x0d0c,
0x0d0e, 0x0d10,
0x0d12, 0x0d28,
0x0d2a, 0x0d39,
0x0d60, 0x0d61,
0x0d85, 0x0d96,
0x0d9a, 0x0db1,
0x0db3, 0x0dbb,
0x0dbd, 0x0dbd,
0x0dc0, 0x0dc6,
0x0e01, 0x0e30,
0x0e32, 0x0e33,
0x0e40, 0x0e46,
0x0e81, 0x0e82,
0x0e84, 0x0e84,
0x0e87, 0x0e88,
0x0e8a, 0x0e8a,
0x0e8d, 0x0e8d,
0x0e94, 0x0e97,
0x0e99, 0x0e9f,
0x0ea1, 0x0ea3,
0x0ea5, 0x0ea5,
0x0ea7, 0x0ea7,
0x0eaa, 0x0eab,
0x0ead, 0x0eb0,
0x0eb2, 0x0eb3,
0x0ebd, 0x0ebd,
0x0ec0, 0x0ec4,
0x0ec6, 0x0ec6,
0x0edc, 0x0edd,
0x0f00, 0x0f00,
0x0f40, 0x0f47,
0x0f49, 0x0f6a,
0x0f88, 0x0f8b,
};

static unsigned TABLE3[] = {
70,
0x1000, 0x1021,
0x1023, 0x1027,
0x1029, 0x102a,
0x1050, 0x1055,
0x10a0, 0x10c5,
0x10d0, 0x10fa,
0x10fc, 0x10fc,
0x1200, 0x1248,
0x124a, 0x124d,
0x1250, 0x1256,
0x1258, 0x1258,
0x125a, 0x125d,
0x1260, 0x1288,
0x128a, 0x128d,
0x1290, 0x12b0,
0x12b2, 0x12b5,
0x12b8, 0x12be,
0x12c0, 0x12c0,
0x12c2, 0x12c5,
0x12c8, 0x12d6,
0x12d8, 0x1310,
0x1312, 0x1315,
0x1318, 0x135a,
0x1380, 0x138f,
0x13a0, 0x13f4,
0x1401, 0x166c,
0x166f, 0x1676,
0x1681, 0x169a,
0x16a0, 0x16ea,
0x1700, 0x170c,
0x170e, 0x1711,
0x1720, 0x1731,
0x1740, 0x1751,
0x1760, 0x176c,
0x176e, 0x1770,
0x1780, 0x17b3,
0x17d7, 0x17d7,
0x17dc, 0x17dc,
0x1820, 0x1877,
0x1880, 0x18a8,
0x1900, 0x191c,
0x1950, 0x196d,
0x1970, 0x1974,
0x1980, 0x19a9,
0x19c1, 0x19c7,
0x1a00, 0x1a16,
0x1b05, 0x1b33,
0x1b45, 0x1b4b,
0x1d00, 0x1dbf,
0x1e00, 0x1e9b,
0x1ea0, 0x1ef9,
0x1f00, 0x1f15,
0x1f18, 0x1f1d,
0x1f20, 0x1f45,
0x1f48, 0x1f4d,
0x1f50, 0x1f57,
0x1f59, 0x1f59,
0x1f5b, 0x1f5b,
0x1f5d, 0x1f5d,
0x1f5f, 0x1f7d,
0x1f80, 0x1fb4,
0x1fb6, 0x1fbc,
0x1fbe, 0x1fbe,
0x1fc2, 0x1fc4,
0x1fc6, 0x1fcc,
0x1fd0, 0x1fd3,
0x1fd6, 0x1fdb,
0x1fe0, 0x1fec,
0x1ff2, 0x1ff4,
0x1ff6, 0x1ffc,
};

static unsigned TABLE4[] = {
34,
0x2071, 0x2071,
0x207f, 0x207f,
0x2090, 0x2094,
0x2102, 0x2102,
0x2107, 0x2107,
0x210a, 0x2113,
0x2115, 0x2115,
0x2119, 0x211d,
0x2124, 0x2124,
0x2126, 0x2126,
0x2128, 0x2128,
0x212a, 0x212d,
0x212f, 0x2139,
0x213c, 0x213f,
0x2145, 0x2149,
0x214e, 0x214e,
0x2183, 0x2184,
0x2c00, 0x2c2e,
0x2c30, 0x2c5e,
0x2c60, 0x2c6c,
0x2c74, 0x2c77,
0x2c80, 0x2ce4,
0x2d00, 0x2d25,
0x2d30, 0x2d65,
0x2d6f, 0x2d6f,
0x2d80, 0x2d96,
0x2da0, 0x2da6,
0x2da8, 0x2dae,
0x2db0, 0x2db6,
0x2db8, 0x2dbe,
0x2dc0, 0x2dc6,
0x2dc8, 0x2dce,
0x2dd0, 0x2dd6,
0x2dd8, 0x2dde,
};

static unsigned TABLE5[] = {
7,
0xa000, 0xa48c,
0xa717, 0xa71a,
0xa800, 0xa801,
0xa803, 0xa805,
0xa807, 0xa80a,
0xa80c, 0xa822,
0xa840, 0xa873,
};

static unsigned TABLE6[] = {
18,
0xfb00, 0xfb06,
0xfb13, 0xfb17,
0xfb1d, 0xfb1d,
0xfb1f, 0xfb28,
0xfb2a, 0xfb36,
0xfb38, 0xfb3c,
0xfb3e, 0xfb3e,
0xfb40, 0xfb41,
0xfb43, 0xfb44,
0xfb46, 0xfbb1,
0xfbd3, 0xfd3d,
0xfd50, 0xfd8f,
0xfd92, 0xfdc7,
0xfdf0, 0xfdfb,
0xfe70, 0xfe74,
0xfe76, 0xfefc,
0xff21, 0xff3a,
0xff41, 0xff5a,
};

static unsigned OTHERS_TABLE[] = {
56,
0x10000, 0x1000b,
0x1000d, 0x10026,
0x10028, 0x1003a,
0x1003c, 0x1003d,
0x1003f, 0x1004d,
0x10050, 0x1005d,
0x10080, 0x100fa,
0x10300, 0x1031e,
0x10330, 0x10340,
0x10342, 0x10349,
0x10380, 0x1039d,
0x103a0, 0x103c3,
0x103c8, 0x103cf,
0x10400, 0x1049d,
0x10800, 0x10805,
0x10808, 0x10808,
0x1080a, 0x10835,
0x10837, 0x10838,
0x1083c, 0x1083c,
0x1083f, 0x1083f,
0x10900, 0x10915,
0x10a00, 0x10a00,
0x10a10, 0x10a13,
0x10a15, 0x10a17,
0x10a19, 0x10a33,
0x12000, 0x1236e,
0x1d400, 0x1d454,
0x1d456, 0x1d49c,
0x1d49e, 0x1d49f,
0x1d4a2, 0x1d4a2,
0x1d4a5, 0x1d4a6,
0x1d4a9, 0x1d4ac,
0x1d4ae, 0x1d4b9,
0x1d4bb, 0x1d4bb,
0x1d4bd, 0x1d4c3,
0x1d4c5, 0x1d505,
0x1d507, 0x1d50a,
0x1d50d, 0x1d514,
0x1d516, 0x1d51c,
0x1d51e, 0x1d539,
0x1d53b, 0x1d53e,
0x1d540, 0x1d544,
0x1d546, 0x1d546,
0x1d54a, 0x1d550,
0x1d552, 0x1d6a5,
0x1d6a8, 0x1d6c0,
0x1d6c2, 0x1d6da,
0x1d6dc, 0x1d6fa,
0x1d6fc, 0x1d714,
0x1d716, 0x1d734,
0x1d736, 0x1d74e,
0x1d750, 0x1d76e,
0x1d770, 0x1d788,
0x1d78a, 0x1d7a8,
0x1d7aa, 0x1d7c2,
0x1d7c4, 0x1d7cb,
};


@implementation UnicodeHelper
+ (BOOL)isPrivate:(UniChar)c
{
	/*
	 if (0xE000 <= c && c <= 0xF8FF) return CK_PRIVATE_USE_AREA;
	 */
	
	return 0xe000 <= c && c <= 0xf8ff;
}

+ (BOOL)isIdeographic:(UniChar)c
{
	/*
	 if (0x2E80 <= c && c <= 0x2EFF) return CK_CJK_RADICALS_SUPPLEMENT;
	 if (0x2F00 <= c && c <= 0x2FDF) return CK_KANGXI_RADICALS;
	 if (0x2FF0 <= c && c <= 0x2FFF) return CK_IDEOGRAPHIC_DESCRIPTION_CHARACTERS;
	 if (0x3000 <= c && c <= 0x303F) return CK_CJK_SYMBOLS_AND_PUNCTUATION;
	 if (0x3040 <= c && c <= 0x309F) return CK_HIRAGANA;
	 if (0x30A0 <= c && c <= 0x30FF) return CK_KATAKANA;
	 if (0x3100 <= c && c <= 0x312F) return CK_BOPOMOFO;
	 if (0x3130 <= c && c <= 0x318F) return CK_HANGUL_COMPATIBILITY_JAMO;
	 if (0x3190 <= c && c <= 0x319F) return CK_KANBUN;
	 if (0x31A0 <= c && c <= 0x31BF) return CK_BOPOMOFO_EXTENDED;
	 if (0x31C0 <= c && c <= 0x31EF) return CK_CJK_STROKES;
	 if (0x31F0 <= c && c <= 0x31FF) return CK_KATAKANA_PHONETIC_EXTENSIONS;
	 if (0x3200 <= c && c <= 0x32FF) return CK_ENCLOSED_CJK_LETTERS_AND_MONTHS;
	 if (0x3300 <= c && c <= 0x33FF) return CK_CJK_COMPATIBILITY;
	 if (0x3400 <= c && c <= 0x4DBF) return CK_CJK_UNIFIED_IDEOGRAPHS_EXTENSION_A;
	 if (0x4DC0 <= c && c <= 0x4DFF) return CK_YIJING_HEXAGRAM_SYMBOLS;
	 if (0x4E00 <= c && c <= 0x9FFF) return CK_CJK_UNIFIED_IDEOGRAPHS;
	 
	 if (0xA000 <= c && c <= 0xA48F) return CK_YI_SYLLABLES;
	 if (0xA490 <= c && c <= 0xA4CF) return CK_YI_RADICALS;
	 
	 if (0xF900 <= c && c <= 0xFAFF) return CK_CJK_COMPATIBILITY_IDEOGRAPHS;
	 
	 if (0xFE30 <= c && c <= 0xFE4F) return CK_CJK_COMPATIBILITY_FORMS;
	 if (0xFF00 <= c && c <= 0xFFEF) return CK_HALFWIDTH_AND_FULLWIDTH_FORMS;
	 */
	
	return 0x2e80 <= c && c <= 0x9fff
	|| 0xa000 <= c && c <= 0xa4cf
	|| 0xf900 <= c && c <= 0xfaff
	|| 0xfe30 <= c && c <= 0xfe4f
	|| 0xff00 <= c && c <= 0xffef;
}

+ (BOOL)isIdeographicOrPrivate:(UniChar)c
{
	/*
	 if (0x2E80 <= c && c <= 0x2EFF) return CK_CJK_RADICALS_SUPPLEMENT;
	 if (0x2F00 <= c && c <= 0x2FDF) return CK_KANGXI_RADICALS;
	 if (0x2FF0 <= c && c <= 0x2FFF) return CK_IDEOGRAPHIC_DESCRIPTION_CHARACTERS;
	 if (0x3000 <= c && c <= 0x303F) return CK_CJK_SYMBOLS_AND_PUNCTUATION;
	 if (0x3040 <= c && c <= 0x309F) return CK_HIRAGANA;
	 if (0x30A0 <= c && c <= 0x30FF) return CK_KATAKANA;
	 if (0x3100 <= c && c <= 0x312F) return CK_BOPOMOFO;
	 if (0x3130 <= c && c <= 0x318F) return CK_HANGUL_COMPATIBILITY_JAMO;
	 if (0x3190 <= c && c <= 0x319F) return CK_KANBUN;
	 if (0x31A0 <= c && c <= 0x31BF) return CK_BOPOMOFO_EXTENDED;
	 if (0x31C0 <= c && c <= 0x31EF) return CK_CJK_STROKES;
	 if (0x31F0 <= c && c <= 0x31FF) return CK_KATAKANA_PHONETIC_EXTENSIONS;
	 if (0x3200 <= c && c <= 0x32FF) return CK_ENCLOSED_CJK_LETTERS_AND_MONTHS;
	 if (0x3300 <= c && c <= 0x33FF) return CK_CJK_COMPATIBILITY;
	 if (0x3400 <= c && c <= 0x4DBF) return CK_CJK_UNIFIED_IDEOGRAPHS_EXTENSION_A;
	 if (0x4DC0 <= c && c <= 0x4DFF) return CK_YIJING_HEXAGRAM_SYMBOLS;
	 if (0x4E00 <= c && c <= 0x9FFF) return CK_CJK_UNIFIED_IDEOGRAPHS;
	 
	 if (0xA000 <= c && c <= 0xA48F) return CK_YI_SYLLABLES;
	 if (0xA490 <= c && c <= 0xA4CF) return CK_YI_RADICALS;
	 
	 if (0xE000 <= c && c <= 0xF8FF) return CK_PRIVATE_USE_AREA;
	 if (0xF900 <= c && c <= 0xFAFF) return CK_CJK_COMPATIBILITY_IDEOGRAPHS;
	 
	 if (0xFE30 <= c && c <= 0xFE4F) return CK_CJK_COMPATIBILITY_FORMS;
	 if (0xFF00 <= c && c <= 0xFFEF) return CK_HALFWIDTH_AND_FULLWIDTH_FORMS;
	 */
	
	return 0x2e80 <= c && c <= 0x9fff
	|| 0xa000 <= c && c <= 0xa4cf
	|| 0xe000 <= c && c <= 0xfaff
	|| 0xfe30 <= c && c <= 0xfe4f
	|| 0xff00 <= c && c <= 0xffef;
}

+ (BOOL)isAlphabeticalCodePoint:(int)c
{
	unsigned* T = 0;
	
	if (c <= 0x7f) {
		return 0x41 <= c && c <= 0x5a || 0x61 <= c && c <= 0x7a;
	}
	
	if (0xaa <= c && c <= 0x2ee) {
		T = TABLE1;
	}
	else if (0x37a <= c && c <= 0xf8b) {
		T = TABLE2;
	}
	else if (0x1000 <= c && c <= 0x1ffc) {
		T = TABLE3;
	}
	else if (0x2071 <= c && c <= 0x2dde) {
		T = TABLE4;
	}
	else if (0xa000 <= c && c <= 0xa873) {
		T = TABLE5;
	}
	else if (0xfb00 <= c && c <= 0xff5a) {
		T = TABLE6;
	}
	else if (0x10000 <= c && c <= 0x1d7cb) {
		T = OTHERS_TABLE;
	}
	
	if (!T) return NO;
	
	int count = *T;
	T++;
	
	int left = 0;
	int right = count;
	
	while (left < right) {
		int center = (left + right) / 2;
		int start = T[center*2];
		int end = T[center*2+1];
		
		if (start <= c && c <= end) return YES;
		if (c < start) {
			right = center;
			continue;
		}
		else {
			left = center + 1;
			continue;
		}
	}
	
	return NO;
}

@end
