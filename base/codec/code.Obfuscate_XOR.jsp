<%@page pageEncoding="utf-8" import="java.util.Random"%><%

	private byte[] __obfuscateMask = { 118, 4, 14, -5, 25, -6, -97, -119, -56, -124, 84,
			-113, -7, 15, 69, 16, 58, -15, 56, -67, 17, 126, 54, -96, 101, 18,
			-101, 62, -21, -14, 0, -78, -110, -91, -82, 71, 113, -63, 86, 78,
			41, 63, 42, -76, -53, 65, -125, 119, 9, -121, -40, 122, 49, 81,
			-25, -68, -35, -32, -104, 77, 102, 108, 32, -58, 80, 19, 112, 96,
			-95, -128, 111, -112, 50, -47, -46, -72, 76, 89, 94, -71, -30, 43,
			114, -50, 106, -10, -120, 83, 40, 91, 100, 33, 73, 92, 51, 2, 44,
			6, -27, 10, -52, -115, 97, 95, 13, -33, -37, -43, -89, 88, -62,
			-23, 70, -42, 67, -111, 93, 46, -66, 79, -19, 45, -83, 35, 55, -39,
			29, 53, 38, -105, -73, -92, -114, -61, 74, 7, 57, 98, 87, 27, 61,
			-84, 30, -12, -90, -48, 90, -102, -99, -17, -88, 59, 23, -55, -9,
			-8, -1, -94, 103, 125, -74, 60, 3, 24, 39, 31, 34, 99, 110, -118,
			-28, -57, 48, 37, -93, -54, 72, 104, 22, 20, -20, -65, -123, 109,
			-117, 52, 68, -116, 26, 82, -3, 36, 28, 117, -51, -106, -31, -85,
			-70, 66, 85, -126, -122, -13, -16, -4, -45, -75, 75, 121, 124,
			-109, -44, -49, 47, 116, 120, -26, 115, -38, 11, -41, 123, -11,
			-29, 8, -60, -77, -59, -100, -64, 12, 21, -87, -36, -127, -69,
			-103, -18, 127, 105, -107, 5, 1, 107, -24, -81, -22, -79, -80, 64,
			-86, -34, -98, -2, -108 };
	
	public byte[] encodeObfuscate(byte[] src) {
		byte[] result = new byte[src.length + 1];
		Random random = new Random();
		int maskIndex = random.nextInt(256);
		result[0] = (byte) maskIndex;
		for (int i = 0; i < src.length; i++) {
			result[i + 1] = (byte) (src[i] ^ __obfuscateMask[maskIndex++]);
			if (maskIndex > 255) {
				maskIndex = 0;
			}
		}
		return result;
	}
	
	public byte[] decodeObfuscate(byte[] src) {
		byte[] result = new byte[src.length - 1];
		int maskIndex = src[0] & 0xff;
		for (int i = 0; i < result.length; i++) {
			result[i] = (byte) (src[i + 1] ^ __obfuscateMask[maskIndex++]);
			if (maskIndex > 255) {
				maskIndex = 0;
			}
		}
		return result;
	}
	//public static String getLineNumber() { return "" + Thread.currentThread().getStackTrace()[2].getLineNumber(); }
	//test #1:
	//String s1 = "1234";
	//byte[] a = s1.getBytes();
	//byte[] b = encodeObfuscate(a);
	//byte[] c = encodeObfuscate(b);
	//byte[] d = decodeObfuscate(c);
	//byte[] e = decodeObfuscate(d);
	//String s2 = new String(e);
	//assertTrue(getLineNumber(),s2.endsWith(s1));
%>