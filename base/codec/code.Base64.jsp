<%@page pageEncoding="utf-8" import="org.apache.commons.codec.binary.Base64"%><%
	
	public String encodeBase64String(byte[] bytes) {
		return Base64.encodeBase64String(bytes);
	}
	
	public String encodeBase64URLSafeString(byte[] bytes) {
		return Base64.encodeBase64URLSafeString(bytes);
	}
	
	public byte[] decodeBase64(String base64) {
		return Base64.decodeBase64(base64);
	}
	//sample:
	//String base64 = encodeBase64URLSafeString(s.getBytes());
	//String text = new String(decodeBase64(base64));
%>