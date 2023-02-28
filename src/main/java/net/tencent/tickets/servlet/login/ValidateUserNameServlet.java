package net.tencent.tickets.servlet.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.tencent.tickets.service.UserService;

/**
 * <p>Title: ValidateUserNameServlet</p>
 * <p>
 *    Description:验证用户名是滞存在
 * </p>
 * @author xianxian
 * @date 2023年2月28日下午2:25:55
 */
@WebServlet("/login/ValidateUserNameServlet")
public class ValidateUserNameServlet extends HttpServlet {

	/**
	 * serialVersionUID
	*/
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		// 1. 获取用户输入的用户名
		String userName = request.getParameter("userName");
		
		//2. 根据用户名查询该用户是否存在
		Boolean isExistsUserName = UserService.getInstance().isExistsUserName(userName);
		
		Map<String, Boolean> map = new HashMap<>();
		response.setContentType("application/json;charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		//3. 将结果返回给前端 true 存在 false 不存在
		map.put("result", isExistsUserName);

		JSONArray JsonArray = JSONArray.fromObject(map);
		writer.write(JsonArray.toString());
		writer.flush();
		writer.close();
	}
}
