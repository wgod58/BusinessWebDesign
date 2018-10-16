<%@page pageEncoding="utf-8" import="org.json.*,org.apache.logging.log4j.*"%><%
final Logger logger = LogManager.getLogger(getClass().getName());
class Service {
%><%@include file="/base/web/code.pu.jsp"%><%
%><%@include file="/base/service/code.ServicePart.jsp"%><%
	
	public void doService() throws Exception {
		try{
			String responseText = getResponseTextFromCache();
			if (responseText == null) {
				responseText = loadPage();
				setResponseTextToCache(responseText);
			}
			out.write(responseText);
		}catch(Exception e){
			out.write("ERROR");
		}
	}
}
%>