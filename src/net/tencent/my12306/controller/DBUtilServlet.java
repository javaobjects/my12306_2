package net.tencent.my12306.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.tencent.my12306.util.DBUtils_pool;



/**
 * Servlet implementation class DBUtilServlet
 */
@WebServlet("/DBUtilServlet")
public class DBUtilServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1)
			throws ServletException, IOException {
		System.out.println("before:"+System.currentTimeMillis());
		
		
		for (int i = 0; i < 10000; i++) {
			Connection conn = DBUtils_pool.getConnection();
			
		//	System.out.println(conn);
			
			try {
				//还回连接池
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		System.out.println("after:"+System.currentTimeMillis());
	}
       
   

}
