package com.core.base.dao;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.SQLException;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
/**
 * copy from oschina.net
 */
public class DBManager {
	
	private final static Log log = LogFactory.getLog(DBManager.class);
	
	//connection放入局部线程变量，如果没有它，并发将有问题
	private final static ThreadLocal<Connection> conns = new ThreadLocal<Connection>();
	
	private static DataSource dataSource;
	
	private static boolean showsql = false;
	
	static {
	    initDataSource(null);
	}
	 /**
	 * 初始化连接池
	 * @param props
	 */
	private final static void initDataSource(Properties dbProperties) {
	     try {
             if(dbProperties == null){
                   dbProperties = new Properties();
	               dbProperties.load(DBManager.class.getResourceAsStream("/resources/datasource/datasource.properties"));
             }
	         Properties cpProps = new Properties();
	         for(Object key : dbProperties.keySet()) {
	             String skey = (String)key;
	             if(skey.startsWith("jdbc.")){
                      String name = skey.substring(5);
                      cpProps.put(name, dbProperties.getProperty(skey));
	                  if("showsql".equalsIgnoreCase(name)){
	                	  showsql = "true".equalsIgnoreCase(dbProperties.getProperty(skey));
	                  }
	             }
	         }
	
	        dataSource = (DataSource)Class.forName(cpProps.getProperty("datasource")).newInstance();
	        if(dataSource.getClass().getName().indexOf("c3p0")>0){
	             //Disable JMX in C3P0
	             System.setProperty("com.mchange.v2.c3p0.management.ManagementCoordinator","com.mchange.v2.c3p0.management.NullManagementCoordinator");
	        }
	
	        log.info("Using DataSource : " + dataSource.getClass().getName());
	
	        BeanUtils.populate(dataSource, cpProps);
	        
	        Connection conn = getConnection();
	
	        DatabaseMetaData mdm = conn.getMetaData();
	        log.info("Connected to " + mdm.getDatabaseProductName() + " " + mdm.getDatabaseProductVersion());
	        closeConnection();
	     } catch (Exception e) {
	        e.printStackTrace();
	     }
    }
	
	/**
	 * 断开连接池
	 */
	 public final static void closeDataSource(){
	      try {
	           dataSource.getClass().getMethod("close").invoke(dataSource);
	      } catch (NoSuchMethodException e){
	        	
	      } catch (Exception e) {
	          log.error("Unabled to destroy DataSource!!! ", e);
	      }
	  }
	   
	 public final static Connection getConnection(){
	      Connection conn = conns.get();
	      try {
			if(conn ==null || conn.isClosed()){
			      conn = dataSource.getConnection();
			      conns.set(conn);
			  }
		} catch (SQLException e) {
			e.printStackTrace();
		}
	      return (showsql && !Proxy.isProxyClass(conn.getClass()))? new _DebugConnection(conn).getConnection():conn;
	}
	     
	/**
	 * 关闭连接
	 */
	public final static void closeConnection() {
	    Connection conn = conns.get();
	    try {
	       if(conn != null && !conn.isClosed()){
	            conn.setAutoCommit(true);
	            conn.close();
	        }
	     } catch (SQLException e) {
	           log.error("Unabled to close connection ", e);
	     }
	     conns.set(null);
	 }
	/**
	 * 用于跟踪执行的SQL语句
	 */
	 static class _DebugConnection implements InvocationHandler {
	       private final static Log log = LogFactory.getLog(_DebugConnection.class);
	       private Connection conn = null;
	       public _DebugConnection(Connection conn) {
	           this.conn = conn;
	       }
	        /**
	         * Returns the conn.
	         * @return Connection
	         */
	        public Connection getConnection() {
	            return (Connection) Proxy.newProxyInstance(conn.getClass().getClassLoader(),
	                             conn.getClass().getInterfaces(), this);
	        }
	         
	        public Object invoke(Object proxy, Method m, Object[] args) throws Throwable {
	            try {
	                String method = m.getName();
	                if("prepareStatement".equals(method) || "createStatement".equals(method))
	                    log.info("[SQL] >>> " + args[0]);             
	                return m.invoke(conn, args);
	            } catch (InvocationTargetException e) {
	                throw e.getTargetException();
	            }
	        }
     }
}