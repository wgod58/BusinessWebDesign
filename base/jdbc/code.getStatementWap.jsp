<%@page pageEncoding="utf-8" import="java.sql.*,java.util.*,javax.naming.*,java.util.concurrent.*,org.apache.tomcat.jdbc.pool.*"%><%

    class StatementWap implements AutoCloseable {
        private Connection connection = null;
        private Statement statement = null;
        private PreparedStatement preparedStatement = null;
        private ResultSet resultSet = null;
        private void closeConnect() {
            if (connection != null) {
                try {
                    connection.close();
                } catch (Exception e) {}
                connection = null;
            }
        }
        private void closeStatement() {
            if (statement != null) {
                try {
                    statement.close();
                } catch (Exception e) {}
                statement = null;
            }
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (Exception e) {}
                preparedStatement = null;
            }
        }
        private void closeResultSet() {
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (Exception e) {}
                resultSet = null;
            }
        }
        public StatementWap(Connection connection) {
            this.connection = connection;
        }
        public void close() {
            closeResultSet();
            closeStatement();
            closeConnect();
        }
        public void setAutoCommit(boolean set)throws Exception {
            if (connection != null) {
                connection.setAutoCommit(set);
            }
        }
        public PreparedStatement prepareStatement(String sql)throws Exception {
            closeResultSet();
            closeStatement();
            if (connection != null) {
                preparedStatement = connection.prepareStatement(sql);
            }
            return preparedStatement;
        }
        public ResultSet executeQuery(String sql)throws Exception {
            closeResultSet();
            if (connection != null) {
                if (statement == null) {
                    closeStatement();
                    statement = connection.createStatement();
                }
                resultSet = statement.executeQuery(sql);
            }
            return resultSet;
        }
        public int queryInt(String sql)throws Exception {
            executeQuery(sql);
            if (resultSet != null && resultSet.next()) {
                return resultSet.getInt(1);
            }
            return -1;
        }
        public String queryString(String sql)throws Exception {
            executeQuery(sql);
            if (resultSet != null && resultSet.next()) {
                return resultSet.getString(1);
            }
            return "";
        }
        public int executeUpdate(String sql)throws Exception {
            closeResultSet();
            if (connection != null) {
                if (statement == null) {
                    closeStatement();
                    statement = connection.createStatement();
                }
                return statement.executeUpdate(sql);
            }
            return 0;
        }
    }
	
	class ApplicationDataSource {
		%><%@include file="/base/resource/code.getProperties.jsp"%><%

		public String propName;
		public String propFile;

		public ApplicationDataSource(String propName) {
			this.propName = propName;
		}
		public Properties getProperties() {
			propFile = getWEB_INF_PATH() + propName + ".properties";
			return getProperties(new File(propFile));
		}
		public DataSource getApplicationDataSource() {
			DataSource ds = (DataSource)application.getAttribute("DataSource:" + propName);
			if (ds == null) {
				synchronized(DataSource.class) {
					ds = (DataSource)application.getAttribute("DataSource:" + propName);
					if (ds == null) {
						PoolConfiguration pc = DataSourceFactory.parsePoolProperties(getProperties());
						ds = new DataSource(pc);
						if (ds != null) {
							application.setAttribute("DataSource:" + propName, ds);
						}
					}
				}
			}
			return ds;
		}
	}

    public StatementWap getStatementWapByProperties(String propName)throws Exception {
    	ApplicationDataSource ds = new ApplicationDataSource(propName);
    	return new StatementWap(ds.getApplicationDataSource().getConnection());
    }

    //需進階操作使用的函式
    public StatementWap getStatementWapByProperties(String propName, String propFile)throws Exception {
    	ApplicationDataSource ds = new ApplicationDataSource(propName) {
			public Properties getProperties() {
				return getProperties(new File(propFile));
			}
		};
		ds.propFile = propFile;
		return new StatementWap(ds.getApplicationDataSource().getConnection());
	}
    //file: webapps/xxx/WEB-INF/jdbc/sample.properties
    // driverClassName=com.mysql.jdbc.Driver
    // url=jdbc:mysql://localhost:3306/mysql?autoReconnect=true
    // username=root
    // password=123456
    // maxActive=50
    // maxIdle=10
    // maxWait=15000
    // removeAbandoned=true
    // removeAbandonedTimeout=30    
    //
    //sample1:
    //StatementWap statement = null;
    //try {
    //  statement = getStatementWapByProperties("jdbc/sample");
    //  String aaa = statement.queryString("select count(*) from help_topic");
    //  ...
    //  ResultSet rs = statement.executeQuery("select * from dbo.stSecuC");
    //  while(rs.next()){
    //        rs.getInt(1); // 取第一個欄位的數值
    //        rs.getInt("欄位名稱"); // 取此欄位名稱的數值
    //  }
    //} catch (Exception e) {
    //  ...
    //} finally {
    //  if (statement != null) {
    //      statement.close();
    //  }
    //}
    //
    //sample2: //這是 Java 1.7 的寫法(Tomcat 8才能使用)，會自動執行 close()
    //try (StatementWap statement = getStatementWapByProperties("jdbc/sample");) {
    //  String aaa = statement.queryString("select count(*) from help_topic");
    //  ...
    //  ResultSet rs = statement.executeQuery("select * from dbo.stSecuC");
    //  while(rs.next()){
    //        rs.getInt(1); // 取第一個欄位的數值
    //        rs.getInt("欄位名稱"); // 取此欄位名稱的數值
    //  }
    //} catch (Exception e) {
    //  ...
    //}

    public StatementWap getStatementWapByResource(String jdbcTag)throws Exception {
        Context initContext = new InitialContext();
        Context envContext = (Context)initContext.lookup("java:/comp/env");
        DataSource ds = (DataSource)envContext.lookup(jdbcTag);
        return new StatementWap(ds.getConnection());
    }
    //file: tomcat/conf/context.xml 增加DB連線的Resource
    //<Context>
    //    <Resource name="jdbc/mssql" auth="Container" type="javax.sql.DataSource" maxActive="50" maxIdle="10" maxWait="15000"
    //          driverClassName="com.microsoft.sqlserver.jdbc.SQLServerDriver"
    //          url="jdbc:sqlserver://10.1.41.70:1433;databaseName=stock;user=sa;password=12345678;autoReconnect=true;"
    //          removeAbandoned="true" removeAbandonedTimeout="30" />
    //</Context>
    //
    //sample:
    //StatementWap statement = null;
    //try {
    //  statement = getStatementWapByResource("jdbc/mssql");
    //  String aaa = statement.queryString("select count(0) from dbo.stSecuC");
    //  ...
    //  ResultSet rs = statement.executeQuery("select * from dbo.stSecuC");
    //  while(rs.next()){
    //        rs.getInt(1); // 取第一個欄位的數值
    //        rs.getInt("欄位名稱"); // 取此欄位名稱的數值
    //  }
    //} catch (Exception e) {
    //  ...
    //} finally {
    //  if (statement != null) {
    //      statement.close();
    //  }
    //}
%>