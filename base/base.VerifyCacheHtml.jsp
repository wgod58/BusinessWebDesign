<%@page pageEncoding="utf-8" import="org.json.*,org.apache.logging.log4j.*,java.text.*,java.nio.*"%><%
final Logger logger = LogManager.getLogger(getClass().getName());
class Service {
%><%@include file="/base/web/code.pu.jsp"%><%
%><%@include file="/base/service/code.ServicePart.jsp"%><%
%><%@include file="/base/service/code.CheckVerifyPart.jsp"%><%

	public void doService() throws Exception {
		try{
			if(doCodeVerify("Ax2gKq") == false){
				throw new Exception("check verify error");	
			}
			String responseText = getResponseTextFromCache();
			if (responseText == null) {
				responseText = loadPage();
				setResponseTextToCache(responseText);
			}
			out.write(responseText);
		}catch(Exception e){
			String debug = getParameter("bugout");
			if(debug.equals("true")){
				out.write(e.toString());
			}else{
				out.write("ERROR");
			}
		}
	}
}
%>