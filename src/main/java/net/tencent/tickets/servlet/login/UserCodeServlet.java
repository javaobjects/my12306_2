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

@WebServlet("/UserCodeServlet")
public class UserCodeServlet extends HttpServlet {

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
		String userCode = request.getParameter("code");// 用户输入的验证码
		// 服务端验证码
		String serverCode = (String) session.getAttribute("code");
		Map<String, Boolean> map = new HashMap<>();
		response.setContentType("application/json;charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		// ③ 验证码校验：用户输入验证码与服务器生成的验证码是否匹配
		if (userCode == null || !userCode.equalsIgnoreCase(serverCode)) {
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
