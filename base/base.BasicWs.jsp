<%@page pageEncoding="utf-8" import="org.json.*,org.apache.logging.log4j.*"%><%
final Logger logger = LogManager.getLogger(getClass().getName());
class Service {
%><%@include file="/base/service/code.ServicePart.jsp"%><%
	
	public void doService() throws Exception {
		try{
			String responseText = loadPage();
			out.write(responseText);
		}catch(Exception e){
			out.write("ERROR");
		}
	}
}
//sample:
//Service service = new Service() {
//	public String service() throws Exception {
//		String s1 = getParameter("s1"); //若內容有空白就傳回""
//		String s2 = getParameter("s2", "[0-9]+"); //若內容不是數字就傳回""
//		JSONObject obj = new JSONObject();
//		obj.put("first", s1);
//		obj.put("second", s2);
//		return obj.toString();
//	}
//}
//service.doService();
%>