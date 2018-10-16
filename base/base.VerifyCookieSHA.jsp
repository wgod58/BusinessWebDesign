<%@page pageEncoding="utf-8" import="org.json.JSONArray, org.json.JSONObject, org.apache.logging.log4j.*"%><%
final Logger logger = LogManager.getLogger(getClass().getName());
class Service {
%><%@include file="/base/service/code.ServicePart.jsp"%><%
%><%@include file="/base/web/code.getCookieObj.jsp"%><%
%><%@include file="../audy/service/code.checkTime.jsp"%><%

	public void doService() throws Exception {
		try{
            Cache cache = getApplicationCache();
            String cacheContent = "";
            String cacheShaCode = "";
            String cacheShaTime = "";
            JSONObject cookieJsonObj = getCookieObj();
            if (cookieJsonObj.getString("account") != null && cookieJsonObj.getString("shaCode") != null) { //判斷cookie
                String account = cookieJsonObj.getString("account");
                String shaCode = cookieJsonObj.getString("shaCode");
                if (cache.get(account) != null) { //判斷cache
                    cacheContent = cache.get(account).toString();
                    JSONObject cacheJsonObj = new JSONObject(cacheContent);
                    cacheShaCode = cacheJsonObj.getString("shaCode");
                    cacheShaTime = cacheJsonObj.getString("shaTime");
                    if (shaCode.equals(cacheShaCode)) { //判斷shaCode是否相同
                        if (checkTime(cacheShaTime)) { //判斷是否登入逾時
                            String responseText = loadPage();
                            out.write(responseText);
                        }
                        else {
                            throw new Exception("time out error");
                        }
                    }
                    else {
                        throw new Exception("shaCode error");
                    }
                }
                else {
                    throw new Exception("cache error");
                }
            }
            else {
                throw new Exception("cookie error");
            }
		}catch(Exception e){
            //JSONObject errorJsonObj = new JSONObject();
			//errorJsonObj.put("error", "PERMISSION ERROR");
            out.write("PERMISSION ERROR");
            e.printStackTrace();    
		}
	}
}
%>