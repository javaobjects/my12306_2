package net.tencent.tickets.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 * 
* <p>Title: DBUtils_pool</p>  
* <p>
*	Description: 
* 启用连接池技术的DBUtil工具类
* 
* 步骤：
* 1.在META-INF目录下创建配置文件context.xml
* 2.编写DBUtils_pool工具类
* 在里面定义getConnection方法
* 
* 3.这个方法定义完之后不可以马上写main方法测试，因为这个池子是基于Tomcat容器实现的，所以
* 必须把web应用部署到Tomcat服务器上之后才可以测试
* </p> 
* @author xianxian 
* @date 2019年9月5日
 */
public class DBUtils_pool {
	
	public static Connection getConnection() {
		Connection conn = null;
		try {
			// //1.上下文 实例化Context对象，其实读取Context.xml文件中的资源
			Context context = new InitialContext();
			// 2.查找数据源,参数格式：java:comp/env/ + context.xml中配置的name属性值 使用lookup方法寻找数据源资源并且造型成DataSource
			DataSource ds = (DataSource) context.lookup("java:comp/env/jdbc/mysql");
			//3.从数据源中获取连接
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	/**
	 * 
	 * <p>Title: release</p>  
	 * <p>
	 *	Description: 
	 * 释放资源的方法
	 * //4.归还连接
	 * </p> 
	 * @param conn
	 * @param stmt
	 * @param rs
	 */
	public static void release(Connection conn, Statement stmt, ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 开启事务
	 * @param conn
	 */
	public static void beginTransaction(Connection conn)
	{
		try {
			conn.setAutoCommit(false);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 提交事务
	 * @param conn
	 */
	public static void commitTransaction(Connection conn)
	{
		try {
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 回滚事务
	 * @param conn
	 */
	public static void rollbackTransaction(Connection conn)
	{
		try {
			conn.rollback();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
