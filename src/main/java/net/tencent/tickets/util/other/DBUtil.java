package net.tencent.tickets.util.other;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class DBUtil {

	private static Properties properties = new Properties();
	
	/**静态代码块:类加载时，仅被执行一次*/
	static{
		try {
			//0.加载外部配置文件db.properties
			String path = DBUtil.class.getResource("/dbconfig/mysql_jdbc.properties").getPath();
			System.out.println("path: " + path);
			properties.load(new FileInputStream(path));
			
			//1.载入JDBC驱动程序
			Class.forName(properties.getProperty("jdbc.driverClassName"));//驱动描述符  oracle.jdbc.driver.OracleDriver
		
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 获取数据库连接
	 * @return
	 */
	public static Connection getConnection() {
		Connection conn = null;
		try {
			// 2.定义连接URL jdbc:oracle:thin:@<主机IP>:1521:<数据库服务名>
			String url = properties.getProperty("jdbc.url");

			System.out.println("url: " + url);
			// 3.建立连接
			conn = DriverManager.getConnection(url, properties.getProperty("jdbc.username"),
					properties.getProperty("jdbc.password"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	/**
	 * 关闭数据库资源------------给dao使用
	 * @param conn
	 * @param stat
	 * @param rs
	 */
	public static void close(Statement stat,ResultSet rs)
	{
		//7.关闭连接
		//使用顺序：Connection -> Statement -> ResultSet
		//关闭顺序：ResultSet -> Statement -> Connection
		try {
			if(rs != null)
			{
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if(stat != null)
			{
				stat.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 关闭数据库资源------------给service使用
	 * @param conn
	 * @param stat
	 * @param rs
	 */
	public static void close(Connection conn)
	{
		//7.关闭连接
		//使用顺序：Connection -> Statement -> ResultSet
		//关闭顺序：ResultSet -> Statement -> Connection
		try {
			if(conn != null)
			{
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
