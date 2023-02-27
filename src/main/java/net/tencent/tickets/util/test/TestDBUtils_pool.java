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

	/**
	 * (non-Javadoc)
	 * <p>Title: doGet</p>
	 * <p>
	 *    Description:
	 *    2023年2月26日下午5:12:35 测试通过
	 * </p>
	 * <p>Copyright: Copyright (c) 2017</p>
	 * <p>Company: www.baidudu.com</p>
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 * @see javax.servlet.http.HttpServlet#doGet(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 * @author xianxian
	 * @date 2023年2月26日下午5:12:35
	 * @version 1.0
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DBUtils_pool dbUtils_pool = new DBUtils_pool();

		System.out.println("dbUtils_pool： " + dbUtils_pool.getConnection());
		
	}

}
