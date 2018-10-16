<%@page pageEncoding="utf-8" import="java.net.URLDecoder"%><%
%><%@include file="/base/caching/code.getApplicationCache.jsp"%><%
    
    private Cache __responseTextCache = null;
    private String[] __cacheSpecifyTimes = null;
    private long __cacheMillisecond = 0;
    private boolean __isSetCacheTime = false;
    public void setCacheTime(long millisecond) {
        __cacheMillisecond = millisecond;
        __isSetCacheTime = true;
    }
    public void setCacheTime(String[] specifyTimes) {
        __cacheSpecifyTimes = specifyTimes;
        __isSetCacheTime = true;
    }
    public String getResponseTextFromCache() {
        if (__responseTextCache == null) {
            __responseTextCache = getApplicationCache();
        }
        return (String) __responseTextCache.get(getRequestKey());
    }
    public void setResponseTextToCache(String responseText) {
        if (__isSetCacheTime) {
            if (__responseTextCache == null) {
                __responseTextCache = getApplicationCache();
            }
            String requestKey = getRequestKey();
            if (__cacheMillisecond > 0 && __cacheSpecifyTimes != null) {
                __responseTextCache.put(requestKey, responseText, __cacheMillisecond, __cacheSpecifyTimes);
            } else if (__cacheMillisecond > 0) {
                __responseTextCache.put(requestKey, responseText, __cacheMillisecond);
            } else if (__cacheSpecifyTimes != null) {
                __responseTextCache.put(requestKey, responseText, __cacheSpecifyTimes);
            }
            __isSetCacheTime = false;
        }
    }
    public void removeCache() {
        if (__responseTextCache != null) {
            __responseTextCache.remove(getRequestKey());
        }
    }
    //需進階操作時才使用此函式，一般建議使用上面的函式，比較有一致性的規範。
    public void removeCache(String key) {
        if (__responseTextCache != null) {
            __responseTextCache.remove(key);
        }
    }

    public String getParameter(String param) {
        return getParameter(param, "\\S+", 64);
    }
    public String getParameter(String param, String regex) {
        return getParameter(param, regex, 64);
    }
    public String getParameter(String param, int limit) {
        return getParameter(param, "\\S+", limit);
    }
    public String getParameter(String param, String regex, int limit) {
        try {
            //String p = request.getParameter(param);
            String p = getParameterIgnorCase(param);
            if (p != null) {
                p = new String(p.getBytes("UTF-8"), "UTF-8");
                p = URLDecoder.decode(p);
                if (limit >= 0 && limit < p.length()) {
                    p = p.substring(0, limit);
                }
                if (p.matches(regex)) {
                    return p;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }
	private String getParameterIgnorCase(String paramName) {
        java.util.Enumeration paramNames = request.getParameterNames();
        while (paramNames.hasMoreElements()) {
            String name = (String) paramNames.nextElement();
            if (name.equalsIgnoreCase(paramName)) {
                return request.getParameter(name);
            }
        }
        return null;
    }
    javax.servlet.http.HttpSession session = pageContext.getSession();
    javax.servlet.jsp.JspWriter out = pageContext.getOut();


    //以下函式可依實際需要，複寫內容

    //Cache相關機制有用到，作為Cache的KEY值
    public String getRequestKey() {
        return (request.getRequestURI() + "?" + request.getQueryString());
    }

    //設定檔的位置，複寫後可以改到其他目錄去
    public String getWEB_INF_PATH() {
        String realPath = request.getServletContext().getRealPath("");
        if (realPath.endsWith("\\") || realPath.endsWith("/")) {
            realPath += "WEB-INF/";
        } else {
            realPath += "/WEB-INF/";
        }
        return realPath;
    }

    public String loadPage() throws Exception {
    	return "";
    }
    // "request.getRequestURL().toString()" : "http://localhost:8080/jsp/index.jsp",
    // "request.getScheme()" : "http",
    // "request.getServerName()" : "localhost",
    // "request.getServerPort()" : 8080,
    // "request.getRequestURI()" : "/jsp/index.jsp",
    // "request.getContextPath()" : "/jsp",
    // "request.getServletPath()" : "/index.jsp",
    // "request.getQueryString()" : "s=123&c=333"

    //sample:
    //public void doService() throws Exception { loadPage(); }
    //use:
    //ws = new Ws(){ 
    //		public String loadPage() throws Exception { overwrite page code ... return esponse_text; } 
    //	}
    //ws.doService();
%>