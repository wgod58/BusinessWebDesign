<%@page pageEncoding="utf-8" import="java.util.regex.*,java.io.*,java.util.*"%><%

    JSONObject __cookieObj = null;
    public JSONObject getCookieObj(){
        if(__cookieObj == null){
            __cookieObj = new JSONObject();
            javax.servlet.http.Cookie cookies[] = request.getCookies();
            if (cookies != null) {
            	for (int i = 0; i < cookies.length; i++) {
            		javax.servlet.http.Cookie ck = cookies[i];
            		try {
            			__cookieObj.put(ck.getName(), ck.getValue());
            		} catch (Exception e) {}
            	}
            }
        }
        return __cookieObj;
    }
%>