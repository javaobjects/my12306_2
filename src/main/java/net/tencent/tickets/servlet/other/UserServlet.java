package net.tencent.tickets.servlet.other;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.tencent.tickets.entity.Users;
import net.tencent.tickets.util.Md5Utils;
import net.tencent.tickets.util.other.PageUti_newl;

/**
 * 用户管理模块-Servlet
 */
@WebServlet("/UserServlet/*")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getRequestURI();
		System.out.println("请求路径：" + url);///day06_my12306/UserServlet/updateUserPassword
		//修改用户密码
		if(url.endsWith("updateUserPassword"))
		{
			updateUserPassword(request, response);
		}
		//修改用户信息：旅客类型与备注
		else if(url.endsWith("updateUser"))
		{
			updateUser(request, response);
		}
		//查询用户信息
		else if(url.endsWith("selectUsers"))
		{
			selectUsers(request, response);
		}
		//批量删除用户信息
		else if(url.endsWith("deleteUsers"))
		{
			deleteUsers(request, response);
		}
	}
	/**
	 * 修改用户密码
	 */
	protected void updateUserPassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//处理post请求乱码
		//request.setCharacterEncoding("utf-8");
		//处理response响应乱码
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/plain;charset=utf-8");
		
		HttpSession session = request.getSession();
		
		//1.获取用户密码信息
		String oldPassword = Md5Utils.md5(request.getParameter("oldPassword"));
		String newPassword = Md5Utils.md5(request.getParameter("newPassword"));
		
		//2.将用户密码信息封装到User对象
		Users user = (Users)session.getAttribute("user");
		System.out.println("修改前：" + user);
		
		/**
		 * 服务器校验：
		 * 		① 判断旧密码是否正确
		 */
		if(!user.getUserPassword().equals(oldPassword))
		{
			PrintWriter writer = response.getWriter();
			writer.write("原密码不正确，请重新输入！！");
			writer.flush();
			writer.close();
			return;
		}
		
		//绑定新修改的用户信息
		user.setUserPassword(newPassword);
		System.out.println("修改后：" + user);
		
		//3.更新密码
//		IUserService userService = UserServiceImpl.getInstance();
//		boolean result = userService.updateUser(user);
		
		boolean result = false;
		
		//4.处理结果
		if(result)
		{
			//重新登陆，清空cookie等信息
			response.sendRedirect(request.getContextPath() + "/ExitServlet");
		}
		//修改失败
		else
		{
			PrintWriter writer = response.getWriter();
			writer.write("修改用户密码失败！！");
			writer.flush();
			writer.close();
		}
	}
	/**
	 * 修改用户信息：旅客类型与备注
	 */
	protected void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//处理post请求乱码
		request.setCharacterEncoding("utf-8");
		//处理response响应乱码
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/plain;charset=utf-8");
		
		HttpSession session = request.getSession();
		
		//1.获取修改的参数信息
		String passengerType = request.getParameter("passengerType");
		String content = request.getParameter("content");
		
		System.out.println(passengerType + " " + content);
		
		//2.将信息封装到User对象
		Users user = (Users)session.getAttribute("user");
		System.out.println("修改前：" + user);
		
		//绑定新修改的用户信息
//		user.setUserType(Integer.parseInt(passengerType));
		user.setUserType(null);
		user.setUserContent(content);
		System.out.println("修改后：" + user);
		
		//2.调用service方法完成修改
