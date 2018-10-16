<%@page pageEncoding="utf-8"  import="java.sql.*"%><%
    // 可以考慮把這一塊抽起來，當做一份設定檔之類的
    // 需要時就抽換這一段
    final String JDBC_DRIVER = "org.mariadb.jdbc.Driver";
    final String DB_URL = "jdbc:mariadb://10.1.41.51/portal_server";
    final String USERNAME = "root";
    final String PASSWORD = "systex6214.";
    //

    try {
        Class.forName(JDBC_DRIVER);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }

    Connection conn = null;
    Statement statement = null;
    ResultSet rs = null;

    try {
        conn = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
%>