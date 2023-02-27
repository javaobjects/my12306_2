package net.tencent.tickets.dao.test;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.tencent.tickets.dao.factory.UserDaoFactory;
import net.tencent.tickets.dao.ifac.UserDaoIfac;

public class TestUserDao extends HttpServlet {

	/**
	 * serialVersionUID
	*/
	private static final long serialVersionUID = 1L;

	private UserDaoIfac userDao = new UserDaoFactory().getUserDaoInstance();
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		userDao.queryUsername(getServletInfo());
	}
}
