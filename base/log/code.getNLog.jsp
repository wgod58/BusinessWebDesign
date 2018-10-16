<%@page pageEncoding="utf-8" import="com.systex.logtool.*"%><%
	
	public NLog getNLog(String logPath) {
		NLog log = new NLog(logPath);
		return log;
	}
	public NLog getNLog(String logPath, String leadString) {
		NLog log = new NLog(logPath);
		log.setLogStrInfront(leadString);
		return log;
	}
	public NLog getNLog(String logPath, long logSizeMB) {
		NLog log = new NLog(logPath, logSizeMB);
		return log;
	}
	public NLog getNLog(String logPath, String leadString, long logSizeMB) {
		NLog log = new NLog(logPath, logSizeMB);
		log.setLogStrInfront(leadString);
		return log;
	}
	/*
	//代表log檔放在這個目錄中
	NLog log = getNLog("d:\\SomePathToSaveLog");
	log.log("message");
	//08:56:47.705>message

	//代表log檔每10MB就分出一個檔
	NLog log = getNLog("d:\\SomePathToSaveLog", 10);
	log.log("message");
	//08:56:47.705>message

	//代表log檔的每筆訊息都以 _AAA_ 帶頭
	NLog log = getNLog("d:\\SomePathToSaveLog", "_AAA_");
	log.log("message");
	//08:56:47.705_AAA_message
	*/
%>