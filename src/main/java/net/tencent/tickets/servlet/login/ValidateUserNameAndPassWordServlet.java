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
import net.tencent.tickets.entity.Users;
import net.tencent.tickets.service.UserService;
import net.tencent.tickets.util.Md5Utils;

@WebServlet("/login/ValidateUserNameAndPassWordServlet")
public class ValidateUserNameAndPassWordServlet extends HttpServlet {

	/**
	 * serialVersionUID
	*/
	private static final long serialVersionUID = 1L;
	
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		// 1. 获取用户输入的用户名和密码
		String userName = request.getParameter("userName");
		String passWord = Md5Utils.md5(request.getParameter("passWord"));
		
		//2. 根据用户名和密码查询该用户是否存在
		Users user = UserService.getInstance().login(userName,passWord);
		
		Map<String, Boolean> map = new HashMap<>();
		response.setContentType("application/json;charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		//3. 将结果返回给前端 true 存在 false 不存在
		if(user == null) {
			map.put("result", false);
		}else {
			map.put("result", true);
		}

		JSONArray JsonArray = JSONArray.fromObject(map);
		writer.write(JsonArray.toString());
		writer.flush();
		writer.close();
		
	}

}