//		IUserService userService = UserServiceImpl.getInstance();
//		boolean result = userService.updateUser(user);
		
		
		boolean result = false;
		
		//3.处理结果
		if(result)
		{
			//重新更新session中的用户信息
			session.setAttribute("user", user);
			
			//跳转回首页
			response.sendRedirect(request.getContextPath() + "/User/Index.html");
		}
		//修改失败
		else
		{
			PrintWriter writer = response.getWriter();
			writer.write("修改用户信息失败！！");
			writer.flush();
			writer.close();
		}
	}
	/**
	 * 查询用户信息
	 */
	protected void selectUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//处理post请求乱码
		request.setCharacterEncoding("utf-8");
		//处理response响应乱码
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/plain;charset=utf-8");
		
		HttpSession session = request.getSession();
		
		//获取页码信息
		String pageNumber = request.getParameter("pageNumber");
		
		//第一次进来
		if(pageNumber == null || "".equals(pageNumber))
		{
			//1.获取查询的参数信息
			String realName = request.getParameter("realname");
			String sex = request.getParameter("sex");
			String certTypeID = request.getParameter("certType");
			String cert = request.getParameter("cert");
			String userTypeID = request.getParameter("userType");
			
			System.out.println(realName + " " + sex + "  " + certTypeID + "  " + cert + "  " + userTypeID);
			
			//2.将信息封装到User对象
			Users user = new Users();
//			user.setUserRealName(realName)
			user.setUserSex(sex.charAt(0));
//			user.setUserCertType(Integer.parseInt((certTypeID==null || certTypeID.length() ==0)?"0":certTypeID));
			user.setUserCert(cert);
//			user.setUserType(Integer.parseInt((userTypeID==null || userTypeID.length() ==0)?"0":userTypeID));
			
			//2.调用service方法完成查询
//			IUserService userService = UserServiceImpl.getInstance();
//			List<User> userList = userService.selectUsers(user);//所有用户信息---11条数据
			
			@SuppressWarnings("unchecked")
			List<Users> userList = (List<Users>) new Users();
			
			//2.1 分页
			PageUti_newl pu = new PageUti_newl(userList);
			System.out.println("第一次,分页信息：" + pu);
			
			//2.2 获取第一页分页的数据
			List<Users> subUserList = userList.subList(pu.getBeginIndex()-1, pu.getEndIndex());    //获取【第一页1-5】数据,不包括结束位置
			
			//3.将数据保存到作用域 
			session.setAttribute("userList", userList);//所有符合条件的用户信息
			session.setAttribute("subUserList", subUserList);//所有符合条件的用户中【第一页】信息
			session.setAttribute("pu", pu);//分页信息
			
			//保存查询的参数
			session.setAttribute("selectParams", user);
		}
		//下一次进来，即点击分页页码进入
		else
		{
			//1.获取保存在session中的所有用户信息
			List<Users> userList = (List<Users>)session.getAttribute("userList");//所有用户信息---11条数据
			
			//2.获取保存在session中的分页信息
			PageUti_newl pu = (PageUti_newl)session.getAttribute("pu");
			pu.setPageNum(Integer.parseInt(pageNumber));//设置页码
			
			System.out.println("点击分页页码,分页信息：" + pu);
			
			//3. 获取指定页码分页的数据
			List<Users> subUserList = userList.subList(pu.getBeginIndex()-1, pu.getEndIndex());    //获取【指定页码】数据,不包括结束位置

			//4.将数据保存到作用域 
			session.setAttribute("subUserList", subUserList);//所有符合条件的用户中【第一页】信息
			session.setAttribute("pu", pu);//分页信息
		}
		
		//4.跳转到页面UserManageQuery.jsp
		response.sendRedirect(request.getContextPath() + "/Admin/UserManageQuery.jsp");
		
	}
	/**
	 * 批量删除用户信息
	 */
	protected void deleteUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.获取待删除的用户的id信息
		String[] ids = request.getParameterValues("ids");
		System.out.println("待删除的id信息：" + Arrays.toString(ids));
		
		//String[] -> int[]
		int[] intIds = new int[ids.length];
		for (int i = 0; i < ids.length; i++) {
			intIds[i] = Integer.parseInt(ids[i]);
		}
		
		//2.调用service方法删除所有选中的用户
//		IUserService userService = UserServiceImpl.getInstance();
//		boolean result = userService.deleteUsersBatch(intIds);
		
		boolean result = false;
		
		
		//3.重新访问数据库数据
		//selectUsers(request, response);
		request.getRequestDispatcher("/UserServlet/selectUsers").forward(request, response);
	}

}
