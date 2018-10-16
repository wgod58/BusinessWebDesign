<%@page pageEncoding="utf-8" import="com.systex.caching.Cache,com.systex.object.Destroyable"%><%
	
	public Cache getApplicationCache() {
		return getApplicationCache("SystexApplicationCache");
	}
	
	public Cache getApplicationCache(String cacheName) {
		Cache cache = (Cache)application.getAttribute("CACHE:"+cacheName);
		if (cache == null) {
			synchronized (Cache.class) {
				cache = (Cache)application.getAttribute("CACHE:"+cacheName);
				if (cache == null) {
					cache = new Cache();
					application.setAttribute("CACHE:"+cacheName, cache);
				}
			}
		}
		return cache;
	}
	//sample#1:
	//Cache cache = getApplicationCache();
	//A someObject;
	//cache.put("KEY_STRING", someObject, 500); //500 millisecond 就失效
	//cache.put("KEY_STRING", someObject, new String[]{"08:59:30","13:30"}); //早上8:59:30 或 下午13:30:00 就失效
	//cache.put("KEY_STRING", someObject, 500, new String[]{"08:59:30","13:30"}); //500 millisecond 或 早上8:59:30 或 下午13:30:00 就失效);
	//A object = (A)cache.get("KEY_STRING");
	//
	//sample#2:
	//Cache cache = getApplicationCache();
	//class B implements Destroyable {
	//  ...
	//	public void destroy() { System.out.println("B:destroy"); }
	//}
	//B b = new B(); 
	//cache.put("KEY_STRING", b, 500); //500 millisecond 就失效，失效的同時會呼叫 b.destroy() 
%>