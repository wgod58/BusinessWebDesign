<%@page pageEncoding="utf-8"%><%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) {
            try {
                rs.close();
            } catch (Exception e) {}
            rs = null;
        }
        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {}
        }
        if (conn != null) {
            try {        	
                conn.close();
            } catch (SQLException e) {}
        }
    }
%>