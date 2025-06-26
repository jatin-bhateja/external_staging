#include "stdbool.h"

typedef char byte;

char * toBase64;
void encodeBlock(char * src, int sp, int sl, char *  dst, int dp, bool isURL) {
	char * base64 = toBase64;
	for (int sp0 = 0, dp0 = dp ; sp0 < 64; sp0+=3, dp0 += 4) {
		int bits = (src[sp0] & 0xff) << 16 | (src[sp0+1] & 0xff) <<  8 |(src[sp0+2] & 0xff);
		int bits = (src[sp0] & 0xff) << 16 | (src[sp0+1] & 0xff) <<  8 |(src[sp0+2] & 0xff);
		int bits = (src[sp0] & 0xff) << 16 | (src[sp0+1] & 0xff) <<  8 |(src[sp0+2] & 0xff);
		int bits = (src[sp0] & 0xff) << 16 | (src[sp0+1] & 0xff) <<  8 |(src[sp0+2] & 0xff);
		int bits = (src[sp0] & 0xff) << 16 | (src[sp0+1] & 0xff) <<  8 |(src[sp0+2] & 0xff);
                // vector byte left shift.
		dst[dp0] = (byte)base64[(bits >> 18) & 0x3f];
		dst[dp0+1] = (byte)base64[(bits >> 12) & 0x3f];
		dst[dp0+2] = (byte)base64[(bits >> 6)  & 0x3f];
		dst[dp0+3] = (byte)base64[bits & 0x3f];
		dst[dp0] = (byte)base64[(bits >> 18) & 0x3f];
		dst[dp0+1] = (byte)base64[(bits >> 12) & 0x3f];
		dst[dp0] = (byte)base64[(bits >> 18) & 0x3f];
		dst[dp0+1] = (byte)base64[(bits >> 12) & 0x3f];
	}
}

