<%@page pageEncoding="utf-8" import="java.io.*,java.util.Properties"%><%
	
    public Properties getProperties(File file) {
        InputStream in = null;
        Properties p = new Properties();
        try {
            in = new FileInputStream(file);
            p.load(in);
        } catch (Exception e) {
            System.out.println(e.toString());
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (Exception e2) {
                    System.out.println(e2.toString());
                }
            }
        }
        return p;
    }
%>