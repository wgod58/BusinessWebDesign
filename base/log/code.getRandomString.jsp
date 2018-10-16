<%@page pageEncoding="utf-8" import="java.lang.*"%><%
	public String getRandomString(int length) {
		String seed = "ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwayz23456789";
		return getRandomString(seed, length);
	}
	public String getRandomString(String seed, int length) {
		int i = 0;
		String r = "";
		for (i = 0; i < length; i++) {
			int j = (int)Math.floor(Math.random() * seed.length());
			r += seed.charAt(j);
		}
		return r;
	}
%>