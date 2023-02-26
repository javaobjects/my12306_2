package net.tencent.tickets.util.test;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.tencent.tickets.util.DBUtils_pool;


@WebServlet("/TestDBUtils_pool")
public class TestDBUtils_pool extends HttpServlet{

	/**
	 * serialVersionUID
	*/
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DBUtils_pool dbUtils_pool = new DBUtils_pool();

		System.out.println("dbUtils_pool： " + dbUtils_pool.getConnection());
		
	}

}
