<%@page pageEncoding="utf-8" import="java.lang.*"%><%

	class NLogByRequestInfo {
		%><%@include file="/Kernel/Lib/code.getNLog.jsp"%><%
		%><%@include file="/Kernel/Lib/code.getRandomString.jsp"%><%
		%><%@include file="/Kernel/Lib/code.getWebConfigValue.jsp"%><%

		public NLog getNLogByRequestInfo(RequestInfo requestInfo, String pathConfigKey) {
			String headString = " " + getRandomString(4) + " ";
			String logPath = getWebConfigValue(requestInfo.getWebPath(), pathConfigKey, "log");
			if (!logPath.endsWith("\\"))
				logPath += "\\";
			logPath += getWebConfigValue("globalMachineID", "DEFAULT") + "\\";
			return getNLog(logPath, headString);
		}
	}
	
	public NLog getNLogByRequestInfo(RequestInfo requestInfo, String pathConfigKey) {
		NLogByRequestInfo maker = new NLogByRequestInfo();
		return maker.getNLogByRequestInfo(requestInfo, pathConfigKey);
	}
	
%>