<%@page pageEncoding="utf-8"%><%

	public byte[] encodeCheckCode(byte[] src) {
		if (src.length > 0) {
			byte[] result = new byte[src.length + 1];
			byte code = -88;
			for (int i = 0; i < src.length; i++) {
				result[i] = src[i];
				code ^= src[i];
			}
			result[src.length] = code;
			return result;
		}
		return null;
	}

	public byte[] decodeCheckCode(byte[] src) {
		if (src.length > 1) {
			byte[] result = new byte[src.length - 1];
			byte code = -88;
			for (int i = 0; i < result.length; i++) {
				result[i] = src[i];
				code ^= src[i];
			}
			if (code == src[result.length])
				return result;
		}
		return null;
	}
	//public static String getLineNumber() { return "" + Thread.currentThread().getStackTrace()[2].getLineNumber(); }
	//test #1:
	//byte[] a = { 0x10, 0x20 };
	//byte[] b = encodeCheckCode(a);
	//byte[] c = decodeCheckCode(b);
	//assertTrue(getLineNumber(), a.length == 2);
	//assertTrue(getLineNumber(), b != null);
	//assertTrue(getLineNumber(), b.length == 3);
	//assertTrue(getLineNumber(), c != null);
	//assertTrue(getLineNumber(), c.length == 2);
	//assertTrue(getLineNumber(), c[0] == a[0]);
	//assertTrue(getLineNumber(), c[1] == a[1]);
	//
	//test #2:
	//byte[] a = { 0x10, 0x20 };
	//byte[] b = encodeCheckCode(a);
	//b[2] = 0x00;
	//byte[] c = decodeCheckCode(b);
	//assertTrue(getLineNumber(), a.length == 2);
	//assertTrue(getLineNumber(), b != null);
	//assertTrue(getLineNumber(), b.length == 3);
	//assertTrue(getLineNumber(), c == null);
	//
	//test #3:
	//byte[] a = {};
	//byte[] b = encodeCheckCode(a);
	//assertTrue(getLineNumber(), a.length == 0);
	//assertTrue(getLineNumber(), b == null);
	//
	//test #4:
	//byte[] a = { 0x01 };
	//byte[] b = decodeCheckCode(a);
	//assertTrue(getLineNumber(), a.length == 1);
	//assertTrue(getLineNumber(), b == null);
%>